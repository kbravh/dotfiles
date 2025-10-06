#!/bin/bash

VAULT_PATH="/home/kbravh/glass-notes"
cd "$VAULT_PATH" || exit 1

git add .

# Only commit if there are changes
if git diff --staged --quiet; then
    echo "No changes to commit at $(date)" >> ~/obsidian-sync.log
else
    git commit -m "sync - $(date '+%Y-%m-%d %H:%M:%S')"
fi

# Pull and push
git pull --rebase && git push

echo "Sync completed at $(date)" >> ~/obsidian-sync.log
