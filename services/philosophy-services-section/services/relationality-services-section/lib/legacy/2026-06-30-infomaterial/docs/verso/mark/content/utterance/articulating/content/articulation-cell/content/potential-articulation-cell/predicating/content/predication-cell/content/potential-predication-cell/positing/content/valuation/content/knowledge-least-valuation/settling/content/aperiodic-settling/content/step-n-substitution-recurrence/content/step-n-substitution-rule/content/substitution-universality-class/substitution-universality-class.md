---
type: concept
class: equivalence-relation
depends-on: [step-n-substitution-rule, step-shift-morphism, anderson-putnam-direct-limit, aperiodic-classifying-invariant]
see-also: [substitution-universality-theorem, step-n-cohomological-rank-theorem, renormalization-group-flow]
---

# Substitution universality class

Two substitution rules $\mathcal{S}$ and $\mathcal{S}'$ (over possibly different alphabets $A$, $A'$) lie in the same **universality class** if their classifying dynamics — the asymptotic behavior of their RG flows — are indistinguishable at the level of the cohomological invariant.

## Definition

**Strong shift equivalence.** Square non-negative integer matrices $M$ and $M'$ are **strongly shift equivalent (SSE)** if there exist non-negative integer matrices $R$ and $S$ with $$M = RS, \qquad M' = SR.$$

**Shift equivalence.** $M$ and $M'$ are **shift equivalent (SE)** if there exist non-negative integer matrices $R$, $S$ and an integer $\ell \geq 1$ with $$M^\ell = RS, \qquad M'^\ell = SR.$$

SE is the transitive closure of SSE: two matrices are SE iff they are connected by a finite chain of SSE steps.
SE is coarser than SSE.

**Universality class.** Two primitive non-singular substitution rules $\mathcal{S}$ (matrix $M$) and $\mathcal{S}'$ (matrix $M'$) belong to the same **universality class** iff $M$ and $M'$ are shift equivalent.

## Why shift equivalence is the right notion

In the RG-flow language of [renormalization-group-flow](prose/teaching/explanations/renormalization-group-flow.md), two substitution rules flow to the same "fixed point" if their asymptotic classifying data agrees.
The fixed-point invariant is the **dimension group** of the substitution — the ordered abelian group:

$$\mathrm{DG}(\mathcal{S}) \;:=\; \Bigl(\varinjlim_k \,(\mathbb{Z}^n \xrightarrow{M^T} \mathbb{Z}^n \to \cdots),\; \varinjlim_k \,(\mathbb{Z}^n_{\geq 0})\Bigr)$$

equipped with the order induced by the non-negative-integer cone.
The dimension group is a shift-equivalence invariant — two SE matrices produce isomorphic ordered dimension groups.

This is the content of the [substitution universality theorem](../theorems/substitution-universality-theorem.md): $\mathrm{DG}(\mathcal{S}) \cong \mathrm{DG}(\mathcal{S}')$ as ordered abelian groups iff $M$ and $M'$ are shift equivalent.

## Invariants of the universality class

**Perron eigenvalue.** The spectral radius $\lambda_\mathrm{PF}(M)$ is SE-invariant: if $M$ and $M'$ are SE with exponent $\ell$, then $\lambda_\mathrm{PF}(M)^\ell = \lambda_\mathrm{PF}(M')^\ell$, giving $\lambda_\mathrm{PF}(M) = \lambda_\mathrm{PF}(M')$.
The Perron eigenvalue is the single most important numerical invariant of the universality class.

**Characteristic polynomial (coarser).** Matrices with the same characteristic polynomial need not be SE.
Characteristic polynomial is a coarser invariant: multiple universality classes can share a characteristic polynomial.
It classifies the spectrum (all eigenvalues), while SE classifies the stable ordered-group structure.

**Algebraic number type.** For a primitive non-singular matrix, $\lambda_\mathrm{PF}$ is either a Pisot number (algebraic integer with all Galois conjugates inside the unit disk) or a Salem number (algebraic integer with all conjugates on or inside the unit circle, with at least one on the circle).
The Pisot/Salem classification is coarser than SE but finer than the Perron eigenvalue alone.

**Rank invariant.** The rank $n$ of $M$ (alphabet size) is not SE-invariant — SE can increase rank.
The post-quotient $\mathrm{cl\text{-}inv}^{(n)}$ has rank $n$ (by the [step-$n$ cohomological rank theorem](../theorems/step-n-cohomological-rank-theorem.md)), but two SE matrices of different sizes still have isomorphic dimension groups.

## Coarser invariants

| Invariant | Type | SE-invariant? |
|---|---|---|
| Perron eigenvalue $\lambda_\mathrm{PF}$ | Real number | Yes |
| Characteristic polynomial | Polynomial | No (coarser) |
| Pisot / Salem type | Binary | Yes |
| Rank $n$ | Integer | No (SE can change rank) |
| Dimension group $\mathrm{DG}(\mathcal{S})$ | Ordered abelian group | Yes (complete SE invariant) |

## Role in the corpus

The universality class of a substitution settling determines its RG fixed-point behavior: two settlings in the same class have isomorphic classifying invariants and produce the same asymptotic cohomological data.
Different classes are physically distinct — they produce different spacetime-volume growth rates (different $\lambda_\mathrm{PF}$) and different ordered-group structures (different dimension groups).

In the causal-set direction ([causal-set-substitution-settling](../objects/causal-set-substitution-settling.md)): two causal-set substitution rules with SE matrices produce causal sets that are indistinguishable at the level of the classifying invariant — they're in the same universality class.
The Perron eigenvalue distinguishes coarsely; the dimension group distinguishes completely.
