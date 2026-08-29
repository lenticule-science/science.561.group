# examples/

Concrete predicated-computing realizations. The directory currently contains [mud-as-application-sublocale.md](mud-as-application-sublocale.md) — a working-out of how a multi-user-dungeon-style application sits as a sublocale of a predicated computer. Other examples will be added as the corpus accumulates concrete realizations.

An example is not a theorem-grade claim. It is a concrete realization with its specific data formats, deployment choices, and engineering trade-offs documented enough that a reader can understand what the abstract structure looks like in practice. Examples are the corpus's bridge from the abstract to the concrete.

## Frontmatter

```yaml
---
type: example
status: documented | benchmarked | verified
instantiates: [...]
---
```

## Body shape

An example's body has:

1. **What it instantiates.** Cite the abstract concepts/objects/morphisms the example realizes.
2. **Concrete content.** The specific data formats, algorithms, choices the realization makes that the abstract level does not specify.
3. **Position in the corpus.** What the example contributes — typically that it is *one* realization, not the only one.

## When to add an example

When a concrete realization has enough engineering content that documenting it makes the abstract corpus easier to read. Realizations whose engineering content is *only* a restatement of the abstract object's commitments do not need an example file — they are already in the object's body.
