---
id: id
description: "An Id is a candidate key — an injective, content-independent constant symbol in the language of a scope that denotes exactly one object within that scope and is stable across changes to the object's content."
extends: Relation
date-created: 2026-03-18
date-modified: 2026-03-18
params:
  object: relational-universe
  scope: relational-universe
output: relational-universe-morphism
ast:
  candidate-key:
    - object
    - scope:
        - unique-within-scope
        - stable-under-content-change
        - opaque-to-properties
---

# Id

## What this is

An **Id** is a candidate key: an injective, content-independent name that denotes exactly one object within a scope.

The mathematical invariant comes from the relational model (Codd 1970). In a relation R over attributes A₁, ..., Aₙ, a **superkey** is a subset K ⊆ {A₁,...,Aₙ} whose values jointly determine the tuple — no two distinct tuples agree on all K-values. A **candidate key** is a minimal superkey. An **id** in a single-attribute key: a single attribute K = {A_k} whose value uniquely determines the object within R.

In model-theoretic terms: an id is a **constant symbol** c in the language L with a fixed interpretation c^M = a in model M. The naming function n: Ob → Names must be **injective within scope**: no two distinct objects receive the same name. The id denotes a without saying anything about a — that is the job of [Description](description.md).

Three properties that make a symbol an id rather than just a label:

1. **Uniqueness within scope** — n is injective: n(a) = n(b) implies a = b in the scope.
2. **Stability** — n(a) is invariant under changes to a's content. If the object's properties change, its id does not.
3. **Opacity** — the id does not encode the object's properties. An id like `doc-42` is opaque. An id like `senior-english-document` conflates naming with description — it encodes properties that may become false.

Stability and opacity together enforce the **separation of concerns** between addressing and characterizing: you cite an object by its id, you understand it by its description.

## Id in category theory

In a category C, objects are identified only **up to isomorphism** — there is no canonical name for an object, only its universal properties. An id breaks this identification: it assigns a canonical representative to each isomorphism class. This is exactly what condition 2 of U_G requires — isomorphism closure gives canonical representatives, and an id names them.

In URI theory (RFC 3986): a URI is an id for a resource — a string that names it uniformly, independently of its current location or representation. The key requirement is that the URI denotes the resource, not describe it.

## In this system

An id is the frontmatter `id:` field of a spec file — a lowercase hyphenated string that names the entity within the spec locale. The defined term (`RelationalConceptPackage`) is the name of the concept; the id (`relational-concept-package`) is the canonical address of the file that specifies it.

## Open questions

- Whether ids must be globally unique across all locales or only locally unique within a scope — equivalent to asking whether the naming function is a global injection or a family of local injections.
