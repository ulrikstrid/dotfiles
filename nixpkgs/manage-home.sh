#!/bin/zsh

cd "$HOME/.config/nixpkgs" || exit 1

# Sync vscode extensions
echo "Syncing vscode extensions..."
"./vscode/sync-extensions.sh" > "./vscode/extensions.nix"
echo "Syncing done."
# Run home-manager
home-manager switch

echo "run: source /Users/$USER/.zshrc"