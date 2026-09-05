.DEFAULT_GOAL := help

HUGO ?= hugo
POWERSHELL ?= powershell

REPO_ROOT := $(abspath $(CURDIR))
HUGO_ROOT := $(REPO_ROOT)/operations/engineering/tools/web/publishing/hugo
EMSENN_NET_SITE_DIR := $(HUGO_ROOT)/emsenn-net
EMSENN_NET_PUBLISH_DIR := $(REPO_ROOT)/operations/science/publications/websites/emsenn-net

KNOWN_SITES := emsenn-net
SITE_GOALS := $(filter $(KNOWN_SITES),$(MAKECMDGOALS))
SITE := $(if $(SITE_GOALS),$(word 1,$(SITE_GOALS)),emsenn-net)

CLEAN_REQUESTED := $(filter clean,$(MAKECMDGOALS))
HUGO_CLEAN_FLAG := $(if $(CLEAN_REQUESTED),--cleanDestinationDir,)

.PHONY: help build build-emsenn-net clean emsenn-net publish publish-emsenn-net audit-frontmatter

help:
	@echo Usage:
	@echo "  make build"
	@echo "  make build clean"
	@echo "  make build emsenn-net"
	@echo "  make build clean emsenn-net"
	@echo "  make publish emsenn-net"
	@echo "  make audit-frontmatter"

build:
ifneq ($(words $(SITE_GOALS)),1)
ifneq ($(words $(SITE_GOALS)),0)
	$(error multiple sites requested: $(SITE_GOALS))
endif
endif
	@$(MAKE) --no-print-directory build-$(SITE) HUGO_CLEAN_FLAG="$(HUGO_CLEAN_FLAG)"

build-emsenn-net:
	$(HUGO) --source "$(EMSENN_NET_SITE_DIR)" --destination "$(EMSENN_NET_PUBLISH_DIR)" $(HUGO_CLEAN_FLAG)
	npx --yes pagefind --site "$(EMSENN_NET_PUBLISH_DIR)"

publish:
ifneq ($(words $(SITE_GOALS)),1)
ifneq ($(words $(SITE_GOALS)),0)
	$(error multiple sites requested: $(SITE_GOALS))
endif
endif
	@$(MAKE) --no-print-directory publish-$(SITE)

publish-emsenn-net:
	cd "$(EMSENN_NET_PUBLISH_DIR)" && \
		git add -A && \
		(git diff --cached --quiet || git commit -m "publish: $$(date -u +%FT%TZ)") && \
		git push origin main

clean:
	@:

emsenn-net:
	@:

audit-frontmatter:
	$(POWERSHELL) -ExecutionPolicy Bypass -File "operations/science/toys/frontmatter-audit/audit-frontmatter.ps1" -Root "library"
