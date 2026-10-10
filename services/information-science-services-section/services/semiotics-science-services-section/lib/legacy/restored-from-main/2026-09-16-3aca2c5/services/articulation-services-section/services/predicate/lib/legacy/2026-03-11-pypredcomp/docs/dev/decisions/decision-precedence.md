---
title: "Decision precedence"
description: "When two decisions conflict, the higher-precedence class wins. Math-foundation > settled-content > capability > performance > convenience. Conflicts are resolved by elevating one decision to the higher class or by amending the lower-class decision to scope its claim."
kind: decision
date: "2026-05-02"
status: committed
---


## What

Decisions in this directory belong to one of five precedence classes.
When two decisions appear to conflict, the higher-class decision wins by default; the lower-class decision must be amended to scope its claim.

The classes, from highest to lowest precedence:

| # | Class | Examples | Resolution rule |
|---|---|---|---|
| 1 | **Math-foundation** | bilattice-as-the-value-domain, knowledge-join-is-information-merge, single-substrate, regime-classification-is-load-bearing, cost-is-lawvere-quantale | Cannot be overridden by lower classes. Conflict means a lower-class decision is making a math-illegal claim and must be amended. |
| 2 | **Settled-content** | event-log-is-the-truth, time-is-event-ordinal, hash-injectivity-is-content-identity, bilattice-as-the-value-domain (settled axioms) | Overrides classes 3–5. Overridden only by reopening the question and re-deciding at the same class. |
| 3 | **Capability** | authorization-is-modal-restriction, capabilities-grant-not-deny, federation-by-construction, persona-bridges-personnel | Overrides classes 4–5. Conflict with class 1 or 2 means the capability claim was math-illegal and must be amended. |
| 4 | **Performance** | dual-implementation-python-rust, eager-σ-pass-vs-lazy-fiber-projection, default-fuel-ceilings | Overrides class 5. Performance optimisations cannot override capability claims, settled content, or math foundation. |
| 5 | **Convenience** | mcp-as-default-surface, http-as-secondary-surface, plain-text-event-log-format | The lowest-precedence class. Overridden by anything above. |

The classes are *not* a strict total order — multiple decisions in class 1 can coexist (and must, per [_patterns/predication-category-grounding.md](../specs/_patterns/predication-category-grounding.md)).
Within a class, conflict is resolved by the class's own discipline:

- **Within math-foundation:** the conflict is a *math* conflict.
  The two underlying theorems must be reconciled in the library; the substrate cannot ship a math-foundation contradiction.
  Amendment requires a captain-question and a supporting library theorem.
- **Within settled-content:** the conflict is a *content* conflict.
  The earlier decision wins by default; the later decision must amend its claim or the earlier one must be re-decided.
- **Within capability:** the conflict is a *surface* conflict.
  The capability that maps to the substrate's primary $\Box_R$ surface wins; secondary surfaces are amended to scope.
- **Within performance:** the conflict is a *measurement* conflict.
  The decision with the better-supported benchmark wins; the loser amends to scope.
- **Within convenience:** the most-recently-merged decision wins; older decisions are deprecated.

## Why

The decisions/_index.md previously listed every decision flat, with no indication of which prevailed under conflict.
As the v0.2 dev-doc set grew (now ~30 decisions, of which 3 are v0.2 grounding decisions and several are forward-looking), reviewers had no way to tell whether a new spec's claim — say, "for performance the engine MAY skip the σ-pass on read-only entities" — overrides or is overridden by the bilattice algebra's settling discipline.

The five classes name the discipline.
A new decision declares its class in its frontmatter (`class: math-foundation | settled-content | capability | performance | convenience`); the [decisions/_index.md](_index.md) groups by class and shows precedence.
A spec that imports a lower-class decision's claim against a higher-class one is non-conformant; the spec must amend the import.

The precedence is **monotone with respect to library theorem-rank**: math-foundation decisions cite predication-categories or predicated-computing **theorems** (proved); settled-content decisions cite **objects** (defined); capability decisions cite **morphisms** (constructed); performance decisions cite **benchmarks** (measured); convenience decisions cite **surface preferences** (chosen).
This is not enforced by tooling in v0.2, but it is the discipline; a math-foundation decision without a theorem citation is mis-classed.

The discipline gives the captain a single rule for resolving review-time conflicts: *what class is each decision in, and which class wins?* It does not eliminate captain judgement (the within-class rules require it) but it bounds the question.

## What it rules out

- **Unclassed decisions.** A decision file added to this directory without a `class` frontmatter field is non-conformant.
  (Existing decisions without `class` are grandfathered as "unclassed; reviewer determines class on next touch"; the gap-survey lists them.)
- **Performance decisions overriding capability.** A "for speed, skip the capability check on cached responses" decision is non-conformant; performance cannot override capability per the table.
- **Convenience decisions overriding settled content.** A "for convenience, the surface accepts non-canonical bytes" decision is non-conformant; canonical-bytes is settled-content per [hash-injectivity-is-content-identity.md](hash-injectivity-is-content-identity.md).
- **Math-foundation decisions without theorem citations.** A decision claiming math-foundation class must cite the supporting library theorems by relative path.
- **Implicit cross-class amendments.** A spec that diverges from a lower-class decision to honour a higher-class one MUST update the lower-class decision's "What it does not constrain" section to scope; silent divergence is non-conformant.

## What it does not constrain

- **The total number of decisions in each class.** Math-foundation is currently small (3 v0.2 grounding decisions plus the bilattice/knowledge-join base); convenience may grow large.
  The class sizes are not fixed.
- **Tooling enforcement.** v0.2 does not ship a linter for decision class.
  The discipline is captain-enforced at decision-merge review.
- **Reclassification of existing decisions.** Reclassifying an existing decision (say, moving a "settled-content" decision to "math-foundation" because a new theorem now grounds it) requires a captain-question and an amended frontmatter, not a flag-day rewrite.
- **The within-class resolution discipline's specifics.** The rules in §"What" above are starting points; per-class resolution may evolve as the decision corpus matures.
- **The relationship between decisions and questions.** Open captain-questions are *prior* to any class — they are the queue from which decisions emerge.
  A question's resolution becomes a decision in its assigned class.

## Cross-references

- [_index.md](_index.md) — the decisions index, grouped by class per this discipline.
- [_patterns/predication-category-grounding.md](../specs/_patterns/predication-category-grounding.md), [_patterns/predicated-computing-grounding.md](../specs/_patterns/predicated-computing-grounding.md) — the math-foundation and engineering-foundation grounding patterns each decision class draws from.
- The captain's review discipline for new decision merges (not yet a written spec; covered by this decision).
