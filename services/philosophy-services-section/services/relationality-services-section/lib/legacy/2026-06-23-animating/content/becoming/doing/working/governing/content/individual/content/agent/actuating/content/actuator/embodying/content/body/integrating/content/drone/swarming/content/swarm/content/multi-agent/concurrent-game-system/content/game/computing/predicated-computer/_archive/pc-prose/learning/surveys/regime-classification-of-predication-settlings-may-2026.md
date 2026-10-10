---
description: Survey of the regime classification of predication settlings by closure ordinal — the four-regime dichotomy (strict, Scott-continuous, transfinite-bounded, aperiodic), the step-$n$ substitution rules and their substack tower, the step-$n$ classifying invariant of rank $n$, and the Anderson-Putnam direct-limit framework adopted from substitution dynamics.
status: draft
session-date: 2026-05-19
---

## Scope

This survey records the regime classification of predication settlings and the step-$n$ substack tower as they stand in the library at `theories/.../predication-categories/code/structures/`. It covers the closure ordinal $\kappa(F_U, \mathcal{E}_0)$ as the indexing object; the four-regime dichotomy (strict, Scott-continuous, transfinite-bounded, aperiodic) by where $\kappa$ falls; the step-$n$ substitution rule and its substitution matrix $M \in \mathrm{Mat}_{n \times n}(\mathbb{N})$; the step-$n$ moduli substack $\mathscr{M}^{(n)}$ inside the meta-aperiodic stratum and the ascending chain $\mathscr{M}^{(2)} \hookrightarrow \mathscr{M}^{(3)} \hookrightarrow \cdots$; the step-$n$ classifying invariant $\mathrm{cl}\text{-}\mathrm{inv}^{(n)}(v) \in \mathbb{Z}^n$ refining the aperiodic classifying invariant; and the Anderson–Putnam direct-limit framework that the cohomology side inherits structurally. It defers the underlying cohomology to the cohomology survey and the moduli prestack apparatus to the moduli survey.

## Content

### The closure ordinal $\kappa$

For a settling endofunctor $F_U$ starting from initial state $\mathcal{E}_0$, the closure ordinal $\kappa(F_U, \mathcal{E}_0)$ is the least ordinal $\tau$ such that $F_U^{\tau+1}(\mathcal{E}_0) = F_U^\tau(\mathcal{E}_0)$ — the ordinal at which the iterated settling action stabilizes. If no such ordinal exists in the ambient universe, $\kappa = \infty$. By Knaster–Tarski plus transfinite induction, $\kappa \leq |\mathbf{PrFib}|^+$ — the successor cardinal of the 2-category's object class.

### The four-regime dichotomy

The four-regime dichotomy theorem states that exactly one of four regimes holds for any predication settling with closure ordinal $\kappa$. The bands and their distinguishing structural conditions:

- **Strict** ($\kappa < \omega$): $\mathbf{L}, E, \mathcal{C}$ all finite; the closure operator is strict-idempotent. The bitopological settling site $\mathbf{T}^*_{\mathrm{site}}$ is finite — finite Priestley fibers, finitely many ordinal strata. Standard finite-cellular-sheaf cohomology applies.
- **Scott-continuous** ($\kappa = \omega$): closure is Scott-continuous (commutes with directed joins); at least one of $\mathbf{L}, E, \mathcal{C}$ is infinite. Pairwise-Stone fibers admit acyclic refinements via Husainov acyclicity; cohomology is Čech-computable.
- **Transfinite-bounded** ($\omega < \kappa < \omega_1$): non-Scott-continuous closure with state-space cofinality countable. Computable in principle via transfinite iteration of Scott-continuous techniques.
- **Aperiodic** ($\omega_1 \leq \kappa$): non-Scott-continuous closure with state-space cofinality at least $\omega_1$. The site has $\omega_1$-or-more ordinal strata with non-trivial 2-cells throughout; cohomology is accessible only as a direct limit over bounded sub-sites $\mathbf{T}^*_{\leq \tau}$. The aperiodic classifying invariant lives here.

The cohomology stabilizes at the closure ordinal in the strict and Scott-continuous regimes (settling-locally-constant-cohomology theorem); $\mathrm{cl}\text{-}\mathrm{inv}$ is forced to be zero there. In the aperiodic regime, cohomology does not stabilize at any countable ordinal — non-Scott-continuous firings at countable limit ordinals continually contribute new $H^1$-generators — and $\mathrm{cl}\text{-}\mathrm{inv}$ can be non-zero.

### The step-$n$ substitution rule

A step-$n$ substitution rule is a closure rule whose antecedent depends on the prior $n$ settled stages and whose consequent produces new cells via an $n$-term recurrence. Formally, on a base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$ with predicate $P$ on $\mathrm{dom}(P) = E \times E$ (or the diagonal $\Delta_E$), a step-$n$ substitution rule has the form

$$\sigma_n : \bigwedge_{i=1}^{n} \phi_i(v|_{[k-i, k]}) \Longrightarrow \psi(v(P)(k+1, \cdot)),$$

with the $\phi_i$ predicates on the cell-content at stage $k-i$ (look-back $i$ stages) and $\psi$ a constraint on the cell-content at stage $k+1$.

Every step-$n$ substitution rule has an associated substitution matrix $M \in \mathrm{Mat}_{n \times n}(\mathbb{N})$ with $M_{ij}$ counting the number of $j$-letters produced by substituting on an $i$-letter. The growth rate of the substitution is the dominant eigenvalue (Perron-Frobenius) of $M$, a degree-$n$ algebraic number for primitive $M$.

Canonical examples:

- $n = 2$ Fibonacci: $M = \begin{pmatrix} 1 & 1 \\ 1 & 0 \end{pmatrix}$, dominant eigenvalue $\phi$ (golden ratio).
- $n = 3$ Padovan: $M = \begin{pmatrix} 0 & 1 & 0 \\ 0 & 0 & 1 \\ 1 & 1 & 0 \end{pmatrix}$, dominant eigenvalue $\rho$ (plastic number).
- $n = 4$ Tetranacci-style: a $4 \times 4$ matrix with degree-4 characteristic polynomial.

Different step-$n$ rules with the same $n$ but different matrices are distinct under closure-equivalence — Fibonacci and Thue–Morse are both step-2 but inequivalent.

A step-$n$ substitution rule has closure ordinal $\kappa = \omega_1$ when $E = \omega_1$ (the substitution does not stabilize at any countable ordinal); the rule-language fragment is $\Pi_{n-1}$ (the antecedent uses look-back-$n$ structure expressible at quantifier-depth $n-1$). The step-$n$ rules belong to the aperiodic regime.

For specific values of $n$, the step-$n$ structure aligns with the bilattice's intrinsic value-structure. At $n = 2$ the alphabet $\{a, b\}$ corresponds to the bilattice's two orders ($\leq_k$ and $\leq_t$); at $n = 3$ to the non-bottom values $\{\mathbf{t}, \mathbf{f}, \top\}$; at $n = 4$ to the full bilattice values $\{\bot, \mathbf{t}, \mathbf{f}, \top\}$. For $n \geq 5$ no canonical bilattice correspondence holds — the alphabet exceeds the bilattice's own structural cardinality. The alignment is a *finite* feature, not an isomorphism of theories.

### The step-$n$ classifying invariant $\mathrm{cl}\text{-}\mathrm{inv}^{(n)}(v) \in \mathbb{Z}^n$

For a settling $v$ generated by a step-$n$ substitution rule on base $B = (\mathbf{2}, \mathcal{C}, \omega_1, \omega_1 + 1)$, the aperiodic classifying invariant before quotient is

$$\mathrm{cl}\text{-}\mathrm{inv}(v) = \sum_{\mu \in L_{\mathrm{ns}}(\omega_1)} e_\mu \in \bigoplus_{\mu \in L_{\mathrm{ns}}(\omega_1)} \mathbb{Z}$$

— uncountable rank, one generator per non-Scott-continuous firing ordinal. The step-$n$ classifying invariant is the post-quotient version under settling-shift equivalence:

$$\mathrm{cl}\text{-}\mathrm{inv}^{(n)}(v) := \mathrm{cl}\text{-}\mathrm{inv}(v) \,/\, \sim_{\mathrm{settling\text{-}shift}} \in \mathbb{Z}^n.$$

The step-$n$ cohomological rank theorem gives the rank exactly $n$: the substitution dynamics produce self-similar cohomology, and after settling-shift distinct firing ordinals map to exactly $n$ substitution-equivalence classes — one per substitution-letter, one per row/column of $M$. This is the predication-categories manifestation of Anderson–Putnam's classical computation $\check{H}^1(\Omega_\sigma) \cong \mathbb{Z}^n$ for primitive $n$-letter substitutions.

Two step-$n$ rules with the same $n$ but different substitution matrices have classifying invariants of the same rank but possibly different generators and different matrix actions. Rank-$n$ is necessary but not sufficient for MLD-equivalence — additional invariants (substitution-matrix conjugacy, Bratteli–Vershik invariants) distinguish step-$n$ rules within rank-$n$.

### The step-$n$ moduli substack tower $\{\mathscr{M}^{(n)}\}_{n \geq 2}$

For each $n \geq 2$, the step-$n$ moduli substack is the sub-stack of the meta-moduli stack on closure-equivalence classes containing a primitive step-$n$ substitution rule:

$$\mathscr{M}^{(n)} := \bigl\{ [\mathcal{S}] \in \mathscr{M}^{\mathrm{meta}}_{\mathrm{aper}} : \mathcal{S} \text{ is closure-equivalent to a primitive step-}n \text{ substitution rule} \bigr\}.$$

A meta-point $[\mathcal{S}]$ is in $\mathscr{M}^{(n)}$ iff *some* representative is a primitive step-$n$ substitution rule. Primitivity (some power of the substitution matrix is strictly positive) is required for the rank-theorem-based step-depth invariance; non-primitive rules form a separate sub-residue not covered by the stratification.

By the step-$n$ meta-stratification theorem, the meta-aperiodic stratum decomposes as

$$\mathscr{M}^{\mathrm{meta}}_{\mathrm{aper}} = \Bigl( \bigsqcup_{n \geq 2} \mathscr{M}^{(n)} \Bigr) \sqcup \mathscr{M}^{\mathrm{meta}}_{\mathrm{aper, residue}},$$

where the residue contains aperiodic closure rules not closure-equivalent to any primitive step-$n$ substitution rule. The residue is uncountable by cardinality, but explicit non-substitutive examples are open work.

The step-shift morphism $\sigma : \mathscr{M}^{(n)} \to \mathscr{M}^{(n+1)}$ embeds each step-$n$ sub-stack into the next:

$$\mathscr{M}^{(2)} \hookrightarrow \mathscr{M}^{(3)} \hookrightarrow \mathscr{M}^{(4)} \hookrightarrow \cdots$$

The colimit $\mathscr{M}^{(\infty)} := \mathrm{colim}_n \mathscr{M}^{(n)}$ is a candidate renormalization-group fixed point — a universal substitution moduli at infinite step depth. Whether $\mathscr{M}^{(\infty)}$ is trivial or rich is named in the library as an open question, not a settled fact.

For each $n$, $\mathscr{M}^{(n)}$ has multiple meta-points (one per substitution-matrix structure modulo conjugacy); the cardinality of $\mathscr{M}^{(n)}$ grows with $n$.

### The Anderson–Putnam direct-limit framework

The cohomology side of the aperiodic regime inherits the Anderson–Putnam direct-limit framework structurally. For a substitution dynamical system with substitution self-map $\omega$ on a finite cell complex $\Gamma_\omega$ (the Anderson–Putnam complex), the dynamical space is the inverse limit

$$\Omega_\omega \cong \lim_{\leftarrow}\bigl(\Gamma_\omega \xleftarrow{\omega} \Gamma_\omega \xleftarrow{\omega} \cdots\bigr),$$

and the Čech cohomology is the direct limit of the induced cohomology maps:

$$\check{H}^n(\Omega_\omega) \cong \varinjlim\bigl(\check{H}^n(\Gamma_\omega) \xrightarrow{\omega^*} \check{H}^n(\Gamma_\omega) \to \cdots\bigr).$$

The construction was developed for substitution tilings by Anderson and Putnam (1998); cohomology classes of the direct limit classify aperiodic tilings up to local-isomorphism equivalence (mutual local derivability).

In the predication-categories adoption, the settling endofunctor's iterates play the role of $\omega$; finite-stage cohomology of the bounded sub-sites $\mathbf{T}^*_{\leq \tau}$ plays the role of $\check{H}^n(\Gamma_\omega)$; the direct limit at the closure ordinal $\omega_1$ assembles them into the classifying $H^1$ for the aperiodic regime. The analogy is structural rather than technical: tiling cohomology lives on simplicial-complex inverse limits with abelian-group coefficients, while aperiodic-settling cohomology lives on bitopological-site direct limits with the same coefficients. The direct-limit framework transfers cleanly without invoking the technical machinery specific to tilings ($C^*$-algebras, $K$-theory, Anderson–Putnam collaring, branched-manifold inverse limits).

## Synthesis-flags

The "RG-fixed-point candidate" framing for $\mathscr{M}^{(\infty)}$ uses the library's own language in `step-n-moduli-substack.md`; the question of whether $\mathscr{M}^{(\infty)}$ is trivial or rich is named there as open and is presented here as open. The four-regime band conditions reproduce `closure-ordinal.md`'s data combined with the bitopological-settling-site regime table; the precise statement of the four-regime dichotomy theorem itself was not read this session (it was cited via cross-reference in source files).

## Provenance

Read in full this session:

- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/closure-ordinal.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/step-n-substitution-rule.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/step-n-classifying-invariant.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/step-n-moduli-substack.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/anderson-putnam-direct-limit.md`

External citations named in the source material:

- Anderson, J., and Putnam, I. (1998), on the direct-limit framework for substitution dynamical systems.

Cross-referenced theorems named in source material (not directly read this session):

- The four-regime dichotomy theorem.
- The step-$n$ cohomological rank theorem.
- The step-$n$ meta-stratification theorem.
- The step-$n$ / bilattice correspondence theorem.
- The settling-locally-constant-cohomology theorem.
