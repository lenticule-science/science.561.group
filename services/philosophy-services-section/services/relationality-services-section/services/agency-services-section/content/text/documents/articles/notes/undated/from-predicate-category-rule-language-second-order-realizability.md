---
type: theorem
status: sketch
depends-on: [rule-language-fragment-realizability-refinement, transfinite-bounded-regime-realizability, aperiodic-regime-realizability]
title: "Rule-language fragment realizability: second-order quantifiers"
description: Conjecture (second-order quantifiers).
---

# Rule-language fragment realizability: second-order quantifiers

**Conjecture (second-order quantifiers).** *With quantification over subsets of $E$ (the entity set), the closure-rule language reaches second-order expressivity, and realizability conjecturally extends to Borel/analytic subsets of countable limits.*

## What's open

- **Connection to second-order monotone induction.** The classical results on $\Pi^1_1$-monotone-induction give the right framework but need to be adapted to predication categories' specific closure-rule structure (which is finite-arity-bounded but with bilattice-valued conclusions rather than classical-valued).

- **Lower bound.** Constructive encoding of analytic subsets via second-order rule schemas. The proof would use $\Pi^1_1$-monotone definability to encode Borel subsets as fixed points of second-order rule systems.

- **Upper bound.** Syntactic complexity argument: every rule has a $\Pi^1_1$- (or higher) definable range, and the system's $L_{\mathrm{ns}}$ is a $\Pi^1_1$- (or higher) definable subset of $\omega_1$.

- **Connection to the corpus's increment-support assumption.** Realizability under second-order quantifiers depends crucially on whether the increment sequence has countable support. The [parent refinement theorem](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/communicating/content/language/_archive/rule-language-fragment-realizability-refinement.md)'s "common limit" section notes that countable-support increments cap realizability at $2^{\aleph_0}$; second-order quantifiers stay below this cap if the rule schemas don't generate uncountable-support increments.
