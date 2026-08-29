---
title: "The Emsemioverse"
date-created: 2026-03-04T00:00:00
type: index
keywords:
  - Relationality
  - Semiotics
description: "emsenn's research vault — an agential semioverse repository — and documentation of its operation."
---

## Plain Summary

The emsemioverse is a "knowledge system" created by emsenn that uses a special set of mathematical operators to help it measure which knowledge is true.

The ***emsemioverse*** is the initial and experimental [agential semioverse repository](../../../technology/specifications/agential-semioverse-repository/index.md), developed by emsenn. It is this vault: a knowledge system whose directory layout, linking conventions, frontmatter schemas, and executable skills all follow from a formal mathematical hierarchy described under the [ASR specification](../../../technology/specifications/agential-semioverse-repository/index.md).

Because the emsemioverse is the first ASR, the specification and the implementation are developing together. Some capabilities the formalism requires are approximated rather than implemented with full rigor. Schemas may be incomplete, naming conventions inconsistent, and some structures may contradict each other as the specification evolves. Where contradictions arise, more recent content takes precedence, and emsenn's writing takes precedence above that. Content here reflects the current state of an ongoing research program, not a finished product.

## The formal hierarchy

The vault's architecture descends from [relationality](../../../relationality/index.md) through a chain of mathematical structures, each extending the last:

1. **[Relationality](../../../relationality/index.md)** — the philosophical foundation. Relations are ontologically prior to entities.
2. **[Semiotic Universe](../../../mathematics/objects/universes/semiotic-universe/index.md)** — the pure mathematical bedrock. A complete Heyting algebra with modal closure and trace comonad, extended with a typed lambda calculus and three closure operators whose composite yields the initial semiotic structure.
3. **[Interactive Semioverse](../../../mathematics/objects/universes/interactive-semioverse/index.md)** — extends the semiotic universe with handles (persistent external indices for things), interaction terms, footprints, failure semantics, provenance, and sheaf semantics. How signs interact with external reality.
4. **[Agential Semioverse](../../../mathematics/objects/universes/agential-semioverse/index.md)** — extends the interactive semioverse with agent profiles, tool signatures, skill calculus, and execution semantics. How agents act within and upon the system.
5. **[Agential Semioverse Repository](../../../technology/specifications/agential-semioverse-repository/index.md)** — a concrete implementation of an agential semioverse as an organized knowledge repository. This vault IS an ASR.

Each layer inherits everything from the layers below it. The vault's directory structure, frontmatter schemas, linking conventions, and agent skills are not arbitrary organizational choices — they are implementations of the ASR formalism.

## The research cycle

The vault operates through a cycle described in [The Research Cycle](../../writing/babbles/2026-03-04-the-research-cycle.md):

**Philosophy → Mathematics → Technology → Content → Questions → Research → Philosophy**

emsenn writes in [personal/writing/](../../writing/index.md). That writing mentions terms, topics, concepts, and whole disciplines that do not yet exist elsewhere in the vault. Agents, following the [ASR specification](../../../technology/specifications/agential-semioverse-repository/index.md), populate the missing structure. This reveals gaps — terms without clear definitions, contradictions, violations of the mathematical constraints. Sometimes answers exist in external research; sometimes they require new thinking. Either way, the answers come back as new writing, and the cycle starts again.

Philosophy and questions are the only parts that require generative creativity. Everything else is some form of encoding.

## Operational components

### Skills

The vault's executable capabilities. Core agent skills live in `.claude/skills/` (16 total); content-embedded skills live throughout the vault alongside the content they operate on (84+ skills).

Current core skills:
- **audit-content-folders** — find directories missing an index
- **audit-vault-references** — scan for broken internal references
- **check-note-style** — validate PTGAE style compliance
- **commit-repository** — stage and commit changes
- **cross-link-document** — add markdown links and citations (205 targets in config)
- **evaluate-slop** — assess slop content for promotion, revision, or deletion
- **fix-frontmatter** — normalize and repair frontmatter
- **make-content-folder** — create a directory with index
- **manage-tags** — clean and normalize tags and type fields
- **process-triage-note** — examine and place triage content
- **restructure-discipline** — reorganize discipline modules preserving links
- **review-lesson** — audit pedagogical quality
- **stabilize** — stabilize a relationality concept across all encodings (Markdown, TTL, SHACL, Lean)
- **walk-the-site** — explore the published site for friction points
- **write-learn-skill** — create learning skills for the curriculum graph
- **write-lesson** — write curriculum lessons
- **write-new-note** — create notes with correct frontmatter

See the [ASR skill manifests specification](../../../technology/specifications/agential-semioverse-repository/theory/skill-manifests.md) for the formal theory behind these.

### Workflows

Recurring patterns of agent work in the vault:

- **Triage processing** — reading unprocessed content from `triage/`, assessing quality, rewriting in PTGAE, placing in the correct discipline directory with proper frontmatter and links
- **Slop synthesis** — reading draft material from `slop/`, understanding it in terms of the published vocabulary, and integrating the ideas as proper published pages
- **Cross-linking** — finding orphaned pages and adding bidirectional markdown links between related content
- **Discipline building** — creating subdirectory structures, index pages, and content for new or underrepresented disciplines
- **Relationality synthesis** — reading source documents from `slop/relationality/` and creating concept, term, phenomenon, and process pages that make each idea intelligible through the published vocabulary

### The slop directory

`slop/` is the workspace for AI agents and for emsenn's rough drafts. Content is not published. It holds drafts, working notes, and intermediate outputs. Content moves out of slop into published directories only through deliberate synthesis work — not wholesale import.

### The triage directory

`triage/` is an inbox for content that needs processing. Files arrive here from various sources and are processed into the correct published location, rewritten as needed.

## Signal reception

The agential semioverse defines [interaction terms](../../../mathematics/objects/universes/interactive-semioverse/terms/interaction-term.md) and [interaction surfaces](../../../mathematics/objects/universes/interactive-semioverse/terms/interaction-surface.md) as the formal mechanisms by which external signal enters the system. In this vault, the primary external signal is emsenn's prompts.

Prompt routing is specified in the [prompt routing spec](../../../technology/specifications/agential-semioverse-repository/theory/prompt-routing.md). Skill manifest structure and validation are in the [skill manifests spec](../../../technology/specifications/agential-semioverse-repository/theory/skill-manifests.md). The work cycle is documented in CLAUDE.md.

Agent working state lives in the plans system at
`technology/specifications/agential-semioverse-repository/plans/`.
Session progress is recorded in each plan's log section; architectural
choices are recorded as decision records.

## Methodology

- [Research Methodology](./research-methodology.md) — how the vault's research practice enacts relational coherence

## Planning history

- [Planning the Emsemioverse](../../writing/babbles/2025-12-23-planning-the-emsemioverse.md) (2025-12-23) — early planning document establishing the repository/module/cell hierarchy
- [The Research Cycle](../../writing/babbles/2026-03-04-the-research-cycle.md) (2026-03-04) — the cycle that drives vault development
