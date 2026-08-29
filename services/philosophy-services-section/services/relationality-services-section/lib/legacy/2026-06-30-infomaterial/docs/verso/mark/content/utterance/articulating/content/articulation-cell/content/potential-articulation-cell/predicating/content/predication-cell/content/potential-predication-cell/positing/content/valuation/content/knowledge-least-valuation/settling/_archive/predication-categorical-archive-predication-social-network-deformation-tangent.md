---
type: example
status: verified
depends-on: [skh-deformation-ext-classification, settling-cohomology-vanishes-above-degree-1, social-network-strong-mld-orbits, social-network-verdier-dual, strict-regime-deformation-tangent]
instantiates: [skh-deformation-ext-classification]
lineage: 2
---

# Deformation tangent of a social-network settling

The L2 instance of the [Ext-classification of SKH deformations](../theorems/skh-deformation-ext-classification.md). **Lineage 2** instance, intermediate between the [L1 rigid case](strict-regime-deformation-tangent.md) and richer transfinite-bounded / aperiodic deformations: the L2 multi-cell setting gives finite-discrete tangent space.

## Setup

Take the L2 settling from [social-network-verdier-dual](social-network-verdier-dual.md): $E = \{a, b\}$, single $P$, $\lambda = 3$, with two firings on disjoint cells (truth-only at $(a, b)$, falsity-only at $(b, a)$).

## Ext^1 computation

A first-order deformation perturbs the settling near $v$ over the dual numbers $k[\epsilon]/(\epsilon^2)$. The cellular structure and rule structure both contribute potential tangent directions:

- **Cell-value perturbations.** Each settled cell could be perturbed: $(a, b)$'s $\mathbf{t}$ could shift to $\bot, \mathbf{f}, \top$; $(b, a)$'s $\mathbf{f}$ could shift similarly. But these are *discrete* jumps in $\mathbf{FOUR}$, not infinitesimal directions. Hence not first-order deformations.

- **Increment-time perturbations.** The increment $u_1$ fires at $\tau = 1$; $u_2$ at $\tau = 2$. Could the firing ordinals be perturbed? In a continuous-ordinal setting, yes. In our discrete-ordinal setting, no — ordinals are integers, no $\epsilon$-direction.

- **Rule perturbations.** The settling has no closure rules (the increments directly assert cell values), so no rule-perturbation tangent direction.

**Result:** $\mathrm{Ext}^1(\mathcal{F}_v, \mathcal{F}_v) = 0$ — same as the L1 rigid case. The Boolean / discrete data structurally prevents continuous tangent directions.

## Ext^2

By the [vanishing-above-degree-1 theorem](../theorems/settling-cohomology-vanishes-above-degree-1.md), $\mathrm{Ext}^2 = 0$. Vacuously unobstructed (no first-order deformations to extend).

## What this exhibits

The L2 base is **also rigid** despite its multi-entity structure — the discrete Boolean d-frame data forces all deformation tangent spaces to vanish in the strict regime. The *cardinality* of the moduli stack is larger here (160 points vs L1's 4), but the *tangent space* at each point is still zero-dimensional.

The deformation rank progression from L1 to richer lineages:

- L1 rigid (this lineage's base case): $\dim \mathrm{Ext}^1 = 0$.
- L2 (this file): $\dim \mathrm{Ext}^1 = 0$ — also rigid in the strict regime.
- L4 transfinite-bounded (forthcoming): $\dim \mathrm{Ext}^1 = |L_{\mathrm{ns}}|$ — countable continuous tangent directions emerge from the closure-rule perturbations.
- L5 aperiodic (forthcoming): $\dim \mathrm{Ext}^1 = 2^{\aleph_0}$ — uncountable.

The transition happens at the **transfinite-bounded regime**, where closure rules become essential and rule perturbations give continuous deformation directions. The strict regime — both L1 and L2 — is uniformly rigid.

## Position in Lineage 2

The L2 deformation tangent. With this in hand, L2 has been carried through predication categories' chapters end-to-end:

- Settling structure ([relational-database-settling](relational-database-settling.md), [friendship-four-generators](friendship-four-generators.md), [multi-agent-epistemic-settling](multi-agent-epistemic-settling.md))
- Multi-agent / CRDT ([three-replica-mayer-vietoris](three-replica-mayer-vietoris.md))
- Hyperdoctrine ([social-network-hyperdoctrine-adjoints](social-network-hyperdoctrine-adjoints.md))
- Moduli ([two-entity-moduli](two-entity-moduli.md))
- Curry equivalence on cellular fiber ([strict-regime-two-cell-curry](strict-regime-two-cell-curry.md))
- Verdier dual ([social-network-verdier-dual](social-network-verdier-dual.md))
- Strong-MLD orbits ([social-network-strong-mld-orbits](social-network-strong-mld-orbits.md))
- Six-functor tensor ([social-network-six-functor-tensor](social-network-six-functor-tensor.md))
- Meta-classifier ([social-network-meta-classification](social-network-meta-classification.md))
- Deformation tangent (this file)

L2 is now complete as the lineage's intended role: the *richer-than-trivial-but-still-finite* benchmark with social-network semantics.
