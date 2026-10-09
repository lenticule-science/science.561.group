---
id: flatfile-agent-resource-system-settlement-metadata
description: "Four optional frontmatter fields (base, stratum, dep, given) that record a document's position in the framework's nuclear settlement structure, making level, categorical role, modal depth, and distance from H* computable from frontmatter."
uses: FlatfileAgentResourceSystemMathEntity, FlatfileAgentResourceSystemGiven, NuclearQuartetSubalgebra
extends: Relation
date-created: 2026-03-19
date-modified: 2026-03-19
params:
  document: relational-universe
output: relational-history-fiber-fixed-layer
ast:
  nuclear-position-record:
    - document
    - base:
        - site-coordinate
    - stratum:
        - categorical-role
    - dep:
        - modal-depth
    - given:
        - defect-eigenvalue
---

# Settlement Metadata

## What this is

**settlement metadata** is a set of four optional frontmatter fields — `base`, `stratum`, `dep`, `given` — that record a document's position in the framework's nuclear settlement structure. They apply to math entities, spec entities, and any other document in the system.

The fields correspond directly to mathematical objects in the framework: `base` is the site coordinate, `given` encodes the projection gap interval [a, π(a)], and the defect eigenvalue (count of `given:` entries) measures distance from H*.

## The four fields

**`base:`** — the smallest site over which this entity is well-defined.

| Value | Meaning |
|---|---|
| a history id `t` | fiber-level; requires a specific history to type-check |
| `relational-history-site` | global section — defined over the full site |
| `RU^(k)` | a specific level in the tower |
| `tower` | holds at every tower level |
| `H` | concerns the hyperverse colimit |
| omitted | level-independent |

**`stratum:`** — the categorical role of this object relative to its base.

| Value | Meaning |
|---|---|
| `fiber-element` | a point in a specific fiber H_t |
| `section` | a global or local section |
| `morphism` | a map between objects |
| `sheaf` | a presheaf satisfying gluing |
| `endofunctor` | a functor on the site category (e.g., a nucleus) |
| `external` | an object from outside R being compared or transferred in |

**`dep:`** — minimum RelationalHistoryFiberDoctrineLanguage modal depth to state this entity. `dep: 0` means no nuclear operators appear; `dep: 1` means one application of σ or Δ; `dep: 2` means a composed application such as Δ(σ(·)).

**`given:`** — ids of conjectures or unproved lemmas this result presupposes. Distinct from `uses:` (dependency): each `given:` entry is a condition that makes the result conditional, not merely a reference. Delete an entry when its condition is proved. When the list is empty the entity is unconditionally in H*.

## Defect eigenvalue

The count of `given:` entries is the entity's **defect eigenvalue**:

- defect 0 — unconditional; in H*
- defect n — n proofs required to reach H*

`status` is derived from this count, not stored. Do not add a `status:` frontmatter key.

## Pipeline

1. Write the result with `given:` entries naming its open conditions.
2. Prove each condition in its own MathEntity file; delete its entry from `given:`.
3. When `given:` is empty, fill in any `base:` or `stratum:` values that were blocked.

This is the same structure as the [flatfile-agent-resource-system-grounding-claim](./grounding-claim.md) pipeline: a proposed relation submitted for nucleus evaluation, blocking conditions named, settled when all conditions pass.

## Open questions

- Whether `base:` should be drawn from a controlled vocabulary or accept any valid site identifier.
- Whether the six `stratum:` values are exhaustive.
- `base:`, `stratum:`, and `dep:` are documented here but have no dedicated spec files — vocabulary debt.
