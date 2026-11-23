#!/bin/sh
# Create the documents/ folder tree (DEC-00017): placeholders only.
# Every folder gets Readme.md, claude.local.md (fixed rules) and 00_Changelog.md; nothing is overwritten.
# Usage: sh build_documents_tree.sh <scratch checkout> "<context>"
R=${1:?usage: build_documents_tree.sh <scratch checkout> <context>}; C=${2:-structure-builder}
H=$(cd "$(dirname "$0")" && pwd)
D="$R/documents"
mkdir -p "$D"
sh "$H/write_claude_local.sh" "$D/claude.local.md" "documents"
sh "$H/write_changelog.sh" "$D/00_Changelog.md" "documents" "$C"
sh "$H/placeholder_folders.sh" "$D" "Documentation group" "$C" addons features sub-features
# Capability folders are named in env ADDONS, FEATURES, SUB_FEATURES (space separated); none by default.
[ -n "$ADDONS" ] && sh "$H/placeholder_folders.sh" "$D/addons" "Documentation of the addon folder" "$C" $ADDONS
[ -n "$FEATURES" ] && sh "$H/placeholder_folders.sh" "$D/features" "Documentation of the feature" "$C" $FEATURES
[ -n "$SUB_FEATURES" ] && sh "$H/placeholder_folders.sh" "$D/sub-features" "Documentation of the sub-feature" "$C" $SUB_FEATURES
exit 0
