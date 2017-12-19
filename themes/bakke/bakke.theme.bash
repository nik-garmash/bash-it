#!/usr/bin/env bash

light_gray="\[\e[0;37m\]"
dark_gray="\[\e[0;90m\]"

SCM_THEME_PROMPT_DIRTY=" •"
SCM_THEME_PROMPT_CLEAN=""
SCM_THEME_PROMPT_PREFIX=""
SCM_THEME_PROMPT_SUFFIX=""

function prompt_command() {
    show_exit_code

    PS1="\n⌘  "
}

show_exit_code() {
    local ex=$?

    if [ $ex -ne 0 ]
    then
        echo -e "\033[0;31mExited with status $ex\033[0m"
    fi
}

echo -ne "\033]0;${PWD/#$HOME/~} $(git_prompt_minimal_info)\007"

safe_append_prompt_command prompt_command
