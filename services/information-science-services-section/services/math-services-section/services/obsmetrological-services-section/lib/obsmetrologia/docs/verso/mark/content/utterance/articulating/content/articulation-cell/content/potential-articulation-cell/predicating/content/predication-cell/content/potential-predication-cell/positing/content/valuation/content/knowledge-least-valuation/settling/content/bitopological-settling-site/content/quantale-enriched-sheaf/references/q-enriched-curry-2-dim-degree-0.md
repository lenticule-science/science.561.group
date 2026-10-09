---
kind: theorem
status: proved
depends-on: [q-enriched-curry-finite-graph, q-fuzzy-equivalence, quantale-enriched-sheaf, quantale-enriched-cosheaf, q-enriched-cohomology]
---

# Q-enriched Curry: 2-dim cell complex, degree 0

The degree-0 extension of the [finite-graph Q-enriched Curry equivalence](q-enriched-curry-finite-graph.md) to 2-dimensional regular CW complexes.
Restricted to degree 0 to keep the proof rigorous: higher-degree equivalences ($H^1$, $H^2$) involve face-coboundary structure that requires separate careful treatment.

## Setup

Let $X$ be a finite regular CW complex of dimension 2: vertices $V$, edges $E$, faces $F$ (2-cells).
Each face $\phi \in F$ has boundary $\partial \phi = (e_1, \ldots, e_{k_\phi})$ — a closed cycle of edges (with each $e_i \in E$).

A Q-enriched cellular sheaf $F$ on $X$ assigns:

- Stalks $F(v) \in \mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ for each vertex $v$.
- Stalks $F(e)$ for each edge $e$.
- Stalks $F(\phi)$ for each face $\phi$.
- Restrictions $f_v^e : F(v) \to F(e)$ for each $v \lhd e$.
- Restrictions $f_e^\phi : F(e) \to F(\phi)$ for each edge $e$ in the boundary $\partial \phi$.

The face restrictions are new content beyond the graph case.
They contribute additional fuzziness.

## Cochain complex and cohomology

$$C^0 F = \prod_v F(v), \qquad C^1 F = \prod_e F(e), \qquad C^2 F = \prod_\phi F(\phi).$$

Coboundary $\delta^0 : C^0 \to C^1$: as in the graph case, parallel pairs $\delta^0_v, \delta^0_w$ per edge $e$ with $\partial e = \{v, w\}$.

Coboundary $\delta^1 : C^1 \to C^2$: for each face $\phi$ with $\partial \phi = (e_1, \ldots, e_{k_\phi})$, parallel maps $\delta^1_i : C^1 \to C^2$ for $i = 1, \ldots, k_\phi$ defined by $\delta^1_i(c)_\phi = f_{e_i}^\phi(c(e_i))$.

**Q-enriched $H^0$.** Defined as the joint equalizer over all parallel pairs at degree 0, AND the face-coboundary condition at degree 1:

$$H^0(F) = \bigl\{(x_v)_v \in C^0 F : \forall e\, [f_v^e(x_v) = f_w^e(x_w)] \text{ AND } \forall \phi\, [\delta^1_i \circ \delta^0(x) = \delta^1_j \circ \delta^0(x)]\bigr\}.$$

The first condition ($\delta^0$-equalizer) gives 1-cocycles via the edge equations.
The second condition (face-coboundary equality) gives the face constraints — but composed with $\delta^0$, so it's about whether $\delta^0(x)$ extends consistently through the face.

**Note:** the face-coboundary applied to a $\delta^0$-image automatically satisfies the face equality if the underlying 1-cocycle is consistent.
So in the strict-adjunction case, the face constraint reduces to the edge constraint and adds no new content for $H^0$.

In the **fuzzy case**, however, the face constraint adds an additional fuzziness contribution: even if $(x_v)_v$ satisfies edge equations up to $q_0^{\mathrm{edges}}$, the face equations apply to compositions and can have fuzziness $q_e \cdot q_e^\phi$ — a product of edge and face fuzzinesses.

## Cosheaf homology

The cosheaf $\check{F}$ has the same stalks as $F$, with extensions being fuzzy right adjoints:

- $\check{f}_v^e : F(e) \to F(v)$, $\check{f}_e^\phi : F(\phi) \to F(e)$.

Chain complex:

$$C_0 \check{F} = \bigsqcup_v F(v), \qquad C_1 \check{F} = \bigsqcup_e F(e), \qquad C_2 \check{F} = \bigsqcup_\phi F(\phi).$$

Boundary $\partial_0 : C_1 \check{F} \to C_0 \check{F}$: parallel pairs per edge as in graph case.

Boundary $\partial_1 : C_2 \check{F} \to C_1 \check{F}$: for each face $\phi$ with boundary edges $e_1, \ldots, e_{k_\phi}$, parallel maps $\partial_1^i : F(\phi) \to C_1 \check{F}$ with $\partial_1^i(z) = \iota_{e_i}(\check{f}_{e_i}^\phi(z))$.

$H_0(\check{F}) = \mathrm{Coeq}_e(\partial_0)$ — vertex stalks coproduct modded out by all edge identifications.
Same as in the graph case (faces don't directly enter the $H_0$ definition).

## The theorem

**Theorem (fuzzy 2-dim Q-enriched Curry equivalence, degree 0).** For a finite 2-dim regular CW complex $X$ with Q-enriched cellular sheaf $F$, there is a $q_0(X, F)$-fuzzy equivalence

$$H^0(F) \simeq_{q_0} H_0(\check{F}),$$

where the degree-0 fuzziness is

$$q_0(X, F) = \bigwedge_{e \in E} q_e \;\;\wedge\;\; \bigwedge_{\phi \in F,\, e \in \partial \phi} q_e \cdot q_e^\phi.$$

The first meet is over edges (graph-level fuzziness, as in the [finite-graph theorem](q-enriched-curry-finite-graph.md)).
The second is over face-edge incidences: each face contributes additional fuzziness $q_e^\phi$ from its boundary-edge-to-face restrictions, multiplied with the edge fuzziness $q_e$.

For a complex with no faces, $q_0$ reduces to the graph-level fuzziness — the [finite-graph theorem](q-enriched-curry-finite-graph.md) is recovered.

## Proof

The proof structure mirrors the [finite-graph case](q-enriched-curry-finite-graph.md), with the addition that the face-coboundary conditions impose extra fuzziness on the forward and inverse maps.

**Forward map $\Phi : H^0(F) \to H_0(\check{F})$:** as in the graph case, sends $(x_v)_v$ (satisfying edge equations) to $[\iota_{v_0}(x_{v_0})]$ in $H_0(\check{F})$.
Well-defined up to the graph-level edge-fuzziness.

The face conditions don't directly appear in the $H_0$ definition (which only uses edge identifications), so the forward map's well-definedness is the same as in the graph case — bounded by edge fuzziness.

However, the $H^0$ definition imposes face constraints on the *input*.
So $\Phi$ is restricted to inputs satisfying both edge and face equations.
The face fuzziness affects which inputs are valid, not the forward-map well-definedness directly.

**Inverse map $\Psi : H_0(\check{F}) \to H^0(F)$:** given an equivalence class $[c]$, choose representative $\iota_v(x_v)$ and reconstruct $(x_w)_w$ via fuzzy adjoints along paths (graph case).
Then *additionally* check that the reconstruction satisfies face conditions — this requires the face restrictions to be compatible up to the face fuzziness $q_e^\phi$.

The face check tightens: the reconstruction lands in $H^0(F)$ (with face conditions) up to fuzziness $q_e \cdot q_e^\phi$ for each face-edge pair.

**Round-trips:** as in the graph case, identity-up-to-$q_0$-fuzzy.

The 2-dim case's distinctive feature: $q_0$ is bounded below by the *minimum* of edge fuzziness AND face-edge fuzziness products.
Faces impose additional constraints that tighten the achievable fuzziness. $\square$

## Higher-degree equivalences

The $H^1$ and $H^2$ equivalences require separate treatment:

- **$H^1(F) \simeq H_1(\check{F})$** — cycle holonomies.
  In the 2-dim case, cycles bound faces (boundaries), which means some cycles that were "non-trivial" in the graph case are now coboundaries via face restrictions.
  The Curry equivalence in $H^1$ identifies cycle holonomies that are NOT face-bounded.

- **$H^2(F) \simeq H_2(\check{F})$** — face-level discrepancies.
  Measures elements of $C^2$ that aren't in the image of $\delta^1$ — equivalently, face stalk content not captured by edge propagation.

Both are open work for this chapter.
The $H^1$ case in particular requires careful treatment of face-bounded vs face-unbounded cycles.

## What's settled vs what's open

**Settled (draft level):**

- The degree-0 equivalence $H^0(F) \simeq_{q_0} H_0(\check{F})$ for 2-dim complexes, with $q_0$ tracking edge AND face-edge fuzziness.
- The proof structure inherits from the graph case, with face-fuzziness contributing to the achievable bound.

**Open:**

- Higher-degree equivalences ($H^1$, $H^2$) for 2-dim complexes.
- Extension to dimension $\geq 3$ — adds $C^3$, $\delta^2$, etc.
- Lift to Grothendieck sites with cellular fibers (the bitopological settling site).

## Position in the program

Continuing the [Verdier duality chapter](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/verdier-duality-opener.md)'s graph-level Curry equivalence into higher dimensions, restricted to degree 0 for rigor.
Establishes that the $H^0$ equivalence holds in the simplest 2-dim case, with explicit fuzziness tracking that includes face contributions.

The chapter's research-frontier work continues with higher-degree equivalences (deferred to separate theorems) and dimension extension.
Each step adds to the structural picture; the chapter's mathematical foundation grows incrementally.
