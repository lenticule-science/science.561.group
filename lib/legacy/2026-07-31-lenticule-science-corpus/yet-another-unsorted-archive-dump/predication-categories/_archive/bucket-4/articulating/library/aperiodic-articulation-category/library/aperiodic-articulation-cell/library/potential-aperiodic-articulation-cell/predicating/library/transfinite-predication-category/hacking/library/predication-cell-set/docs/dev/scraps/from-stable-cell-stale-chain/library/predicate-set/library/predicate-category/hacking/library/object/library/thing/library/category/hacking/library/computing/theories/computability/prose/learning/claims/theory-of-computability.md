---
name: theory-of-computability
type: theorem
status: proved
description: The effective topos Eff = RT(K₁) is the theory of discrete deterministic computation — the minimum categorical level at which Church-Turing and Rice's theorem are internal theorems rather than axioms.
see-also: [what-is-the-theory-of-computing, what-are-the-subtheories-of-computing]
---

# The Theory of Computability

**Theorem.** The effective topos $\mathbf{Eff} = RT(\mathcal{K}_1)$ — the realizability topos over Kleene's first algebra — is the canonical theory of discrete deterministic computation. Its internal logic is IPC + CT + MP + WEM. It is the minimum level at which Church-Turing and Rice's theorem are internal theorems.

**Proof.**

*Level (c) is required.* To internally state and prove the halting undecidability theorem, a theory of computing needs: (i) a subobject classifier $\Omega$ so that the halting predicate $\mathrm{halt}: \mathbb{N} \times \mathbb{N} \to \Omega$ is a well-formed internal predicate; (ii) the exponential $\mathbb{N} \times \mathbb{N} \to \mathbf{2}$ as an internal object, to quantify over all total boolean functions; (iii) Kleene's second recursion theorem as an internal theorem, to construct the fixed point in the diagonal argument. Level (a) — Turing categories — has none of these. Level (b) — modest sets — has no subobject classifier. Only level (c), an elementary topos with realizability structure, has all three.

*$\mathcal{K}_1$ is the canonical PCA.* $\mathcal{K}_1 = (\omega, \cdot)$ with $a \cdot b = \varphi_a(b)$ is the initial Turing-complete PCA: every Turing-complete PCA $A$ admits an applicative morphism $\mathcal{K}_1 \to A$. The total $\mathbb{N} \to \mathbb{N}$ functions realizable in $\mathcal{K}_1$ are exactly the partial recursive functions — minimal and universal. Under Church-Turing, $\mathcal{K}_1$ is the unique (up to isomorphism) minimal Turing-complete PCA.

*Church-Turing is an internal theorem.* In $\mathbf{Eff}$, the natural numbers object is the assembly $(\omega, r)$ with $r(n) = \{n\}$. Every total internal function $\mathbb{N} \to \mathbb{N}$ has a Kleene-index realizer by construction of $\mathcal{K}_1$. The statement "every total $\mathbb{N} \to \mathbb{N}$ function is computable" is therefore internally provable — a theorem, not an axiom.

*Rice's theorem is an internal theorem.* Any non-trivial extensional predicate $P$ on programs — one that cannot distinguish extensionally equal programs — is undecidable. The internal proof: assume a total boolean decision procedure $d: \mathbb{N} \times \mathbb{N} \to \mathbf{2}$ for $P$. By Kleene's second recursion theorem (itself an internal theorem of $\mathbf{Eff}$ as the fixed-point of the substitution morphism on the Turing object), construct $c$ such that $P(c) \Leftrightarrow \neg P(c)$ — contradiction. This argument requires internal first-order quantification over all programs, available only at level (c).

*The subtheory lattice.* The lattice of subtheories of $\mathbf{Eff}$ — its Lawvere-Tierney topologies — is isomorphic to the filter lattice of the Medvedev lattice $\mathbf{M}$ (via the identification of $\Omega_{\mathbf{Eff}}$'s internal Heyting structure with $\mathbf{M}$'s Brouwerian structure and the verification that the Heyting implication in $\Omega_{\mathbf{Eff}}$ coincides with the Medvedev pseudo-complement). This lattice is uncountably infinite. The boundary subtheories are $\mathbf{Eff}$ itself (trivial filter) and the $\neg\neg$-subtopos (filter of solvable mass problems). $\square$
