---
name: relationality-triage-survey
date-created: 2026-04-04
scope: operations/engineering/triage/content/relationality/
total-files: ~107
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---


Survey of all content in `operations/engineering/triage/content/relationality/` for integration readiness into `library/`.

## Overview

The relationality triage directory contains the captain's original philosophical research program — a generative mathematics of relations built from a single primitive (reflexive witnessing), with applications spanning formal computation, semiotics, climate politics, internet infrastructure, and worldbuilding. The corpus divides into six natural clusters:

1. **Root-level philosophical/mathematical core** (8 files)
2. **Formal mathematics** (7 files) — the Semiotic Universe, Generative Sheaf Universe, and related constructions
3. **Cellular computation specifications** (12 files) — a complete implementation stack for the mathematics
4. **Semiotic tools documentation** (6 files) — publisher, semiotics introductions, QCHTTC machine spec
5. **Research papers** (7 files) — climate, internet infrastructure, politics, systems, math
6. **Personal writing** (67 files) — babbles (56) and fediverse posts (11)

---

## Summary Table: Core Content (non-babble, non-fediverse)

| File | Status | Library Domain | Notes |
|------|--------|---------------|-------|
| **ROOT-LEVEL** | | | |
| `relationality.md` | NEEDS EDITING | `science/math` | Core paper: "A Relational Generative Foundation for Computation and Geometry." 4528 lines. No frontmatter. Needs frontmatter, possible splitting into sections. |
| `on-relationality.md` | NEEDS EDITING | `science/math` | Full relational calculus derivation from Reflex. 2141 lines. No frontmatter. Companion registry referenced but not found. |
| `acts-derivation-trace.md` | NEEDS EDITING | `science/math` | Complete act encyclopedia (14813 lines). No frontmatter. Aggregation of all acts — reference document, not standalone text. |
| `_index.md` | READY | — | Minimal index page with frontmatter. Serviceable as-is for a domain index. |
| `README.md` | NEEDS EDITING | — | Repository documentation for SSCU implementation. No frontmatter. Mix of system docs and conceptual overview. |
| `FRONTMATTER_SCHEMA.md` | READY | — | Schema spec for act/structure/operator frontmatter. Has frontmatter. Useful as internal reference. |
| `TODO.md` | NEEDS EDITING | — | 8-phase implementation roadmap. No frontmatter. Operational planning doc, not library content. |
| `archive/relational-unit.md` | READY | — | Supersession notice (Unit → Entity). Has frontmatter. Clean historical record. |
| **FORMAL MATHEMATICS** | | | |
| `math/relationality/index.md` | NEEDS RESEARCH | `science/math` | Stub (~5% complete). Has frontmatter. Placeholder linking to systems not yet written. |
| `math/objects/topoi/hypertensor-topos-math-paper.md` | NEEDS EDITING | `science/math/categories` or `science/math/topology` | Generative Sheaf Universe axioms (A0-A6). ~80-90% complete. Has frontmatter. Uses current nomenclature. Section 7 worked examples missing (noted as not ported). |
| `math/objects/topoi/quasicrystalline-hypertensor-topos-specification-raw.md` | NEEDS EDITING | — | Raw source with dialogue scaffolding (ChatGPT conversation). ~65K tokens. Has frontmatter. Contains unique worked examples not in cleaned version. Preserve as source but don't integrate directly. |
| `math/objects/topoi/quasicrystalline-hypertensor-topos-specification.md` | NEEDS EDITING | `science/math/categories` | Cleaned legacy-nomenclature version. Has frontmatter. Retains Section 7 worked examples. Port examples to current-nomenclature paper, then archive. |
| `math/objects/universes/semiotic-universe.md` | NEEDS EDITING | `science/math` or new `science/math/domains/semiotics` | Foundational: Heyting-comonadic semantics, fusion as reflection. ~70% complete. Has frontmatter. Closest to publishable of the math papers. |
| `math/objects/universes/stewardable-semiotic-concept-universe.md` | NEEDS RESEARCH | `science/math` | Extends semiotic-universe with annotation, provenance, stewardship. ~25% complete. Has frontmatter. Architectural sketch — sections 2-9 unwritten. |
| `math/objects/universes/generative-fibered-recognition-trace-universe.md` | NEEDS RESEARCH | `science/math` | Three fixed-point framework (sheafification, stabilization, generative closure). ~30% complete. Has frontmatter. Sections 2+ are headers without content. |
| **CELLULAR COMPUTATION** | | | |
| `docs/tools/cellular-computation/cce.md` | READY | `engineering/tech/computing` | Core CCE spec (Layer 3). Highly polished normative specification. Has frontmatter. |
| `docs/tools/cellular-computation/cds.md` | READY | `engineering/tech/computing` | Cellular Data Serialization (Layer 2). Complete normative spec with JSON schema. Has frontmatter. |
| `docs/tools/cellular-computation/rtl.md` | READY | `engineering/tech/computing` | Recognition Term Language (Layer 2). Complete with examples. Has frontmatter. |
| `docs/tools/cellular-computation/cce-abi.md` | READY | `engineering/tech/computing` | Binary interface spec (Layer 4). Complete with conformance vectors. Has frontmatter. |
| `docs/tools/cellular-computation/cce-rpc.md` | READY | `engineering/tech/computing` | Remote procedure call spec (Layer 5). Complete with fixtures. Has frontmatter. |
| `docs/tools/cellular-computation/cds-storage.md` | READY | `engineering/tech/computing` | Storage substrate spec (Layer 2s). Complete. Has frontmatter. |
| `docs/tools/cellular-computation/node.md` | READY | `engineering/tech/computing` | Node runtime spec. Complete. Has frontmatter. |
| `docs/tools/cellular-computation/node-cycle.md` | READY | `engineering/tech/computing` | Node lifecycle spec. Complete. Has frontmatter. |
| `docs/tools/cellular-computation/node-addressing.md` | READY | `engineering/tech/computing` | Addressing/URI spec. Complete. Has frontmatter. |
| `docs/tools/cellular-computation/rdf-profile.md` | READY | `engineering/tech/computing` | RDF/JSON-LD projection (Layer 6). Complete. Has frontmatter. |
| `docs/tools/cellular-computation/cdf.md` | NEEDS EDITING | `engineering/tech/computing` | Alternative/draft CDS spec. Has frontmatter. Reconcile with cds.md or archive as superseded. |
| `docs/tools/cellular-computation/development-roadmap.md` | NEEDS EDITING | — | Planning document. Too large to fully assess. Operational, not library content. |
| **SEMIOTIC TOOLS** | | | |
| `docs/tools/semiotic-publisher-script/semiotic-publisher.md` | NEEDS EDITING | `engineering/tech/computing` or `science/information/knowledge-systems` | Comprehensive publisher documentation. Has frontmatter. Needs domain decision: is this library knowledge or operational docs? |
| `docs/tools/semiotic-publisher-script/semantics-syntax-and-semiotics.md` | NEEDS EDITING | `science/linguistics` or `humanities/philosophy` | Accessible intro to three lenses (syntax, semantics, semiotics). Has frontmatter. Draft, needs completion. |
| `docs/tools/semiotic-publisher-script/what-is-semiotics.md` | NEEDS EDITING | `science/linguistics` or `humanities/philosophy` | Educational intro to semiotics. Has frontmatter. Draft. |
| `docs/tools/semiotic-publisher-script/signs-signals-and-systems.md` | NEEDS EDITING | `science/information` | Practical semiotics for vault systems. Has frontmatter. Draft bridge document. |
| `docs/tools/qchttc/quasicrystalline-hypertensor-topos-machine-specification.md` | NEEDS EDITING | `engineering/tech/computing` | Machine spec. File too large for single-pass assessment. Has frontmatter. Needs review. |
| `docs/tools/hive-auto-ledger/index.md` | NEEDS EDITING | `engineering/tech/computing/blockchain/Hive` | HAL trading platform spec. Has frontmatter. Operational/product doc, not theoretical. |
| **RESEARCH PAPERS** | | | |
| `research/climate/2c-never-plausible/2c-was-never-plausible.md` | READY | `science/cosmology` or new `science/domains/climate` | Major essay: 2C target was never physically plausible. 435 lines, 11 citations. Highly polished. Has frontmatter. |
| `research/climate/2c-never-plausible/README.md` | READY | — | Directory description. One sentence. Has frontmatter. |
| `research/internet/web/activitypub/dead-zone/activitypub-insurrection-deadzone.md` | READY | `engineering/tech/computing/internet/activitypub` or `humanities/sociology` | Standardization as counterinsurgency. ~320 lines, extensive citations. Publishable quality. Has frontmatter. |
| `research/internet/web/accepting-the-web-as-a-platform-not-a-place.md` | NEEDS RESEARCH | `engineering/tech/computing/internet` | Early-stage notes on territorial vs. platform web presence. Has frontmatter. Core concepts identified but not developed. |
| `research/systems/reworking-gnoponemacs-as-a-ritm-tool.md` | NEEDS EDITING | — | Technical spec for Emacs-as-RITM-tool. Has frontmatter. Operational/tooling doc, not library content per se. |
| `research/politics/exploring-the-semantics-of-late-marx-citers.md` | NEEDS RESEARCH | `humanities/sociology` or `humanities/philosophy` | Corpus linguistics methodology with Python scripts. Has frontmatter. Experiment designed but not run. |
| `research/math/testing-collatz-stabilization-with-ritm.md` | NEEDS RESEARCH | `science/math/number-theory` | Computational study applying RITM to Collatz conjecture. Has frontmatter. Code complete, no results or interpretation. |

---

## Summary Table: Personal Writing

### Babbles with Novel Theoretical Content

| File | Status | Library Domain | Notes |
|------|--------|---------------|-------|
| `babbles/adapting-in-a-world-that-wont-hold-key.md` | NEEDS EDITING | `humanities/philosophy` or `science/information` | Extended essay on stationarity, ergodicity, and climate adaptation through music metaphor. Jazz/Indigenous communal music as models for non-ergodic adaptation. Has frontmatter. High theoretical content. |
| `babbles/2025-12-12-measuring-ideologies.md` | NEEDS EDITING | `humanities/philosophy` or `humanities/sociology` | Novel measurement axis for ideologies: homogeneity requirements. Stationarity, ergodicity, exchangeability as hidden assumptions. Has frontmatter. |
| `babbles/2025-09-04-1957-paracosms-and-secondary-worlds.md` | NEEDS EDITING | `humanities/writing` or `humanities/philosophy` | Distinguishes paracosm (psychological) from secondary world (literary). Develops coherent integrating framework. Has frontmatter. |
| `babbles/learn-with-me-systems-emergence-and-standardization.md` | NEEDS EDITING | `science/information/cybernetics` | Counter-emergence thesis: standardization reduces system adaptability. Emergence profile measurement proposed. Has frontmatter. |
| `babbles/2025-09-03-0954-on-zen-fascism-and-californication.md` | NEEDS EDITING | `humanities/philosophy` or `humanities/sociology` | Political-aesthetic critique: californication as liberal contradiction management, zen fascism as crisis commodification. Has frontmatter. |
| `babbles/2025-07-24-encoding-relational-dynamics-in-gnoponemacs.md` | NEEDS EDITING | — | Tekodynamics, titling as first act of differentiation. Has frontmatter. Bridges theory and implementation. More operational than library. |
| `babbles/2025-09-16-1825-drafting-moscow-semiotics-in-fennel.md` | NEEDS EDITING | `science/linguistics` or `engineering/games/computer-games` | Moscow School semiotics implemented in Fennel for MUD. Has frontmatter. Moderate theory, more implementation-focused. |
| `babbles/2025-07-20-connecting-teraum-to-okagan-paracosm.md` | NEEDS RESEARCH | — | Worldbuilding notes connecting paracosms. Has frontmatter. Paracosmic content, not library-ready. |

### Babbles with Moderate or Minimal Theoretical Content

| File | Status | Notes |
|------|--------|-------|
| `babbles/2020-01-19-anatomy-of-things.md` | NEEDS EDITING | Lambda-calculus MUD tutorial. Could fit `engineering/games/.../muds/`. |
| `babbles/2023-12-09-on-hospicing-humanity.md` | NEEDS RESEARCH | One-sentence fragment. Seed idea, not developed. |
| `babbles/2025-07-19-on-a-history-of-jingle-dress-cones.md` | NEEDS EDITING | Material culture critique. Could fit `humanities/philosophy/indigenous`. |
| `babbles/2025-08-26-0923-on-hating-ai-and-performing-normativity.md` | NEEDS RESEARCH | Brief political observation. Not developed enough. |
| `babbles/2024-04-29-babble.md` | NEEDS RESEARCH | Personal log. No theoretical content. |
| `babbles/2016-09-17-planning-mud-skillchecks.md` | NEEDS EDITING | MUD skillcheck design. Could fit `engineering/games/.../muds/`. |
| `babbles/2025-09-02-2005-linguistic-pragmatics-and-ludimatics.md` | NEEDS RESEARCH | Sketches "ludimatics" concept. Not developed. |
| `babbles/2025-09-02-0859-on-centering-the-making-of-dirt.md` | NEEDS RESEARCH | Brief praxis note. Not developed. |
| `babbles/2025-08-29-1912-lineage-of-californication.md` | NEEDS RESEARCH | Fragmentary theory outline. Incomplete. |

### Remaining Babbles (35 files) — Journaling/Personal/Technical

These babbles are primarily personal journaling, technical troubleshooting (GnoponEmacs, org-roam, tab installation), daily planning, political commentary, or creative writing. They contain seeds of ideas but are not individually library-ready. They should be preserved as primary source material. Notable clusters:

- **Stop Cop City** (3 files): Political analysis of RICO charges and movement dynamics
- **Californication** (2 files): Critique of liberal affect management (see theoretical babbles above)
- **GnoponEmacs** (5+ files): Technical logs of Emacs configuration work
- **Fediverse/platforms** (3+ files): Cruel optimism, normativity, platform politics
- **Gardening** (1 file): Container garden notes
- **Creative writing** (2 files): Story fragments, worldbuilding

### Fediverse Posts (11 files)

Short social media posts from Kolektiva. These are published artifacts documenting public intellectual positions. Not individually library-ready but serve as provenance for ideas developed in babbles and research papers. Preserve as-is.

### Other Agent Content

| File | Status | Notes |
|------|--------|-------|
| `agents/dreamfield/dreamfield.md` | NEEDS RESEARCH | Agent specification. Needs assessment of current relevance. |
| `agents/emsenn/emsenn-net/emsenn-website.md` | NEEDS EDITING | Website specification. Operational doc. |

---

## Readiness Breakdown

| Status | Count | Percentage |
|--------|-------|-----------|
| READY | 14 | ~13% |
| NEEDS EDITING | 26 | ~24% |
| NEEDS RESEARCH | 67 | ~63% |

### READY files (14) — can move to library with minor edits

The 10 cellular computation specs are the standout ready content: complete, normative, internally consistent, with frontmatter. They form a coherent specification stack (Layers 2-6) and should move together.

The climate essay and ActivityPub dead-zone paper are publication-quality research.

### NEEDS EDITING files (26) — valuable but need work

The three core mathematical texts (`relationality.md`, `on-relationality.md`, `acts-derivation-trace.md`) are the intellectual heart of the collection but lack frontmatter and are very large. They need:
- Frontmatter addition
- Domain placement decisions (new `science/math/domains/relationality/`?)
- Possible splitting of the 14K-line acts trace into per-act files
- Nomenclature harmonization (nucleus/flow → stabilizer/drift)

The universe papers need Section 7 examples ported from the legacy spec before archiving it.

The theoretical babbles (adapting, measuring ideologies, paracosms, emergence/standardization, zen fascism) contain novel philosophical claims that deserve to be library texts, but need restructuring from babble form into proper text form.

### NEEDS RESEARCH files (67) — incomplete or undeveloped

Mostly babbles and fediverse posts that are raw primary source material. The math stubs and incomplete experiments (Collatz, Marx citers) need significant further development. These should remain in triage as source material to draw from.

---

## Recommended Integration Order

**Phase 1: Cellular Computation Stack** (10 READY files)
- Create `library/theories/engineering/theories/tech/theories/computing/theories/cellular-computation/`
- Move all 10 specs as a coherent unit
- Minimal edits: verify frontmatter consistency, add cross-references

**Phase 2: Research Papers** (2 READY files)
- `2c-was-never-plausible.md` → `library/theories/science/` (may need new climate domain)
- `activitypub-insurrection-deadzone.md` → `library/theories/engineering/theories/tech/theories/computing/theories/internet/theories/activitypub/texts/`

**Phase 3: Core Mathematics** (3 NEEDS EDITING files)
- Create `library/theories/science/theories/math/theories/relationality/`
- `semiotic-universe.md` first (most complete, foundational)
- `hypertensor-topos-math-paper.md` second (port Section 7 examples first)
- `relationality.md` third (the big paper, may need splitting)

**Phase 4: Theoretical Babbles → Library Texts** (5 NEEDS EDITING files)
- Each becomes a proper text in its domain after restructuring
- `adapting-in-a-world-that-wont-hold-key.md` → philosophy or information science text
- `measuring-ideologies.md` → philosophy or sociology text
- `paracosms-and-secondary-worlds.md` → writing or philosophy text
- `emergence-and-standardization.md` → cybernetics or information science text
- `zen-fascism-and-californication.md` → philosophy or sociology text

**Phase 5: Semiotics Introduction Suite** (3 NEEDS EDITING files)
- The three semiotics intro docs form a natural teaching sequence
- Domain: `science/linguistics` or `humanities/philosophy` (need decision)

---

## Open Questions

1. **New domain needed?** The core math doesn't fit neatly into existing `science/math/` subdomains. A `science/math/domains/relationality/` would house the act calculus, semiotic universe, and generative sheaf universe.

2. **Nomenclature freeze?** The papers use mixed old (nucleus/flow, hypertensor) and new (stabilizer/drift, generative-sheaf-universe) terminology. Should legacy nomenclature be updated before integration, or preserved with concordance?

3. **Acts trace handling?** The 14K-line `acts-derivation-trace.md` is a generated aggregation. Should it be split into individual act files, or kept as a reference document alongside per-act files?

4. **Babble preservation?** The babbles are primary source material documenting the evolution of ideas. Should they stay in triage permanently, move to a library archive, or be processed into term/text extractions?

5. **Cellular computation placement?** These specs describe an unbuilt system grounded in the mathematics. Are they library content (published knowledge) or operational specs? They read as publishable technical standards.
