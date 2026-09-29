# objects/

Definitions of engineering structures: the [predicated computer](predicated-computer.md) itself, the [predication-graph store](predication-graph-store.md), the [event log](event-log.md), the [application sublocale](application-sublocale.md). Each is a target a particular realization can be checked against.

## Frontmatter

```yaml
---
type: definition
class: computer | store | sublocale | ...
realizes: [...]
depends-on: [...]
see-also: [...]
---
```

## Body shape

An object's body opens with the formal definition and proceeds to:

1. State what the object is and what its components or commitments are.
2. Identify cross-component invariants — what makes the parts a coherent whole.
3. Position the object relative to nearby objects.

## When to add an object

When a structural target needs to be named precisely so that two implementations can be checked against it. An object is a *contract*: it specifies what an implementation must commit to in order to call itself an instance of the object. If two implementations would not need to agree on the structure, the structure is realization-specific and belongs in [examples](../examples/).
