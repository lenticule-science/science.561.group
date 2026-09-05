---
name: dualized-closure-2-comonad
description: "The Priestley-dual of the closure 2-monad: a 2-comonad Cl*: PrFib* → PrFib* on the 2-category of paired-Priestley opfibrations over C^op. Sends each opfibration to its closed-subspace selection by the primal closure operator. Counit is subspace inclusion (dual of inflationarity); comultiplication is the self-inclusion 2-cell (dual of idempotence)."
symbol: "Cl*"
depends-on: [closure-2-monad, dual-predication-hyperdoctrine, paired-priestley-space]
derives-from: docs/dev/scraps/dualized-closure-2-comonad.md
---

# Dualized closure 2-comonad

Let `PrFib*(L, C, E)` denote the 2-category of **paired-Priestley opfibrations** over `C^op` — the Priestley-dual of the predication-fibration 2-category `PrFib(L, C, E)` under Jung–Rivieccio duality.

The dualized closure 2-comonad

$$\mathrm{Cl}^* \;:\; \mathbf{PrFib}^* \to \mathbf{PrFib}^*$$

sends a paired-Priestley opfibration `p*: E* → C^op` to the opfibration whose fiber at each `q` is the **closed subspace** `K_q ⊆ X_q = E*_q` selected by the primal closure-operator `cl_q` via the closure-fixed-points-Priestley correspondence (archive theorem, not yet pulled).

## Why a co-monad on the dual side

The closure 2-monad on the primal side is a 2-monad (unit-multiplication structure). Under Jung–Rivieccio dualization, the monad becomes a **comonad** on the dual side. The reason: Spec is contravariant, so functor structures and natural transformations reverse direction. A monad `(T, η, μ)` with unit `η: 1 ⇒ T` and multiplication `μ: T² ⇒ T` dualizes to a comonad `(T*, ε, δ)` with counit `ε: T* ⇒ 1` and comultiplication `δ: T* ⇒ T*²`.

The primal-`Cl` 2-monad therefore corresponds to the dual-`Cl*` 2-comonad. The 2-comonad is the formally-correct dualized structure.

## Structure 2-cells

**Counit** `ε*: Cl*(E*) ↪ E*` — the **inclusion of the closed subspace**. Dual of the primal inflationarity unit `η: 1 ⇒ Cl` (which says `v ≤_k cl(v)`):

- Primal: `v` injects up into `cl(v)` — values grow.
- Dual: `cl*(E*) = K_q` includes into `E* = X_q` — point-sets shrink (since `Spec` is contravariant).

**Comultiplication** `δ*: Cl*(E*) → Cl*Cl*(E*)` — the canonical invertible 2-cell witnessing the self-inclusion `K_q ↪ K_q`. Dual of the primal idempotence multiplication `μ: Cl² ⇒ Cl` (which says `cl(cl(v)) = cl(v)`):

- Primal: nested closure collapses (`cl² → cl`).
- Dual: nested co-closure expands trivially (`Cl* → Cl*² ≅ Cl*`).

## Lax-idempotence dual

The primal `Cl` is **lax-idempotent** (Kelly–Lack K1: `μ ⊣ η_Cl` with identity counit). Under dualization, `Cl*` is **colax-idempotent** (the dual condition: `ε_{Cl*} ⊣ δ` with identity unit). This is the "right-lax" 2-comonad condition — the dual of left-lax.

In the Scott-continuous regime, both lax-idempotence (primal) and colax-idempotence (dual) collapse to strict idempotence. So at `κ = ω`, `Cl* ∘ Cl* = Cl*` strictly.

## Generator dualization

The four predicate-category generator classes dualize under Priestley correspondence:

| Primal generator | Dual operation on paired-Priestley fibers |
|---|---|
| specialization | inclusion of Priestley spectra (sub-support to full-support) |
| converse | swap involution on paired points |
| subject-projection | diagonal-extension (lifting function on diagonal points to rowwise) |
| object-projection | columnwise extension |

The dualized `Cl*` respects these dualized generators by construction — the Jung–Rivieccio duality theorem.

## Action on dual orbit

The primal orbit `(F_U^τ(E))_τ` is `≤_k`-monotone (values grow). The dual orbit `(F_U^{*τ}(E*))_τ` is **`co-≤_k`-monotone** — Priestley point-sets SHRINK as the orbit progresses.

The two pictures of the same settlement:

| Step | Primal `v_τ(p)` | Dual `v̂_τ(p)` |
|---|---|---|
| Initial | `⊥` (no evidence) | full Priestley space (no points excluded yet) |
| Later | `t` (positive only) | smaller subspace (negative points excluded) |
| Quiescent | settled value | quiescent subspace (further closure adds nothing) |

The dual quiescence happens at the same ordinal as the primal — they stabilize together.

## Role in dual hyperdoctrine

The `dual-predication-hyperdoctrine` (settling-tier sibling) carries `Cl*` as one of its component pieces — specifically the "dual closure 2-comonad" component of its tuple. The full dual hyperdoctrine is the primal hyperdoctrine with every component dualized; `Cl*` is the dual of the primal's `Cl`.

## Position

`finite-settlement-algebra/hacking/library/dualized-closure-2-comonad/`. Settling tier — `Cl*` operates on the dual side of settling, alongside the dual hyperdoctrine and the settlement-priestley-dual.

## Derivation source

Adapted from `predication-categories/morphisms/dualized-closure-2-comonad.md`, preserved at `docs/dev/scraps/`.
