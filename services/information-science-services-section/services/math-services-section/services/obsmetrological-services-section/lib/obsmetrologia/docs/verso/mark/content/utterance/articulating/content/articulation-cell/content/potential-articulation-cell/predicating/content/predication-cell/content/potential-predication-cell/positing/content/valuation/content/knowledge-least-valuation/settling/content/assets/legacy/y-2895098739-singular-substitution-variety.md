---
kind: question
status: open
explores: [step-n-substitution-rule, step-n-cohomological-rank-theorem, anderson-putnam-direct-limit]
---

# The variety of singular substitution matrices

The corpus's [step-$n$ cohomological rank theorem](../../aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-cohomological-rank-theorem.md) requires $\det M \neq 0$ as a hypothesis. For singular $M$, the colim has rank strictly less than $n$, with the "missing" generators replaced by localizations at the matrix's leading non-zero eigenvalue (cf. Thue-Morse with $\check{H}^1 = \mathbb{Z}[1/2]$).

We hit Thue-Morse essentially by accident — a benchmark surfaced its singular character. **Singular substitution matrices form an algebraic variety inside the space of integer matrices**, specifically the zero set of $\det = 0$. We've explored exactly one point of this variety.

## Open

1. **Inventory.** Which named substitutions in the literature have singular matrices? Thue-Morse and the *constant-length* substitutions in general (every letter image has the same length $\ell$, giving substitution matrices with all column sums equal to $\ell$ and typically lower rank than $n$). Any non-constant-length singular cases?

2. **Structure of the singular variety**. The det=0 condition is a polynomial equation in the matrix entries. For $n \times n$ integer matrices with non-negative entries, this gives an algebraic variety. What's its dimension? Its irreducible components? Its smooth locus vs. its singular locus?

3. **Cohomology classification on the singular variety.** For each singular case, the cohomological invariant is some localization $\mathbb{Z}[1/d_1, 1/d_2, \ldots]^r$ for some integers $d_i$ and rank $r$. What's the function from points of the singular variety to these localization-data tuples?

4. **The boundary between singular and non-singular**. The non-singular case has free abelian cohomology $\mathbb{Z}^n$. The singular case has localization. What happens *near* the boundary — e.g., for matrices with very small $|\det|$? The corpus's existing rank theorem says rank stays $n$ for *any* non-zero det; but the localization complexity grows with the det's prime factorization.

5. **The singular regime as a separate sub-stratum**. The corpus's [step-$n$ meta-stratification](../../aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-meta-stratification.md) decomposes meta-aperiodic into $\mathscr{M}^{(n)}$ for primitive non-singular cases plus residue. The singular cases live in the residue. Do they form a *coherent sub-stratum* with its own classification structure (e.g., constant-length substitutions form a recognizable class)?

The Thue-Morse benchmark surfaced this question. The general theory probably exists in the substitution-tilings literature for constant-length substitutions; the corpus's framework would need to absorb that.
