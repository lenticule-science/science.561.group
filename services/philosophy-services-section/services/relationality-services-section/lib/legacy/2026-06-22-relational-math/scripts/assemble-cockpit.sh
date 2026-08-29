#!/usr/bin/env bash
# Assemble the four doc surfaces into docs-site/ (served at localhost:8000 by `make serve`).
# Called by `make docs`. Idempotent: copies the latest build of each surface into place.
# Sources that don't exist yet (e.g. api/ before `make api`) are skipped with a note.
set -u
cd "$(dirname "$0")/.." || exit 1
SITE=docs-site

copy_surface() {  # $1=name  $2=src dir  $3=dest subdir
  local name="$1" src="$2" dest="$SITE/$3"
  if [ -d "$src" ] && [ -n "$(ls -A "$src" 2>/dev/null)" ]; then
    rm -rf "$dest"; mkdir -p "$dest"; cp -r "$src"/. "$dest"/
    echo "  ✓ $name  ($src -> $dest)"
  else
    echo "  – $name  (skipped: $src is empty/missing — run its build target first)"
  fi
}

echo "Assembling cockpit into $SITE/ ..."
copy_surface "blueprint"  "blueprint/web"                    "blueprint"
copy_surface "manual"     "verso-docs/_rendered/html-multi"  "manual"
# NOTE: api/ is owned by `make api` (doc-gen4 via WSL) and written straight to docs-site/api/;
# it is intentionally NOT assembled here, so `make docs` never clobbers a fresh WSL build.

# imports: wrap the SVG in a minimal page so it has an index.html entry point.
if [ -f tooling/imports.svg ]; then
  rm -rf "$SITE/imports"; mkdir -p "$SITE/imports"
  cp tooling/imports.svg "$SITE/imports/imports.svg"
  cat > "$SITE/imports/index.html" <<'HTML'
<!DOCTYPE html><html><head><meta charset="utf-8"><title>RelMath import graph</title>
<style>body{margin:0;background:#0e1116;color:#e6edf3;font:14px system-ui;text-align:center}
h1{font-size:16px;padding:14px;margin:0;border-bottom:1px solid #2b323c}
.svg{padding:16px;overflow:auto}img{max-width:100%;background:#fff;border-radius:8px}
a{color:#58a6ff}</style></head>
<body><h1><a href="../index.html">&larr; cockpit</a> &nbsp;·&nbsp; RelMath module import graph</h1>
<div class="svg"><img src="imports.svg" alt="import graph"></div></body></html>
HTML
  echo "  ✓ imports  (tooling/imports.svg -> $SITE/imports/)"
else
  echo "  – imports  (skipped: tooling/imports.svg missing — run 'make imports')"
fi

echo "Done. Serve with: make serve   (http://localhost:8000)"
[ -d "$SITE/api" ] || echo "Note: API docs not built yet — run 'make api' (doc-gen4 via WSL)."
