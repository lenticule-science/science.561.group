---
type: example
status: instance
depends-on: [formal-context, concept-lattice, basic-theorem-of-fca]
see-also: []
title: A small zoological context
description: A worked formal context illustrating the construction of a concept lattice.
---

# A small zoological context

A worked formal context illustrating the construction of a concept lattice. Object set $G = \{\text{lion}, \text{eagle}, \text{salmon}, \text{frog}\}$; attribute set $M = \{\text{has-fur}, \text{has-feathers}, \text{has-scales}, \text{lives-in-water}, \text{lives-on-land}, \text{can-fly}\}$; incidence:

| | has-fur | has-feathers | has-scales | lives-in-water | lives-on-land | can-fly |
|---|---|---|---|---|---|---|
| lion | × | | | | × | |
| eagle | | × | | | × | × |
| salmon | | | × | × | | |
| frog | | | | × | × | |

## Computing some concepts

Apply the derivation operators (per [derivation-operator](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/derivation-operator.md)):

- $\{\text{lion}\}' = \{\text{has-fur}, \text{lives-on-land}\}$, $\{\text{has-fur}, \text{lives-on-land}\}' = \{\text{lion}\}$. So $(\{\text{lion}\}, \{\text{has-fur}, \text{lives-on-land}\})$ is a concept.
- $\{\text{salmon}, \text{frog}\}' = \{\text{lives-in-water}\}$, $\{\text{lives-in-water}\}' = \{\text{salmon}, \text{frog}\}$. So $(\{\text{salmon}, \text{frog}\}, \{\text{lives-in-water}\})$ is a concept.
- $\{\text{lion}, \text{eagle}, \text{frog}\}' = \{\text{lives-on-land}\}$, $\{\text{lives-on-land}\}' = \{\text{lion}, \text{eagle}, \text{frog}\}$. So $(\{\text{lion}, \text{eagle}, \text{frog}\}, \{\text{lives-on-land}\})$ is a concept.
- $\{\text{eagle}\}' = \{\text{has-feathers}, \text{lives-on-land}, \text{can-fly}\}$, the closure $\{\text{has-feathers}, \text{lives-on-land}, \text{can-fly}\}' = \{\text{eagle}\}$. So $(\{\text{eagle}\}, \{\text{has-feathers}, \text{lives-on-land}, \text{can-fly}\})$ is a concept.
- The trivial **top** concept $(\{\text{lion}, \text{eagle}, \text{salmon}, \text{frog}\}, \emptyset' = \emptyset)$ — no attribute is shared by all four animals.
- The trivial **bottom** concept $(\emptyset, M)$.

## The full lattice

Continuing the enumeration produces the following concepts (extents listed):

1. $\{\text{lion}, \text{eagle}, \text{salmon}, \text{frog}\}$ (top)
2. $\{\text{lion}, \text{eagle}, \text{frog}\}$ (lives-on-land)
3. $\{\text{salmon}, \text{frog}\}$ (lives-in-water)
4. $\{\text{frog}\}$ (lives-on-land + lives-in-water — amphibious)
5. $\{\text{lion}\}$ (has-fur + lives-on-land)
6. $\{\text{eagle}\}$ (has-feathers + lives-on-land + can-fly)
7. $\{\text{salmon}\}$ (has-scales + lives-in-water)
8. $\emptyset$ (bottom)

The lattice ordering by extent inclusion:

```
        {lion, eagle, salmon, frog}
              /          \
   {lion, eagle, frog}   {salmon, frog}
        /     |     \      /     \
   {lion} {eagle} {frog}  {salmon}
        \     |     /     /
              ∅
```

The frog concept $\{\text{frog}\}$ is the meet of $\{\text{lion}, \text{eagle}, \text{frog}\}$ and $\{\text{salmon}, \text{frog}\}$ — the substrate's structural way of expressing "amphibious = lives-on-land ∧ lives-in-water" without that derived attribute being recorded explicitly.

## What the example exhibits

- The basic theorem of FCA in action: every concept is recoverable from the closure operator on $\mathcal{P}(G)$, the lattice is complete, and the embedding maps $\gamma, \mu$ recover the original incidence.
- The lineage's *implicit derivation* of composite attributes (the amphibious frog concept emerges as a meet without being declared as an attribute).
- The basis for attribute exploration: the implication $\{\text{has-feathers}\} \to \{\text{can-fly}, \text{lives-on-land}\}$ holds in this context (the eagle is the only feathered object); the implication $\{\text{lives-on-land}, \text{lives-in-water}\} \to \{\text{has-no-fur}\}$ would require introducing has-no-fur as an attribute.
- The reading against the predicated framing: the worked example is also presented in the companion subtheory's [fca-concept-lattice](fca-concept-lattice.md) under the substrate-level reading, which makes the same context's substrate cells, value-domain, and closure-rule system explicit.
