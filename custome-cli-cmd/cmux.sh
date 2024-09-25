#!/bin/bash

# List of pre-set session names
SESSIONS=(  
    "main"
    "cwm"
    "python-with-me" 
    "cpp-with-me"
    "web-with-me"
)

# Function to start a tmux session based on the given session name
start_session() {
    local session_name="$1"
    
    case "$session_name" in
        "main")
            tmux new-session -s "$session_name" -n "Term" \; new-window -n "Tensura" \; select-window -t 1
            ;;
        "cwm" | "python-with-me" | "cpp-with-me" | "web-with-me")
            tmux new-session -s "$session_name" -n "Nvim" \; new-window -n "Term"\; select-window -t 1
            ;;
        *)
            echo "Unknown session: $session_name"
            ;;
    esac
}

# Function for tab-completion
_cmux() {
    COMPREPLY=()
    local cur="${COMP_WORDS[COMP_CWORD]}"
    local prev="${COMP_WORDS[COMP_CWORD-1]}"

    # If the previous word is 'cmux', provide session names for completion
    if [ "$prev" == "cmux" ]; then
        COMPREPLY=($(compgen -W "${SESSIONS[*]}" -- "$cur"))
        return 0
    fi
}

# Register the completion function for cmux
complete -F _cmux cmux

# Main function to handle cmux command
cmux() {
    local session_name="$1"

    # If no session name provided, display a list of available sessions
    if [ -z "$session_name" ]; then
        echo "Available sessions: ${SESSIONS[@]}"
        return 1
    fi

    # Check if the provided session name is valid
    if [[ " ${SESSIONS[@]} " =~ " $session_name " ]]; then
        start_session "$session_name"
    else
        echo "Invalid session name. Available sessions: ${SESSIONS[@]}"
    fi
}

# Uncomment the following line if you want to start a default session when 'cmux' is called without arguments
# cmux "Main"

