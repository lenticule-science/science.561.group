---
name: theory-of-decidability
type: theorem
status: proved
description: The ¬¬-subtopos of Eff is the Boolean subtheory of computability — the theory of decidable (Δ₁⁰) computation, where every predicate is internally either true or false.
see-also: [theory-of-computability, what-are-the-subtheories-of-computing]
---

# The Theory of Decidability

**Theorem.** The $\neg\neg$-subtopos $\mathbf{Sh}_{\neg\neg}(\mathbf{Eff})$ is the theory of decidable computation. Its internal logic is classical (Boolean): every proposition $P$ satisfies $P \vee \neg P$ internally. It is the unique smallest non-degenerate Lawvere-Tierney subtopos of $\mathbf{Eff}$.

**Proof.**

*The $\neg\neg$ nucleus.* The double-negation map $j = \neg\neg: \Omega_{\mathbf{Eff}} \to \Omega_{\mathbf{Eff}}$ is a Lawvere-Tierney topology: (i) $j(P) \geq P$ since $P \leq \neg\neg P$ in any Heyting algebra; (ii) $j \circ j = j$ since $\neg\neg\neg\neg P = \neg\neg P$ in any Heyting algebra; (iii) $j(P \wedge Q) = j(P) \wedge j(Q)$ since $\neg\neg(P \wedge Q) = \neg\neg P \wedge \neg\neg Q$ in any Heyting algebra. The $j$-sheaves are the objects $X$ for which every proposition is $\neg\neg$-closed: $\neg\neg P \Rightarrow P$ holds internally.

*The internal logic is Boolean.* In $\mathbf{Sh}_{\neg\neg}(\mathbf{Eff})$, the $\neg\neg$-closure forces $P = \neg\neg P$ for all propositions, which is equivalent to the law of excluded middle $P \vee \neg P$. The internal logic is therefore CPC (classical propositional calculus) restricted to the computable realm: every decidable predicate has a total recursive decision procedure by Church-Turing (inherited from $\mathbf{Eff}$), and classical logic licenses the two-valued settling of all predicates.

*The objects are Δ₁⁰ assemblies.* An assembly $(X, r_X)$ is a $\neg\neg$-sheaf iff for every subassembly $U \hookrightarrow X$, if $U$ is $\neg\neg$-dense (its complement has no realizer), then $U = X$. These are exactly the assemblies where every decidable predicate has a computable yes/no answer — the Δ₁⁰ (decidable) predicates.

*Smallest non-degenerate subtopos.* Any nucleus $j$ that forces EM ($j(P \vee \neg P) = \top$ for all $P$) must satisfy $j \geq \neg\neg$ in the nucleus lattice: the $\neg\neg$ nucleus is the meet of all nuclei that force Boolean logic. The only smaller subtopos is the degenerate one-object topos (where all propositions collapse). $\square$
