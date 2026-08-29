---
type: concept
class: reachability
depends-on: [predicatory-comparison, predication-settling-category, knowledge-order]
see-also: [confluence-join, predication-settling-category-completeness, crdt-convergence, beckmann-moser2024]
---

# Predicatory confluence

**Predicatory confluence** is joinability of divergent settling paths.
Adapting the abstract-rewriting definition from [@baader-nipkow1998], a settling rewrite relation $\Rightarrow$ is confluent when

$$v \Rightarrow^* u \quad\text{and}\quad v \Rightarrow^* w$$

imply that there exists $z$ with

$$u \Rightarrow^* z \quad\text{and}\quad w \Rightarrow^* z.$$

In the [predication settling category](../objects/predication-settling-category.md), the ambient preorder already supplies a canonical candidate:

$$z = u \vee_k w.$$

The nontrivial question is operational, not order-theoretic: are the allowed settling operations rich enough to reach $u \vee_k w$ from both branches?
For positing-generated and merge-generated settling paths, the answer is yes, because additional posits and knowledge-join merges are exactly $\leq_k$-increasing evidence additions.
For arbitrary closure disciplines, the answer depends on the rule language and must be proved separately.

Thus predicatory confluence separates two levels:

- **order confluence:** a common $\leq_k$ upper bound exists;
- **operational confluence:** that upper bound is reachable by the admitted morphisms.

For calculator design there is a third, proof-object level: return the joining witness, not just the joined value.
Contemporary confluence work such as [@beckmann-moser2024] studies the complexity of confluence and Church-Rosser proof diagrams; predication-category calculators can analogously expose the number of posits, closure steps, or merge operations needed to witness a confluence join.
