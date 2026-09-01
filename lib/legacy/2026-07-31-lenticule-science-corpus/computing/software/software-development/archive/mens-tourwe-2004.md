---
type: reference
status: draft
---

# Mens & Tourwé 2004 — *A Survey of Software Refactoring*

Mens, Tom & Tourwé, Tom (2004). "A Survey of Software Refactoring." *IEEE Transactions on Software Engineering* 30(2): 126–139.

Comprehensive survey covering the field circa 2004: refactoring catalogs, formal foundations, tool support, refactoring detection, refactoring impact analysis, and emerging research directions. Maps the disciplinary terrain at a maturity point — twelve years after Opdyke, five years after Fowler — and identifies several open problems that motivate later work.

## What the substrate framing borrows

- **The formal-foundations taxonomy.** Mens & Tourwé classify refactoring formalizations into *graph-rewriting*, *invariant-preservation*, and *program-equivalence* approaches. The substrate framing is most naturally a version of the third (refactorings are equivalences in the codebase-cell-system's automorphism group) but technically delivers all three: graph-rewriting because the catalog generates a Cayley graph (see [refactor-graph](teaching/explanations/refactor-graph.md)); invariant-preservation because the witness sheaf is the substrate's encoding of invariants.
- **The composition-of-refactorings problem.** Mens & Tourwé identify the safe-composition question as open. The substrate's [refactoring-closed-under-composition](../theorems/refactoring-closed-under-composition.md) answers it for fixed-witness-language sequences; the open part — what to do when witness languages change — corresponds to the residual disciplinary question.

## What the substrate framing adds

A unified formalization that covers the multiple frameworks Mens & Tourwé survey: graph-rewriting, invariant-preservation, and program-equivalence are recovered as different views on the same substrate-algebraic structure (Cayley graph of the catalog generators in $N_W$, action on $\mathcal{F}^{\mathrm{code}}_W$, automorphism-group equivalence in $\mathrm{Aut}^\simeq(v^{\mathrm{code}})$). The 2004 survey's frameworks were developed independently; the substrate identifies them as facets of one object.
