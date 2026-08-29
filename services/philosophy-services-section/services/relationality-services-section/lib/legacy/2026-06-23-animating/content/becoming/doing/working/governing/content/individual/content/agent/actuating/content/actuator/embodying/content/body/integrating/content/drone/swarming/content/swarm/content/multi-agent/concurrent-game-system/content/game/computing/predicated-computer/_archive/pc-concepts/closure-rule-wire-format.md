---
type: concept
class: substrate-spec
depends-on: [closure-rule, canonical-form, hash-discipline, bilattice-operation-table, predicate-generator-exhaustiveness]
see-also: [closure-rule-wire-format-canonicalization, closure-rule-application]
---

# Closure-rule wire format

The substrate's *canonical-JSON shape* of an admitted [closure rule](closure-rule.md). A closure rule is substrate content per [self-representation](self-representation.md), and per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), its identity is its canonical-form hash. This concept fixes the wire format so that two implementations admitting "the same" rule produce byte-identical canonical-JSON and therefore the same hash. Per [closure-rule-wire-format-canonicalization](../theorems/closure-rule-wire-format-canonicalization.md), the format covers the [predicate-generator-exhaustiveness](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md) condition — every admissible closure rule's premise reduces to one of the four predicate-category generator classes, so the wire format's pattern grammar is closed under the generator set.

## The wire-format grammar

A closure rule's canonical-JSON serialization has the shape:

```json
{
  "kind": "closure-rule",
  "premises": [<pattern>, ...],
  "conclusion": <pattern>,
  "match-radius": <non-negative integer>,
  "value-domain-version": "FOUR-v1"
}
```

The order of fields is canonical-JSON-sorted (lexicographic on keys). The `value-domain-version` field cites which [bilattice-operation-table](bilattice-operation-table.md) version the rule operates on; per [conformance-via-fiber-algebra-functor](../theorems/conformance-via-fiber-algebra-functor.md), implementations using a different value domain cannot match the rule.

A `pattern` has the shape:

```json
{
  "subject": <pattern-ref>,
  "predicate": <pattern-ref>,
  "object": <pattern-ref>,
  "value-constraint": <value-set>
}
```

A `pattern-ref` is one of:

- A bound entity-hash: `{"hash": "<hex-sha256>"}`
- A pattern variable: `{"var": "<var-id>"}` — same `var-id` across different patterns indicates the same matched value must appear.

A `value-set` is a non-empty subset of $\{\bot, \mathbf{t}, \mathbf{f}, \top\}$ in canonical byte order:

```json
{"values": [0, 1, 2, 3]}  // any subset, sorted ascending
```

For premises, the value-set declares which substrate values cause a match. For conclusions, the value-set declares the target's $\leq_k$-lower-bound — typically a singleton.

## Why the format is fixed at this level of detail

Per [predicate-generator-exhaustiveness](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md), every admissible closure rule's premise reduces structurally to a quantification over one of the four predicate-category generator classes. This means the pattern grammar above is *complete* — no admissible rule needs richer pattern structure. Specifically:

- **Identity generator** (read a cell at a fixed (subject, predicate, object)): pattern with all three components bound.
- **Subject-projection generator** (read all cells with given predicate and object): pattern with subject as `var`, predicate and object bound.
- **Object-projection generator** (read all cells with given subject and predicate): pattern with object as `var`, subject and predicate bound.
- **Predicate-generator** (read all cells with given subject and object): pattern with predicate as `var`, subject and object bound.

Combinations of generators are expressed as multiple premises sharing variables.

Per [closure-rule-wire-format-canonicalization](../theorems/closure-rule-wire-format-canonicalization.md), this grammar is closed under predicate-category morphism composition — composing rules produces another rule expressible in the grammar.

## Match radius

The `match-radius` field is the maximum graph-traversal depth from any anchor entity that the premise reads. Per [wavefront-locality-via-cohomology-vanishing](../theorems/wavefront-locality-via-cohomology-vanishing.md), the bounded match radius is what makes the substrate's wavefront cost content-bounded rather than size-bounded. The substrate rejects rules with `"match-radius": null` or unbounded values.

A rule with multiple premises whose patterns reach distinct entities has match-radius equal to the maximum reach across any premise.

## Variable scope and binding

Pattern variables are scoped to a single rule. Two different rules using the same `var-id` declare independent variables; the substrate's match operation does not unify across rules.

Within a rule, two pattern-refs with the same `var-id` must match the same entity-hash for the rule to fire. The substrate's match operation enforces this — variables are *bound* at first match in any premise, and subsequent occurrences must equal the bound value.

The conclusion's pattern-refs may use any variables bound in any premise. A conclusion variable not bound in any premise is a wire-format error; the substrate rejects the rule at admission.

## Value-set semantics

For a *premise* pattern, the `value-set` field is the substrate values that cause the premise to match. A premise with `"values": [1]` matches only cells at value $\mathbf{t}$; a premise with `"values": [1, 3]` matches cells at $\mathbf{t}$ or $\top$ (told-true or told-both — the truth-positive set).

For a *conclusion* pattern, the `value-set` field is the substrate value the conclusion's target cell receives upon successful match, *joined via $\vee_k$ with the cell's existing value*. A conclusion with `"values": [1]` raises the target to at least $\mathbf{t}$ in the [knowledge-order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md). Per [closure-driven-settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-driven-settling-monotonicity.md), the join with the existing value preserves $\leq_k$-monotonicity.

A conclusion with `"values": [0]` (just $\bot$) is a no-op — the target's existing value is preserved by $\vee_k$ with $\bot$. The substrate refuses such conclusions at admission as wire-format errors (a no-op rule is a specification mistake, not a substrate operation).

## Reference example

A closure rule "if X is a parent of Y, and Y is a parent of Z, then X is an ancestor of Z" with predicate-hashes `parent_of_h` and `ancestor_of_h`:

```json
{
  "kind": "closure-rule",
  "premises": [
    {
      "object": {"var": "Y"},
      "predicate": {"hash": "parent_of_h"},
      "subject": {"var": "X"},
      "value-constraint": {"values": [1, 3]}
    },
    {
      "object": {"var": "Z"},
      "predicate": {"hash": "parent_of_h"},
      "subject": {"var": "Y"},
      "value-constraint": {"values": [1, 3]}
    }
  ],
  "conclusion": {
    "object": {"var": "Z"},
    "predicate": {"hash": "ancestor_of_h"},
    "subject": {"var": "X"},
    "value-constraint": {"values": [1]}
  },
  "kind": "closure-rule",
  "match-radius": 2,
  "value-domain-version": "FOUR-v1"
}
```

Note the canonical key ordering within each object — keys appear in lexicographic order. The rule's hash is the SHA-256 of this canonical-JSON serialization.

## Position

This concept is the substrate's *closure-rule admission contract*. Per [self-representation](self-representation.md), closure rules are substrate content; per this concept, the canonical-JSON shape is fixed; per [closure-rule-wire-format-canonicalization](../theorems/closure-rule-wire-format-canonicalization.md), the format is closed under composition and complete relative to the predicate-generator-exhaustiveness theorem.

The wire format composes with [bilattice-operation-table](bilattice-operation-table.md) (the `value-constraint` field uses the canonical byte encoding), with [hash-discipline](hash-discipline.md) (the rule's identity is the canonical-form hash), with [closure-rule-application](../morphisms/closure-rule-application.md) (the match-and-conclude operation reads this format), and with [conformance-via-fiber-algebra-functor](../theorems/conformance-via-fiber-algebra-functor.md) (substrate implementations are conformant on closure rules iff they admit and match this format identically).
