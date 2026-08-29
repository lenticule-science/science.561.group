---

name: fragment-preserving
  - "fragment preserving"
  - "fragment-preserving"
  - "Fragment-preserving"
date-created: 2025-12-31
introduces: term
tags: []
defines:
  - "Fragment-Preserving"
  - "fragment preserving"
---

An operation is fragment-preserving if it maps each [fragment](./fragment.md) back into itself — the fragment's closure structure survives the operation.

A fragment F is a finitely generated modal-temporal [Heyting](../../../../../../../../../library/references/people/arend-heyting.md) subalgebra of the semantic domain, carrying its own assumptions, claims, and derivation rules. An operation φ is fragment-preserving with respect to F when φ(F) ⊆ F: applying the operation to elements of the fragment produces results that remain within the fragment. The fragment's internal closure — its ability to derive all consequences of its assumptions under its rules — is not disrupted.

This constraint matters because fragments encode scoped reasoning. A mathematical fragment has proof rules; an implementation fragment has resource bounds. A fragment-preserving operation respects the boundary between these contexts. An operation that is not fragment-preserving risks [illicit globalism](../../../../terms/illicit-globalism.md): it may drag elements from one fragment into another, silently changing the assumptions under which claims are justified.

In the Agential Semioverse, skill execution is required to be fragment-preserving: an agent running a skill within a fragment must not introduce claims or assumptions from outside that fragment's scope without explicit declaration.
