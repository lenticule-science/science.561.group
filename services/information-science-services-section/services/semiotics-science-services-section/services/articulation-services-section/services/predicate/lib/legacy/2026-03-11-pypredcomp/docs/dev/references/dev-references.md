---
title: "References"
description: "Paths into the theory chain, the mash-engine code, the captain's spec corpus, the archive bundles, and external protocol RFCs. The agent uses these on demand."
kind: index
---


This directory points the agent at material outside `replit-sprint/` that it may need on demand.
Each reference doc names the path, says what's there, and what to look for.

The agent does not need to crawl the archive; the [specs/](../specs/) directory is the consolidated working contract.
References are for cases where the agent needs context the spec doesn't capture — drilling into a specific spec source, looking up an external protocol RFC, examining a platform theory's load-bearing material, etc.

## The library theory chain

- [theories.md](theories.md) — paths to PredCat, PredComp, AgOP, FaRS, plus the math foundations.
- [platform-theories.md](platform-theories.md) — the six PredComp sub-platforms (AgOP, IAP, FRP, web-server, database, distributed-coordination) and FARS — what each contains, which OS subsystem each informs.
- [theory-for-developers.md](theory-for-developers.md) — the theory→code translation.
  Each PredCat / PredComp construct paired with the spec section that contracts it and the source module that realises it. **Read this before opening a kernel module**; reread the relevant row before any cross-cutting landing.

## External protocol specs

- [external-protocol-rfcs.md](external-protocol-rfcs.md) — canonical URLs for every public protocol the OS speaks (HTTP, WebSocket, SMTP, IMAP, CalDAV, Matrix, ActivityPub, MQTT, etc.).
  The sprint's `network/<protocol>.md` specs link to these.

## Existing code

- [mash-engine.md](mash-engine.md) — the captain's Rust workspace at `operations/engineering/services/mash/`.
  What's there, what to port.
- `corpus-tools.md` *(not yet authored)* — Python tools at `operations/engineering/tools/corpus/`.
  Until written, read the directory directly.
- `hugo-publishing.md` *(not yet authored)* — the existing Hugo publishing infrastructure at `operations/engineering/tools/web/publishing/hugo/`.
  Until written, read the directory directly.
- `existing-harness.md` *(not yet authored)* — Claude Code / Codex harness configs at `.claude/`.
  Until written, read the directory directly.

## Captain's spec corpus and archive

- [source-spec-corpus.md](source-spec-corpus.md) — the semiotic-cell-machine specs (~21k lines), what each file contains, and what new spec(s) consolidate it.
- [on-relationality-architecture.md](on-relationality-architecture.md) — the captain's `on-relationality/texts/computer-architecture/` directory: monitoring-audit, business-continuity, modal-reasoning, sheaf-assembly, traceability, etc. Substrate-services-tier material.
- [triage-backlog-os-level.md](triage-backlog-os-level.md) — the OS-level material in `relationality-inner-triage/ideas-for-concept-computers/` and elsewhere in triage.
  Curated list of files relevant to OS subsystems (kernel, filesystem, process, etc.).
- [rsc-quiescent-plans.md](rsc-quiescent-plans.md) — the captain's ~132 active plans + ~9 archived (in `operations/engineering/triage/operations/command/commands/rsc-quiescent/...
  `).
- `emsdeavor-plans.md` *(not yet authored)* — ~68 numbered plans (`personnel/emsenn/triage/projects/emsdeavor/...
  `).
  Until written, read the directory directly.
- [fars-analyses.md](fars-analyses.md) — 30+ analysis files (cross-cutting concerns + external-system informs).
- [universe-docs.md](universe-docs.md) — 8-universe consolidations (`ideas-from-some-old-draft/`).
- [ideas-trove.md](ideas-trove.md) — 50+ idea files in `operations/engineering/triage/operations/command/ideas/triage/` (theme-organised highlights).
- [trove-coverage.md](trove-coverage.md) — systematic 57-note × dev-docs-citation × theorem-reduction × landing-release map (the trove dir holds 58 entries; one is `_index.md`, leaving 57 design notes). **Read this before scoping a new landing** — the uncited material is the trove's contribution to the future-release backlog.

## Translation

- [vocabulary-translation.md](vocabulary-translation.md) — the systematic mapping from old to current vocabulary.

## When to read what

| If the agent needs to... | Read |
|---|---|
| Bridge a math/engineering construct to the code that realises it | [theory-for-developers.md](theory-for-developers.md) |
| Know what `predication-cell` formally is | `library/.../predication-categories/concepts/predication-cell.md` |
| Port the bilattice algebra | `mash-engine::algebra::Value` (mash-engine.md) |
| Understand a platform theory in depth (sessions, dispatch, capabilities) | platform-theories.md → load-bearing files |
| Look up a network protocol's wire format | external-protocol-rfcs.md → linked RFC |
| See computer-architecture material the captain has written | on-relationality-architecture.md |
| Find an OS-level idea in triage | triage-backlog-os-level.md |
| See which captain-trove notes back which landings, or find candidate landings derived from trove material | trove-coverage.md |
| Pull from a sibling computing theory (`agents`, `multi-user-dungeons`, `on-device-inference`, etc.) when authoring a new subsystem spec | theories.md §"Sibling computing theories the substrate touches" |
| Understand the Cellular Closure Engine algorithm in depth | semiotic-cell-machine/cce.md (source-spec-corpus.md) |
| Know which external system informed which spec | fars-analyses.md |
| Find an existing related-system survey | `library/.../texts/<X>-{architecture,for-agentic-systems}-analysis.md` |
| See the captain's planning vocabulary | rsc-quiescent-plans.md (and the `personnel/emsenn/triage/projects/emsdeavor/` directory directly until `emsdeavor-plans.md` is authored) |

The references are paths-only; the agent reads the source files when needed.
