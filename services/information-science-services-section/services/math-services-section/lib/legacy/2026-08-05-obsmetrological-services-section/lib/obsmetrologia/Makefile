SHELL := /usr/bin/bash
.DEFAULT_GOAL := help

.PHONY: help doctor build check readings mcp mcp-check clean

help: ## Show every procedure
	@echo "Obsmetrologia procedures — run 'make <target>':"
	@grep -hE '^[a-z][a-z-]*:.*##' $(MAKEFILE_LIST) | sort | awk -F':.*##[ ]*' '{printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'

doctor: ## Verify every tool is reachable (run this first if something breaks)
	@echo "lake:       $$(command -v lake || echo MISSING)"
	@lake --version 2>/dev/null || true
	@echo "uvx:        $$(command -v uvx || echo MISSING)"
	@echo "Lean MCP:"
	@uv run --with mcp python scripts/lean-mcp-call.py --list-tools >/dev/null
	@echo "  reachable"

build: ## Build the Obsmetrologia library
	lake build

check: ## Build and run the local naming honesty gate
	node scripts/audit-package-scope.mjs --fail
	node --test test/package-scope.test.mjs
	lake build
	lake exe checknames

# The reading ledger. A Lean docstring may claim only what the kernel
# checked (the certificate); every interpretation of a certificate — "so
# there is a root", "witnesses", "realizes", "the signature of" — is a
# claim no gate verifies, and belongs at a blueprint node (green only if
# the interpretation is itself a \lean{}-linked theorem, red otherwise).
# This target enumerates docstring lines that look like readings so they
# can be audited and moved. Report-only: grep cannot judge, it can only
# make the audit surface finite.
readings: ## List docstring lines that read like interpretations (audit surface, report-only)
	@grep -rn --include='*.lean' -E '/--.*(≈|unit circle|a root (in|on|of)|the real root|has a root|eigenvalue|IVT|conjugate pair|reads as|physically|so it (has|is)|giving the real)' Obsmetrologia/ | grep -v '_archive' || echo "no reading-shaped docstring lines found"

mcp: ## Start the Obsmetrologia Lean LSP MCP server
	pnpm run lean:mcp

mcp-check: ## Exercise the package-owned Lean MCP client and declaration search
	uv run --with mcp python scripts/lean-mcp-call.py lean_local_search '{"query":"QuartetRecurrence"}'

clean: ## Remove generated docs output (keeps .lake build caches)
	rm -rf docs/blueprint/web docs/verso/_rendered sites/docs
