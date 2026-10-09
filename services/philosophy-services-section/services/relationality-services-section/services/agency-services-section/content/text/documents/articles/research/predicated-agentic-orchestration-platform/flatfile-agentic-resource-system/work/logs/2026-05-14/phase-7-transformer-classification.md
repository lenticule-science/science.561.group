---
name: phase-7-transformer-classification
description: Classification of FARS's 25 transformer files against the revised transformer.md spec (every filed transformer is a closure rule with premise → conclusion structure). Three buckets — closure-rule candidates that can be expressed in structured form, substrate-API operations that are stepping-map mechanism per four-layer rule architecture, and predicate-category generators inherited from upstream — with recommended next moves per file.
type: finding
date: 2026-05-14
phase: 7
status: classification-complete-moves-pending
title: phase-7-transformer-classification
date-created: 2026-05-14
---

# Phase 7 transformer classification

**Update (later in 2026-05-14):** the framing below uses an invented category "substrate-API operations" that isn't a real predication-category-theoretic distinction.
Every filed transformer IS a morphism in the predication-fibration — there is no "outside" the math.
The right classification is by predication-category morphism class (closure-rule, predicate-specialization, agentive-positing, twist-product-fusion, modal-necessity-restriction, step-shift, composite, …).
See the updated `transformer.md` spec and its `transformer-class:` discriminator.
The buckets below are kept as historical record of what I was trying to name; treat the Bucket 1/2/3 distinctions as approximate-but-wrong-framed, and use the predication-category class names instead.

---

The revised `transformer.md` spec requires every filed transformer to be a closure rule with premise/conclusion/match-radius/severity.
FARS's 25 current transformer files don't all fit.
Classifying each.

## Bucket 1 — closure-rule candidates (5 files)

These transformers express patterns that COULD be encoded as closure rules with structured premise/conclusion.
Phase 7 work is to populate the structured frontmatter from each body.

| File | Closure-rule shape (sketch) |
|---|---|
| `dispatch.md` | premise: work-item w, agent a in candidates, `required(w) ⊙ authorized(a) ≠ ⊥` → conclusion: DispatchResult with match-strength = `⊙`-value |
| `emit-event.md` | premise: substrate-mutating operator invoked → conclusion: Event appended to log + witness |
| `interpret.md` | premise: Note frontmatter pattern P → conclusion: fiber cell at corresponding predicate with corresponding bilattice value |
| `check-authorization.md` | premise: session s + action a + governance(s, a) ≥ t → conclusion: decision = `authorized` + witness |
| `transition-mode.md` | premise: session + valid mode-transition + target-mode admissible → conclusion: session with target-mode + witness |

Populating premise/conclusion for these requires reading each body and translating the operational semantics into the structured form.
Per-file judgment work.

## Bucket 2 — substrate-API operations / stepping maps (16 files)

These transformers describe operations that APPLY closure rules rather than being closure rules themselves.
Per the [four-layer rule architecture](../../../architecture/four-layer-rule-architecture/four-layer-rule-architecture.md), they are layer-3 stepping maps or layer-4 protocol adapters — realization mechanism, not substrate content.
The revised `transformer.md` spec marks them as misfilings.

| File | Why not a closure rule |
|---|---|
| `load.md` | Walks the filesystem; substrate-read entry point; layer-4 protocol adapter |
| `settle.md` | Applies the closure operator (all rules); meta-operator, not a single rule |
| `respond.md` | Composite: extend fiber by message + settle |
| `apply-edit.md` | Edit-application mechanism; layer-3 stepping map |
| `advance-tick.md` | Temporal progression mechanism |
| `heartbeat-cycle.md` | Periodic scheduling mechanism |
| `invoke-skill.md` | Skill invocation orchestration |
| `execute-runbook.md` | Runbook execution orchestration |
| `open-session.md`, `resume-session.md`, `close-session.md`, `consolidate.md` | Session-lifecycle mechanisms |
| `assemble-kit.md` | Authorization-kit composition mechanism |
| `merge-peer.md`, `emit-federation-envelope.md`, `admit-federation-envelope.md`, `replay-from-peer.md` | Federation orchestration |

These could be moved to a realization-spec location (e.g., `governance/specifications/operations/`) or — for those whose body content is conceptually about a substrate pattern, not just mechanism — to `concepts/`.
They should not stay in `transformers/`.

## Bucket 3 — math primitives (4 files)

These transformers are predication-category-level primitives that are properly inherited from upstream `predication-categories` rather than re-asserted at FARS scope.

| File | Upstream location |
|---|---|
| `specializes.md` | Predicate-category generator (`predicate-specialization.md` upstream) |
| `compose.md` | Fiber-algebra composition; close to predication-category twist-product / fusion |
| `restrict.md` | Modal restriction; close to `modal-necessity-operator` upstream |

These could stay as FARS-specific RECORDS of the upstream primitives (documenting how FARS realizes them at the flatfile substrate), or move to a reference dir.
`compose` and `restrict` may also have closure-rule shape at FARS scope — needs body re-read.

## Recommended moves (pending captain confirmation)

1. **Bucket 2 (16 files)** — move to `governance/specifications/operations/` as substrate-API operation specs.
  Each is a normative spec of what the layer-3 stepping map must do.
2. **Bucket 3 (4 files)** — leave in `transformers/` for now; defer to a future iteration that decides whether FARS re-states upstream primitives or just references them.
3. **Bucket 1 (5 files)** — leave in `transformers/`; populate premise/conclusion structured frontmatter per body content.
  Per-file judgment work.

## What this finding does not commit

- Does not perform the moves.
  Captain confirmation needed before relocating 16+ substantive files.
- Does not pin the destination for Bucket 2 — `governance/specifications/operations/` is one option; `concepts/` (treating each operation as a named pattern) or `prose/` (treating each as architecture documentation) are alternatives.
- Does not yet populate Bucket 1's structured frontmatter — that's the next Phase 7 sub-step once the moves are decided.

## Cross-check: claims/

In parallel, audited `claims/` (5 files).
All are theorems-with-proofs per the revised claim.md spec:

- `flatfile-federation-equivalence.md` — federation equivalence theorem
- `heartbeat-converges-under-strict-regime.md` — convergence theorem
- `instinct-confidence-is-closure-fixpoint-measure.md` — assertion about closure-fixpoint structure
- `rule-addition-is-substrate-local.md` — locality theorem
- `scope-composition-is-knowledge-order-monotone.md` — monotonicity theorem

`claims/` is in good shape post-revision.
No reclassification needed.
