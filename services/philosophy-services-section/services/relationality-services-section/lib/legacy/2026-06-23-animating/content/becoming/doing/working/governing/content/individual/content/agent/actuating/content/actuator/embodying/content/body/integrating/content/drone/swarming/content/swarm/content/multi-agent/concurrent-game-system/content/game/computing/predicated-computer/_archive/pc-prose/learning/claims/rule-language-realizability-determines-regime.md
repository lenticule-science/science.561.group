---
type: theorem
class: engineering-claim
status: proved
depends-on: [closure-rule-system, regime-record, four-regime-dichotomy, strict-regime-realizability, scott-continuous-regime-realizability, transfinite-bounded-regime-realizability, aperiodic-regime-realizability, rule-language-pi2-schemas-realizability, rule-language-second-order-realizability, rule-language-ordinal-arithmetic-realizability, rule-language-fragment-realizability-refinement, scott-continuous-closure, closure-rule-language]
see-also: [regime-classification-for-substrate, regime-discipline, strict-regime-engineering-envelope, scott-continuous-regime-engineering-envelope, transfinite-bounded-regime-engineering-envelope, aperiodic-regime-engineering-envelope]
---

# A substrate's rule-language fragment, base finiteness, and state-space cofinality jointly determine its regime

**Claim.** Let $\mathcal{S}$ be the substrate's [closure-rule system](../objects/closure-rule-system.md). The triple `(rule-language-fragment, base-finiteness, state-space-cofinality)` — the fragment of the [closure-rule language](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-language.md) the system's rules are drawn from, the finiteness/infiniteness declarations of $\mathbf{L}, E, \mathcal{C}$, and the state-space cofinality (countable vs $\geq \omega_1$) — determines the substrate's regime among `{strict, scott-continuous, transfinite-bounded, aperiodic}`. The determination is a function:

| Rule-language fragment | Base finiteness | Cofinality | Regime |
|---|---|---|---|
| quantifier-free | all of $\mathbf{L}, E, \mathcal{C}$ finite | n/a | strict |
| quantifier-free | at least one infinite | n/a | scott-continuous |
| with $\forall$-blocks | at least one infinite | countable state-space cofinality | transfinite-bounded |
| with $\forall$-blocks | at least one infinite | $\geq \omega_1$ state-space cofinality | aperiodic |

The function is *exhaustive* (every conformant substrate's `(fragment, base-finiteness, state-space-cofinality)` triple lands in one of the four rows) and *deterministic* (a substrate's regime is fully fixed by the triple, with no runtime contingency). The cofinality input is vacuous in the strict and Scott-continuous rows (quantifier-free rules do not depend on it) and is the discriminating coordinate in the with-$\forall$-blocks rows (countable cofinality → transfinite-bounded; $\geq \omega_1$ → aperiodic).

The result resolves the engineering question of which closure-rule language the substrate can use without crossing regimes: any rule-language extension that stays within a row preserves the regime; any extension crossing a row's boundary changes the regime, with corresponding engineering envelope changes per the four [regime engineering envelope theorems](regime-discipline.md).

## Why this holds

The function is the substrate-level instance of [four-regime-dichotomy](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md) plus the per-regime realizability theorems. The math result establishes that the closure ordinal $\kappa$ partitions into four ranges; the engineering function specifies *which substrate parameters land in which range*.

**Strict regime row (quantifier-free + all-finite).** Per [four-regime-dichotomy](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md), finite $\mathbf{L}, E, \mathcal{C}$ and quantifier-free rules give $\kappa < \omega$. Per [strict-regime-realizability](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/strict-regime-realizability.md), the strict regime's realizable $L_{\mathrm{ns}}$-family on a finite base under quantifier-free rules is exactly the finite-settlement family — no firing ordinals; $H^1 = 0$.

**Scott-continuous regime row (quantifier-free + some-infinite).** Quantifier-free antecedents make the closure operator [Scott-continuous](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/scott-continuous-closure.md): the closure commutes with directed colimits because no antecedent requires waiting for an infinite join to commit. Per [four-regime-dichotomy](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md), this gives $\kappa = \omega$ on infinite-base substrates. Per [scott-continuous-regime-realizability](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/scott-continuous-regime-realizability.md), the realizable $L_{\mathrm{ns}}$-family is the $\omega$-prefix-bounded family — no firing ordinals; $H^1 = 0$ via AB5.

**Transfinite-bounded regime row (with-$\forall$-blocks + countable cofinality).** Per [transfinite-bounded-regime-realizability](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/transfinite-bounded-regime-realizability.md), the bare $\Pi_1$+$<$ rule-language fragment with countable state-space realizes $L_{\mathrm{ns}}(\mathcal{S}, U) = \{\mu < \kappa : \mu \text{ countable limit}\}$ — initial segments of countable limit ordinals — with $\kappa$ a specific countable ordinal $> \omega$. The realizable $L_{\mathrm{ns}}$-subsets form a one-parameter family indexed by $\kappa$, sitting in the transfinite-bounded range. Per the four PredCat per-fragment realizability theorems — [rule-language-pi2-schemas-realizability](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/rule-language-pi2-schemas-realizability.md), [rule-language-second-order-realizability](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/rule-language-second-order-realizability.md), [rule-language-ordinal-arithmetic-realizability](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/rule-language-ordinal-arithmetic-realizability.md), and [rule-language-fragment-realizability-refinement](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/rule-language-fragment-realizability-refinement.md) — richer fragments (named-ordinal, ordinal-arithmetic, $\Pi_2$-schema, second-order) extend the realizable family but stay within the transfinite-bounded regime as long as the cofinality remains countable. The four refinement theorems together establish that a substrate may extend its rule-language fragment along the refinement chain without crossing into a different regime row, provided the cofinality declaration is held fixed.

**Aperiodic regime row (with-$\forall$-blocks + $\omega_1$ cofinality).** Per [aperiodic-regime-realizability](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/aperiodic-regime-realizability.md), the bare $\Pi_1$+$<$ rule-language fragment on $E = \omega_1$ realizes $L_{\mathrm{ns}}$-subsets that are initial segments of countable limit ordinals up to $\omega_1$. The cofinality jump from countable to $\omega_1$ is what distinguishes aperiodic from transfinite-bounded; the rule-language fragment is the same. The four PredCat per-fragment realizability theorems above also apply here, with the realizable family extended by the $\omega_1$-cofinality.

**Exhaustivity.** Every conformant substrate has a declared rule-language fragment (per [closure-rule-system](../objects/closure-rule-system.md)'s `rule-language-fragment` field) and a declared base finiteness (per [regime-record](../objects/regime-record.md)'s `base-finiteness` field). The two declarations land in exactly one row.

**Determinism.** The regime is *not* a runtime discovery — the rule-language fragment and base finiteness are substrate parameters declared at substrate-record creation time per [regime-record](../objects/regime-record.md). The four-regime-dichotomy guarantees that these parameters fully determine the regime; no runtime input can change it.

## Engineering consequence

This theorem closes the engineering loop on what closure-rule language a substrate can support: the engineer declares the rule-language fragment as part of the [closure-rule system](../objects/closure-rule-system.md), declares the base finiteness and cofinality as part of the [regime-record](../objects/regime-record.md), and the regime — with its full engineering envelope per the four envelope theorems — follows.

Concrete engineering decisions the theorem enables:

- **Choosing the rule language for a new substrate.** An engineer building a substrate over a finite knowledge base picks any quantifier-free fragment and gets the strict regime's engineering envelope. An engineer who wants an infinite knowledge base with the strict regime's envelope must restrict to quantifier-free rules; allowing $\forall$-blocks changes the regime.
- **Extending an existing substrate's rule language.** An engineer adding a new rule to a substrate must check whether the new rule's antecedent crosses the row's boundary. Adding a $\forall$-block rule to a quantifier-free system promotes the regime from strict / Scott-continuous to transfinite-bounded / aperiodic; the engine, audit, federation, and snapshot disciplines must be upgraded accordingly.
- **Federation across substrates with different rule languages.** Per [federation-convergence](federation-convergence.md), federation between substrates in different regimes is admissible only with prefix-scoping or trajectory-shipping. The theorem makes the rule-language difference checkable: two substrates federate cleanly iff their fragments + bases land in compatible regime rows.
- **Reasoning about rule-language extensions.** The math theorems on [rule-language-fragment-realizability-refinement](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/rule-language-fragment-realizability-refinement.md) establish that within the with-$\forall$-blocks rows, richer fragments (named-ordinal-equality, ordinal-arithmetic, $\Pi_2$-schema, second-order) extend the realizable $L_{\mathrm{ns}}$-family without changing the regime. An engineer adding such richer constructs to a transfinite-bounded substrate stays within the transfinite-bounded engineering envelope.

The theorem therefore answers the previously-set-aside [rule-language question](questions/rule-language.md) at the engineering level: the substrate does not need to commit to a single rule language, but it does commit to a *fragment row*, with the row determining the engineering envelope.

## What the theorem rules out

- **Substrates whose rule-language fragment + base do not match their declared regime.** A substrate declaring `regime: strict` with `rule-language-fragment: with-forall-blocks` is misdeclared per [regime-classification-for-substrate](regime-classification-for-substrate.md); the theorem makes this misdeclaration structurally detectable.
- **Substrates that hope to operate in a regime "lighter" than their rule-language allows.** A substrate with $\forall$-block rules cannot be operated as if it were strict; settle invocations on $\forall$-block rules cannot terminate at finite stages.
- **Substrates that promise to "switch regimes at runtime."** The regime is fixed by substrate parameters declared at substrate-record creation; runtime "regime switching" requires either (a) editing the regime-record and closure-rule system as substrate operations (producing a new substrate version), or (b) scope-level restrictions per [closure-conditions-composability](closure-conditions-composability.md) (where each scope has its own regime-compatible rule subset).

## What the theorem requires

- The substrate's [closure-rule system](../objects/closure-rule-system.md) declares its `rule-language-fragment`.
- The substrate's [regime-record](../objects/regime-record.md) declares its `base-finiteness` and `state-space-cofinality`.
- The fragment declaration matches the rules' actual antecedent shapes (per the closure-rule-system's `rule-language fragment matches rules` invariant).
- The closure operator generated by the rule system is well-defined per [closure-operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md).

## Position

This theorem completes the substrate's *rule-language discipline*: rule-language is not arbitrary, and not free-form — it is constrained by the row the engineer chooses, with the row determining the engineering envelope. Together with [regime-classification-for-substrate](regime-classification-for-substrate.md) and the four [regime engineering envelope theorems](regime-discipline.md), this establishes the substrate's full per-regime program: declare the rule-language fragment, declare the base, get the regime, get the envelope.
