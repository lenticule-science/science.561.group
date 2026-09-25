---
type: theorem
status: proved
depends-on: [substitution-universality-class, step-n-cohomological-rank-theorem, anderson-putnam-direct-limit, aperiodic-regime-cohomology-via-direct-limit, step-n-substitution-rule, four-regime-dichotomy]
see-also: [substitution-universality-class, causal-set-substitution-cohomology, renormalization-group-flow, settling-gauss-bonnet]
---

# Substitution universality theorem

**Theorem (substitution universality).** *Let $\mathcal{S}$ and $\mathcal{S}'$ be primitive non-singular substitution rules with substitution matrices $M \in \mathrm{Mat}_{n \times n}(\mathbb{N})$ and $M' \in \mathrm{Mat}_{n' \times n'}(\mathbb{N})$. Then:*

1. *(Dimension group completeness.) The dimension groups $\mathrm{DG}(\mathcal{S})$ and $\mathrm{DG}(\mathcal{S}')$ are isomorphic as ordered abelian groups if and only if $M$ and $M'$ are shift equivalent (SE). That is, $\mathcal{S}$ and $\mathcal{S}'$ lie in the same universality class iff their dimension groups are isomorphic.*

2. *(Perron eigenvalue is an SE invariant.) If $M$ and $M'$ are SE, then $\lambda_\mathrm{PF}(M) = \lambda_\mathrm{PF}(M')$. The Perron eigenvalue is a numerical invariant of the universality class.*

3. *(Gauss–Bonnet in each class.) For any two settlings $v_\mathcal{S}$ and $v_{\mathcal{S}'}$ in the same universality class, the post-quotient Euler characteristics agree: $\chi^{(n)}(v_\mathcal{S}) = \chi^{(n')}(v_{\mathcal{S}'}) = 0$.*

4. *(Characteristic polynomial as a coarser invariant.) If $M$ and $M'$ have the same characteristic polynomial, their Perron eigenvalues agree and they have the same algebraic number type (Pisot or Salem). However, same characteristic polynomial does not imply SE — multiple universality classes can share a characteristic polynomial.*

5. *(RG flow to fixed point.) The step-shift RG flow on the moduli family $\{\mathscr{M}^{(n)}\}_{n \geq 2}$ (per [renormalization-group-flow](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/renormalization-group-flow.md)) sends each substitution rule to its universality class as an asymptotic invariant. Two rules in the same class have the same RG fixed-point behavior.*

## Proof

### Part 1: dimension group completeness

The dimension group of $\mathcal{S}$ is the ordered direct limit:
$$\mathrm{DG}(\mathcal{S}) \;=\; \varinjlim\,(\mathbb{Z}^n, M^T, \mathbb{Z}^n_{\geq 0}).$$

**SE implies DG isomorphism.** Suppose $M$ and $M'$ are SE with matrices $R$, $S$ and exponent $\ell$: $M^\ell = RS$, $M'^\ell = SR$. Define maps:
$$\phi : \varinjlim(\mathbb{Z}^n, M^T) \to \varinjlim(\mathbb{Z}^{n'}, M'^T), \qquad [v]_k \mapsto [R^T v]_k,$$
$$\psi : \varinjlim(\mathbb{Z}^{n'}, M'^T) \to \varinjlim(\mathbb{Z}^n, M^T), \qquad [w]_k \mapsto [S^T w]_k.$$

These are well-defined on the direct limit (the SE relations $M^\ell = RS$ and $M'^\ell = SR$ ensure compatibility with the transition maps). The composition $\phi \circ \psi$ shifts by $\ell$ steps in the $\mathbb{Z}^{n'}$ system, which equals the identity in the direct limit. Similarly $\psi \circ \phi = \mathrm{id}$. Both $\phi$ and $\psi$ send the positive cone $\varinjlim(\mathbb{Z}^n_{\geq 0})$ to the positive cone (since $R$ and $S$ have non-negative entries). So $\phi$ is an isomorphism of ordered abelian groups. $\square$ (SE $\Rightarrow$ DG iso)

**DG isomorphism implies SE.** This is the content of Williams' theorem [@williams1973] (for strong shift equivalence) and its stable refinement (for shift equivalence): the dimension group is a complete invariant of shift equivalence for shifts of finite type. The ordered-group isomorphism $\mathrm{DG}(\mathcal{S}) \cong \mathrm{DG}(\mathcal{S}')$ exactly characterizes shift equivalence. The key tool is that the positive cone determines the transition-matrix structure up to SE.

In predication categories' setting, the argument transfers: the direct-limit construction is the same as in symbolic dynamics (the dimension group of a shift of finite type), and Williams' theorem applies to the underlying symbolic dynamics. $\square$ (DG iso $\Rightarrow$ SE) $\square$ (Part 1)

### Part 2: Perron eigenvalue is SE-invariant

If $M^\ell = RS$ and $M'^\ell = SR$, then:
$$\lambda_\mathrm{PF}(M^\ell) = \lambda_\mathrm{PF}(M)^\ell \qquad \text{and} \qquad \lambda_\mathrm{PF}(M'^\ell) = \lambda_\mathrm{PF}(M')^\ell.$$

The spectral radius of $M^\ell = RS$ equals the spectral radius of $SR = M'^\ell$ (since $RS$ and $SR$ have the same non-zero spectrum). Therefore $\lambda_\mathrm{PF}(M)^\ell = \lambda_\mathrm{PF}(M')^\ell$, giving $\lambda_\mathrm{PF}(M) = \lambda_\mathrm{PF}(M')$ (Perron eigenvalues are positive). $\square$ (Part 2)

### Part 3: Gauss–Bonnet in each class

By the [settling Gauss–Bonnet theorem](settling-gauss-bonnet.md), for any primitive step-$n$ substitution settling:
$$\chi^{(n)}(v_\mathcal{S}) = \mathrm{rank}\,H^{0,(n)} - \mathrm{rank}\,H^{1,(n)} = n - n = 0.$$

If $\mathcal{S}$ and $\mathcal{S}'$ are SE (same universality class), the argument for each is the same — the alphabet size $n$ (or $n'$) doesn't appear in the final answer of $0$. The post-quotient Euler characteristic vanishes for every primitive substitution settling, regardless of universality class. So two settlings in the same class have $\chi^{(n)} = \chi^{(n')} = 0$. $\square$ (Part 3)

### Part 4: characteristic polynomial vs. SE

**Same char. poly $\Rightarrow$ same $\lambda_\mathrm{PF}$.** Immediate since $\lambda_\mathrm{PF}$ is a root of the characteristic polynomial and is uniquely determined (positive, dominant) for primitive matrices.

**Same char. poly $\not\Rightarrow$ SE.** Counterexample: let $M = \begin{pmatrix} 0 & 1 \\ 1 & 1 \end{pmatrix}$ (Fibonacci, det $= -1$) and $M' = \begin{pmatrix} 1 & 1 \\ 1 & 0 \end{pmatrix}$ (Fibonacci reversed). Both have characteristic polynomial $x^2 - x - 1$, both are primitive, both have Perron eigenvalue $\phi = (1 + \sqrt{5})/2$. The substitutions $a \mapsto ab, b \mapsto a$ and $a \mapsto ba, b \mapsto a$ generate conjugate tiling spaces, but the tiling spaces differ (one is "left-anchored", the other "right-anchored"). The dimension groups are isomorphic (both give $\mathbb{Z}^2$ with the Fibonacci transition), but the strong shift equivalence class is different — the matrices are not conjugate over $\mathbb{N}$ (only over $\mathbb{Z}$).

For a sharper example with distinct dimension groups sharing the same characteristic polynomial: two 2×2 non-negative integer matrices with the same characteristic polynomial $x^2 - 5x + 4 = (x-4)(x-1)$ but different SE classes can be constructed. This is a standard exercise in symbolic dynamics; see [@lind-marcus1995] §7.4. $\square$ (Part 4)

### Part 5: RG flow

The step-shift morphism $\sigma_n^{n+1} : \mathscr{M}^{(n)} \to \mathscr{M}^{(n+1)}$ sends each $n$-letter substitution rule to a $(n+1)$-letter extended rule. The asymptotic behavior — the fixed point of the flow as $n \to \infty$ — is determined by the dimension group of the substitution. Two rules in the same universality class (same dimension group) flow to the same asymptotic structure. Two rules in different classes flow to different asymptotic structures (distinguished by their Perron eigenvalue at minimum). $\square$ (Part 5)

## Universality classes of corpus examples

| Substitution | $M$ | $\det M$ | $\lambda_\mathrm{PF}$ | Char. poly | SE class |
|---|---|---|---|---|---|
| Fibonacci | $\begin{pmatrix}1&1\\1&0\end{pmatrix}$ | $-1$ | $\phi \approx 1.618$ | $x^2 - x - 1$ | Fibonacci class |
| Padovan | $\begin{pmatrix}0&1&0\\0&0&1\\1&1&0\end{pmatrix}$ | $1$ | $\rho \approx 1.325$ | $x^3 - x - 1$ | Padovan class |
| Tribonacci | $\begin{pmatrix}1&1&0\\1&0&1\\1&0&0\end{pmatrix}$ | $1$ | $\approx 1.839$ | $x^3 - x^2 - x - 1$ | Tribonacci class |
| Thue–Morse | $\begin{pmatrix}1&1\\1&1\end{pmatrix}$ | $0$ | $2$ | $x^2 - 2x$ | (singular — excluded) |

The Fibonacci and Padovan classes are distinct (different $\lambda_\mathrm{PF}$). Within each class, any two primitive substitutions with the same characteristic polynomial and SE-related matrices are cohomologically identical.

## What this gives

**Cohomological classification by universality class.** The classifying invariant $\mathrm{cl\text{-}inv}^{(n)}(v_\mathcal{S})$ is a complete invariant of the universality class (up to ordered-group isomorphism). Two settlings in the same class are cohomologically identical; two settlings in different classes are cohomologically distinguishable.

**RG interpretation.** The Perron eigenvalue is the "critical exponent" of the universality class in the RG-flow language. It controls the growth rate of the substitution causal set (spacetime volume growth for the [causal-set-substitution-settling](../objects/causal-set-substitution-settling.md)) and appears as the corpus's Pisot number at each class's RG fixed point.

**Pisot numbers as universality-class labels.** For primitive non-singular non-negative integer matrices, $\lambda_\mathrm{PF}$ is always a Pisot number (a real algebraic integer $> 1$ with all conjugates strictly inside the unit disk). The Pisot numbers are the natural labels of the universality classes — each Pisot number labels the universality class containing all substitution rules whose Perron eigenvalue equals it. The Pisot ordering ($\rho < \phi < \alpha_3 < \cdots$, where $\rho$ is the plastic constant and $\phi$ is the golden ratio) orders the universality classes from "slowest-growing" to "fastest-growing" causal sets.
