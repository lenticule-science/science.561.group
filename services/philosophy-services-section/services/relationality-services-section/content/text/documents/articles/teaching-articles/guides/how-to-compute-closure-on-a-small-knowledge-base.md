---

title: "How to Compute Closure on a Small Knowledge Base"
description: "A tutorial: take a set of bilattice-valued assertions, apply inference rules step by step, and reach the fixpoint where no new information can be derived."
date-created: 2026-03-31
requires:
  - epistemic-state
  - bilattice
teaches:
  - closure
  - fixpoint
---

You have a small knowledge base: a set of [subject-predicate-object](../../../../../../../../../information-science-services-section/content/text/glossary/terms/subject-predicate-object.md) triples, each carrying an [epistemic state](../../../../../../../../../information-science-services-section/content/text/glossary/terms/epistemic-state.md) from $\{\bot, t, f, \top\}$. You want to [close](../../../../../../../../../information-science-services-section/services/math-services-section/services/algebra-services-section/content/text/glossary/terms/closure.md) it — derive everything that follows from what you have.

## The starting state

Suppose you have five assertions:

| Triple | Value | Meaning |
|--------|-------|---------|
| A extends B | $t$ | Affirmed |
| B extends C | $t$ | Affirmed |
| A extends C | $\bot$ | Unknown (not yet derived) |
| D extends B | $f$ | Denied |
| A extends D | $\bot$ | Unknown |

## The inference rules

For this example, we use one rule: **transitivity**. If predicate $p$ is transitive and we have $X\ p\ Y$ (value $x$) and $Y\ p\ Z$ (value $y$), derive $X\ p\ Z$ with value $x \wedge_k y$ (the knowledge-meet of $x$ and $y$).

The knowledge-meet $\wedge_k$ on the bilattice:

| $\wedge_k$ | $\bot$ | $t$ | $f$ | $\top$ |
|---|---|---|---|---|
| $\bot$ | $\bot$ | $\bot$ | $\bot$ | $\bot$ |
| $t$ | $\bot$ | $t$ | $\bot$ | $t$ |
| $f$ | $\bot$ | $\bot$ | $f$ | $f$ |
| $\top$ | $\bot$ | $t$ | $f$ | $\top$ |

$\wedge_k$ takes the minimum information content in each component.

## Step 1

Apply transitivity to all composable pairs:

- A extends B ($t$) and B extends C ($t$): derive A extends C with value $t \wedge_k t = t$.
- D extends B ($f$) and B extends C ($t$): derive D extends C with value $f \wedge_k t = \bot$.

Update the table:

| Triple | Before | After Step 1 | Changed? |
|--------|--------|-------------|----------|
| A extends B | $t$ | $t$ | no |
| B extends C | $t$ | $t$ | no |
| A extends C | $\bot$ | $t$ | **yes** |
| D extends B | $f$ | $f$ | no |
| A extends D | $\bot$ | $\bot$ | no |
| D extends C | — | $\bot$ | new, but $\bot$ |

Something changed (A extends C moved from $\bot$ to $t$), so we continue.

## Step 2

Apply transitivity again with the updated values:

- A extends C ($t$, new) — any new composable pairs? A extends C and... no C extends anything in our system.
- No other composable pairs produce new results.

Nothing changed. We have reached the [fixpoint](../../../../../../../../../information-science-services-section/services/math-services-section/services/order-services-section/content/text/glossary/terms/fixpoint.md).

## The closed knowledge base

| Triple | Value |
|--------|-------|
| A extends B | $t$ |
| B extends C | $t$ |
| A extends C | $t$ |
| D extends B | $f$ |
| A extends D | $\bot$ |
| D extends C | $\bot$ |

What we learn:

- **Derived**: A extends C was unknown; transitivity resolved it to affirmed.
- **Unresolved**: A extends D and D extends C remain $\bot$. No rule can reach them because there is no chain connecting A to D or D to C through affirmed links. These are [gaps](./how-to-detect-contradictions-and-gaps.md) — the system has no basis for resolving them.
- **No contradictions**: no $\top$ values appeared. The knowledge base is consistent.

## When ⊤ appears

If we had started with:

- A extends B = $t$
- B extends C = $f$

Then transitivity gives A extends C = $t \wedge_k f = \bot$. No contradiction. But if a different rule (say, from another predicate) independently derived A extends C = $t$, and transitivity through B gave $f$, combining them would give $t \vee_k f = \top$: contestation. Two inference paths disagree.

## Why it terminates

The knowledge ordering $\leq_k$ on $\{\bot, t, f, \top\}$ has height 2: the longest chain is $\bot <_k t <_k \top$ (or $\bot <_k f <_k \top$). Each step pushes at least one value strictly upward. With $n$ assertions, closure takes at most $2n$ steps.

The fixpoint always exists because the inference rules are [monotone](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/monotone.md) in $\leq_k$ (Fitting 1991) and the pointwise ordering on $\{\bot, t, f, \top\}^n$ is a [complete lattice](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/preorder/content/order/content/lattice/content/complete-lattice/complete-lattice.md). The Knaster-Tarski theorem guarantees a least fixpoint.

## Earlier material

You have a small knowledge base: a set of [subject-predicate-object](../../../../../../../../../information-science-services-section/content/text/glossary/terms/subject-predicate-object.md) triples, each carrying an [epistemic state](../../../../../../../../../information-science-services-section/content/text/glossary/terms/epistemic-state.md) from $\{\bot, t, f, \top\}$. You want to [close](../../../../../../services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/prose/math/theories/algebra/terms/closure.md) it — derive everything that follows from what you have.

Nothing changed. We have reached the [fixpoint](../../../../../../services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/prose/math/theories/order/terms/fixpoint.md).
