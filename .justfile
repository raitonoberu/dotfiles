stow:
	stow -R -v --no-folding -d ~/dotfiles -t ~ .

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
		difftastic \
		lazygit \
		neovim \
		tmux \
		ripgrep \
		stow \
		tree-sitter-cli

pacman-cleanup:
	sudo pacman -Rns $(pacman -Qtdq)
