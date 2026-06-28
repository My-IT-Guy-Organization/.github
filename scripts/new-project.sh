#!/usr/bin/env bash
# Bootstraps a new project repo with standard DevOps files from this hub.
# Usage: ./new-project.sh <node|python|static> [target-dir]
set -euo pipefail

TYPE="${1:?Usage: new-project.sh <node|python|static> [target-dir]}"
TARGET="${2:-.}"
DEVOPS_REPO="git@github.com:My-IT-Guy-Organization/My-IT-Guy-DevOps.git"

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

git clone --depth 1 "$DEVOPS_REPO" "$TMP" >/dev/null

mkdir -p "$TARGET/.github/workflows" "$TARGET/.github/ISSUE_TEMPLATE"

case "$TYPE" in
  node)
    cp "$TMP/templates/workflows/ci-node.yml" "$TARGET/.github/workflows/ci.yml"
    cp "$TMP/templates/.gitignore-node" "$TARGET/.gitignore"
    ;;
  python)
    cp "$TMP/templates/workflows/ci-python.yml" "$TARGET/.github/workflows/ci.yml"
    cp "$TMP/templates/.gitignore-python" "$TARGET/.gitignore"
    ;;
  static)
    cp "$TMP/templates/workflows/deploy-netlify.yml" "$TARGET/.github/workflows/deploy.yml"
    cp "$TMP/templates/netlify.toml" "$TARGET/netlify.toml"
    ;;
  *)
    echo "Unknown type: $TYPE (expected node, python, or static)" >&2
    exit 1
    ;;
esac

cp "$TMP/templates/.editorconfig" "$TARGET/.editorconfig"
cp "$TMP/templates/dependabot.yml" "$TARGET/.github/dependabot.yml"
cp "$TMP/.github/PULL_REQUEST_TEMPLATE.md" "$TARGET/.github/PULL_REQUEST_TEMPLATE.md"
cp -r "$TMP/.github/ISSUE_TEMPLATE/." "$TARGET/.github/ISSUE_TEMPLATE/"

echo "Bootstrapped $TYPE project files in $TARGET"
echo "Review the new files, then git add & commit them."
