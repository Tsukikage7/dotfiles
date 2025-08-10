# Fish Plugin Configuration
# Equivalent to zsh plugins from original config

# Fish plugin equivalents to install with fisher:
# fisher install jorgebucaran/fisher                    # Plugin manager
# fisher install franciscolourenco/done                # Desktop notifications for long running processes
# fisher install PatrickF1/fzf.fish                    # fzf integration
# fisher install jethrokuan/z                          # Directory jumping (zoxide alternative)
# fisher install jorgebucaran/autopair.fish            # Auto-close brackets and quotes
# fisher install gazorby/fish-abbreviation-tips        # Show available abbreviations
# fisher install meaningful-ooo/sponge                 # Clean command history from typos automatically

# Git aliases and functions are built-in to fish or can be added as abbreviations
# Docker completions are built-in to fish
# Kubectl completions are built-in to fish
# Sudo functionality can be replicated with custom key binding

# Auto-completion setup
if status is-interactive
    # Enable completions
    if not functions -q fisher
        echo "Consider installing fisher plugin manager:"
        echo "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
    end
end