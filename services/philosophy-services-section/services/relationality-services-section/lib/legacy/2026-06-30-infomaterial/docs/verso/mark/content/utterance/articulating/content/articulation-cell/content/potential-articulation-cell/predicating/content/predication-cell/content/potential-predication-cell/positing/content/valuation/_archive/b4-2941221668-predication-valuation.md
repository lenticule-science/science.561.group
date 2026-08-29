---
name: predication-valuation
description: "A function v: Π → ∐_p A_p with v(p) ∈ A_p, assigning to each predicate p an element of the predication-fiber-algebra at p. Determines a value v(p)(s, o) ∈ L^⋈ at each predication cell. The substrate's epistemic-state-at-an-instant: what the system holds about all cells at one moment."
symbol: "v"
realizes: [evidence, knowledge-order, truth-order]
depends-on: [predicate, predication-fiber-algebra]
derives-from: docs/dev/scraps/predication-valuation.md
---

# Predication valuation

A **predication-valuation** `v` is a function

$$v : \Pi \to \coprod_{p \in \Pi} A_p, \qquad v(p) \in A_p,$$

assigning to each predicate `p ∈ Π` an element `v(p)` of the predication-fiber-algebra at `p`. Equivalently, `v` determines a value

$$v(p)(s, o) \;\in\; L^\bowtie$$

at each predication-cell `(s, p, o)` in the predication-cell-set `Φ = E × Π × E`.

A predication-valuation is therefore a **fully-typed assignment**: every cell in `Φ` gets exactly one bilattice value, with the type discipline that the second coordinate's predicate `p` determines which `A_p` the value lives in.

## A single valuation IS a single epistemic-state-at-an-instant

One valuation records what the system holds **at one moment** about every predication-cell. The full state-of-knowledge at that moment is `v` itself; nothing more, nothing less.

This is the substrate's atomic unit of state. Predicating-tier operations (evidence-injection, closure-rule application) read and write predication-valuations. Settling-tier operations (orbit, monotonicity) organize valuations into families indexed by ordinal time.

## The signature of evidence-injection

Predicating's evidence-injection function

$$v \;\mapsto\; v \vee_k \delta_{(\phi, q)}$$

takes a predication-valuation `v`, injects new evidence `q ∈ L^⋈` at cell `φ ∈ Φ`, and returns a new predication-valuation. The output's value at `φ` is `v(φ) ∨_k q`; all other cells are unchanged. The signature confirms predication-valuations are the natural input/output type of predicating:

$$\mathrm{predicating} : (\Phi \times L^\bowtie) \times \mathrm{PredVal} \to \mathrm{PredVal}.$$

Iterating evidence-injection on different cells produces longer chains of valuations; closure under derivable consequences (closure-rules firing) produces still more. The resulting trace is the substrate's full predicating activity.

## A single valuation vs. a settlement

One valuation is a single point in time. A **settlement** is a family of valuations indexed by ordinal time:

$$v \;=\; (v_\tau)_{\tau < \lambda},$$

where each `v_τ` is a valuation in the above sense, satisfying settling-monotonicity (`v_σ ≤_k v_τ` whenever `σ ≤ τ`).

The distinction is structural: a valuation is a *snapshot*; a settlement is a *settled orbit through such snapshots*. A valuation lives at predicating tier; a settlement (when reached as the orbit's quiesced object) lives at settling tier. See `…/finite-settlement-algebra/hacking/library/settlement/` for the settled-orbit object.

## `C`-natural valuations

A predication-valuation `u` is **`C`-natural** if for every morphism `f: q → p` in the predicate-category `C`,

$$f^*(u(p)) \;=\; u(q).$$

In words: the predicate-category's reindexings carry `u`'s value at `p` to `u`'s value at `q`. Naturality says the valuation's content respects the predicate-category structure — what holds of `p` flows to `q` via `f` exactly as the reindexing demands.

The increment-sequence in a closure-driven settlement is required to consist of `C`-natural valuations: each `u_τ` injects evidence in a way that respects predicate-category morphisms. This is what makes the orbit's closure-2-monad action coherent with the predicate-category structure.

## Worked example: a valuation on the smallest substrate

Take `L = 2`, `E = {a, b}`, `Π = {p, q}` (two predicates). A predication-valuation `v` is determined by:

- `v(p) ∈ A_p`: a function `E × E → FOUR`. There are `4^4 = 256` such.
- `v(q) ∈ A_q`: a function `E × E → FOUR`. Also 256 such.

A specific concrete `v`:

| Cell | `v(p)` | `v(q)` |
|---|---|---|
| `(a, a)` | `t` | `⊥` |
| `(a, b)` | `⊥` | `f` |
| `(b, a)` | `⊥` | `f` |
| `(b, b)` | `f` | `⊥` |

This says: `p(a, a) = t` (told that `p` holds with `a` in both positions), `q(a, b) = q(b, a) = f` (told that `q` doesn't relate `a` and `b` either way), `q(a, a) = ⊥` (told nothing about `q` on `a` alone), etc.

If a closure-rule fires that requires `q(a, a) ≥_k t` whenever `p(a, a) = t`, then evidence-injection produces a new valuation `v'` with `v'(q)(a, a) = ⊥ ∨_k t = t` — the rule has updated `v(q)(a, a)` from `⊥` to `t`. The new `v'` is the next state of knowledge.

## Position

`transfinite-predication-category/hacking/library/predication-valuation/`. Predicating tier. A valuation IS at predicating tier; it is the output of one round of evidence-injection across all predicates. Settling-tier organization (family-over-time) lives downstream at settling.

## Derivation source

Adapted from `predication-categories/objects/predication-valuation.md`, preserved verbatim at `docs/dev/scraps/predication-valuation.md`.
