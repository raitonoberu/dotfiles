stow:
	stow -R -v --no-folding -d ~/dotfiles -t ~ .

pacman-install:
	sudo pacman -Sy --needed \
		bat \
		direnv \
		dust \
		eza \
		fd \
		fish \
		fzf \
		git-delta \
		lazygit \
		neovim \
		ripgrep \
		stow \
		tree-sitter-cli

pacman-cleanup:
	sudo pacman -Rns $(pacman -Qtdq)
