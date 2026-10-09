---
kind: question
status: open
explores: [four-regime-dichotomy, settling-as-type-realization, non-scott-continuous-firing-ordinal, aperiodic-classifying-invariant, realizability-cardinality-bound, transfinite-bounded-regime-h1-generators]
---

# The four regimes as a model-theoretic stability hierarchy

The [four-regime dichotomy](../../../../../../valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md) classifies settlings by closure-ordinal complexity: strict ($\kappa < \omega$), Scott-continuous ($\kappa = \omega$), transfinite-bounded ($\omega < \kappa < \omega_1$), aperiodic ($\kappa \geq \omega_1$). Read through the [model-theoretic perspective](settling-as-type-realization.md) — settlings as type-realization processes — this taxonomy is structurally **Morley's stability hierarchy**:

| Regime | Model-theoretic correspondence |
|---|---|
| Strict ($\kappa < \omega$) | Decidable / $\omega$-categorical |
| Scott-continuous ($\kappa = \omega$) | $\omega$-stable |
| Transfinite-bounded ($\omega < \kappa < \omega_1$) | Stable, $|S(A)| \leq |A|^+ + \aleph_1$ |
| Aperiodic ($\kappa \geq \omega_1$) | Unstable / $\omega_1$-many types |

Open: develop the correspondence rigorously, with translations between the corpus's regime invariants ($L_{\mathrm{ns}}$, $\mathrm{cl}\text{-}\mathrm{inv}$) and the model-theoretic invariants (Morley rank, $U$-rank, type cardinality bounds).

## Why this matches

**Strict** ↔ **decidable / $\omega$-categorical.** A strict-regime settling has $\kappa < \omega$ — finitely many closure steps suffice. The type space at each stage is finite; all types get realized in finitely many steps. This is the model-theoretic analog of decidability: the theory's models are all isomorphic in a finite check.

**Scott-continuous** ↔ **$\omega$-stable.** $\omega$-stability requires $|S_n(A)| \leq |A| + \aleph_0$ for any countable $A$. In the corpus's setting, Scott-continuous closure means the type space at each stage is a directed colimit of finite stages — countable, with a clean directed-colimit structure. This is structurally $\omega$-stable: types are "tame" enough to be enumerable.

**Transfinite-bounded** ↔ **stable.** Stability with $\omega < \kappa < \omega_1$ many types over a countable base. Each $\mu \in L_{\mathrm{ns}}(\kappa)$ realizes a new type that wasn't a directed-colimit of earlier types — a "discontinuity" in the type space. This is structurally a stable theory with a moderate type-space cardinality.

**Aperiodic** ↔ **unstable.** $\omega_1$-many types over a countable base. Forking is non-trivial — types depend on parameters in essential ways. This is structurally an unstable theory: type spaces are "wild," and the classifying machinery (Anderson-Putnam direct-limit) is needed because no smaller invariant suffices.

## Sub-questions

1. **Make the correspondence precise.** For each regime, identify the model-theoretic stability class it matches, with the type-space cardinality bound. Verify the corpus's classifying invariants match the model-theoretic invariants (e.g., $|L_{\mathrm{ns}}(\kappa)|$ matches the $U$-rank or some cardinality of the type space).

2. **Forking in the corpus.** Forking is the central concept of stability theory. In the corpus, forking would be: a NSC firing $\mu_1$ "forks over" earlier firings $\mu_2$ iff the firing's antecedent essentially uses content from $\mu_2$. Characterize the forking graph; show it is a *partial order* on $L_{\mathrm{ns}}$ refining the natural ordinal order. Conjecture: the strong-MLD orbit structure correlates with the forking graph's structure.

3. **Morley rank in the corpus.** Morley rank is a foundational notion in $\omega$-stable theories. The corpus's analog: the Morley rank of a cell is the maximum length of a forking chain ending at that cell's firing. For the corpus's typical aperiodic settlings, Morley rank takes values up to $\omega_1$ — matching the closure ordinal. Make this precise.

4. **Stability and the realizability program.** The corpus's [realizability cardinality bound](../theorems/realizability-cardinality-bound.md) gives at most $2^{\aleph_0}$ realizable classifying classes. This matches the model-theoretic "number of types" bound for active theories: at most $\aleph_1$ types over a countable base in the absence of forking. Connect explicitly.

## What the correspondence gives

If established at draft level:

- **The four-regime classification has a model-theoretic foundation.** It's not a corpus-specific taxonomy; it's the model-theoretic stability hierarchy applied to the corpus's setting. This connects the corpus to the broader stability-theory literature.

- **Stability theorems transport.** Established results in stability theory (the existence of forking calculus, prime models, geometric structure of types) become available to the corpus, with the bilattice-valued / paraconsistent generalization as substantive new content.

- **A clean way to state structural results.** Many of the corpus's classification statements have model-theoretic translations that are cleaner than their settling-theoretic forms. E.g., "two transfinite-bounded settlings are MLD iff their firing-ordinal sets agree" becomes "two stable theories are bi-elementarily equivalent iff their type spaces over a chosen base agree as Stone spaces" — closer to the heart of stability theory.

## Connection to existing structure

This question is the *technical core* of the model-theoretic framing direction. It connects:

- The [four-regime dichotomy](../../../../../../valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md) — the regimes are now stability classes.
- The [classifying invariants](../objects/aperiodic-classifying-invariant.md) — restated as $U$-rank or similar.
- The [realizability program](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/realizability-program.md) — refined via type-space structure.

## Position in the program

Companion to [settling-as-type-realization](settling-as-type-realization.md). This question develops the regime-stability correspondence explicitly; the master question develops the type-realization framing.

Concrete entry point: the strict regime corresponds to decidable type-space structure — explicit and computable. Verify the correspondence on a strict-regime example, then extend to Scott-continuous and transfinite-bounded by the directed-colimit / direct-limit machinery. The aperiodic case is the test of the correspondence's depth.
