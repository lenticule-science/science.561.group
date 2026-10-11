---
type: reference
authors: [Lenat, Douglas B., Guha, R. V.]
year: 1990
title: "Building Large Knowledge-Based Systems: Representation and Inference in the Cyc Project"
venue: "Addison-Wesley"
---

## Full citation

D. B. Lenat, R. V. Guha. *Building Large Knowledge-Based Systems: Representation and Inference in the Cyc Project.* Addison-Wesley, Reading, MA, 1990.

## Status

Pending direct re-read; covered via Guha's microtheory papers and standard secondary literature.

## Annotation

The foundational monograph on Cyc, the largest sustained attempt to hand-encode commonsense knowledge in a single knowledge base. Cyc's signature representational choices are: (i) CycL, a higher-order logic with explicit modal and epistemic operators; (ii) *microtheories*, named contexts within which assertions hold and across which assertions may not be valid; (iii) explicit *truth-maintenance* and *contradiction-handling* protocols, since Cyc's scale guarantees that contradictory assertions will accumulate and must be managed locally rather than eliminated globally; (iv) a constantly evolving upper-ontology (the *Cyc upper hierarchy*) developed through decades of curation.

For the predicated framing, Cyc's *microtheory* construct is the key precedent for the [discourse-community-as-fiber](teaching/explanations/discourse-community-as-fiber.md) concept. A Cyc microtheory is a scope within which assertions are taken to hold; assertions may be lifted between microtheories under controlled conditions; the microtheory lattice (with inheritance and overriding) is what lets Cyc avoid global contradiction. The framing makes the microtheory structure algebraic: microtheories are fibers in the predication-fibration, lifting between microtheories is the [specialize](../morphisms/specialize.md) morphism, and the contradiction-handling Cyc enforces by hand is what the [bilattice value-domain](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice.md) handles algebraically (the $\top$ value records contradiction without forcing its elimination).

Cyc's empirical lesson — *commonsense knowledge does not factor through a single global theory* — is what motivates the framing's commitment to a *fibered* substrate. The [federation-as-bilattice-colimit](../theorems/federation-as-bilattice-colimit.md) theorem makes Cyc's microtheory-lifting protocol an instance of a general algebraic operation rather than a domain-specific engineering hack.

## Where used

- [knowledge-representation-survey](../texts/knowledge-representation-survey.md)
- [upper-ontologies-as-predicate-vocabularies](../texts/upper-ontologies-as-predicate-vocabularies.md)
- [discourse-community-as-fiber](teaching/explanations/discourse-community-as-fiber.md)
- [federation-as-bilattice-colimit](../theorems/federation-as-bilattice-colimit.md)
