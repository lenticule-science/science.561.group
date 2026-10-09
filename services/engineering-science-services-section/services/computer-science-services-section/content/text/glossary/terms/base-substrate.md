---
id: base-substrate
description: "A Base is a small category B — a collection of objects (positions) and morphisms (transitions) with composition and identities, carrying no Grothendieck topology — that provides the minimal indexing structure over which a presheaf assigns fibers. The defining structure: Mode-1 substrate, providing positional indexing without topological constraint. A Base imposes no covering conditions; every presheaf on B is permissible. In the relational universe, the history poset (T, ≤) is the Base: it provides histories t ∈ T (positions) and the ordering t ≤ t' (transitions) without specifying which families of histories cover another. A Foundation is a Base enriched with a Grothendieck topology."
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  objects: relational-universe
  morphisms: relational-universe-morphism
output: relational-universe
ast:
  small-category:
    - objects
    - morphisms:
        - objects
        - objects
---

# Base

## Formal definition

A **Base** is a small category $\mathcal{B}$:

$$\mathcal{B} = (\mathrm{Obj}(\mathcal{B}),\; \mathrm{Mor}(\mathcal{B}),\; \circ,\; \mathrm{id})$$

where:
- $\mathrm{Obj}(\mathcal{B})$ is the **object set** — the positions available for fiber assignment; each object $b \in \mathcal{B}$ is a position in the indexing domain; any superstructure defined over $\mathcal{B}$ assigns something to every position
- $\mathrm{Mor}(\mathcal{B})$ is the **morphism set** — the transitions between positions; for each morphism $f : b \to b'$, the superstructure provides a corresponding map between fibers; the morphisms encode the covariance or contravariance structure of the assignment
- $\circ$ is **composition**: for $f : b \to b'$ and $g : b' \to b''$, the composite $g \circ f : b \to b''$; the superstructure must respect this composition
- $\mathrm{id}_b$ is the **identity morphism** at each $b$; the superstructure sends identity to identity

A Base carries **no additional structure**. In particular:
- No Grothendieck topology: no specification of which families of morphisms "cover" a position; no covering conditions; no notion of compatible local data needing global amalgamation
- No monoidal structure (unless explicitly added for a different purpose)
- No enrichment (unless explicitly required by the fiber category)

**Four invariants.** $\mathcal{B}$ is a base iff it satisfies:

1. **Positional completeness**: every object $b \in \mathcal{B}$ is available as a base point for fiber assignment. There are no "masked" positions. Any presheaf or superstructure that nominally lives over $\mathcal{B}$ assigns a fiber at every $b$ — a partial assignment is not a superstructure on $\mathcal{B}$ but on a restriction.

2. **Transitional coherence**: composition in $\mathcal{B}$ is associative and unital. These are the category axioms: $(h \circ g) \circ f = h \circ (g \circ f)$ and $f \circ \mathrm{id}_b = f = \mathrm{id}_{b'} \circ f$ for $f : b \to b'$. The superstructure's restriction maps must respect this composition contravariantly: $F(g \circ f) = F(f) \circ F(g)$.

3. **Topological neutrality**: $\mathcal{B}$ carries no Grothendieck topology. No covering sieves are specified; no covering conditions are imposed; every presheaf on $\mathcal{B}$ is a valid assignment. This is the defining difference between a Base and a [Foundation](../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/undated/foundation.md): a Foundation is a Base equipped with a topology $J$ that selects which presheaves (those satisfying the sheaf condition) are the coherent ones. The Base makes no such selection — it provides the positions and transitions and nothing more.

4. **Preservation**: the base persists unchanged through the operation of any superstructure defined over it. The presheaf assigns fibers to the base's positions and restriction maps to the base's morphisms, but does not alter the base. The base is not consumed, not modified, not specialized. It is the stable indexing domain that remains in place while the superstructure varies.

## The canonical base in the relational universe

The **history poset** $(T, \leq)$ is the canonical base in the relational universe. Viewed as a category:

- **Objects**: histories $t \in T$ — the positions in the indexing domain; each history is a point at which propositions can be evaluated
- **Morphisms**: there is a unique morphism $t \to t'$ iff $t \leq t'$ (the poset ordering); since at most one morphism exists between any pair of objects, this is a **thin category** — a posetal category
- **Composition**: transitivity of $\leq$: if $t \leq t'$ and $t' \leq t''$, then $t \leq t''$
- **Identities**: reflexivity of $\leq$: $t \leq t$ for every $t$

The history poset is a base for the presheaf $H : T^{\mathrm{op}} \to \mathbf{HA}_{\mathrm{nucl}}$ — the assignment of a Heyting algebra with commuting nuclear pair to each history. The presheaf assigns:

$$t \;\longmapsto\; H_t \quad \text{(fiber at history } t\text{)}$$
$$t \leq t' \;\longmapsto\; \rho_{t|t'} : H_{t'} \to H_t \quad \text{(restriction map)}$$

The history poset as a *base* (without topology) imposes only that these assignments are functorial. Any family $\{H_t\}_{t \in T}$ with compatible restriction maps is a presheaf on the base. Whether it is a sheaf — whether compatible local families assemble uniquely — is determined by the topology $J$, which belongs to the [Foundation](../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/undated/foundation.md) $(T, J)$, not to the base $T$ alone.

**The base is minimal**: it is the smallest structure needed to parameterize a field. Removing any part of the base (an object, a morphism) changes which presheaves exist. Adding any structure (a topology, a monoidal product) produces a richer substrate — a Foundation, a monoidal base, etc. The base is the irreducible datum of positional indexing.

## Posetal bases and their presheaves

When $\mathcal{B} = (T, \leq)$ is a poset, the category structure is thin: $|\mathcal{B}(b, b')| \leq 1$ for all $b, b'$. This simplifies presheaves over $\mathcal{B}$:

A **$\mathcal{D}$-valued presheaf** on a posetal base $(T, \leq)$ is precisely:
- A family of objects $(F(t))_{t \in T}$ in $\mathcal{D}$
- A family of morphisms $(\rho_{t|t'} : F(t') \to F(t))_{t \leq t'}$ in $\mathcal{D}$
- satisfying: $\rho_{t|t} = \mathrm{id}_{F(t)}$ and $\rho_{t|t''} = \rho_{t|t'} \circ \rho_{t'|t''}$ for $t \leq t' \leq t''$

The thin structure eliminates all naturality conditions beyond the basic functoriality above: there are no parallel morphisms to require commutativity of extra squares. This is why posetal bases arise so naturally in ordered time (histories), partial-order semantics, and Kripke frames — they provide the cleanest form of positional indexing.

## Base and representable presheaves

For any base $\mathcal{B}$ and any object $b \in \mathcal{B}$, the **representable presheaf** $y(b) = \mathcal{B}(-, b) : \mathcal{B}^{\mathrm{op}} \to \mathbf{Set}$ assigns to each $b'$ the hom-set $\mathcal{B}(b', b)$. The Yoneda lemma asserts:

$$\mathrm{Nat}(y(b), F) \cong F(b)$$

for any presheaf $F$ on $\mathcal{B}$. The base's positions are fully characterized by their representables. For the history poset: $y(t)(t') = \{*\}$ if $t' \leq t$, else $\emptyset$ — the representable at history $t$ is the downward principal ideal ${\downarrow}t$.

The density theorem follows: every presheaf on $\mathcal{B}$ is a colimit of representables. The base's own structure generates all the presheaves over it, through colimits.

## Base vs. adjacent concepts

| Concept | Relation to Base |
|---|---|
| [Foundation](../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/undated/foundation.md) | Base enriched with a Grothendieck topology $J$; a Foundation is a site $(\mathcal{B}, J)$ |
| [Substrate](../../../../../../../natural-science-services-section/services/biological-science-services-section/services/mycology-services-section/content/text/glossary/terms/substrate.md) | General concept; a Base is Mode-1 substrate — preserved, positional, topologically neutral |
| [Field](../../../../../../../social-science-services-section/services/sociology-science-services-section/content/text/glossary/concepts/field.md) | A field IS the superstructure over a base; the base is the substrate of a field |
| [Presheaf](../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/presheaf.md) | A presheaf is the minimal superstructure over a base — the assignment of fibers and restriction maps |
| Category | A base is a small category used as an indexing domain; every small category is a potential base |

## Open questions

- Whether the **smallness** requirement (small category) is essential for the base concept, or whether large bases are admissible in certain settings. In practice, the history category $T$ is small (countable histories), but there is no logical obstacle to a large base if set-theoretic care is taken.
- Whether a **base morphism** (functor $f : \mathcal{B} \to \mathcal{B}'$ between two bases) should be part of the base concept, and how base morphisms interact with the presheaves they induce (the pullback functor $f^* : [\mathcal{B}'^{\mathrm{op}}, \mathcal{D}] \to [\mathcal{B}^{\mathrm{op}}, \mathcal{D}]$).
- Whether the **initial object** (empty category $\mathbf{0}$) and **terminal object** (single-object single-morphism category $\mathbf{1}$) of the category of small categories are degenerate bases, and what superstructures over them look like — presheaves on $\mathbf{1}$ are just objects of $\mathcal{D}$; presheaves on $\mathbf{0}$ are the terminal presheaf (empty product).
- Whether the base concept should be distinguished from the **index category** concept in the theory of (co)limits — whether indexing for limits and indexing for presheaves/fields are formally the same, and whether a base is always an index category.
