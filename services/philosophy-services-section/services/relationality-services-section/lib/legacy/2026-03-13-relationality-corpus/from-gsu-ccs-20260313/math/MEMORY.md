---
name: MEMORY
---

Accumulated cross-session knowledge for the math/ department. Things learned that
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

## 2026-03-16 — defines: bootstrap

All 179 definition-class units (Definition, Construction, Axiom headings) had
`defines:` added to their frontmatter. Prior to this pass, 0 units had `defines:`.
The `name` value is `CamelCase(id)` mechanically.

---

## 2026-03-16 — spec dependency model clarified

The dependency order is: math → proof → spec → src. Spec claims about math objects
require §citations. Spec-domain objects (AgentLoop, Working, Improving) need no
math backing. Nothing may contradict math. Proof may not contain anything without
a math counterpart.

---

## 2026-03-16 — IDEAS promoted to PLANS

All 13 active IDEAS were promoted to PLANS and completed (unit files written):
relational-intelligence-criterion, commutation-density-dimension,
cohomological-dimension-bound, restriction-curvature, holographic-boundary,
entanglement-spectral-mass, normal-form-fibonacci-growth,
entanglement-cohomology-shadow, hubble-fibonacci-step, two-temperature-duality,
phase-normalization-constant, relational-kramers-kronig, dissolved-fml-quantum-correspondence (now five separate conjecture units).

---

## 2026-03-16 — spec alignment audit (first pass)

Checked §citations in spec/skillful-work.md, spec/math-unit.md, spec/math-unit-name.md,
spec/naming-math-unit.md, spec/frontmatter.md against math/. All citations
valid (§nuclear-quartet, §nuclear-quartet-theorem both exist and support the claims).
No disputes filed.

---

## 2026-03-16 — skill frontmatter added

All 18 math/skills/*.md files now have `description` and `skill-closure-kind`
frontmatter per spec/skills.md. This was missing because the spec requirement was
introduced after the skills were written.
