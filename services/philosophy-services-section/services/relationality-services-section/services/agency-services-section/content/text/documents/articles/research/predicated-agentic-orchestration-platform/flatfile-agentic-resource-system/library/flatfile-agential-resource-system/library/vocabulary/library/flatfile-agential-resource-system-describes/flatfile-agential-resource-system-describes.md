---
id: flatfile-agential-resource-system-describes
description: "describes is the aboutness relation — a many-to-many relation between files and concepts declaring that the file contains propositional content informative about the concept, without claiming to be its canonical definition."
extends: Relation
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  document: relational-universe
  concept: relational-universe
output: relational-universe-morphism
ast:
  aboutness-relation:
    - document
    - concept:
        - propositional-content-reduction
title: Flatfile Agential Resource System Describes
---

# Flatfile Agential Resource System Describes

## What this is

`describes` is the **aboutness relation** — a binary relation between a document and a concept declaring that the document contains content informative about the concept.

The mathematical invariant comes from information science and relevance theory. **Aboutness** (Maron 1977; Hutchins 1977) is the relation that holds between a document D and a subject S when D contains propositional content that reduces uncertainty about S — when reading D makes a reasoner better informed about S than before.
Formally: D aboutness S iff there exists a set of sentences Φ_S ⊆ content(D) such that Φ_S is informative about S (increases the probability of correct answers to questions about S).

This is distinct from and weaker than definition:

- **`defines: X`** is a **partial function** from concepts to files — at most one file is the canonical definition of X.
  The definer is the authoritative source; the CamelCase name X refers to this file.
- **`describes: X`** is a **many-to-many relation** — many files may describe the same concept, and one file may describe many concepts.
  No uniqueness constraint.
  No authoritativeness claim.

Formally: `defines` ⊆ Files ×₁ Concepts (a partial injection) while `describes` ⊆ Files × Concepts (an arbitrary binary relation).

The relation is not reflexive in a useful sense (a file about X trivially satisfies any sufficiently weak aboutness criterion).
It is not antisymmetric (two files can mutually describe each other).
It is not transitive (D describes X, X describes Y does not imply D describes Y — the chain is not guaranteed informative).

## When to use describes vs. defines

A file carries `describes: X` when it contains substantive content about X — discussion, characterization, derivation, worked examples — without claiming to be the canonical specification of X.
X may already have a definer elsewhere, or may not yet have one.

A file MUST NOT carry `describes: X` for concepts it merely mentions.
The aboutness relation requires genuine propositional content, not incidental reference.

## Open questions

- Whether the set of `describes` relations should be systematically maintained or is advisory only.
- Whether `describes` is transitive along chains of increasing specificity — a speculative property that would require a formal treatment of the aboutness lattice.
