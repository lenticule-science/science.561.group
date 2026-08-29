---
title: "Specification treatment for emsdeavor concepts"
date-created: 2026-03-08T00:00:00
authors:
  - claude
status: draft
priority: high
depends-on: [33]
goal: "006"
---

## Summary

Give each concept that the emsdeavor depends on the full specification
treatment, building bottom-up through the dependency graph so each
layer has a proper home before the layer above it needs to reference
it. For method concepts (layer 5), ground each concept in its home
discipline(s) first — the semiotic-* convention ASSEMBLES from
discipline knowledge, it doesn't invent from scratch.

## Motivation

The emsdeavor sits atop a layered conceptual stack (see the conceptual
dependency map). Each layer contains concepts that need the
specification treatment — the pattern completed for "specification":

1. concept page (what the thing is, in its home discipline)
2. general specification (conformance requirements for the concept)
3. semiotic convention (how the concept works in semiotic universes)
4. semiotic conformance spec (requirements for the semiotic version)
5. make skills where operational

Currently only "specification" has this full chain. Without it, agents
conflate general concepts with their semiotic specializations, put
files in wrong locations, and spend tokens searching for conventions
that should be at deterministic paths.

### The assembly principle

The semiotic-* specifications should be ASSEMBLIES of discipline
knowledge, not standalone inventions. The build direction is:

    discipline research → concepts/terms → general spec → semiotic convention

For example, semiotic-policy shouldn't define governance from scratch.
Governance has deep roots in sociology (`governmentality.md`,
`institution.md`, `horizontal-organization.md` already exist), FOSS
practice, and anarchist organizing theory. The general concept of
"policy" should have coverage in those disciplines, and THEN
semiotic-policy assembles what's relevant to semiotic universes
because it matches the formalism and/or philosophy.

This aligns with policy 003 (ground in discipline practice) and
policy 006 (research produces texts). It also means we build reusable
discipline knowledge that serves purposes beyond the emsdeavor.

### The ASR flattening problem

The ASR directory is the worst case of concepts being flattened into
one place. It currently contains content from at least 3 layers:

**Layer 1-2 concepts misplaced in ASR concepts/**:
`closure-pressure.md`, `composite-semioverse.md` — mathematical
objects that belong in mathematics/.

**Layer 3 theory misplaced in ASR theory/**:
`agent-skill-interaction.md`, `prompt-routing.md`,
`work-unit-lifecycle.md`, `multi-agent-coordination.md`,
`operational-closure.md`, `coordination-patterns.md`,
`conditional-skill-invocation.md`, `questions-as-first-class-objects.md`
— these describe how agential semioverses work in general, not how
THIS repository works specifically.

**Layer 5 content misplaced in ASR**:
`policy.md` concept, `planning-methodology.md`,
`semantic-frontmatter.md` — these belong to their respective
semiotic-* specification directories.

Meanwhile the actual agential semioverse directory at
`mathematics/objects/universes/agential-semioverse/` has only 4 files.

## Concept inventory with discipline homes

### Structural concepts (layers 0-4)

| Layer | Concept | Home discipline | Existing coverage | Chain status |
|-------|---------|----------------|-------------------|:------------:|
| 0 | relationality | philosophy | stub | emsenn's work |
| 1 | semiotic universe | mathematics | `mathematics/objects/universes/semiotic-universe/` (draft) | concept only |
| 2 | interactive semioverse | mathematics | `mathematics/objects/universes/interactive-semioverse/` (draft) | concept only |
| 3 | agential semioverse | mathematics | 4 files at math/ + 8 misplaced in ASR theory/ | partial, scattered |
| 3 | agent | mathematics (+ philosophy, sociology) | none at layer 3; referenced throughout | missing |
| 3 | tool | mathematics (+ technology) | none at layer 3 | missing |
| 3 | norm | mathematics (+ sociology, philosophy) | sociology has `governmentality`, `institution` | missing at layer 3 |
| 3 | skill | mathematics (+ technology) | none at layer 3; only at ASR layer 4 | missing |
| 4 | ASR | technology | `technology/specifications/agential-semioverse-repository/` | partial, bloated |

### Method concepts (layer 5) with discipline sources

| Concept | Semiotic convention | Discipline home(s) | Existing discipline coverage | Chain status |
|---------|:------------------:|-------------------|------------------------------|:------------:|
| specification | ✅ | technology | ✅ `technology/concepts/specification.md` | ✅ complete |
| markdown | ✅ | technology (markup languages) | ❌ no concept page | partial |
| endeavor | ✅ (v0.8) | multiple (see derivation texts) | derivation texts from TCCC, insurgent, disaster, military, medicine, FOSS, MUD, Starfleet | partial |
| project-management | ✅ | business, militarism, FOSS | `planning-methodology.md` misplaced in ASR | partial |
| versioning | ✅ | technology (software engineering) | ❌ | partial |
| changelog | ✅ | technology (software engineering) | ❌ | partial |
| policy | ✅ | sociology (governance), FOSS, philosophy | sociology has `governmentality.md`, `institution.md`, `horizontal-organization.md`, `anarchism.md`, `prefigurative-politics.md` | partial |
| triage | ✅ | medicine (original concept), information science | ❌ no concept page in medicine/ | partial |

### Instance layer (layer 6)

| Concept | Status |
|---------|--------|
| emsemioverse | `personal/projects/emsemioverse/index.md` exists; IS the composition |

## Execution strategy

### The dependency graph determines build order

The conceptual dependency map edges form a DAG. The optimal execution
order is a topological sort — build each node only after its
dependencies exist. This means bottom-up through the layers, with
discipline grounding at each step.

### Quickest wins first within each tier

Within each tier, prioritize by:
1. How much existing content can be relocated (mechanical work)
2. How much discipline coverage already exists (less research needed)
3. How many dependents are unblocked

### Execution phases

**Phase 1: Decompress the ASR (highest leverage, mostly mechanical)**

The ASR flattening is the single biggest source of misplaced content.
Decompressing it is mostly relocation, not creation.

1. Audit each ASR theory/ file — classify as layer 3 (agential
   semioverse general) vs layer 4 (this repository specific)
2. Relocate layer 3 content to `mathematics/objects/universes/
   agential-semioverse/`
3. Relocate layer 1-2 concepts (`closure-pressure.md`,
   `composite-semioverse.md`) to appropriate math directories
4. Relocate layer 5 content (`policy.md` → semiotic-policy,
   `planning-methodology.md` → semiotic-project-management,
   `semantic-frontmatter.md` → semiotic-markdown)
5. Verify the agential semioverse mathematical definition is sound
   after receiving the relocated content

**Phase 2: Ground method concepts in their disciplines**

For each layer 5 concept, check whether its home discipline(s) have
adequate coverage. If not, the first step is discipline-level research
and concept creation — NOT writing the semiotic-* spec.

| Concept | What discipline coverage is needed |
|---------|-----------------------------------|
| markdown | technology concept page for markup languages |
| policy | sociology coverage of governance may already suffice; check FOSS governance in technology |
| triage | medicine concept page for medical triage; information science coverage |
| project-management | business/PM schools; check militarism for planning doctrines |
| versioning | technology concept for software versioning practices |
| changelog | technology concept for change tracking practices |

Endeavor already has extensive derivation texts grounding it across
multiple disciplines.

**Phase 3: Build general specifications**

For each concept that now has discipline grounding:

1. Create concept page in technology/concepts/ (or appropriate
   discipline) if it doesn't exist
2. Create {concept}-specification using make-specification — the
   general conformance scaffold, written FROM the discipline knowledge

**Phase 4: Complete semiotic chains**

For each concept with a general spec:

1. Verify the existing semiotic-{concept} references the general spec
2. Create semiotic-{concept}-specification using
   make-semiotic-specification
3. Create make skills where operational

**Phase 5: Verify the stack**

Walk the dependency graph top-down and verify:
1. Each edge in the conceptual dependency map has both endpoints
   properly chained
2. The ASR contains only layer 4 content + operational infrastructure
3. Each semiotic-* spec references its general spec and discipline
   sources

## Where semiotic-* content needs to decompose

Some current semiotic-* content actually belongs in external
disciplines. The semiotic-* layer should assemble FROM those
disciplines, not contain the discipline knowledge itself.

| Semiotic spec | Content that may belong elsewhere | Target discipline |
|--------------|----------------------------------|-------------------|
| semiotic-policy | General governance theory, policy lifecycle patterns | sociology (governance theory), FOSS governance practices |
| semiotic-project-management | General PM methodology, cycle theory | business (PM schools), technology (FOSS PM) |
| semiotic-triage | General triage theory, priority sorting | medicine (triage origins), information science |
| semiotic-endeavor | Already well-decomposed via derivation texts | multiple (documented in X1-X3, X7) |
| semiotic-markdown | General markup language conventions | technology (markup languages) |
| semiotic-versioning | General version semantics | technology (semantic versioning) |
| semiotic-changelog | General change tracking conventions | technology (software engineering) |

## Done when

- [ ] Phase 1: ASR decompressed (layer 3 → math/, layer 5 → specs)
- [ ] Phase 2: discipline coverage verified or created for each concept
- [ ] Phase 3: general specifications exist for all method concepts
- [ ] Phase 4: semiotic chains complete (semiotic-X-specification for
      each semiotic-X that needs one)
- [ ] Phase 5: dependency graph walk passes — all edges have
      properly-chained endpoints
- [ ] Conceptual dependency map updated with all new nodes
- [ ] Plan 0033 log updated

## Dependencies

- specification-specification and make-specification skill (complete)
- semiotic-specification-specification and make-semiotic-specification
  skill (complete)
- Plan 0033 (active, provides the semiotic layer context)

## Log

**2026-03-08** — Created. Initially scoped to only Layer 5 method
aspects. Revised to include the full conceptual stack (layers 0-6)
after emsenn pointed out that structural concepts (semiotic universe,
agential semioverse, agents, etc.) are what the method aspects carry
and also need chains.

**2026-03-08** — Second revision. emsenn identified the ASR flattening
problem: the ASR directory has accumulated content from layers 1-2
(closure-pressure, composite-semioverse), layer 3 (8+ theory files
about agential semioverses in general), and layer 5 (policy concept,
planning methodology, semantic frontmatter). Meanwhile the actual
agential semioverse directory has only 4 files. Agential semioverse
reprioritized to tier 1.

**2026-03-08** — Third revision. emsenn identified the assembly
principle: semiotic-* specs should assemble FROM discipline knowledge,
not invent standalone. Example: policy has roots in sociology
(governmentality, institution, horizontal-organization already exist),
FOSS, and anarchist organizing — semiotic-policy should reference
those, not reinvent governance. Execution restructured into 5 phases:
decompress ASR (mechanical) → ground in disciplines (research) →
general specs → semiotic chains → verify stack. This builds bottom-up
through the dependency graph, producing discipline knowledge as
reusable byproduct. The dependency map edges determine build order;
cross-cutting sources (X1-X7) identify where discipline coverage
already exists.
