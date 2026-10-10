# One actuator surface for the lab — shared by the terminal, VS Code tasks, and CI.
# Resolve uv whether or not ~/.local/bin is on a non-login shell's PATH.
UV := $(shell command -v uv 2>/dev/null || echo $(HOME)/.local/bin/uv)
PNPM := $(shell command -v pnpm 2>/dev/null || echo pnpm)
ICK_HOST ?= 127.0.0.1
ICK_PORT ?= 18809
ICK_BASE_PATH ?=
ICK_ROOT ?= $(CURDIR)
ICK_URL ?= http://$(ICK_HOST):$(ICK_PORT)$(ICK_BASE_PATH)
ICK_SERVICE_DIR ?= ../../lib/organizing
export UV_LINK_MODE := copy

.PHONY: help sync test test-failed cov lint fmt fmt-check types check demo lab lab-probe nb dag-coverage dag-query goal-audit clean

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN{FS=":.*?## "}{printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'

sync: ## Create/refresh the venv and install workspace + dev tools
	$(UV) sync

test: ## Run the test suite
	$(UV) run pytest

test-failed: ## Re-run only the tests that failed last time
	$(UV) run pytest --last-failed

cov: ## Run tests with a coverage report
	$(UV) run pytest --cov=pymetrologic --cov-report=term-missing

lint: ## Lint with ruff
	$(UV) run ruff check .

fmt: ## Format with ruff
	$(UV) run ruff format .

fmt-check: ## Check formatting without writing
	$(UV) run ruff format --check .

types: ## Type-check with mypy (strict)
	$(UV) run mypy

check: lint fmt-check types test ## The full gate: lint + format + types + tests

demo: ## Print the meet-or-beat-PySheaf demo to the terminal
	$(UV) run python -m pymetrologic

lab: ## Serve this directory through ICK as the PyMetroLogic Python lab
	cd $(ICK_SERVICE_DIR) && $(PNPM) run build
	cd $(ICK_SERVICE_DIR) && node dist/scripts/kernel.mjs serve --host $(ICK_HOST) --port $(ICK_PORT) --root "$(ICK_ROOT)" $(if $(ICK_BASE_PATH),--base-path $(ICK_BASE_PATH),)

lab-probe: ## Probe ICK's Jupyter-conformant lab surface
	$(UV) run python tools/ick_jupyter_probe.py --base-url "$(ICK_URL)"

nb: ## Sync notebooks .py <-> .ipynb via jupytext
	$(UV) run --extra notebooks jupytext --sync notebooks/*.py

dag-coverage: ## Compare Lean and PyMetroLogic DAG coverage
	$(UV) run python tools/dag_coverage.py

dag-query: ## Query one Lean/PyMetroLogic DAG node: make dag-query MODULE=RelMath.Mark
	$(UV) run python tools/dag_coverage.py --module "$(MODULE)"

goal-audit: ## Audit the lab migration and PyMetroLogic provenance contract
	$(UV) run python tools/goal_audit.py

clean: ## Remove caches and the venv
	rm -rf .venv .pytest_cache .mypy_cache .ruff_cache .hypothesis

