# morphisms/

The engineering "moves": [insertion](insertion.md), [retraction](retraction.md), [traversal](traversal.md) as substrate primitives; [merge](merge.md) and [closure-rule application](closure-rule-application.md) as composed. A morphism is the engineering presentation of an operation that takes input objects to output objects under stated commitments (locality, determinism, witness emission, idempotence, etc.).

## Frontmatter

```yaml
---
type: morphism
class: primitive-operator | composed-operator | ...
realizes: [...]
depends-on: [...]
see-also: [...]
---
```

## Body shape

A morphism's body opens with the formal signature (the input/output types or carriers) and proceeds to:

1. Describe the action — what the morphism does.
2. State the engineering commitments — locality, determinism, witness emission, idempotence, monotonicity, commutativity, etc.
3. Position the morphism relative to nearby morphisms.

## When to add a morphism

When an operation has a stable signature and stable commitments that two realizations can be checked against. The primitive operators (insertion, retraction, traversal) are the substrate's foundation; composed operators are the engineering combinations the corpus characterizes. Operations that are realization-specific belong in [examples](../examples/).
