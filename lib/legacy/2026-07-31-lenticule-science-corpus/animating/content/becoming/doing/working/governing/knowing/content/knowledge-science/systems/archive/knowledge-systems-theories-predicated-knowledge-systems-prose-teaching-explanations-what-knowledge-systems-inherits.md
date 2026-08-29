---
type: narrative
recaps: [knowledge-organization-survey, knowledge-representation-survey, upper-ontologies-as-predicate-vocabularies, process-ontology-and-situated-learning]
discusses: [predicated-knowledge-system, four-group-register-as-fibration]
---

# What knowledge systems inherits when it goes predicated

The parent theory [knowledge-systems](../../../../) is the information-science theory of how knowledge is collected, structured, indexed, retrieved, validated, and circulated. It draws on knowledge organisation (Ranganathan, Hjorland, the CRG), knowledge representation (RDF/OWL, Topic Maps, conceptual graphs, Datalog, FCA), upper ontologies (BFO, DOLCE, SUMO, Cyc), and the process-and-situated-learning lineage (Whitehead, Peirce, Lave-Wenger, Knorr-Cetina, Fleck). The parent does not commit to a substrate; it inventories the upstream commitments and makes them available for analysis.

The predicated-knowledge-systems subtheory makes one substrate commitment: the unit of stored knowledge is the [predication-cell](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md), valued in the bilattice $\mathbf{2} \otimes \mathbf{2}$, fibered over a predicate category, settled under a closure-rule system, classified by the four-regime dichotomy. This narrative names what the parent theory *inherits as substrate-level invariants* once that commitment is made.

## What inherits with proof

These inheritances are *proved* by the predication-categories machinery (or by direct reading of the upstream literature):

- **The cell is a function-application with a value-domain** (Frege; per [predication-logic-through-knowledge-systems](../texts/predication-logic-through-knowledge-systems.md) §1). Knowledge systems gain a notion of cell-as-application, not cell-as-name-pair.
- **The combination of predicates with arguments is residuated** (Lambek; Galatos et al. 2007). Knowledge systems gain a *forced* inferential calculus on the substrate.
- **Predicate-vocabulary structure is content** (Lawvere; Maruyama 2021). Knowledge systems gain that the predicate vocabulary itself lives on the substrate, not in a separate axiom layer.
- **Multi-source disagreement is non-destructive** (Belnap 1977). Knowledge systems gain a substrate-level state ($\top$) for contested cells, distinct from silence ($\bot$) and from affirmation ($t$) or denial ($f$).
- **Closure under inference rules has a fixpoint semantics** (Fitting 1991). Knowledge systems gain a well-defined notion of *what the substrate has settled to* under any chosen rule subset.
- **The bilattice has a residuation** (Busaniche-Cignoli 2014). Knowledge systems gain an algebra by which evidence can be extended and restricted.
- **The substrate is a model of multiplicative linear logic** (Jakl 2025). Knowledge systems gain resource-sensitive inference as a substrate primitive.

## What inherits as substantive commitment (status: sketch)

These inheritances are *plausible structural commitments* that the predicated framing names but that have not been fully established. They are `status: sketch` per the [novel-research-potential discipline](../../../../../../../../../../CLAUDE.md):

- **Faceted analysis = orthogonal sub-fibrations** (Ranganathan; per [pmest-as-five-axis-decomposition](../theorems/pmest-as-five-axis-decomposition.md)). The PMEST decomposition lifts to a category-theoretic product of sub-fibrations; the surface colon-classification is the substrate's tuple-of-fiber-restrictions.
- **The four-group register is regime-stratified** (per [four-group-register-as-regime](../theorems/four-group-register-as-regime.md)). The governing/engaging/situating/defining partition lands closure-rule sub-languages cleanly in different regimes of the four-regime dichotomy.
- **Topic Maps are degenerate predicated knowledge systems** (per [topic-maps-as-degenerate-predication-system](../theorems/topic-maps-as-degenerate-predication-system.md)). The Topic-Maps standard's mechanisms map exactly to the substrate's operations under the value-domain restriction $\mathbf{L} = \mathbf{2}$.

## What inherits as engineering correspondence

These are the inheritances at the engineering surface — what a working knowledge system gets when it adopts the predication-cell substrate via the [predicated-computing](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/) implementation discipline:

- **The substrate is content-addressable, deterministic, and federable**. These are not features of an application running over a substrate; they are properties of the substrate itself, inherited from the predication-fibration's functorial structure (per [conformance-via-fiber-algebra-functor](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/conformance-via-fiber-algebra-functor.md)).
- **The substrate's content is its own metadata**. Per [self-representation](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/self-representation.md), the predicate vocabulary, the closure rules, the scope structure all live as substrate cells. There is no out-of-band schema layer.
- **The substrate's identity discipline is participation-based**. Per [identity-by-relations](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/identity-by-relations.md), an entity is the predications it participates in. Topic Maps' subject identifiers, RDF blank nodes, FCA object identities, and DL named individuals all collapse into this single discipline.
- **The substrate's social discipline is scope-based**. Per [scope-as-predication](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/narratives/scope-as-predication.md), a discourse community's substrate region is named by a scope; cross-community reconciliation is the substrate's federation operation.

## Parameters, not inheritances

The substrate leaves these to community choice:

- **Upper ontology**: BFO, DOLCE, SUMO, Cyc, or none.
- **Closure-rule fragment**: description-logic, Datalog, or domain-specific, up to the four-regime classification.
- **Source authority**: substrate carries attribution; the discipline of which sources count lives in scope rules.
- **Human-language vocabulary**: terminology work (Dahlberg's INTERCONCEPT, ISO 25964 thesauri) sits in the predicate-vocabulary layer.

## What the parent gains

- **Substrate-level reading of every upstream commitment**: knowledge-organisation, knowledge-representation, upper-ontology, and process-and-situated-learning lineages unified by the substrate's invariants.
- **Checkable discipline**: the substrate's invariants (per [conformance](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/conformance.md)) are testable in working systems.
- **Federation across communities**: scopes on the same substrate; cross-community work is substrate operation.
- **Succession path for the predecessor sibling**: [knowing-semioverse](../../knowing-semioverse/) retroactively grounded via [lift-from-knowing-semioverse](../morphisms/lift-from-knowing-semioverse.md).
