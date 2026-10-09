---
id: operation
description: "An Operation is an n-ary endofunction on a carrier set: it maps the carrier within itself. Distinguished from a Function by being internal — it acts on a structure rather than mapping between structures."
date-created: 2026-03-18
date-modified: 2026-03-18
params:
  carrier-set: set
  arity: natural-number
output: function
ast:
  internal-relation-closure:
    - carrier-set
    - arity

---

# Operation

## What this is

An **Operation** on a carrier A is a map

$$\omega : A^n \longrightarrow A$$

for some arity n ≥ 0.
It takes n elements of A and produces an element of A.
It is internal: it maps A within itself, not to a different object.

This is the mathematical sense shared by:

- **Universal algebra**: an n-ary operation on a set A is a function A^n → A; the operations of an algebra are what give the carrier its algebraic structure.
- **Machine operations**: an instruction (ADD, LOAD, STORE) takes values from registers and writes a result back to a register — the carrier (register state) maps to itself.
- **Surgical operations**: a procedure acts on a patient (the carrier) and produces a changed state of that same patient — the carrier is the same before and after.

Here **operation** means a total n-ary operation. Partial operations and currying are separate notions.

## Distinction from Function

A [Function](./function.md) f : A → B maps *between* objects.
An Operation ω : A^n → A maps *within* an object.

The distinction matters when reasoning about whether something transforms a structure internally (Operation) or bridges two structures (Function).
Both are present in any non-trivial algebraic structure.

## Arity

A 0-ary operation is a constant: it picks a distinguished element of A.
A 1-ary (unary) operation maps A → A: a closure operator or endomorphism.
A 2-ary (binary) operation maps A × A → A: a product, a meet, a concatenation.

The nuclei σ, Δ are unary operations (closure operators) on the fiber H_t.
The monoidal product ⊛ is a binary operation on R.
The universe closure U_G is a unary operation on classes of objects of R.

## Open questions
