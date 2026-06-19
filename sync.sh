#!/usr/bin/env bash
set -euo pipefail
DIR="$(cd "$(dirname "$0")/files/home" && pwd)"
SRC="$HOME/.pi/agent"

mkdir -p "$DIR/.pi/agent"

echo "-> Syncing auth.json"
cp -f "$SRC/auth.json" "$DIR/.pi/agent/auth.json" 2>/dev/null || true

echo "-> Syncing models.json"
cp -f "$SRC/models.json" "$DIR/.pi/agent/models.json" 2>/dev/null || true

echo "-> Syncing settings.json"
cp -f "$SRC/settings.json" "$DIR/.pi/agent/settings.json" 2>/dev/null || true

echo "-> Syncing skills"
rm -rf "$DIR/.pi/agent/skills"
cp -rf "$SRC/skills" "$DIR/.pi/agent/skills" 2>/dev/null || true

echo "Done."
