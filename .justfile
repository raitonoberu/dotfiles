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
		lazygit \
		neovim \
		ripgrep \
		stow \
		tree-sitter-cli

cleanup:
	sudo pacman -Rns (pacman -Qtdq)

[no-cd]
jb-cleanup:
	#!/usr/bin/env sh
	set -e
	sln=$(ls *.sln | head -n 1)
	files=$(git diff HEAD --name-only | grep '.cs' | paste -sd';')
	jb cleanupcode $sln --include="$files" --profile="Vostok Full Cleanup" --no-updates --no-build
