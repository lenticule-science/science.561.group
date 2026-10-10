#!/usr/bin/env bash
# Scaffold a glossary term in house style.
# Usage: new-glossary-term.sh <target-glossary-terms-dir> <slug> "<Title>" "<one-sentence description>"
# Example:
#   new-glossary-term.sh .../content/glossary/terms roosevelt-reservation "Roosevelt Reservation" "The 60-foot federal strip along the border proclaimed in 1907."
set -euo pipefail

DIR="${1:?target glossary terms dir}"
SLUG="${2:?slug (kebab-case)}"
TITLE="${3:?title}"
DESC="${4:?one-sentence description}"

mkdir -p "$DIR"
FILE="$DIR/$SLUG.md"
[ -e "$FILE" ] && { echo "refusing to overwrite existing $FILE" >&2; exit 1; }

cat > "$FILE" <<EOF
---
title: "$TITLE"
date-created: $(date +%F)
aliases:
  - "$(echo "$TITLE" | tr '[:upper:]' '[:lower:]')"
description: "$DESC"
references: {}
---

$TITLE

EOF
echo "$FILE"
