#!/usr/bin/env bash

light_gray="\[\e[0;37m\]"
dark_gray="\[\e[0;90m\]"

SCM_THEME_PROMPT_DIRTY="${dark_gray}•${reset_color}"
SCM_THEME_PROMPT_CLEAN=""
SCM_THEME_PROMPT_PREFIX=""
SCM_THEME_PROMPT_SUFFIX=""

function prompt_command() {
    show_exit_code

    PS1="${blue}\w${reset_color} ${dark_gray}$(git_prompt_minimal_info) \n${purple}❯${reset_color} "
}

show_exit_code() {
    local ex=$?

    if [ $ex -ne 0 ]
    then
        echo -e "\033[0;31m$ex\033[0m"
    fi
}


safe_append_prompt_command prompt_command
