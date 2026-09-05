---
kind: narrative
status: current
discusses: [step-n-substitution-recurrence, step-n-cohomological-rank-theorem, anderson-putnam-direct-limit, four-bilattice]
---

# Pisot numbers, substitutions, and the corpus

The corpus's [step-$n$ substitution-recurrence](../concepts/step-n-substitution-recurrence.md) family is the corpus's manifestation of three established mathematical areas:

1. **Pisot-number theory** (algebraic number theory) — at the growth-rate level.
2. **Substitution dynamical systems** (Bratteli-Vershik, primitive substitutions) — at the substitution level.
3. **Tiling cohomology** (Anderson-Putnam direct-limit) — at the cohomology level.

This narrative traces the connections, identifies what the corpus inherits from each, and what the corpus's bilattice-flavor / closure-rule extension adds beyond.

## Pisot-number theory

A **Pisot number** is a real algebraic integer $\lambda > 1$ all of whose Galois conjugates lie strictly inside the unit disk. The smallest Pisot number is the **plastic number** $\rho \approx 1.3247$ (real root of $x^3 = x + 1$); the next is the **golden ratio** $\phi \approx 1.618$ ($x^2 = x + 1$); subsequent Pisot numbers form a discrete sequence with accumulation points starting at $\rho$.

For the corpus's step-$n$ substitution family: the canonical step-$n$ substitution's growth rate (Perron-Frobenius eigenvalue) is a Pisot number satisfying a degree-$n$ minimal polynomial. The family of step-$n$ substitutions corresponds to a parameterized family of Pisot numbers — one canonical Pisot per $n$.

The corpus's [critical-exponents-at-step-n-fixed-point theorem](../theorems/critical-exponents-at-step-n-fixed-point.md) connects the corpus's RG flow's limiting behavior to Pisot accumulation points: as $n \to \infty$, the canonical step-$n$ growth rates approach a Pisot accumulation point.

## Substitution dynamical systems

A **substitution dynamical system** is a topological dynamical system constructed from a primitive substitution $\sigma$ on a finite alphabet $\Sigma$. The system's space is the inverse-limit of substitutions $\sigma : \Sigma^* \to \Sigma^*$; the dynamics is the shift acting on the inverse limit.

For the corpus: each step-$n$ substitution rule generates a substitution dynamical system. The corpus's [aperiodic-regime classification](../theorems/aperiodic-regime-classification.md) (specialized to substitution-flavored rules) recovers the standard classification of substitution dynamical systems up to *Mutually Locally Derivable* (MLD) equivalence — the equivalence relation under which Anderson-Putnam classifies them.

Bratteli-Vershik systems are an alternative presentation of substitution dynamical systems via Bratteli diagrams; the corpus's framework should be compatible with this presentation, though the precise translation is open work.

## Tiling cohomology and Anderson-Putnam

The **Anderson-Putnam direct-limit construction** computes the Čech cohomology of the substitution-tiling space as a direct limit of cohomologies on finite cellular complexes (Anderson-Putnam complexes). For an $n$-letter primitive substitution:

$$\check{H}^1(\Omega_\sigma) \;\cong\; \mathbb{Z}^n.$$

The corpus's [step-n cohomological rank theorem](../theorems/step-n-cohomological-rank-theorem.md) recovers this exactly at the post-quotient level: the post-shift-quotient classifying invariant $\mathrm{cl}\text{-}\mathrm{inv}^{(n)}$ has rank exactly $n$, matching Anderson-Putnam.

## What the corpus adds beyond these

Three structurally distinctive contributions:

**1. Pre-quotient classifying invariants.** The corpus's pre-quotient $\mathrm{cl}\text{-}\mathrm{inv}$ has uncountable rank, with the post-quotient reduction to $\mathbb{Z}^n$ matching Anderson-Putnam. The pre-quotient version is *strictly richer* — it distinguishes settlings that Anderson-Putnam identifies. This is the corpus's "fine moduli" content beyond the literature's "coarse moduli."

**2. Bilattice-valued / d-frame extension.** The corpus's bilattice flavor extends the standard substitution-cohomology framework to track:

- Strong-MLD orbit types (truth-only / falsity-only / $\top$).
- d-frame structure on classifying generators ($D_\mu$).
- Verdier-dual presentations via cosheaf homology.

None of this is in the standard substitution-tiling literature.

**3. RG-flow structure on the substitution family.** The corpus's [step-shift morphism](../morphisms/step-shift-morphism.md) and [renormalization-group-flow narrative](renormalization-group-flow.md) give the substitution family a structural inter-level morphism that the standard literature doesn't develop systematically. Each substitution is studied individually in the literature; the corpus's framework treats the family as an ascending chain with explicit RG-flow morphisms.

## What this means for the corpus's literature position

The corpus's step-$n$ direction connects to *three* established areas with concrete points of contact:

- **Number theorists** working on Pisot numbers can recognize the corpus's RG-flow's limiting behavior as the Pisot accumulation problem.
- **Dynamical-systems researchers** working on substitution systems can recognize the corpus's classification as the standard MLD classification with bilattice-valued enrichment.
- **Tiling-cohomology researchers** can recognize Anderson-Putnam at the post-quotient level, with the corpus's pre-quotient and bilattice extensions as new content.

Each connection is a potential collaboration / publication direction. The corpus's framework's substantive new content lives in the *intersection* of all three areas — the bilattice-valued substitution-tiling cohomology with explicit RG-flow on the parameterized family.

## Position in the program

Companion narrative to [step-n correspondence](step-n-correspondence.md). Where that narrative articulates the corpus's *internal* multi-level structural pattern, this one connects the family to *external* established literature. Together, the two narratives position the step-$n$ family relative to its mathematical context.
