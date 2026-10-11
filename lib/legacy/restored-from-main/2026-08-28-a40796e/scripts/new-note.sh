#!/usr/bin/env bash
# Scaffold a dated note in house style (name/description/date-created/keywords frontmatter).
# Usage: new-note.sh <section-content-dir> <slug> "<one-sentence description>" [keyword ...]
# Creates <section-content-dir>/documents/articles/notes/YYYY/MM/DD/YYYY-MM-DD-note-on-<slug>.md
# (matching the public-history/norway-history and social-history layout).
set -euo pipefail

CONTENT="${1:?section content dir (…/content)}"
SLUG="${2:?slug (kebab-case, no 'note-on-' prefix)}"
DESC="${3:?one-sentence description}"
shift 3 || true

D=$(date +%F); Y=${D:0:4}; M=${D:5:2}; DAY=${D:8:2}
DIR="$CONTENT/documents/articles/notes/$Y/$M/$DAY"
mkdir -p "$DIR"
FILE="$DIR/$D-note-on-$SLUG.md"
[ -e "$FILE" ] && { echo "refusing to overwrite existing $FILE" >&2; exit 1; }

{
  echo '---'
  echo "name: note-on-$SLUG"
  echo 'description: >-'
  echo "  $DESC"
  echo "date-created: $D"
  echo 'keywords:'
  if [ "$#" -gt 0 ]; then for k in "$@"; do echo "  - $k"; done; else echo '  - unsorted'; fi
  echo '---'
  echo
  echo "# ${SLUG//-/ }"
  echo
} > "$FILE"
echo "$FILE"
