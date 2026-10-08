---
title: morphisms/
description: Functors, natural transformations, adjunctions, 2-cells, and other maps between objects.
---
# morphisms/

Functors, natural transformations, adjunctions, 2-cells, and other maps between objects. One map per file.

Morphisms get their own directory because in predication categories many of them carry as much content as objects do — the closure operator, the dualization functor between primal and Priestley-dual sides, the settling morphism, the various adjoints in the hyperdoctrinal structure. Treating them as first-class avoids burying their content inside whichever object happens to be the source or target.

## Frontmatter

```yaml
---
type: morphism
status: draft | sketch | settled
realizes: [...]                                # if the morphism realizes a concept
depends-on: [source-object, target-object, ...]
---
```

The source and target objects of the morphism go in `depends-on:`.

## Body shape

1. The morphism itself, formally defined (its action on objects/morphisms, or as a natural transformation, or as a functor between categories).
2. Naturality / functoriality / coherence conditions, stated. Their *proofs* go in `theorems/`.
3. Brief discussion of role: what does this morphism do in the program, why is it the right map.

## Adjunctions and 2-cells

An adjunction is one note (not two), naming both functors and the unit/counit. Higher 2-cells (laxness, modifications) likewise get one note each.
