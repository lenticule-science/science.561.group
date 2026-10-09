---
type: question
class: internal
status: open
explores: [bilattice-two-orders-duality, truth-order-closure, predication-settling]
title: What does the σ-rotation classify?
description: The bilattice two-orders duality establishes $\sigma$ as an auto-equivalence of the predication-presheaf category that conjugates $Tk$-theory to $Tt$-theory and identifies their cohomologies.
---

# What does the σ-rotation classify?

The [bilattice two-orders duality](../../research/2026/07/31/lenticule-import/theorems/bilattice-two-orders-duality.md) establishes $\sigma$ as an auto-equivalence of the predication-presheaf category that conjugates $T_k$-theory to $T_t$-theory and identifies their cohomologies. Cellwise, $\sigma$ rotates the FOUR diamond by 90°, sending the knowledge axis $\bot \leftrightarrow \top$ onto the truth axis $\mathbf{f} \leftrightarrow \mathbf{t}$.

Crucially, $\sigma$ preserves the time-direction: applied pointwise to a $T_k$-trajectory $v_0 \leq_k \cdots \leq_k v_\kappa$, the image $\sigma_*(v_\tau)$ ascends in $\leq_t$ in lockstep with $\tau$. So $\sigma$ is **not a time-reversal**; it is a value-category rotation between two parallel theories.

The duality theorem says the rotation is *cohomologically silent*: $H^n(\mathcal{F}_v) \cong H^n(\mathcal{F}_{\sigma_*(v)})$. So at the cohomology level, $\sigma$ classifies nothing new. The open question is what it classifies *beyond* cohomology — what extra structure on a settling can be read out of the comparison between $v$ and $\sigma_*(v)$.

## Sub-questions

1. **σ-fixed points among settlings.** Which $T_k$-settlings $v$ satisfy $\sigma_*(v) = v$ (cellwise)? A cell stuck at $\bot$ throughout would map to $\mathbf{f}$ throughout, so $\sigma$-fixed-point means cellwise $v(p)(s,o) \in \{\sigma\text{-fixed values}\}$. But $\sigma$ has no fixed points on FOUR (it's a 90° rotation), so no settling is pointwise σ-fixed unless it's empty. The right notion is **σ-self-dual**: $\sigma_*(v)$ is $T_k$-equivalent to $v$ under some natural equivalence. Specify the equivalence and classify.

2. **σ-image as natural $T_t$-settling.** Given a $T_k$-rule system that produces $v$, what's the corresponding $T_t$-rule system that produces $\sigma_*(v)$? The duality theorem constructs $T_t = \sigma T_k \sigma$, but this is the conjugate operator, not necessarily a "natural" rule system. When does $\sigma_*$ map a $T_k$-rule system to a $T_t$-rule system that arises naturally from semantic considerations on the truth axis?

3. **Lorentzian-base test.** On a Lorentzian causal-set settling, $\sigma$ acts cellwise on values, leaving the base structure untouched. Does $\sigma_*$ commute with the past↔future cone swap? Prediction: yes, but trivially — $\sigma$ acts on values, the cone swap acts on the base; they commute by acting on independent factors. The non-trivial test is whether $\sigma$ acts on the [apex/void cohomology pairing](../../research/2026/07/31/lenticule-import/theorems/lorentzian-apex-void-as-timelike-spacelike.md) in a structured way.

4. **G-action refinement of strong-MLD orbits.** The [Klein-four self-duality on named substitutions](../../research/2026/07/31/lenticule-import/examples/klein-four-self-duality-on-named-substitutions.md) classifies substitutions by their $K_4 = \langle \sim, - \rangle$ orbit. Adding $\sigma$ extends to $D_4$. Which substitutions are $D_4$-self-dual but not $K_4$-self-dual?

## Why it matters

If $\sigma$ classifies nothing beyond cohomology, the duality theorem is cohomologically tight: the truth-axis theory carries the same data as the knowledge-axis theory, and there's no extra invariant from comparing them. This is a cleanness result — predication categories' $T_k$-theory is the "complete" theory up to $\sigma$-rotation.

If $\sigma$ classifies something *beyond* cohomology — orbit refinements, fixed-point structures, Lorentzian apex pairings — then the corpus has hidden value-category content that the cohomology misses.

## Connection to existing structure

- [Bilattice two-orders duality theorem](../../research/2026/07/31/lenticule-import/theorems/bilattice-two-orders-duality.md): defines $\sigma$ and proves the cohomology identification.
- [Klein-four self-duality on named substitutions](../../research/2026/07/31/lenticule-import/examples/klein-four-self-duality-on-named-substitutions.md): the existing $K_4$ orbit classification.
- [Conflation as knowledge-axis reflection](../../learning-articles/questions/conflation-as-knowledge-axis-reversal.md): the *intra-axis* reflection, contrasted with $\sigma$'s inter-axis rotation.
- [Three backward structures and their symmetry](../../learning-articles/questions/three-backward-structures-and-their-symmetry.md): the meta-question on how $\sigma$ relates to conflation and cosettling.
