fzf --fish | source
direnv hook fish | source

set -x EDITOR nvim
set -x FZF_DEFAULT_COMMAND "fd --type f"

alias cat="bat"
alias du="dust"
alias lg="lazygit"
alias vi="nvim"

alias ls='eza --color=always --group-directories-first --icons'
alias la='eza -a --color=always --group-directories-first --icons'
alias ll='eza -l --color=always --group-directories-first --icons'

alias tarnew='tar -acf '
alias untar='tar -zxvf '

alias ..='cd ..'

bind ctrl-f "tmux-sessionizer"

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

if not type -q fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    fisher update
end
