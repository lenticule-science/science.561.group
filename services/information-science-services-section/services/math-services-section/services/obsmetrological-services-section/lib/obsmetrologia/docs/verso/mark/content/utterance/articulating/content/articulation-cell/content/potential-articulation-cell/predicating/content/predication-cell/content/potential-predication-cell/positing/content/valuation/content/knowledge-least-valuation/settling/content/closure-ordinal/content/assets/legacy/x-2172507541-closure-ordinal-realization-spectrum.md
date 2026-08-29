---
type: question
class: internal
status: open
explores: [closure-ordinal, four-regime-dichotomy, settling-bound, rule-language-fragment-realizability-refinement]
---

# Spectrum of realizable closure ordinals

The corpus's [four-regime dichotomy](../theorems/four-regime-dichotomy.md) classifies settlings by closure-ordinal cardinality: strict ($\kappa < \omega$), Scott-continuous ($\kappa = \omega$), transfinite-bounded ($\omega < \kappa < \omega_1$), aperiodic ($\kappa \geq \omega_1$). Within each regime, fine structure is unstudied:

- **Strict**: which finite $\kappa$ are realized? Probably every $\kappa \in \mathbb{N}$, but proof?
- **Transfinite-bounded**: which countable limit ordinals are realized? Every countable ordinal? Some specific subclass (e.g., admissible ordinals, $\Sigma_1$-recursive ordinals, etc.)?
- **Aperiodic**: $\kappa = \omega_1$ for every aperiodic settling currently in the corpus. Are there aperiodic settlings with strictly larger closure ordinals (e.g., $\kappa = \omega_1 + \omega$, $\kappa = \omega_2$)?

## Open

1. **Realization function**. Define $\mathrm{cl} : \{\text{closure rules}\} \to \mathrm{Ord}$ sending a rule to its closure ordinal (over the rule's natural base). What's the image of $\mathrm{cl}$? Is it all of $[0, \omega_1]$? All of $[0, \omega_2]$? Bounded?

2. **Connection to recursion-theoretic ordinals**. The transfinite-bounded regime contains every countable closure ordinal. Some countable ordinals are *recursive* (computable from a finite description), some are larger. The Church-Kleene ordinal $\omega_1^{CK}$ is the supremum of recursive ordinals. Is there a structural difference between settlings whose closure ordinal is $< \omega_1^{CK}$ vs. those whose closure ordinal is $\geq \omega_1^{CK}$?

3. **Realization complexity vs. rule complexity**. The [rule-language fragment realizability refinement](../theorems/rule-language-fragment-realizability-refinement.md) shows richer rule languages realize larger families of $L_{\mathrm{ns}}$ subsets. Does the closure-ordinal *reach* track this — richer fragments realize larger closure ordinals?

4. **Boundary phenomena**. Are there settlings whose closure ordinal is *exactly* $\omega$? Exactly $\omega \cdot 2$? The transition between regimes has fine structure. What separates two settlings whose closure ordinals are both transfinite-bounded but differ at, say, $\omega^2$ vs. $\omega^\omega$?

5. **Restriction of the realization function**. For a fixed entity-set cardinality $|E|$, which closure ordinals are realized? Probably bounded by $|E|^+$ (the cardinal successor of $|E|$).
