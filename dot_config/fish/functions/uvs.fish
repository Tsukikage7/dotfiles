function uvs --description "Activate Python virtual environment"
    if test -f venv/bin/activate.fish
        source venv/bin/activate.fish
    else if test -f venv/bin/activate
        # Fall back to bash-style activation if fish version doesn't exist
        source venv/bin/activate
    else
        echo "No virtual environment found in current directory"
        return 1
    end
end