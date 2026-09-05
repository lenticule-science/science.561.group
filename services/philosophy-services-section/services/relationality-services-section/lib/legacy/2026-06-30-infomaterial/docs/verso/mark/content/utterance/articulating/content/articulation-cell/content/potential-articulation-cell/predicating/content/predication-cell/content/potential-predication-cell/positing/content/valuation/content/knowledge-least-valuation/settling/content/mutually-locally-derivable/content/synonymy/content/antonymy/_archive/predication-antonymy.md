---
type: concept
class: strong-mld-relation
symbol: "\\sim_{\\mathrm{ant}}"
depends-on: [synonymy, negation-twisted-settling, negation-invisibility, strong-mld-via-composed-duality, negation-involution-on-settling-category]
see-also: [antonymy-criterion, synonymy-criterion, settling-fiber-groupoid, klein-four-symmetry, equivariant-settling-cohomology]
---

# Antonymy

Two [predication settlings](../objects/predication-settling.md) $v, v'$ over a common base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$ are **antonymous** — written $v \sim_{\mathrm{ant}} v'$ — iff $v$ is [strong-MLD-equivalent](../theorems/strong-mld-via-composed-duality.md) to the [negation-twisted settling](../objects/negation-twisted-settling.md) of $v'$:

$$v \sim_{\mathrm{ant}} v' \;\iff\; v \sim_{\mathrm{sMLD}} \sim(v').$$

## Why antonymy requires strong-MLD

At the ordinary MLD level, antonymy would collapse to synonymy. By [negation-invisibility](../theorems/negation-invisibility.md), $v \sim_{\mathrm{syn}} \sim(v)$ for every settling — so $v \sim_{\mathrm{syn}} \sim(v')$ iff $v \sim_{\mathrm{syn}} v'$. The negation-twist is invisible to ordinary synonymy because bilattice negation $\sim$ preserves the firing-ordinal set (it fixes $\bot$ on $\mathbf{FOUR}$, so it doesn't change when cells acquire evidence, only which side of the truth/falsity axis they land on).

The [strong-MLD classification](../theorems/strong-mld-via-composed-duality.md) refines ordinary MLD by the firing-orbit-type function $\tau^{\mathbb D}$, which records whether each non-Scott-continuous firing is truth-only, falsity-only, or $\top$. Negation flips truth-only $\leftrightarrow$ falsity-only while fixing $\top$-firings, so it acts non-trivially on strong-MLD classes. Antonymy is the relation on settlings induced by this action.

## Properties

**Symmetry.** $v \sim_{\mathrm{ant}} v'$ implies $v' \sim_{\mathrm{ant}} v$. Proof: $v \sim_{\mathrm{sMLD}} \sim(v')$ implies (by [negation-involution-on-settling-category](../theorems/negation-involution-on-settling-category.md): $a \sim_{\mathrm{sMLD}} b \Leftrightarrow \sim(a) \sim_{\mathrm{sMLD}} \sim(b)$) $\sim(v) \sim_{\mathrm{sMLD}} \sim(\sim(v')) = v'$, i.e., $v' \sim_{\mathrm{sMLD}} \sim(v)$. $\square$

**Non-reflexivity (generic).** $v \sim_{\mathrm{ant}} v$ iff $v \sim_{\mathrm{sMLD}} \sim(v)$, which holds iff every NSC firing of $v$ is a $\top$-firing (see self-antonymous settlings below). Generic settlings are not self-antonymous.

**Anti-transitivity.** If $v \sim_{\mathrm{ant}} v'$ and $v' \sim_{\mathrm{ant}} v''$, then $v \sim_{\mathrm{sMLD}} v''$: the antonym of an antonym is a (strong-MLD) synonym, not an antonym. Proof: $v \sim_{\mathrm{sMLD}} \sim(v')$ and $v' \sim_{\mathrm{sMLD}} \sim(v'')$ implies $\sim(v') \sim_{\mathrm{sMLD}} \sim(\sim(v'')) = v''$, so $v \sim_{\mathrm{sMLD}} v''$. $\square$

## Self-antonymous settlings

A settling $v$ is **self-antonymous** — $v \sim_{\mathrm{ant}} v$ — iff $\tau^{\mathbb D}(v)$ is fixed by the evidence-flip $\varepsilon$ (truth-only $\leftrightarrow$ falsity-only), which holds iff every NSC firing of $v$ is a $\top$-firing (both-sided, paraconsistent). These are exactly the **paraconsistent settlings** — the $\mathbb{D}_{\mathrm{val}}$-self-dual sheaves identified in [bilattice-negation-on-d-frame-valued-sheaves](../theorems/bilattice-negation-on-d-frame-valued-sheaves.md).

Self-antonymous settlings are the analogue of natural-language auto-antonyms (words such as "cleave" that carry both a meaning and its opposite simultaneously). Their self-antonymy reflects the co-presence of positive and negative evidence in the settling.

## Antonymy orbit structure

The [negation involution](../theorems/negation-involution-on-settling-category.md) $\sim(-)$ acts on the set of strong-MLD classes. Each orbit has size:

- **1** (self-antonymous): $[\sim(v)]_{\mathrm{sMLD}} = [v]_{\mathrm{sMLD}}$ — when every NSC firing of $v$ is a $\top$-firing.
- **2** (antonymous pair): $[\sim(v)]_{\mathrm{sMLD}} \neq [v]_{\mathrm{sMLD}}$ — the generic case, where truth-only and falsity-only firings distinguish the two classes.

The antonymous pairs are exactly the exchange-paired orbits in the strong-MLD orbit-type stratification of [strong-mld-via-composed-duality](../theorems/strong-mld-via-composed-duality.md): $\mathcal{M}_{\mathrm{exchange}}^{\mathrm{aper}}/\mathbb{Z}_2$.

## Regime collapse in strict and Scott-continuous regimes

In the strict and Scott-continuous regimes, there are no NSC firings, so $\tau^{\mathbb D}$ is vacuous and strong-MLD equals ordinary MLD. The antonymy criterion reduces to the synonymy criterion: $v \sim_{\mathrm{ant}} v'$ iff $v \sim_{\mathrm{syn}} v'$. Every settling is antonymous precisely to its synonymy class. Antonymy becomes a non-trivial refinement of synonymy only in the transfinite-bounded and aperiodic regimes.

## What antonymy is not

- **Synonymy** ($\sim_{\mathrm{syn}}$): same strong-MLD class, same firing-type function. Strictly coarser — every pair of antonyms is an ordinary-MLD synonym pair (negation-invisibility), but not a strong-MLD synonym pair.
- **Orthogonal refactoring**: a refactoring (invisible automorphism) maps $v$ to itself; antonymy maps $v$ to a settling with evidence-flipped firing types.
- **Conflation-antonymy**: the dual notion using conflation $-$ instead of negation $\sim$. Not definable at the settling level — conflation is $\leq_k$-antitone and does not give valid settlings. The full [Klein-four symmetry](teaching/explanations/klein-four-symmetry.md) acts at the d-frame-valued sheaf level via the composed duality $\mathbb{D}$.
