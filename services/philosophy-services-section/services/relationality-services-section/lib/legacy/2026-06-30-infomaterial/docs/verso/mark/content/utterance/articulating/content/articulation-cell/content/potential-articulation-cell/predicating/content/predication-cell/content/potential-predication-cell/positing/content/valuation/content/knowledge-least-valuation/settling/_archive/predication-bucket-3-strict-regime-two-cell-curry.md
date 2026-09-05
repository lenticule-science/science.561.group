---
kind: example
status: verified
depends-on: [d-frame-verdier-composition, q-enriched-curry-grothendieck-site, q-enriched-curry-finite-graph, q-enriched-curry-cw-complex, verdier-duality-bitopological-site, quantale-enriched-cosheaf, strict-regime-d-frame-computation, d-frame-valued-sheaf, relational-database-settling]
instantiates: [q-enriched-curry-grothendieck-site, q-enriched-curry-finite-graph]
lineage: 2
---

# Two-cell strict-regime Curry equivalence: non-trivial fiber, q^glob = 1

A worked example with two-entity, two-stage structure exercising the [Q-enriched Curry equivalence on Grothendieck sites](../theorems/q-enriched-curry-grothendieck-site.md) on a fiber that is a *genuine 1-dim cell complex* — two vertex-cells and an edge — rather than essentially a point. **Lineage 2** instance: the Curry equivalence on the L2 two-entity sub-base ($a, b$ for Alice, Bob), the smallest L2 case where the cellular fiber has substantive structure. The example demonstrates the framework's per-fiber-graph-level machinery on a non-degenerate cellular structure, and supplies an honest accounting of why the global fuzziness $q^{\mathrm{glob}}$ still collapses to $1$ in this case: Boolean d-frame data has strict-adjoint restrictions throughout. The first genuine $q^{\mathrm{glob}} \prec 1$ instance in the corpus's setting requires either the Scott-continuous regime's transfinite-limit structure (where directed-colimit cocones may fail to be strict-adjoint) or non-Boolean value categories (Lawvere quantale-enriched data); both lie outside the strict regime's reach.

## Setup

- $\mathbf{L} = \mathbf{2}$. Entity set $E = \{a, b\}$ (writing $a, b$ for Alice and Bob — the L2 base restricted to two entities). Predicate set $\Pi = \{P\}$ ($P$ for Likes). Predicate category $\mathcal{C}$ trivial.
- Settling bound $\lambda = 3$. Increment sequence: $u_1 = (\text{told } P(a, a) = \mathbf{t})$ and $u_2 = (\text{told } P(b, b) = \mathbf{t})$.
- Settling stages: $v_0$ all $\bot$; $v_1$ has $P(a, a) = \mathbf{t}$, others $\bot$; $v_2$ has $P(a, a) = \mathbf{t}$ and $P(b, b) = \mathbf{t}$, others $\bot$.

Strict regime: $\kappa = 2 < \omega$. Two cells fire in sequence at distinct stages.

## Cells and Priestley structure at $\tau = 2$

Newly-truth-positive cells: $\Delta^{+}_0 = \emptyset$, $\Delta^{+}_1 = \{(a, a)\}$, $\Delta^{+}_2 = \{(a, a), (b, b)\}$. Falsity-positive: empty throughout.

The Priestley dual at $\tau = 2$ has truth-positive points $\{((a, a), +),\, ((b, b), +)\}$ — two distinct Priestley points. The clopens of this 2-point space form a 4-element Boolean algebra:

$$\{\emptyset,\;\; \{((a, a), +)\},\;\; \{((b, b), +)\},\;\; \{((a, a), +), ((b, b), +)\}\}.$$

## Fiber as a 1-dim cell complex

The minimal-non-empty clopens are the two singletons $\{((a, a), +)\}$ and $\{((b, b), +)\}$ — the **0-cells** (vertices). The maximal clopen $\{((a, a), +), ((b, b), +)\}$ is the **1-cell** (edge). The empty clopen plays the role of the empty face. Face incidences: each vertex is a face of the edge.

This is a 1-dim regular CW complex: two vertices joined by one edge — the [finite-graph theorem](../theorems/q-enriched-curry-finite-graph.md)'s setting on the 2-vertex 1-edge graph.

(Note on convention: the bitopological settling site's morphisms are clopen inclusions $U' \subset U$. Identifying *minimal-clopens-as-0-cells* with the standard cellular convention, sheaf restriction $F(U) \to F(U')$ for $U' \subset U$ corresponds to *cosheaf*-style extension along a face inclusion, or equivalently to a sheaf on the opposite face poset. The Curry equivalence is symmetric in this convention swap; we work consistently with one choice below.)

## d-frame stalks

At each clopen, the d-frame stalk records the truth- and falsity-positive cell content intersected with the clopen.

**0-cells.**

- $F(\{((a, a), +)\}) = (L_+, L_-, \mathrm{con}, \mathrm{tot})$ with $L_+ = \mathcal{P}(\{((a, a), +)\})$ rank 1, $L_- = \{\emptyset\}$. Trivial $\mathrm{con}$; $\mathrm{tot} = \{(\{((a, a), +)\}, \emptyset)\}$.
- $F(\{((b, b), +)\}) = $ analogous with $(b, b)$ in place of $(a, a)$.

**1-cell.**

- $F(\{((a, a), +), ((b, b), +)\}) = (L_+^e, L_-^e, \mathrm{con}^e, \mathrm{tot}^e)$ with $L_+^e = \mathcal{P}(\{((a, a), +), ((b, b), +)\})$ rank 2 (4-element Boolean), $L_-^e = \{\emptyset\}$. Trivial $\mathrm{con}^e$; $\mathrm{tot}^e = \{(\{((a, a), +), ((b, b), +)\}, \emptyset)\}$ — only the full $L_+^e$-element is total.

## Restriction maps and their fuzzy adjoints

Restriction from edge to vertex (in the clopen-shrinkage direction, identifying with the cellular convention by the symmetry note above): $f_v^e : F(\{((a, a), +), ((b, b), +)\}) \to F(\{((a, a), +)\})$ acts on the $L_+$-component as the Boolean projection

$$L_+^e \,=\, \mathcal{P}(\{((a, a), +), ((b, b), +)\}) \;\twoheadrightarrow\; \mathcal{P}(\{((a, a), +)\}) \,=\, L_+, \qquad A \;\mapsto\; A \cap \{((a, a), +)\}.$$

This is a **strict left adjoint**: it preserves all joins (clear) and the bottom ($\emptyset \mapsto \emptyset$). Its strict right adjoint is the inclusion $L_+ \hookrightarrow L_+^e$ sending $A' \mapsto A'$ (interpret $A' \subseteq \{((a, a), +)\}$ as a subset of the larger set).

So the fuzziness $q_v^e = 1$ for both endpoints. Consequently $q_e = q_v^e \cdot q_w^e = 1$ at the edge level, and the per-fiber Curry fuzziness $q^{\mathrm{fib}}_0 = q_e = 1$ in degree 0; $q^{\mathrm{fib}}_1$ is vacuous (no cycles in this graph).

## Per-fiber Curry equivalence

Apply the [finite-graph theorem](../theorems/q-enriched-curry-finite-graph.md). The cohomology:

$$H^0(F) = \{(x_v, x_w) \in L_+ \times L_+ : f_v^e(x_v^{\sharp}) = f_w^e(x_w^{\sharp})\}$$

— pairs of vertex sections agreeing on the edge restriction, where $x_v^{\sharp}$ denotes the strict right-adjoint image of $x_v$ in $L_+^e$ (i.e., $x_v$ viewed as a subset of $\{((a, a), +), ((b, b), +)\}$). The condition $f_v^e(x_v^{\sharp}) = f_w^e(x_w^{\sharp})$ unfolds to: both vertex contributions, viewed as subsets of the edge stalk and projected back to their respective vertices, agree on the empty intersection.

For this Boolean structure, $H^0(F) = L_+ \times L_+ = \{\emptyset, \{((a,a),+)\}\} \times \{\emptyset, \{((b,b),+)\}\}$ — 4 sections. (Every pair satisfies the edge equation trivially, since the restrictions land in disjoint Priestley-point sets.)

Cosheaf homology $H_0(\check{F}) = \mathrm{Coeq}(\partial_v^e \rightrightarrows \partial_w^e)$ with $\partial_v^e(z) = \iota_v(\check{f}_v^e(z))$, where $\check{f}_v^e: L_+^e \to L_+$ is the right adjoint (here strict, equal to $A \mapsto A \cap \{((a,a),+)\}$ — same as $f_v^e$ in this Boolean setting). The coequalizer identifies pairs $\iota_v(A \cap \{((a,a),+)\}) \sim \iota_w(A \cap \{((b,b),+)\})$ for $A \in L_+^e$. Working through: $H_0(\check{F})$ has the 4-element structure obtained by gluing the two vertex stalks $L_+(\{((a,a),+)\}) \sqcup L_+(\{((b,b),+)\})$ modulo edge-identifications.

**The Curry equivalence $H^0(F) \simeq_{q_0 = 1} H_0(\check{F})$ holds strictly in this example** — the q-fuzzy theory specializes to a strict isomorphism, with both sides having the 4-element structure parameterizing pairs of vertex-stalks-with-edge-agreement.

In degree 1: $H^1(F) = 0$ (no cycles in the graph), $H_1(\check{F}) = 0$. Strict equivalence again.

## Global Curry equivalence via Layer 2

The fibers at $\tau = 0, 1, 2$ have varying cellular structure. At $\tau = 0$: trivial fiber (no positive cells). At $\tau = 1$: 0-cell only ($\{((a, a), +)\}$ alone). At $\tau = 2$: the 2-vertex 1-edge graph above. The [Grothendieck-site theorem](../theorems/q-enriched-curry-grothendieck-site.md) assembles these via base-change along the settling-advancement morphisms $0 \to 1 \to 2$.

**Base-change fuzziness.** The sheaf restriction along $\tau \to \tau + 1$ is, on each clopen, the inclusion of the $\tau$-stage stalk into the $(\tau + 1)$-stage stalk (which adds the new positive cells). For Boolean d-frame data, this is again a strict-adjoint Boolean inclusion. So $q_\beta^\sigma = 1$ for every base-change incidence.

**Global fuzziness.** $q^{\mathrm{glob}} = q^{\mathrm{fib}} \wedge q^{\mathrm{bc}} = 1 \wedge 1 = 1$. The q-fuzzy global Curry equivalence specializes to a strict equivalence — the d-frame Verdier dual is exact, not just fuzzy.

## What the example exhibits

1. **The fiber structure is genuinely cellular.** With two cells firing at distinct stages, the maximal-section fiber at $\tau = 2$ is a 1-dim cell complex with two vertices and one edge — the simplest non-trivial cellular fiber the bitopological settling site supports in the strict regime. The framework's cellular machinery exercises here in a non-degenerate way.

2. **The per-fiber Curry equivalence computes explicitly.** $H^0(F)$ and $H_0(\check{F})$ are both 4-element Boolean structures, identified by the Curry maps. $H^1 = H_1 = 0$ (no cycles).

3. **All fuzziness collapses to $1$.** Per-fiber and base-change Q-functors are strict-adjoint Boolean projections / inclusions throughout. So $q^{\mathrm{glob}} = 1$ and the equivalence is strict.

## Where genuinely $q^{\mathrm{glob}} \prec 1$ would appear

The strict regime's Boolean d-frame data is structurally too rigid for $q \prec 1$ to emerge. The natural sources of non-trivial fuzziness:

- **Scott-continuous regime, at the limit ordinal $\omega$.** The d-frame stalk at $\tau = \omega$ is a directed colimit of finite-stage stalks. Whether the colimit-cocone has a strict right adjoint depends on whether the colimit is "preserved by" the right-adjoint side — and for some closure-rule structures, this can fail, introducing a non-trivial $q$ at the limit-stage base-change. (The [Scott-continuous-regime d-frame cohomology theorem](../theorems/scott-continuous-regime-d-frame-cohomology.md) handles the strict-cohomology side; whether it carries q-fuzzy Curry information is a refinement question.)

- **Lawvere-quantale-enriched data.** Replacing Boolean d-frame stalks with $[0, \infty]$-enriched (Lawvere-quantale) or MV-algebra-enriched stalks introduces continuous-valued logic, where restrictions are continuous maps that may fail to be strict left adjoints. This is where $q \prec 1$ generically holds — the framework's "real teeth" — but it lies outside the corpus's classical-bilattice setting.

- **Transfinite-bounded and aperiodic regimes.** Pending Layer 3, but heuristically: transfinite-cellular structure with $\omega_1$-cofinal fibers introduces non-trivial direct-limit cocones that can fail strict-adjoint structure.

These directions sit beyond the strict-regime example here. For the strict regime, $q^{\mathrm{glob}} = 1$ uniformly — the q-fuzzy framework's *generality* is exercised, but its *quantale-graded error tracking* doesn't bite.

## Position in the program

This is the chapter's third worked example, completing the strict-regime spread:

1. [strict-regime-verdier-dual](strict-regime-verdier-dual.md) — single-cell truth-only firing, exchange orbit.
2. [strict-regime-top-firing-verdier-self-dual](strict-regime-top-firing-verdier-self-dual.md) — single-cell ⊤-firing, self-dual orbit.
3. (this example) — two-cell two-stage truth-only sequence, non-trivial cellular fiber, $q^{\mathrm{glob}} = 1$.

Together they exercise:
- both orbit types of the composed duality (exchange + self-dual);
- the simplest non-trivial cellular fiber structure (2 vertices + 1 edge);
- the strict-adjoint Boolean structure that pervades the strict regime, making $q^{\mathrm{glob}} = 1$ the universal value here.

The chapter's substantive next examples sit in regimes where $q^{\mathrm{glob}} \prec 1$ genuinely appears — Scott-continuous limits (a refinement question for that regime's existing cohomology theorem) or non-Boolean value categories (a research-frontier extension beyond the classical bilattice setting).
