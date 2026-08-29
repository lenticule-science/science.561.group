---
type: theorem
status: proved
depends-on: [tarski-lawvere-fixed-point-grothendieck-sites, lawvere-laplacian-grothendieck-sites, quantale-enriched-sheaf, q-enriched-curry-grothendieck-site, q-enriched-curry-transfinite-cw, kelly1982, ghrist-et-al2025]
---

# Tarski–Lawvere convergence at ω₁ for cellular stalk-product Q-enriched sheaves

Settles item (2) of the open list in [Tarski–Lawvere fixed point on Grothendieck sites](tarski-lawvere-fixed-point-grothendieck-sites.md): for the class of cellular Q-enriched sheaves whose stalks-at-clopens construction is the *stalk-product* form $F(U) = \prod_{\sigma \in K(U)} F(\sigma)$, the $\omega_1$-codirected-continuity hypothesis of the parent file is automatic, and the conditional convergence theorem applies unconditionally. This covers the corpus's primary case — the d-frame-valued cellular sheaves on the bitopological settling site (per the [cellular extension plan](prose/teaching/explanations/cellular-extension-plan.md) §"Layer-by-layer status").

## Setup

Fix a commutative unital quantale $\mathsf Q$, a small category $\mathbf T$ with Grothendieck topology $J$, and a $\mathsf Q$-enriched sheaf $F$ on $(\mathbf T, J)$.

**Definition (stalk-product form).** $F$ has *cellular stalk-product form* if there is an assignment $K$ from objects of $\mathbf T$ to small index sets, and a family of complete weighted lattices $\{F_\sigma\}_{\sigma \in K(U)}$ at each $U$, such that:

1. *(stalks-as-product)* $F(U) = \prod_{\sigma \in K(U)} F_\sigma$ as a complete weighted lattice in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$;
2. *(restriction-as-projection)* for every morphism $f : U' \to U$ in $\mathbf T$ giving an inclusion $K(U') \subseteq K(U)$ (in particular, for cover-component morphisms in $J$), the sheaf restriction $F(f) : F(U) \to F(U')$ is the canonical projection $\prod_{\sigma \in K(U)} F_\sigma \twoheadrightarrow \prod_{\sigma \in K(U')} F_\sigma$ omitting components $\sigma \in K(U) \setminus K(U')$;
3. *(cell additivity)* for every covering family $\{U_i \to U\}_{i \in I}$ in $J$, $K(U) = \bigcup_i K(U_i)$.

This is the Q-enriched version of the standard cellular-sheaf convention used by [@ghrist-et-al2025] on graphs (with $K(v) = \{v\}$, $K(e) = \{e\}$, and $C^0 F = \prod_v F_v$, $C^1 F = \prod_e F_e$, per [the Q-enriched sheaf object](../objects/quantale-enriched-sheaf.md) §"The relationship to graph-indexed sheaves"), generalized to arbitrary cellular Grothendieck sites via [Q-enriched Curry on Grothendieck sites](q-enriched-curry-grothendieck-site.md) and its [transfinite extension](q-enriched-curry-transfinite-cw.md).

## Lemma: stalk-product implies ω₁-codirected-continuity

**Lemma.** *If $F$ has cellular stalk-product form, then $F$ is $\omega_1$-codirected-continuous in the sense of the [parent sketch](tarski-lawvere-fixed-point-grothendieck-sites.md) §"Conditional convergence theorem": for every morphism $f : U' \to U$ and every codirected $\omega_1$-indexed family $\{y_\beta\}_{\beta < \omega_1}$ in $F(U)$,*

$$F(f)\Bigl(\bigwedge_{\beta < \omega_1} y_\beta\Bigr) \;=\; \bigwedge_{\beta < \omega_1} F(f)(y_\beta).$$

*Proof.* By stalks-as-product, $F(U) = \prod_{\sigma \in K(U)} F_\sigma$ as complete weighted lattices; weighted meets in a $\mathsf Q$-enriched product of complete weighted lattices are computed componentwise ([@kelly1982] §3.5: weighted limits in a product are the pointwise weighted limits). So $\bigl(\bigwedge_\beta y_\beta\bigr)_\sigma = \bigwedge_\beta (y_\beta)_\sigma$ in $F_\sigma$ for each $\sigma \in K(U)$.

By restriction-as-projection, $F(f) = \pi_{K(U')}$. Projections out of products are themselves $\mathsf Q$-functors that preserve all weighted limits ([@kelly1982] §3.3: each projection is the limit-cone leg of the product, and product-projections preserve any limit the product itself preserves). In particular projections preserve arbitrary codirected meets, including the $\omega_1$-meet at hand:

$$\pi_{K(U')}\Bigl(\bigwedge_{\beta} y_\beta\Bigr) \;=\; \Bigl(\bigwedge_{\beta} (y_\beta)_\sigma\Bigr)_{\sigma \in K(U')} \;=\; \bigwedge_{\beta} \bigl((y_\beta)_\sigma\bigr)_{\sigma \in K(U')} \;=\; \bigwedge_{\beta} \pi_{K(U')}(y_\beta).$$

The middle equality is again the componentwise computation of meets in a product. $\square$

## Theorem: unconditional convergence at ω₁ for stalk-product sheaves

**Theorem.** *Let $F$ be a $\mathsf Q$-enriched sheaf on a Grothendieck site $(\mathbf T, J)$ with $\omega_1$-cofinal covers, having cellular stalk-product form. Then the Tarski–Lawvere iteration on the Lawvere Laplacian $L : C^0 F \to C^0 F$ converges to the largest suffix point at some ordinal $\leq \omega_1$.*

*Proof.* By the lemma, $F$ is $\omega_1$-codirected-continuous. Apply the conditional convergence theorem of the [parent sketch](tarski-lawvere-fixed-point-grothendieck-sites.md) §"Conditional convergence theorem". $\square$

The parent sketch's equivalence-with-direct-limit theorem then also applies unconditionally for stalk-product sheaves: the fixed-point invariant agrees with the direct-limit cohomology of countable truncations.

## Application to the bitopological settling site

The cellular Q-enriched sheaves on the [bitopological settling site](../objects/bitopological-settling-site.md) constructed via the [cellular extension plan](prose/teaching/explanations/cellular-extension-plan.md) Layers 1–3 — in particular the [d-frame-valued sheaf $\mathbb F_v$](../objects/d-frame-valued-sheaf.md) — are stalk-product in the sense of the definition above whenever the per-fiber paired-Priestley cellular structure is used to index stalks. This is the standing convention of the cellular extension plan: per-fiber Curry assigns stalks to cells of the paired-Priestley fiber, and clopen restrictions are projections onto the cells contained in the smaller clopen.

**Corollary (corpus's primary case).** *For cellular d-frame-valued sheaves on the aperiodic-regime bitopological settling site whose per-fiber stalks-at-clopens construction follows the cellular extension plan's stalk-product convention, the Tarski–Lawvere iteration converges to the largest suffix point at some ordinal $\leq \omega_1$, and the resulting fixed-point cohomology agrees with the [direct-limit cohomology](aperiodic-regime-d-frame-cohomology.md).*

This closes — for the corpus's intended construction — Layer 3 of the cellular extension plan in the cleaner fixed-point form, in addition to the direct-limit form already established. The two constructions agree under the stalk-product hypothesis, giving cohomology a *single* invariant rather than two parallel invariants whose relationship needs separate verification.

## What this does and does not establish

**Established.** The Tarski–Lawvere fixed-point conjecture at $\omega_1$-cofinality holds in the stalk-product class. This class contains the corpus's primary case (cellular d-frame-valued sheaves on the bitopological settling site). The fixed-point definition and the direct-limit definition of unbounded settling cohomology agree on this class.

**Not established (and remains in the parent sketch's open list).**

- The unconditional conjecture for arbitrary $\mathsf Q$-enriched sheaves on $\omega_1$-cofinal Grothendieck sites. This is materially false in the d-frame setting *outside* the stalk-product class — e.g., for d-frame-valued sheaves whose stalks-at-clopens construction is *not* cellular stalk-product (a "non-cellular" frame sheaf with frame-morphism restrictions failing $\omega_1$-codirected-meet preservation). An explicit counterexample is item (1) of the parent sketch's open list.
- The relationship between fixed-point and direct-limit invariants when the stalk-product hypothesis fails (item (3) of the parent sketch).

## Why this works structurally

The argument's mechanism is worth naming. The Lawvere Laplacian's only "non-right-adjoint" piece — the sheaf restriction $F(f)$ — is what the iteration's limit-ordinal-continuity depends on. Right adjoints $F(f)^*$ already preserve all weighted meets by [@kelly1982] §3.2, so the obstruction lives entirely in $F(f)$.

For *cellular* sheaves with stalk-product form, $F(f)$ is a projection out of a product of stalks. Projections out of products preserve all weighted limits — they are the universal-cone-leg morphisms, which by definition preserve any limit the product itself preserves, and a product of complete weighted lattices is complete with limits computed componentwise. So the only structural piece that "breaks" for general frame sheaves is automatic for cellular stalk-product sheaves.

The phenomenon is identical to why cellular cohomology on a CW complex is well-behaved at $\omega_1$-cofinal cell structures despite general frame cohomology not being so: cellular structure replaces the awkward frame-meet-preservation question with a tame product-projection question.
