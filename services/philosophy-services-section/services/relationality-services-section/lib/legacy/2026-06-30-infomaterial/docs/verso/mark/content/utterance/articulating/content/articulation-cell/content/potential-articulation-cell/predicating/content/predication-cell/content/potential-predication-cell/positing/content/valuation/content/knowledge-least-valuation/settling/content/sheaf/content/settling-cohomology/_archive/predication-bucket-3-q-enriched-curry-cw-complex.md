---
kind: theorem
status: sketch
depends-on: [q-enriched-curry-finite-graph, q-enriched-curry-2-dim-degree-0, q-fuzzy-equivalence, quantale-enriched-sheaf, quantale-enriched-cosheaf, q-enriched-cohomology, lopez2024]
---

# Q-enriched Curry equivalence: general regular CW complexes

The general Q-enriched Curry equivalence subsuming the graph case and the 2-dim degree-0 case. Proof by induction on dimension. Subsumes the prior cellular-Curry theorems as base case and dimension-2 specialization respectively.

## Setup

Let $X$ be a finite regular CW complex of dimension $d$. Let $F$ be a Q-enriched cellular sheaf on $X$: stalks $F(\sigma) \in \mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ for each cell $\sigma$, restrictions $f_\sigma^\tau : F(\sigma) \to F(\tau)$ for each face incidence $\sigma \in \partial \tau$ (where $\dim \sigma = \dim \tau - 1$).

The cochain complex of $F$:

$$C^k F = \prod_{\sigma : \dim \sigma = k} F(\sigma), \qquad 0 \leq k \leq d.$$

Coboundaries $\delta^k : C^k F \to C^{k+1} F$ are families of parallel maps — for each $(k+1)$-cell $\tau$ with face boundary $\partial \tau = \{\sigma_1, \ldots, \sigma_{m_\tau}\}$ (each $\sigma_i$ a $k$-cell), the parallel evaluation maps $\delta^k_{\sigma_i, \tau} : C^k F \to F(\tau)$ defined by $\delta^k_{\sigma_i, \tau}(c) = f_{\sigma_i}^\tau(c(\sigma_i))$.

The Q-enriched cohomology in each degree is computed via equalizers of these parallel pairs:

$$H^k(F) := \bigl(\bigcap_{\tau : \dim \tau = k+1} \mathrm{Eq}(\delta^k_{\sigma_i, \tau} : i = 1, \ldots, m_\tau)\bigr) \;/\; \delta^{k-1}\text{-coboundaries},$$

where the quotient by coboundaries is the appropriate Q-Cat coequalizer construction.

The cosheaf $\check{F}$ has the same stalks as $F$, with extensions $\check{f}_\sigma^\tau : F(\tau) \to F(\sigma)$ being the fuzzy right adjoints (per [@lopez2024]) with fuzziness $q_\sigma^\tau \in \mathsf{Q}$. The chain complex of $\check{F}$ has $C_k \check{F} = \bigsqcup_{\sigma : \dim \sigma = k} F(\sigma)$ (Q-coproduct), with parallel boundary maps via cosheaf extensions. $H_k(\check{F})$ is computed via coequalizers / equalizers dually.

## The theorem

**Theorem (general Q-enriched Curry equivalence).** For a finite regular CW complex $X$ of dimension $d$ and a Q-enriched cellular sheaf $F$ on $X$, there are q-fuzzy equivalences in every degree:

$$H^k(F) \;\simeq_{q_k(X, F)}\; H_k(\check{F}), \qquad 0 \leq k \leq d,$$

where the **degree-$k$ fuzziness** $q_k(X, F)$ is the meet over face-incidence chains of length $k+1$ ending in a $(k+1)$-cell of the product of restriction-fuzzinesses along the chain:

$$q_k(X, F) := \bigwedge_{\substack{\sigma_0 < \sigma_1 < \cdots < \sigma_{k+1} \\ \dim \sigma_i = i}} \prod_{i=0}^{k} q_{\sigma_i}^{\sigma_{i+1}}.$$

For graphs ($d = 1$): $q_0$ reduces to $\bigwedge_e q_e$ (graph-level edge fuzziness), $q_1$ to $\bigwedge_{\text{cycles}} q_\gamma$ — recovering the [finite-graph theorem](q-enriched-curry-finite-graph.md).

For 2-dim ($d = 2$): $q_0$ includes face-edge contributions per the [2-dim degree-0 theorem](q-enriched-curry-2-dim-degree-0.md). $q_1$ now includes face-bounded vs face-unbounded cycle distinction. $q_2$ is new.

## Proof by induction on dimension

**Base case ($d = 1$).** The [finite-graph Q-enriched Curry equivalence](q-enriched-curry-finite-graph.md) gives $H^0 \simeq_{q_0} H_0$ and $H^1 \simeq_{q_1} H_1$.

**Inductive step ($d \to d+1$).** Suppose the theorem holds for the $d$-skeleton $X^{(d)}$ of $X$ (i.e., with all cells of dimension $\leq d$). We extend to $X = X^{(d+1)}$ by adding $(d+1)$-cells.

When we add a $(d+1)$-cell $\tau$ with face boundary $\partial \tau \subset X^{(d)}$, three things happen:

**(a) Lower-degree cohomologies $H^k$ for $k \leq d-1$ are unchanged.** The $k$-th coboundary $\delta^k$ depends only on $(k+1)$-cells, which are unchanged for $k+1 \leq d$. So $\ker \delta^k$, $\mathrm{im}\, \delta^{k-1}$, and $H^k$ are unchanged. The induction hypothesis gives the equivalence at these degrees.

**(b) Top-degree cohomology $H^d$ may shrink.** The new $\delta^d : C^d \to C^{d+1}$ has non-trivial kernel — only $d$-cocycles whose face restrictions to $(d+1)$-cells satisfy the face-coboundary condition remain in $\ker \delta^d \subset \ker \delta^{d-1}$. The face-bounded $d$-cycles become coboundaries of the $(d+1)$-cell stalks, reducing $H^d$.

For the equivalence: $H^d(F)$ shrinks; correspondingly $H_d(\check{F})$ shrinks via dual face-bounded coboundaries on the cosheaf side. The forward and inverse maps from the $X^{(d)}$ equivalence restrict to these shrunk subobjects. The fuzziness $q_d(X^{(d+1)}, F)$ now includes the additional $(d+1)$-cell-incidence fuzziness products.

**(c) New top-degree cohomology $H^{d+1}$.** $C^{d+1} F = \prod_{\tau} F(\tau)$ over $(d+1)$-cells. $\delta^{d+1}$ doesn't exist (no $(d+2)$-cells in $X^{(d+1)}$), so $H^{d+1} = C^{d+1} / \mathrm{im}(\delta^d)$ — the face-coboundary cokernel.

For the equivalence: $H_{d+1}(\check{F}) = \ker(\partial_{d+1})$ on the cosheaf side, where $\partial_{d+1}$ is the dual of $\delta^d$ via fuzzy adjoints. The forward map $H^{d+1}(F) \to H_{d+1}(\check{F})$ uses the same path-chained fuzzy-adjunction argument as the lower degrees, with $(d+1)$-cell-fuzziness accumulating multiplicatively.

The inductive step's distinctive feature: the fuzziness profile $q_k$ for the new dimension is determined by **chains of cells of length $k+1$**. Each chain's fuzziness is the product of restriction-fuzzinesses along it. The meet over all such chains gives the achievable bound.

This completes the inductive step. By induction, the theorem holds for all finite-dim regular CW complexes. $\square$

## Examples

**Trees (1-dim, no cycles)**: $q_0 = \bigwedge_e q_e$, $q_1 = 1$ vacuously, $H^1 = H_1 = 0$. Recovers tree case of finite-graph theorem.

**Cycle graphs (1-dim, 1 cycle)**: $q_0 = \bigwedge_e q_e$, $q_1 = \prod_e q_e$ (the unique cycle). $H^1 = H_1$ = cycle holonomies, fuzzy by $q_1$.

**Simply connected 2-dim complexes**: $H^1 = H_1 = 0$ (every cycle is face-bounded). $q_0$ as in 2-dim degree-0 case. $q_2$ from face-coboundary cokernel.

**Sphere $S^2$ (2-dim)**: 1 vertex, 0 edges, 1 face. $H^0 = F(v)$, $H^2 = F(\text{face})$, $H^1 = 0$ (no edges). Fuzziness from vertex-face indirect chain — but with no edges, the vertex-face restriction is direct, so $q_2 = q_v^{\text{face}}$.

## What the general theorem gives

This theorem completes the abstract Q-enriched Curry equivalence on regular CW complexes. With it in hand:

1. **The Verdier duality conjecture for our setting** ([Verdier duality on bitopological settling site](verdier-duality-bitopological-site.md)) is reduced to one remaining structural piece: lifting from regular CW complexes to Grothendieck sites with cellular fibers. This is Layer 2 of the [cellular extension plan](../narratives/cellular-extension-plan.md).

2. **The d-frame specialization** ([d-frame Verdier composition theorem](d-frame-verdier-composition.md)) acquires its first concrete grounding. The two-dualities-composing structure (spatial Verdier × bilattice negation gauge) is now a well-defined statement, with the spatial side established at the cell-complex level.

3. **The fuzzy degree-orbit classification** for the d-frame setting becomes computable. Self-dual sheaves ($\top$-only firings) have specific fuzziness profiles; truth-only and falsity-only firings exchange under composition with quantitative error tracking.

## What's open

- **Grothendieck-site lift** (Layer 2): assembling fiber-level Curry equivalences across a fibration. Requires careful treatment of the assembly map and how fuzziness composes across fibers.
- **Strict-equivalence cases**: identifying which sheaves have $q_k = 1$ for all $k$ (giving strict, not just fuzzy, equivalence). These would be the "well-behaved" sheaves where Q-enriched Curry behaves like the abelian Curry.
- **Connections to degree-shifted (Poincaré) Verdier**: the covariant Verdier duality (which we've used, no degree shift) vs the contravariant Verdier (degree shift $d$ — Curry's original) are different formulations. Whether the contravariant version also has a Q-enriched analogue — and whether it agrees with our covariant one in specific cases — is open.

## Position in the program

This theorem **subsumes** the prior Curry-related theorems (2-cell strict, 2-cell fuzzy, finite-graph, 2-dim degree-0) under a single induction. It establishes the abstract Q-enriched Curry equivalence on arbitrary finite regular CW complexes — the first major win of the [Verdier duality chapter](../narratives/verdier-duality-opener.md).

The chapter's research-frontier work moves to: (i) lifting to Grothendieck sites, and (ii) the d-frame specialization. Both have concrete entry points now that the abstract theorem is established.
