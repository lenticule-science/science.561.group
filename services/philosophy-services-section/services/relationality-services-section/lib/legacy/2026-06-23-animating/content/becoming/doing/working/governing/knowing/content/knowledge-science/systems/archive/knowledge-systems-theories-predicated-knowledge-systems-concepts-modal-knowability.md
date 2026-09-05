---
type: concept
class: substrate-reading
status: sketch
depends-on: [knowing-as-settling, discourse-community-as-fiber, epistemic-closure, predicated-knowledge-system, knowledge-fiber-algebra, scope]
see-also: [federation-as-bilattice-colimit, aboutness, reified-retraction]
---

# Modal knowability

The structural reading of *knowability* on the predicated substrate: where [knowing-as-settling](knowing-as-settling.md) names what a single [discourse community](discourse-community-as-fiber.md) has settled within its own scope, *knowability* names what the community could come to settle as it varies across the family of scopes it is federable with. The substrate apparatus that names this variation is the bilattice modal pair $(\Box_R, \Diamond_R)$: the [modal necessity operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) and the [modal possibility operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-possibility-operator.md), with worlds taken to be the scopes admitted by the system's federation discipline.

## The construction

Let $\mathcal{K} = (\mathbf{L}, \mathcal{C}, E, \mathcal{S}, \Sigma)$ be a [predicated knowledge system](../objects/predicated-knowledge-system.md) and fix a scope $S \in \Sigma$. The system's family of *$S$-federable scopes* is

$$W_S \;:=\; \{ S' \in \Sigma : S \cup_\iota S' \in \Sigma \text{ for some identity-mapping } \iota \},$$

i.e., the scopes with which $S$ admits a [federation colimit](../theorems/federation-as-bilattice-colimit.md). $W_S$ is the [world set](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/world-set.md) of the modal apparatus.

The *federation accessibility relation* $R_F: W_S \times W_S \to \mathbf{L}^\bowtie$ is the [bilattice accessibility relation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md) recording, for each pair $(S', S'')$, the bilattice value of "$S'$ admits $S''$ as a federation peer under the system's identity-mappings." A consistent identity-mapping yields $R_F(S', S'') \geq_k \mathbf{t}$; an inconsistent one yields $\top$; absence of a mapping yields $\bot$ or $\mathbf{f}$ depending on whether the absence is *not yet observed* or *positively refused*.

For each predicate $p$ and each cell $(s, p, o)$, the system's family of [knowledge fiber algebra](../objects/knowledge-fiber-algebra.md) values $u = (u_{S'})_{S' \in W_S}$ with $u_{S'}(s, o) \in K_p^{S'}$ then admits the modal pair:

$$(\Box_{R_F} u)_S(s, o) \;=\; \bigwedge_t \{\, R_F(S, S') \to u_{S'}(s, o) : S' \in W_S \,\},$$

$$(\Diamond_{R_F} u)_S(s, o) \;=\; \bigvee_t \{\, R_F(S, S') \odot u_{S'}(s, o) : S' \in W_S \,\}.$$

These are exactly the modal operators of the math substrate, with worlds reinterpreted as scopes and accessibility reinterpreted as federation-admissibility.

## The three knowabilities

The modal pair stratifies a community's relation to a cell $(s, p, o)$ into three substrate-distinguishable values:

- **Asserted in scope:** $u_S(s, o)$ — what the community's settling has actually committed under its own closure-rule system on its own scope. The classical reading of *knowing*; what [knowing-as-settling](knowing-as-settling.md) names directly.
- **Modally necessary in scope:** $(\Box_{R_F} u)_S(s, o)$ — the bilattice meet of what *every* federable scope settles on the cell, weighted by federation-admissibility. Read: "what is forced on the community by everything it can federate with." A cell that is modally necessary at $\mathbf{t}$ is one no federation could revise without contestation.
- **Modally possible in scope:** $(\Diamond_{R_F} u)_S(s, o)$ — the bilattice join of what *some* federable scope settles on the cell. Read: "what the community could come to assert by federation, given some peer's evidence." A cell that is modally possible at $\mathbf{t}$ is one some federation could settle in the community's favor without contestation.

The three readings are non-equivalent: a cell may be asserted at $\bot$ (the community has not observed it) but modally possible at $\mathbf{t}$ (some federable peer has settled it as true), and a cell may be modally necessary at $\top$ (every peer asserts it, but they do so contradictorily, and no federation can resolve the contradiction). The substrate's bilattice value-domain is exactly what makes these distinctions visible — a Boolean value-domain would collapse "necessary at $\top$" to "necessary at $\mathbf{t}$" with the contestation lost.

## Why the disciplines treated this informally

The classical knowledge-organization literature (Hjorland, Bowker & Star, Knorr-Cetina) registers the distinction between what a community *holds* and what it *could hold* as a sociological observation about epistemic culture rather than as a structural fact about the substrate. The classical knowledge-representation literature (RDF/OWL, description logics, Datalog) registers it as a model-theoretic fact about a single TBox/ABox pair, with cross-community variation handled outside the formalism (alignment ontologies, mediated query). Neither tradition has had a single structural object that registers all three values at once on the same cell.

The substrate has it: $(u_S, \Box_{R_F} u_S, \Diamond_{R_F} u_S)$ is a triple of bilattice values at every cell, computable from the system's settled state and its federation-admissibility relation, and the three values together tell the community what it knows, what it would have to revise to leave its federable family, and what it could come to know without leaving it. The classical knowability principle ("if $p$ is true then $p$ is knowable") is replaced by the substrate-level fact: $u_S(s, o) \leq_k (\Diamond_{R_F} u)_S(s, o)$ when the system's federation discipline is reflexive ($R_F(S, S) \geq_k \mathbf{t}$, which any well-formed scope satisfies).

## Regime interaction

The community's [closure regime](epistemic-closure.md) and its modal-knowability profile are independent substrate-level facts. A community in the strict regime can have modally possible cells outside its strict-regime closure (other peers in the federable family may admit transfinite-bounded closure rules and have settled cells the strict community cannot reach by its own means). A community in the aperiodic regime can have modally necessary cells that are not yet settled in its own scope (every peer settles the cell, but the community itself has not yet reached the firing ordinal at which its own rules would).

The substrate's [four-regime classification](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md) governs *how* a community settles its own cells; the modal apparatus governs *what* it could settle by federation, independent of regime. The two together form the community's full epistemic profile — neither alone is sufficient.
