# Fish Shell Configuration
# Migrated from zsh configuration

# Initialize starship prompt with custom config
set -gx STARSHIP_CONFIG /Users/tsukikage/dotfiles/starship/starship.toml
if command -v starship >/dev/null 2>&1
    source (/opt/homebrew/bin/starship init fish --print-full-init | psub)
end

# Language environment
set -gx LANG en_US.UTF-8

# Preferred editor
set -gx EDITOR nvim

# ===============================
# ========= Abbreviations =======
# ===============================
# 所有命令别名都使用 abbreviations 形式
# 配置文件位于: conf.d/abbreviations.fish
# 使用 'als' 命令查看所有可用的缩写

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
set -gx GOROOT /usr/local/go
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

# Node Environment
set -gx PATH /opt/homebrew/opt/node@22/bin $PATH
set -gx LDFLAGS "-L/opt/homebrew/opt/node@22/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/node@22/include"

# NVM Environment
set -gx NVM_DIR $HOME/.nvm

# ToolBox Environment
set -gx TOOLBOX_HOME $HOME/tools/toolbox
set -gx PATH $TOOLBOX_HOME $PATH

# Scala Environment
set -gx SCALA_HOME $HOME/env/scala
set -gx PATH $SCALA_HOME/bin $PATH

# Windsurf/Codeium
set -gx PATH /Users/chongyan/.codeium/windsurf/bin $PATH

# Kiro shell integration
if test "$TERM_PROGRAM" = "kiro"
    source (kiro --locate-shell-integration-path fish)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
