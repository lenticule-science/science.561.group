---
type: theorem
class: engineering-claim
status: proved
depends-on: [rule-index, closure-rule-wire-format, alexandrov-topology, knowledge-order, predicate-generator-exhaustiveness, settling-monotonicity]
see-also: [rule-dependency-soundness, wavefront-locality-via-cohomology-vanishing, index-as-alexandrov-up-set]
---

# The rule index is sound: every potentially-matching rule is returned

**Claim.** For any [rule index](teaching/explanations/rule-index.md) $K$ on a closure-rule system $R$, and any cell change $(s, p, o, v) \to (s, p, o, v')$ with $v' \geq_k v$ in the [knowledge order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md):

- **Soundness.** For every rule $r \in R$ whose premise *might match* the cell at its new value $v'$ (after the change), $r \in K(s, p, o, v')$.

In particular, the substrate's wavefront execution that consults $K$ on each cell change cannot miss any rule firing — every potentially-matching rule is considered.

## Why this holds

Per [rule-index](teaching/explanations/rule-index.md), the index $K$ is structurally an [Alexandrov-topology](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/alexandrov-topology.md) up-set on the rule space, with the up-set property $r \in K(c) \Rightarrow r' \in K(c)$ for any $r'$ subsuming $r$ (i.e., any $r'$ with strictly weaker premises).

For a cell change at $(s, p, o, v')$, a rule $r$'s premise *might match* iff its index keys (the bound substructure of its premises) are compatible with the cell:

- The predicate-key index entry for $p$ contains $r$ iff $r$ has a premise mentioning $p$ (bound).
- The value-class index entry for $v'$ contains $r$ iff $r$ has a premise whose value-constraint includes $v'$.
- (Similarly for entity-keys, composite-keys, etc.)

The rule index $K$ is constructed by *inserting* every rule into all relevant index entries when admitted. Per the wire format's structural completeness (per [closure-rule-wire-format-canonicalization](closure-rule-wire-format-canonicalization.md)), every rule's premise is enumerable into a finite set of index keys; the substrate's admission discipline registers the rule under each key.

Therefore: if $r$'s premise might match the cell, $r$'s index keys cover the cell's shape, $r$ is registered under each, and $r \in K(s, p, o, v')$.

Per [settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), the cell's value can only rise in the knowledge-order — so a rule that might match at the *new* value $v'$ is the relevant set for the wavefront's next iteration. The index returns this set.

## Engineering consequence

- **Wavefront completeness.** The substrate's wavefront execution that consults $K$ on each cell change is guaranteed to consider every applicable rule. Per [wavefront-locality-via-cohomology-vanishing](wavefront-locality-via-cohomology-vanishing.md), the wavefront's locality (work bounded by affected cells) is preserved.
- **No missing rule firings.** A substrate that uses $K$ correctly cannot miss a closure rule application that would otherwise fire. The settled state is the same as if every rule were tried against every cell — but the work is much smaller per the index.
- **Conservative false positives are acceptable.** $K$ may return some rules whose premises don't actually match (because variable-binding fails, or value-set details don't align). The substrate's match operation handles these — they're tried-and-discarded, not missed. Per the soundness theorem, false positives at the index level are acceptable; false negatives are not.
- **Index correctness is testable.** A conformance test can compare $K(c)$ to "every rule, for each cell change" — equality (modulo the index's superset property) is the correctness criterion.

## What the theorem rules out

- **Indexes that miss rules.** An index that doesn't register a rule under one of its premise's index keys can return a strict subset of the actual matching rules. The substrate's admission discipline (per [rule-index](teaching/explanations/rule-index.md)) explicitly registers every rule under every relevant key; an implementation that skips registration steps is non-conformant.
- **Indexes that misclassify cell shapes.** If the index lookup uses a different key extraction than the admission, lookups return wrong sets. Per [closure-rule-wire-format-canonicalization](closure-rule-wire-format-canonicalization.md), the wire format fixes the key structure; admission and lookup use the same extraction.
- **Indexes that don't update on rule retirement.** If a rule is retired but stays in the index, lookups return zombie rules — false positives. The substrate's retirement discipline (per [retraction](teaching/explanations/retraction.md)) updates the index.
- **Indexes whose state lags rule admissions.** The substrate's discipline is that the index is updated *as part of* rule admission — atomically, before settlement reads it. An async-updated index can have brief windows of staleness; the substrate refuses such designs unless the staleness is masked by other coordination.

## What the theorem requires

- The closure-rule system $R$ uses the wire format per [closure-rule-wire-format](teaching/explanations/closure-rule-wire-format.md).
- Every rule is registered under all relevant index keys at admission.
- The substrate's settlement is closure-driven and $\leq_k$-monotone (per [settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md)).
- Index updates are atomic with rule admissions/retirements.

## Position

This theorem grounds the substrate's runtime efficiency primitive in the predication-categories' Alexandrov-topology framework. Together with [rule-dependency-soundness](rule-dependency-soundness.md), it gives the substrate's settlement runtime its correctness guarantees: the index doesn't miss matches; the dependency analysis correctly identifies parallelism opportunities. The substrate's wavefront execution is fast (per the index) and parallel (per the dependency analysis) without sacrificing correctness.
