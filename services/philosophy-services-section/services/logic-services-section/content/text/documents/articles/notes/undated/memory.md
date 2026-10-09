---
title: math/MEMORY.md
description: Accumulated cross-session knowledge for the math/ locale.
---
# math/MEMORY.md

Accumulated cross-session knowledge for the math/ locale. Things learned that
are not actionable (those go to PLANS) but that should inform all future work.
Append only; never delete entries.

---

## 2026-03-16 — heading prefix batch-fix

All 349 math/ units now have valid heading type prefixes (Definition, Construction,
Axiom, Theorem, Lemma, Corollary, Conjecture). Prior to this pass, 186 units had
invalid or missing prefixes (Phenomenon, Topic, Remark, Correspondence, bare
headings, etc.). The batch-fix classified each unit from its description field.

**Lessons:**
- "Remark —" → Theorem (a mathematical remark is a proved observation)
- "Topic —" → Definition (a topic introduces and names a concept)
- "Correspondence —" → Conjecture (physics analogies are unproved)
- "Phenomenon —" → Conjecture (observational claims are unproved)
- Bare headings: classified from description field prefix (Definition:, Theorem:, etc.)

---

## 2026-03-16 — spec dependency model clarified

The dependency order is: math → proof → spec → src. Spec claims about math objects
require citations (linked to math units). Spec-domain objects (AgentLoop, Working, Improving) need no
math backing. Nothing may contradict math. Proof may not contain anything without
a math counterpart.

---

## 2026-03-16 — IDEAS promoted to PLANS

All 13 active IDEAS were promoted to PLANS and completed (unit files written):
relational-intelligence-criterion, commutation-density-dimension,
cohomological-dimension-bound, restriction-curvature, holographic-boundary,
entanglement-spectral-mass, relational-history-fiber-nuclear-quartet-extremally-slow-growth-normal-form-count,
entanglement-cohomology-shadow, relational-universe-hubble-extremally-slow-growth-depth-step, two-temperature-duality,
phase-normalization-constant, relational-kramers-kronig, dissolved-fml-quantum-correspondence (now five separate conjecture units).

---

## 2026-03-16 — spec alignment audit (first pass)

Checked citations in spec/skillful-work.md, spec/math-unit.md, spec/math-unit-name.md,
spec/naming-math-unit.md, spec/frontmatter.md against math/. All citations
valid ([Nuclear Quartet Subalgebra](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/library/relational-hyperverse-repository/math/nuclear-quartet-subalgebra.md), [Nuclear Quartet Theorem](../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/nuclear-quartet-theorem.md) both exist and support the claims).
No disputes filed.

---

## 2026-03-16 — skill frontmatter added

All 18 math/skills/*.md files now have `description` and `closure-kind`
frontmatter per spec/skills.md. This was missing because the spec requirement was
introduced after the skills were written.

---

## 2026-03-19 — new frontmatter schema; legacy fields retired

The math/ frontmatter schema was overhauled. Only two fields are required: `id:` and `description:`. Mathematical content lives in `params:`, `output:`, `ast:`. All other fields — `name:`, `uses:`, `defines:`, `domain:`, `codomain:`, `describes:`, `extends:`, `grounding:` — are legacy and carry no meaning in the new schema. Do not write them into new files; do not preserve them in edits.

The `ast:` field encodes an S-expression. Opcodes are `id:`s of other math units (kebab-case, never Greek letters, never symbols). The `ast:` is always the finest-true proposition derivable right now — coarseness is permitted, absence is a gap.

**AST fallbacks:** unknown operator → `relational-universe-morphism`; unknown object → `relational-universe`. Never wrong, always refinable. Pure axiomatic opcodes (leaf nodes) omit `ast:`.

---

## 2026-03-19 — naming grammar for math unit ids

Four grammatical forms, each corresponding to a mathematical role:

| Role | Form | Example |
|------|------|---------|
| Object | flat noun | `relational-universe`, `fiber` |
| Quality | adjective (-ness if no standard adjective) | `extensiveness`, `idempotence` |
| Relation | flat verb (no -ing) | `restrict`, `extend` |
| Act | gerund (-ing) | `saturating`, `transferring` |

The saturating and transferring nuclei are **acts** (they do something to a proposition), hence gerunds. The axiomatic leaf opcodes are `relational-history-fiber-saturating-nucleus` and `relational-history-fiber-transferring-nucleus`.

---

## 2026-03-19 — axiomatic vs. derived nucleus split

`relational-history-fiber-saturating-nucleus` and `relational-history-fiber-transferring-nucleus` are the **axiomatic leaf opcodes** for σ_t and Δ_t. They state only the three nucleus properties (extensivity, idempotence, meet-preservation) at the fiber level — no sheaves, no restrictions, no hyperverse structure.

`relational-history-saturating-nucleus` and `relational-history-transferring-nucleus` are **derived constructions**: they prove the saturating and transferring nuclei exist by sheafification / intersection-of-restriction-images respectively, and require hyperverse structure. Their headings say "Construction —", not "Definition —".

All fiber-level ASTs that reference the saturating or transferring nucleus must point to the axiomatic files, not the derived ones, to remain non-circular.
