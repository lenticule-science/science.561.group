---
type: claim
status: proved
depends-on:
  - ../code/structures/eff.md
see-also:
  - ../questions/what-are-the-subtheories-of-computing.md
  - arithmetical-hierarchy-excludes-from-subtopos-lattice.md
  - modified-realizability-is-a-sibling-topos.md
references:
  - Hofmann 1997
  - Bellantoni-Cook 1992
  - Lafont 2004
  - Girard 1998
title: Complexity theory is not a subtopos of Eff
description: No Lawvere-Tierney topology on $\mathbf{Eff}$ produces a subtopos whose morphisms are restricted to resource-bounded functions.
---

# Complexity theory is not a subtopos of Eff

## Statement

No Lawvere-Tierney topology on $\mathbf{Eff}$ produces a subtopos whose morphisms are restricted to resource-bounded functions. Complexity theory (polynomial-time, elementary-time, or any resource-bounded class) cannot be a subtopos of $\mathbf{Eff}$. The obstruction is structural: the Cartesian axioms of topos theory are incompatible with resource-bounded exponentials.

## Proof

A Lawvere-Tierney topology $j: \Omega_{\mathbf{Eff}} \to \Omega_{\mathbf{Eff}}$ produces a subtopos $\mathbf{Sh}_j(\mathbf{Eff})$ that is an elementary topos. Elementary toposes are Cartesian closed: the exponential object $B^A$ exists for all objects $A$, $B$ and contains all internal maps $A \to B$ with no resource restriction. Cartesian closure implies unrestricted *contraction* (diagonals $A \to A \times A$, modeling unlimited reuse of a value) and *weakening* (projections $A \times B \to A$, modeling unlimited discard). These are consequences of the Cartesian axioms and are preserved under sheafification: any subtopos of an elementary topos is itself an elementary topos, hence Cartesian closed with the same structural rules.

Resource-bounded computation requires restricting precisely these structural rules. Restricting the exponential $B^A$ to resource-bounded maps requires restricting contraction and weakening — which is exactly what linear and substructural type systems do. These systems live in $*$-autonomous or linearly-distributive categories (soft linear logic, Lafont 2004; light linear logic, Girard 1998; safe recursion, Bellantoni-Cook 1992; polynomial-time type theory, Hofmann 1997), which are not Cartesian closed and therefore not toposes.

Polynomial-time functions also fail to form a PCA directly: the self-application $a \cdot a$ required by a PCA's substitution axiom forces computing the running time of the interpreter applied to itself, which is not polynomial in $a$. There is no realizability topos $RT(A)$ for a polynomial-time PCA $A$, because no such PCA exists.

**Conclusion.** The impossibility is not a gap in current constructions but a consequence of what "subtopos" means. Any subtopos of $\mathbf{Eff}$ inherits full Cartesian structure; full Cartesian structure is incompatible with resource-bounded exponentials.

## Significance

Complexity theory is not a subtheory of $\mathbf{Eff}$ in the strict sense. It is a restriction at the morphism level of $\mathbf{Asm}(\mathcal{K}_1)$ (the Turing category level, below $\mathbf{Eff}$), not a closed fragment of $\mathbf{Eff}$'s internal logic. Resource-bounded complexity sits in a different categorical world — $*$-autonomous categories — where the typed subtheory lattice (linear logic fragments) is the right structure, not the subtopos lattice.
