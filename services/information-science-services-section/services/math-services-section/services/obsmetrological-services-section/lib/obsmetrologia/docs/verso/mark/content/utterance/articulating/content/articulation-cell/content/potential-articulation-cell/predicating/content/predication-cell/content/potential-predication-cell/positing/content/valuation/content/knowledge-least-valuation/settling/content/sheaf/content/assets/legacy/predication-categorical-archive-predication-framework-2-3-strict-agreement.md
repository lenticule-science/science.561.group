---
type: theorem
status: sketch
depends-on: [cohomological-framework-2category, cohomological-framework-comparison, strict-regime-d-frame-cohomology, d-frame-cohomology-comparison, paired-priestley-space, d-frame-valued-sheaf, four-regime-dichotomy, q-enriched-curry-grothendieck-site, q-enriched-curry-cw-complex, q-enriched-curry-2-dim-degree-0]
see-also: [per-fiber-d-frame-curry-on-belnap-fiber, per-fiber-curry-on-clopen-lattice-fiber, three-cohomological-frameworks]
---

# Framework 2↔3 agreement on the strict regime

The comparison 1-cell $\mathbb F_2 \to \mathbb F_3$ in $\mathbf{CohFr}$ on the subdomain of strict-regime settlings is an agreement comparison: its comparison transformation $\alpha$ is a natural isomorphism.

## Statement

Let $\mathbb F_2$ be the Tarski-Laplacian-on-discrete-points-fiber framework and $\mathbb F_3$ the cellular-sheaf-on-order-complex-of-clopens (parallel-pair, Q-enriched) framework, in the sense of [cohomological framework](../../settling-cohomology/content/cohomological-framework/cohomological-framework.md). Let

$$C_{23} \;=\; (\mathcal D^\circ_{23},\; \Phi^{23}_{\mathcal D},\; \Phi^{23}_{\mathcal V},\; \alpha_{23}) \;:\; \mathbb F_2 \to \mathbb F_3$$

be the comparison 1-cell with:

- $\mathcal D^\circ_{23}$ = [strict-regime](../../../../../references/four-regime-dichotomy.md) settlings (those whose bilattice fibers $\mathbf L$ are finite distributive, equivalently whose paired-Priestley fibers $X^\tau_q$ are finite). This is the regime in which the [strict-regime d-frame cohomology theorem](../../settling-cohomology/references/strict-regime-d-frame-cohomology.md) applies.
- $\Phi^{23}_{\mathcal D}$: send a settling $S$ equipped with discrete-points fiber reading to $S$ equipped with the order-complex-of-clopens fiber reading, identity on the underlying bitopological site.
- $\Phi^{23}_{\mathcal V}$: the d-frame inclusion $\mathbf{dFrm} \hookrightarrow \mathbf{QCat}_{\mathrm{cwl}}$ from [d-frame-cohomology-comparison](../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-cohomology-comparison.md).
- $\alpha_{23}$: the graded natural transformation $\Phi^{23}_{\mathcal V} \circ H^\bullet_{\mathbb F_2} \Rightarrow H^\bullet_{\mathbb F_3} \circ \Phi^{23}_{\mathcal D}$ comparing the Tarski-Laplacian computation on the discrete-points fiber to the parallel-pair cellular-sheaf computation on the order complex of the clopen lattice.

**Theorem.** $\alpha_{23}$ is a natural isomorphism on $\mathcal D^\circ_{23}$.

## Status: sketch (substantial partial proof)

This file records a substantial partial proof: the per-fiber degree-0 component agreement is established unconditionally (Lemma B1), and the architecture of the remaining gaps is identified precisely. The full claim (that $C_{23}$ is an agreement comparison at the per-settling level in all degrees) remains conditional on currently-`sketch` corpus machinery.

## Partial proof

The argument decomposes into a **per-fiber** layer (per-fiber computations of $H^\bullet$ on each paired-Priestley fiber) and a **per-settling assembly** layer (integration across the bitopological settling site).

Fix a strict-regime settling $S$. By [Step 1 of the strict-regime d-frame cohomology theorem](../../settling-cohomology/references/strict-regime-d-frame-cohomology.md), the bitopological settling site $\mathbf T^*$ truncates after quiescence stage $\tau^* < \omega$ to a finite Grothendieck site with finite paired-Priestley fibers; both $\mathbb F_2$ and $\mathbb F_3$ compute on this truncation.

Fix a base point $(q, \tau)$ on the truncated site, and let $X := X^\tau_q$ be the paired-Priestley fiber. By the strict-regime hypothesis, $X$ is finite. Let $Q := \mathrm{Clopen}_{\mathrm{pw}}(X)$ be the lattice of pairwise-Stone clopens of $X$; $Q$ is a finite bounded distributive lattice (top $X$, bottom $\emptyset$). Let $F := \mathbb F_v|_{(q, \tau)}$ denote the [d-frame-valued sheaf](../../d-frame-valued-sheaf/d-frame-valued-sheaf.md) restricted to this fiber, viewed as a $\mathbf{dFrm}$-valued sheaf on $Q$ with the cellular topology.

### Per-fiber F3 side: Lemma B1 (proved)

Equip the order complex $\Sigma(Q)$ — geometric realization of the nerve of $Q$ as a thin category — with the cellular-sheaf structure induced by $F$: stalk at the $k$-simplex $\sigma = (U_0 \subsetneq U_1 \subsetneq \cdots \subsetneq U_k)$ is $F(U_0)$ (smallest-vertex stalk convention), and face inclusions act by the sheaf restriction maps of $F$ when they change the smallest vertex (the dropped-$U_0$ face restricts via $r_{U_0 \subseteq U_1} : F(U_1) \to F(U_0)$ in the parallel-pair / equalizer reading) and trivially otherwise.

The degree-0 cochain object is $C^0 = \prod_{U \in Q} F(U)$. The parallel-pair coboundary $\delta^0$ at each edge $E_{U \subsetneq U'}$ has parallel components $\delta^0_U(s)(E) = s_U$ and $\delta^0_{U'}(s)(E) = r_{U \subseteq U'}(s_{U'})$, both landing in $F(U)$ (the smaller-clopen stalk). The "edges" here are all comparable pairs $U \subsetneq U'$, not only covering relations — the order complex of a poset takes all chains.

**Lemma B1 (per-fiber F3 H⁰).** $H^0_{\mathbb F_3}(F) \;=\; \displaystyle\lim_{U \in Q^{\mathrm{op}}} F(U) \;=\; F(X)$ in $\mathbf{dFrm}$.

*Proof.* The kernel of $\delta^0$ is the set of vertex-cochains $s = (s_U)_{U \in Q}$ with $s_U = r_{U \subseteq U'}(s_{U'})$ for every $U \subsetneq U'$. This is exactly a compatible family for the diagram $F : Q^{\mathrm{op}} \to \mathbf{dFrm}$ — i.e., an element of $\lim_{U \in Q^{\mathrm{op}}} F(U)$. Limits in $\mathbf{dFrm}$ exist and are computed componentwise on $L_\pm$ with the consistency and totality relations transported (cf. [d-frame-cohomology-comparison](../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-cohomology-comparison.md), where $\mathbf{dFrm}$'s completeness is implicit in the construction of the shadow functor's right adjoint structure). Since $Q$ has top element $X$ in $Q$, equivalently initial in $Q^{\mathrm{op}}$, the constant cone at $F(X)$ is universal and $\lim_{Q^{\mathrm{op}}} F = F(X)$. $\square$

This proves the per-fiber F3 degree-0 cohomology is $F(X)$, the value of the d-frame-valued sheaf at the top clopen — without invoking any sketch corpus machinery.

### Per-fiber F2 side and global F2 comparison

The [strict-regime d-frame cohomology theorem](../../settling-cohomology/references/strict-regime-d-frame-cohomology.md) (`status: proved`) computes the **per-settling** $\mathbb F_2$ cohomology

$$H^0_{\mathbb F_2}(S) \;=\; \bigl(\mathcal P(\Delta^{+,*}_{\tau^*}),\; \mathcal P(\Delta^{-,*}_{\tau^*}),\; \mathrm{con},\; \mathrm{tot}\bigr), \qquad H^n_{\mathbb F_2}(S) = 0 \text{ for } n \geq 1,$$

via a Leray-style assembly across the finite (predicate × stage × fiber) decomposition. The per-fiber piece of that assembly (Step 3 of the cited theorem) gives, at fiber $(q, \tau^*)$, $C^0_{\mathbb F_2,\text{fiber}} = \prod_{x \in X^{\tau^*}_q} F(\{x\})$ and $C^{\geq 1}_{\mathbb F_2,\text{fiber}} = 0$ (0-dimensional discrete-points cellular complex). The Leray assembly then integrates these per-fiber data across the (predicate, stage) axes.

The per-settling explicit form $\mathcal P(\Delta^{+,*}_{\tau^*}) = \mathbb F_v(X)|_{L_+}$ at the global cohomology level coincides with $F(X)|_{L_+}$ at the quiescent fiber, in the sense that the eventual cell sets stabilize and the d-frame-valued sheaf at the top clopen of the quiescent fiber recovers the global $\mathbb F_v$ value. The precise identification between the per-fiber $F(X)$ on the F3 side (Lemma B1) and the per-settling explicit form on the F2 side is the content the remaining gaps address.

### Identified gaps

**Gap (G1): per-fiber F3 higher-degree vanishing.**

The claim $H^n_{\mathbb F_3}(F\text{ at fiber}) = 0$ for $n \geq 1$ on the order complex $\Sigma(Q)$ is true conditionally:

- **Rank ≤ 2 case (proved unconditionally).** When $|X| \leq 2$ — equivalently, $Q$ has $\leq 4$ elements and $\Sigma(Q)$ has dimension $\leq 2$ — the [Q-enriched Curry 2-dim-degree-0 theorem](../../../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-curry-2-dim-degree-0.md) (`status: proved`) gives the appropriate higher-coboundary conditions in the parallel-pair convention, and $H^{\geq 1}_{\mathbb F_3} = 0$ follows directly. This covers $\mathbf L = \mathbf 1$ (trivial) and $\mathbf L = \mathbf 2$ (Belnap), which is the verified instance below.
- **Rank > 2 case (conditional on sketch).** When $|X| > 2$, $\Sigma(Q)$ has dimension $\geq 3$. Vanishing in this range requires a higher-degree extension of the parallel-pair convention to general CW complexes — the content of the [Q-enriched Curry CW-complex theorem](q-enriched-curry-cw-complex.md) (currently `sketch`). A naive cone-contraction "$\delta h + h \delta = \mathrm{id}$" argument fails because the parallel-pair / equalizer convention is not an additive chain complex and does not have signed coboundaries; the precise higher-degree formulation in this convention awaits the cited sketch theorem's promotion. The order complex $\Sigma(Q)$ of a finite bounded distributive lattice is contractible (cone with apex $V_X$), which gives strong evidence that $H^{\geq 1} = 0$ should hold once the parallel-pair higher-degree formulation is fixed; but this evidence is not a proof.

**Gap (G2): per-settling F3 assembly across fibers.**

Lemma B1 gives the per-fiber F3 degree-0 result. Lifting to a per-settling result — i.e., integrating the per-fiber $F(X^\tau_q)$ across $(q, \tau)$ to recover an explicit per-settling $\mathbb F_3$ d-frame — requires the [Q-enriched Curry on Grothendieck sites theorem](q-enriched-curry-grothendieck-site.md) (currently `sketch`). Without it, $H^\bullet_{\mathbb F_3}(S)$ is not pinned down at the global level even granting Lemma B1 fiberwise.

**Gap (G3): identification of $\Phi^{23}_{\mathcal V}$ on objects.**

The comparison transformation $\alpha_{23}$ is valued in $\mathbf{QCat}_{\mathrm{cwl}}$ via the inclusion $\Phi^{23}_{\mathcal V} : \mathbf{dFrm} \hookrightarrow \mathbf{QCat}_{\mathrm{cwl}}$. This inclusion's exact construction (and whether it is fully faithful) is asserted in the [cohomological-framework concept](../../settling-cohomology/content/cohomological-framework/cohomological-framework.md) and used implicitly in [d-frame-cohomology-comparison](../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-cohomology-comparison.md), but not formalized in a dedicated note. The shadow functor $\mathbb S : \mathbf{dFrm} \to \mathbf{Ab} \times \mathbf{Ab}$ goes the other way and does not directly establish this inclusion. The identification "$\Phi^{23}_{\mathcal V}(F(X)) \cong H^0_{\mathbb F_3,\text{fiber}}$ in $\mathbf{QCat}_{\mathrm{cwl}}$" needs the inclusion to be at least essentially injective on the d-frames in scope. A separate note formalizing $\Phi^{23}_{\mathcal V}$ would close this.

### Naturality

Granting (G1), (G2), (G3): a morphism of strict-regime settlings $S \to S'$ induces a morphism of (truncated) bitopological sites and pulls back the d-frame-valued sheaves $\mathbb F_{v'} \to \mathbb F_v$. The per-fiber identification $H^0_{\mathbb F_3,\text{fiber}} = F(X)$ (Lemma B1) is functorial in the d-frame-valued sheaf because $\lim$ in $\mathbf{dFrm}$ is functorial in its diagram and pullback of d-frame-valued sheaves is a morphism of diagrams. The F2 side's naturality is by functoriality of the [strict-regime theorem](../../settling-cohomology/references/strict-regime-d-frame-cohomology.md). Higher-degree naturality is trivial once (G1) gives both sides zero. The compatibility of the per-fiber data with morphisms across the (predicate × stage) base is what (G2) provides.

## Verified instance

The [per-fiber d-frame Curry on the standard Belnap fiber](../examples/per-fiber-d-frame-curry-on-belnap-fiber.md) is the rank-2 specialization: $\mathbf L = \mathbf 2$, $|X| = 2$, $\Sigma(Q)$ is the subdivided square (dim 2), so (G1) is unconditionally settled by the [Q-enriched Curry 2-dim-degree-0 theorem](../../../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-curry-2-dim-degree-0.md). Lemma B1 there reduces to the equalizer condition at the single non-trivial edge $E_{V_p, V_b}$ giving the explicit per-fiber result. (G2) does not apply to this single-fiber witness — it is a per-fiber instance, not a per-settling instance. The example is thus a verified per-fiber witness of Lemma B1, matching the F2 per-fiber piece of the strict-regime theorem at this fiber.

## Proof obligation (remaining)

To promote to `proved` (full claim):

1. **Discharge (G1) for arbitrary rank.** Either (a) promote [Q-enriched Curry CW-complex theorem](q-enriched-curry-cw-complex.md) from sketch to proved, providing a convention-correct higher-degree parallel-pair formulation in which the cone-contraction argument can be made rigorous; or (b) give a direct convention-correct proof of $H^{\geq 1}_{\mathbb F_3} = 0$ for d-frame-valued sheaves on the order complex of any finite bounded distributive lattice.
2. **Discharge (G2).** Promote [Q-enriched Curry on Grothendieck sites theorem](q-enriched-curry-grothendieck-site.md) from sketch to proved, giving the per-settling assembly of per-fiber F3 cohomology data.
3. **Discharge (G3).** Formalize the inclusion $\Phi^{23}_{\mathcal V} : \mathbf{dFrm} \to \mathbf{QCat}_{\mathrm{cwl}}$ in a dedicated morphism / object note and prove the relevant essentially-injective / fully-faithful property.

## Promotion options short of (G1) + (G2) + (G3)

Two restricted promotions are available immediately:

- **(P1) Per-fiber, rank ≤ 2, degree 0.** "On the per-fiber subdomain restricted to $|X| \leq 2$, $\alpha_{23}^0$ is a $\mathbf{dFrm}$-iso." This is unconditionally proved by Lemma B1 + Q-enriched Curry 2-dim-degree-0. The Belnap-fiber instance is the verified case.
- **(P2) Per-fiber, arbitrary rank, degree 0.** "On the per-fiber subdomain (arbitrary finite distributive $\mathbf L$), $\alpha_{23}^0$ is a $\mathbf{dFrm}$-iso." This is Lemma B1 unconditionally. The full result (P2) is itself a valid corpus contribution and could be split off into its own theorem if useful downstream.

Both are weaker than the per-settling claim this file states, but stronger than the previous draft's enumerated obligations. The author of this corpus may prefer to split (P2) into its own theorem and keep this file pinned to the full per-settling claim.

## Discussion

This theorem's draft body now contains a substantial mathematical advance over the original proof-obligation list: Lemma B1 (per-fiber degree-0 agreement, all ranks) is a clean unconditional result, derived directly in $\mathbf{dFrm}$ without invoking the sketch chain. The remaining work is precisely identified at (G1)+(G2)+(G3), all of which point to specific corpus theorems whose promotion would discharge the gaps.

The strong-MLD theorem and downstream chain remain `sketch`: their dependency on F3's full assembly machinery is exactly (G2). Promoting this theorem promotes nothing downstream by itself; it documents what the missing pieces are.

**Boundary of the result.** This theorem is for the strict regime only. The Scott-continuous regime extension of Lemma B1 is plausible bookkeeping ($\mathbf{dFrm}$ has $\omega$-limits, $Q$ becomes $\omega$-distributive, $\Sigma(Q)$ remains contractible at the apex $V_X$); it does not change the gap structure. The transfinite-bounded and aperiodic regimes do not have $\mathbb F_2$ readings in scope, so no F2↔F3 comparison is needed there.
