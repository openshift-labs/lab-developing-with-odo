if hash powerline-shell 2>/dev/null; then
    function _update_ps1() {
        PS1=$(powerline-shell $?)
    }

    if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
        PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
    fi
fi

alias odo=odo-latest

complete -C /opt/app-root/bin/odo odo