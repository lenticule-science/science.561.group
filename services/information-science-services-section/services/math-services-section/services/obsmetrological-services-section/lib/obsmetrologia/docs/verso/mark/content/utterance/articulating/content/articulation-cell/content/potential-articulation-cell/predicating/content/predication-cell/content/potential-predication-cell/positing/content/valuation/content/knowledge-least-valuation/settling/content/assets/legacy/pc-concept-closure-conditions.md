---
type: concept
class: completeness-criteria
depends-on: [predication-substrate, self-representation, vocabulary-completeness]
see-also: [scope, operation]
---

# Closure conditions

A predicated computer is *complete* when its sub-region $X$ satisfies seven structural conditions — when the substrate-level operators applied to $X$ produce nothing outside $X$. The conditions characterize what a *closed* sub-region of the substrate is, and they are the engineering content of "this region is a predicated computer in its own right."

The seven conditions are (in their substrate-level engineering content):

1. **Atom admission.** Every primitive entity that the substrate generates is in $X$. The atoms — the irreducible identity-bearing predications — are not optional.
2. **Identity closure.** Two entities with the same relational structure are treated as the same entity. Identity is determined by participation in relations, not by an out-of-band declaration. (See [identity-by-relations](identity-by-relations.md).)
3. **Composite closure.** Constructions that combine entities — products, intersections, unions, joinings — produce entities that are also in $X$. A region admitting two entities admits their joinings.
4. **Reference closure.** Operations between entities — the procedures, transformations, and inferences that act on entities — are themselves entities in $X$. Operations are not external to the region; they are *in* the region, citable from other entities. (See [operation](operation.md).)
5. **Constraint classification.** Sub-configurations within an entity are classified by *shapes* — predicate constraints that say which sub-configurations are admissible. Shapes are themselves entities in $X$. The substrate has no out-of-band validity check; validity is an internal predication. (See [vocabulary-completeness](vocabulary-completeness.md).)
6. **Procedure closure.** Procedures that operate *on the region itself* — generating new entities, transforming existing ones, deriving consequences — are themselves entities in $X$. The region's own machinery is in the region, not outside it. (This is the substrate-level [self-representation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md) discipline.)
7. **Coherence closure.** Compatible local sections — predications established independently in different parts of the region — assemble into globally coherent content within $X$. When two sources of the same predication agree, the substrate produces one canonical predication; when they disagree, the substrate flags the incoherence as a [repair](repair.md) opportunity.

The seven conditions are independent in the sense that a region may satisfy any subset without satisfying the others. The development arc of a sub-region of a predicated computer can be tracked by which conditions it has satisfied:

- A region satisfying only condition 1 is a *bare presence*: entities are admitted but no closure is applied.
- A region satisfying conditions 1–4 has structural content (entities exist, identity is canonical, composites work, operations are in-region) but lacks constraint classification and self-procedure.
- A region satisfying conditions 1–6 has self-content (its own constraints and procedures are in-region) but no global coherence requirement.
- A region satisfying all seven is *closed*: a complete predicated computer at its scope.

The conditions are the engineering completeness criteria for the substrate. A region claiming to be a predicated computer is checkable against them; a region that fails some condition is admissible (it can still operate) but is *less than* a complete sub-computer until the missing conditions are satisfied.

## Stages of completion

The development arc of a sub-region passes through named stages, each defined by which conditions are satisfied:

- **Bare presence.** Condition 1 only. Entities exist; no closure structure has been added.
- **Composable structure.** Conditions 1–4. Identity, composition, and reference work; the region's operations are in-region.
- **Constraint-equipped.** Conditions 1–5. Shapes are present; admissibility is checkable internally.
- **Self-generating.** Conditions 1–6. The region's own procedures are in-region.
- **Closed.** All seven. The sub-region is a complete predicated computer.

A particular implementation may name these stages differently and may track them at different granularities, but the structural arc is invariant: a region accumulates closure conditions until it is closed, and the order in which conditions are satisfied determines what the region can do at each intermediate stage.
