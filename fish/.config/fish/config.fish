# Fish Shell Configuration

# Initialize system PATH
set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin /usr/local/bin /usr/bin /bin /usr/sbin /sbin $PATH

# Initialize starship prompt with custom config
set -gx STARSHIP_CONFIG ~/dotfiles/starship/.config/starship.toml
if command -v starship >/dev/null 2>&1
    source (/opt/homebrew/bin/starship init fish --print-full-init | psub)
end

# Language environment
set -gx LANG en_US.UTF-8

# Preferred editor
set -gx EDITOR nvim

# ===============================
# =========== Aliases ===========
# ===============================
# 所有命令别名都使用传统 alias 形式
# 配置文件位于: conf.d/aliases.fish 和 conf.d/git_aliases.fish
# 使用 'alias' 命令查看所有可用的别名

# ================================
# ===== Environment Variables ===
# ================================

# Google Cloud
set -gx GOOGLE_CLOUD_PROJECT chongyan

# Simple Admin
set -gx SIMPLE_LANG zh

# Nexttrace
set -gx NEXTTRACE_POWPROVIDER sakura

# Java Environment
set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
set -gx CLASS_PATH $JAVA_HOME/lib
set -gx PATH $JAVA_HOME/bin $PATH

# Maven Environment
set -gx MAVEN_HOME $HOME/env/maven
set -gx PATH $MAVEN_HOME/bin $PATH

# Go Environment
set -gx GOROOT $HOME/env/go/root
set -gx GOPATH $HOME/env/go
set -gx GO111MODULE on
set -gx GOPROXY "https://goproxy.cn,direct"
set -gx GOPRIVATE "*.ucloudadmin.com"
set -gx GONOPROXY "*.ucloudadmin.com"
set -gx GONOSUMDB "*.ucloudadmin.com"
set -gx PATH $GOROOT/bin $GOPATH/bin $PATH

# Rust Environment
set -gx CARGO_HOME $HOME/.cargo
set -gx RUSTUP_DIST_SERVER "https://rsproxy.cn"
set -gx RUSTUP_UPDATE_ROOT "https://rsproxy.cn/rustup"
set -gx PATH $CARGO_HOME/bin $PATH

# =========================================================
# 🟢 Node Environment | Node 环境配置
# =========================================================

# Node binary path (installed via Homebrew)
# Node 可执行文件路径（通过 Homebrew 安装）
set -gx PATH /opt/homebrew/opt/node@22/bin $PATH

# Node library and include paths for compilation
# Node 库与头文件路径，用于编译原生模块
set -gx LDFLAGS "-L/opt/homebrew/opt/node@22/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/node@22/include"

# =========================================================
# 🟣 NVM Environment | NVM 环境配置
# =========================================================

# Path to NVM directory (for Node Version Manager)
# NVM 目录路径（Node 版本管理器）
set -gx NVM_DIR $HOME/.nvm

# =========================================================
# 🟠 Global npm & pnpm Environment | 全局 npm 与 pnpm 环境配置
# =========================================================

# Define global package root
# 定义全局包存放根目录
set -gx NODE_GLOBAL_DIR "$HOME/env/node_modules"

# Define global binary directory
# 定义全局可执行文件目录
set -gx NODE_BIN_DIR "$NODE_GLOBAL_DIR/bin"

# Add global bin path to PATH if not already present
# 若 PATH 中尚未包含全局可执行路径，则添加
if not string match -q "*$NODE_BIN_DIR*" $PATH
    set -gx PATH $NODE_BIN_DIR $PATH
end

# =========================================================
# npm Configuration | npm 配置
# =========================================================

# npm global installation prefix
# npm 全局安装路径
set -gx npm_config_prefix "$NODE_GLOBAL_DIR"

# npm cache directory
# npm 缓存目录
set -gx npm_config_cache "$NODE_GLOBAL_DIR/cache"

# npm registry mirror (可选：使用国内镜像)
# npm 镜像源（可选：国内加速）
set -gx npm_config_registry "https://registry.npmmirror.com/"

# =========================================================
# pnpm Configuration | pnpm 配置
# =========================================================

# Global installation directory for pnpm
# pnpm 全局安装路径
set -gx PNPM_HOME "$NODE_GLOBAL_DIR"

# pnpm store (used to deduplicate packages)
# pnpm 仓库目录
set -gx PNPM_STORE_DIR "$NODE_GLOBAL_DIR/pnpm-store"

# pnpm cache directory
# pnpm 缓存目录
set -gx PNPM_CACHE_DIR "$NODE_GLOBAL_DIR/pnpm-cache"

# pnpm registry mirror (可选：使用国内镜像)
# pnpm 镜像源（可选：国内加速）
set -gx PNPM_REGISTRY "https://registry.npmjs.org/"


# ToolBox Environment
set -gx TOOLBOX_HOME $HOME/tools/toolbox
set -gx PATH $TOOLBOX_HOME $PATH

# Scala Environment
set -gx SCALA_HOME $HOME/env/scala
set -gx PATH $SCALA_HOME/bin $PATH

# Windsurf/Codeium
set -gx PATH /Users/chongyan/.codeium/windsurf/bin $PATH

# =========================================================
# Kitty Shell Integration | Kitty Shell 集成
# =========================================================
# 完全由 kitty.conf 的 shell_integration enabled 自动处理
# 不要在这里手动加载或设置变量，会导致冲突

# Kiro shell integration
if test "$TERM_PROGRAM" = "kiro"
    source (kiro --locate-shell-integration-path fish)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# =========================================================
# Kitty Shell Integration | Kitty Shell 集成
# =========================================================
# Kitty 通过 shell_integration enabled 自动注入
# 不要在这里手动加载，会导致重复加载问题
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# =========================================================
# 数据库客户端编码配置（修复中文乱码）
# =========================================================
set -gx PGCLIENTENCODING UTF8
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
