---
type: question
status: open
explores: [closure-rule-system, four-regime-dichotomy, knowing-as-settling]
see-also: [epistemic-closure, assertion-monotonicity, reified-retraction]
---

# How does the substrate accommodate non-monotonic extensions?

The substrate's standard reading is *monotone in $\leq_k$* (per [assertion-monotonicity](../theorems/assertion-monotonicity.md)): assertions and closure rules can only add information, never retract it. Conflicting evidence becomes $\top$ rather than overwriting; corrections are themselves new assertions, not retractions.

Working knowledge systems often need *non-monotonic* operations: default reasoning ("birds fly, but penguins don't"), belief revision (the AGM postulates: success, inclusion, vacuity, consistency, extensionality), retraction-as-substrate-operation (correcting an assertion that was admitted in error), and stable-model-style negation-as-failure (Datalog with $\neg$ via well-founded semantics). The substrate as currently defined does not naturally accommodate these.

The open question:

> What is the substrate-level treatment of non-monotonicity that
> (a) preserves $\leq_k$-monotonicity for the cells admitted as monotonic,
> (b) adds an explicit non-monotonic-operation discipline as substrate-level operations distinct from assertion,
> (c) maintains the [four-regime classification](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md), and
> (d) accommodates the standard non-monotonic frameworks (default logic, autoepistemic logic, circumscription, well-founded semantics, AGM) as instances of the substrate-level discipline?

## Primary proposal: reified retraction

The most promising approach (the one this note advocates as the working hypothesis) is **reified retraction**:

> A retraction is itself a substrate cell — a meta-predication asserting that a prior assertion is no longer in force — and the closure rules read both the original assertion and the retraction.

Concretely, introduce a meta-predicate $\mathrm{retracted}$ and a closure rule
$$\mathrm{asserted}(c, \alpha, \sigma, \tau_1) \;\wedge\; \mathrm{retracted}(c, \sigma, \tau_2) \;\wedge\; (\tau_2 > \tau_1) \;\Rightarrow\; \mathrm{effective}(c, \mathbf{0})$$
that derives $\mathrm{effective}(c, \mathbf{0})$ when a retraction post-dates an assertion of $c$ from the same source $\sigma$. The substrate's *effective* state at any time $\tau$ is then the projection of the substrate onto the cells whose `effective` value is non-$\mathbf{0}$ at $\tau$.

This preserves $\leq_k$-monotonicity at the cell level — the original assertion remains in the substrate, the retraction is added, both are visible to closure rules — while producing the *appearance* of non-monotonic behaviour at the effective-state level. The substrate's history is monotone; the substrate's effective view is non-monotone, derived by a closure rule that reads the history.

**Properties of reified retraction:**

- **(P1) AGM postulates.** The AGM postulates (success, inclusion, vacuity, consistency, extensionality, recovery) admit a substrate-level reading where each becomes a property of the *effective-state projection* rather than the substrate itself. Recovery — "if you retract $\phi$ and then re-assert $\phi$, the result equals just-asserting-$\phi$" — is automatic because the effective-state derivation reads only the latest assertion or retraction per source.
- **(P2) Defaults as scope-local closure rules.** "Birds fly unless they don't" becomes, in scope $S$, the rule $\mathrm{bird}(x) \wedge \neg\mathrm{retracted}(\mathrm{flies}(x), \cdot, \cdot)|_S \Rightarrow \mathrm{flies}(x)$, evaluated under negation-as-failure-by-scope. Penguins enter the scope with an explicit retraction of `flies(penguin)`, blocking the default.
- **(P3) Source-attributed retraction.** Each retraction names its source, just as each assertion does. Cross-source contestation (one source asserts, another retracts) becomes substrate-level $\top$-on-effective rather than effective-state silence — preserving the contestation discipline.
- **(P4) Regime preservation.** The reified-retraction closure rule above is Scott-continuous — it's a Datalog-style temporal rule. Adding it to a Scott-continuous closure-rule system keeps the system Scott-continuous. Default-rule extension (P2) requires negation-as-failure, which can promote the regime to transfinite-bounded; this is the regime cost of admitting defaults.

**Open issue with the primary proposal.** The temporal ordering on assertions/retractions requires a substrate-level time-stamp discipline. The substrate's [event log](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/objects/event-log.md) supplies one, but how the time-stamp interacts with cross-source ordering (when two sources retract from each other independently) requires the [federation-as-bilattice-colimit](../theorems/federation-as-bilattice-colimit.md) treatment.

## Secondary proposal: substrate versioning

A second candidate: **substrate versioning** treats each non-monotonic operation as producing a new substrate version, and the substrate's history records the version sequence.

This makes non-monotonicity a substrate-history phenomenon rather than a substrate-state phenomenon. The substrate-as-event-log discipline already supports this; the open question is what the *between-versions* coherence discipline is. The Fleck-style (per [process-ontology-and-situated-learning](../texts/process-ontology-and-situated-learning.md) §5) treatment of "scientific revolutions" as discontinuous closure-rule changes is a worked instance — paradigm shifts are non-monotonic-by-version with the prior version archived rather than overwritten.

The trade-off vs. reified-retraction: versioning is coarser (whole-substrate transitions, not per-cell retractions) but easier to reason about (each version is a clean monotone substrate). The two proposals can coexist: reified-retraction handles fine-grained corrections within a substrate version; versioning handles paradigm-scale closure-rule revisions.

## Tertiary proposal: default rules as a separate sub-language

A third candidate: **default rules form a sub-language of the closure-rule language admitting negation-as-failure**, regime-classified as part of the four-regime program. The well-founded semantics for normal Datalog programs (Van Gelder, Ross, Schlipf 1991) is the canonical formalism; lifting it to bilattice-valued substrates per Fitting (1991) gives a well-founded *bilattice* semantics under which negation-as-failure produces $\bot$-valued cells (genuine unknowns) rather than $f$-valued cells (definite negations).

This is structurally cleaner than reified-retraction (no meta-predicates, no temporal ordering required) but does not handle the AGM-style belief-revision case — once a cell is settled, it stays settled. The proposal handles defaults but not corrections.

## Synthesis

The working hypothesis is that the substrate accommodates the three classes of non-monotonic phenomena via three separate disciplines:

| Phenomenon | Substrate-level discipline |
|---|---|
| Defaults | well-founded bilattice negation-as-failure (tertiary) |
| Corrections | reified retraction (primary) |
| Paradigm shifts | substrate versioning (secondary) |

None of the three breaks $\leq_k$-monotonicity at the cell level; each produces non-monotone *derived views*. Whether the three compose cleanly — i.e., whether a single substrate can run all three disciplines simultaneously without cross-discipline interaction breaking either's properties — is the residual open question this note leaves for follow-up work.

The companion concept [reified-retraction](teaching/explanations/reified-retraction.md) names the primary proposal as a substrate-level concept worth its own atomic entry.
