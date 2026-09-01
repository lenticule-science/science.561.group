---
name: trace-derivation
description: Trace the derivational chain for a concept through the vault
---

Trace: $ARGUMENTS

## Instructions

Follow the derivational relationships for a concept.

1. Find the concept's page (search terms/, concepts/, and other
   directories across disciplines).
2. Read its frontmatter and body for relationship fields:
   - `derivesFrom` / derives from
   - `produces` / produces
   - `requires` / requires
   - `dualOf` / dual of
   - `incites` / incites
3. Follow each relationship one level: read the linked pages and
   note THEIR relationships.
4. If there's a TTL encoding (ontology.ttl or colocated .ttl),
   check whether the RDF relations match the markdown claims.

Report the derivational chain as a list:
```
X derives from A, B
X produces C
X is dual of D
C requires X, E
```

Note any inconsistencies (markdown says one thing, TTL says another;
a relationship is claimed but not reciprocated).
