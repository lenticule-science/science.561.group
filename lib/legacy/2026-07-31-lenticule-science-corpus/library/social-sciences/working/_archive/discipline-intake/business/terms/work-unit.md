---
id: work-unit
description: "A WorkUnit is a ground term in the free algebra over the operational signature — a fully instantiated Work invocation with no free variables, where all parameters are bound to concrete values."
extends: Work
component-of: OperationItem
date-created: 2026-03-18
date-modified: 2026-03-18
---

# WorkUnit

## What this is

A **WorkUnit** is a ground term in the free algebra over the operational signature — a Work invocation with all variables substituted by concrete values.

The mathematical invariant comes from universal algebra and the theory of free algebras. Given a signature Σ and a variable set X, the **free algebra** T(Σ, X) is the set of all well-formed terms built from operation symbols in Σ and variables in X. A **ground term** is an element of T(Σ, ∅) — the free algebra with no variables. Every symbol in a ground term is bound to a concrete value; nothing is left open.

The hierarchy:

- **[Operation](operation.md)** is an operation symbol ω ∈ Σ with arity n — the abstract type.
- **[Work](work.md)** is an application ω(a₁,...,aₙ) where the aᵢ may be variables — the operation being enacted.
- **WorkUnit** is a ground application ω(c₁,...,cₙ) where every cᵢ is a closed, concrete value — T(Σ, ∅). No variables remain.

A WorkUnit is **completely determined**: it names exactly one invocation of exactly one operation on exactly specified inputs. Two WorkUnits with the same operation but different parameter values are different ground terms and therefore different WorkUnits.

A WorkUnit with free variables is a **template** (an open term in T(Σ, X)), not a WorkUnit. Templates are skill definitions; WorkUnits are instances.

## Structure

Every WorkUnit is characterized by four fields, corresponding to the ground term's components:

- **takes**: the input type — what goes in (the domain of the operation)
- **affected**: which aspect of the input changes (the field being modified, not the whole carrier)
- **operation**: the operation symbol ω being invoked (references a skill type or names the operation directly)
- **parameters**: the concrete values c₁,...,cₙ instantiating this invocation — what closes the open term into a ground term

A WorkUnit without fully specified parameters is not yet a WorkUnit; it is an open term awaiting substitution.

## Atomicity

A WorkUnit is the most atomic executable thing in the system. It cannot be decomposed further without losing what makes it a unit: a single named output produced by a single named operation on named inputs. Decomposition that preserves the ground-term property produces sub-WorkUnits, not the same WorkUnit.

## Open questions

- Whether WorkUnit parameters correspond to the substitution σ: X → T(Σ, ∅) in the free algebra — i.e., whether parameterization is formally a substitution homomorphism.
- Whether a WorkUnit IS the Term kind for executable work, making the term/work-unit distinction a typing distinction within T(Σ, ∅).
