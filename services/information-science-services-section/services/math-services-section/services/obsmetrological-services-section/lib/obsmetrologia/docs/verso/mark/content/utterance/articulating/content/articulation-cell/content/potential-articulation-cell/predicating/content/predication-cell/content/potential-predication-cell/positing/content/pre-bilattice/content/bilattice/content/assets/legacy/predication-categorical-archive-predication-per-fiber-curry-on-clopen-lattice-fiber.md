---
type: question
class: bridge
status: partial
explores:
  - q-enriched-curry-grothendieck-site
  - q-enriched-curry-cw-complex
  - q-enriched-curry-2-dim-degree-0
  - q-enriched-curry-2-cell-fuzzy
  - bitopological-settling-site
  - paired-priestley-space
  - d-frame-valued-sheaf
  - jung-rivieccio-duality
  - strict-regime-d-frame-cohomology
---

# Per-fiber Curry equivalence on the clopen-lattice fiber

For the [bitopological settling site](../../../../../../valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/bitopological-settling-site.md) over the standard Belnap setting ($\mathbf L = \mathbf 2$, paired-Priestley dual $X_q^\tau = \{+, -\}$), the per-base-point fiber $\mathbf T_{(q,\tau)}$ is the order complex of the lattice of pairwise-Stone clopens of $X_q^\tau$. For $\{+, -\}$, the clopen lattice is $\{\emptyset, \{+\}, \{-\}, \{+,-\}\}$ — a 4-element Boolean algebra — whose order complex is the contractible subdivided square: 4 vertices, 5 edges (chains $x < y$), 2 triangles (chains $x < y < z$).

This question is a working space for iteratively computing per-fiber Curry equivalence on this fiber for the d-frame-valued sheaf $\mathbb F_v$ — the sheaf the chapter actually cares about. Each pass adds a concrete piece; once enough pieces are settled, results migrate out into permanent corpus locations (theorems, examples, etc.).

## Background and setup

**The d-frame-valued sheaf $\mathbb F_v$ at a fixed $(q, \tau)$.** Following the [d-frame-valued sheaf object](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/d-frame-valued-sheaf/d-frame-valued-sheaf.md), at a clopen $U$:

$$\mathbb F_v(U) \;=\; \bigl(L_+(U),\ L_-(U),\ \mathrm{con}(U),\ \mathrm{tot}(U)\bigr)$$

with $L_+(U) = \mathcal P(U \cap \Delta^+_\tau(q))$ and $L_-(U) = \mathcal P(U \cap \Delta^-_\tau(q))$ — powerset frames of the truth-positive and falsity-positive cells inside $U$.

For the simplest concrete case, take $\Delta^+_\tau(q) = \{+\}$ and $\Delta^-_\tau(q) = \{-\}$ (one truth-positive cell at $+$, one falsity-positive cell at $-$, no $\top$- or $\bot$-cells). Then the d-frame stalks at the four clopens are:

| clopen $U$ | $L_+(U)$ size | $L_-(U)$ size | d-frame |
|---|---|---|---|
| $\emptyset$ | 1 | 1 | trivial |
| $\{+\}$ | 2 | 1 | $L_+ = \mathbf 2$, $L_- = \{0\}$ |
| $\{-\}$ | 1 | 2 | $L_+ = \{0\}$, $L_- = \mathbf 2$ |
| $\{+,-\}$ | 2 | 2 | $L_+ = L_- = \mathbf 2$ |

**Restrictions** for inclusion $U' \subseteq U$ act componentwise as intersection with $U'$:
- $L_+$ restriction $L_+(U) \to L_+(U')$: $A \mapsto A \cap U'$.
- $L_-$ restriction analogously.

For our setup these reduce to: identity when restricting to a clopen that still contains the relevant point; total collapse to $\{\emptyset\}$ when restricting away from it. Specifically:
- $L_+$ side: $L_+(\{+\}) \to L_+(\emptyset)$ collapses (only $\emptyset$ remains); $L_+(\{+,-\}) \to L_+(\{+\})$ is identity (since $\{+\} \cap \{+\} = \{+\}$); $L_+(\{+,-\}) \to L_+(\{-\})$ collapses (since $\{+\} \cap \{-\} = \emptyset$); $L_+(\{+,-\}) \to L_+(\emptyset)$ collapses.
- $L_-$ side: symmetric.

**The order complex.** Vertices indexed by clopens $V_e, V_p, V_m, V_b$. Edges: $E_{ep}, E_{em}, E_{eb}, E_{pb}, E_{mb}$. Triangles: $T_{epb} = (V_e < V_p < V_b)$, $T_{emb} = (V_e < V_m < V_b)$.

Cellular sheaf convention (Čech-style): stalk at a higher simplex = stalk at the smallest vertex of its chain. So $F(E_{xy}) = F(V_x)$ when $x < y$, and $F(T_{xyz}) = F(V_x)$ when $x < y < z$. Restrictions from a face $V_y$ (with $x < y$) to $E_{xy}$ go via the lattice restriction $F(V_y) \to F(V_x)$.

**Question.** Does per-fiber Curry equivalence

$$H^k(\mathbb F_v|_{(q,\tau)}) \;\simeq\; H_k(\check{\mathbb F}_v|_{(q,\tau)})$$

hold in the parallel-pair cellular sheaf convention on the order complex above, for the d-frame-valued sheaf $\mathbb F_v$ in the standard Belnap setting? If yes with what fuzziness; if no, what's the obstruction?

## Progress log

The work is iterative — each pass tackles a sub-piece. As pieces settle, they're either consolidated here or migrated out.

### Pass 1 ($H^0$ on the truth-side shadow $F^k = L_+$ component) — done

Working with the $L_+$ shadow alone (treating it as a Pos-valued cellular sheaf), the cochain complex is:

- $C^0 = F^k(V_e) \times F^k(V_p) \times F^k(V_m) \times F^k(V_b) = \{\emptyset\} \times \{\emptyset, \{+\}\} \times \{\emptyset\} \times \{\emptyset, \{+\}\}$
- $C^1 = F^k(E_{ep}) \times \cdots \times F^k(E_{mb}) = \{\emptyset\} \times \{\emptyset\} \times \{\emptyset\} \times \{\emptyset, \{+\}\} \times \{\emptyset\}$
- $C^2 = F^k(T_{epb}) \times F^k(T_{emb}) = \{\emptyset\} \times \{\emptyset\}$

Parallel-pair coboundary $\delta^0$ at each edge requires the two face-restriction images to agree:

| edge | constraint |
|---|---|
| $E_{ep}$ | $V_e$ side gives $\emptyset$ (forced); $V_p$ side gives $\emptyset$ (collapse). Always satisfied. |
| $E_{em}$ | both sides give $\emptyset$. Always satisfied. |
| $E_{eb}$ | $V_e$ gives $\emptyset$; $V_b$ collapse gives $\emptyset$. Always satisfied. |
| $E_{pb}$ | $V_p$ side identity gives $c(V_p)$; $V_b$ side identity (since $\{+\} \cap \{+\} = \{+\}$) gives $c(V_b)$. **Constraint: $c(V_p) = c(V_b)$.** |
| $E_{mb}$ | $V_m$ gives $\emptyset$; $V_b$ collapse gives $\emptyset$. Always satisfied. |

So $\ker(\delta^0) = \{(c_e, c_p, c_m, c_b) : c_e = c_m = \emptyset, \ c_p = c_b\}$. The constrained variable is $c_p = c_b \in \{\emptyset, \{+\}\}$, giving:

$$H^0(F^k) \;=\; \mathcal P(\{+\}) \;\cong\; \mathbf 2.$$

This matches what the [strict-regime d-frame cohomology theorem](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/strict-regime-d-frame-cohomology.md) would predict for the $L_+$ component of $H^0$ in its discrete-points-fiber framework: $L_+$ component of $H^0_{\mathbf{dFrm}}$ is $\mathcal P(\Delta^{+, \mathrm{Belnap}}_{\tau^*}) = \mathcal P(\{+\})$ for our placement. So the cellular-sheaf-on-clopen-lattice computation and the Tarski-Laplacian-on-discrete-fiber computation agree on this $H^0$ component.

Higher degrees, briefly: $\delta^1$ at each triangle compares parallel restrictions to the smallest-vertex stalk $\{\emptyset\}$. All restrictions to this stalk give $\emptyset$ trivially, so $\delta^1$ has no non-trivial constraints. $\ker(\delta^1) = C^1$. And $\mathrm{im}(\delta^0) = C^1$ (the only nontrivial component is $c(E_{pb})$ which equals $c(V_p)$, ranging freely over $\{\emptyset, \{+\}\}$). So $H^1(F^k) = C^1 / C^1$ trivial. $H^2 = C^2 / \mathrm{im}(\delta^1) = \{\emptyset\}$, trivial.

**Pass 1 result.** $H^0(F^k) = \mathcal P(\{+\}) = \mathbf 2$, $H^1 = H^2 = 0$. The $L_+$-shadow per-fiber sheaf cohomology agrees with what the strict-regime discrete-points framework predicts.

### Pass 2 ($H_0$ on the truth-side shadow via cosheaf side, fuzzy adjoints) — done

The cosheaf side $\check F^k$ uses right adjoints of sheaf restrictions for extensions. For our restriction maps:
- Identity restrictions $F^k(V_b) \to F^k(V_p)$ etc. have identity right adjoints.
- Collapse restrictions like $F^k(V_p) \to F^k(V_e)$ (sending $\{\emptyset, \{+\}\} \to \{\emptyset\}$) have right adjoint $\{\emptyset\} \to \{\emptyset, \{+\}\}$ sending $\emptyset \to \{+\}$ (the top of the larger lattice — the unique element $a$ such that $f(b) \leq \emptyset \iff b \leq a$ with $f$ the constant collapse).

$H_0(\check F^k) = \mathrm{Coeq}_E(\partial_1)$ where each edge $E_{xy}$ contributes the parallel-pair identification $(\iota_x(\mathrm{adj}_x(z)),\, \iota_y(\mathrm{adj}_y(z)))$ for each $z$ in the edge stalk.

Per-edge identifications (computed in [step2_lplus_shadow_curry.py](../tools/predication_categories/examples/per_fiber_d_frame_curry_on_belnap_fiber.py) and verified by hand):

| edge | identification |
|---|---|
| $E_{ep}$ | $(V_e, \emptyset) \sim (V_p, \{+\})$ |
| $E_{em}$ | $(V_e, \emptyset) \sim (V_m, \emptyset)$ |
| $E_{eb}$ | $(V_e, \emptyset) \sim (V_b, \{+\})$ |
| $E_{pb}$ | $(V_p, \emptyset) \sim (V_b, \emptyset)$ and $(V_p, \{+\}) \sim (V_b, \{+\})$ |
| $E_{mb}$ | $(V_m, \emptyset) \sim (V_b, \{+\})$ |

Equivalence-class computation gives two classes in the 6-element $C_0 \check F^k$:

- **Class A** = $\{(V_e, \emptyset),\ (V_p, \{+\}),\ (V_m, \emptyset),\ (V_b, \{+\})\}$ — 4 elements.
- **Class B** = $\{(V_p, \emptyset),\ (V_b, \emptyset)\}$ — 2 elements.

Within-stalk order on $C_0$ ($\emptyset \leq \{+\}$ in $F^k(V_p)$ and $F^k(V_b)$) descends to: $[B] \leq [A]$ in $H_0$.

**Pass 2 result.** $H_0(\check F^k) = \{[B] \leq [A]\}$ — a 2-element chain, isomorphic as a poset to $H^0(F^k) = \{\emptyset \leq \{+\}\} = \mathcal P(\{+\})$.

**Curry equivalence holds at the $L_+$ shadow level for $H^0/H_0$**: both sides are the 2-element chain $\mathbf 2 \cong \mathcal P(\{+\}) = \mathcal P(\Delta^+)$.

This is the first concrete agreement between **Framework 3** (cellular sheaf on order complex of clopen lattice) and **Framework 2** (Tarski-Laplacian on discrete-points fiber, which the [strict-regime d-frame cohomology theorem](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/strict-regime-d-frame-cohomology.md) uses) on the d-frame-valued sheaf, on the $L_+$ component of $H^0$. See [cohomological-framework concept](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/content/cohomological-framework/cohomological-framework.md) for the broader picture.

### Pass 3 ($H^0$ and $H_0$ on the falsity-side shadow $F^{k,-} = L_-$ component) — done

By symmetry between $L_+$ and $L_-$ sides ($\{+\} \leftrightarrow \{-\}$), Passes 1 and 2's arguments transport directly. The single non-trivial constraint at edge $E_{mb}$ (the $L_-$-side mirror of edge $E_{pb}$ for the $L_+$ side) gives:

$$H^0(F^{k,-}) = \mathcal P(\{-\}) \cong \mathbf 2,\quad H_0(\check F^{k,-}) = \mathbf 2 \text{ as a poset}.$$

Verified computationally in [step3_both_shadows.py](../tools/predication_categories/examples/per_fiber_d_frame_curry_on_belnap_fiber.py), which parametrizes the shadow computation by $\Delta$ and runs both sides through one code path. Both shadows come out as expected: $H^0 \cong H_0 \cong \mathcal P(\Delta)$.

### Pass 4 (consistency and totality structure on $H^0$) — done

The d-frame $\mathbb F_v$ is more than its two shadows. The d-frame $H^0_{\mathbf{dFrm}}$ has, beyond the $L_+$ and $L_-$ components from Passes 1+3, two relations $\mathrm{con}$ and $\mathrm{tot}$ derived from the d-frame structure on each clopen.

For each pair $(c_+, c_-) \in H^0(F^k) \times H^0(F^{k,-})$ of global shadow sections, define:

- $(c_+, c_-) \in \mathrm{con}(H^0)$ iff at every clopen $U$, the pair $(c_+(U), c_-(U))$ is in $\mathrm{con}(\mathbb F_v(U))$ (no co-witness of a $\top$-cell).
- $(c_+, c_-) \in \mathrm{tot}(H^0)$ iff at every clopen $U$, the pair is in $\mathrm{tot}(\mathbb F_v(U))$ (joint covers settled cells in $U$).

Computed in [step4_dframe_H0.py](../tools/predication_categories/examples/per_fiber_d_frame_curry_on_belnap_fiber.py): with no $\top$-cells in our placement, all 4 pairs are consistent. Only the pair $(c_+ = \{+\}\text{-potential},\ c_- = \{-\}\text{-potential})$ is total — at the other 3 pairs, some clopen ($V_p$ or $V_m$) has a settled cell that the empty L-side can't cover.

**Pass 4 result.** $H^0_{\mathbf{dFrm}} = (\mathcal P(\{+\}),\ \mathcal P(\{-\}),\ \text{all 4 pairs},\ \{(\{+\}, \{-\})\})$. **Matches the strict-regime d-frame cohomology theorem's prediction exactly.** First concrete cross-framework agreement (Framework 2 ↔ Framework 3) at the full d-frame level.

### Pass 5 (full d-frame Curry equivalence) — done

The cosheaf $\check{\mathbb F}_v$ has its own d-frame structure. $H_0(\check{\mathbb F}_v)$ as a d-frame has $L_+$ and $L_-$ components from Passes 2+3 (each a 2-element chain), and relations defined analogously to Pass 4 but on equivalence classes:

- $([A]_+, [B]_-) \in \mathrm{con}(H_0)$ iff for every vertex $v$ where both classes have a representative, the pair (representatives at $v$) is consistent at $\mathbb F_v(V_v)$.
- $([A]_+, [B]_-) \in \mathrm{tot}(H_0)$ iff analogously for totality.

Computed in [step5_dframe_curry.py](../tools/predication_categories/examples/per_fiber_d_frame_curry_on_belnap_fiber.py): same result as Pass 4 — 4 pairs in con, exactly $([A]_+, [A]_-)$ (the potential classes on each side) in tot.

Identifying $[A]_+ \leftrightarrow \{+\}$, $[B]_+ \leftrightarrow \emptyset$, $[A]_- \leftrightarrow \{-\}$, $[B]_- \leftrightarrow \emptyset$ (the natural isomorphism between the L-side shadow cohomology and the L-side cosheaf homology):

$$H^0(\mathbb F_v) \;\cong\; H_0(\check{\mathbb F}_v)$$

as d-frames. **Pass 5 result.** Full d-frame Curry equivalence holds at $H^0/H_0$ for the standard Belnap setting on the bitopological-site fiber.

## Pass-suite summary

The 5 passes together establish, computationally and by hand, the per-fiber d-frame Curry equivalence at $H^0/H_0$ for $\Delta^+ = \{+\}, \Delta^- = \{-\}$ on the order complex of the clopen lattice of $\{+,-\}$:

$$\boxed{\ H^0(\mathbb F_v) \;\cong\; H_0(\check{\mathbb F}_v) \;\cong\; (\mathcal P(\{+\}),\ \mathcal P(\{-\}),\ \mathrm{all},\ \{(\{+\}, \{-\})\})\ }$$

This is **concrete cross-framework agreement evidence**: Framework 3's cellular-sheaf-on-order-complex computation gives the same d-frame as Framework 2's Tarski-Laplacian-on-discrete-fiber theorem predicts. One worked case; not yet a general agreement theorem.

**Migration:** The 5-pass result has been migrated to the [per-fiber d-frame Curry on the Belnap fiber example](../examples/per-fiber-d-frame-curry-on-belnap-fiber.md) as a consolidated worked example, with cross-references added to the [strict-regime d-frame cohomology theorem](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/strict-regime-d-frame-cohomology.md), the [Verdier duality theorem](../theorems/verdier-duality-bitopological-site.md), and the [Q-enriched Curry on Grothendieck sites theorem](../theorems/q-enriched-curry-grothendieck-site.md). This question stays open for the broader investigations listed below.

## Next investigations

The 5-pass case (one specific Belnap placement) being settled positively suggests several follow-ups, in roughly priority order:

1. **Other placements on the standard Belnap setting** (still $X_q^\tau = \{+, -\}$): try $\Delta^+ = \Delta^- = \{+\}$ (a $\top$-cell at $+$, no settled cells elsewhere); $\Delta^+ = \{+, -\}, \Delta^- = \emptyset$ (only truth-positive); etc. Each gives a different d-frame and tests Curry equivalence in a slightly different configuration. If all match the corresponding strict-regime theorem prediction, evidence accumulates.

2. **Richer paired-Priestley fibers**: $\mathbf L = \mathbf 3$ or $\mathbf L = \mathbf 4$ would give larger paired-Priestley duals (more points), larger clopen lattices, more cells in the order complex. The same passes should run; whether Curry still holds is less obvious.

3. **The general theorem**: prove Curry equivalence at the d-frame level for arbitrary $\Delta^+, \Delta^-$ on the standard Belnap fiber. This would consolidate the worked examples into a Framework 3 theorem matching the Framework 2 theorem's content.

## What's been established (not just by this question)

- Order-complex framework is sound at the classical sanity-check level (Pass 0 = [step1_classical_sanity.py](../tools/predication_categories/examples/per_fiber_d_frame_curry_on_belnap_fiber.py)): constant $\mathbb Z$-sheaf gives $H^0 = \mathbb Z, H^{k\geq 1} = 0$.
- The [q-enriched Curry equivalence on graphs](../theorems/q-enriched-curry-finite-graph.md) and [on 2-dim degree-0 complexes](../../../../../../valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-curry-2-dim-degree-0.md) is proved at predication categories' structural rigor level.
- The [strict-regime d-frame cohomology theorem](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/strict-regime-d-frame-cohomology.md) gives a target Framework 2 prediction; Pass 4+5 confirms agreement on this specific placement.

## What's open

- Items 1–3 in "Next investigations" above.
- The translation theorem between Frameworks 2 and 3 in general — Pass 5 is one verified case, not a proof.
- Extension beyond standard Belnap.
- Higher-dim Curry on richer fibers.

## What's been established (not just by this question)

- Order-complex framework is sound at the classical sanity-check level: constant $\mathbb Z$-sheaf gives $H^0 = \mathbb Z$, $H^{k\geq 1} = 0$ on this contractible complex (verified in [verify-zero-dim-curry/step1_classical_sanity.py](../tools/predication_categories/examples/per_fiber_d_frame_curry_on_belnap_fiber.py)).
- The [q-enriched Curry equivalence on graphs](../theorems/q-enriched-curry-finite-graph.md) and [on 2-dim degree-0 complexes](../../../../../../valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-curry-2-dim-degree-0.md) is proved at predication categories' structural rigor — these are the foundational tools the per-fiber computation rests on.
- The [strict-regime d-frame cohomology theorem](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/strict-regime-d-frame-cohomology.md) (proved status, but in a different framework — discrete-points-fiber Tarski-Laplacian rather than order-complex cellular sheaf) gives a target answer the order-complex computation should agree with.

## What's open

The five passes above. Plus structurally:

- The translation theorem between the discrete-points-fiber framework and the order-complex framework, if Passes 1–5 land affirmatively. (One concrete agreement instance verified in Pass 1; full theorem requires the agreement to hold for all d-frame-valued sheaves, not just this specific placement.)
- Extension beyond the standard Belnap setting (richer paired-Priestley duals corresponding to $\mathbf L$ richer than $\mathbf 2$).
- σ-equivariance investigation: whether the paired-Priestley swap σ (corresponding to bilattice negation) gives an additional structural constraint that simplifies the computation.

## Migration policy

As passes complete and findings consolidate, they migrate out:

- Concrete computation results (like Pass 1's $H^0 = \mathcal P(\{+\})$) → either an example file (`examples/per-fiber-curry-on-belnap-fiber.md`) or absorbed into the [strict-regime d-frame cohomology theorem](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/strict-regime-d-frame-cohomology.md) as a worked verification.
- A full Curry equivalence theorem (if Passes 1–5 land affirmatively across the board) → a new theorem file in [theorems/](../theorems/), citing this question as the working derivation.
- Negative findings (if any) → they stay here as documented obstructions, with separate question files spawned only if the obstruction has its own structure worth tracking.

The question file itself is meant to be terminal-when-resolved: once Passes 1–5 are done and the corresponding theorem / example exists, this question gets `status: resolved` with a redirect note.
