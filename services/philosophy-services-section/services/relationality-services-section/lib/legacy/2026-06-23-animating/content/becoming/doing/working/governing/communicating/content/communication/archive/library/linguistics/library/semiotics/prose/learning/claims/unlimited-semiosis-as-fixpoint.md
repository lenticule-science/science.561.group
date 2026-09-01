---
type: theorem
status: sketch
depends-on:
  - ../teaching/explanations/sign-relation.md
  - ../teaching/explanations/interpretant.md
  - ../teaching/explanations/code.md
  - ../objects/semiotic-system.md
  - ../../../../information/theories/knowledge-systems/theories/predicated-knowledge-systems/theorems/closure-as-fitting-fixpoint.md
see-also:
  - ../teaching/explanations/connotation.md
  - questions/semiosis-bound-and-grounding.md
  - references/peirce-cp.md
  - references/eco1976.md
---

# Unlimited semiosis is the closure operator's bilattice fixpoint (sketch)

**Claim** (sketch). For a [semiotic system](../objects/semiotic-system.md) $\mathcal{S} = (V, O, I, K, R, \Sigma)$, the *unlimited-semiosis chain* generated from a starting sign-relation $r_0 = (V_0, O_0, I_0)$ — the iterated process by which each [interpretant](../teaching/explanations/interpretant.md) becomes the [sign-vehicle](../teaching/explanations/sign-vehicle.md) of a further sign-relation — converges to the bilattice-$\leq_k$-least fixpoint of the system's [code](../teaching/explanations/code.md)-derived closure operator on the fiber containing $r_0$. The chain's *regime* (Scott-continuous, transfinite-bounded, aperiodic) is the regime of the closure-rule subset $R$.

## Setup

Read $\mathcal{S}$ as a predicated knowledge system per the [composability narrative](../teaching/explanations/composability-with-predicated-knowledge-systems.md):

- The system's code-licensed pairings are the asserted-cell relation.
- The system's rule subset $R$ is a closure-rule system with bilattice value-domain $\mathbf{2} \otimes \mathbf{2}$ on each fiber.
- The starting sign-relation $r_0$ is an asserted cell in the substrate's fiber over the predicate $V_0$, subject $O_0$, interpretant $I_0$.

The *immediate-interpretant operator* $T_R$ on the system's fiber algebra is defined exactly as Fitting's bilattice immediate-consequence operator (per the substrate-level [closure-as-fitting-fixpoint](../../../../information/theories/knowledge-systems/theories/predicated-knowledge-systems/theorems/closure-as-fitting-fixpoint.md)) on the closure rules derived from the code $K$ and the rule subset $R$.

## Statement

**Theorem (sketch).** Let $v_0$ be the substrate state placing $r_0$ as an asserted cell. Then:

1. **(Monotonicity)** $T_R$ is monotone in $\leq_k$: each interpretant-step adds knowledge without retracting evidence at any prior cell.
2. **(Continuity)** When the code's interpretant-operations are Scott-continuous in $\leq_k$ (the *encyclopedia-bounded* regime corresponding to Eco's discipline per [Eco 1976](references/eco1976.md) §2.7), $T_R$ is Scott-continuous; the unlimited-semiosis chain converges at $\omega$.
3. **(Fixpoint)** The unlimited-semiosis chain $\mathrm{semiosis}_R(r_0) := \bigsqcup_{n < \omega} T_R^n(v_0)$ is the least fixpoint $\mathrm{lfp}_{\leq_k}(T_R, v_0)$.
4. **(Transfinite extension)** When the code's interpretant-operations are monotone but not Scott-continuous (the *open Peircean regime*), the chain converges at some countable ordinal $\kappa < \omega_1$; the fixpoint is $T_R^\kappa(v_0)$ taking $\sup$ at limit ordinals.

## Argument (transfer from the substrate-level theorem)

The argument transfers in five steps from the substrate-level [closure-as-fitting-fixpoint](../../../../information/theories/knowledge-systems/theories/predicated-knowledge-systems/theorems/closure-as-fitting-fixpoint.md):

1. The semiotic-system-as-predicated-knowledge-system identification (per the composability narrative) is faithful: every sign-relation reads as a substrate cell, every code-rule reads as a closure rule, every interpretant-step reads as a closure-rule firing. *Status*: sketch — the faithfulness is argued case-by-case in the four examples ([peircean](../examples/peircean-system.md), [saussurean](../examples/saussurean-system.md), [hjelmslevian](../examples/hjelmslevian-system.md), [lotmanian](../examples/lotmanian-system.md)) but not yet established in full generality.
2. Given the identification, the immediate-interpretant operator $T_R$ is exactly Fitting's $T_{\mathcal{S}}$ at the substrate level. Monotonicity (1) and continuity (2) follow from the substrate-level proofs without modification.
3. The least fixpoint exists by Kleene's theorem on the bilattice's $\leq_k$-complete structure; (3) follows.
4. The transfinite extension (4) follows from Kleene's theorem extended to chain-complete posets, exactly as the substrate-level proof.
5. The regime classification (Scott-continuous = bounded-encyclopedia / transfinite = open-Peircean) reads off the substrate's [four-regime dichotomy](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md) under the identification.

## Status: sketch

`status: sketch` because:

- Step (1) above (faithfulness of the semiotic-system-as-predicated-knowledge-system identification) is argued case-by-case but not in full generality. A general proof would require fixing the identification at the level of the Maruyama fibered algebraic semantics, which is a follow-up.
- The classification of historical semiotic systems by regime (which codes are Scott-continuous, which are transfinite-bounded) is partial. The four worked examples in `examples/` cover Peirce (transfinite, openly), Saussure (Scott-continuous within langue), Hjelmslev (Scott-continuous on the connotative tower), Lotman (transfinite-bounded by semiosphere); other semiotic traditions (Greimasian generative trajectory, Sebeok's biosemiotic, Halliday's social-semiotic) are not yet classified.
- The Lean formalisation is not yet attempted; the theorem inherits the substrate's `lean: pending` posture.
