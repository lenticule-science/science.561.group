---
name: closure-2-monad
description: "The 2-functor Cl: PrFib(L, C, E) → PrFib(L, C, E) defined by fiberwise application of a C-natural closure-operator family, equipped with unit η (inclusion-into-closure) and multiplication μ (nested-closure collapse). The 2-categorical promotion of the closure-operator that operationally drives settling."
symbol: "Cl"
depends-on: [closure-operator, predication-fibration, knowledge-order]
derives-from: docs/dev/scraps/closure-2-monad.md
---

# Closure 2-monad

Given a `C`-natural closure-operator family `cl = (cl_p)_{p ∈ C}`, the **closure 2-monad** is the 2-functor

$$\mathrm{Cl} : \mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E) \to \mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$$

on the 2-category of predication-fibrations, defined fiberwise:

$$\mathrm{Cl}(\mathcal{E})_q \;:=\; \mathrm{cl}_q(\mathcal{E}_q).$$

The 2-monad structure consists of `(Cl, η, μ)` where:

## Unit `η: 1 ⇒ Cl`

The **inclusion-into-closure**. At each fiber `E_q` and each value `v ∈ E_q`,

$$\eta_{\mathcal{E}, q}(v) \;:\; v \to \mathrm{cl}_q(v)$$

witnesses inflationarity `v ≤_k cl_q(v)` in the knowledge order — the closure-operator axiom that the closure of `v` always extends `v`.

The 2-cell here records the knowledge-order inequality as a morphism in the 2-categorical setting. In the discrete (1-categorical) projection, the unit is just the assertion of inflationarity; in the 2-categorical setting, it is structural data.

## Multiplication `μ: Cl² ⇒ Cl`

The **nested-closure collapse**. For each fiber,

$$\mu_{\mathcal{E}, q} : \mathrm{cl}_q(\mathrm{cl}_q(\mathcal{E}_q)) \to \mathrm{cl}_q(\mathcal{E}_q).$$

In the **strict case**, `μ` is the identity — `cl_q(cl_q(v)) = cl_q(v)` exactly, by classical idempotence of the underlying closure-operator.

In the **lax case**, `μ` is a canonical non-identity 2-cell witnessing idempotence **up to coherence**. The 2-monad records that successive applications of `Cl` give the same closure object, but only up to an isomorphism `μ` that the coherence axioms make canonical.

## Coherence axioms

The 2-monad `(Cl, η, μ)` must satisfy the standard 2-monad coherence:

- **Unit triangle:** `μ ∘ Cl(η) = id = μ ∘ η_Cl`. Composing unit with multiplication recovers identity (in both directions).
- **Associativity:** `μ ∘ Cl(μ) = μ ∘ μ_Cl`. Nested-collapse is associative on triple nestings `Cl³`.

These are the categorification of the standard monad axioms — they ensure the closure operation behaves coherently under iteration.

## Lax-idempotence (Kelly–Lack K1)

In the 2-categorical setting, the strict-idempotence axiom of the underlying classical closure-operator is **replaced** by lax-idempotence: there is an adjunction

$$\mu \;\dashv\; \eta_\mathrm{Cl}$$

with identity counit (the Kelly–Lack K1 condition). This means the closure 2-monad is what categorial logicians call a **Kock-Zöberlein (KZ) monad** — the prototypical example of a "left-lax" 2-monad whose strict-axiom version is closure.

The revised four axioms for `Cl` as a closure-2-monad:

1. **Monotone in `≤_k`** — 2-functoriality of `Cl`.
2. **Inflationary** — unit `η` of the 2-monad.
3. **Lax-idempotent** — `μ ⊣ η_Cl` with identity counit.
4. **`C`-natural** — `Cl` commutes with reindexing along predicate-category morphisms.

## Scott-continuity recovery

Under Scott-continuity of the underlying closure-operator (`κ = ω` regime), the revised lax-idempotence reduces to strict idempotence. Formally: **lax-idempotence plus Scott-continuity ⟹ strict idempotence**.

This is the formal reason the positing-tier `scott-continuous-posit-category` collapses the 2-categorical machinery to ordinary 1-categorical closure-operators: at `κ = ω`, the coherence becomes equality, and the 2-monad becomes just a monad on the 1-category of fibrations.

In higher regimes (transfinite-bounded, aperiodic), the 2-categorical structure cannot be collapsed — the coherence is genuinely 2-dimensional, and the closure-2-monad is essentially a 2-monad with non-trivial `μ` data.

## Two KZ structures disentangled

The closure 2-monad on `PrFib(C)` is **distinct from** the Gray–Street fibration 2-monad `M` on `Cat/C`:

- **`M`-algebra status** — "`E` is a fibration" — is a *vertical structural property*. It says the underlying functor `p: E → C^op` has the Cartesian lift structure.
- **`Cl`-algebra status** — "`E`'s state is closed under `C`-inference" — is a *saturation property*. It says the per-fiber values have been pushed up to their closure.

They **compose**: a presheaf that is both an `M`-algebra (a cloven fibration) and a `Cl`-algebra (`C`-closed) is a **fully `C`-closed settlement**.

The structural separation is important: making the wrong identification (treating fibration status and closure status as the same monad) loses the distinction between "has the right shape" and "has been saturated under inference." Both are needed; both are 2-monadic; they are different 2-monads.

## Role in the settling-endofunctor

The settling-endofunctor is `F_U(E)_τ := Cl(E) ∨_k u_τ`. The closure 2-monad is the **closure side** of that operator: at each step, it saturates the state under derivable consequences before the increment-sequence `u_τ` merges in new evidence.

In one full settling step:

1. Apply `Cl` to the current state — derive all inferential consequences.
2. Knowledge-order join with `u_τ` — add new evidence from outside.
3. Result is the next settling state `v_{τ+1}`.

The closure-2-monad is therefore the **inferential engine** of settling; the increment-sequence is its **external input**. The two together drive the orbit toward fixed point (quiescence).

## Position

`settling/hacking/library/closure-2-monad/`. Settling tier — the closure-2-monad is settling's operational machinery. The underlying classical closure-operator lives at predicating tier under `variety/library/lattice/library/closure-operator/` as the point-level value-algebra structure; the 2-monadic promotion to fibrations is here at settling.

## Derivation source

Adapted from `predication-categories/morphisms/closure-2-monad.md`, preserved verbatim at `docs/dev/scraps/`.
