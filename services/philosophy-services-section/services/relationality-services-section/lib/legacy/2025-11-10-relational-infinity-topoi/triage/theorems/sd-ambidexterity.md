---
name: sd-ambidexterity
type: theorem
class: equivalence
status: sketch
lean: RelationalInfinityTopoi.sd_ambidexterity
depends-on:
  - ambidexterity
  - ambidexterity-comparison
  - constructibility
  - sd-constructible-stack
  - kz-comonad-G
---

For a [stratified directed ∞-site](../objects/stratified-directed-infinity-site.md) $\mathcal{S}$ in a [relational ∞-topos](../objects/relational-infinity-topos.md) and an [SD-constructible](../teaching/explanations/constructibility.md) diagram $F : \mathcal{S} \to \mathcal{H}$, the [ambidexterity comparison](../morphisms/ambidexterity-comparison.md)

$$\mathrm{Nm}_F \;:\; \mathrm{colim}_{\mathcal{S}}\, F \;\xrightarrow{\sim}\; \lim_{\mathcal{S}}\, F$$

is an equivalence. Equivalently, at every position $i$ the [latching object](../morphisms/latching-functor.md) $L_i F$ and the [matching object](../morphisms/matching-functor.md) $M_i F$ are linked by a canonical comparison whose [KZ-comonad](../morphisms/kz-comonad-G.md) stabilization recovers $F(i)$.

## Proof sketch

By induction on degree.

- **Base case** ($\deg i = 0$): $L_i F$ is initial and $M_i F$ is terminal in the relevant slice; the per-position comparison reduces to the unit-counit pair of the KZ comonad $G$, which is an equivalence on $G$-coalgebras. Constructibility at degree 0 is exactly $F(0) \in \mathrm{coAlg}(G)$.
- **Inductive step:** assume the equivalence at all $j$ with $\deg j < \deg i$. The colimit/limit structures on the latching/matching neighborhoods are then related by the inductive equivalence, and the per-position comparison at $i$ is the $G$-stabilization of the latching-to-matching span — an equivalence by SD-constructibility at $i$.

Globalizing the per-position equivalences using the SD-site's coverage gives the global $\mathrm{Nm}_F$ equivalence.

## Status

Sketch. The induction is correct in outline but the *globalization* step — passing from per-position to global equivalence — requires a descent argument on the SD coverage that the source drafts only hand-wave. Promotion to `draft` requires writing out the descent.

## Caveat — scope

The theorem statement is for SD-constructible diagrams. Source draft 2 sketches a stronger statement for the entire [field of existence](../objects/field-of-existence.md). The two are not equivalent (constructibility is the well-formedness condition; existence is the convergence condition). See [ambidexterity-scope](../questions/ambidexterity-scope.md).

## Lineage

This is the relational analogue of [Ayala–Francis–Rozenblyum 2015](../references/ayala-francis-rozenblyum-2015.md)'s ambidexterity for constructible sheaves on conically smooth stratified spaces, lifted to a relational ∞-topos with bilattice valuations. Their argument transports almost verbatim; what changes is the coefficient ∞-category.
