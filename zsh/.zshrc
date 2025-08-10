# starship config
eval "$(starship init zsh)"

export ZSH_DIR="$HOME/.zsh"
export ZSH_PLUGINS_DIR="$HOME/.zsh/plugins"
export ZSH_CACHE_DIR="$HOME/.zsh/cache"

# zsh plugin       
ZSH_PLUGINS=(
  zsh-autosuggestions 
  zsh-syntax-highlighting
  aliases
  uv
  docker
  git
  kubectl
  sudo
  # zsh-interactive-cd
  )


# zoxide config
# eval "$(zoxide init zsh)"
# eval "$(zoxide init zsh --cmd z)"
# eval "$(zoxide init zsh --cmd cd)"

# User configuration
# You may need to manually set your language environment
export LANG=en_US.UTF-8
export ZSH_DISABLE_COMPFIX="true"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# ===========================
# ========== Alias ==========
# ===========================
alias x="xc"

# Alias for kitty
alias diff="kitty +kitten diff"
alias icat="kitty +kitten icat"
#alias ssh="kitty +kitten ssh"

# Alias for vim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# rsyncy
alias rsync="rsyncy"

# Alias for tmux
alias update_tmux="tmux source ~/.tmux.conf"

# Python
alias pfr='pip freeze > requirements.txt'
alias pir='pip install -r  requirements.txt'
alias prm='pip list --format=freeze | xargs pip uninstall -y'
alias uvs="source venv/bin/activate" 
alias upir="uv pip install -r requirements.txt"
alias upfr="uv pip freeze > requirements.txt"

# Alias for ls replacement: eza
alias ll="ls -al"
alias ls="eza --icons"
alias ll="eza --icons --long --header"
alias la="eza --icons --long --header --all"
alias lg="eza --icons --long --header --all --git"
alias tree="eza --tree --icons"


# Alias for cat replacement: bat
# export BAT_THEME="Catppuccin Frappe"
# export BAT_CONFIG_PATH="${XDG_CONFIG_HOME:-~/.config}/bat.conf"
#alias cat="bat"

# Alias for du replacement: dust
alias du="dust"

# Alias for df replacement: duf
alias df="duf"

# Alias for top replacement: btm
alias top="btm"

# Alias for pt replacement: nexttrace
alias pt="nexttrace"

# =========================================
# ================ Config  ================
# =========================================

# =========================================
# ========== Envirment Variables ==========
# =========================================

# google
export GOOGLE_CLOUD_PROJECT=chongyan

# SIMPALE_ADMIN
export SIMPLE_LANG=zh

# X CMD
# [ ! -f "$HOME/.x-cmd.root/X" ] || . "$HOME/.x-cmd.root/X" # boot up x-cmd.
xc() {
  . "$HOME/.x-cmd.root/X"
  ___x_cmd "$@"
}

export NEXTTRACE_POWPROVIDER=sakura


# Java Environment Variable
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export CLASS_PATH=$JAVA_HOME/lib
export PATH="$JAVA_HOME/bin:$PATH"

# Maven Environment Variable
export MAVEN_HOME=$HOME/env/maven
export PATH="$MAVEN_HOME/bin:$PATH"

# Go Environment Variable
export GOROOT=/usr/local/go
# export GOROOT=~/sdk/go1.18
export GOPATH=$HOME/env/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
export GO111MODULE=on
export GOPROXY="https://goproxy.cn,direct"
export GOPRIVATE="*.ucloudadmin.com"
export GONOPROXY="*.ucloudadmin.com"
export GONOSUMDB="*.ucloudadmin.com"

# Rust Environment Variable
export CARGO_HOME=$HOME/.cargo
export PATH="$CARGO_HOME/bin:$PATH"
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

# Node Environment Variable
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/node@22/lib"
export CPPFLAGS="-I/opt/homebrew/opt/node@22/include"

# NVM Environment Variable
export NVM_DIR="$HOME/.nvm"
function load_nvm() {
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
}
nvm() {
  . "$NVM_DIR/nvm.sh"
  nvm $@
}


# ToolBox Environment Variable
export TOOLBOX_HOME=$HOME/tools/toolbox
export PATH="$TOOLBOX_HOME:$PATH"

# Scala Environment Variable
export SCALA_HOME=$HOME/env/scala
export PATH=$SCALA_HOME/bin:$PATH

# Added by Windsurf
export PATH="/Users/chongyan/.codeium/windsurf/bin:$PATH"



autoload -Uz compinit && compinit
for plugin in "${ZSH_PLUGINS[@]}"; do
  if [ -f "$ZSH_PLUGINS_DIR/$plugin/$plugin.plugin.zsh" ]; then
    source "$ZSH_PLUGINS_DIR/$plugin/$plugin.plugin.zsh"
  elif [ -f "$ZSH_PLUGINS_DIR/$plugin/$plugin.zsh" ]; then
    source "$ZSH_PLUGINS_DIR/$plugin/$plugin.zsh"
  elif [ -f "$ZSH_PLUGINS_DIR/$plugin.zsh" ]; then
    source "$ZSH_PLUGINS_DIR/$plugin.zsh"
  fi
done
# Added by Windsurf
export PATH="/Users/chongyan/.codeium/windsurf/bin:$PATH"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
