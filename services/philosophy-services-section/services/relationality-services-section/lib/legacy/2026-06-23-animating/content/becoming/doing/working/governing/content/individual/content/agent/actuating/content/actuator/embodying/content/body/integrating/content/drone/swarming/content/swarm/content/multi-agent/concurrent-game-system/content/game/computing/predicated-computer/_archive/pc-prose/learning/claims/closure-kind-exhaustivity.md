---
type: theorem
class: engineering-claim
status: sketch
depends-on: [closure-kind, closure-rule, extend-restrict-adjoint, closure-2-monad, dualized-closure-2-comonad, closure-algebra-coalgebra-correspondence, predication-fiber-algebra]
see-also: [settling-as-computation, substrate-operations-are-bigraded-modal, closure-rule-system-realizes-closure-2-monad]
---

# Every closure-rule application falls into exactly one of four closure-kinds

**Claim.** Every [closure-rule application](../morphisms/closure-rule-application.md) on the predication substrate is classified by the [closure-kind](teaching/explanations/closure-kind.md) taxonomy into exactly one of four positions: *Process*, *Derivation*, *Procedure*, or *Inquiry*. The classification is exclusive (no application is in two positions) and exhaustive (every application is in some position).

The classification is determined by which of the substrate's two structural directions — past-direction closure $\sigma$ (the [closure 2-monad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) $\mathrm{Cl}$) and future-direction closure $\Delta$ (the [dualized closure 2-comonad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/dualized-closure-2-comonad.md) $\mathrm{Cl}^*$) — the application leaves at fixed-point.

## Why this holds

The argument has two parts, each of which is the engineering register of an algebra/coalgebra correspondence in the closure 2-monad apparatus.

**Part 1: The four positions are exhaustive.** Each closure-rule application is characterized by its effect on two structural quantities of the substrate's [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md):

- Whether the application's output is a $\mathrm{Cl}$-algebra fixed point — i.e., $\sigma(v) = v$, the value is settled against accumulated history. Per [closure-algebras-are-$\mathcal{C}$-closed](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-algebras-are-c-closed.md), this is equivalent to the underlying fibration being $\mathcal{C}$-closed.
- Whether the application's output is a $\mathrm{Cl}^*$-coalgebra fixed point — i.e., $\Delta(v) = v$, the value is preserved across forward (dual) extensions. Per [closure-algebra-coalgebra correspondence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-algebra-coalgebra-correspondence.md), $\mathrm{Cl}$-algebras correspond bijectively to $\mathrm{Cl}^*$-coalgebras under Jung-Rivieccio duality, but a *given output value* may be on neither side, one side, or both.

Each is a yes/no condition; the four combinations of `(σ-fixed, Δ-fixed)` form a partition with cells:

| σ-fixed | Δ-fixed | Closure kind |
|---|---|---|
| yes | yes | **Process** (deterministic, both stable) |
| no | yes | **Derivation** (saturation open, transfer stable) |
| yes | no | **Procedure** (saturation stable, transfer open) |
| no | no | **Inquiry** (both open) |

The two-dimensional yes/no partition has exactly four cells; every closure-rule application's output lands in exactly one cell.

**Part 2: The classification is exclusive.** A closure-rule application's output has a determinate value in the predication fiber algebra. Per [closure 2-monad lax-idempotence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md), being a $\mathrm{Cl}$-algebra is a *property*, not data — there is at most one $\mathrm{Cl}$-algebra structure on any given fiber, up to unique iso. So "$\sigma$ fixes this value" is a determinate yes/no question. Dually, by the [dualized closure 2-comonad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/dualized-closure-2-comonad.md)'s colax-idempotence, "$\Delta$ fixes this value" is also determinate. The two-dimensional partition is therefore exclusive.

A *single* application produces a single output (or a finite set of outputs, classified individually). There is no sense in which an application "straddles" cells of the partition.

## Engineering consequence

The exhaustivity guarantee is what makes the closure-kind taxonomy structural rather than approximate. An engineer building a substrate operation can ask, deterministically, which closure-kind the operation belongs to — and the answer is always one of the four. There is no fifth position to handle, and no operation that fails to fit.

The engineering content of each kind is then determinate (per [closure-kind](teaching/explanations/closure-kind.md)):

- **Process** kind: full determinism, suitable for pure-function implementation, byte-identical replay.
- **Derivation** kind: deterministic given a result-shape contract, suitable for LLM-with-structured-output implementation, replay-equivalent up to the shape.
- **Procedure** kind: deterministic given dispatch rules, suitable for routing-decision implementation, replay-identical decisions.
- **Inquiry** kind: non-deterministic, suitable for open-ended LLM-agent implementation, replay-incompatible by design.

The substrate's runtime can dispatch operations to appropriate execution disciplines based on closure-kind, with full coverage and no hidden cases.

## A pathological case worth ruling out

A substrate that *attempted* to add a fifth closure-kind — say, "Stochastic" for non-deterministic Process — would face a structural problem: the (σ-fixed, Δ-fixed) signature has only four cells, and any new kind would either duplicate an existing cell (not novel) or step outside the substrate's algebra (not a closure-rule application). The four positions exhaust the substrate's two-dimensional structural space.

Particular platform realizations may *subdivide* the four positions for engineering convenience (Process-with-side-effects, Process-without-side-effects, etc.), but the subdivisions live within one of the four; they don't add cells to the partition.

## Modal reading

Per [substrate-operations-are-bigraded-modal](substrate-operations-are-bigraded-modal.md), the four positions are the four cells of the bigraded modal lattice generated by the substrate's two KZ structures: $\sigma$ (the [closure 2-monad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md), a necessity-style modality on the truth axis) and $\Delta$ (the [dualized closure 2-comonad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/dualized-closure-2-comonad.md), a possibility-style modality on the knowledge axis). The (σ-fixed, Δ-fixed) signature is therefore the $(\Box / \Diamond)$ × $(\sigma / \Delta)$ modal-position signature; the four closure-kinds are the four corners of the modal lattice.

## What the theorem requires

- The substrate's closure machinery is structured as both a [closure 2-monad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) $\sigma$ and its [dualized 2-comonad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/dualized-closure-2-comonad.md) $\Delta$ on the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md). Substrates without this two-direction structure have a different (or no) closure-kind taxonomy.
- The two operators commute under Jung-Rivieccio duality (per [closure-algebra-coalgebra correspondence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-algebra-coalgebra-correspondence.md)), so that the (σ-fixed, Δ-fixed) signature is well-defined.
- The fixed-point conditions $\sigma(v) = v$ and $\Delta(v) = v$ are determinate (decidable) for any value $v$ in the fiber algebra. By lax-idempotence (resp. colax-idempotence), the determinacy is structural.

Under these requirements, the four-position taxonomy is exhaustive and exclusive by construction.

## Status

Sketch. The full proof requires verifying that the (σ-fixed, Δ-fixed) signature is decidable for every value in the fiber algebra — which depends on the residuated lattice $\mathbf{L}$'s decidability properties. The four-bilattice case ($\mathbf{L} = \mathbf{2}$, fiber algebra $\mathbf{FOUR}$) is decidable per [@adjoint-structure-spo-bilattice]. For larger $\mathbf{L}$, decidability is conditional on $\mathbf{L}$'s structure; the substrate's engineering may need to admit only $\mathbf{L}$-instances whose decidability is ensured.
