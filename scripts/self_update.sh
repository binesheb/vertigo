#!/usr/bin/env bash
# Safe, main-only update helper for legacy Vertigo installations.
set -euo pipefail

REPO_URL="https://github.com/binesheb/vertigo.git"
BRANCH="main"
TARGET="/boot/vertigo"
STAGING="${TARGET}.update-staging"
BACKUP="${TARGET}.update-backup"

if [[ ! -d "$TARGET" ]]; then
  echo "Vertigo installation not found at $TARGET" >&2
  exit 1
fi

if [[ -d "$STAGING" || -d "$BACKUP" ]]; then
  echo "Previous update staging/backup directory exists; resolve it before continuing." >&2
  exit 1
fi

echo "Checking origin/$BRANCH for an update..."
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

git clone --depth 1 --branch "$BRANCH" --single-branch "$REPO_URL" "$TMP_DIR/vertigo"

if [[ -d "$TARGET/.git" ]]; then
  CURRENT="$(git -C "$TARGET" rev-parse HEAD 2>/dev/null || true)"
  CANDIDATE="$(git -C "$TMP_DIR/vertigo" rev-parse HEAD)"
  if [[ -n "$CURRENT" && "$CURRENT" == "$CANDIDATE" ]]; then
    echo "Already up to date."
    exit 0
  fi
fi

# Basic staging validation: required entry points must exist and shell scripts must parse.
for required in start.sh scripts/self_update.sh; do
  [[ -f "$TMP_DIR/vertigo/$required" ]] || {
    echo "Update validation failed: missing $required" >&2
    exit 1
  }
done

while IFS= read -r -d '' script; do
  bash -n "$script"
done < <(find "$TMP_DIR/vertigo" -type f -name '*.sh' -print0)

# Preserve local configuration outside the replacement operation when present.
if [[ -d "$TARGET/config" ]]; then
  cp -a "$TARGET/config" "$TMP_DIR/vertigo/config"
fi

echo "Installing validated origin/$BRANCH revision..."
sudo mv "$TARGET" "$BACKUP"
if sudo mv "$TMP_DIR/vertigo" "$TARGET"; then
  sudo rm -rf "$BACKUP"
  echo "Update completed successfully from origin/$BRANCH."
else
  echo "Installation failed; restoring previous working copy..." >&2
  sudo mv "$BACKUP" "$TARGET"
  exit 1
fi
