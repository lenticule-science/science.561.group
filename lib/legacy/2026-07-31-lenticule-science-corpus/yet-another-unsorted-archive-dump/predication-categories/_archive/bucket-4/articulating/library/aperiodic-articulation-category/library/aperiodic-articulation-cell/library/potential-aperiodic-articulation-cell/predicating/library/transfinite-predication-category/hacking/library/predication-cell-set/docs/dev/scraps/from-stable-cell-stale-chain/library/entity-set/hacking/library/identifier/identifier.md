---
name: identifier
description: "A value-layer primitive — a member of a set I equipped with an injection I -> surface that distinguishes its referent from other members. The most basic addressing primitive; specific identifier kinds (name, URI, UUID, content-hash) specialize it by narrowing the value-shape."
specializing: thing
references:
  - id: bourbaki1970
    type: book
    title: Théorie des Ensembles
    series: Éléments de Mathématique
    publisher: Hermann
    location: Paris
    author:
      - literal: Bourbaki, Nicolas
    issued:
      - year: 1970
  - id: maclane1971
    type: book
    title: Categories for the Working Mathematician
    series: Graduate Texts in Mathematics
    volume: 5
    publisher: Springer-Verlag
    location: New York
    author:
      - literal: Mac Lane, Saunders
    issued:
      - year: 1971
---

An **identifier** is a value-layer primitive: a member $i \in I$ of an identifier-set $I$ equipped with an injection $I \hookrightarrow \Sigma$ into a surface form-set $\Sigma$ [@bourbaki1970, Ch. II §3]. The injection condition is what gives an identifier its distinguishing role — two identifiers with the same surface form are equal as identifiers.

Identifiers are *value-layer* in the sense that they are atomic values, not structured records. The serialized form of an identifier is a single string; the schema for an identifier instance is `type: "string"`. This distinguishes identifiers from [things](../thing/thing.md), which are object-shaped records.

Specific identifier kinds specialize the identifier base by adding constraints on the value-shape:

- A [name](../name/name.md) is an identifier whose surface form is a kebab-case slug.
- A URI is an identifier whose surface form parses against RFC 3986.
- A UUID is an identifier whose surface form parses against RFC 4122.
- A content-hash is an identifier whose surface form is the hex digest of a hash function applied to canonical bytes.

The specialization is recorded by the specializing identifier kind via a `specializing: identifier` cell in its entity record's frontmatter. The JSON Schema relationship is independent: a specializing schema may `allOf` the identifier schema (which adds no constraint beyond non-emptiness), or may declare its constraints directly. The math-layer specialization is the load-bearing fact; the schema composition is a tooling choice.

The `$dynamicAnchor: "identifier-shape"` on the schema lets specializing kinds reference identifier's value-shape dynamically. Used together with category-theoretic specialization morphisms, the anchor lets schema-level checks line up with math-level specialization predications.
