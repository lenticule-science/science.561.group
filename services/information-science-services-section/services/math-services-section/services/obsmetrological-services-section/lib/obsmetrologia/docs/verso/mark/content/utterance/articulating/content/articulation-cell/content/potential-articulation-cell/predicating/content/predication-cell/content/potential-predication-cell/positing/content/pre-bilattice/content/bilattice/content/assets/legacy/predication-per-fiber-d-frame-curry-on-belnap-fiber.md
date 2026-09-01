---
type: example
status: verified
depends-on:
  - bitopological-settling-site
  - paired-priestley-space
  - d-frame-valued-sheaf
  - q-enriched-curry-grothendieck-site
  - q-enriched-curry-2-dim-degree-0
  - strict-regime-d-frame-cohomology
  - cohomological-framework
see-also:
  - per-fiber-curry-on-clopen-lattice-fiber
  - verdier-duality-bitopological-site
  - three-cohomological-frameworks
  - framework-2-3-strict-agreement
  - cohomological-framework-2category
---

# Per-fiber d-frame Curry on the standard Belnap fiber

A worked instance of d-frame Curry equivalence at $H^0/H_0$ on the per-base-point fiber of the [bitopological settling site](../objects/bitopological-settling-site.md), for the standard Belnap setting ($\mathbf L = \mathbf 2$) and the simplest non-trivial cell placement ($\Delta^+ = \{+\}, \Delta^- = \{-\}$, no $\top$-cells).

The result: per-fiber d-frame Curry equivalence holds, with the cellular-sheaf computation in Framework 3 ([cellular sheaf on the order complex of the clopen lattice](teaching/explanations/cohomological-framework.md)) producing the same d-frame as the discrete-points-fiber Tarski-Laplacian computation in Framework 2 (used by the [strict-regime d-frame cohomology theorem](../theorems/strict-regime-d-frame-cohomology.md)). This is the first concrete cross-framework agreement on a worked example.

## Setup

Fix a base point $(q, \tau)$. The paired-Priestley space $X_q^\tau$ in the standard Belnap setting is the two-point space $\{+, -\}$ with the swap involution $\sigma$.

**The fiber** $\mathbf T_{(q, \tau)}$ is the order complex of the lattice of pairwise-Stone clopens of $X_q^\tau$, which for $\{+, -\}$ is the 4-element Boolean algebra $\{\emptyset, \{+\}, \{-\}, \{+,-\}\}$. The order complex has:

- **Vertices** (4): $V_e, V_p, V_m, V_b$ for $\emptyset, \{+\}, \{-\}, \{+,-\}$ respectively.
- **Edges** (5): chains $x < y$ — $E_{ep}, E_{em}, E_{eb}, E_{pb}, E_{mb}$.
- **Triangles** (2): chains $x < y < z$ — $T_{epb} = (V_e < V_p < V_b)$ and $T_{emb} = (V_e < V_m < V_b)$.

Geometrically the order complex is the subdivided square (two triangles sharing the diagonal $V_e \to V_b$), contractible (homotopy-equivalent to Δ¹).

**The d-frame-valued sheaf** $\mathbb F_v$ at this fiber, with $\Delta^+_\tau(q) = \{+\}$ and $\Delta^-_\tau(q) = \{-\}$ (one truth-positive cell at $+$, one falsity-positive cell at $-$, no $\top$- or $\bot$-cells):

| clopen $U$ | $L_+(U) = \mathcal P(U \cap \{+\})$ | $L_-(U) = \mathcal P(U \cap \{-\})$ | $\mathrm{con}(U)$ | $\mathrm{tot}(U)$ |
|---|---|---|---|---|
| $\emptyset$ | $\{\emptyset\}$ | $\{\emptyset\}$ | trivial | trivial |
| $\{+\}$ | $\{\emptyset, \{+\}\}$ | $\{\emptyset\}$ | all pairs | only $(\{+\}, \emptyset)$ |
| $\{-\}$ | $\{\emptyset\}$ | $\{\emptyset, \{-\}\}$ | all pairs | only $(\emptyset, \{-\})$ |
| $\{+,-\}$ | $\{\emptyset, \{+\}\}$ | $\{\emptyset, \{-\}\}$ | all 4 pairs | only $(\{+\}, \{-\})$ |

(Consistency is "joint extension is non-empty," i.e., disjoint as cell sets — trivially true here since $\Delta^+ \cap \Delta^- = \emptyset$. Totality is "joint extension covers settled cells," requiring $A \cup B \supseteq U \cap (\Delta^+ \cup \Delta^-)$.)

Restrictions for inclusion $U' \subseteq U$ act componentwise as intersection with $U'$. Cellular sheaf convention: stalk at higher simplex = stalk at smallest vertex of the chain. So $F(E_{xy}) = F(V_x)$ for $x < y$, and $F(T_{xyz}) = F(V_x)$ for $x < y < z$.

## Computation

### $H^0$ on the $L_+$ shadow

The cochain complex on the $L_+$ side has $C^0 = \prod_v F^k(V_v)$ with sizes $1 \cdot 2 \cdot 1 \cdot 2 = 4$ elements.

Parallel-pair coboundary at each edge requires the two restriction images to agree:

| edge | $V_x$ side | $V_y$ side | constraint |
|---|---|---|---|
| $E_{ep}$ | $\emptyset$ (forced) | collapse: $\emptyset$ always | none |
| $E_{em}$ | $\emptyset$ | identity from $V_m = \{\emptyset\}$ | none |
| $E_{eb}$ | $\emptyset$ | collapse: $\emptyset$ always | none |
| $E_{pb}$ | identity: $c(V_p)$ | identity ($\{+\} \cap \{+\} = \{+\}$): $c(V_b)$ | $c(V_p) = c(V_b)$ |
| $E_{mb}$ | $\emptyset$ | collapse: $\emptyset$ always | none |

Single non-trivial constraint: $c(V_p) = c(V_b)$. Since $V_e, V_m$ stalks are forced (trivial), the kernel has 2 elements parametrized by $c_p = c_b \in \{\emptyset, \{+\}\}$:

$$H^0(F^k) \;=\; \mathcal P(\{+\}) \;\cong\; \mathbf 2.$$

(Higher degrees: $\delta^1$ on each triangle has all parallel restrictions to $\{\emptyset\}$ trivially equal; $\ker(\delta^1) = C^1$. $\mathrm{im}(\delta^0) = C^1$ since the only nontrivial component is at $E_{pb}$ and ranges freely. So $H^1 = 0$. Similarly $H^2 = 0$.)

By symmetry ($\{+\} \leftrightarrow \{-\}$, single constraint at $E_{mb}$ instead of $E_{pb}$):

$$H^0(F^{k,-}) \;=\; \mathcal P(\{-\}) \;\cong\; \mathbf 2.$$

### $H_0$ on the cosheaf side

The cosheaf $\check F^k$ has the same stalks; extensions are right adjoints of restrictions. The collapse $\{\emptyset, \{+\}\} \to \{\emptyset\}$ has right adjoint $\{\emptyset\} \to \{\emptyset, \{+\}\}$ sending $\emptyset \to \{+\}$ (the top of the larger lattice — the unique element $a$ such that $f(b) \leq \emptyset \iff b \leq a$ when $f$ is the constant collapse).

Per-edge identifications in the disjoint union $C_0 \check F^k$ (6 elements):

| edge | identification |
|---|---|
| $E_{ep}$ | $(V_e, \emptyset) \sim (V_p, \{+\})$ |
| $E_{em}$ | $(V_e, \emptyset) \sim (V_m, \emptyset)$ |
| $E_{eb}$ | $(V_e, \emptyset) \sim (V_b, \{+\})$ |
| $E_{pb}$ | $(V_p, \emptyset) \sim (V_b, \emptyset)$ and $(V_p, \{+\}) \sim (V_b, \{+\})$ |
| $E_{mb}$ | $(V_m, \emptyset) \sim (V_b, \{+\})$ |

Equivalence classes:

- $[A]_+ = \{(V_e, \emptyset), (V_p, \{+\}), (V_m, \emptyset), (V_b, \{+\})\}$ (4 elements).
- $[B]_+ = \{(V_p, \emptyset), (V_b, \emptyset)\}$ (2 elements).

Within-stalk relations descend: $\emptyset \leq \{+\}$ in $F^k(V_p)$ (and $V_b$) gives $[B]_+ \leq [A]_+$. So $H_0(\check F^k) = \{[B]_+ \leq [A]_+\}$ — 2-element chain isomorphic to $\mathcal P(\{+\})$ via $[B]_+ \leftrightarrow \emptyset$, $[A]_+ \leftrightarrow \{+\}$.

Symmetrically, $H_0(\check F^{k,-}) = \{[B]_- \leq [A]_-\} \cong \mathcal P(\{-\})$.

**Curry equivalence on each shadow side**: $H^0(F^k) \cong H_0(\check F^k) \cong \mathcal P(\{+\})$, and similarly for the $L_-$ side.

### D-frame con and tot at $H^0$

For the d-frame Curry equivalence, the relations $\mathrm{con}$ and $\mathrm{tot}$ on $H^0$ need to be derived from the d-frame structure on the sheaf. For each pair of global shadow sections $(c_+, c_-) \in H^0(F^k) \times H^0(F^{k,-})$:

- $(c_+, c_-) \in \mathrm{con}(H^0)$ iff $\mathrm{con}(\mathbb F_v(U))$ holds for $(c_+(U), c_-(U))$ at every clopen $U$.
- $(c_+, c_-) \in \mathrm{tot}(H^0)$ iff $\mathrm{tot}(\mathbb F_v(U))$ holds at every clopen $U$.

Two L_+ sections × two L_- sections gives 4 pairs. With no $\top$-cells, all 4 are consistent. For totality:

| pair | $V_p$ tot ($\{+\}$ settled) | $V_m$ tot ($\{-\}$ settled) | $V_b$ tot ($\{+,-\}$ settled) | overall tot |
|---|---|---|---|---|
| (empty, empty) | $\emptyset \cup \emptyset = \emptyset$ ✗ | ✗ | ✗ | ✗ |
| (empty, $\{-\}$-active) | $\emptyset$ ✗ | ✓ | ✗ | ✗ |
| ($\{+\}$-active, empty) | ✓ | ✗ | ✗ | ✗ |
| ($\{+\}$-active, $\{-\}$-active) | ✓ | ✓ | ✓ | ✓ |

Only the "fully potential" pair is in $\mathrm{tot}(H^0)$.

### D-frame con and tot at $H_0$ (cosheaf side)

For each pair of equivalence classes $([A]_+, [B]_-) \in H_0(\check F^k) \times H_0(\check F^{k,-})$, define:

- $([A]_+, [B]_-) \in \mathrm{con}(H_0)$ iff for every vertex $v$ where both classes have a member at $v$, the pair (representatives at $v$) is in $\mathrm{con}(\mathbb F_v(V_v))$.
- $([A]_+, [B]_-) \in \mathrm{tot}(H_0)$ iff analogously for totality.

Working through all 4 pairs of classes (computed in [step5_dframe_curry.py](../tools/predication_categories/examples/per_fiber_d_frame_curry_on_belnap_fiber.py)):

- All 4 pairs satisfy con (no co-witness possible with no $\top$-cells).
- Only $([A]_+, [A]_-)$ — the potential classes on each side — satisfies tot, because at every vertex where both classes have a representative, the pair covers the settled cells. The other 3 pairs fail tot at some vertex.

## Result

**Per-fiber d-frame Curry equivalence at $H^0/H_0$:**

$$H^0(\mathbb F_v) \;\cong\; H_0(\check{\mathbb F}_v) \;\cong\; \bigl(\mathcal P(\{+\}),\ \mathcal P(\{-\}),\ \text{all 4 pairs in } \mathrm{con},\ \{(\{+\}, \{-\})\}\text{ in } \mathrm{tot}\bigr)$$

as d-frames. The natural isomorphism on each side identifies $\emptyset$ with the "all-empty" section/class and $\{+\}$ (resp. $\{-\}$) with the "potential" section/class.

**Cross-framework agreement.** This d-frame matches what the [strict-regime d-frame cohomology theorem](../theorems/strict-regime-d-frame-cohomology.md) predicts in its discrete-points-fiber Tarski-Laplacian framework:

$$H^0_{\mathbf{dFrm}} \;=\; \bigl(\mathcal P(\Delta^{+,*}_{\tau^*}),\ \mathcal P(\Delta^{-,*}_{\tau^*}),\ \mathrm{con},\ \mathrm{tot}\bigr) \;=\; \bigl(\mathcal P(\{+\}),\ \mathcal P(\{-\}),\ \text{all},\ \{(\{+\}, \{-\})\}\bigr).$$

Two distinct cohomological frameworks (per the [cohomological-framework concept](teaching/explanations/cohomological-framework.md)) give the same d-frame on this worked case. This example is the rank-2 verified instance of Lemma B1 of the [framework-2-3-strict-agreement theorem](../theorems/framework-2-3-strict-agreement.md) (`status: sketch`, with substantial partial proof): Lemma B1 there reduces here to the equalizer condition at the single non-trivial edge $E_{V_p, V_b}$, and the higher-degree vanishing on this rank-2 fiber is the unconditional case (covered by [Q-enriched Curry 2-dim-degree-0](../theorems/q-enriched-curry-2-dim-degree-0.md), `status: proved`). The full per-settling agreement claim remains sketch pending the sketch corpus machinery identified in that theorem's gap list.

## Reproducibility

All passes are verified by [`predication_categories.examples.per_fiber_d_frame_curry_on_belnap_fiber`](../tools/predication_categories/examples/per_fiber_d_frame_curry_on_belnap_fiber.py) (the Phase 1+2+3 per-note Python module). Six pytest-discovered functions decorated with `@verifies("examples/per-fiber-d-frame-curry-on-belnap-fiber.md", claim=...)`:

- `test_classical_sanity_check` — order-complex shape (4 vertices, 5 edges, 2 triangles) + constant Z cohomology (H^0 = Z, H^k = 0).
- `test_pass_1_lplus_shadow_h0` — L+ shadow sheaf H^0 = P({+}).
- `test_pass_2_lplus_shadow_h0_cosheaf` — L+ shadow cosheaf H_0 has Class A (4 elements) + Class B (2 elements).
- `test_pass_3_lminus_shadow` — L- shadow symmetric to L+.
- `test_pass_4_dframe_h0_con_tot` — d-frame H^0 = (P({+}), P({-}), all 4 pairs in con, exactly ({+}, {-}) in tot).
- `test_pass_5_dframe_h0_cosheaf` — d-frame H_0 cosheaf side: Curry equivalence at d-frame level.

Run from the chapter root with `python -m pytest tools/predication_categories/`. The legacy standalone scripts in [`tools/predication_categories/examples/per_fiber_d_frame_curry_on_belnap_fiber.py/`](../tools/predication_categories/examples/per_fiber_d_frame_curry_on_belnap_fiber.py/) are superseded by this module.

## Scope

This example verifies the agreement on **one specific placement** of $\Delta^+, \Delta^-$ in the **standard Belnap setting**. It is not a proof of:

- D-frame Curry equivalence for arbitrary placements on the Belnap fiber.
- D-frame Curry equivalence on richer paired-Priestley fibers (corresponding to $\mathbf L \neq \mathbf 2$).
- A general Framework-2-to-3 translation theorem.

Each of these is a separate piece of work; the working question [per-fiber Curry on the clopen lattice fiber](questions/per-fiber-curry-on-clopen-lattice-fiber.md) lists the natural follow-ups.

## Position in predication categories

This example is the **first concrete worked-out instance** of cross-framework agreement at the d-frame cohomology level. It establishes that Framework 3's cellular-sheaf-on-order-complex computation isn't an abstraction without computational content — it produces the same d-frame as Framework 2's discrete-points framework in a case where both frameworks apply and where Framework 2's theorem already gives a target answer.

For predication categories' downstream theorem chain ([Verdier duality on bitopological site](../theorems/verdier-duality-bitopological-site.md) → [d-frame Verdier composition](../theorems/d-frame-verdier-composition.md) → [strong-MLD via composed duality](../theorems/strong-mld-via-composed-duality.md)) — all of which use Framework 3 — this is positive evidence that Framework 3's per-fiber Curry assembly produces meaningful d-frames that agree with what Framework 2 would predict, at least on the Belnap base case.
