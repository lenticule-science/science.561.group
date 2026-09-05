---
type: claim
status: proved
depends-on:
  - ../code/structures/eff.md
  - ../code/structures/pca.md
see-also:
  - ../questions/what-is-the-theory-of-computing.md
references:
  - Hyland 1982
  - Carboni-Celia-Magno 1982
  - Cockett-Hofstra 2008
  - Rosolini 1986
---

# Eff is the minimum level for the theory of computing

## Statement

The effective topos $\mathbf{Eff} = RT(\mathcal{K}_1)$ is the minimum categorical level required for the theory of computing. The two lower levels — Turing categories (level a) and CCCs with dominance (level b, modest sets) — are insufficient.

Precisely: any adequate theory of computing must internally state and prove its characteristic undecidability results — halting undecidability and Rice's theorem. Only level (c), $\mathbf{Eff}$, can do this.

## Proof

The proof identifies three conditions required for the internal halting-undecidability diagonal argument, then shows that only $\mathbf{Eff}$ satisfies all three.

**Required conditions.** The diagonal argument runs as follows: assume a total boolean decider $d: \mathbb{N} \times \mathbb{N} \to \mathbf{2}$ for halting exists internally. Define $c$ via Kleene's second recursion theorem such that $\phi_c(n) \downarrow \Leftrightarrow d(c, n) = 0$. Then $\mathrm{halt}(c, c) \Leftrightarrow \neg\mathrm{halt}(c, c)$ — contradiction. This argument requires:

1. A subobject classifier $\Omega$ so that $\mathrm{halt}: \mathbb{N} \times \mathbb{N} \to \Omega$ is a well-formed internal predicate.
2. The exponential $\mathbb{N} \times \mathbb{N} \to \mathbf{2}$ as an internal object, so "all total boolean functions" can be internally quantified over.
3. Kleene's second recursion theorem as an internal theorem, so the fixed-point $c$ can be constructed inside the logic.

**Level (a) — Turing categories.** A Turing category (Cockett-Hofstra 2008) is a restriction category with a Turing object $T$ encoding universality of computation. It has no internal logic: no subobject classifier, no first-order quantification, no internal predicates. Conditions (1)–(3) all fail. Church-Turing is the structural axiom of $T$'s universality, not a theorem; Rice's theorem is unstatable.

**Level (b) — CCC with dominance (modest sets).** $\mathbf{PAsm}(\mathcal{K}_1)$ (partitioned assemblies / modest sets, Rosolini 1986) is a CCC with a partial-map classifier $\Sigma \hookrightarrow \Omega$. It supports typed denotational semantics. But $\mathbf{PAsm}$ is not an elementary topos: it lacks a subobject classifier (the exact completion step that produces $\Omega_{\mathbf{Eff}}$ has not been performed). Condition (1) fails; halting is only statable in the external meta-language. Conditions (2) and (3) consequently also fail at the level of internal logic.

**Level (c) — $\mathbf{Eff}$.** $\mathbf{Eff} = \mathrm{ex}(\mathbf{Asm}(\mathcal{K}_1))$ is the exact completion of assemblies (Carboni-Celia Magno 1982). It adjoins quotients of all equivalence relations and produces a full elementary topos. Its subobject classifier $\Omega_{\mathbf{Eff}} \cong \{\text{r.e. sets}\}/{\sim}$ satisfies (1). Kleene's second recursion theorem is an internal theorem of $\mathbf{Eff}$ — the fixed-point of the substitution morphism on the Turing object — satisfying (3). The exponential required by (2) exists by the topos axioms.

Rice's theorem follows by the same argument: it requires internal quantification over all behavioral predicates (extensional $\mathbb{N} \to \mathbf{2}$ functions), which is an internal statement unstatable at levels (a) or (b).

## Significance

This establishes $\mathbf{Eff}$ as the canonical structure for the theory of computing — not by convention but by necessity. Level (b) is the correct level for typed programming language semantics; level (a) for computational infrastructure. But the theory that *proves* Church-Turing and Rice, treating them as theorems rather than axioms, requires level (c).
