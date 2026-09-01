---
name: step-n-classifying-invariant
kind: invariant
description: "The substrate's classifying invariant cl-inv specialized to step-n substitution settlings. For a step-n primitive substitution with substitution matrix M of size n, cl-inv^(n)(v) is the direct limit of (V^n, M_w^T) under the iterated substitution endomorphism σ*. Free of rank n on the weight-stability cone S_S; rank-drops outside the cone."
symbol: "cl-inv^(n)(v)"
specializes: "cl-inv(v) ∈ H^1(F_v) to the step-n substitution setting"
formula: "cl-inv^(n)(v) ≅ lim→_k (V^n, M_w^T) — direct limit of iterated weighted-matrix-action"
free-rank: "n on the weight-stability cone S_S; r < n outside"
canonical-examples: "Fibonacci (n=2 Scott-cont), Padovan (n=3 strict-finite), Tribonacci (n=3 transfinite-bounded), Tetranacci (n=4)"
minted-from: theorem-context — referenced by tropical-rank-collapse-classification, continuous-valued-step-n-cohomological-rank, step-n-cohomological-rank-theorem (already placed), and downstream orbit-classification theorems, with no own archive scrap. Reconstructed from the tropical-rank-collapse theorem's explicit construction.
---

# Step-n classifying invariant

The substrate's **classifying invariant `cl-inv`** specialized to **step-n substitution settlings**. For a step-n primitive substitution rule with substitution matrix `M` of size `n`, the step-n classifying invariant is the direct limit of the iterated substitution endomorphism's action on `V^n`.

## Definition

For a continuous-valued step-n substitution settling `v_S^(V, w)` with substitution matrix `M`, value category `V` (idempotent commutative unital quantale), and weight assignment `w ∈ V^n`, the **step-n classifying invariant** is

$$\mathrm{cl}\text{-}\mathrm{inv}^{(n)}_{\mathcal{V}}(v_S^{(\mathcal{V}, w)}) \;\cong\; \varinjlim_k \bigl(\mathcal{V}^n,\; M_w^T\bigr),$$

where `M_w` is the **weighted substitution matrix** `(M_w)_{ij} = M_{ij} ⋅ w_j` in the value category `V`. The direct limit accumulates the iterated substitution-endomorphism action `σ*: V^n → V^n`.

For Boolean `V = 2`, this recovers the standard classifying invariant `cl-inv(v) ∈ H^1(F_v)` for substitution settlings.

## Rank structure: free of rank n on the weight-stability cone

The free-`V`-module rank of `cl-inv^(n)` depends on the weight assignment:

- **On the weight-stability cone `S_S ⊆ V_{>⊥}^n`**: free of rank exactly `n`. The cone is open semi-algebraic and contains the right-Perron eigenvector of `M`.
- **Outside the cone**: free of rank `r < n`, where `r` is the limit-stable rank along the iterated substitution endomorphism.

The cone's shape is **substitution-specific** — it depends on `M`'s right-Perron eigenvector's component-ordering, not just on the matrix size `n`.

### Per-substitution weight-stability cone

Per the canonical-substitution-per-regime mapping:

| Substitution | Regime | Stability cone `S_S` |
|---|---|---|
| **Fibonacci** (n=2) | Scott-continuous | `{w : w_1 > w_2}` (exactly) |
| **Padovan** (n=3) | strict-finite | favors `w_1 < w_2 < w_3` (increasing — plastic-number eigenvector) |
| **Tribonacci** (n=3) | transfinite-bounded | contains strict-Pisot cone, contained in `{w_1 ≥ max(w_2,w_3)}` |
| **Tetranacci** (n=4) | (aperiodic-extension) | contains strictly-decreasing-weights cone |

The shape-specificity reflects the substitution rule's predicate-category structure — which letter-class maps to which determines the right-Perron eigenvector's ordering.

## Connection to H^1 and to the void cone

For Boolean value category, the step-n classifying invariant is the rank-n part of `H^1(F_v)`. Via the void-cone Verdier pairing, it's equivalently the rank-n part of `gr(Void_v) = ⊕_μ Z` indexed by non-Scott-continuous firing ordinals `μ`.

For continuous-V (Lawvere, Łukasiewicz, tropical max-plus), the classifying invariant lives in the appropriate `V^n` and the iterated-substitution endomorphism's eigenvalues are the **tropical eigenvalues** of `M`.

## Tropical-rank-collapse theorem

The `tropical-rank-collapse-classification` theorem (at this object's `docs/dev/theorems/`) characterizes the boundary of the weight-stability cone — explicitly for Fibonacci, semi-algebraically for the others. The boundary is where the iterated weighted-matrix `M_w^k` collapses from tropical rank `n` to a strictly smaller rank.

## Step-n moduli substack interpretation

The step-n classifying invariant is constant on connected components of the step-n moduli substack `M^(n)`. The substrate's step-shift morphism `M^(2) → M^(3) → ⋯` between step-n moduli substacks induces consistent step-n-classifying-invariant maps — the substitution-regime mapping (Fibonacci→Scott-cont, Padovan→strict-finite, Tribonacci→transfinite-bounded) is the regime-level reflection of which step-n classifying-invariant data dominates.

## Substrate uses

- **Orbit-type classification of continuous-V settlings** — relies on `cl-inv^(n)` being non-degenerately rank `n`.
- **Anderson-Putnam direct limit** — the direct-limit structure of `cl-inv^(n)` IS the Anderson-Putnam construction's per-step-n slice.
- **Tropical-rank-collapse boundary tracking** — identifying which weights produce rank-degenerate vs rank-stable classifying invariants in continuous-V.

## Position

`step-n-moduli-substack/library/step-n-classifying-invariant/`. Settling tier — direct `library/` (derived term of step-n-moduli-substack; classifying invariants are derived from moduli substack structure). The placement records that step-n classifying invariants are a property of step-n moduli configurations.

## Derivation source

**Minted from theorem context.** Referenced by `tropical-rank-collapse-classification` (the most explicit definition source), `continuous-valued-step-n-cohomological-rank`, `step-n-cohomological-rank-theorem` (already placed in batch 10), and downstream orbit-classification theorems with no own archive scrap. Reconstructed primarily from the tropical-rank-collapse theorem's Steps 1-2 which give the explicit `cl-inv^(n) ≅ lim→ (V^n, M_w^T)` formula.
