---
id: description
description: "A Description is a separating predicate for an object — a formula φ(x) that holds of the described object and distinguishes it from other objects of the same type within the intended domain of discourse."
defines: Description
extends: Relation
date-created: 2026-03-18
date-modified: 2026-03-18
params:
  object: relational-universe
  separating-formula: predicate-formula
output: relational-universe-morphism
ast:
  separating-predicate:
    - object
    - separating-formula:
        - definite-description-operator
        - type-context
---

# Description

## What this is

A **Description** is a separating predicate: a formula that holds of an object and distinguishes it from others of the same type within its domain.

The mathematical invariant comes from Russell (1905, "On Denoting") and model theory. Russell's **definite description** operator ιx.φ(x) — "the x such that φ(x)" — is meaningful in a domain D iff the formula φ(x) has exactly one satisfying instance in D: ∃!x ∈ D. φ(x). The formula φ is then the description; ιx.φ(x) is the described object.

In model theory: element a of model M is **definable** iff there exists a formula φ(x) in the language L(M) such that M ⊨ φ(a) and for all b ≠ a in M, M ⊨ ¬φ(b). The formula φ then describes a uniquely within M.

For practical use, full uniqueness is stronger than required. The useful weakening: a **separating predicate** φ for object a with respect to type T in domain D is a formula such that M ⊨ φ(a) and for all other b ∈ T, M ⊨ ¬φ(b) — sufficient separation within type T, not necessarily within all of D.

The invariant: **a description of a is a predicate φ that witnesses a's distinctness from same-typed objects in context.** It is not a name (that is an [Id](id.md) — an opaque address). It is not an extension (what a contains or produces). It is the characterizing formula that makes a findable and distinguishable.

## Address vs. characterization

An Id and a Description serve complementary roles. In model-theoretic terms:

- An **id** is a **constant symbol** c in L(M) with c^M = a — it denotes a without saying anything about a.
- A **description** is a **formula** φ(x) such that M ⊨ φ(a) — it characterizes a without necessarily naming it.

A description without an id is a characterization you cannot cite. An id without a description is an address you cannot interpret. Together they constitute a self-describing object: one that can be both cited and understood from the description alone.

## In this system

A description travels with the node as the frontmatter `description:` field, making the node **self-describing**: any reader encountering it out of context receives the separating predicate immediately. The description is the minimum φ(x) that distinguishes this node from same-typed nodes in the spec locale.

## Open questions

- Whether there is a completeness condition: when is a description *sufficient* (enough for retrieval) vs. *complete* (logically definining)?
- Whether descriptions in this system correspond formally to sections of a sheaf of predicates over the type-indexed nodes.
