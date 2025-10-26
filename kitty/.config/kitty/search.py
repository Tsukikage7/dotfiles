"""
Kitty Kitten: Enhanced Search
增强搜索插件

功能：在终端中实时搜索文本，支持正则表达式和智能高亮
Features:
- 实时搜索高亮 | Real-time search highlighting
- 双模式：文本/正则 | Dual mode: text/regex
- Vim 风格快捷键 | Vim-style keybindings
- 历史记忆 | Search history persistence
- 智能导航 | Smart navigation between matches

快捷键 | Keybindings:
- Tab: 切换文本/正则模式 | Switch text/regex mode
- Up/Down: 跳转到上一个/下一个匹配 | Jump to prev/next match
- Ctrl+U: 清空输入 | Clear input
- Ctrl+A/E: 跳转行首/行尾 | Jump to line start/end
- Enter: 确认 | Confirm
- Esc: 取消 | Cancel
"""

import json
import re
import subprocess
from gettext import gettext as _
from pathlib import Path
from subprocess import PIPE, run

from kittens.tui.handler import Handler
from kittens.tui.line_edit import LineEdit
from kittens.tui.loop import Loop
from kittens.tui.operations import (
    clear_screen,
    cursor,
    set_line_wrapping,
    set_window_title,
    styled,
)
from kitty.config import cached_values_for
from kitty.key_encoding import EventType
from kitty.typing import KeyEventType, ScreenSize

# ============================================
# 正则表达式模式定义 | Regex Pattern Definitions
# ============================================

# 非空白字符模式（用于单词跳转）
# Non-space pattern (for word jumping)
NON_SPACE_PATTERN = re.compile(r"\S+")

# 空白字符模式
# Space pattern
SPACE_PATTERN = re.compile(r"\s+")

# 行尾空白模式
# Trailing space pattern
SPACE_PATTERN_END = re.compile(r"\s+$")

# 行首空白模式
# Leading space pattern
SPACE_PATTERN_START = re.compile(r"^\s+")

# 非字母数字模式（用于按单词删除）
# Non-alphanumeric pattern (for word deletion)
NON_ALPHANUM_PATTERN = re.compile(r"[^\w\d]+")

# 行尾非字母数字模式
# Trailing non-alphanumeric pattern
NON_ALPHANUM_PATTERN_END = re.compile(r"[^\w\d]+$")

# 行首非字母数字模式
# Leading non-alphanumeric pattern
NON_ALPHANUM_PATTERN_START = re.compile(r"^[^\w\d]+")

# 字母数字模式
# Alphanumeric pattern
ALPHANUM_PATTERN = re.compile(r"[\w\d]+")


def call_remote_control(args: list[str]) -> None:
    """
    调用 Kitty 远程控制 API
    Call Kitty remote control API

    参数 | Args:
        args: 远程控制命令参数 | Remote control command arguments
    """
    subprocess.run(["kitty", "@", *args], capture_output=True)


def reindex(
    text: str, pattern: re.Pattern[str], right: bool = False
) -> tuple[int, int]:
    """
    在文本中查找正则模式的位置
    Find regex pattern position in text

    参数 | Args:
        text: 要搜索的文本 | Text to search
        pattern: 正则表达式模式 | Regex pattern
        right: 是否从右侧搜索 | Search from right

    返回 | Returns:
        匹配的起始和结束位置 | Match start and end positions
    """
    if not right:
        # 从左侧搜索
        # Search from left
        m = pattern.search(text)
    else:
        # 从右侧搜索（找到所有匹配，取最后一个）
        # Search from right (find all matches, take last one)
        matches = [x for x in pattern.finditer(text) if x]
        if not matches:
            raise ValueError
        m = matches[-1]

    if not m:
        raise ValueError

    return m.span()


# 滚动标记插件的路径
# Path to scroll mark kitten
SCROLLMARK_FILE = Path(__file__).parent.absolute() / "scroll_mark.py"


class Search(Handler):
    """
    搜索处理器类（继承自 Kitty TUI Handler）
    Search handler class (inherits from Kitty TUI Handler)

    功能 | Features:
    - 管理搜索状态和用户输入 | Manage search state and user input
    - 处理键盘事件 | Handle keyboard events
    - 实时高亮匹配文本 | Real-time match highlighting
    - 支持模式切换 | Support mode switching
    """

    def __init__(
        self, cached_values: dict[str, str], window_ids: list[int], error: str = ""
    ) -> None:
        """
        初始化搜索处理器
        Initialize search handler

        参数 | Args:
            cached_values: 缓存的值（搜索历史、模式等）| Cached values (history, mode, etc.)
            window_ids: 要搜索的窗口 ID 列表 | List of window IDs to search
            error: 错误信息 | Error message
        """
        self.cached_values = cached_values
        self.window_ids = window_ids
        self.error = error

        # 创建行编辑器（处理用户输入）
        # Create line editor (handles user input)
        self.line_edit = LineEdit()

        # 恢复上次搜索内容
        # Restore last search content
        last_search = cached_values.get("last_search", "")
        self.line_edit.add_text(last_search)
        self.text_marked = bool(last_search)

        # 恢复搜索模式（text 或 regex）
        # Restore search mode (text or regex)
        self.mode = cached_values.get("mode", "text")

        self.update_prompt()
        self.mark()

    def update_prompt(self) -> None:
        """
        更新提示符（根据当前模式）
        Update prompt (based on current mode)

        "~> " = 正则模式 | Regex mode
        "=> " = 文本模式 | Text mode
        """
        self.prompt = "~> " if self.mode == "regex" else "=> "

    def init_terminal_state(self) -> None:
        """
        初始化终端状态
        Initialize terminal state
        """
        # 禁用自动换行
        # Disable line wrapping
        self.write(set_line_wrapping(False))

        # 设置窗口标题
        # Set window title
        self.write(set_window_title(_("Search")))

    def initialize(self) -> None:
        """
        初始化 UI
        Initialize UI
        """
        self.init_terminal_state()
        self.draw_screen()

    def draw_screen(self) -> None:
        """
        绘制屏幕（显示搜索输入框和错误信息）
        Draw screen (show search input and error message)
        """
        # 清空屏幕
        # Clear screen
        self.write(clear_screen())

        if self.window_ids:
            input_text = self.line_edit.current_input

            # 如果有历史搜索内容，反色显示
            # If there's historical search, show in reverse
            if self.text_marked:
                self.line_edit.current_input = styled(input_text, reverse=True)

            # 写入提示符和输入内容
            # Write prompt and input
            self.line_edit.write(self.write, self.prompt)
            self.line_edit.current_input = input_text

        # 显示错误信息（如果有）
        # Show error message (if any)
        if self.error:
            with cursor(self.write):
                self.print("")
                for l in self.error.split("\n"):
                    self.print(l)

    def refresh(self) -> None:
        """
        刷新显示（重绘屏幕并更新标记）
        Refresh display (redraw screen and update marks)
        """
        self.draw_screen()
        self.mark()

    def switch_mode(self) -> None:
        """
        切换搜索模式（文本 ↔ 正则表达式）
        Switch search mode (text ↔ regex)
        """
        if self.mode == "regex":
            self.mode = "text"
        else:
            self.mode = "regex"

        # 保存模式到缓存
        # Save mode to cache
        self.cached_values["mode"] = self.mode
        self.update_prompt()

    def on_text(self, text: str, in_bracketed_paste: bool = False) -> None:
        """
        处理文本输入事件
        Handle text input event

        参数 | Args:
            text: 输入的文本 | Input text
            in_bracketed_paste: 是否在粘贴模式 | Whether in paste mode
        """
        # 如果之前有标记的文本，清空后重新输入
        # If there was marked text, clear and input again
        if self.text_marked:
            self.text_marked = False
            self.line_edit.clear()

        self.line_edit.on_text(text, in_bracketed_paste)
        self.refresh()

    def on_key(self, key_event: KeyEventType) -> None:
        """
        处理键盘事件（核心功能）
        Handle keyboard events (core functionality)

        支持的快捷键 | Supported keybindings:
        - Ctrl+U: 清空输入 | Clear input
        - Ctrl+A: 跳转行首 | Jump to start
        - Ctrl+E: 跳转行尾 | Jump to end
        - Ctrl+W: 删除前一个单词 | Delete previous word
        - Ctrl+←/→: 按单词移动 | Move by word
        - Alt+←/→: 按字母数字单元移动 | Move by alphanumeric unit
        - Tab: 切换模式 | Switch mode
        - ↑/↓: 跳转匹配 | Jump between matches
        - Enter: 确认 | Confirm
        - Esc: 取消 | Cancel
        """
        # 如果有标记的文本且按下非修饰键，取消标记
        # If text is marked and non-modifier key pressed, unmark
        if (
            self.text_marked
            and key_event.type == EventType.PRESS
            and key_event.key
            not in [
                "TAB",
                "LEFT_CONTROL",
                "RIGHT_CONTROL",
                "LEFT_ALT",
                "RIGHT_ALT",
                "LEFT_SHIFT",
                "RIGHT_SHIFT",
                "LEFT_SUPER",
                "RIGHT_SUPER",
            ]
        ):
            self.text_marked = False
            self.refresh()

        # 让行编辑器处理基础按键（左右箭头、退格等）
        # Let line editor handle basic keys (arrows, backspace, etc.)
        if self.line_edit.on_key(key_event):
            self.refresh()
            return

        # ==================== Vim 风格编辑快捷键 ====================
        # ==================== Vim-style Edit Shortcuts ====================

        if key_event.matches("ctrl+u"):
            # Ctrl+U: 清空整行
            # Ctrl+U: Clear entire line
            self.line_edit.clear()
            self.refresh()

        elif key_event.matches("ctrl+a"):
            # Ctrl+A: 跳转到行首
            # Ctrl+A: Jump to line start
            self.line_edit.home()
            self.refresh()

        elif key_event.matches("ctrl+e"):
            # Ctrl+E: 跳转到行尾
            # Ctrl+E: Jump to line end
            self.line_edit.end()
            self.refresh()

        # ==================== 单词级删除和移动 ====================
        # ==================== Word-level Deletion & Movement ====================

        elif key_event.matches("ctrl+backspace") or key_event.matches("ctrl+w"):
            # Ctrl+W: 删除光标前的一个单词（按空格分隔）
            # Ctrl+W: Delete word before cursor (space-separated)
            before, _ = self.line_edit.split_at_cursor()

            try:
                start, _ = reindex(before, SPACE_PATTERN_END, right=True)
            except ValueError:
                start = -1

            try:
                space = before[:start].rindex(" ")
            except ValueError:
                space = 0
            self.line_edit.backspace(len(before) - space)
            self.refresh()

        elif key_event.matches("ctrl+left") or key_event.matches("ctrl+b"):
            # Ctrl+←: 向左移动一个单词
            # Ctrl+←: Move left by word
            before, _ = self.line_edit.split_at_cursor()
            try:
                start, _ = reindex(before, SPACE_PATTERN_END, right=True)
            except ValueError:
                start = -1

            try:
                space = before[:start].rindex(" ")
            except ValueError:
                space = 0
            self.line_edit.left(len(before) - space)
            self.refresh()

        elif key_event.matches("ctrl+right") or key_event.matches("ctrl+f"):
            # Ctrl+→: 向右移动一个单词
            # Ctrl+→: Move right by word
            _, after = self.line_edit.split_at_cursor()
            try:
                _, end = reindex(after, SPACE_PATTERN_START)
            except ValueError:
                end = 0

            try:
                space = after[end:].index(" ") + 1
            except ValueError:
                space = len(after)
            self.line_edit.right(space)
            self.refresh()

        # ==================== 字母数字单元删除和移动 ====================
        # ==================== Alphanumeric Unit Deletion & Movement ====================

        elif key_event.matches("alt+backspace") or key_event.matches("alt+w"):
            # Alt+Backspace: 删除前一个字母数字单元
            # Alt+Backspace: Delete previous alphanumeric unit
            before, _ = self.line_edit.split_at_cursor()

            try:
                start, _ = reindex(before, NON_ALPHANUM_PATTERN_END, right=True)
            except ValueError:
                start = -1
            else:
                self.line_edit.backspace(len(before) - start)
                self.refresh()
                return

            try:
                start, _ = reindex(before, NON_ALPHANUM_PATTERN, right=True)
            except ValueError:
                self.line_edit.backspace(len(before))
                self.refresh()
                return

            self.line_edit.backspace(len(before) - (start + 1))
            self.refresh()

        elif key_event.matches("alt+left") or key_event.matches("alt+b"):
            # Alt+←: 向左移动一个字母数字单元
            # Alt+←: Move left by alphanumeric unit
            before, _ = self.line_edit.split_at_cursor()

            try:
                start, _ = reindex(before, NON_ALPHANUM_PATTERN_END, right=True)
            except ValueError:
                start = -1
            else:
                self.line_edit.left(len(before) - start)
                self.refresh()
                return

            try:
                start, _ = reindex(before, NON_ALPHANUM_PATTERN, right=True)
            except ValueError:
                self.line_edit.left(len(before))
                self.refresh()
                return

            self.line_edit.left(len(before) - (start + 1))
            self.refresh()

        elif key_event.matches("alt+right") or key_event.matches("alt+f"):
            # Alt+→: 向右移动一个字母数字单元
            # Alt+→: Move right by alphanumeric unit
            _, after = self.line_edit.split_at_cursor()

            try:
                _, end = reindex(after, NON_ALPHANUM_PATTERN_START)
            except ValueError:
                end = 0
            else:
                self.line_edit.right(end)
                self.refresh()
                return

            try:
                _, end = reindex(after, NON_ALPHANUM_PATTERN)
            except ValueError:
                self.line_edit.right(len(after))
                self.refresh()
                return

            self.line_edit.right(end - 1)
            self.refresh()

        # ==================== 功能键 ====================
        # ==================== Function Keys ====================

        elif key_event.matches("tab"):
            # Tab: 切换文本/正则模式
            # Tab: Switch text/regex mode
            self.switch_mode()
            self.refresh()

        elif key_event.matches("up"):
            # ↑: 跳转到上一个匹配
            # ↑: Jump to previous match
            for match_arg in self.match_args():
                call_remote_control(["kitten", match_arg, str(SCROLLMARK_FILE)])

        elif key_event.matches("down"):
            # ↓: 跳转到下一个匹配
            # ↓: Jump to next match
            for match_arg in self.match_args():
                call_remote_control(["kitten", match_arg, str(SCROLLMARK_FILE), "next"])

        elif key_event.matches("enter"):
            # Enter: 确认并退出
            # Enter: Confirm and exit
            self.quit(0)

        elif key_event.matches("esc"):
            # Esc: 取消并退出
            # Esc: Cancel and exit
            self.quit(1)

    def on_interrupt(self) -> None:
        """
        处理中断信号（Ctrl+C）
        Handle interrupt signal (Ctrl+C)
        """
        self.quit(1)

    def on_eot(self) -> None:
        """
        处理 EOT 信号（Ctrl+D）
        Handle EOT signal (Ctrl+D)
        """
        self.quit(1)

    def on_resize(self, screen_size: ScreenSize) -> None:
        """
        处理窗口大小变化
        Handle window resize
        """
        self.refresh()

    def match_args(self) -> list[str]:
        """
        生成窗口匹配参数（用于远程控制）
        Generate window match arguments (for remote control)

        返回 | Returns:
            窗口 ID 匹配参数列表 | List of window ID match arguments
        """
        return [f"--match=id:{window_id}" for window_id in self.window_ids]

    def mark(self) -> None:
        """
        标记匹配的文本（实时高亮）
        Mark matching text (real-time highlighting)
        """
        if not self.window_ids:
            return

        text = self.line_edit.current_input

        if text:
            # 根据输入判断是否大小写敏感
            # Determine case sensitivity based on input
            match_case = "i" if text.islower() else ""
            match_type = match_case + self.mode

            # 为每个窗口创建标记
            # Create markers for each window
            for match_arg in self.match_args():
                try:
                    call_remote_control(
                        ["create-marker", match_arg, match_type, "1", text]
                    )
                except SystemExit:
                    self.remove_mark()
        else:
            # 如果输入为空，移除所有标记
            # If input is empty, remove all markers
            self.remove_mark()

    def remove_mark(self) -> None:
        """
        移除所有标记
        Remove all markers
        """
        for match_arg in self.match_args():
            call_remote_control(["remove-marker", match_arg])

    def quit(self, return_code: int) -> None:
        """
        退出搜索界面
        Quit search interface

        参数 | Args:
            return_code: 返回代码（0=成功，1=取消）| Return code (0=success, 1=cancel)
        """
        # 保存当前搜索内容到历史
        # Save current search to history
        self.cached_values["last_search"] = self.line_edit.current_input

        # 移除所有标记
        # Remove all markers
        self.remove_mark()

        # 如果取消，滚动到末尾
        # If cancelled, scroll to end
        if return_code:
            for match_arg in self.match_args():
                call_remote_control(["scroll-window", match_arg, "end"])

        # 退出事件循环
        # Exit event loop
        self.quit_loop(return_code)


def main(args: list[str]) -> None:
    """
    主函数（kitten 入口点）
    Main function (kitten entry point)

    功能 | Features:
    - 解析命令行参数 | Parse command-line arguments
    - 创建搜索 UI | Create search UI
    - 启动事件循环 | Start event loop

    参数 | Args:
        args: 命令行参数（窗口 ID 等）| Command-line arguments (window ID, etc.)
    """
    # 调整窗口大小（为搜索界面腾出空间）
    # Resize window (make room for search interface)
    call_remote_control(
        ["resize-window", "--self", "--axis=vertical", "--increment", "-100"]
    )

    error = ""

    # 验证窗口 ID 参数
    # Validate window ID argument
    if len(args) < 2 or not args[1].isdigit():
        error = "Error: Window id must be provided as the first argument."

    window_id = int(args[1])
    window_ids = [window_id]

    # 如果指定 --all-windows，搜索当前标签页的所有窗口
    # If --all-windows specified, search all windows in current tab
    if len(args) > 2 and args[2] == "--all-windows":
        # 获取所有窗口信息
        # Get all window info
        ls_output = run(["kitty", "@", "ls"], stdout=PIPE)
        ls_json = json.loads(ls_output.stdout.decode())
        current_tab = None

        # 查找当前窗口所在的标签页
        # Find the tab containing current window
        for os_window in ls_json:
            for tab in os_window["tabs"]:
                for kitty_window in tab["windows"]:
                    if kitty_window["id"] == window_id:
                        current_tab = tab

        # 收集同一标签页内的所有窗口 ID（除了当前窗口）
        # Collect all window IDs in the same tab (except current)
        if current_tab:
            window_ids = [
                w["id"] for w in current_tab["windows"] if not w["is_focused"]
            ]
        else:
            error = "Error: Could not find the window id provided."

    # 启动 TUI 事件循环
    # Start TUI event loop
    loop = Loop()
    with cached_values_for("search") as cached_values:
        handler = Search(cached_values, window_ids, error)
        loop.loop(handler)
