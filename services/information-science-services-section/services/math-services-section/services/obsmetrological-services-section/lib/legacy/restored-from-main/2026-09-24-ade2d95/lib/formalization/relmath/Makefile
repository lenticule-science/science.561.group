# RelMath toolchain — deterministic procedures. Run `make` (or `make help`).
#
# THE POINT OF THIS FILE: nobody — human or agent — should ever again re-derive how
# to build/check/serve this project. Every procedure is one `make` target. All the
# Windows jank (tool paths, PATH ordering, WSL routing for doc-gen4) is encoded ONCE,
# below. If a target breaks, fix it HERE so the fix is permanent. See RUNBOOK.md.

SHELL := /usr/bin/bash
.DEFAULT_GOAL := help

# --- The jank, encoded once (verified 2026-06-22) ---------------------------------
# Windows tool locations. doc-gen4 is the only thing that can't run on Windows
# (its fromDb step segfaults, 0xC0000005) — it routes to WSL automatically (`make api`).
GRAPHVIZ  := /c/Program Files/Graphviz/bin
MIKTEX    := /c/Users/emsen/AppData/Local/Programs/MiKTeX/miktex/bin/x64
PYSCRIPTS := /c/Users/emsen/AppData/Local/Packages/PythonSoftwareFoundation.Python.3.12_qbz5n2kfra8p0/LocalCache/local-packages/Python312/Scripts
MSYS_GCC  := /c/msys64/ucrt64/bin
# Prepend them all so plastex/kpsewhich/dot/cc/leanblueprint resolve with zero setup.
export PATH := $(MIKTEX):$(GRAPHVIZ):$(PYSCRIPTS):$(MSYS_GCC):$(PATH)

.PHONY: help doctor build check blueprint verso imports api docs serve watch clean

help: ## Show every procedure
	@echo "RelMath procedures — run 'make <target>':"
	@grep -hE '^[a-z][a-z-]*:.*##' $(MAKEFILE_LIST) | sort | awk -F':.*##[ ]*' '{printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'

doctor: ## Verify every tool is reachable (run this first if something breaks)
	@echo "lake:       $$(command -v lake || echo MISSING)"
	@echo "plastex:    $$(command -v plastex || echo MISSING)"
	@echo "kpsewhich:  $$(command -v kpsewhich || echo MISSING)"
	@echo "dot:        $$(command -v dot || echo MISSING)"
	@echo "cc (gcc):   $$(command -v cc || echo MISSING)"
	@echo "python:     $$(command -v python || echo MISSING)"
	@echo "wsl lake:   $$(wsl.exe bash -lc '~/.elan/bin/lake --version' 2>/dev/null | head -1 || echo MISSING)"

build: ## Build the RelMath library (lake build)
	lake build

blueprint: ## Render the blueprint web graph -> blueprint/web/ (also emits blueprint/lean_decls)
	cd blueprint/src && plastex -c plastex.cfg web.tex

check: blueprint ## Honesty gate: verify every \lean{} names a real, compiling decl
	cd tooling && lake build RelMathTooling && lake exe checkdecls ../blueprint/lean_decls

verso: ## Build + render the Verso manual -> verso-docs/_rendered/
	cd verso-docs && lake build && (lake exe relmath-docs --output _rendered || true)

imports: ## Render the module import graph -> tooling/imports.svg
	cd tooling && lake build RelMathTooling && lake exe graph --to RelMath imports.svg

api: ## Build doc-gen4 API docs via WSL (segfaults on Windows) -> docs-site/api/
	bash scripts/build-api-wsl.sh

docs: blueprint verso imports ## Build all surfaces and assemble the cockpit -> docs-site/
	bash scripts/assemble-cockpit.sh

serve: ## Serve the cockpit at http://localhost:8000 (frees the port first)
	@pid=$$(netstat -ano 2>/dev/null | grep -E ':8000 .*LISTENING' | awk '{print $$NF}' | head -1); \
	  if [ -n "$$pid" ]; then echo "freeing :8000 (killing stale PID $$pid)"; taskkill //PID $$pid //F >/dev/null 2>&1 || true; fi
	@echo "Cockpit at http://localhost:8000  (Ctrl-C to stop)"
	python -m http.server 8000 --directory docs-site

watch: ## Autosync: rebuild affected surfaces on .lean/.tex change
	bash scripts/watch-docs.sh

clean: ## Remove generated docs output (keeps .lake build caches)
	rm -rf blueprint/web verso-docs/_rendered docs-site/blueprint docs-site/manual docs-site/api docs-site/imports tooling/imports.svg tooling/imports.dot
