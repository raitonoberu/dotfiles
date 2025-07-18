# integrations
fzf --fish | source
direnv hook fish | source
alias cat="bat"
alias du="dust"
alias lg="lazygit"

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
function unbackup --argument filename
    mv $filename.bak $filename
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
alias restow='cd ~/dotfiles && stow -R -v --no-folding -t ~ .'

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

# theming
set -x FZF_DEFAULT_OPTS "
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
set -x hydro_color_pwd cyan
set -x hydro_color_prompt magenta
set -x hydro_color_git yellow
set -x hydro_color_duration brblack
set -x fish_color_command blue
set -x fish_greeting

# install fisher & plugins
if not type -q fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    fisher update
end

# install tmux plugin manager
if not test -d ~/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "Press '<C-a>I' in tmux to install plugins"
end

# cleanup c# code with jetbrains cli tool
function jbcleanup --argument solution
    set -l files (git diff HEAD --name-only | grep ".cs" | string join ";")
    jb cleanupcode $solution --include="$files" --profile="Vostok Full Cleanup" --no-updates --no-build
end
