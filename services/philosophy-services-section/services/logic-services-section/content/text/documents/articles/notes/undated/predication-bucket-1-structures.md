---
title: objects/
description: Definitions of mathematical structures.
---
# objects/

Definitions of mathematical structures. One structure per file.

Examples of what belongs here: bilattices, Priestley spaces, presheaves on a spatial base, hyperdoctrines, fibrations, the predication settling itself, the Priestley-dual object, moduli stacks of predication-hyperdoctrines.

## Frontmatter

```yaml
---
type: definition
status: draft | sketch | settled
realizes: [knowledge, truth, ...]    # which concepts this object instantiates, if any
depends-on: [bilattice, priestley-space, ...]
---
```

`status: settled` means the definition has been used by other notes without revision for long enough to be treated as stable. `draft` and `sketch` are both acceptable working states; the distinction is whether the definition is provisional (`draft`) or merely incomplete in exposition (`sketch`).

## Body shape

A typical object note contains:

1. The definition itself, formally stated.
2. Notation conventions specific to this object.
3. Brief discussion of why the definition is set up this way (design choices, alternatives considered).
4. Pointers to key examples (`examples/`) and theorems (`theorems/`) that involve this object — but only as a courtesy; the authoritative direction of reference is *outward from* objects (theorems cite objects via `depends-on`), not inward.

Keep object notes focused on the *definition*. Properties of the object that require proof go in `theorems/`.
