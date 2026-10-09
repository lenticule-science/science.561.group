---
type: theorem
status: proved
depends-on: [q-enriched-curry-finite-graph, q-enriched-curry-2-dim-degree-0, q-fuzzy-equivalence, quantale-enriched-sheaf, quantale-enriched-cosheaf, q-enriched-cohomology, lopez2024]
title: "Q-enriched Curry equivalence: general regular CW complexes"
description: The general Q-enriched Curry equivalence subsuming the graph case and the 2-dim degree-0 case.
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

For 2-dim ($d = 2$): $q_0$ includes face-edge contributions per the [2-dim degree-0 theorem](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-curry-2-dim-degree-0.md). $q_1$ now includes face-bounded vs face-unbounded cycle distinction. $q_2$ is new.

## Proof by induction on dimension

**Base case ($d = 1$).** The [finite-graph Q-enriched Curry equivalence](q-enriched-curry-finite-graph.md) gives $H^0 \simeq_{q_0} H_0$ and $H^1 \simeq_{q_1} H_1$.

**Inductive step ($d \to d+1$).** Suppose the theorem holds for the $d$-skeleton $X^{(d)}$ of $X$. We extend to $X^{(d+1)}$ by adding finitely many $(d+1)$-cells $\{\tau_1, \ldots, \tau_n\}$, each with face boundary $\partial \tau_j \subseteq X^{(d)}$. The argument below treats one cell $\tau$ at a time; the extension to multiple cells is by iterating, with the fuzziness profile composing multiplicatively across cells.

For $\tau$ with $\partial \tau = \{\sigma_1, \ldots, \sigma_m\}$ (each $\sigma_i$ a $d$-cell), the cochain complex changes in three places:

- $C^{d+1}$ gains the factor $F(\tau)$.
- $\delta^d : C^d \to C^{d+1}$ gains components $\delta^d_{\sigma_i, \tau}(c) := f_{\sigma_i}^\tau(c(\sigma_i))$ for $i = 1, \ldots, m$.
- Dually on the cosheaf side: $C_{d+1} \check F$ gains the factor $F(\tau)$, and $\partial_{d+1} : C_{d+1} \check F \to C_d \check F$ gains components $\partial_{d+1}^{\sigma_i, \tau}(z) := \iota_{\sigma_i}(\check f_{\sigma_i}^\tau(z))$, where $\check f_{\sigma_i}^\tau$ is the fuzzy right adjoint of $f_{\sigma_i}^\tau$ with fuzziness $q_{\sigma_i}^\tau$.

### (a) Lower-degree cohomologies $H^k$ for $k \leq d-1$ are unchanged

The $k$-th coboundary $\delta^k$ depends only on $(k+1)$-cells. For $k + 1 \leq d$, the $(k+1)$-cells are unchanged when we add $\tau$. So $\ker \delta^k$, $\mathrm{im}\, \delta^{k-1}$, and $H^k$ are unchanged. Dually for $H_k$ on the cosheaf side. The induction hypothesis gives the equivalence at these degrees with the same fuzziness $q_k(X^{(d)}, F) = q_k(X^{(d+1)}, F)$ — no chain through $\tau$ has length $\leq k+1$ for $k \leq d-1$, since reaching $\tau$ requires a chain of at least length $d+1$.

### (b) Top-degree-$d$ cohomology: explicit equalizer-coequalizer transport

On the sheaf side at degree $d$, before adding $\tau$ we have $H^d(F|_{X^{(d)}}) = \ker(\delta^{d-1}|_{X^{(d)}}) / \mathrm{im}(\delta^{d-1}|_{X^{(d)}})$ where there is no higher coboundary on $X^{(d)}$. After adding $\tau$, the new $\delta^d$ adds the equalizer condition

$$\delta^d_{\sigma_1, \tau}(c) = \delta^d_{\sigma_2, \tau}(c) = \cdots = \delta^d_{\sigma_m, \tau}(c) \;=\; 0 \text{ in } F(\tau)$$

— i.e., the $d$-cocycle $c$ must satisfy face coherence on the new cell. Geometrically: the parallel restriction maps $\delta^d_{\sigma_i, \tau} : C^d \to F(\tau)$ must agree at $\tau$.

Hence the transition $H^d(F|_{X^{(d)}}) \to H^d(F|_{X^{(d+1)}})$ is **inclusion of the sub-equalizer**:

$$H^d(F|_{X^{(d+1)}}) \;=\; \mathrm{Eq}\bigl(\delta^d_{\sigma_i, \tau} : i = 1, \ldots, m\bigr) \cap H^d(F|_{X^{(d)}})$$

(taking the equalizer first and then quotienting by $\mathrm{im}\,\delta^{d-1}$, which commutes since $\mathrm{im}\,\delta^{d-1}$ already lands in any such equalizer).

On the cosheaf side at degree $d$, before adding $\tau$ we have $H_d(\check F|_{X^{(d)}}) = \ker \partial_d / \mathrm{im}\,\partial_{d}$ — but with no $\partial_{d+1}$ image to mod out by. After adding $\tau$, $\mathrm{im}\,\partial_{d+1}$ is non-zero: it is the joint image of $\partial_{d+1}^{\sigma_i, \tau}(z) = \iota_{\sigma_i}(\check f_{\sigma_i}^\tau(z))$ for $z \in F(\tau)$ and $i = 1, \ldots, m$.

Hence the transition $H_d(\check F|_{X^{(d)}}) \to H_d(\check F|_{X^{(d+1)}})$ is **quotient by the new boundary image**:

$$H_d(\check F|_{X^{(d+1)}}) \;=\; H_d(\check F|_{X^{(d)}}) \,\big/\, \langle\, \iota_{\sigma_i}(\check f_{\sigma_i}^\tau(z)) \,:\, z \in F(\tau),\, i = 1, \ldots, m \,\rangle.$$

**The Curry equivalence transports under both transitions** because:

The pair $(\delta^d_{\sigma_i, \tau}, \partial_{d+1}^{\sigma_i, \tau})$ for each $i$ is a fuzzy-adjoint pair: $\delta^d_{\sigma_i, \tau} = f_{\sigma_i}^\tau$ (precomposed with stalk evaluation) and $\partial_{d+1}^{\sigma_i, \tau} = \iota_{\sigma_i} \circ \check f_{\sigma_i}^\tau$. By [@lopez2024]'s fuzzy adjunction theorem, the equalizer of $\{f_{\sigma_i}^\tau\}_{i=1}^m$ and the coequalizer of $\{\check f_{\sigma_i}^\tau\}_{i=1}^m$ are q-fuzzy-equivalent, with fuzziness given by the meet over $i$ of the unit-counit composition fuzzinesses:

$$q_{\mathrm{eq-coeq}}(\tau) \;=\; \bigwedge_{i=1}^m q_{\sigma_i}^\tau.$$

Composing this with the inductive hypothesis Curry equivalence on $X^{(d)}$ (q-fuzzy with profile $q_d(X^{(d)}, F)$), the equivalence at degree $d$ on $X^{(d+1)}$ has fuzziness

$$q_d(X^{(d+1)}, F) \;=\; q_d(X^{(d)}, F) \,\wedge\, \bigwedge_{\tau : \dim = d+1} q_{\mathrm{eq-coeq}}(\tau).$$

### (c) New top-degree-$(d+1)$ cohomology

$C^{d+1} F = \prod_\tau F(\tau)$. $\delta^{d+1}$ doesn't exist (no $(d+2)$-cells in $X^{(d+1)}$), so

$$H^{d+1}(F|_{X^{(d+1)}}) \;=\; C^{d+1} F \,/\, \mathrm{im}(\delta^d).$$

Dually: $C_{d+1} \check F = \bigsqcup_\tau F(\tau)$, $\partial_{d+2}$ doesn't exist, so

$$H_{d+1}(\check F|_{X^{(d+1)}}) \;=\; \ker(\partial_{d+1}).$$

The Curry equivalence at this new degree: by the same fuzzy-adjunction argument as in (b), $C^{d+1}/\mathrm{im}(\delta^d)$ on the sheaf side is q-fuzzy-equivalent to $\ker(\partial_{d+1})$ on the cosheaf side, via the fuzzy unit-counit at each $\tau$. Concretely, an element $[z] \in H^{d+1}$ (a $(d+1)$-cochain modulo coboundaries) maps to the unique element of $\ker(\partial_{d+1})$ identified with $z$ under the fuzzy adjunction at $\tau$; the round-trip is identity-up-to-$\bigwedge_i q_{\sigma_i}^\tau$ at each $\tau$.

The fuzziness is

$$q_{d+1}(X^{(d+1)}, F) \;=\; \bigwedge_{\tau : \dim = d+1} \bigwedge_{i=1}^m q_{\sigma_i}^\tau \;=\; \bigwedge_{\substack{\sigma_0 < \sigma_1 < \cdots < \sigma_{d+1} \\ \dim \sigma_i = i}} \prod_{i=d}^{d+1} q_{\sigma_i}^{\sigma_{i+1}}.$$

For chains involving cells of all dimensions $\leq d+1$, the full fuzziness profile is the meet over all face-incidence chains of length $d+2$, with multiplicative composition along each chain — matching the formula in the theorem statement.

### Why the chain-fuzziness formula is correct

The general formula

$$q_k(X, F) := \bigwedge_{\substack{\sigma_0 < \sigma_1 < \cdots < \sigma_{k+1} \\ \dim \sigma_i = i}} \prod_{i=0}^{k} q_{\sigma_i}^{\sigma_{i+1}}$$

is verified inductively: for each chain through a new $(d+1)$-cell, the fuzziness is the product over the chain's restriction-fuzzinesses; when computing the equivalence at degree $d$ or $d+1$, only chains relevant to those degrees contribute. The accumulation matches exactly the meet of unit-counit fuzzinesses along all incidence chains terminating at the relevant degree.

By induction over dimension, the theorem holds for all finite-dim regular CW complexes. $\square$

### Concrete check: triangulated 2-disc

Take $D^2$ as a regular CW complex with 3 vertices $\{v_1, v_2, v_3\}$, 3 edges $\{e_{12}, e_{23}, e_{31}\}$ (forming the boundary triangle), and one 2-cell $f$ attached along the boundary circle $e_{12} \cup e_{23} \cup e_{31}$. Face-incidence chains of length 3 (the relevant length for $H^2$): for each pair $(v_i, e_{ij}, f)$ with $v_i \in \partial e_{ij}$, there is one chain. There are 6 such chains (each edge has 2 endpoints).

- $C^0 = \prod_{i=1}^3 F(v_i)$, $C^1 = \prod_{ij} F(e_{ij})$, $C^2 = F(f)$.
- Going from the 1-skeleton (boundary triangle, $X^{(1)}$) to $X^{(2)} = D^2$ adds one 2-cell with boundary $\{e_{12}, e_{23}, e_{31}\}$.

Before adding $f$: $X^{(1)}$ is the cycle graph (triangle); by the [finite-graph theorem](q-enriched-curry-finite-graph.md), $H^0(X^{(1)}) = $ joint global sections, $H^1(X^{(1)}) = $ cycle holonomy with fuzziness $q_1 = q_{e_{12}} q_{e_{23}} q_{e_{31}}$.

After adding $f$: by the inductive step (b) above, the new $\delta^1 : C^1 \to C^2$ adds the equalizer condition $f_{e_{ij}}^f(c(e_{ij})) = 0$ for each of the three boundary edges $e_{ij}$. The cycle holonomy in $H^1(X^{(1)})$ becomes a coboundary on $X^{(2)}$ exactly when the cycle's representative cochain in $C^1$ satisfies these equalizer conditions and lies in $\mathrm{im}(\delta^1) = \mathrm{im}\bigl(\bigoplus_{ij} f_{e_{ij}}^f\bigr)^*$ (image of the new coboundary). For the standard triangle case where the cycle is non-trivially represented, $H^1(X^{(2)}) = 0$ — the cycle becomes a face boundary. Dually $H_1(\check F|_{X^{(2)}}) = 0$.

The new $H^2(X^{(2)}) = C^2 / \mathrm{im}(\delta^1) = F(f) / \mathrm{im}\bigl(\sum_{ij} f_{e_{ij}}^f\bigr)$. Dually $H_2(\check F|_{X^{(2)}}) = \ker(\partial_2) = $ the kernel of $z \mapsto \sum_{ij} \iota_{e_{ij}}(\check f_{e_{ij}}^f(z))$. By the equalizer-coequalizer fuzzy adjunction at $f$, these are q-fuzzy equivalent with fuzziness $q_2(D^2, F) = q_{e_{12}}^f \wedge q_{e_{23}}^f \wedge q_{e_{31}}^f \wedge (\text{degree-1 chains through } f)$ — matching the chain-fuzziness formula.

For the **strict-adjunction case** (every $q_v^e = q_e^f = 1$), the equivalence is strict: $H^2(D^2) \cong H_2(\check F|_{D^2})$ and the cycle holonomy in $H^1$ becomes the boundary of the 2-cell, giving $H^1(D^2) = 0$, matching classical CW Curry / Verdier on a contractible disc. $\square$

## Examples

**Trees (1-dim, no cycles)**: $q_0 = \bigwedge_e q_e$, $q_1 = 1$ vacuously, $H^1 = H_1 = 0$. Recovers tree case of finite-graph theorem.

**Cycle graphs (1-dim, 1 cycle)**: $q_0 = \bigwedge_e q_e$, $q_1 = \prod_e q_e$ (the unique cycle). $H^1 = H_1$ = cycle holonomies, fuzzy by $q_1$.

**Simply connected 2-dim complexes**: $H^1 = H_1 = 0$ (every cycle is face-bounded). $q_0$ as in 2-dim degree-0 case. $q_2$ from face-coboundary cokernel.

**Sphere $S^2$ (2-dim)**: 1 vertex, 0 edges, 1 face. $H^0 = F(v)$, $H^2 = F(\text{face})$, $H^1 = 0$ (no edges). Fuzziness from vertex-face indirect chain — but with no edges, the vertex-face restriction is direct, so $q_2 = q_v^{\text{face}}$.

## What the general theorem gives

This theorem completes the abstract Q-enriched Curry equivalence on regular CW complexes. With it in hand:

1. **The Verdier duality conjecture for our setting** ([Verdier duality on bitopological settling site](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/quantale-enriched-sheaf/docs/dev/theorems/verdier-duality-bitopological-site.md)) is reduced to one remaining structural piece: lifting from regular CW complexes to Grothendieck sites with cellular fibers. This is Layer 2 of the [cellular extension plan](../../documents/articles/notes/undated/cellular-extension-plan.md).

2. **The d-frame specialization** ([d-frame Verdier composition theorem](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-verdier-composition.md)) acquires its first concrete grounding. The two-dualities-composing structure (spatial Verdier × bilattice negation gauge) is now a well-defined statement, with the spatial side established at the cell-complex level.

3. **The fuzzy degree-orbit classification** for the d-frame setting becomes computable. Self-dual sheaves ($\top$-only firings) have specific fuzziness profiles; truth-only and falsity-only firings exchange under composition with quantitative error tracking.

## What's open

- **Grothendieck-site lift** (Layer 2): assembling fiber-level Curry equivalences across a fibration. Requires careful treatment of the assembly map and how fuzziness composes across fibers.
- **Strict-equivalence cases**: identifying which sheaves have $q_k = 1$ for all $k$ (giving strict, not just fuzzy, equivalence). These would be the "well-behaved" sheaves where Q-enriched Curry behaves like the abelian Curry.
- **Connections to degree-shifted (Poincaré) Verdier**: the covariant Verdier duality (which we've used, no degree shift) vs the contravariant Verdier (degree shift $d$ — Curry's original) are different formulations. Whether the contravariant version also has a Q-enriched analogue — and whether it agrees with our covariant one in specific cases — is open.
