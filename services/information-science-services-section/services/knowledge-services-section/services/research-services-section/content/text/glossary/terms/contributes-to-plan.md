---
inversion: contributed-to-by-milestone
---

# contributes-to-plan

`contributes-to-plan` is declared on a milestone's frontmatter to name the plan it serves. The inversion cascade emits the reciprocal view at the plan subject so `(M, contributes-to-plan, P)` yields `(P, contributed-to-by-milestone, M)`.

Note: the current inversion morphism (see `engine/packages/predication-algebra/morphisms/inversion.js`) negates the bilattice value on the derived claim. That semantics may need review for reciprocal-view use; preserved here as-declared.
