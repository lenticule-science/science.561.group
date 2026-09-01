---
name: learn-logic
description: Learn propositional and first-order logic — syntax, semantics, proof systems — sufficient to state which logic is in use and why its entry conditions apply.
---

# Learn Logic

The formal foundations: propositional logic (variables and connectives), first-order logic (quantifiers and predicates), the distinction between syntax (formal expressions and their derivations) and semantics (interpretations and satisfaction), and the major proof systems (natural deduction, sequent calculus, Hilbert systems).

## What you will be able to do

- Read a formal logical statement (propositional or first-order) and identify its syntactic structure.
- Distinguish syntactic from semantic claims: derivability ($\vdash$) versus validity ($\models$), and state the soundness and completeness theorems that connect them.
- Carry out simple natural-deduction proofs in propositional and first-order logic.
- State which logic is being used in a given setting (classical, intuitionistic, modal, paraconsistent) and articulate why its entry conditions apply.

## Reference

- `library/domains/humanities/domains/math/domains/logic/` — the logic domain.

## Verification

Take a small theorem of propositional logic (e.g., $p \to (q \to p)$) and prove it in natural deduction. Then state the meta-theoretic content: that the syntactic derivation is matched by semantic validity (every truth-assignment satisfying the premises satisfies the conclusion), and name the soundness theorem as the bridge.
