# Sudo key binding for Fish Shell
# Press Alt+S to prepend 'sudo ' to current command line

function sudo_command_line
    set -l cmd (commandline)
    if test -z "$cmd"
        commandline -r "sudo "
    else if string match -q "sudo *" "$cmd"
        commandline -r (string replace "sudo " "" "$cmd")
    else
        commandline -r "sudo $cmd"
    end
end

if status is-interactive
    bind \es sudo_command_line  # Alt+S
end