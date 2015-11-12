function get_RAM {
	free -m | awk '{if (NR==2) print $3}' | xargs -i echo 'scale=1;{}/1000' | bc
}

function get_total_RAM {
	free -m | awk '{if (NR==2) print $2}' | xargs -i echo 'scale=1;{}/1000' | bc
}

function get_server_name {
    ips="$(hostname -I)"
    for ip in $ips
    do
        hostNameIp=$ip
        break
    done

    if [ -z "$hostNameIp" ]
    then
        if [ -z "$ZSH_SERVER_NAME" ]
        then
            echo ""
        else
            echo "[$ZSH_SERVER_NAME]";
        fi
    else
        echo "[$hostNameIp]";
    fi
}


local ret_status="%{$fg_bold[blue]%}$(get_server_name)[%*] %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
RPROMPT='%{$fg_bold[red]%}[RAM: $(get_RAM)GB / $(get_total_RAM)GB] %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
