---
name: step-n-moduli-substack
description: "For each n ≥ 2, the sub-stack of the meta-moduli stack consisting of closure-equivalence classes of step-n substitution rules. The chain {M^(n)}_{n≥2} stratifies the meta-aperiodic stratum by step depth; primitivity required for rank-theorem-based invariance."
kind: substack
symbol: "M^(n)"
parameter-range: "n ≥ 2"
defined-as: "M^(n) := {[S] ∈ M^meta_aper : S is closure-equivalent to a primitive step-n substitution rule}"
contains: "closure-equivalence classes of primitive step-n rules"
stratifies: "the aperiodic stratum M^meta_aper"
depends-on: [step-n-substitution-recurrence, meta-moduli-prestack, aperiodic-classifying-invariant]
derives-from: docs/dev/scraps/step-n-moduli-substack.md
---

# Step-n moduli sub-stack

The sub-stack of the meta-moduli-stack consisting of closure-equivalence classes of step-`n` substitution rules. The collection `{M^(n)}_{n ≥ 2}` stratifies the meta-aperiodic stratum `M^meta_aper` by step depth.

## Definition

For each `n ≥ 2`:

$$\mathscr{M}^{(n)} \;:=\; \bigl\{\, [\mathcal{S}] \in \mathscr{M}^{\mathrm{meta}}_{\mathrm{aper}} \,:\, \mathcal{S} \text{ is closure-equivalent to a primitive step-}n \text{ substitution rule} \,\bigr\}.$$

A meta-point `[S]` is in `M^(n)` iff **some** representative of the closure-equivalence class is a primitive step-`n` substitution rule.

## Primitivity requirement

A substitution rule is **primitive** if some power of the substitution matrix is strictly positive — equivalently, every letter eventually substitutes through every other letter.

Primitivity is required because:

- The **rank-theorem-based step-depth invariance** depends on primitive iteration. Non-primitive rules can have the substitution matrix decompose into blocks; the step-depth becomes ill-defined across blocks.
- The **Anderson–Putnam direct-limit cohomology rank** is computed correctly only for primitive substitutions. Non-primitive cases have multiple invariants per substitution matrix.

Non-primitive substitution rules form a separate sub-residue not covered by the step-`n` stratification — they belong in a different sub-stack with different invariants.

## The chain `M^(2) → M^(3) → ⋯`

The step-shift morphism `σ: M^(n) → M^(n+1)` embeds step-`n` sub-stacks into step-(`n+1`) sub-stacks (a step-`n` rule is trivially a step-(`n+1`) rule by adjoining a degenerate level).

The chain `M^(2) → M^(3) → ⋯` is an ascending chain in the 2-category of stacks. Its **colimit** is the `step-n-fixed-point` object `M^(∞)` — the renormalization-group fixed point at infinite step depth (sibling $thing).

## Stratification of the meta-aperiodic stratum

The aperiodic stratum `M^meta_aper` of the meta-moduli stack is exactly the union of all step-`n` sub-stacks plus the "step-`∞`" colimit:

$$\mathscr{M}^{\mathrm{meta}}_{\mathrm{aper}} \;=\; \bigcup_{n \geq 2} \mathscr{M}^{(n)} \;\cup\; \mathscr{M}^{(\infty)}.$$

Each meta-aperiodic point belongs to exactly one `M^(n)` (or to `M^(∞)`). The step-`n` invariant labels which one.

## Position

`finite-settlement-algebra/hacking/library/step-n-moduli-substack/`. Settling tier — the step-`n` sub-stack of the meta-moduli stack's aperiodic stratum.

## Derivation source

Adapted from `predication-categories/objects/step-n-moduli-substack.md`, preserved at `docs/dev/scraps/`.
