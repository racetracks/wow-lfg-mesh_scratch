#!/bin/sh
# Copies the live registry into a draft's 16_Registries/REGISTRY.md with a "snapshot, not live" banner.
# usage: sh registry_snapshot.sh <scratch checkout> <draft folder>
set -e
S=${1:?scratch}; D=${2:?draft}
{ printf '# REGISTRY (snapshot): every reference type, its next integer, every key handed out\n\n> **Snapshot for the draft, not live.** The live registry (documents/reference-framework/16_Registries/REGISTRY.md; before the move docs/reference-framework/REGISTRY.md) is the only source of keys until promotion. Never allocate here. At promotion the live file is moved over this one (DEC-00019), never merged.\n\n'
  R="$S/documents/reference-framework/16_Registries/REGISTRY.md"; [ -f "$R" ] || R="$S/docs/reference-framework/REGISTRY.md"
  sed 1,2d "$R"; } > "$D/16_Registries/REGISTRY.md"
