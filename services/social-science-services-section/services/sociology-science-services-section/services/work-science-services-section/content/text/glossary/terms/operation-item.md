---
id: operation-item
description: "An OperationItem is the initial algebra of the functor F(X) = WorkUnit ⊕ List(X) — either a ground atomic WorkUnit (base case) or a Workflow wrapping a list of OperationItems (recursive case)."
component-of: Task
uses: WorkUnit, Workflow
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  work-unit: relational-universe
  sub-items: relational-universe
output: relational-universe
ast:
  initial-algebra:
    - work-unit
    - sub-items:
        - work-unit
        - initial-algebra
aliases:
  - OperationItem
---

# OperationItem

## What this is

An **OperationItem** is the carrier of the initial algebra for the functor F(X) = WorkUnit ⊕ List(X).

The mathematical invariant comes from the theory of initial algebras and algebraic data types (Lambek 1968; Hagino 1987). Given a functor F: Set → Set, an **F-algebra** is a pair (A, α: F(A) → A). An **initial F-algebra** is one from which there is a unique algebra homomorphism to every other F-algebra — it is the canonical recursive type defined by F.

For F(X) = WorkUnit ⊕ List(X):

- The **base case** is a [WorkUnit](./work-unit.md) — a ground term, fully specified, atomic, not further decomposable.
- The **recursive case** is a [Workflow](./workflow.md) — a list of OperationItems, each of which may itself be atomic or composite.

By Lambek's theorem, the initial algebra satisfies the fixed-point equation:

**OperationItem ≅ F(OperationItem) = WorkUnit ⊕ List(OperationItem)**

This is exactly the type equation `OperationItem = WorkUnit | Workflow(OperationItem*)`. The isomorphism confirms that the type is well-founded: every OperationItem is either atomic or decomposes into a finite list of smaller OperationItems, terminating at WorkUnits.

## Catamorphism

The canonical way to process all OperationItems in a Task is the **catamorphism** (fold) over this initial algebra. Given any F-algebra (B, β: F(B) → B), the unique homomorphism cata(β): OperationItem → B is:

- cata(β)(w: WorkUnit) = β(inl(w))
- cata(β)(wf: Workflow) = β(inr(cata(β) applied to each item in wf))

In practice: any operation that handles both atomic and composite work items by handling the base case and recursing on the list is computing a catamorphism. Status roll-up, execution, serialization — all are catamorphisms over the OperationItem algebra.

## Commitment

An OperationItem is **committed** — it has been triaged, judged actionable, and placed in a Task. Uncommitted potential work items are [FlatfileAgentResourceSystemIdeas](../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/idea.md) (open terms awaiting closure). The transition from Idea to OperationItem is the act of closing the open term into a ground specification.

## Required fields

Every OperationItem MUST have:

- **An identifier**: kebab-case name, unique within the file; named by what the work produces, not position
- **A title**: imperative noun phrase naming what is produced
- **Added**: ISO 8601 date when this item was placed in PLANS
- **Status**: exactly one of `open` or `deferred`; a deferred item MUST include a reason
- **Action**: one imperative sentence — the thing to do

Every OperationItem SHOULD have:

- **Why**: one sentence of motivation sufficient for any agent to understand why this work matters now

## Canonical format

```markdown
### {identifier}

**Added:** YYYY-MM-DD
**Status:** open | deferred
**Action:** imperative sentence.
**Why:** motivation sentence.
```

When completed, an OperationItem is deleted from the file. The work is in the repo; git history is the record.

## Open questions

- Whether the List in F(X) = WorkUnit ⊕ List(X) should be an ordered list (preserving sequencing) or a set (unordered), and whether this choice affects the catamorphism.

## Consolidated material from operation-item.md

---

title: "OperationItem"
description: "An OperationItem is the initial algebra of the functor F(X) = WorkUnit ⊕ List(X) — either a ground atomic WorkUnit (base case) or a Workflow wrapping a list of OperationItems (recursive case)."
defines: OperationItem
component-of: Task
uses: WorkUnit, Workflow
date-created: 2026-03-18
date-modified: 2026-03-19
---

- The **base case** is a [WorkUnit](./work-unit.md) — a ground term, fully specified, atomic, not further decomposable.
- The **recursive case** is a [Workflow](./workflow.md) — a list of OperationItems, each of which may itself be atomic or composite.
