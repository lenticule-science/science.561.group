SHELL := /bin/bash

VENV ?= .venv
PYTHON_BIN ?= python3
PYTHON := $(VENV)/bin/python
PIP_STAMP := $(VENV)/.pip-installed
UVICORN := $(PYTHON) -m uvicorn
APP := engine.api.main:app
HOST ?= 0.0.0.0
PORT ?= 5000
EMACS ?= emacs
EMACS_INIT ?= library/applications/software/gnoponemacs/init.el
EMACS_BASE_ARGS ?= -Q --load $(EMACS_INIT)
EMSENN_NET_PUBLICATION_CONFIG ?= library/agents/emsenn/content/emsenn-net/publication.yml
EMSENN_NET_MKDOCS_CONFIG ?= library/agents/emsenn/products/emsenn-net/mkdocs.yml
.PHONY: help install run setup-emsenn-net collect-emsenn-net build-emsenn-net gui tui fmt lint clean test manifest check

help:
	@echo "Common targets:"
	@echo "  make install    - create venv + install backend"
	@echo "  make run        - start API (requires prior install)"
	@echo "  make setup-emsenn-net - install MkDocs dependencies for emsenn-net"
	@echo "  make collect-emsenn-net - collect emsenn-net publishables into MkDocs project"
	@echo "  make build-emsenn-net - build emsenn-net site with MkDocs"
	@echo "  make gui        - launch GnoponEmacs in GUI mode"
	@echo "  make tui        - launch GnoponEmacs in terminal mode"
	@echo "  make manifest   - rebuild skill-manifest.json"
	@echo "  make lint/test  - lint or test backend"
	@echo "  make clean      - remove venv"

install:
	@if [ ! -x "$(PYTHON)" ]; then \
		rm -rf $(VENV); \
		$(PYTHON_BIN) -m venv $(VENV); \
	fi
	$(PYTHON) -m pip install --upgrade pip setuptools wheel
	$(PYTHON) -m pip install -e .
	touch $(PIP_STAMP)

run:
	@if [ ! -x "$(PYTHON)" ] || [ ! -f "$(PIP_STAMP)" ]; then \
		echo "Not installed. Run 'make install' first." >&2; \
		exit 1; \
	fi
	$(UVICORN) $(APP) --host $(HOST) --port $(PORT)

setup-emsenn-net:
	@if [ ! -x "$(PYTHON)" ] || [ ! -f "$(PIP_STAMP)" ]; then \
		echo "Not installed. Run 'make install' first." >&2; \
		exit 1; \
	fi
	$(PYTHON) -m pip install -q ".[docs]"

collect-emsenn-net:
	@if [ ! -x "$(PYTHON)" ] || [ ! -f "$(PIP_STAMP)" ]; then \
		echo "Not installed. Run 'make install' first." >&2; \
		exit 1; \
	fi
	$(PYTHON) library/mathematics/objects/agential-semioverse/tools/publishing/collect-documents-for-publishing/scripts/collect-documents-for-publishing.py $(EMSENN_NET_PUBLICATION_CONFIG)

build-emsenn-net:
	@if [ ! -x "$(PYTHON)" ] || [ ! -f "$(PIP_STAMP)" ]; then \
		echo "Not installed. Run 'make install' first." >&2; \
		exit 1; \
	fi
	@if [ ! -f "$(EMSENN_NET_MKDOCS_CONFIG)" ]; then \
		echo "Missing mkdocs config. Run 'make collect-emsenn-net' first." >&2; \
		exit 1; \
	fi
	$(PYTHON) library/mathematics/objects/agential-semioverse/tools/publishing/publish-collection-of-documents/scripts/publish-collection-of-documents.py $(EMSENN_NET_MKDOCS_CONFIG)

gui:
	$(EMACS) $(EMACS_BASE_ARGS)

tui:
	$(EMACS) $(EMACS_BASE_ARGS) -nw

fmt:
	$(PYTHON) -m ruff format engine || true

lint:
	$(PYTHON) -m ruff check engine || true
	$(PYTHON) library/mathematics/objects/agential-semioverse/tools/skill-manifest/scripts/lint-skills.py

manifest:
	$(PYTHON) library/mathematics/objects/agential-semioverse/tools/skill-manifest/scripts/build-skill-manifest.py --output skill-manifest.json

check: lint test

test:
	$(PYTHON) -m pip install -q ".[dev]"
	$(PYTHON) -m pytest -q engine/tests

clean:
	rm -rf $(VENV)
	rm -f skill-manifest.json
