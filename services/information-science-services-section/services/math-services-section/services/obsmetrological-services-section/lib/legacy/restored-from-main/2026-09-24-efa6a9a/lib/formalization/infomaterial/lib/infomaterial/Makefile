SHELL := /usr/bin/bash
.DEFAULT_GOAL := help

.PHONY: help doctor build check clean

help: ## Show every procedure
	@echo "Infomaterial procedures — run 'make <target>':"
	@grep -hE '^[a-z][a-z-]*:.*##' $(MAKEFILE_LIST) | sort | awk -F':.*##[ ]*' '{printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'

doctor: ## Verify every tool is reachable (run this first if something breaks)
	@echo "lake:       $$(command -v lake || echo MISSING)"
	@lake --version 2>/dev/null || true

build: ## Build the Infomaterial library
	lake build

check: ## Build and run the local naming honesty gate
	lake build
	lake exe checknames

clean: ## Remove generated docs output (keeps .lake build caches)
	rm -rf docs/blueprint/web docs/verso/_rendered sites/docs
