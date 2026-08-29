---
kind: example
status: draft
depends-on: [anderson-putnam-direct-limit, fibonacci-classifying-invariant, fibonacci-substitution-settling, aperiodic-regime-classification, anderson-putnam1998]
instantiates: [aperiodic-regime-classification]
lineage: 5
---

# Fibonacci substitution: corpus vs Anderson-Putnam

Side-by-side comparison of the corpus's Fibonacci classifying invariant with [@anderson-putnam1998]'s computation. **Sub-lineage 5a** instance demonstrating the corpus's framework on the literature's most-developed aperiodic case.

## Anderson-Putnam Fibonacci computation

For the Fibonacci substitution $\sigma : a \mapsto ab, b \mapsto a$ acting on bi-infinite sequences in $\{a, b\}^\mathbb{Z}$, the substitution induces a self-map of the Anderson-Putnam complex $\Gamma_\sigma$. The Čech cohomology of the inverse-limit space is the direct limit of the induced cohomology maps:

$$\check{H}^1(\Omega_\sigma) \;=\; \varinjlim_n \check{H}^1(\Gamma_\sigma) \;\cong\; \mathbb{Z}^2$$

(rank 2, with generators corresponding to the two tile-types $a$ and $b$).

## Corpus computation

[fibonacci-classifying-invariant](fibonacci-classifying-invariant.md) gives:

$$\mathrm{cl}\text{-}\mathrm{inv}(v_{\text{Fibonacci}}) \;\in\; \bigoplus_{L_{\mathrm{ns}}(\omega_1)} \mathbb{Z}$$

— uncountable rank.

## Reconciling the discrepancy

The two computations differ in cardinality. The reconciliation: Anderson-Putnam quotients by *substitution-shift equivalence* (two tilings related by translation are MLD-equivalent), giving the small invariant. The corpus's $\mathrm{cl}\text{-}\mathrm{inv}$ is the *un-quotiented* version, with one generator per substitution stage.

The corpus's $\sim_{\mathrm{MLD}}$ relation does include settling-shift, so two Fibonacci settlings related by ordinal-shift are MLD-equivalent. After quotient:

$$\mathrm{cl}\text{-}\mathrm{inv}(v_{\text{Fibonacci}}) / \sim_{\mathrm{settling-shift}} \;\cong\; \mathbb{Z}^2 \;=\; \check{H}^1(\Omega_\sigma).$$

The two invariants agree after appropriate quotient.

## What this exhibits

Three observations:

**1. The corpus's invariant generalizes Anderson-Putnam.** Once the appropriate quotient is taken, the corpus's $\mathrm{cl}\text{-}\mathrm{inv}$ recovers the literature's known computation. The framework correctly handles a substantive aperiodic case.

**2. The corpus's invariant carries strictly more data pre-quotient.** The un-quotiented $\mathrm{cl}\text{-}\mathrm{inv}$ has one generator per firing ordinal — a finer invariant than the post-quotient $\mathbb{Z}^2$. This is structurally similar to the difference between fine moduli (full automorphism group) and coarse moduli (visible quotient).

**3. The Anderson-Putnam quotient is a settling-shift quotient.** The corpus's framework makes explicit what's implicit in Anderson-Putnam: the natural MLD-relation is the settling-shift relation, and the small classifying invariant is the post-shift quotient.

## Position in Lineage 5

The L5a literature-comparison instance. Demonstrates that the corpus's framework, applied to a substantive substitution-dynamics example, reproduces the established result via an appropriate quotient. The substantial new content the corpus adds beyond Anderson-Putnam: bilattice-valued invariants, strong-MLD orbit types, paired Verdier duality, deformation theory.
