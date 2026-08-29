---
title: "Foundation"
id: foundation
description: "A Foundation is a site (B, J) — a base category B equipped with a Grothendieck topology J that specifies covering sieves. The enriched base that imposes a coherence condition on superstructures — only presheaves satisfying the sheaf condition are permissible."
defines: Foundation
related: Base, Substrate, Presheaf, Field, RelationalHistory, RelationalUniverse, GrothendieckTopology
requires: [base-category, covering-sieves]
enables: [presheaf, sheaf-condition]
determines: relational-state
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  base-category: relational-history
  covering-sieves: relational-universe-morphism
output: relational-universe
ast:
  grothendieck-site:
    - base-category
    - covering-sieves:
        - base-category
        - base-category
---

# Foundation

## Formal definition

A **Foundation** is a pair $(\mathcal{B}, J)$:

$$(\mathcal{B}, J) = (\mathcal{B} : \mathbf{Cat}_{\mathrm{small}},\; J : \mathrm{Obj}(\mathcal{B}) \to \mathcal{P}(\mathbf{Sieves}(\mathcal{B})))$$

where:
- $\mathcal{B}$ is the **base category** — a small category providing the positions and transitions of the indexing domain (see [Base](../../../../../../../../../engineering-services-section/content/text/glossary/terms/base-substrate.md))
- $J$ is the **Grothendieck topology** — a function assigning to each object $b \in \mathcal{B}$ a set $J(b)$ of **covering sieves** on $b$; a sieve on $b$ is a downward-closed collection of morphisms with codomain $b$ (closed under precomposition: if $f : b' \to b$ is in the sieve, then $f \circ g$ is in the sieve for all composable $g$)

The Grothendieck topology $J$ must satisfy three axioms:

**Maximality**: for every $b \in \mathcal{B}$, the **maximal sieve** $t^{\dagger}(b) = \{f : b' \to b \mid b' \in \mathcal{B}\}$ (all morphisms into $b$) is a covering sieve: $t^{\dagger}(b) \in J(b)$. The maximal sieve always covers.

**Stability**: if $S \in J(b)$ is a covering sieve and $f : b' \to b$ is any morphism, the **pullback sieve** $f^*(S) = \{g : b'' \to b' \mid f \circ g \in S\}$ is a covering sieve on $b'$: $f^*(S) \in J(b')$. Covering is stable under pullback.

**Transitivity**: if $S \in J(b)$ is a covering sieve and $R$ is a sieve on $b$ such that $f^*(R) \in J(b')$ for every $f : b' \to b$ in $S$, then $R \in J(b)$. A sieve that is locally covering (covering at every node in a covering sieve) is globally covering.

**Four invariants.** $(\mathcal{B}, J)$ is a foundation iff it satisfies:

1. **Topological enrichment**: $J$ is a Grothendieck topology satisfying the three axioms above. This is what distinguishes a Foundation from a bare [Base](../../../../../../../../../engineering-services-section/content/text/glossary/terms/base-substrate.md): the base has no notion of covering; the foundation introduces exactly the notion of covering required to state the sheaf condition.

2. **Sheaf enabling**: the topology $J$ determines which presheaves on $\mathcal{B}$ are **$J$-sheaves** — precisely those satisfying the **sheaf condition**: for every object $b$ and every covering sieve $S \in J(b)$, every compatible family of sections $(s_{b'} \in F(b'))_{(b' \to b) \in S}$ (compatible meaning: for all $g : b'' \to b'$, $F(g)(s_{b'}) = s_{b''}$) has a unique amalgamation — a unique element $s \in F(b)$ with $F(f)(s) = s_{b'}$ for all $(f : b' \to b) \in S$. The topology $J$ is the enabling condition: only presheaves satisfying this condition can coherently live on the Foundation.

3. **Preservation**: the foundation persists unchanged through the sheaf condition it enables. The topology $J$ is not consumed by the sheaves it admits; it remains the stable enabling condition. Adding a new sheaf to $\mathbf{Sh}(\mathcal{B}, J)$ does not alter $J$.

4. **Grounding**: the foundation grounds the sheaf category $\mathbf{Sh}(\mathcal{B}, J)$ — the sheaf category obtains *in virtue of* the foundation. Two foundations with the same base but different topologies $J \neq J'$ generate different sheaf categories; the sheaf category's properties are determined by the topology.

## The canonical foundation in the relational universe

The **history site** $(T, J)$ is the canonical foundation in the relational universe:

- **Base**: the history poset $(T, \leq)$ — providing histories $t \in T$ (positions) and the ordering $t \leq t'$ (transitions)
- **Topology**: $J$ is the **commutation topology** on $T$ — a sieve $S \in J(t)$ iff the morphisms in $S$ represent a covering family of independent concurrent sub-histories that jointly determine $t$

The sheaf condition under $J$ is the **accord condition**: a presheaf $H : T^{\mathrm{op}} \to \mathbf{HA}_{\mathrm{nucl}}$ is a sheaf iff compatible sections at histories in a covering sieve assemble uniquely into a section at the covered history. Formally: for any covering family $\{t_i \leq t\}_{i \in I} \in J(t)$, any family of elements $(a_i \in H_{t_i})_{i \in I}$ compatible under restriction ($\rho_{t_i \wedge t_j | t_i}(a_i) = \rho_{t_i \wedge t_j | t_j}(a_j)$ for all $i, j$) has a unique $a \in H_t$ with $\rho_{t_i|t}(a) = a_i$ for all $i$.

The accord condition is the enabling condition $\mathcal{E}((T, J), H)$ — the formal content of "H is realizable on the history site." The history site is the foundation of $H$: $H$ obtains in virtue of $(T, J)$.

**The relational universe** $R = \mathbf{Sh}(T, J)$ is the sheaf category on the history site — the category of all $\mathbf{HA}_{\mathrm{nucl}}$-valued sheaves on $(T, J)$. The foundation determines the whole universe: change $J$ (a finer topology admitting more covers, or a coarser one) and you get a different relational universe with different sheaves.

## Grothendieck topologies: three canonical constructions

For any small category $\mathcal{B}$, three canonical Grothendieck topologies arise:

**The trivial topology** $J_{\mathrm{triv}}$: only the maximal sieve covers each object. The sheaf condition becomes trivial — every presheaf is a sheaf. The foundation $(\mathcal{B}, J_{\mathrm{triv}})$ imposes no coherence condition: it is maximally permissive. $\mathbf{Sh}(\mathcal{B}, J_{\mathrm{triv}}) = \mathbf{PSh}(\mathcal{B})$ — the presheaf topos.

**The canonical (largest) topology** $J_{\mathrm{can}}$: a sieve $S$ covers $b$ iff every presheaf that is a sheaf for $S$ is a sheaf for the maximal sieve restricted to $S$. This is the finest topology for which the sheaf condition is meaningful. $\mathbf{Sh}(\mathcal{B}, J_{\mathrm{can}})$ is the category of **canonical sheaves** — maximally restricted.

**Topologies from a coverage**: many practical topologies are specified by a **basis** — a coverage $K$ that assigns to each $b$ a set of covering families (not sieves), from which the topology is generated by saturation. The commutation topology on $T$ is specified by a coverage: a family $\{t_i \leq t\}$ covers $t$ iff the histories $\{t_i\}$ are pairwise concurrent and their join is $t$.

## Sheaf categories as toposes

For any foundation $(\mathcal{B}, J)$, the sheaf category $\mathbf{Sh}(\mathcal{B}, J)$ is a **Grothendieck topos** — a category with:
- All finite limits
- A subobject classifier $\Omega$
- Power objects (internal exponentiation)
- Enough points (under mild set-theoretic assumptions)

The Grothendieck topos structure is entirely determined by the foundation. In the relational universe: $R = \mathbf{Sh}(T, J)$ is a Grothendieck topos; the topos structure (internal logic, subobject classifier, internal Heyting algebra $\Omega_R$) all derive from the history site $(T, J)$.

The **subobject classifier** $\Omega$ of $\mathbf{Sh}(\mathcal{B}, J)$ assigns to each $b$ the set of $J$-closed sieves on $b$ — sieves that are stable under $J$. This is the internal truth-value object: a proposition in the sheaf topos is a closed sieve.

## Foundation and locale structure

A foundation $(\mathcal{B}, J)$ generates a **locale** — a frame (complete lattice with distributive law) of $J$-closed sieves on $\mathcal{B}$. When $\mathcal{B} = (T, \leq)$ is a poset, this frame is the **frame of opens** of the locale associated to $(T, J)$.

In the relational universe: the fiber $H_t$ at each history is a Heyting algebra — a locale element. The topology $J$ determines which nuclei (frame endomorphisms satisfying the nucleus axioms) are definable on the locale of closes sieves. The nuclear pair $(\sigma_t, \Delta_t)$ arises precisely from the foundation's topological structure.

## Foundation vs. adjacent concepts

| Concept | Relation to Foundation |
|---|---|
| [Base](../../../../../../../../../engineering-services-section/content/text/glossary/terms/base-substrate.md) | Foundation without topology; Base + topology $J$ = Foundation |
| [Substrate](../../../../../../../biological-science-services-section/services/mycology-services-section/content/text/glossary/terms/substrate.md) | Foundation is Mode-2 substrate: enriched base with covering conditions, preserved |
| [Field](field.md) | A sheaf is a field satisfying the sheaf condition; the Foundation determines which fields are permissible |
| Topos | $\mathbf{Sh}(\mathcal{B}, J)$ is the Grothendieck topos generated by a Foundation |
| Locale | A Foundation determines a locale of closed sieves; the locale is the spatial manifestation of the topology |

## Concurrent act structure: the foundation enables parallel composition

**Source:** [Concurrent Act](../math/relational-universe-concurrent-act.md), [History Convolution](../math/relational-universe-history-convolution-symmetric-monoidal-day-convolution-sheafification.md).

The foundation (T, J) is exactly the structure that enables the concurrent act on R = Sh(T, J). The concurrent act is a symmetric monoidal product RelationalUniverseConcurrentAct on R that extends the history concatenation monoid of the foundation's base category T: on representable sheaves, the product collapses to the history concatenation.

**The commutation topology is the concurrent act topology.** The open question — whether the commutation topology J has a clean characterization in terms of the concurrency relation — is answered by the concurrent act construction. The commutation topology J is exactly the topology that makes the sheafification of the presheaf Day convolution into a well-defined symmetric monoidal product on R. The Day convolution (the presheaf-level free concurrent act) extends history concatenation to all presheaves; sheafification with respect to J imposes the locality condition — the concurrent act on sheaves must respect the covering structure of the foundation. A covering sieve in J(t) is precisely a family of concurrent sub-histories h₁,...,hₙ that together cover t: a family that constitutes a valid concurrent decomposition of the act at t. The commutation topology J is the topology that identifies which concurrent decompositions are valid.

This answers the first open question: J is the topology generated by the coverage {h₁,...,hₙ over t : hᵢ commutes with hⱼ for all i ≠ j, and their join is t}. This is the topology generated by the concurrency relation on T — the coverage of concurrent decompositions.

**Concurrent acts at the fiber level.** The concurrent act restricts fiberwise: two propositions a in H_t and b in H_{t'} at different histories t, t' have a joint proposition (the concurrent act product) in H at the concatenated history t⋆t'. When t = t' (same history, same observation context), the concurrent act collapses to the fiber meet a ∧ b. The concurrent act is thus the global version of local fiber conjunction — extended to propositions at different temporal positions in the foundation's history category.

**The foundation as the invariant substrate of parallel composition.** The foundation (T, J) is stable: it persists unchanged through the sheaves it admits. The concurrent act structure on R is a derived structure — it depends on (T, J) but does not alter it. Adding new sheaves (new objects to R) does not change the underlying foundation's topology J or the base history category T. This is the formal content of the foundation's "preservation" invariant: the commutation topology is the fixed background enabling condition for all concurrent acts in R, not a mutable feature of the universe.

**Proposition (Foundation = substrate for concurrent composition).** The foundation (T, J) enables and uniquely determines the concurrent act structure on R = Sh(T, J): (1) the history category T provides the monoid structure (concatenation ⋆) that the concurrent act extends; (2) the commutation topology J is the exact topology that makes the sheafification of Day convolution a valid concurrent act (a symmetric monoidal product on R respecting the sheaf condition); and (3) two foundations (T, J) and (T, J') with the same base but different topologies generate different concurrent act structures — the topology is the parameter that determines which parallel compositions are coherent.

*Source.* Concurrent act definition and Day convolution from [Concurrent Act §Definition](../math/relational-universe-concurrent-act.md#concurrent-act) and [§Remark — Day Convolution](../math/relational-universe-concurrent-act.md#remark-concurrent-free). Extends-T property from [§Interpretation](../math/relational-universe-concurrent-act.md#concurrent-act-interpretation). Status: the concurrent act on Sh(T,J) exists by the sheafified Day convolution construction; the identification of J as the concurrent-act topology is the main content of [History Convolution](../math/relational-universe-history-convolution-symmetric-monoidal-day-convolution-sheafification.md). $\square$

## Open questions

- Whether the **commutation topology** on the history poset $T$ has a clean characterization in terms of the history structure (the concurrency relation $\|$) — whether $J$ is exactly the topology generated by the coverage $\{t_i \leq t : t_i \| t_j \text{ for all } i \neq j, \bigvee t_i = t\}$, and whether this coverage satisfies the Grothendieck axioms for arbitrary history categories (not just the canonical one).
- Whether there is a formal sense in which different foundational choices (different topologies $J$ on the same base $T$) give rise to genuinely different relational universes with different expressive power — whether the topology choice is a parameter of the universe design, and what the space of possible foundations on $T$ looks like.
- Whether the **locale** associated to a foundation $(T, J)$ is the right notion of "semantic space" for the relational universe — whether propositions (elements of $H_t$) are best understood as points of a locale, and whether the sheaf structure is the correct notion of "continuous assignment" of truth values over this locale.
- Whether **dense foundations** (dense topologies, where every sieve in $J(b)$ has elements and the coverage is as fine as possible without collapsing) have a role in the relational universe — whether there is a sense in which the relational universe is built on the densest foundation compatible with its structure.
