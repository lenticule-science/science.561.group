---
title: Free and Quotient Act Simulation
keywords:
  - simulation
  - algebra
  - quotient
depends_on:
  - theorem/external/relational-free-and-quotient-acts
---
# Free and Quotient Act Simulation

This specification describes how to simulate **Theorem (Relational Free and
Quotient Acts)** by working with syntax-level views over earned terms and
recognitions and enforcing earned invariances via quotients.  It does not
introduce a separate global store; all syntax trees and normal forms are
derived from the existing judgment-calculus and act structure.

## State representation

- **Syntax tree view.**  
  A finite or symbolic view of judgment-calculus terms and their normal forms,
  obtained from the existing term constructors and reduction structure.  Each
  node may carry a reference to the corresponding recognition trace; no
  independent “syntax database” is introduced.

- **Reduction engine.**  
  A simulation wrapper around the earned reduction and normalization acts
  (`Reduce`, `NormalizeStrongly`, `EquateContexts`, etc.) used to normalise
  syntax trees in this view.

- **Invariance predicates.**  
  A collection of predicates `P: NF -> {true,false}` representing earned
  invariances over normal forms (for example, those arising from normalization
  and equivalence theorems).

- **Congruence structure.**  
  A derived equivalence relation `≡` on normal forms, represented by some
  convenient data structure (e.g., union–find) and justified solely by the
  invariance predicates and earned equalities.

## Inputs

1. Formation rules encoded as constructors for syntax trees.
2. Reduction rules and invariance predicates.
3. Optional scoring/ordering functions for comparing normal forms.

## Procedures

1. **Formation.**  
   Generate new syntax trees via formation rules; insert them into the database.

2. **Reduction.**  
   Normalise each tree by applying reductions until fixed; record the path.

3. **Invariance checks.**  
   Evaluate predicates on normal forms; if all predicates agree between two
   forms, merge them in the congruence structure.

4. **Quotient construction.**  
   Build the quotient set `Quot(C)` by taking representatives from each class.

## Invariants

- Reduction must terminate (per `NormalizeStrongly` if applicable).
- Invariance predicates must be preserved by every reduction step.
- Congruence classes should be closed under formation/reduction operations.

## Outputs

- Free act elements (normal forms) with derivation history.
- Quotient classes with representative mappings.
- Logs of invariance checks and any violations.
