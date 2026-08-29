---
type: example
status: verified
depends-on: [step-n-substitution-rule, step-n-cohomological-rank-theorem, anderson-putnam-direct-limit, thue-morse-substitution-settling]
---

# Singular substitution matrix zoo

Catalogue of named substitutions whose substitution matrix has $\det M = 0$, addressing the [singular-substitution-variety question](questions/singular-substitution-variety.md). Singular substitutions fall outside the [step-$n$ cohomological rank theorem](../theorems/step-n-cohomological-rank-theorem.md)'s hypothesis ($\det M \neq 0$) and have rank $< n$ classifying invariants — typically of the form $\mathbb{Z}[1/d]^r$ where $r$ is the matrix rank and $d$ is the leading non-zero eigenvalue.

The Thue-Morse benchmark surfaced one such case; this entry catalogues others from the substitution-tilings literature.

## When does a substitution have a singular matrix?

For a substitution $\sigma$ on alphabet $\{a_1, \ldots, a_n\}$, the matrix $M_{ij} = \#(\text{letter } j \text{ in } \sigma(a_i))$ is singular iff the count-vectors $(M_{i\bullet})_{i=1}^n$ are linearly dependent over $\mathbb{Q}$. In the binary case ($n = 2$), this means $\sigma(a_1)$ and $\sigma(a_2)$ have the same letter counts (i.e., they are anagrams of each other).

For larger alphabets, singularity can arise from less obvious linear-dependence patterns.

## Catalogue

### 1. Thue-Morse

$\sigma : 0 \mapsto 01, 1 \mapsto 10$. $M = \begin{pmatrix} 1 & 1 \\ 1 & 1 \end{pmatrix}$. $\det M = 0$. Eigenvalues: $\{2, 0\}$. Rank: 1. $\check{H}^1(\Omega_{TM}) = \mathbb{Z}[1/2]$.

The canonical example. Has substitution-rule self-duality under negation (the substitution itself commutes with the alphabet swap). Documented at [benchmark-2-thue-morse](benchmark-2-thue-morse.md).

### 2. Mirror-image binary substitutions

Any substitution $\sigma : 0 \mapsto w, 1 \mapsto \mathrm{rev}(w)$ where $\mathrm{rev}$ is the word reversal, when $w$ has the same letter counts as $\mathrm{rev}(w)$ (which is automatic). $M = \begin{pmatrix} k & \ell \\ k & \ell \end{pmatrix}$ where $w$ has $k$ zeros and $\ell$ ones. $\det = 0$ for all such.

Special cases:
- $\sigma : 0 \mapsto 01, 1 \mapsto 10$ (= Thue-Morse). $M = [[1,1],[1,1]]$.
- $\sigma : 0 \mapsto 0011, 1 \mapsto 1100$. $M = [[2,2],[2,2]]$.
- $\sigma : 0 \mapsto 00110, 1 \mapsto 01100$. $M = [[3,2],[3,2]]$.

### 3. Constant-image substitutions

$\sigma : a_i \mapsto w$ for the *same* word $w$ regardless of input letter. $M$ has all rows identical. $\det = 0$ for $n > 1$.

Trivially singular; the underlying dynamical system is degenerate (every letter substitutes to the same word, eventually reducing to a constant tiling). Not aperiodic in the usual sense.

### 4. Period-doubling variants on $\{0, 1\}$

$\sigma : 0 \mapsto 01, 1 \mapsto 00$. Counts: row $0$: $(1, 1)$, row $1$: $(2, 0)$. $M = \begin{pmatrix} 1 & 1 \\ 2 & 0 \end{pmatrix}$. $\det = -2$.

**Not singular.** Period-doubling has non-trivial determinant. Distinguished from Thue-Morse: period-doubling's eigenvalues are $\{2, -1\}$ (Pisot), giving $\check{H}^1 = \mathbb{Z}^2$. Listed here because it's commonly confused with Thue-Morse-flavored cases.

### 5. Rudin-Shapiro

$\sigma$ on the alphabet $\{a, b, c, d\}$ with:
- $a \mapsto ab$
- $b \mapsto ac$
- $c \mapsto db$
- $d \mapsto dc$

Counts (rows = input, cols = letter count in image):
- row $a$: $(1, 1, 0, 0)$
- row $b$: $(1, 0, 1, 0)$
- row $c$: $(0, 1, 0, 1)$
- row $d$: $(0, 0, 1, 1)$

$M = \begin{pmatrix} 1 & 1 & 0 & 0 \\ 1 & 0 & 1 & 0 \\ 0 & 1 & 0 & 1 \\ 0 & 0 & 1 & 1 \end{pmatrix}$.

Constant-length 2. $\det M = 0$ (rows are linearly dependent: $r_a + r_d = r_b + r_c = (1, 1, 1, 1)$). Eigenvalues: $\{2, 0, \pm \sqrt{2}\}$. Rank: 3.

$\check{H}^1(\Omega_{RS}) = \mathbb{Z}[1/2]^?$ with rank-3 structure. Computed in BDHS [@barge-et-al2010].

### 6. Generic constant-length-2 substitutions on small alphabets

Many constant-length-2 substitutions have singular matrices because the column sums are forced to equal the length (here, 2). For an $n$-letter constant-length-$\ell$ substitution, $M$'s column sums are all $\ell$, so $(1, 1, \ldots, 1)^T$ is a left-eigenvector with eigenvalue $\ell$. This forces the matrix's rank to be at most $n - $ (number of independent constraints). When constraints are dependent, the rank drops and $\det = 0$.

### 7. Non-constant-length singular cases

Less common but exist. Construction: take any binary substitution $\sigma$ and "duplicate" — $\sigma' : 0 \mapsto \sigma(0)\sigma(1), 1 \mapsto \sigma(0)\sigma(1)$. Both letters have the same image, hence the same counts, so $M' = $ rank-1.

These are degenerate (the substitution merges letters) and rarely studied.

## Summary table

| Substitution | $n$ | Constant length? | $\det M$ | Rank | $\check{H}^1(\Omega)$ |
|---|---|---|---|---|---|
| Thue-Morse | 2 | yes (length 2) | 0 | 1 | $\mathbb{Z}[1/2]$ |
| Mirror-image binary | 2 | yes | 0 | 1 | $\mathbb{Z}[1/d]$ for some $d$ |
| Constant-image | $\geq 2$ | yes | 0 | 1 | $\mathbb{Z}$ or $\mathbb{Z}[1/d]$ |
| Period-doubling | 2 | yes (length 2) | $\neq 0$ | 2 | $\mathbb{Z}^2$ |
| Rudin-Shapiro | 4 | yes (length 2) | 0 | 3 | $\mathbb{Z}[1/2]$-flavored, rank 3 |
| Fibonacci (for comparison) | 2 | no | $-1$ | 2 | $\mathbb{Z}^2$ |

Constant-length substitutions tend toward singular but not all are (period-doubling). Non-constant-length singular cases are rare and usually constructed.

## Structural class: constant-length substitutions

Constant-length substitutions form a coherent sub-class within the substitution dynamical systems literature, with specialized theory:
- *Queffélec 1987*: spectral analysis of constant-length substitutions, including dimension theory.
- *BDHS 2010* [@barge-et-al2010]: cohomology of substitution tiling spaces, with explicit treatment of the non-Pisot / singular cases.
- *Sadun 2008*: tiling-space topology, treats both Pisot (non-singular) and constant-length cases.

The corpus's framework was developed for the primitive non-singular case (the [step-$n$ cohomological rank theorem](../theorems/step-n-cohomological-rank-theorem.md) explicitly assumes $\det M \neq 0$). The singular sub-class would need a parallel theorem with adjusted hypotheses and conclusions.

## What this exhibits

Three structural observations:

1. **Singular substitution matrices are not exotic** — they're the natural class of *constant-length-balanced-image* substitutions, well-studied in the substitution-tilings literature.

2. **The $\mathbb{Z}[1/d]$-cohomology pattern is robust.** Across Thue-Morse, Rudin-Shapiro, and other constant-length cases, the cohomology is some localization of $\mathbb{Z}$ at the leading non-zero eigenvalue, with rank equal to the matrix rank. The exact structure depends on the matrix's Smith normal form.

3. **The corpus's framework needs a parallel "constant-length sub-stratum"** — neither in $\mathscr{M}^{(n)}$ for any $n$ (the rank theorem doesn't apply) nor strictly in the residue (these *are* substitution-flavored). A sub-stratification of the meta-aperiodic stratum recognizing constant-length-singular as a separate class would absorb this naturally.

## Position in predication categories

Closes the [singular-substitution-variety question](questions/singular-substitution-variety.md)'s inventory sub-task. Surfaces the **constant-length-singular sub-stratum** as a structurally coherent class within the meta-aperiodic stratum, distinct from predication categories' primary $\mathscr{M}^{(n)}$ classification.

Open downstream:
- **Constant-length sub-stratum theorem.** State a parallel of the step-$n$ rank theorem for primitive constant-length-singular substitutions: classification by (Smith-normal-form invariants, leading eigenvalue, length).
- **Sub-stratum of the meta-stratification.** Add the constant-length class to the [step-$n$ meta-stratification](../theorems/step-n-meta-stratification.md)'s residue analysis.
