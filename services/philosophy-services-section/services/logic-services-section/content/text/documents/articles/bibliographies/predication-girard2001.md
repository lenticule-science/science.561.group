---
type: reference
authors: [Girard, Jean-Yves]
year: 2001
title: "Locus Solum: From the Rules of Logic to the Logic of Rules"
venue: "Mathematical Structures in Computer Science 11, Cambridge University Press, 301–506"
description: J.-Y.
---

## Full citation

J.-Y. Girard. "Locus Solum: From the Rules of Logic to the Logic of Rules." *Mathematical Structures in Computer Science* 11, Cambridge University Press, 2001, pp. 301–506.

## Status

Not directly accessed; cited at training-knowledge level. PDF available at nguyentito.eu.

## Annotation

Introduces Ludics — a denotational semantics of proofs and programs structured around **loci** (addresses replacing formulae), **designs** (prefix-closed sets of alternating chronicles), and **behaviours** (biorthogonally-closed sets of designs).

The central polarity distinction: a **positive action** $\kappa = (+1, \xi, I)$ is the proponent's commitment move — choosing a locus $\xi$ and opening ramification loci $I$. A **negative action** $\kappa = (-1, \xi, I)$ is the opponent's response. Positive polarity = positing in the informal sense; negative polarity = responding/challenging. This is the most structurally precise predecessor to a formal notion of "positing" in a categorical proof-theoretic setting.

Designs are the objects of Ludics; a single positive action is a chronicle element, not a first-class design. Orthogonality between designs (cut-elimination terminates) determines behaviours (the types). Behaviours correspond roughly to logical formulae; designs to proofs/refutations.

Cited in the [entity realization theorem](../research/2026/07/31/lenticule-import/theorems/entity-realization.md) and the [positing morphism](../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/positing-morphism/positing-morphism.md): positive-polarity actions in Ludics are the closest published analog to positing as a distinguished move-type, but Girard does not model them as morphisms between design-objects or as first-class designs themselves. PredCat fills both gaps: positing morphisms are 2-cells in $\mathbf{PrFib}$ (the morphism side) and posit-entities are full objects in the extended fibration (the object side).

Predication categories' corpus also mentions Ludics in connection with the sociology sub-theory of [ludics](../research/sociology/theories/ludics); this reference is the mathematical, proof-theoretic side.
