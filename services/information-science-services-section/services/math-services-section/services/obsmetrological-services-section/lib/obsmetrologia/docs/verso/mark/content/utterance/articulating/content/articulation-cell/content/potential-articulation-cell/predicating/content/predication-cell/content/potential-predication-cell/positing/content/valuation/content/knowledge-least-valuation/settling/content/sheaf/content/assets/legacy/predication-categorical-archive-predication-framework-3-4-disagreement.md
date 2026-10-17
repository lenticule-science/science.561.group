---
type: theorem
status: sketch
depends-on: [cohomological-framework-2category, cohomological-framework-comparison, q-enriched-curry-grothendieck-site, lawvere-laplacian-grothendieck-sites, q-enriched-cohomology, q-enriched-cohomology-higher-degree-vanishing]
see-also: [three-cohomological-frameworks, framework-4-vanishing-transfer, per-fiber-d-frame-curry-on-belnap-fiber]
---

# Framework 3↔4 disagreement at the Grothendieck-site level

The comparison 1-cell $\mathbb F_3 \to \mathbb F_4$ in $\mathbf{CohFr}$ is **not** an agreement comparison: its comparison transformation $\alpha$ is not a natural isomorphism. Frameworks 3 and 4 compute genuinely different invariants on the Grothendieck-site level, and downstream theorems must commit to one or the other.

This is a positive negative result: the comparison 1-cell is well-defined, $\alpha$ exists as a graded natural transformation, but $\alpha$ fails to be invertible. The role of this theorem is to record that failure precisely, so that downstream theorems do not silently use F3 and F4 results interchangeably.

## Statement

Let $\mathbb F_3$ be the cellular-sheaf-on-order-complex (parallel-pair, Q-enriched) framework and $\mathbb F_4$ the Lawvere-Laplacian-on-Grothendieck-site (weighted-meet, Q-enriched) framework. Let

$$C_{34} \;=\; (\mathcal D^\circ_{34},\; \Phi^{34}_{\mathcal D},\; \Phi^{34}_{\mathcal V},\; \alpha_{34}) \;:\; \mathbb F_3 \to \mathbb F_4$$

be the comparison 1-cell with:

- $\mathcal D^\circ_{34}$ = settlings whose bitopological site supports both the per-fiber-Curry assembly of $\mathbb F_3$ and the direct Grothendieck-site presentation of $\mathbb F_4$ (in particular, all settlings within the corpus's current scope, including the standard Belnap setting).
- $\Phi^{34}_{\mathcal D}$: identity on the underlying bitopological site; reinterpret the per-fiber-assembled $\mathbb F_3$ data as a Grothendieck-site presentation in the $\mathbb F_4$ sense.
- $\Phi^{34}_{\mathcal V}$: identity on $\mathbf{QCat}_{\mathrm{cwl}}$ (both frameworks have the same value category).
- $\alpha_{34}$: the natural transformation comparing the parallel-pair cellular-sheaf cohomology (assembled via per-fiber Curry) to the weighted-meet cohomology computed directly on the Grothendieck site.

**Theorem.** $\alpha_{34}$ is *not* a natural isomorphism on $\mathcal D^\circ_{34}$. Frameworks 3 and 4 are distinct cohomology theories: the structural disagreement of their degree-0 coboundaries is established unconditionally in Lemma D1 below; the corresponding concrete $H^0$ witness on the standard Belnap fiber's natural sheaf data remains conditional on gap D-G2.

## Status: sketch (substantial partial proof)

This file records a substantial partial proof: the structural source of the disagreement is identified explicitly (Lemma D1, unconditional under the standard reading of the weight $W$), establishing the strict containment $\ker(\delta^0_4) \subsetneq \ker(\delta^0_3)$ as a categorical fact about complete-weighted-lattice meets versus equalizers, valid wherever the joint-image hypothesis is non-vacuous. A concrete $H^0$ witness on the standard Belnap fiber is *not* yet exhibited; the present file contains a witness blueprint (D2 — explicitly not a lemma) that records attempted candidates, identifies the joint-image hypothesis as the operative obstruction on Belnap-natural sheaf data, and points at routes for closing the gap. The full claim — that $\alpha_{34}^{H^0}$ is provably non-invertible on the standard Belnap fiber, intrinsically rather than as an artifact of $\mathbb F_3$-assembly choice — remains conditional on identified gaps D-G1 (typing the comparison transformation and the F3 ↔ F4 sheaf-direction convention bridge) and D-G2 (closing the existential gap in D2).

## Partial proof

### Setup: the two coboundaries on a face poset

Both $\mathbb F_3$ and $\mathbb F_4$ compute $H^0$ as the kernel of a degree-0 coboundary $\delta^0 : C^0 F \to C^1 F$ on the same cochain $\mathsf Q$-categories $C^n F = \prod_{\sigma \in \mathbf T_n} F(\sigma)$ — they differ in *which* coboundary they use. Fix a face poset $\mathbf T$ (in our case the order complex of the clopen lattice of a paired-Priestley fiber, restricted to a single base point so the F4 Grothendieck-site reading reduces to a single-fiber computation), and a $\mathsf Q$-enriched sheaf $F : \mathbf T^{\mathrm{op}} \to \mathbf{QCat}_{\mathrm{cwl}}$ with restriction $\mathsf Q$-functors $F(\sigma \to \tau) : F(\tau) \to F(\sigma)$ for face inclusions $\sigma \subset \tau$, and pointwise right adjoints $F(\sigma \to \tau)^* : F(\sigma) \to F(\tau)$ (existing because each stalk is a complete weighted lattice).

Let $E$ be a 1-cell with face 0-cells $V_x, V_y$. A 0-cochain is a tuple $x = (x(V))_V$ with $x(V) \in F(V)$.

**$\mathbb F_3$ parallel-pair coboundary at $E$:**
$$(\delta^0_3 x)(E) \;=\; F(V_x \to E)^*\bigl(x(V_x)\bigr) \;\bullet\; F(V_y \to E)^*\bigl(x(V_y)\bigr),$$
in the parallel-pair convention of [@curry2014] / the [per-fiber d-frame Curry on the Belnap fiber example](../examples/per-fiber-d-frame-curry-on-belnap-fiber.md), where $\bullet$ encodes the equalizer condition: the kernel is exactly tuples with $F(V_x \to E)^*(x(V_x)) = F(V_y \to E)^*(x(V_y))$ as elements of $F(E)$.

**$\mathbb F_4$ weighted-meet coboundary at $E$:** by the cochain definition in [q-enriched-cohomology](../../../../bitopological-settling-site/content/quantale-enriched-sheaf/content/q-enriched-cohomology/q-enriched-cohomology.md) and the Lawvere-Laplacian construction of [lawvere-laplacian-grothendieck-sites](lawvere-laplacian-grothendieck-sites.md),
$$(\delta^0_4 x)(E) \;=\; F(V_x \to E)^*\bigl(x(V_x)\bigr) \;\wedge^W\; F(V_y \to E)^*\bigl(x(V_y)\bigr),$$
where $\wedge^W$ is the weighted meet in the complete weighted lattice $F(E)$. The kernel is exactly tuples for which this weighted meet equals the unit element (the "vacuously true" element) of $F(E)$.

The two coboundaries share the right-adjoint lift $F(V_\cdot \to E)^* : F(V_\cdot) \to F(E)$ on each side; they differ only in the binary operation used to combine the two lifts at $E$ — equality of two elements (the parallel-pair equalizer) versus weighted-meet equals unit (the Lawvere-Laplacian fixed-point condition).

### Lemma D1 (structural source of disagreement)

For any $\mathsf Q$-enriched sheaf $F$ on a face poset $\mathbf T$ as above, with the corpus's standard convention that $\wedge^W$ is the weighted meet in the complete weighted lattice $F(E)$ behaving as an ordinary meet on the cell-incidence weight $W$ (no nondegenerate weighting that would make the meet land above the pointwise meet), the kernel of $\delta^0_4$ is **strictly contained** in the kernel of $\delta^0_3$ in general:

$$\ker(\delta^0_4)\big|_E \;\subsetneq\; \ker(\delta^0_3)\big|_E,$$

in any setting where the joint-image hypothesis (some non-top element of $F(E)$ lies in the image of both right-adjoint lifts at $E$) is non-vacuous, including in principle the standard Belnap fiber under $\mathsf Q$ the Boolean two-element quantale, modulo verifying the joint-image hypothesis on Belnap-natural sheaf data (gap D-G2).

**Proof.** Write $a := F(V_x \to E)^*(x(V_x))$ and $b := F(V_y \to E)^*(x(V_y))$ for short.

*F4 implies F3.* If $a \wedge^W b = \mathbf 1_{F(E)}$, then under the standard meet semantics $\mathbf 1_{F(E)}$ is the top of $F(E)$, so any element bounded below by $\mathbf 1_{F(E)}$ equals $\mathbf 1_{F(E)}$. Both $a, b \leq \mathbf 1_{F(E)}$ trivially, and $a \wedge^W b \leq a, b$ in the meet ordering, forcing $a = b = \mathbf 1_{F(E)}$. In particular $a = b$, so the F3 equality condition holds.

*F3 does not imply F4.* When $F(E)$ is a non-trivial complete lattice and there exists a strictly-below-top element $c \in F(E)$ that lies in the image of both $F(V_x \to E)^*$ and $F(V_y \to E)^*$, take $x(V_x), x(V_y)$ such that $a = b = c$. Then the F3 equality holds ($a = b = c$), but the F4 condition fails ($a \wedge^W b = c \wedge^W c = c \neq \mathbf 1_{F(E)}$ since $c$ is strictly below top).

So the F4 kernel is contained in the F3 kernel, and the containment is strict whenever any non-top element lies in the image of both right-adjoint lifts.

The F3 kernel asks for the equalizer of two parallel restrictions; the F4 kernel asks for the round-trip weighted-meet to fix to top. The latter is the strictly stronger condition under standard meet semantics. $\square$

*Remark on the weight $W$.* The corpus's $W$ in [q-enriched-cohomology](../../../../bitopological-settling-site/content/quantale-enriched-sheaf/content/q-enriched-cohomology/q-enriched-cohomology.md) is described as encoding cell-incidence sign and multiplicity. If a future weight convention is adopted under which $\wedge^W$ produces strictly larger elements than the pointwise meet (e.g., a join-like reweighting), the containment direction in Lemma D1 could in principle reverse or become incomparable. The lemma as stated is conditional on the standard reading; pinning the precise behavior of $W$ on the bitopological settling site's cell incidences is part of gap D-G2.

### D2 (witness blueprint on the standard Belnap fiber)

This is *not* a lemma. It is a witness blueprint: a recipe — together with a record of attempted candidates — for producing a concrete $H^0$ witness for the strict containment of Lemma D1 on the standard Belnap fiber. The existential claim "such a witness exists at $H^0$ on the standard Belnap fiber" is **not proved here**; it is conjectured on the basis of Lemma D1 and deferred to gap D-G2.

**Setup.** Take the standard Belnap fiber $X = \{+, -\}$ with clopen lattice $L = \{\emptyset, \{+\}, \{-\}, \{+, -\}\}$ as in the [per-fiber d-frame Curry on the Belnap fiber example](../examples/per-fiber-d-frame-curry-on-belnap-fiber.md). The order complex has 4 vertices (one per clopen), 5 edges (one per comparable pair), and 2 triangles. Pick the edge $E$ between two comparable clopens (e.g., $V_{\emptyset}$ and $V_{\{+\}}$, or $V_{\{+\}}$ and $V_{\{+,-\}}$). Take $F$ to be a $\mathsf Q$-enriched sheaf with non-trivial stalk $\mathbf 2 \times \mathbf 2$ (Boolean d-frame) and restrictions chosen so that some strictly-below-top element lies in the joint image of both right-adjoint lifts at $E$.

**What Lemma D1 guarantees.** Whenever the joint-image hypothesis holds at $E$ — i.e., there exists $c \in F(E)$ with $c < \mathbf 1_{F(E)}$ in the image of both $F(V_x \to E)^*$ and $F(V_y \to E)^*$ — Lemma D1 gives a 0-cochain $x$ in $\ker(\delta^0_3)$ that is not in $\ker(\delta^0_4)$. The kernel-strict-containment is therefore inhabitable as soon as the joint-image hypothesis is verified.

**Attempted candidates and their failure modes.** The natural Belnap-d-frame restriction maps for $\mathbb F_v$ on the order complex's edges are projection-style or identity-style $\mathsf Q$-functors $\mathbf 2 \times \mathbf 2 \to \mathbf 2 \times \mathbf 2$. For each natural choice we tried (both restrictions equal projection onto the first coordinate; one projection one identity; etc.), one of two things happened: either the right-adjoint lifts coincided pointwise on the cochains we sampled (so the F3 / F4 conditions accepted/rejected the same elements), or the joint image collapsed to a single element so the joint-image hypothesis above was vacuous. The kernel-containment of Lemma D1 holds strictly only when the joint image contains a non-top element, and on the standard Belnap fiber's natural sheaf data the joint image is constrained enough that we did not exhibit such an element directly at edge level.

**Where the discriminating witness should live.** A discriminating witness is expected to require either: (i) the *triangle*-level coboundary on a 3-cell of the order complex, comparing the triple-equalizer F3 condition (transitive equality across three lifted values) with the triple-meet F4 condition; or (ii) a non-Belnap stalk choice, such as $\mathbf 2 \times \mathbf 2 \times \mathbf 2$ or a non-Boolean d-frame, where the right-adjoint lifts have richer images. Option (i) requires fixing the corpus's weight convention $W$ explicitly on the order-complex 3-cell incidences; option (ii) leaves the standard Belnap fiber and so does not directly answer the empirical question that the older corpus text (cohomological-framework.md, cohomological-framework-comparison.md) implicitly raised.

**What is and is not established.** Lemma D1 unconditionally establishes the strict containment $\ker(\delta^0_4) \subsetneq \ker(\delta^0_3)$ as a structural fact about complete-weighted-lattice meets versus equalizers, *in any setting where the joint-image hypothesis is non-vacuous*. The existence of such a setting on the standard Belnap fiber's natural sheaf data is plausible but not yet exhibited. The current draft therefore commits to: the structural disagreement between $\delta^0_3$ and $\delta^0_4$ (Lemma D1, unconditional), and an explicit blueprint (this section, no proof) for promoting Lemma D1 to a Belnap-fiber witness for $\alpha_{34}^{H^0}$ non-invertibility. The blueprint's outcome is gap D-G2.

### Higher degrees and naturality

The structural disagreement between $\delta^0_3$ and $\delta^0_4$ (Lemma D1) propagates to $H^1$ by the same coboundary-convention divergence at the next degree. The corresponding $H^0$ witness on the standard Belnap fiber is the open content of D2 / gap D-G2. In degrees $\geq 2$, both frameworks give zero on the appropriate subdomain (per [Q-enriched cochain-cohomology higher-degree vanishing](../../../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-cohomology-higher-degree-vanishing.md) and the regime cohomology theorems for $\mathbb F_3$), so $\alpha_{34}^{\geq 2}$ is the unique zero natural transformation between constantly-zero functors — vacuously a natural iso. This is the content of the [framework-4-vanishing-transfer theorem](framework-4-vanishing-transfer.md), and it does not contradict the disagreement at $H^0, H^1$.

Naturality of $\alpha_{34}$ (as a graded natural transformation, regardless of invertibility) follows from the functoriality of $\Phi^{34}_{\mathcal D}$ on bitopological-site morphisms and the standard naturality of cochain-cohomology under sheaf morphisms; this is part of the data of the comparison 1-cell in $\mathbf{CohFr}$, not part of the agreement claim.

## Identified gaps

**Gap D-G1: $\alpha_{34}$ not yet formalized as a typed graded natural transformation in $\mathbf{CohFr}$, and the F3 ↔ F4 sheaf-direction convention bridge not pinned.** The structural calculation in Lemma D1 treats $\delta^0_3$ and $\delta^0_4$ as coboundaries on the same cochain $\mathsf Q$-categories, suppressing a real typing question: $\mathbb F_3$ in the corpus follows the [@curry2014] / [@lopez2024] cellular-sheaf convention (sheaf as a *covariant* assignment from the face poset to $\mathsf Q$-categories, with restrictions going from face to coface), while $\mathbb F_4$ in [q-enriched-cohomology](../../../../bitopological-settling-site/content/quantale-enriched-sheaf/content/q-enriched-cohomology/q-enriched-cohomology.md) is a *contravariant* sheaf $F : \mathbf T^{\mathrm{op}} \to \mathbf{QCat}_{\mathrm{cwl}}$ whose restrictions go from coface to face. Lemma D1's coboundary formulas are written in the $\mathbb F_4$ convention; identifying them with the $\mathbb F_3$ parallel-pair coboundary requires an explicit convention bridge — most naturally, taking $\mathbb F_3$'s right-adjoint lifts as the structural counterpart of $\mathbb F_4$'s restriction right adjoints. Until this bridge is fixed as a typed corpus object, the claim "$\alpha_{34}$ is not invertible" is not yet fully well-typed.

Promotion to `proved` requires:

1. **Convention bridge.** A corpus file or section pinning the F3 ↔ F4 sheaf-direction convention bridge: specify whether $\alpha_{34}$ goes between $\mathbb F_3$'s covariant cellular sheaves and $\mathbb F_4$'s contravariant Q-enriched sheaves via "transpose the face poset" or via "identify covariant cellular sheaves with their contravariant cosheaf counterparts via Curry," and verify that under this bridge the two coboundary formulas in Lemma D1's setup are comparing the same cochain data.
2. **Typed natural transformation.** A corpus file for $\alpha_{34}$ in `morphisms/` (or as a section of [cohomological-framework-comparison](../morphisms/cohomological-framework-comparison.md)) specifying $\alpha_{34}^n : H^n_{\mathbb F_3}(-) \Rightarrow H^n_{\mathbb F_4}(\Phi^{34}_{\mathcal D}(-))$ explicitly under the chosen bridge, with construction recipe and naturality squares.
3. **Naturality verification.** Verification of $\mathsf Q$-naturality of $\alpha_{34}$ on the standard morphisms of $\mathcal D^\circ_{34}$ (predicate-changes, settling-advancements, fiber-restrictions).

This gap is structurally analogous to gap **C-G1** in [framework-1-2-strict-agreement](framework-1-2-strict-agreement.md) and gap **G3** in [framework-2-3-strict-agreement](framework-2-3-strict-agreement.md) for the typing component, with the additional convention-bridge component specific to F3 / F4 (which use opposite sheaf-direction conventions, unlike F1 / F2 / F3 which all use the same direction within their own scopes).

**Gap D-G2: concrete Belnap-fiber witness not yet exhibited; structural-vs-artifactual distinction not yet established.** D2 (the witness blueprint above) is explicit that no concrete $(F, x)$ on the standard Belnap fiber currently demonstrates $x \in \ker(\delta^0_3) \setminus \ker(\delta^0_4)$. The structural disagreement of Lemma D1 holds whenever the joint-image hypothesis is non-vacuous; verifying that the standard Belnap fiber's natural sheaf data realizes this hypothesis is the open empirical content. Closing D-G2 requires:

1. Pin the F4 weight convention $W$ explicitly from [q-enriched-cohomology](../../../../bitopological-settling-site/content/quantale-enriched-sheaf/content/q-enriched-cohomology/q-enriched-cohomology.md), including sign and multiplicity conventions on cell incidences in the order complex of the clopen lattice (and in particular on its two 2-cells).
2. Carry out either (i) the triangle-level arithmetic referenced in D2's "where the discriminating witness should live" paragraph, comparing the triple-equalizer F3 condition with the triple-meet F4 condition on a specific 2-cell of the order complex; or (ii) the edge-level arithmetic with a non-trivial choice of restriction maps that makes the joint-image hypothesis non-vacuous at edge level.
3. Show that the concrete witness so produced is **intrinsic to the comparison transformation at the site level**, not an artifact of how $\mathbb F_3$'s per-fiber-Curry assembly is set up: i.e., that no choice of $\mathbb F_3$-assembly convention (parallel-pair vs antisymmetric-pair, Curry-direction ambiguity, base-change fuzziness assignment) recovers the $\mathbb F_4$ output at $H^0$ on this configuration.

Closing D-G2 upgrades D2 from a witness blueprint to an actual existence lemma, and the disagreement claim from `sketch` to `proved`. The work is concrete computation within the existing F3/F4 cochain machinery once gap D-G1's convention bridge is fixed; no new structural ingredients are needed.

## Consequences

If this theorem is correct (and Lemma D1 strongly suggests it is — the kernel conditions are inequivalent as categorical conditions, not just numerically), the downstream impact is: theorems stated in $\mathbb F_4$ language cannot be discharged by $\mathbb F_3$ proofs without an explicit translation argument that does not currently exist. In particular, the [Q-enriched cochain-cohomology higher-degree vanishing theorem](../../../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-cohomology-higher-degree-vanishing.md) (proved as a cochain-level statement in $\mathbb F_4$) cannot be transferred to $\mathbb F_3$ as a cohomology-as-objects equivalence via this comparison. What *can* be transferred is the bare vanishing — both sides are zero — and that partial transfer is the content of the [framework-4-vanishing-transfer theorem](framework-4-vanishing-transfer.md).

If $\mathbb F_3$ and $\mathbb F_4$ are genuinely different theories, the corpus owes a position on which is the canonical d-frame-cohomology of a settling. The verified $\mathbb F_2 \leftrightarrow \mathbb F_3$ Belnap-fiber agreement (via Lemma B1 of [framework-2-3-strict-agreement](framework-2-3-strict-agreement.md)) positions $\mathbb F_3$ as the natural extension of the strict-regime $\mathbb F_2$ theory; $\mathbb F_4$ is then a distinct Q-enriched theory with its own merits but not the canonical extension of $\mathbb F_2$. This is the natural reading and the one this theorem points toward.

## Discussion

This theorem is structurally a *clarifying* result rather than a generative one — it does not unlock new computation, it removes a category error. But the category error is real: without this theorem, the corpus risks running F3 proofs to discharge F4 statements (or vice versa) on the implicit assumption of agreement. With Lemma D1 in hand and only D-G1 / D-G2 outstanding, every cross-framework move between $\mathbb F_3$ and $\mathbb F_4$ becomes typed and visible.

Compared to [framework-1-2-strict-agreement](framework-1-2-strict-agreement.md) and [framework-2-3-strict-agreement](framework-2-3-strict-agreement.md) — both *positive* agreement results with substantial partial proofs — this theorem is the *negative* counterpart: a positive negative result, recording that one of the four cross-framework comparisons fails to be an agreement. The two outstanding gaps (D-G1 typing $\alpha_{34}$, D-G2 structural-vs-artifactual witness) are the negative-result analogs of the typing / verification gaps in the other two `sketch` agreement theorems.

The complementary [framework-4-vanishing-transfer theorem](framework-4-vanishing-transfer.md) records the one direction in which $\mathbb F_3$ and $\mathbb F_4$ trivially agree (both zero in degrees $\geq 2$ on the appropriate subdomain). Together, the two F3/F4 theorems give a complete typed account: disagreement at $H^0, H^1$ (this theorem); trivial agreement at $H^{\geq 2}$ on the cochain-vanishing subdomain (the transfer theorem).
