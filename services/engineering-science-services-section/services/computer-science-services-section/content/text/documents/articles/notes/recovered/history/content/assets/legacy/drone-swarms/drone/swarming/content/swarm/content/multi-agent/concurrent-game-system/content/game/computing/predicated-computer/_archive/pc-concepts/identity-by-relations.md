---
type: concept
class: principle
depends-on: [predication-substrate]
see-also: [vocabulary-completeness, self-representation]
---

# Identity by relations

The principle that an entity in a predicated computer is identified by *which relations it participates in*, not by a class declaration, a stored type, or a position in memory. An entity *is* a Skill by carrying the relations a Skill carries; an entity *is* a Shape by carrying the relations a Shape carries. There is no `type:` field that declares an entity's kind from outside its participation in relations; what the entity *is* follows from what it *does* in the relation graph.

The principle has a precise engineering form known as the *Fregean relation pattern*: frontmatter keys (or whatever the substrate's predicate-naming surface is) **are** relations, not labels for relations. The subject of every predication is implicit — it is the entity itself. The wrong pattern is

```
type: skill
closure-kind: process
```

where `type` and `closure-kind` are structural slots and the values are what carry the meaning. The right pattern is

```
closure-kind: process
```

where the predicate `closure-kind` itself is what makes this entity a Skill. An entity that has no `closure-kind` predication is not a Skill, regardless of any other declaration; an entity that has `closure-kind` *is* a Skill, regardless of whether it declares so.

Three engineering consequences:

- **Validation targets predicates, not classes.** A constraint that classifies entities reaches them through the predicate they carry, not through a declared membership. In SHACL terms, shapes use `sh:targetSubjectsOf <predicate>` rather than `sh:targetClass <ClassName>`. Every entity carrying a predicate $p$ is automatically a target of the shape constraining $p$.
- **There is no global "valid entity" status.** Validity is always relative to a predicate: an entity is valid for predicate $p_1$, valid for predicate $p_2$, and so on. An entity carrying multiple predicates engages multiple shapes independently. A shape covering one predicate has no authority over predicates it does not target.
- **Identity is purely structural.** Two entities with the same set of relations are the same kind of entity. There is no hidden class identity that distinguishes them. This is the substrate's commitment to *participation as the unit of being*, which makes the predication substrate a substrate at all.

The principle is what makes [self-representation](self-representation.md) and [agential self-generation](theories/agential-orchestration-platform/concepts/agential-self-generation.md) coherent: the substrate's own metadata — its rules, its shapes, its operations — are entities by virtue of carrying particular predicates, not by being declared a special class. The same identity-by-relations rule applies to the engine itself as to ordinary content.

## Predicate-bearing surfaces beyond declared relations

The substrate's predicates need not all be declared in a single named-relation surface. Two surfaces typically appear:

- **Declared relations.** The structured, validated relations between entities — what most platform realizations expose as frontmatter, schema fields, or typed reference predicates. These are the substrate's first-class relations: shape-checked, vocabulary-completeness-disciplined, queryable through the substrate's primary operators.
- **Body links.** Less-structured edges within the prose body of an entity (e.g., inline references to other entities by path or hyperlink). Body links are also graph edges in the substrate; they are typically pre-normalization candidates for [entity-maturation](entity-maturation.md) — predications that may resolve into declared relations once their role is determined (becoming `uses:`, `cites:`, `extends:`, etc.).

The substrate's discipline is that *both surfaces are substrate content*: a body link is a real edge; ignoring it leaves the substrate's connectivity incomplete. The substrate's reflection rules (per [entity-maturation](entity-maturation.md)) advance body links toward declared relations as their roles become clear.
