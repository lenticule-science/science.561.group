---
type: concept
class: substrate-reading
status: sketch
depends-on: [predication-cell, predicate-category, identity-by-relations]
see-also:
  - discourse-community-as-fiber
  - knowing-as-settling
  - ../../../../../../linguistics/theories/semiotics/concepts/aboutness.md
  - ../../../../../../linguistics/theories/semiotics/narratives/composability-with-predicated-knowledge-systems.md
---

# Aboutness

The structural reading of the *aboutness* of a knowledge artifact on the predicated substrate. A knowledge artifact (a document, a record, a witness, a derived assertion) is *about* an entity $e$ when it participates in predications whose subject or object is $e$. There is no separate "aboutness" predicate to be asserted out-of-band; aboutness is the structure of the artifact's predication-participation.

This recovers Topic Maps' subject-identifier discipline (per [knowledge-representation-survey](../texts/knowledge-representation-survey.md) §3) directly: a topic map's "topic for subject $s$" is the substrate's entity that participates in identity-predications with $s$ as subject. Two topic maps merge by topic-identity *because* the substrate's [identity-by-relations](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/identity-by-relations.md) discipline already identifies entities by participation; the merge is automatic at the substrate level rather than a separate operation in the topic-map application layer.

Three operational consequences:

- **Aboutness is multi-valued under the bilattice.** An artifact can be $t$-about an entity (clearly about it), $f$-about an entity (clearly not about it, e.g., explicitly disambiguated against it), $\bot$-about (no information either way), or $\top$-about (ambiguously about it under different readings). The substrate's value-domain extends to aboutness without separate machinery.
- **Aboutness is community-relative.** The same artifact can be about-entity-$e$ in scope $S_1$ and not-about-entity-$e$ in scope $S_2$, when the two scopes admit different identity-predication closures. Library-of-Congress aboutness and a domain-specific community's aboutness need not agree, and the substrate represents the disagreement explicitly per scope.
- **Aboutness is closed under the predicate category.** An artifact about $e$ is also about every entity $e'$ that the predicate-category morphisms relate to $e$ — its parts, its specialisations, its alternative names. The substrate computes aboutness-closure as a closure-rule application on the participation-graph.

The predicated framing absorbs aboutness as substrate-content rather than treating it as metadata about the substrate. This is the same move the substrate makes for predicate vocabulary, closure rules, and scopes — every notion that working knowledge organisation treats as out-of-band metadata is, on the predicated substrate, just more substrate content.
