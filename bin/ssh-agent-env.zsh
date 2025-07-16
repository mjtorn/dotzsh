#!/usr/bin/env zsh

SSH_ENV="$HOME/.cache/ssh-agent.env"

# Start ssh-agent if not already running
test -f ${SSH_ENV} && {
    source ${SSH_ENV} > /dev/null

    if ! kill -0 ${SSH_AGENT_PID} 2>/dev/null; then
        echo -n "ssh-agent ${SSH_AGENT_PID} killed in the line of duty, "

        rm -fv ${SSH_ENV}
    # else
        # echo "Agent ${SSH_AGENT_PID} active "
    fi
}

test ! -f ${SSH_ENV} && {
    echo -n "Deploying new ssh-agent, tracking in ${SSH_ENV}. "

    ssh-agent > ${SSH_ENV}
    chmod 600 "$SSH_ENV"

    source "$SSH_ENV"
}
