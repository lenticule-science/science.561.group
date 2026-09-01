---
type: concept
class: runtime-discipline
depends-on: [closure-rule, closure-rule-wire-format, index, predication-fiber-algebra, alexandrov-topology, knowledge-order]
see-also: [wavefront, settle, rule-index-soundness, rule-dependency-analysis]
---

# Rule index

A *substrate-recorded auxiliary structure mapping newly-changed cells to candidate closure rules* — the runtime data that lets the substrate's settlement avoid trying every rule against every cell. In the substrate's hyperdoctrine setting, the rule index is not arbitrary lookup machinery — it is *an [Alexandrov-topology](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/alexandrov-topology.md) up-set on the rule space*, indexed by premise patterns. Per [rule-index-soundness](../theorems/rule-index-soundness.md), the index is *sound* — for any cell change, the index returns *all* rules whose premises might match (no missed matches) — and *minimal* — the index doesn't return rules whose premises structurally cannot match.

The rule index is what makes the substrate's wavefront execution efficient: a cell change at predicate $p$ triggers consideration of rules whose premises mention $p$, not all rules.

## Why this concept exists

A naive substrate runtime tries every closure rule against every newly-changed cell — quadratic in the rule count, intractable beyond toy substrates. Real substrates need an index. PredComp specs the rule format ([closure-rule-wire-format](closure-rule-wire-format.md)), the wavefront's locality ([wavefront-locality-via-cohomology-vanishing](../theorems/wavefront-locality-via-cohomology-vanishing.md)), and the cost discipline ([cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md)) — but doesn't have a concept for the *runtime auxiliary* that makes wavefront execution actually fast. This concept fills the gap.

## Hyperdoctrinal grounding

Per [closure-rule-wire-format](closure-rule-wire-format.md), each closure rule's premise is a pattern with bound and varying components. The *index key* of a premise is its bound substructure — the predicates, entities, and value-constraints that are fixed. Two premises with the same index key respond to the same family of cell changes.

Per [alexandrov-topology](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/alexandrov-topology.md) (and per [index-as-alexandrov-up-set](../theorems/index-as-alexandrov-up-set.md) for the substrate's data indexes), the set of rules whose premises *might match* a given cell forms an up-set under the substrate's *rule subsumption order* — a rule $r_1$ subsumes $r_2$ when $r_2$'s premises are stricter (more bound, fewer varying), so any cell that could match $r_2$ could also match $r_1$.

The rule index is structurally:

- A function $K : \mathrm{Cell} \to \mathcal{P}(\mathrm{Rules})$ from cell shapes to rule sets.
- An up-set property: $K(c)$ is upward-closed under rule-subsumption — if $r$ might match $c$ and $r$ is subsumed by $r'$, then $r'$ is also returned.
- A soundness property (per [rule-index-soundness](../theorems/rule-index-soundness.md)): $r \notin K(c)$ implies $r$ structurally cannot match a cell of $c$'s shape.

## Three engineering dimensions of indexing

Closure rules can be indexed along several dimensions. Each contributes to faster lookup:

- **Predicate-key index.** For each predicate $p$, the set of rules whose premises mention $p$ (with $p$ bound). When a cell at predicate $p$ changes, lookup returns these rules. Most selective for typical workloads — usually a few rules per predicate.
- **Entity-key index.** For each entity $e$, the set of rules whose premises mention $e$ as bound subject or object. Used when $e$ is part of a frequently-co-occurring rule pattern.
- **Value-class index.** For each bilattice value $v$, the set of rules whose premise value-constraints include $v$. A cell newly raised to $\mathbf{t}$ triggers rules whose premise value-constraint contains $\mathbf{t}$.
- **Composite index.** For frequently-co-occurring (predicate, value) pairs, the set of rules matching both. Specializes the predicate-key + value-class indexes.

Per [rule-index-soundness](../theorems/rule-index-soundness.md), any combination of these indexes is sound (returns a superset of actually-matching rules); the substrate may use one, several, or all depending on its workload.

## Self-representation

Per [self-representation](teaching/explanations/self-representation.md), the rule index is substrate content. The substrate's runtime maintains the index as an additional substrate-content sub-region; per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), the index can be reconstructed from the closure-rule-system on demand — losing the index doesn't lose information, just performance.

## Index update on rule admission

When a new closure rule is admitted, the index is updated:

1. Parse the rule's wire-format pattern.
2. For each premise, extract the bound substructure (the index keys).
3. Add the rule to each relevant index entry.
4. Per the up-set property, no removal is needed when a rule is added — only insertion.

When a rule is retired (per [retraction](../morphisms/retraction.md)):

1. Identify the rule's index entries.
2. Remove the rule from each.

Per [closure-rule-wire-format-canonicalization](../theorems/closure-rule-wire-format-canonicalization.md), the index update is canonical — two implementations performing the same admit/retire sequence produce byte-identical indexes.

## Index lookup at settlement time

When a cell changes at $(s, p, o, v)$:

1. Look up rules at predicate $p$ in the predicate-key index.
2. Intersect with rules whose value-class index contains $v$ (or use the composite index directly).
3. For entities $s$ and $o$ that are commonly bound, intersect with the entity-key index.
4. Return the resulting rule set.

Per [rule-index-soundness](../theorems/rule-index-soundness.md), this returns *all* rules whose premises might match the cell (no missed matches), and *no* rules whose premises structurally cannot match (no false positives at the index level — though some returned rules may still fail to match at the variable-binding stage).

## Position

The rule index is the substrate's *runtime efficiency primitive* for wavefront execution. Together with [rule-dependency-analysis](rule-dependency-analysis.md), it determines what the substrate's runtime looks like: per-cell, look up candidate rules; for each candidate, attempt match (with variable binding); on match, apply; per dependency analysis, parallelize independent applications.

Per [wavefront-locality-via-cohomology-vanishing](../theorems/wavefront-locality-via-cohomology-vanishing.md), the substrate's per-cell work is bounded; the rule index ensures the per-cell rule-trial cost is small (typically $O(\log r)$ for $r$ rules or even $O(1)$ for highly-indexed substrates).
