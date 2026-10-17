---
type: theorem
status: proved
depends-on: [q-enriched-curry-cw-complex, transfinite-cell-complex, q-enriched-transfinite-cellular-sheaf, q-fuzzy-equivalence, anderson-putnam-direct-limit, lopez2024, kelly1982]
---

# Q-enriched Curry equivalence: transfinite cell complexes

The transfinite extension of the [Q-enriched Curry equivalence on regular CW complexes](q-enriched-curry-cw-complex.md). Where that theorem handles cell complexes with finitely many cells, this theorem extends to [transfinite cell complexes](../objects/transfinite-cell-complex.md) — countable cell sets indexed by ordinals up to $\omega_1$ — via directed-colimit techniques. The proof template parallels predication categories' [aperiodic-regime cohomology via direct limit](../../../../../../aperiodic-settling/references/aperiodic-regime-cohomology-via-direct-limit.md) construction, now in the Q-enriched setting.

This is **Layer 3** of the [cellular extension plan](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/cellular-extension-plan.md), the per-fiber input needed for full Verdier coverage of the bitopological settling site across all four regimes.

## Setup

Let $X$ be a [transfinite cell complex](../objects/transfinite-cell-complex.md) with cell set indexed by a countable ordinal $\alpha \leq \omega_1$. Let $F$ be a [Q-enriched cellular sheaf on $X$](../../../../../../aperiodic-settling/commutating/content/aperiodic-nuclear-quartet-category/content/anderson-putnam-direct-limit/content/transfinite-cell-complex/content/q-enriched-transfinite-cellular-sheaf/q-enriched-transfinite-cellular-sheaf.md) and $\check{F}$ its associated cosheaf via fuzzy right adjoints.

Per the framework definition, $X$ has a canonical directed-colimit presentation $X = \mathrm{colim}_{F \subseteq_{\mathrm{fin}}} X|_F$ over its finite cellular sub-complexes. The sheaf $F$ restricts to a finite Q-enriched cellular sheaf $F|_{X|_F}$ on each, and the per-finite-sub-complex Curry equivalence ([CW-complex theorem](q-enriched-curry-cw-complex.md)) gives:

$$H^k(F|_{X|_F}) \;\simeq_{q_k(X|_F, F|_{X|_F})}\; H_k(\check{F}|_{X|_F})$$

for each finite sub-complex $X|_F$ and each degree $k$.

## The theorem

**Theorem (transfinite Q-enriched Curry equivalence).** For a transfinite cell complex $X$ and Q-enriched cellular sheaf $F$ on $X$, there are q-fuzzy equivalences

$$H^k(F) \;\simeq_{q_k^{\mathrm{transfin}}(X, F)}\; H_k(\check{F})$$

in every degree $k \in \mathbb{N}$, where the **transfinite degree-$k$ fuzziness** is

$$q_k^{\mathrm{transfin}}(X, F) \;=\; \bigwedge_{F \subseteq_{\mathrm{fin}} \mathrm{cells}(X)} q_k(X|_F, F|_{X|_F}),$$

the meet over all finite cellular sub-complexes of the per-sub-complex Curry fuzzinesses.

The equivalence is **non-degenerate** (i.e., $q_k^{\mathrm{transfin}} \succ \bot$) iff the per-finite-sub-complex fuzzinesses do not tend to $\bot$ along the directed system. For sheaves with a uniform lower bound $q_k(X|_F, F|_{X|_F}) \succeq q_\ast$ across all finite sub-complexes, $q_k^{\mathrm{transfin}} \succeq q_\ast$.

## Proof

The argument has three steps: per-finite-sub-complex Curry, naturality in sub-complex inclusion, and assembly via the directed colimit.

**Step 1: per-finite-sub-complex Curry equivalence.** For each finite cellular sub-complex $X|_F \subseteq X$, the [CW-complex theorem](q-enriched-curry-cw-complex.md) gives Q-functor maps

$$\Phi_F : H^k(F|_{X|_F}) \to H_k(\check{F}|_{X|_F}), \qquad \Psi_F : H_k(\check{F}|_{X|_F}) \to H^k(F|_{X|_F})$$

satisfying $\Phi_F \circ \Psi_F \simeq_{q_k(X|_F, F|_{X|_F})} \mathrm{id}$ and $\Psi_F \circ \Phi_F \simeq_{q_k(X|_F, F|_{X|_F})} \mathrm{id}$.

**Step 2: naturality in sub-complex inclusion.** For finite sub-complexes $F \subseteq F' \subseteq \mathrm{cells}(X)$, the inclusion $\iota : X|_F \hookrightarrow X|_{F'}$ induces canonical Q-functors:

- $\iota^* : H^k(F|_{X|_F}) \to H^k(F|_{X|_{F'}})$ on cohomology, induced by the inclusion of cochain complexes (every $k$-cell of $X|_F$ is a $k$-cell of $X|_{F'}$, and the same restriction maps apply).
- $\iota_* : H_k(\check F|_{X|_F}) \to H_k(\check F|_{X|_{F'}})$ on cosheaf homology, induced by the inclusion of cells (every cell-stalk of $X|_F$ is a cell-stalk of $X|_{F'}$, with the same fuzzy adjoint extensions).

The naturality square

$$\begin{array}{ccc} H^k(F|_{X|_F}) & \xrightarrow{\;\Phi_F\;} & H_k(\check F|_{X|_F}) \\ \downarrow{\scriptstyle \iota^*} & & \downarrow{\scriptstyle \iota_*} \\ H^k(F|_{X|_{F'}}) & \xrightarrow{\;\Phi_{F'}\;} & H_k(\check F|_{X|_{F'}}) \end{array}$$

commutes up to fuzzy equivalence with fuzziness $q_k(X|_F, F|_{X|_F})$ (the smaller sub-complex's Curry fuzziness). The argument uses the chain-fuzziness formula from the [CW-complex theorem](q-enriched-curry-cw-complex.md):

**Why naturality holds.** The Curry map $\Phi_F$ on the smaller sub-complex is built (per the CW-complex theorem's proof) from the per-cell-addition argument: each face-incidence chain in $X|_F$ contributes its multiplicative fuzziness $\prod_i q_{\sigma_i}^{\sigma_{i+1}}$ to the equivalence. When we extend to $X|_{F'}$ by adding new cells:

- *Chains internal to $X|_F$* are unchanged; their contribution to $\Phi_{F'}$ matches their contribution to $\Phi_F$ (same restriction-fuzzinesses along the same chain).
- *Chains involving new cells of $X|_{F'} \setminus X|_F$* contribute new fuzziness terms to $q_k(X|_{F'}, F|_{X|_{F'}})$, but these only affect the larger Curry map on classes whose representatives involve the new cells — they do *not* affect the restriction of $\Phi_{F'}$ to the image $\iota^*(H^k(F|_{X|_F}))$.

So $\Phi_{F'} \circ \iota^* = \iota_* \circ \Phi_F$ on classes with representatives in the smaller sub-complex, with fuzziness identical to $\Phi_F$'s fuzziness $q_k(X|_F, F|_{X|_F})$. The naturality square commutes up to this fuzziness.

The same argument applied to the inverse maps $\{\Psi_F\}$ gives the dual naturality.

**Step 3: directed-colimit assembly.** The directed system $\{H^k(F|_{X|_F})\}_F$ over finite sub-complexes is a directed system in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$, with transition maps $\iota^*$ being Q-functors. Take the directed colimit:

$$H^k(F) \;:=\; \varinjlim_F H^k(F|_{X|_F}), \qquad H_k(\check F) \;:=\; \varinjlim_F H_k(\check F|_{X|_F}).$$

Directed colimits exist in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ as a consequence of $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ being a reflective full subcategory of the Q-presheaf category $[\mathsf{Q}^{\mathrm{op}}, \mathbf{Set}]$ (the inclusion preserves limits and the reflector preserves colimits; cf. [@kelly1982] Proposition 3.75 specialized to the quantale-enriched case, and [@lopez2024] for the explicit construction in the cellular sheaf / cosheaf setting). Concretely, the colimit at each "stage" is computed pointwise and the equivalence relation is the directed-system equivalence; the resulting object is again a complete weighted lattice.

By the universal property of the directed colimit, the cocone $\{\Phi_F\}_F$ — which is fuzzy-natural by Step 2 — assembles into a unique Q-functor

$$\Phi^{\mathrm{transfin}} : H^k(F) \to H_k(\check F)$$

extending each $\Phi_F$. The inverse $\Psi^{\mathrm{transfin}}$ assembles dually from $\{\Psi_F\}$.

**Round-trip fuzziness.** The composition $\Phi^{\mathrm{transfin}} \circ \Psi^{\mathrm{transfin}}$ at any class $[c] \in H_k(\check F)$ is computed via a representative in some finite sub-complex: $[c] = \iota_*([c_F])$ for some $F$ and $[c_F] \in H_k(\check F|_{X|_F})$. By the per-sub-complex round-trip and Step 2 naturality:

$$\Phi^{\mathrm{transfin}}(\Psi^{\mathrm{transfin}}([c])) \;=\; \iota_*(\Phi_F(\Psi_F([c_F]))) \;\simeq_{q_k(X|_F, F|_{X|_F})}\; \iota_*([c_F]) \;=\; [c].$$

The fuzziness depends on the representative's sub-complex $F$. As $F$ ranges over the directed system, the worst-case fuzziness is the meet:

$$\Phi^{\mathrm{transfin}} \circ \Psi^{\mathrm{transfin}} \;\simeq_{q_k^{\mathrm{transfin}}}\; \mathrm{id}, \qquad q_k^{\mathrm{transfin}} = \bigwedge_F q_k(X|_F, F|_{X|_F}).$$

Identical argument for $\Psi^{\mathrm{transfin}} \circ \Phi^{\mathrm{transfin}}$. This completes the directed-colimit assembly. $\square$

## Non-degeneracy criterion

The transfinite fuzziness $q_k^{\mathrm{transfin}}$ is non-degenerate iff the per-finite-sub-complex fuzzinesses $\{q_k(X|_F, F|_{X|_F})\}$ are bounded below in $\mathsf{Q}$.

**Sufficient condition.** If all per-finite-sub-complex fuzzinesses are $\succeq q_\ast$ for some fixed $q_\ast \succ \bot$, then $q_k^{\mathrm{transfin}} \succeq q_\ast$. This holds in particular when:

- All sheaf restrictions $f_\sigma^\tau$ are strict left adjoints (so $q_v^\tau = 1$ uniformly), giving $q_k(X|_F, F|_{X|_F}) = 1$ for all finite sub-complexes and $q_k^{\mathrm{transfin}} = 1$ — strict equivalence in the transfinite case.
- The sheaf has uniformly fuzzy adjoints with a regime-independent lower bound $q_\ast$.

**Pathological case.** If the per-finite-sub-complex fuzzinesses tend to $\bot$ as the sub-complex grows (e.g., the $n$-th sub-complex contributing fuzziness $q^n$ for some $q \prec 1$), the meet is $\bot$ and the transfinite Curry equivalence is *vacuous* in the q-fuzzy sense — the directed colimit assembles, but the equivalence carries no quantitative information.

For predication categories' typical aperiodic-regime data — Boolean d-frame stalks with strict-adjoint Boolean-projection restrictions — the strict case applies: $q^{\mathrm{transfin}} = 1$ and the transfinite Curry equivalence is strict. The pathological case is an open structural concern for non-Boolean value categories.

## Application to predication categories' aperiodic-regime fibers

For the [bitopological settling site](../../../../../../bitopological-settling-site/bitopological-settling-site.md) at an aperiodic-regime fiber $(q, \tau)$ with $\tau \geq \omega_1$:

- The clopen lattice of $X_q^\tau$ is $\omega_1$-cofinal — a transfinite cell complex in the framework above.
- The d-frame-valued sheaf has Boolean stalks at each clopen, with sheaf restrictions being Boolean projections (strict left adjoints with strict right adjoints).
- $q^{\mathrm{transfin}} = 1$ uniformly; the transfinite Curry equivalence is strict in the d-frame setting.

This establishes **the per-fiber Curry equivalence in the aperiodic regime** (and the transfinite-bounded regime via the same argument with $\tau < \omega_1$). The [Grothendieck-site theorem](q-enriched-curry-grothendieck-site.md), now extended to admit transfinite-cellular fibers as per-fiber input, lifts this to the global-site Verdier duality.

## What this gives

With this theorem in hand:

1. **The per-fiber Curry equivalence is established for all four regimes** — strict, Scott-continuous, transfinite-bounded, aperiodic. The cellular extension plan's Layer 1 is now complete in coverage (with the transfinite extension as a separate theorem).

2. **The [Grothendieck-site lift](q-enriched-curry-grothendieck-site.md) is extended to admit transfinite-cellular fibers** as per-fiber input, paralleling how the same theorem assembled the finite per-fiber theorem.

3. **Verdier duality on the bitopological settling site is established (in q-fuzzy form) for all four regimes.** This unlocks downstream consequences: an aperiodic co-classification via cosheaf homology (future work, the dual of the existing [aperiodic-regime classification](../../../../../../aperiodic-settling/references/aperiodic-regime-classification.md)), a strong-MLD classification refinement via composed-duality orbits (future work, refining the existing [strong-MLD classification question](questions/strong-mld-classification.md)), and the spatial input for the [d-frame Verdier composition](../../../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-verdier-composition.md) in transfinite regimes.

## What's open (beyond this theorem)

1. **Non-Boolean value categories.** For Lawvere-quantale-enriched ($[0, \infty]$-valued) data, the per-finite-sub-complex fuzziness can genuinely tend to $\bot$, and the transfinite Curry equivalence may degenerate. Whether this is a feature (genuine quantitative breakdown of the equivalence in the limit) or a bug (the wrong limit construction) is open. The corpus's classical-bilattice setting is Boolean, so this question doesn't arise here directly.

2. **Stronger fuzziness bounds for specific sheaf classes.** The transfinite fuzziness $q_k^{\mathrm{transfin}}$ is the meet over all sub-complexes; for sheaves with regularity properties (e.g., locally constant on certain strata), tighter bounds may be available via colimit-cofinality arguments on a smaller cofinal subsystem.
