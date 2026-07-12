function ssh_agent --description 'Auto-starts and manages the ssh-agent socket'
    # Fallback to ~/.ssh if XDG_RUNTIME_DIR is not set
    if test -z "$XDG_RUNTIME_DIR"
        set -gx SSH_AUTH_SOCK "$HOME/.ssh/ssh-agent.socket"
    else
        set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
    end

    # If the socket doesn't exist, spawn the real agent
    if not test -S $SSH_AUTH_SOCK
        # Ensure the directory exists (important for ~/.ssh)
        mkdir -p (dirname $SSH_AUTH_SOCK)
        eval (command ssh-agent -c -a $SSH_AUTH_SOCK >/dev/null)
    end
end
