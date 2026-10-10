# src/PLANS.md

## Open

### migrate-engine-to-repo

**Added:** 2026-03-17
**Status:** open
**Action:** Rename `src/engine/` → `src/repo/`; update all `src.engine.*` imports to `src.repo.*`; update `.mcp.json` and `docker-compose.yml`. Move service stubs to `src/service/`.
**Why:** Two-machine architecture — relational-repository engine lives at `src/repo/`.

### add-md-link-hook

**Added:** 2026-03-17
**Status:** open
**Action:** Add a PostToolUse hook that warns when a `.md` file uses backtick-quoted file references instead of markdown links.
**Why:** Enforces `links-not-sigils` at write time.

### await-c4-component-texturing

**Added:** 2026-03-16
**Status:** blocked
**Why blocked:** src/ cannot implement components it cannot yet specify. The C4 diagram is
**Action:** Watch spec/PLANS.md for the `texture-c4-components` item to close. When all

### normalization-kernel-graph

**Added:** 2026-03-16
**Status:** open
**Action:** Implement the Normalization Kernel as a LangGraph graph with two passes:
**Why:** This is the core of the Relational Machine -- the pi_t = sigma compose Delta

### frontier-fastapi

**Added:** 2026-03-16
**Status:** open
**Action:** Implement the Frontier as a FastAPI + FastMCP application that:
**Why:** The Frontier is the I/O membrane. Everything that enters the machine enters here.

### observation-layer-api

**Added:** 2026-03-16
**Status:** open
**Action:** Implement the Observation Layer as query endpoints that return
**Why:** Without this, there is no way to observe what the machine has settled.

### docker-image

**Added:** 2026-03-16
**Status:** open
**Action:** Write Dockerfile bundling: Python env, all four components, SQLite DB mount,
**Why:** The target deployment is a Docker image that any department (or external library)

### web-gui-frontier

**Added:** 2026-03-16
**Status:** open
**Action:** Implement a minimal web GUI for the Frontier: accepts free-text input (a step),
**Why:** Human agents need a Frontier too. The web GUI IS the human-facing I/O membrane.

## Deferred

### src-derivation-pipeline

**Added:** 2026-03-16
**Status:** deferred
**Why blocked:** Blocked by unified-unit-store and the spec for derivation (spec/derivation.md).
**Action:** Implement src/derive/{kind}.py scripts that compute derivable fields for each



