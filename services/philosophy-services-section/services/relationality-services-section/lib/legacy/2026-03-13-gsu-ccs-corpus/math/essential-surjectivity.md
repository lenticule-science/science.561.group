---
id: essential-surjectivity
name: EssentialSurjectivity
description: "the depth-restriction functor ρ_n is essentially surjective iff the cohomological obstruction H¹(T^(n), J^(n); E₀) vanishes."
---

### Theorem — Essential Surjectivity from Axioms {#essential-surjectivity}

**Theorem.** If $H^1(T^{(n)}, J^{(n)};\, E_0) = 0$ for all $n$ (the cohomological
obstruction groups vanish at every depth), then $\rho_n : \mathcal{M}_{n+1} \to \mathcal{M}_n$
is essentially surjective as a functor.

*Proof.*

1. **Setup.** Let $\mathbf{U} = (T^{(n)}, J^{(n)}, H_\mathbf{U}) \in \mathcal{M}_n$ be
   an admissible depth-$n$ universe. We must construct a depth-$(n+1)$ universe
   $\mathbf{V} \in \mathcal{M}_{n+1}$ with $\rho_n(\mathbf{V}) \cong \mathbf{U}$.

2. **Extension of fiber algebras.** By §depth-filtration, extending from depth $n$ to
   depth $n+1$ requires specifying fiber algebras $H_t$ for each history $t$ of depth
   exactly $n+1$, compatible with the existing algebras at depth $\leq n$ via the
   restriction maps. This is a section-extension problem: extend a section of the
   fiber algebra presheaf from $T^{(n)}$ to $T^{(n+1)}$.

3. **The obstruction lives in $H^1$.** By the long exact sequence of §cohomology,
   the obstruction to extending a compatible family of fiber algebras from depth $n$
   to depth $n+1$ lies in $H^1(T^{(n)}, J^{(n)};\, E_0)$: the first sheaf cohomology
   group with coefficients in the stable mode sheaf.

4. **Vanishing implies extension.** If $H^1(T^{(n)}, J^{(n)};\, E_0) = 0$, the
   obstruction vanishes and the extension exists. The extended presheaf
   $H_\mathbf{V}$ over $T^{(n+1)}$ is a valid fiber algebra system; equipping it
   with the induced nuclei and checking the remaining axioms yields an admissible
   universe $\mathbf{V} \in \mathcal{M}_{n+1}$.

5. **Essential surjectivity.** By construction, $\rho_n(\mathbf{V})|_{T^{(n)}} = H_\mathbf{U}$,
   so $\rho_n(\mathbf{V}) \cong \mathbf{U}$ via the identity history morphism and the
   canonical isomorphism of the fiber presheaves. Hence $\rho_n$ is essentially
   surjective. $\square$

*Remark.* The converse also holds: if $\rho_n$ is essentially surjective, then the
obstruction class in $H^1$ must vanish for every starting universe $\mathbf{U}$, forcing
$H^1(T^{(n)}, J^{(n)};\, E_0) = 0$. Thus essential surjectivity of $\rho_n$ and
vanishing of $H^1$ at depth $n$ are equivalent conditions.

**Status.** Draft. The proof relies on the long exact sequence of §cohomology and the
identification of the obstruction class with the section-extension problem for the fiber
algebra presheaf.
