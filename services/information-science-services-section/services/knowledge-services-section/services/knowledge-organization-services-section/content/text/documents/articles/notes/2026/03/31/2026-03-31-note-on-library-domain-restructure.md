---
title: Library Domain Restructure
science-owner: knowledge-organization-services-section
description: Detailed plan for reorganizing a library from 27 flat domains into three hierarchical top-level domains aligned with distinct epistemological methods.
date-created: 2026-03-31
type: note
name: library-domain-restructure
keywords:
  - domain-restructure
  - locale-theory
  - epistemological-method
  - knowledge-organization
specialization: plan
department: engineering
in-service-of: lib/emsenn/services/561-group/services/561-group-services-section
---


## Goal
Restructure the library from 27 flat top-level domains into three top-level domains (science, humanities, engineering) that mirror the three operational departments. Each top-level domain is a locale — defined by distinct teleology and distinct method. Create `library/terms/` and `library/texts/` for foundational cross-domain concepts. Then enter each domain and organize its subdomains according to the locale test.

The three domains and their methods:
- **science** — proof, observation, measurement, falsification
- **humanities** — interpretation, argument, social analysis, hermeneutics
- **engineering** — build, test, iterate, "does it work?"

## Existing Material
- `library/information/terms/discipline.md` — defines discipline as "a domain of knowledge with its own methods"
- `library/math/terms/generative-universe-closure-locale.md` — locale defined by distinct teleology + distinct method
- `library/math/terms/locale.md` — mathematical foundation (complete Heyting algebra, pointfree topology)
- `library/relationality/terms/relational-entity.md` — growth stages: Outpost → Blueprint → Charter → Locale
- `library/information/theories/knowledge-systems/terms/domain-analysis.md` — Hjørland's framework (being written)
- `library/information/theories/knowledge-systems/terms/integrative-levels.md` — complexity ordering (being written)
- `library/sociology/theories/critical-theory/terms/epistemic-culture.md` — Knorr-Cetina (being written)
- `operations/engineering/fars/graph/` — query.py, edges.py, node.py for structural analysis

## Steps

### Step 1: Create top-level structure and move domains [DONE 2026-03-31]

**Context brief:** The library currently has 27 top-level directories directly under `library/`. We need to create `library/theories/`, `library/terms/`, `library/texts/`, then create three top-level domain directories (`library/theories/science/`, `library/theories/humanities/`, `library/theories/engineering/`) each with `_index.md`, `domains/`, `terms/`, `texts/`. Then `git mv` all 27 current domains into the appropriate top-level domain as subdomains. After moving, update all internal cross-references (grep for `library/biology/`, `library/tech/`, etc.) across the entire repo — library content, `.claude/` skills/commands/hooks, `operations/` tools, `CLAUDE.md`, `AGENTS.md`.

**Initial domain placement:**

Science (method: proof, observation, measurement):
- math, relationality, linguistics, information, biology, cosmology, ecology, medicine, neurology, science

Humanities (method: interpretation, argument, social analysis):
- philosophy, writing, media, music, spirituality, sociology, economics, business, education

Engineering (method: build, test, iterate):
- engineering, fabrication, tech, design

Hard cases requiring splitting:
- militarism → split: strategic-studies (humanities), martial-arts (engineering)
- domesticity → engineering (practical knowledge for sustaining a household)
- games → engineering (play-as-practice, game design) with possible split for game theory (science)
- general → dissolve: foundational terms to `library/terms/`, people to their disciplines, events to sociology, remainder distributed

**Tasks:**
1. Create `library/theories/`, `library/terms/`, `library/texts/`
2. Create `library/theories/science/`, `library/theories/humanities/`, `library/theories/engineering/` with `_index.md` files defining each by teleology and method
3. `git mv` each current domain into the appropriate top-level domain's `domains/` directory
4. Handle militarism split: scan content, create two new domains, distribute files
5. Distribute `library/general/` — move foundational terms to `library/terms/`, distribute the rest
6. Update all references repo-wide (library cross-refs, .claude/, operations/, CLAUDE.md, AGENTS.md)
7. Verify graph tools still work with new paths
8. Run `/verify full` to catch broken links

**Depends on:** nothing
**Verify:** `python operations/engineering/fars/graph/query.py type term` returns results from the new paths. No broken internal links. Git history preserved (git mv, not delete+create).
**If unclear:** Ask user about specific placement decisions for ambiguous domains. Ask about militarism split — what content goes where.

### Step 2: Organize science subdomains [DONE 2026-03-31]

**Context brief:** After Step 1, `library/theories/science/theories/` contains: math, relationality, linguistics, information, biology, cosmology, ecology, medicine, neurology, science. These need to be assessed as locales — each should have distinct teleology and distinct method. Some may need merging (neurology into biology? science into a parent?), splitting, or internal reorganization. Use `query.py` and `edges.py` to understand the current structure and connectivity of each subdomain before changing anything.

The locale test: "Two locales with different content but identical logic are the same locale. Two scopes with different logic are different locales even if they share content."

For each subdomain:
1. Read its `_index.md` and sample terms/texts
2. Articulate its teleology and method
3. Check if it's truly distinct from sibling domains
4. Reorganize internal `domains/` structure if needed
5. Ensure cross-references are updated

**Tasks:**
1. Audit each science subdomain: read content, determine teleology and method
2. Merge or split where the locale test requires it
3. Write/update `_index.md` for each domain with explicit teleology and method statements
4. Update internal cross-references
5. Run `/verify graph` on changed files

**Depends on:** Step 1
**Verify:** Each science subdomain has an `_index.md` stating its teleology and method. No two subdomains share both. Graph connectivity preserved.
**If unclear:** The boundary between math and relationality — is relationality a subdomain of math, or a peer? Ask the user.

### Step 3: Organize humanities subdomains [DONE 2026-03-31]

**Context brief:** After Step 1, `library/theories/humanities/theories/` contains: philosophy, writing, media, music, spirituality, sociology, economics, business, education, plus strategic-studies (from militarism split). Same process as Step 2 — assess each as a locale, merge/split as needed.

Key tensions to resolve:
- sociology vs economics vs business — do these share method? Sociology uses ethnography/critical theory; economics uses modeling/statistics; business uses case study/management theory.
- writing vs media vs music — do these share method? All involve interpretive/creative work but with different materials and traditions.
- spirituality — what is its method? Contemplative practice? Textual interpretation? This may need splitting or reclassification.

**Tasks:**
1. Audit each humanities subdomain: read content, determine teleology and method
2. Merge or split where the locale test requires it
3. Write/update `_index.md` with teleology and method
4. Update internal cross-references
5. Run `/verify graph` on changed files

**Depends on:** Step 1
**Verify:** Each humanities subdomain has an `_index.md` stating its teleology and method. No two share both. Graph connectivity preserved.
**If unclear:** Whether economics belongs in humanities or science (econometrics is empirical). Ask the user.

### Step 4: Organize engineering subdomains [DONE 2026-03-31]

**Context brief:** After Step 1, `library/theories/engineering/theories/` contains: engineering, fabrication, tech, design, domesticity, games, plus martial-arts (from militarism split). Same locale audit process.

Key tensions:
- engineering (the subdomain) shares a name with engineering (the top-level domain). May need renaming — perhaps `mechanical-engineering` or `civil-engineering` depending on content.
- design straddles engineering and humanities (functional vs aesthetic). Check what the content actually covers.
- domesticity and games may need further internal organization.

**Tasks:**
1. Audit each engineering subdomain
2. Resolve the engineering-under-engineering naming issue
3. Merge or split as needed
4. Write/update `_index.md` with teleology and method
5. Update internal cross-references
6. Run `/verify graph`

**Depends on:** Step 1
**Verify:** Same as Steps 2-3.
**If unclear:** Whether design belongs in engineering or humanities. Ask the user about the content emphasis.

### Step 5: Populate library/terms/ and library/texts/ [DONE 2026-03-31]

**Context brief:** `library/terms/` and `library/texts/` are for foundational concepts that cross all three top-level domains — things like "thing," "object," "person," "energy," "information," "knowledge," "domain" itself. During Step 1, foundational terms from `library/general/` were moved here. This step reviews what's there, ensures quality, and adds any missing foundational terms.

Also: the term "domain" itself should be defined here (or in science/information) drawing on all the research done — the locale definition, Hjørland, Knorr-Cetina, the demarcation problem.

**Tasks:**
1. Review terms moved from general/ — are they truly cross-domain?
2. Write a `library/terms/domain.md` term that synthesizes the locale definition with information science and epistemology research
3. Ensure each top-level term links to relevant domain-specific terms
4. Write any missing foundational terms
5. Run `/verify full`

**Depends on:** Steps 1-4
**Verify:** `library/terms/` contains only genuinely cross-domain concepts. Each has proper frontmatter and links. The term "domain" exists and is well-grounded.

## Parallel Groups
- Steps 2, 3, 4 can run in parallel (independent subdomain audits)

## Open Questions (resolved)
- Relationality: confirmed as peer science domain (Step 2, session 1)
- Economics: stays in humanities (social analysis method)
- Engineering subdomain naming: resolved by promoting aerospace-engineering to parent (Step 4, session 1)
- People directory: moved to `library/reference/people/` as cross-cutting reference (Step 1, session 1)
- Top-level _index.md ↔ operations departments: not done, deferred

## Remaining Work (out of scope for this blueprint)
- `library/terms/domain.md` synthesis term not written — needs locale definition + Hjørland + Knorr-Cetina
- ~22K pre-existing broken links from prior restructures
- `library/reference/unsorted/` (105 files) needs sorting into proper domains

## Mutation Log

### Step 1 — 2026-03-31
- Created `library/theories/`, `library/terms/`, `library/texts/`
- Created `_index.md` for science, humanities, engineering with teleology+method definitions
- `git mv` all 27 domains into their top-level domain's `domains/` directory
- Militarism moved whole to humanities (content is overwhelmingly strategic analysis, no martial-arts content to split)
- Dissolved general/: 23 foundational terms (thing, object, person, energy, mass, etc.) → `library/terms/`, remainder → `humanities/domains/general/`
- Fixed 1,356 cross-top-level-domain relative links programmatically
- Fixed 947 general/people/ → general/domains/people/ path corrections
- Updated `query.py` `domain_to_path()` to search `library/theories/*/theories/` for subdomain resolution
- ~22K pre-existing broken links remain (old directory names like `mathematics/`, `concepts/`, `structure/`, `404.md`) — not caused by this restructure
- Graph tools verified: `--domain math` (106 terms), `--domain science` (433 terms), full search (1582 terms)

### Step 3 — 2026-03-31
- Assessed all humanities subdomains against locale test (distinct teleology + distinct method)
- Split militarism into three: promoted `intelligence` (195 files, epistemological analysis) and `military-command` (87 files, doctrinal/institutional analysis) to peer humanities subdomains; folded `telekinetics` (1 file) into military-command
- Moved militarism root terms (captain, cargo, command-station, etc.) to military-command/terms/
- Promoted `divination` from spirituality subdomain to peer humanities subdomain (semiotic sign-reading method)
- Spirituality retains christianity/solomonic-occultism (ritual/contemplative practice)
- Moved EASR (educational-agential-semioverse-repository) from education subdomain to `operations/engineering/fars/` (tooling infrastructure, not domain knowledge)
- Deleted empty `humanities/domains/general/` shell (0 files, content already in `library/reference/`)
- Wrote/updated `_index.md` with teleology and method statements for all 12 humanities subdomains
- Fixed cross-references: militarism paths in intelligence (7 files) and military-command (17 files), spirituality paths in divination (12 files)

### Step 5 — 2026-03-31
- Wrote 5 stub terms: conversation, definition, force, information, list
- Rewrote information.md (replaced Wikipedia quote with original definition grounded in Shannon/Bateson)
- Rewrote mass.md and matter.md (fixed broken links to deleted slop/ directories, replaced AI-generated content)
- Rewrote tool.md (fixed broken slop/ links)
- Normalized frontmatter across all 23 terms in `library/terms/`: added `type: term`, `description`, `date-modified` where missing
- `library/texts/` left empty for now — no synthesis term (domain.md) written this session
