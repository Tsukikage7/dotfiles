function load_nvm --description "Load NVM environment"
    if test -s "/opt/homebrew/opt/nvm/nvm.sh"
        source "/opt/homebrew/opt/nvm/nvm.sh"
    end
    if test -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
        source "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
    end
end