---
name: "Operator"
aliases: [operators]
description: "A relational-computing operator is a computing operator whose source and target are graphs of relations rather than stored values — a transformation that takes a relation graph (or a region of one) to another relation graph by the addition, retraction, or traversal of relations."
instance-of: operator
specializes: operator
operates-on: relation
contrasts-with: value-mutation
date-created: 2026-04-27
---

A **relational-computing operator** is a [computing operator](../../../terms/operator.md) specialised to the [relational substrate](relational-computer.md): its source and target are graphs of [relations](../../../../../../../../humanities/domains/philosophy/terms/relation.md) — or regions thereof — rather than stored values. Where a generic computing operator transforms inputs of arbitrary type to outputs of arbitrary type, a relational-computing operator's inputs and outputs are necessarily relational structures, and its action is correspondingly restricted to the three relational primitives: insertion of a relation, retraction of a relation, and traversal along relations.

## How the specialisation works

In the predicate-fiber sense, a relational-computing operator is a predicate specialisation of the computing operator: the sub-support is exactly the cases where the operator's source and target are relation graphs (or regions of relation graphs), and the values are the computing operator's values restricted to that sub-support. A computing operator that returns a stored value at a memory address has no image in the relational-computing operator family — there are no stored values at addresses to return. A computing operator that transforms one relation graph into another inhabits both families, and its relational-computing specialisation is just its action on relation-graph inputs.

## Three primitive forms

Because the substrate has only three native operations, a relational-computing operator is, at root, a composition of three primitive forms:

- **Insertion** of a relation — add the edge $\langle s, p, o \rangle$ to the graph.
- **Retraction** of a relation — remove the edge $\langle s, p, o \rangle$ from the graph.
- **Traversal** of relations — enumerate the edges incident to a position $s$ under a given predicate $p$.

Higher-level operators are compositions of these: a graph-rewrite operator is a sequence of retractions and insertions; a query operator is a structured traversal; a closure operator is iterated insertion under fixed inference rules until quiescence.

## Why this is the right specialisation

A computing operator is constrained by effective computability, representability, and typing (the [computing-operator](../../../terms/operator.md) page makes the three explicit). A relational-computing operator inherits all three and adds a fourth: *substrate restriction*. The operator's source and target must be expressible as relation graphs, and its action must be given as a sequence of the three primitive forms. This is the formal content of *the substrate is relational*: every computing operator that acts on the relational substrate is, by definition, a relational-computing operator; computing operators that act on non-relational substrates are not.

## See Also

- [computing operator](../../../terms/operator.md) — the parent in the specialisation chain
- [operator](../../../../../../../../humanities/domains/math/terms/operator.md) — the mathematical root
- [relational computer](relational-computer.md) — the system whose operations these are
