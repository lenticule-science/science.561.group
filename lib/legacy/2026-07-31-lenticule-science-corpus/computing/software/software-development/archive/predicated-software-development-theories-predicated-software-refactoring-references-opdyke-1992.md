---
type: reference
status: draft
---

# Opdyke 1992 — *Refactoring Object-Oriented Frameworks*

Opdyke, William F. (1992). *Refactoring Object-Oriented Frameworks*. PhD dissertation, University of Illinois at Urbana-Champaign.

The original academic treatment of refactoring as a class of behavior-preserving program transformations. Pre-dates Fowler's catalog and develops a more formal foundation: Opdyke characterizes refactorings by *invariants* they preserve, develops preconditions in terms of program properties, and proves correctness for a small set of transformations.

## What the substrate framing borrows

- **The invariant-preservation framing.** Opdyke's "behavior-preserving transformations preserve a set of program invariants" maps directly onto the substrate-algebraic claim that refactorings fix $\mathcal{F}^{\mathrm{code}}_W$ — the witness sheaf is the substrate-algebraic content of "the invariants the project chose to track."
- **The precondition discipline.** Opdyke's preconditions for each refactoring are reinterpreted as conditions ensuring the transformation is in $\mathrm{Aut}^\simeq(v^{\mathrm{code}})$ (an automorphism, not merely a partial map) and lies in $N_W$ (acts trivially on the witness sheaf).

## What the substrate framing adds

Opdyke's invariants are program-internal (no two definitions share a name, every variable reference resolves, etc.). The substrate framing makes the invariants *observer-relative*: which invariants matter is a function of $W$. This generalizes Opdyke's framework to admit witness languages whose invariants are external (consumer behavior, monitoring outputs, deployment artifacts).

Opdyke's correctness proofs are case-by-case, transformation-by-transformation. The substrate-algebraic theorem [refactor-as-invisible-automorphism](../theorems/refactor-as-invisible-automorphism.md) is general: every transformation in $N_W$ is correct under $W$, by the cohomology argument. Opdyke's case-proofs become *verifications that particular transformations land in $N_W$* under a particular witness language.
