---
id: package
description: "A Package is a named carrier equipped with an explicit boundary signature — a set of exported names declaring what the package presents to the outside, with everything else internal."
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  carrier: relational-universe
  signature: relational-universe-morphism
output: relational-universe
ast:
  boundary-signature-pair:
    - carrier
    - signature:
        - carrier
---

# Package

## What this is

A **Package** is a named carrier equipped with an explicit boundary signature.

The mathematical invariant comes from module theory in programming language semantics (ML structures, Standard ML of New Jersey; Haskell modules). A **module** in this sense is a triple (N, C, Σ) where:

- **N** is the module name — a canonical identifier for the whole
- **C** is the carrier — the set of definitions, values, or objects that exist inside the module
- **Σ ⊆ C** is the signature — the subset of C that is **exported** (visible from outside the module boundary)

The boundary is defined by the signature: what is in Σ is public; what is in C \ Σ is private. Two modules with the same N, C, and Σ are equal regardless of their internal organization. The package identity is the pair (N, Σ) — the name and what it presents — not the internal implementation.

In type theory: a package is a **record type at the collection level** — the signature Σ is a record type whose fields are the exported names. Providing a package = providing a term of that record type drawn from the carrier C.

This is what distinguishes a package from a bare set or a collection: a set has no exported interface; a package explicitly declares one. The interface is the contract that consumers rely on; the carrier is what implements it.

## Cohesion

The carrier C is not an arbitrary collection. Items in C are related by **cohesion**: they belong together because they serve the same purpose, share the same subject, or operate on the same carrier set. Cohesion is the principle that makes the package a meaningful unit rather than an arbitrary bundle.

In module theory: cohesion is enforced by the **subject matter** of the module — all definitions in a `List` module are about lists. In this system: cohesion is enforced by the concept the package organizes (see [ConceptPackage](concept-package.md)).

## Open questions

- Whether a package requires an explicit manifest (a declared Σ) or whether colocation alone (same directory) is sufficient to constitute a boundary.
- Whether the exported signature Σ is an additional required field or derivable from the structure of the package's contents.
