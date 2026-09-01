---
id: field
description: "A Field is a triple (B, C, F) — a base category B, a fiber category C, and a contravariant functor F: B^op → C assigning to each base point b a fiber object F(b) and to each morphism f: b → b' a restriction map F(f): F(b') → F(b). The defining structure: a field is a coherent assignment of typed values to every point of a base, where coherence is given by the functoriality of the restriction maps. The canonical instance in the relational universe is the presheaf H: T^op → HA_nucl — the RelationalState."
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  base-category: relational-history
  fiber-category: relational-universe
  assignment: relational-universe-morphism
output: relational-universe
ast:
  contravariant-functor:
    - base-category
    - fiber-category:
        - base-category
    - restriction-maps:
        - assignment
        - base-category

---

# Field

## Formal definition

A **Field** is a triple $\mathcal{F} = (B, \mathcal{C}, F)$:

$$\mathcal{F} = (B : \mathbf{Cat},\; \mathcal{C} : \mathbf{Cat},\; F : B^{\mathrm{op}} \to \mathcal{C})$$

where:
- $B$ is the **base category** — the domain of indexing; the space of positions over which the field is defined; in the relational universe, the canonical base is the history site $(T, J)$
- $\mathcal{C}$ is the **fiber category** — the category whose objects are the field's values; in the relational universe, $\mathcal{C} = \mathbf{HA}_{\mathrm{nucl}}$ (Heyting algebras with commuting nuclear pairs)
- $F : B^{\mathrm{op}} \to \mathcal{C}$ is the **field assignment** — the contravariant functor that assigns to each object $b \in B$ a fiber object $F(b) \in \mathcal{C}$, and to each morphism $f : b \to b'$ in $B$ a restriction map $F(f) : F(b') \to F(b)$ in $\mathcal{C}$

The field's value at base point $b$ is $F(b)$ — the **fiber** over $b$. The field is not a single object; it is the entire indexed family of fibers $(F(b))_{b \in B}$, connected by restriction maps.

**Four invariants.** $\mathcal{F}$ is a field iff it satisfies:

1. **Base coverage**: $F$ is defined on every object of $B$. Every base point has a fiber; no position in the base is without a value. A partial assignment — defined only on some objects of $B$ — is not a field but a partial section.

2. **Restriction coherence** (functoriality): the restriction maps satisfy two conditions:
   - **Identity preservation**: $F(\mathrm{id}_b) = \mathrm{id}_{F(b)}$ — restriction along the identity at $b$ is the identity on the fiber
   - **Composition**: $F(g \circ f) = F(f) \circ F(g)$ for composable $f : b \to b'$, $g : b' \to b''$ — restriction composes contravariantly
   These are the presheaf axioms. Without them, the assignment of values to base points would not form a coherent structure — the restriction maps would not "know" how they relate to each other.

3. **Sheaf condition** (when $B$ carries a Grothendieck topology $J$): for any covering sieve $S \in J(b)$ on a base object $b$, and any compatible family of local sections $\{s_{b_i} \in F(b_i)\}_{b_i \in S}$ (compatible meaning $F(f)(s_{b_j}) = F(g)(s_{b_i})$ for all commuting pairs $f, g$), there exists a unique global section $s \in F(b)$ restricting to each $s_{b_i}$. The sheaf condition is the **global coherence** requirement: compatible local field values assemble uniquely. A field satisfying this condition is a **sheaf**; a field satisfying only invariants 1–2 is a **presheaf**.

4. **Fiber integrity**: each $F(b)$ is an object of $\mathcal{C}$ with whatever structure $\mathcal{C}$ requires — in the relational universe, each fiber $F(b)$ is a Heyting algebra carrying a commuting nuclear pair $(\sigma_b, \Delta_b)$; the restriction maps are Heyting algebra homomorphisms. Fiber integrity means the restriction maps respect the fiber structure — they are morphisms in $\mathcal{C}$, not just set functions.

## The canonical field in the relational universe

The **RelationalState** $H : T^{\mathrm{op}} \to \mathbf{HA}_{\mathrm{nucl}}$ is the canonical field:
- **Base**: the history site $(T, J)$ — the history category equipped with a Grothendieck topology
- **Fiber at $t$**: $H_t$ — a Heyting algebra carrying the commuting nuclear pair $(\sigma_t, \Delta_t)$
- **Restriction maps**: $\rho_{t'|t} : H_{t'} \to H_t$ for $t \leq t'$ — Heyting algebra homomorphisms
- **Sheaf condition**: the accord condition — compatible local sections over a history-site cover glue uniquely

Every concept in the relational universe that involves indexed families of fibers is a field: the RelationalState, the fiber doctrine, the nucleus assignment $t \mapsto (\sigma_t, \Delta_t)$, the fixed-fiber assignment $t \mapsto H^*_t$.

## Pointed field and the Gurwitsch decomposition

A **pointed field** is a field $\mathcal{F} = (B, \mathcal{C}, F)$ together with a designated base point $b^* \in B$. A pointed field is exactly a MacroFocus: the pair $(H, t^*)$.

When $b^*$ is designated, the field acquires a **Gurwitsch decomposition** — a partition of the base $B$ into three zones relative to $b^*$:

$$B = \{b^*\} \;\sqcup\; \mathcal{TF}(b^*) \;\sqcup\; \mathcal{M}(b^*)$$

- **Theme** $F(b^*)$: the fiber at the designated point — the field's designated value
- **Thematic field** $\mathcal{TF}(b^*) = \{b \in B \setminus \{b^*\} : \exists f : b \to b^* \in B\}$: base points from which there is a morphism to $b^*$; these fibers are **restriction-accessible** from $F(b^*)$ via $F(f) : F(b^*) \to F(b)$
- **Margin** $\mathcal{M}(b^*) = \{b \in B : \nexists f : b \to b^* \in B\}$: base points with no morphism to $b^*$; their fibers exist in $\mathcal{F}$ but are not restriction-accessible from the designated point

The Gurwitsch decomposition is not an additional structure — it is derived from the field's contravariancy combined with the designation of $b^*$. The Focus spec formalizes this decomposition in detail; the MacroFocus spec specializes to Level 1 of the three-level focus stack.

## Field morphisms

A **field morphism** from $\mathcal{F}_1 = (B, \mathcal{C}, F_1)$ to $\mathcal{F}_2 = (B, \mathcal{C}, F_2)$ over the same base and fiber category is a **natural transformation** $\eta : F_1 \Rightarrow F_2$ — a family of morphisms $\eta_b : F_1(b) \to F_2(b)$ in $\mathcal{C}$, one for each $b \in B$, such that for every $f : b \to b'$ in $B$, the square $F_2(f) \circ \eta_{b'} = \eta_b \circ F_1(f)$ commutes. A field morphism is a change of fiber that is compatible with restriction.

In the relational universe: a morphism from one RelationalState to another is a natural transformation of presheaves — a family of Heyting algebra homomorphisms $\eta_t : H^1_t \to H^2_t$ commuting with all restriction maps. This is the correct notion of map between fields.

## Cross-domain instances

The field concept unifies the following domain-specific structures:

| Domain | Base $B$ | Fiber $F(b)$ | Restriction maps | Coherence condition |
|---|---|---|---|---|
| **Relational universe** | History site $(T, J)$ | $H_t \in \mathbf{HA}_{\mathrm{nucl}}$ | Heyting algebra homomorphisms | Accord / sheaf condition |
| **Physics** | Spacetime manifold $\Sigma$ | Vector/spinor space at $x$ | Gauge transformation (bundle automorphism) | Smoothness (sections are smooth) |
| **Phenomenology** (Gurwitsch) | Space of possible appearances | Intentional sense + relevance weight | Aspect shifts | Gestalt coherence; horizon-motivational continuity |
| **Sociology** (Bourdieu) | Position space (capital coordinates) | Strategy set + objective relations | Position-structure homology | Field nomos (rules of the game) |
| **Mathematics** (sheaf) | Topological space $X$ | Set/group/module over open $U$ | Restriction of sections | Sheaf gluing axiom |
| **Linguistics** | Vocabulary / conceptual domain | Meaning-region or distributional vector | Semantic entailment / contrastive difference | Distributional coherence |
| **AI** (attention) | Token position sequence $\{1,\ldots,N\}$ | Attention distribution over positions | Softmax normalization constraint | Probability normalization |

The invariant across all instances: a field is the structure you get when you take a base seriously as the domain of variation and ask what typed value lives over each point, consistently.

## The sheaf field as the right notion

A mere presheaf (invariants 1–2) assigns values consistently but does not guarantee that local information assembles globally. The **sheaf condition** (invariant 3) adds: compatible local data has a unique global witness. This is the formal content of **coherence across the field**.

In the relational universe, the sheaf field (satisfying accord) is the operative notion. A RelationalState that fails the sheaf condition would be a collection of independent fibers with no global coherence — the histories would be locally defined but globally incoherent. The accord condition ensures that compatible local propositions (defined at different histories in a covering family) assemble into a single global proposition.

The sheaf field is thus the right notion for the relational universe: not merely a presheaf but a sheaf — a field whose local and global structures are in accord.

## Bulk-boundary dyad: the stable sub-field as the field's gauge-invariant residue

**Source:** Relational Universe Bulk Boundary Dyad, Relational Universe Holograph Bulk Boundary Locale Projection Triple.

A field F: B^op → C has a stable sub-field at every base point: the assignment t → RelationalHistoryFixedFiber(t) is a sub-field of H consisting only of doubly-quiescent fiber elements. The bulk-boundary dyad describes the relationship between the full field (the bulk) and its stable residue (the boundary) as a duality, with a holographic projection connecting them.

**The two poles of the field.** Every RelationalState H: T^op → HA_nucl admits a natural decomposition into bulk and boundary:

| Pole | Object | Fiber content |
|---|---|---|
| Bulk field | H: T^op → HA_nucl (full field) | All propositions at each history — both stable and unstable |
| Boundary field | RelationalUniverseInvariantLocale Phase (the stable sub-field) | Only the doubly-stable propositions RelationalHistoryFixedFiber — the invariant locale |
| Holographic projection | RelationalUniverseStabilizationMap Stab: H → H* | Maps each proposition to the least doubly-stable proposition above it |

**The stabilization map as the field's holographic projection.** The RelationalUniverseStabilizationMap Stab: H → H* (mapping a ∈ H_t to the least element of RelationalHistoryFixedFiber at t above a) is the canonical field morphism from the bulk field to the boundary field. It is not an isomorphism in general — it is the retraction of the inclusion RelationalHistoryFixedFiber ↪ H_t. As a natural transformation, Stab commutes with all restriction maps: for any f: s → t in T, Stab_s ∘ H(f) = H*(f) ∘ Stab_t. This naturality is the content of "compatible local stabilizations assemble into a global stabilization."

**Convergence: bulk = boundary at the fixed point.** At the fixed point R = U_G(R) (where the relational universe satisfies its own closure conditions), every proposition is already doubly-stable: H = H* and Stab = identity. The boundary field ceases to be a proper sub-field and coincides with the bulk field. The holographic projection becomes an isomorphism. In field terms: the field's internal structure has completely settled — every local section is already a global section; the sheaf condition (invariant 3 in the formal definition) is not just satisfied but trivially so, because every local datum is already in the fixed fiber.

**Connection to the Gurwitsch decomposition.** The bulk-boundary split refines the Gurwitsch decomposition. A pointed field (H, t*) has three zones relative to t*: Theme F(t*), Thematic Field (restriction-accessible), and Margin (not accessible). The stabilization map Stab acts on each zone:
- Theme F(t*) is split into: Stab-stable elements (those in RelationalHistoryFixedFiber at t*) and unstable elements (those not yet in the fixed fiber)
- The Thematic Field is split into: elements that stabilize compatibly with the Theme's restriction maps, and elements that are restricted from the Theme but unstable
- The Margin is unaffected by Stab (the Margin elements have no restriction morphism to t*, so their stability is independent)

The boundary field Phase corresponds to the Stab-stable part of the Theme and Thematic Field — the part of the field that "survives" the holographic projection. The Margin contributes nothing to Phase.

**Gauge equivalence and the boundary.** The open question about gauge equivalence is answered by the bulk-boundary dyad: two fiber elements a, b ∈ H_t are gauge-equivalent iff Stab(a) = Stab(b) — they map to the same element in RelationalHistoryFixedFiber. The boundary Phase is the gauge-invariant quotient: it retains exactly the information that is invariant under all gauge transformations (all automorphisms of H_t that preserve H*_t). A "gauge transformation" is any automorphism of H_t that fixes H*_t pointwise — these are the transformations that reorganize the unstable part of the fiber without affecting the stable residue. The holographic projection Stab is the field's canonical gauge-fixing map: it collapses each gauge orbit to its unique stable representative.

**Proposition (Stable sub-field = gauge-invariant boundary).** For the RelationalState H: T^op → HA_nucl, the stable sub-field RelationalHistoryFixedFiber (the invariant locale Phase) is the gauge-invariant residue of H: (1) every element of RelationalHistoryFixedFiber at t is invariant under all automorphisms of H_t that preserve RelationalHistoryFixedFiber; (2) two elements in H_t are gauge-equivalent iff they map to the same element in RelationalHistoryFixedFiber under Stab; (3) at the fixed point R = U_G(R), the bulk and boundary coincide — every element is gauge-invariant, the gauge group is trivial, and the holographic projection Stab is the identity.

*Source.* Bulk-boundary poles and convergence from Relational Universe Bulk Boundary Dyad §The Two Poles and §Convergence. Relation to construction-observation dyad from §Relation to the Construction-Observation Dyad. Holographic recovery theorem from Relational Holograph. Status: the bulk-boundary dyad is established; the gauge-equivalence reading is a new institutional application; the holographic completeness at the fixed point is proved conditional on R = U_G(R). $\square$

## Open questions

- Whether the assignment $t \mapsto (\sigma_t, \Delta_t)$ — the nucleus-pair field — is itself a field in the formal sense: whether it is a functor from the history site to some category of nuclear pairs, and whether the restriction maps for the fiber Heyting algebras are compatible with the restriction of nuclear pairs across histories. The bulk-boundary dyad gives a partial answer: the stable sub-field of the nucleus-pair field would be the assignment t → the trivial nuclear pair (id, id) at histories where H_t = H*_t — but at non-trivial histories the nucleus-pair field is not itself stable under the nuclei it defines, so the stable sub-field of the nucleus-pair field is the boundary field of degenerate (settled) histories.: whether it is a functor from the history site to some category of nuclear pairs, and whether the restriction maps for the fiber Heyting algebras are compatible with the restriction of nuclear pairs across histories.
- Whether **field morphisms** (natural transformations between RelationalStates) correspond to something operationally meaningful in the relational machine — whether the machine's step operation is best characterized as a field morphism $(H, T^*) \to (H', T^{**})$ rather than as a fiber-internal operation.
- Whether the **Bourdieu field** (positional space with capital) has a formal representation in the relational universe — whether a social field can be modeled as a field over a partially-ordered position space, with each fiber encoding the strategy set and capital bundle at that position, and the nomos (rules of the game) as the sheaf condition.
- Whether the **gauge equivalence** in physical fields (two sections related by a gauge transformation are physically equivalent) has an analog in the relational universe — whether certain changes of nuclear pair $(\sigma_t, \Delta_t) \mapsto (\sigma_t', \Delta_t')$ are "gauge transformations" that leave the physical content of the field invariant.
