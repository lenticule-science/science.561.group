---
type: theorem
status: sketch
depends-on: [predicated-knowledge-system, scope, knowledge-fiber-algebra, federate]
see-also: [federate, topic-maps-as-degenerate-predication-system, closure-as-fitting-fixpoint]
---

# Federation is the bilattice-fiber colimit of scopes (sketch)

**Claim** (sketch). The substrate operation [federate](../morphisms/federate.md) on two scopes $S_1, S_2 \in \Sigma$ under an explicit identity-mapping $\iota: E_{S_1} \times E_{S_2} \to \mathbf{L}^\bowtie$ (the cross-scope identity-predications) is the *colimit* (in the appropriate scope-and-fiber-algebra category) of the diagram
$$K^{S_1} \;\leftarrow\; K^{S_1 \cap S_2}_{\iota} \;\rightarrow\; K^{S_2}$$
where $K^{S_1 \cap S_2}_{\iota}$ is the fiber algebra over the cells $\iota$ admits as identified.

## Setup

Let $\mathcal{K} = (\mathbf{L}, \mathcal{C}, E, \mathcal{S}, \Sigma)$ be a predicated knowledge system. The category $\mathbf{Scope}_{\mathcal{K}}$ has scopes as objects and *scope-restriction morphisms* as arrows: $S \to S'$ exists when $\mathcal{C}_S \subseteq \mathcal{C}_{S'}$, $\mathcal{S}_S \subseteq \mathcal{S}_{S'}$, $E_S \subseteq E_{S'}$, and the consistency commitment of $S'$ is at least as strict as $S$'s.

For each scope $S$, the assignment $S \mapsto K^S$ (the scope's knowledge fiber algebra) extends to a contravariant functor $K^{(-)}: \mathbf{Scope}_{\mathcal{K}}^{\mathrm{op}} \to \mathbf{BiLat}_{\mathbf{L}^\bowtie}$ where $\mathbf{BiLat}_{\mathbf{L}^\bowtie}$ is the category of $\mathbf{L}^\bowtie$-valued bilattice algebras with bilattice-homomorphism arrows.

An **identity-mapping** $\iota$ is a sub-bilattice embedding
$$\iota: K^{S_1 \cap S_2}_{\iota} \hookrightarrow K^{S_1}, \quad \iota: K^{S_1 \cap S_2}_{\iota} \hookrightarrow K^{S_2}$$
together with a cross-scope identity-predication assertion in a meta-scope governing the federation, asserting that the entities at $K^{S_1 \cap S_2}_{\iota}$ are identified across $S_1$ and $S_2$.

## Statement

**Theorem (sketch).** Let $S_1, S_2 \in \Sigma$ and let $\iota$ be an identity-mapping per above. Then:

1. **(Colimit structure)** The federated scope $S_{12} := S_1 \,\#_\iota\, S_2$ per [federate](../morphisms/federate.md) has knowledge fiber algebra $K^{S_{12}}$ given by the colimit (pushout)
$$K^{S_{12}} \;=\; K^{S_1} \cup_{K^{S_1 \cap S_2}_{\iota}} K^{S_2}$$
in the bilattice category $\mathbf{BiLat}_{\mathbf{L}^\bowtie}$, with the cells in the intersection identified per $\iota$ and the bilattice values combined under $\vee_k$.

2. **(Universal property)** For any scope $S' \supseteq S_1, S_2$ (under the partial order on scopes) admitting an identity-mapping refining $\iota$, there is a unique bilattice-homomorphism $K^{S_{12}} \to K^{S'}$ commuting with the inclusions.

3. **(Monotonicity)** The federated scope's settled state is $\geq_k$ the join of the two source scopes' settled states; conflicts on identified cells produce $\top$ rather than overwriting.

4. **(Federation chain)** Federation of three or more scopes is associative under the identity-mapping composition: $(S_1 \,\#_{\iota_{12}}\, S_2) \,\#_{\iota_{(12)3}}\, S_3 = S_1 \,\#_{\iota_{1(23)}}\, (S_2 \,\#_{\iota_{23}}\, S_3)$ when the identity-mappings are coherent, by colimit associativity.

## Argument

**(1) Colimit construction.** Pushouts in $\mathbf{BiLat}_{\mathbf{L}^\bowtie}$ exist because the category has all small colimits — bilattice algebras are an algebraic variety in the sense of universal algebra (signature $\wedge_t, \vee_t, \wedge_k, \vee_k, \sim, \mathbf{0}, \mathbf{1}, t, f, \bot, \top$) over a complete lattice value-domain. The pushout of $K^{S_1} \leftarrow K^{S_1 \cap S_2}_{\iota} \rightarrow K^{S_2}$ identifies the embedded sub-bilattice and joins the rest. Per [federate](../morphisms/federate.md) the federated fiber algebra has predicate-vocabulary $\mathcal{C}_{S_1} \cup \mathcal{C}_{S_2}$, entity-set $E_{S_1} \cup_\iota E_{S_2}$, and rule-set $\mathcal{S}_{S_1} \cup \mathcal{S}_{S_2}$ — exactly the pushout's underlying structure.

**(2) Universal property.** Standard from the colimit construction. Any cocone over the diagram (i.e., any third scope receiving morphisms from both $S_1$ and $S_2$ commuting through $K^{S_1 \cap S_2}_{\iota}$) factors uniquely through the pushout.

**(3) Monotonicity and contestation.** The $\vee_k$ used to combine values at identified cells produces $\top$ when one source asserts $t$ and the other asserts $f$; this is the bilattice's contestation marker, not a conflict-resolution. The substrate's federation produces the contestation as a substrate-level fact, observable by [closure-as-fitting-fixpoint](closure-as-fitting-fixpoint.md)'s closure-driven settling under any rule that fires on $\top$-cells.

**(4) Associativity.** Pushouts in any category are associative under composition; coherent identity-mappings (where $\iota_{1(23)}$ extends $\iota_{12}$ and $\iota_{23}$ consistently) preserve the associativity at the substrate level.

## Corollaries

**(C1) Federation preserves the per-scope four-regime classification on the sub-fibers it inherits.** $S_1$'s closure regime applies to $S_1$'s sub-fiber within $K^{S_{12}}$; $S_2$'s regime applies to $S_2$'s; the federation's regime is the join in the regime lattice (which can promote, never demote).

**(C2) Topic-Maps merge is a special case of federation colimit.** Per [topic-maps-as-degenerate-predication-system](topic-maps-as-degenerate-predication-system.md), Topic-Map-merge under shared subject identifiers is exactly the colimit-construction here with $\iota$ derived from the `subject-identifier` and `base-name`-in-scope predications. The substrate generalises Topic-Maps merge to bilattice value-domains and explicit cross-scope identification.

**(C3) Federation is *partial* when identity-mappings are inconsistent.** When two scopes assert contradictory identifications (e.g., $\iota_{12}$ identifies $e_1 \sim e_2$ while $\iota_{12}'$ identifies $e_1 \sim e_3$ for $e_2 \neq e_3$), the colimit identifies all three, recording the resulting cross-cell-collision as $\top$. The federation is total but its consistency is in the substrate as $\top$-evidence.

## Status: sketch

`status: sketch` because:

- The category $\mathbf{Scope}_{\mathcal{K}}$ requires precise definition of the scope-restriction morphism. The candidate definition above (consistency commitment refinement) requires more care for cases where the consistency disciplines are incomparable.
- The Universal property in (2) is sketched on the pattern of standard pushout proofs but requires verifying that the federated scope satisfies the substrate's scope-discipline (predicate-vocabulary closure under predicate-category morphisms, etc.).
- The associativity in (4) is asserted under the coherence condition on identity-mappings; the precise definition of "coherent identity-mappings" requires further work.
- The result of [federation-convergence](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md) (which is the engineering-side property) is the operational counterpart to this colimit characterisation; the structural identification of the two is part of the sketch.

