---
id: flatfile-agential-resource-system-math-entity
description: "A FlatfileAgentialResourceSystemMathEntity is a RelationalEntity that is the authoritative source for exactly one named declaration in the ambient formal theory. It carries exactly one epistemic status relation (defines:, construction:, axiom:, theorem:, lemma:, corollary:, or conjecture:) naming what the declaration does and what it concerns."
extends: RelationalEntity
component-of: FlatfileAgentialResourceSystemLocale
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  id: relational-universe
  epistemic-status: relational-universe
  body: relational-universe
output: relational-universe
ast:
  named-declaration:
    - id
    - epistemic-status:
        - defines
        - construction
        - axiom
        - theorem
        - lemma
        - corollary
        - conjecture
    - body:
        - settlement-metadata
title: Flatfile Agential Resource System Math Entity
---

# Flatfile Agential Resource System Math Entity

## What this is

A **FlatfileAgentialResourceSystemMathEntity** is a [RelationalEntity](relational-entity.md) that corresponds to exactly one named declaration in the ambient formal theory.

The mathematical invariant comes from proof assistant type theory.
In Lean 4, the global **environment** Γ is a finite map from names to **declarations** — values of type `Declaration`, which carries: a name (`Name`), universe level parameters, a type expression (`Expr`), and for non-axioms, a definitional body (`Expr`).
Each declaration adds exactly one named object to Γ.
No two declarations in Γ share a name; every reference is resolved against the environment.

A FlatfileAgentialResourceSystemMathEntity is the corpus-level analog: a single file that is the authoritative source for one named declaration.
The file has:

- **id** — the name, identifying the declaration within the corpus
- **one epistemic status relation** — a named relation asserting what the declaration does (see below)
- **body** — the mathematical content: the statement and, for proved results, the proof

The **one-per-file constraint** follows directly from the environment model: you cannot add two independent declarations under one name.
Carrying two epistemic status relations in one file conflates two declarations with different proof obligations.

As a RelationalEntity, a FlatfileAgentialResourceSystemMathEntity is also a [Resource](../../../../../../../../../../../../../../../../../../information-science-services-section/content/text/glossary/terms/resource.md): it makes claims about a mathematical object and is read for understanding.
All downstream files — proof files, spec files, implementation files — are downstream of the FlatfileAgentialResourceSystemMathEntity for the concept they concern.

## Epistemic status relations

A FlatfileAgentialResourceSystemMathEntity carries exactly one of the following named relations.
The key is the relation; the value is the entity (concept, proposition, or structure) the declaration concerns.

| relation | value is | meaning |
|---|---|---|
| `defines: X` | the named object introduced | introduces and names X as a mathematical object or structure |
| `construction: X` | the named object constructed | exhibits X by explicit construction (stronger than existence assertion) |
| `axiom: X` | the content resource for X | imposes X as a foundational assumption; no proof obligation |
| `theorem: X` | the proposition proved | proves X; carries a proof obligation (proof may live in `proof/`) |
| `lemma: X` | the proposition proved | proves X as an auxiliary result |
| `corollary: X` | the proposition derived | derives X directly from an already-proved result in the corpus |
| `conjecture: X` | the proposition conjectured | proposes X as a precise claim believed true but not yet proved |

A FlatfileAgentialResourceSystemMathEntity carries exactly one epistemic status relation.
A FlatfileAgentialResourceSystemMathEntity MAY carry a stub body (`**Status.** Stub.
`) when the declaration is registered but not yet written.

`defines:` and `axiom:` are fully specced ([defines](../flatfile-agential-resource-system-defines/flatfile-agential-resource-system-defines.md), [axiom](../../../../../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/axiom.md)).
The relations `construction:`, `theorem:`, `lemma:`, `corollary:`, and `conjecture:` are vocabulary debt — they are used here before their spec entities exist.

## Frontmatter

Required: `id`, `description`, and exactly one epistemic status relation.
Optional: `symbol`, `domain`, `codomain`, `describes`, `lean_file`.
Settlement metadata (see below): `base`, `stratum`, `dep`, `given`.
No other fields are permitted.

The CamelCase display name is NOT a stored field — it is derived from `id` by the kebab-to-CamelCase bijection (see [FlatfileAgentialResourceSystemMathEntityName](../flatfile-agential-resource-system-math-entity-name/flatfile-agential-resource-system-math-entity-name.md)).
Storing it would duplicate information fully determined by `id`.

`domain` and `codomain` MUST NOT appear without `defines`.
They MUST appear together.

## Settlement metadata

Four optional frontmatter fields encoding a math entity's position in the framework's nuclear structure.
See [FlatfileAgentialResourceSystemSettlementMetadata](../flatfile-agential-resource-system-settlement-metadata/flatfile-agential-resource-system-settlement-metadata.md) for the full specification.

```yaml
base:    # smallest site over which this entity is well-defined
         # values: a specific history t, relational-history-site, RU^(k), tower, H
         # omit when level-independent
stratum: # categorical role relative to base
         # values: fiber-element, section, morphism, sheaf, endofunctor, external
dep:     # RelationalHistoryFiberDoctrineLanguage modal depth: 0 = no nuclei, 1 = one σ or Δ, 2 = composed (e.g. Δ(σ(·)))
given:   # ids of conjectures or unproved lemmas this result presupposes
         # delete an entry when its condition is proved
```

`given:` is contingency, not dependency — that is `uses:`.
Each entry is a gap in the interval [a, π(a)]; deleting all entries places the entity unconditionally in H*.

**Defect eigenvalue.** The count of `given:` entries.
A proved theorem has defect 0; a conjecture has defect ≥ 1.
This is derived from frontmatter — `status` is NOT a stored field.

## Heading

The first heading after frontmatter MUST be `### Display title {#<id>}` with the anchor matching `id` exactly.
No epistemic prefix in the heading — the epistemic status relation in frontmatter is the sole source of truth.

A FlatfileAgentialResourceSystemMathEntity CANNOT contain `####` sub-headings with `{#anchor}` — each named sub-object MUST have its own FlatfileAgentialResourceSystemMathEntity file.

## Body structure by epistemic status

**`defines:` / `construction:` / `axiom:`**: state the mathematical object — carriers, operations, axioms — first.
Remarks may follow.

**`theorem:` / `lemma:` / `corollary:`**: (1) Statement — the formal claim with all hypotheses; (2) Proof or reference to Lean file; (3) optionally Remarks.

**`conjecture:`**: (1) Statement with all genericity hypotheses explicit; (2) Motivation — structural arguments, not proofs; (3) What a proof requires — gaps named; (4) Depends on — linked references to FlatfileAgentialResourceSystemMathEntity files needed to state the conjecture.

## Open questions

- Existing math/ files predate this spec and use old heading conventions (`### Theorem — Name {#id}`), store `name:` in frontmatter, and carry `kind:` as a meta-field.
  Migration: add the appropriate epistemic status relation (`theorem: X`, `defines: X`, etc.), remove `name:` and `kind:`, strip the epistemic prefix from the heading.
  Tracked in math/INBOX.md.
