#!/usr/bin/env sh
set -eu

repo_root=$(git rev-parse --show-toplevel)
source_hook="$repo_root/pre-commit"
target_hook="$repo_root/.git/hooks/pre-commit"

if [ ! -f "$source_hook" ]; then
  echo "ERROR: pre-commit file was not found at repository root." >&2
  exit 1
fi

mkdir -p "$repo_root/.git/hooks"
cp "$source_hook" "$target_hook"
chmod +x "$target_hook"

echo "Installed pre-commit hook: $target_hook"
