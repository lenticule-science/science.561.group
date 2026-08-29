---
title: "Skills have manifest contracts"
description: "Every skill (local agent skill or operational skill pack) carries a JSON-Schema-validated manifest. Manifests aggregate into a substrate-resident registry at boot, are exposed through the MCP driver, and are validated locally by `lint-skills`. The OS-side foundation for operational skill packs."
kind: decision
date: "2026-05-02"
status: committed
---

# Skills have manifest contracts

## What

Every skill the OS ships, generates, or installs — whether under `.local/skills/<slug>/SKILL.md` (local agent skills), `operations/engineering/skills/<slug>/SKILL.md` (operational skill packs), or any future configured source root — carries a **manifest** that conforms to a normative JSON Schema (`boot/schemas/skill-spec-v1.schema.json`).

Specifically:

- The manifest is the YAML frontmatter of `SKILL.md` (or the JSON body of a programmatically-authored skill cell).
  Required fields are `spec-version`, `name`, `description`, `version`.
  Optional fields cover `runtime`, `triggers`, `inputs`, `outputs`, `enables-capabilities`, `requires-capabilities`, `region`, `part-of`, `supersedes`, `retired-at-ord`.
- Only manifests with a non-null `runtime` are **executable**; null-runtime entries are **advisory** (documentation-only, surfaced by the help system, excluded from the agential dispatch surface).
- A `build-skill-manifest` stdlib verb aggregates all valid manifests, computes their canonical-bytes SHA-256 (the `manifest-version`), and emits one `skill-manifest-built` event whose σ-pass installs `skill-record` substrate cells (one per skill).
- The aggregate is also projected to `boot/skill-manifest.json` so cold boot can read the catalog without traversing the event log.
- The aggregated manifest is exposed through the MCP driver; agents inside the OS enumerate skills via standard MCP discovery.
- A `lint-skills` stdlib verb runs the validation pass without aggregating; authors invoke it locally for fast feedback before committing.

The full normative content lives in [`specs/stdlib/skill-manifest.md`](../specs/stdlib/skill-manifest.md) (schema, lifecycle, errors, conformance), [`specs/agential/skill-registry.md`](../specs/agential/skill-registry.md) (agent-side consumption), and [`specs/drivers/mcp-driver.md`](../specs/drivers/mcp-driver.md) §9 (MCP exposure surface).

## Why

The captain has been authoring skills under `.local/skills/` and `operations/engineering/skills/` for months without a formal manifest contract.
The agential layer references skills as if they exist; the bundled MCP catalog ([`bundled-mcp-catalog-is-normative.md`](bundled-mcp-catalog-is-normative.md)) wires servers into office work; the v0.8 plan promotes sessions to OS-level processes.
None of these surfaces had a stable target for "what is a skill, on the wire?" until now.

The captain's [`skill-manifest-implementation.md`](../../../engineering/triage/operations/command/ideas/triage/skill-manifest-implementation.md) idea spelled out the practical shape: a JSON-Schema-validated manifest, a `build-skill-manifest` aggregator, MCP exposure, a `lint-skills` validator.
Adopting it as a substrate-resident discipline costs little and pays back across the agential surface:

- **Skills become discoverable at boot.** A fresh OS knows what skills exist without re-scanning the source tree on every query; the substrate cells are the registry, the on-disk JSON is a cold-boot accelerator.
- **Skill authors get local feedback.** `lint-skills` catches schema violations, duplicate names, missing runtimes, undeclared capabilities at edit time, not at agent-fire time.
- **Agents inside the OS can enumerate.** Standard MCP discovery exposes the catalog to any LLM client (per [`agent-surface-is-mcp.md`](agent-surface-is-mcp.md)); no separate skill-registry RPC is needed.
- **Drift surfaces in audit.** Every skill record carries a `manifest-version` SHA-256; revising a manifest produces a new SHA, replay observes the divergence, and federated peers know which version of a skill any given session invoked.
- **Operational skill packs (project tasks #6–#10) have a target.** Those tasks build skill packs; this decision specifies what a skill manifest *is* so the packs have a stable contract to write against.

The decision is structurally analogous to:

- [`drivers-are-substrate-entities.md`](drivers-are-substrate-entities.md) — interfacers are substrate cells with capability declarations; this decision says skills are too.
- [`bundled-mcp-catalog-is-normative.md`](bundled-mcp-catalog-is-normative.md) — bundled MCP servers are substrate cells with default profiles; this decision says skills follow the same discipline at the agential-skill layer.
- [`self-representation-everywhere.md`](self-representation-everywhere.md) — every operative element is a substrate entity; the manifest contract makes skills first-class citizens of that discipline.

The source idea's "engine startup rebuilds the manifest if missing and validates for duplicate ids and runtimes" maps directly onto the v0.2 boot sequence; the substrate's existing replay and federation disciplines mean nothing new has to be invented for the registry to ride alongside everything else.

Source: this conversation (2026-05-02); the captain's [`skill-manifest-implementation.md`](../../../engineering/triage/operations/command/ideas/triage/skill-manifest-implementation.md) (2026-01-08); existing skills under `.local/skills/` and `operations/engineering/skills/` (referenced for shape).

## What it rules out

- A separate skill registry service with its own consistency rules.
  The registry IS the substrate fiber projected at `(skill:*, *, *)`.
- Skills without a versioned manifest.
  Every skill ships with `spec-version`, `name`, `version`; unversioned skills are rejected at aggregation.
- Implicit skill discovery (e.g., "any executable file under `.local/skills/` counts").
  Discovery is by manifest, not by directory layout heuristics.
- Skills that amplify capabilities silently.
  `enables-capabilities` is a declared field; the substrate's $\Rightarrow$ algebra bounds amplification at fire time.
- Skill manifests embedded in code (e.g., as decorators on Python functions).
  The manifest is a static, parseable file; runtime adapters bind to the manifest, not the reverse.
  (This rules out the "decorate a function and the system magically registers it" pattern that ECC2-era harnesses used; the substrate prefers explicit declarations the σ-pass can validate.)
- A manifest format that is not JSON-Schema-validated.
  Authors get one schema; revisions are a new `spec-version` const and a new schema file.

## What it does not constrain

- The specific runtime adapters that implement each `runtime` string.
  `inference`, `shell`, `python`, `rust`, `closure-rule`, `tier-2-model` are the v0.2 set; future runtimes are added by registering an adapter and amending the schema's `runtime` enum.
- The natural-language matching algorithm used by the agential layer's `trigger-match` scoring axis.
  Per-deployment tuning is normal substrate state.
- The directory layout under each source root.
  The aggregator walks for `SKILL.md` files; how authors organise within `<slug>/` is up to them.
- Per-agent or per-persona skill scopes.
  The v0.8 surface treats every session's registry view as the global aggregate, capability-bounded at fire time.
  Per-agent projection-axis manifest fragments are deferred to a later release per [specs/agential/skill-registry.md](../specs/agential/skill-registry.md) §6.
- The body content of `SKILL.md`.
  The frontmatter is the contract; the markdown body is human-facing documentation.
- Whether to ship the v0.2 stdlib `build-skill-manifest` and `lint-skills` as Python or Rust binaries first.
  Both implementations target the same conformance vectors per the cross-language byte-identity discipline.
- Reference URIs into encyclopedia concepts for token types in `inputs`/`outputs`.
  The source idea calls this out as future work; pack-level extension fields can ride on `additionalProperties: true` until a normative `concept-uri` field is added.
