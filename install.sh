#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

mkdir -p "$CONFIG_DIR"

for app in nvim kitty; do
    source="$DOTFILES_DIR/$app"
    target="$CONFIG_DIR/$app"

    if [ -L "$target" ] && [ "$(readlink -f "$target")" = "$source" ]; then
        echo "✓ $app already linked"
        continue
    fi

    if [ -e "$target" ] || [ -L "$target" ]; then
        backup="${target}.backup.$(date +%Y%m%d_%H%M%S)"
        mv "$target" "$backup"
        echo "✓ Backed up existing $app configuration to $backup"
    fi

    ln -s "$source" "$target"
    echo "✓ $app configuration installed"
done

echo "All configurations installed!"
