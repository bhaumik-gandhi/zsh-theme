function battery_charge {
        python ~/.oh-my-zsh-customization/theme-scripts/batcharge.py
}

function ram_usage {
        python ~/.oh-my-zsh-customization/theme-scripts/ram_usage.py
}

local ret_status="%{$fg_bold[blue]%} [%*] %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
RPROMPT='%{$fg_bold[red]%}[RAM: $(ram_usage)%% , Battery: $(battery_charge)%%] %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
