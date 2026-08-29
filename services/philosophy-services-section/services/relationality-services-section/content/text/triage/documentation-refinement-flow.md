---
title: Documentation Refinement Flow
keywords:
  - documentation
  - refinement
  - normalization
layer: internal-theorem
status: plan
depends_on:
  - theorem/internal/documentation-structure
  - theorem/internal/structure
  - theorem/internal/function
---
# Documentation Refinement Flow

The documentation structure, together with the general structure and function
theorems, induces a refinement-flow structure on documentation: a way to
identify where work should be done next and how to move the documentation
toward a more atomic, well-typed state.

Let `D = (|D|, Dep, …)` be the documentation structure from
**Theorem (Documentation Structure)**. We define:

- a predicate `WellTyped(d)` on `|D|` that holds when a document:
  - respects its declared layer and status,
  - for internal theorems, names exactly one structure or one operator and
    states its laws,
  - for specs/arch, instantiates only structures/functions earned by its
    `depends_on` theorems,
  - uses vocabulary that can be unfolded into earned relational structures
    and functions; and
- a predicate `Defect(d)` when `WellTyped(d)` does not hold.

We further classify defects into a finite set of **defect kinds** ordered by
priority:

1. `DefectAtomicTheorem`: internal theorems that name or implicitly use more
   than one structure/function, or that refer to undefined technical words.
2. `DefectSpecInstantiation`: specs/arch docs whose `depends_on` do not cover
   the structures/functions they actually use, or that depend directly on acts
   instead of internal theorems where an internal theorem exists.
3. `DefectMetadata`: documents with missing or inconsistent frontmatter
   (`layer`, `status`, `depends_on`, `claims`, `witnesses`).
4. `DefectVocabulary`: documents whose vocabulary includes technical words not
   yet tied to earned structures/functions (as identified by the
   documentation style specification).

A document may exhibit multiple defect kinds; we associate to each document
its **minimal defect kind** under this priority ordering.

Using the relational function machinery, there exists a refinement-flow
structure consisting of:

- a relation `Refine ⊆ |D| × |D|` describing single refinement steps
  (splitting a document, tightening dependencies, or aligning content with
  earned structures), and
- a function

```text
Next : |D| → 𝒫(|D|)
```

that selects the **next loci of work** in `D`:

- `Next(d)` contains those documents reachable from `d` along dependency
  edges that:
  - exhibit `Defect`, and
  - have minimal distance (in number of `Dep` edges) to some act document,
  - and have minimal defect kind among the defective documents at that
    distance.

Equipped with `Next` and `Refine`, development work over the repository can
be viewed as a flow on `D`: at each step, we choose a document in `Next(d)`
for some current slice `d`, apply a `Refine` step to reduce its defects, and
update the documentation structure accordingly. This flow is entirely
determined by the relational properties of `D`; human choices only break
ties when multiple refinement candidates are equally admissible.
