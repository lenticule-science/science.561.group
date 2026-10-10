SHELL := /usr/bin/bash
.DEFAULT_GOAL := help

.PHONY: help build check

help: ## Show every procedure
	@echo "Obsmetrologia procedures — run 'make <target>':"
	@grep -hE '^[a-z][a-z-]*:.*##' $(MAKEFILE_LIST) | sort | awk -F':.*##[ ]*' '{printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'

build: ## Build the Obsmetrologia library
	lake build

check: ## The one real gate: naming honesty, axiom hygiene, packaging, golden-vector conformance
	lake build
	lake build checknames
	lake exe checknames
	lake build auditfrontier
	lake exe auditfrontier
	python3 scripts/AuditPackaging.py
	lake build conformance
	lake exe conformance
