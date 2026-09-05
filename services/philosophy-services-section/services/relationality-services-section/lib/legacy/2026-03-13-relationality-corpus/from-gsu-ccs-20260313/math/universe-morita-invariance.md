---

name: universe-morita-invariance
description: "the relational universe R with all its distinguished structure depends only on the Morita equivalence class of the history site, not on the particular presentation."
---

### Theorem — Morita Invariance of the Relational Universe {#universe-morita-invariance}

Let $(T, J, H, \sigma, \Delta)$ and $(T', J', H', \sigma', \Delta')$ be two primitive data sets
satisfying all eight axioms, with Morita-equivalent history sites
$(T, J) \simeq_{\mathrm{Mor}} (T', J')$ and compatibly equivalent fiberwise Heyting-modal
structures. Then:

1. There is an equivalence of toposes $R \simeq R'$.

2. Under this equivalence: representables correspond, $H$ to $H'$, fixed subobjects to fixed
   subobjects, modal operators to modal operators, and $U_G$ to $U_{G'}$.

**Consequence.** The relational universe is determined by its propositional laws, not by the
particular history site chosen to present them. Any two constructions satisfying the same axioms
with Morita-equivalent presentations yield canonically equivalent universes.

**Proof sketch.** The Comparison Lemma for Grothendieck toposes states that a morphism of sites
that is a Morita equivalence induces an equivalence of sheaf toposes. The Morita equivalence
hypothesis gives $\mathbf{Sh}(T, J) \simeq \mathbf{Sh}(T', J')$. Compatibility of the fiber
data under this equivalence extends the topos equivalence to an equivalence of relational
universe structures. The precise hypothesis — "same abstract algebraic content" — requires that
the history sites be Morita-equivalent and the fiberwise data be compatible under the comparison
functor; this needs to be spelled out from the axioms. $\square$

#### Remark — Why Arbitrary Refinement Does Not Suffice {#universe-morita-invariance-refinement}

If $(T_{\mathrm{ref}}, J_{\mathrm{ref}})$ is obtained from $(T, J)$ by strengthening the
topology — adding more covering sieves — then $\mathbf{Sh}(T_{\mathrm{ref}}, J_{\mathrm{ref}})$
is in general *strictly smaller* than $\mathbf{Sh}(T, J)$. More covering conditions impose
more gluing requirements; fewer presheaves satisfy all of them. The sheaf category shrinks; it
does not remain equivalent.

The theorem's hypothesis is therefore not mere refinement but **Morita equivalence**: the new
site must be equivalent to the old in the sense that the induced comparison functor is an
equivalence. This is a strictly stronger condition than $J_{\mathrm{ref}} \supseteq J$.
