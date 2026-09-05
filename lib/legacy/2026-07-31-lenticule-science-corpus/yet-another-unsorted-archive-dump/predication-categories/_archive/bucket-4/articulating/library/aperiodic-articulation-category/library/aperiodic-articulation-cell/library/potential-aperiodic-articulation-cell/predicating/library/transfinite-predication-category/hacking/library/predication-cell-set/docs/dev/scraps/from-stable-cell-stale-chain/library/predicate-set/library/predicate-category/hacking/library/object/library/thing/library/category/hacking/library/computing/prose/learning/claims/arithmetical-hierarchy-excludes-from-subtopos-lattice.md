---
type: claim
status: proved
depends-on:
  - ../code/structures/eff.md
  - ../code/transformers/applicative-morphism.md
see-also:
  - ../questions/what-are-the-subtheories-of-computing.md
  - complexity-excludes-from-subtopos-lattice.md
  - modified-realizability-is-a-sibling-topos.md
references:
  - van Oosten 2008
  - Soare 1987
---

# The arithmetical hierarchy is not a subtopos tower

## Statement

The arithmetical hierarchy $\mathcal{K}_1 <_T \mathcal{K}_1^{0'} <_T \mathcal{K}_1^{0''} <_T \cdots$ corresponds to a tower of *extension* toposes $\mathbf{Eff} \to RT(\mathcal{K}_1^{0'}) \to RT(\mathcal{K}_1^{0''}) \to \cdots$ — outward geometric morphisms. No level of the hierarchy above $\mathcal{K}_1$ is a subtopos of $\mathbf{Eff}$. The oracle hierarchy is dual to the subtopos lattice: it extends the internal logic outward rather than restricting it inward.

## Proof

A subtopos of $\mathbf{Eff}$ requires a geometric morphism $f: \mathcal{E} \to \mathbf{Eff}$ whose direct image $f_*$ is full and faithful. By the $\mathbf{oPCA} \simeq \mathbf{ReaT}$ equivalence (Hofstra-van Oosten 2003), such a geometric morphism must arise from an ordered applicative morphism into $\mathcal{K}_1$.

For $RT(\mathcal{K}_1^{0'})$ to be a subtopos of $\mathbf{Eff}$, there would need to exist an ordered applicative morphism $\mathcal{K}_1^{0'} \to \mathcal{K}_1$. Such a morphism would mean every $0'$-computable function is tracked by a $\mathcal{K}_1$-computable realizer. But $\mathcal{K}_1^{0'}$-computation can decide the halting problem — which is not $\mathcal{K}_1$-computable by Turing's theorem. No such applicative morphism exists.

The same argument applies at each level: $\mathcal{K}_1^{0^{(n)}}$-computation decides the $\Sigma^0_n$-complete halting problem for the $(n-1)$-th oracle, which is not computable one level below. No geometric morphism $RT(\mathcal{K}_1^{0^{(n)}}) \to \mathbf{Eff}$ with full faithful direct image exists for any $n \geq 1$.

What does exist is the opposite: the inclusion $\iota: \mathcal{K}_1 \hookrightarrow \mathcal{K}_1^{0'}$ (every $\mathcal{K}_1$-computation is a $\mathcal{K}_1^{0'}$-computation with the oracle unused) is an applicative morphism, inducing $\mathbf{Eff} \to RT(\mathcal{K}_1^{0'})$ — a geometric morphism pointing *outward* from $\mathbf{Eff}$ into the oracle-extended topos.

## Significance

Subtoposes and the oracle hierarchy are structurally dual:

- **Subtoposes** (Lawvere-Tierney nuclei) restrict the internal logic by raising the threshold for which propositions count as closed — restricting computation *inward*.
- **Oracle toposes** extend the internal logic by adding oracle-realizable witnesses that $\mathcal{K}_1$ alone cannot provide — extending computation *outward*.

The oracle hierarchy therefore does not appear in the subtopos lattice of $\mathbf{Eff}$ at all. It appears in the complementary structure of the *supertopos tower* above $\mathbf{Eff}$. Any question of the form "is the $\Sigma^0_n$-computable fragment a subtheory of the theory of computing?" is answered negatively: $\Sigma^0_n$ for $n \geq 1$ extends the theory, it does not restrict it.
