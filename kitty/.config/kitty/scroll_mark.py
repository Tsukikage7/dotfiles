"""
Kitty Kitten: Scroll Mark
滚动标记插件

[功能] 在终端滚动历史中的标记位置之间跳转
[使用场景] 配合搜索功能，快速跳转到匹配结果
"""

from kittens.tui.handler import result_handler
from kitty.boss import Boss


def main(args: list[str]) -> None:
    """[主函数] kitten 加载时调用"""
    pass


@result_handler(no_ui=True)
def handle_result(
    args: list[str], answer: str, target_window_id: int, boss: Boss
) -> None:
    """[结果处理器] kitten 执行完毕后调用"""
    # [获取目标窗口]
    w = boss.window_id_map.get(target_window_id)

    if w is not None:
        # [判断滚动方向] 前一个或下一个标记
        if len(args) > 1 and args[1] != "prev":
            # [滚动到下一个标记]
            w.scroll_to_mark(prev=False)
        else:
            # [滚动到上一个标记] 默认行为
            w.scroll_to_mark()
