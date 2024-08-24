# intagrations
fzf --fish | source
direnv hook fish | source
starship init fish | source

alias cat="bat"
alias du="dust"

set -x EDITOR nvim
set -x FZF_DEFAULT_COMMAND "fd --type f"

alias ls='eza --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons' # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons' # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l.="eza -a | grep -e '^\.'" # show only dotfiles

alias tb='nc termbin.com 9999'

# useful functions
function backup --argument filename
    cp $filename $filename.bak
end

alias tarnow='tar -acf '
alias untar='tar -zxvf '

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias cleanup='sudo pacman -Rns (pacman -Qtdq)'
alias update='sudo pacman -Syu'

# !! and !$
function __history_previous_command
    switch (commandline -t)
        case "!"
            commandline -t $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end
function __history_previous_command_arguments
    switch (commandline -t)
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end
bind ! __history_previous_command
bind '$' __history_previous_command_arguments

# install tmux plugin manager if not already installed
if not test -d ~/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    clear
    echo "Press '<C-a>I' in tmux to install plugins"
end
