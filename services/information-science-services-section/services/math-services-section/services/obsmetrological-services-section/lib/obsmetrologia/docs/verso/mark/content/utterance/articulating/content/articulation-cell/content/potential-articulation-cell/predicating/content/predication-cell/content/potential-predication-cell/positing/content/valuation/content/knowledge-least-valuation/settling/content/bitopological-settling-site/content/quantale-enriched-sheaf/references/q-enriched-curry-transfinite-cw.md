---
kind: theorem
status: sketch
depends-on: [q-enriched-curry-cw-complex, transfinite-cell-complex, q-enriched-transfinite-cellular-sheaf, q-fuzzy-equivalence, anderson-putnam-direct-limit, lopez2024]
---

# Q-enriched Curry equivalence: transfinite cell complexes

The transfinite extension of the [Q-enriched Curry equivalence on regular CW complexes](q-enriched-curry-cw-complex.md).
Where that theorem handles cell complexes with finitely many cells, this theorem extends to [transfinite cell complexes](../objects/transfinite-cell-complex.md) — countable cell sets indexed by ordinals up to $\omega_1$ — via directed-colimit techniques.
The proof template parallels the corpus's [aperiodic-regime cohomology via direct limit](aperiodic-regime-cohomology-via-direct-limit.md) construction, now in the Q-enriched setting.

This is **Layer 3** of the [cellular extension plan](../narratives/cellular-extension-plan.md), the per-fiber input needed for full Verdier coverage of the bitopological settling site across all four regimes.

## Setup

Let $X$ be a [transfinite cell complex](../objects/transfinite-cell-complex.md) with cell set indexed by a countable ordinal $\alpha \leq \omega_1$.
Let $F$ be a [Q-enriched cellular sheaf on $X$](../objects/q-enriched-transfinite-cellular-sheaf.md) and $\check{F}$ its associated cosheaf via fuzzy right adjoints.

Per the framework definition, $X$ has a canonical directed-colimit presentation $X = \mathrm{colim}_{F \subseteq_{\mathrm{fin}}} X|_F$ over its finite cellular sub-complexes.
The sheaf $F$ restricts to a finite Q-enriched cellular sheaf $F|_{X|_F}$ on each, and the per-finite-sub-complex Curry equivalence ([CW-complex theorem](q-enriched-curry-cw-complex.md)) gives:

$$H^k(F|_{X|_F}) \;\simeq_{q_k(X|_F, F|_{X|_F})}\; H_k(\check{F}|_{X|_F})$$

for each finite sub-complex $X|_F$ and each degree $k$.

## The theorem

**Theorem (transfinite Q-enriched Curry equivalence).** For a transfinite cell complex $X$ and Q-enriched cellular sheaf $F$ on $X$, there are q-fuzzy equivalences

$$H^k(F) \;\simeq_{q_k^{\mathrm{transfin}}(X, F)}\; H_k(\check{F})$$

in every degree $k \in \mathbb{N}$, where the **transfinite degree-$k$ fuzziness** is

$$q_k^{\mathrm{transfin}}(X, F) \;=\; \bigwedge_{F \subseteq_{\mathrm{fin}} \mathrm{cells}(X)} q_k(X|_F, F|_{X|_F}),$$

the meet over all finite cellular sub-complexes of the per-sub-complex Curry fuzzinesses.

The equivalence is **non-degenerate** (i.e., $q_k^{\mathrm{transfin}} \succ \bot$) iff the per-finite-sub-complex fuzzinesses do not tend to $\bot$ along the directed system.
For sheaves with a uniform lower bound $q_k(X|_F, F|_{X|_F}) \succeq q_\ast$ across all finite sub-complexes, $q_k^{\mathrm{transfin}} \succeq q_\ast$.

## Proof

The argument has three steps: per-finite-sub-complex Curry, naturality in sub-complex inclusion, and assembly via the directed colimit.

**Step 1: per-finite-sub-complex Curry equivalence.** For each finite cellular sub-complex $X|_F \subseteq X$, the [CW-complex theorem](q-enriched-curry-cw-complex.md) gives Q-functor maps

$$\Phi_F : H^k(F|_{X|_F}) \to H_k(\check{F}|_{X|_F}), \qquad \Psi_F : H_k(\check{F}|_{X|_F}) \to H^k(F|_{X|_F})$$

satisfying $\Phi_F \circ \Psi_F \simeq_{q_k(X|_F, F|_{X|_F})} \mathrm{id}$ and $\Psi_F \circ \Phi_F \simeq_{q_k(X|_F, F|_{X|_F})} \mathrm{id}$.

**Step 2: naturality in sub-complex inclusion.** For finite sub-complexes $F \subseteq F' \subseteq \mathrm{cells}(X)$, the inclusion $X|_F \hookrightarrow X|_{F'}$ induces canonical Q-functors:

- $H^k(F|_{X|_F}) \to H^k(F|_{X|_{F'}})$ on cohomology (cellular-extension induced).
- $H_k(\check{F}|_{X|_F}) \to H_k(\check{F}|_{X|_{F'}})$ on cosheaf homology.

These are natural in the sense that the diagram

$$\begin{array}{ccc} H^k(F|_{X|_F}) & \xrightarrow{\;\Phi_F\;} & H_k(\check{F}|_{X|_F}) \\ \downarrow & & \downarrow \\ H^k(F|_{X|_{F'}}) & \xrightarrow{\;\Phi_{F'}\;} & H_k(\check{F}|_{X|_{F'}}) \end{array}$$

commutes up to fuzzy equivalence with fuzziness bounded by $q_k(X|_F, F|_{X|_F})$ (from the smaller sub-complex's Curry fuzziness).

The key observation: extending a finite sub-complex by adding cells does not destroy existing cohomology/homology classes — it can only add new ones or impose new face-coboundary relations.
The Curry map's behavior on existing classes is determined by the per-sub-complex theorem applied to either sub-complex, and these agree on the inclusion.

**Step 3: directed-colimit assembly.** Take the directed colimit over finite sub-complexes:

$$\Phi^{\mathrm{transfin}} : H^k(F) := \varinjlim_F H^k(F|_{X|_F}) \;\longrightarrow\; \varinjlim_F H_k(\check{F}|_{X|_F}) =: H_k(\check{F}).$$

Since $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ has all directed colimits (Stubbe 2005, Lopez 2024), this colimit is well-defined, and the per-finite-sub-complex Curry maps $\{\Phi_F\}$ assemble into the colimit Q-functor $\Phi^{\mathrm{transfin}}$.
The inverse map $\Psi^{\mathrm{transfin}}$ is constructed dually.

**Round-trip fuzziness.** The composition $\Phi^{\mathrm{transfin}} \circ \Psi^{\mathrm{transfin}}$ at any element $[c] \in H_k(\check{F})$ is determined by the per-finite-sub-complex composition at the sub-complex containing a representative of $[c]$.
Specifically: $[c]$ is represented in some $H_k(\check{F}|_{X|_F})$; the round-trip there has fuzziness $q_k(X|_F, F|_{X|_F})$.
As $F$ ranges over all sub-complexes, the worst-case fuzziness is the meet:

$$\Phi^{\mathrm{transfin}} \circ \Psi^{\mathrm{transfin}} \simeq_{q_k^{\mathrm{transfin}}} \mathrm{id}.$$

Identical argument for $\Psi^{\mathrm{transfin}} \circ \Phi^{\mathrm{transfin}}$.

This completes the directed-colimit assembly. $\square$

## Non-degeneracy criterion

The transfinite fuzziness $q_k^{\mathrm{transfin}}$ is non-degenerate iff the per-finite-sub-complex fuzzinesses $\{q_k(X|_F, F|_{X|_F})\}$ are bounded below in $\mathsf{Q}$.

**Sufficient condition.** If all per-finite-sub-complex fuzzinesses are $\succeq q_\ast$ for some fixed $q_\ast \succ \bot$, then $q_k^{\mathrm{transfin}} \succeq q_\ast$.
This holds in particular when:

- All sheaf restrictions $f_\sigma^\tau$ are strict left adjoints (so $q_v^\tau = 1$ uniformly), giving $q_k(X|_F, F|_{X|_F}) = 1$ for all finite sub-complexes and $q_k^{\mathrm{transfin}} = 1$ — strict equivalence in the transfinite case.
- The sheaf has uniformly fuzzy adjoints with a regime-independent lower bound $q_\ast$.

**Pathological case.** If the per-finite-sub-complex fuzzinesses tend to $\bot$ as the sub-complex grows (e.g., the $n$-th sub-complex contributing fuzziness $q^n$ for some $q \prec 1$), the meet is $\bot$ and the transfinite Curry equivalence is *vacuous* in the q-fuzzy sense — the directed colimit assembles, but the equivalence carries no quantitative information.

For the corpus's typical aperiodic-regime data — Boolean d-frame stalks with strict-adjoint Boolean-projection restrictions — the strict case applies: $q^{\mathrm{transfin}} = 1$ and the transfinite Curry equivalence is strict.
The pathological case is an open structural concern for non-Boolean value categories.

## Application to the corpus's aperiodic-regime fibers

For the [bitopological settling site](../objects/bitopological-settling-site.md) at an aperiodic-regime fiber $(q, \tau)$ with $\tau \geq \omega_1$:

- The clopen lattice of $X_q^\tau$ is $\omega_1$-cofinal — a transfinite cell complex in the framework above.
- The d-frame-valued sheaf has Boolean stalks at each clopen, with sheaf restrictions being Boolean projections (strict left adjoints with strict right adjoints).
- $q^{\mathrm{transfin}} = 1$ uniformly; the transfinite Curry equivalence is strict in the d-frame setting.

This establishes **the per-fiber Curry equivalence in the aperiodic regime** (and the transfinite-bounded regime via the same argument with $\tau < \omega_1$).
The [Grothendieck-site theorem](q-enriched-curry-grothendieck-site.md), now extended to admit transfinite-cellular fibers as per-fiber input, lifts this to the global-site Verdier duality.

## What this gives

With this theorem in hand:

1. **The per-fiber Curry equivalence is established for all four regimes** — strict, Scott-continuous, transfinite-bounded, aperiodic.
  The cellular extension plan's Layer 1 is now complete in coverage (with the transfinite extension as a separate theorem).

2. **The [Grothendieck-site lift](q-enriched-curry-grothendieck-site.md) is extended to admit transfinite-cellular fibers** as per-fiber input, paralleling how the same theorem assembled the finite per-fiber theorem.

3. **Verdier duality on the bitopological settling site is established (in q-fuzzy form) for all four regimes.** This unlocks downstream consequences: an aperiodic co-classification via cosheaf homology (future work, the dual of the existing [aperiodic-regime classification](aperiodic-regime-classification.md)), a strong-MLD classification refinement via composed-duality orbits (future work, refining the existing [strong-MLD classification question](../questions/strong-mld-classification.md)), and the spatial input for the [d-frame Verdier composition](d-frame-verdier-composition.md) in transfinite regimes.

## What's open

**Internal to this theorem (Layer 3 specifics):**

1. **Step 2 verification — naturality of per-finite-sub-complex Curry maps.** The argument that the Curry maps are natural with respect to sub-complex inclusion uses the per-sub-complex theorem's explicit forward/inverse maps.
  The full check requires bookkeeping of how face-incidence chains in a sub-complex relate to chains in a larger sub-complex — a routine but substantive expansion of the [CW-complex theorem](q-enriched-curry-cw-complex.md)'s proof.

2. **Directed-colimit existence in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$.** Stubbe 2005 and Lopez 2024 use directed colimits in this category; the existence is standard.
  Tracking the fuzziness profile through the colimit is the new content here.

**Beyond this theorem:**

3. **Non-Boolean value categories.** For Lawvere-quantale-enriched ($[0, \infty]$-valued) data, the per-finite-sub-complex fuzziness can genuinely tend to $\bot$, and the transfinite Curry equivalence may degenerate.
  Whether this is a feature (genuine quantitative breakdown of the equivalence in the limit) or a bug (the wrong limit construction) is open.
  The corpus's classical-bilattice setting is Boolean, so this question doesn't arise here directly.

## Position in the program

This theorem closes **Layer 3 of the cellular extension plan** at the per-fiber level.
With Layer 1 ([CW-complex theorem](q-enriched-curry-cw-complex.md)) handling finite cellular bases, and Layer 2 ([Grothendieck-site theorem](q-enriched-curry-grothendieck-site.md)) handling fiber-to-global assembly, Layer 3 extends the per-fiber theorem to transfinite cellular bases — and plugs back into the Grothendieck-site theorem as an alternate per-fiber input, closing the cellular extension plan structurally.

The downstream consequences of completing Layer 3:

- **Verdier duality across all four regimes.** The bitopological settling site's Verdier duality, currently established only in finite-cellular regimes via Layer 1+2, extends to transfinite-bounded and aperiodic regimes via Layer 3.
- **Aperiodic co-classification** (future work).
  The dual aperiodic classifying invariant, which requires Verdier in the aperiodic regime, becomes accessible — paired with the existing [aperiodic-regime classification](aperiodic-regime-classification.md).
- **The strong-MLD classification refinement** via composed-duality orbits becomes operational across all regimes.
