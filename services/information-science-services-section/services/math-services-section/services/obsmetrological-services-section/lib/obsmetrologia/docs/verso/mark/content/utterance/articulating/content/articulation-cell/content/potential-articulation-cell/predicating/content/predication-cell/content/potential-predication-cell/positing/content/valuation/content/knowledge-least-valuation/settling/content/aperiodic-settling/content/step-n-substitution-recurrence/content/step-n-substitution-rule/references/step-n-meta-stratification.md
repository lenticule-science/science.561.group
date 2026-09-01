---
kind: theorem
status: proved
depends-on: [step-n-moduli-substack, step-n-substitution-rule, step-n-cohomological-rank-theorem, meta-stratification-by-regime, meta-moduli-stack-theorem, realizability-cardinality-bound]
---

# Step-n meta-stratification

The meta-aperiodic stratum $\mathscr{M}^{\mathrm{meta}}_{\mathrm{aper}}$ stratifies into [step-$n$ sub-stacks](../objects/step-n-moduli-substack.md) plus a non-substitutive residue. **Refines the [meta-stratification by regime](meta-stratification-by-regime.md)** by the step-depth parameter.

## Statement

**Theorem (step-n meta-stratification).** *The substitutive part of the meta-aperiodic stratum decomposes as a disjoint union*

$$\mathscr{M}^{\mathrm{meta}}_{\mathrm{aper, sub}} \;=\; \bigsqcup_{n \geq 2} \mathscr{M}^{(n)},$$

*where $\mathscr{M}^{(n)}$ is the closure-equivalence classes of primitive step-$n$ substitution rules, and the disjoint-union structure is well-defined: closure-equivalent primitive substitution rules have the same step-depth $n$.*

*The full meta-aperiodic stratum is*

$$\mathscr{M}^{\mathrm{meta}}_{\mathrm{aper}} \;=\; \mathscr{M}^{\mathrm{meta}}_{\mathrm{aper, sub}} \;\sqcup\; \mathscr{M}^{\mathrm{meta}}_{\mathrm{aper, residue}},$$

*with $\mathscr{M}^{\mathrm{meta}}_{\mathrm{aper, residue}}$ — the non-substitutive residue — non-empty and in fact of cardinality $2^{\aleph_0}$.*

## Proof

The proof has three parts: (1) well-definedness of the step-depth assignment, (2) disjointness of the $\mathscr{M}^{(n)}$ family, (3) residue non-emptiness via cardinality.

### Part 1: Step-depth is a closure-invariant of primitive substitution rules

Let $\mathcal{S}, \mathcal{S}'$ be primitive substitution rules with substitution matrices $M \in \mathrm{Mat}_{n \times n}(\mathbb{N})$, $M' \in \mathrm{Mat}_{n' \times n'}(\mathbb{N})$ respectively.
Suppose $\mathcal{S}, \mathcal{S}'$ are closure-equivalent — they generate the same closure operator on the base.

Closure-equivalent rule systems have identical settlings under any increment sequence: same closure operator $\implies$ same fixed-point structure $\implies$ same settlings $\implies$ same settling cohomology and same classifying invariant.

By the [step-$n$ cohomological rank theorem](step-n-cohomological-rank-theorem.md):

$$\mathrm{cl}\text{-}\mathrm{inv}^{(n)}(v_\mathcal{S}) \;\cong\; \mathbb{Z}^n \quad\text{and}\quad \mathrm{cl}\text{-}\mathrm{inv}^{(n')}(v_{\mathcal{S}'}) \;\cong\; \mathbb{Z}^{n'}.$$

But these are the *same* invariant by closure-equivalence, so $\mathbb{Z}^n \cong \mathbb{Z}^{n'}$ as abelian groups, forcing $n = n'$.

Hence the step-depth $n$ is determined by the closure-equivalence class.

### Part 2: Disjointness of the $\mathscr{M}^{(n)}$ family

Each meta-point in $\mathscr{M}^{\mathrm{meta}}_{\mathrm{aper, sub}}$ is the closure-equivalence class of some primitive substitution rule $\mathcal{S}$.
By Part 1, the step-depth $n(\mathcal{S})$ is well-defined.
Hence the assignment $[\mathcal{S}] \mapsto n([\mathcal{S}])$ partitions $\mathscr{M}^{\mathrm{meta}}_{\mathrm{aper, sub}}$ into disjoint subsets indexed by $n \geq 2$.
The $n$-th subset is exactly $\mathscr{M}^{(n)}$.

### Part 3: Residue non-emptiness via cardinality

The set of primitive step-$n$ substitution rules at fixed $n$ is countable (countably many $n \times n$ integer matrices).
The union $\bigsqcup_n \mathscr{M}^{(n)}$ is therefore countable.

By the [realizability cardinality bound theorem](realizability-cardinality-bound.md), the meta-aperiodic stratum $\mathscr{M}^{\mathrm{meta}}_{\mathrm{aper}}$ contains at least $2^{\aleph_0}$ distinct meta-points (one per realizable aperiodic classifying class).

Hence

$$\bigl|\mathscr{M}^{\mathrm{meta}}_{\mathrm{aper, residue}}\bigr| \;\geq\; \bigl|\mathscr{M}^{\mathrm{meta}}_{\mathrm{aper}}\bigr| - \bigl|\mathscr{M}^{\mathrm{meta}}_{\mathrm{aper, sub}}\bigr| \;\geq\; 2^{\aleph_0} - \aleph_0 \;=\; 2^{\aleph_0}.$$

The residue is non-empty, and in fact uncountable. $\square$

## Remark on residue structure

The cardinality argument establishes that $\mathscr{M}^{\mathrm{meta}}_{\mathrm{aper, residue}}$ is uncountable but does not exhibit a *concrete* non-substitutive aperiodic closure rule.
Identifying explicit residue points — natural meta-aperiodic rules whose closure operators do not arise from any substitution-matrix structure — is open work.
Candidate sources:

- Closure rules whose antecedents involve genuinely non-finitary structure (e.g., $\Pi_2$ or higher rules with multi-position quantifier alternation that doesn't reduce to a finite-look-back substitution recurrence).
- Rules constructed from non-computable parameters (e.g., closure operators encoding non-recursive sequences) — abundant by cardinality but not naturally arising in standard substitution dynamics.
- The S-adic non-stationary case: rules whose effective substitution-step varies with stage, which the corpus's step-$n$ family at fixed $n$ does not capture (compare with [@berthe-delecroix2014]).

The non-substitutive residue is therefore *cardinality-large but example-poor* — much like the residue of "explicitly nameable real numbers" inside the uncountable reals.

## Note on transfinite-induction meta-classification

The transfinite-induction $\Pi_1$ rule (see [transfinite-induction-meta-classification](../examples/transfinite-induction-meta-classification.md)) is *not* meta-aperiodic — it lies in $\mathscr{M}^{\mathrm{meta}}_{\mathrm{TB}}$ (meta-transfinite-bounded), one stratum below.
It is therefore not an example of the residue, contrary to a (now-corrected) earlier draft of this theorem.
The residue lives entirely within the meta-aperiodic stratum, not in the lower regimes.

## What this gives

Three structural consequences:

**1.
The aperiodic regime has internal substitution-flavor structure.** The substitutive part of meta-aperiodic decomposes by step-depth into a tower $\{\mathscr{M}^{(n)}\}_{n \geq 2}$.
Every named substitution dynamical system in the literature (Fibonacci, Padovan, Tribonacci, Tetranacci, Penrose, Thue-Morse, etc.) is in one specific $\mathscr{M}^{(n)}$.

**2.
Most meta-aperiodic points are non-substitutive.** By cardinality, the substitutive part is countable while the full stratum is at least $2^{\aleph_0}$.
The "named substitution dynamics" of the literature is a measure-zero (in cardinality terms) sub-population of the meta-aperiodic universe.

**3.
The step-depth is a structural invariant.** Closure-equivalent primitive substitution rules have the same step-depth, justifying step-$n$ as a meaningful structural index on $\mathscr{M}^{\mathrm{meta}}_{\mathrm{aper, sub}}$ rather than just a labeling artifact.

## Position in the program

Refines the [meta-stratification by regime](meta-stratification-by-regime.md) on its aperiodic stratum.
Combined with the [step-$n$ cohomological rank theorem](step-n-cohomological-rank-theorem.md), it establishes the step-$n$ family as a graded structural decomposition of the substitutive part of meta-aperiodic.

The residue's structure — particularly its non-substitutive aperiodic closure rules — is open work; the [canonical step-shift morphism question](../questions/canonical-step-shift-morphism.md) and the literature comparison with S-adic systems [@berthe-delecroix2014] and Bratteli-Vershik diagrams [@durand-host-skau1999] are entry points.
