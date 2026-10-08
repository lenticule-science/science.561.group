---
name: concept
description: An entity that names and defines a term, idea, or theoretical primitive — a vocabulary commitment the filestore makes that other entities can reference.
title: concept
---

A concept entity names one term the theory is committed to.
In the [predication-fibration](predication-fibration.md) $(\mathbf{FOUR}, \mathcal{C}, E)$, concepts are members of $E$ whose kind-classifier is `concepts/`.
They carry no frontmatter beyond `name:` and `description:` unless a [transformer](transformer.md) cell is predicated on them.

Concepts serve as the shared vocabulary that other entities reference.
A structure entity may declare that it instantiates a concept.
A claim entity may assert that a concept's extension has a given property.
Transformers may be defined in terms of concepts.
The concept entity itself is the substrate's record that this term exists and has a definition — not just an implicit assumption in prose.

Per AgOP's agential-self-generation invariant, concepts are operative elements of the substrate: agents reason with them, closure rules pattern-match on them, federation handshakes align on them.
They must therefore be substrate entities rather than free-floating vocabulary.

A concept differs from a [structure](structure.md): a structure declares an entity-form (a class of entities the substrate commits to instantiating); a concept defines a term (a piece of vocabulary the substrate commits to having a meaning for).
The distinction is between "there will be Foo entities in this filestore" and "the word 'foo' means this thing here."
