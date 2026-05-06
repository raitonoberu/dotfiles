stow:
	rm ~/.config/fish/fish_variables
	stow -R -v --no-folding -d ~/dotfiles -t ~ .

unstow:
	stow -D -v --no-folding -d ~/dotfiles -t ~ .

install-base:
	sudo pacman -Sy --needed \
		bat \
		direnv \
		dust \
		eza \
		fd \
		fish \
		fzf \
		git-delta \
		mergiraf \
		lazygit \
		neovim \
		tmux \
		ripgrep \
		stow \
		uv \
		tree-sitter-cli

pacman-cleanup:
	sudo pacman -Rns $(pacman -Qtdq)
