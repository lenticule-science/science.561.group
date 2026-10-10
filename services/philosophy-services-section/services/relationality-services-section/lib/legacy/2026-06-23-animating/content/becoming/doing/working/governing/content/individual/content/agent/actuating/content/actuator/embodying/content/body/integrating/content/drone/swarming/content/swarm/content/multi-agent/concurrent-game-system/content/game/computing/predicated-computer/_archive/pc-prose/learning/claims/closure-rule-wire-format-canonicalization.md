---
type: theorem
class: engineering-claim
status: proved
depends-on: [closure-rule-wire-format, closure-rule, predicate-generator-exhaustiveness, predicate-generator-composition-table, predicate-generator-pullback-closure, hash-injectivity-under-canonical-form, canonical-form-via-settling-quiescence]
see-also: [bilattice-operation-table-correctness, conformance-via-fiber-algebra-functor]
---

# The closure-rule wire format is complete and closed under composition

**Claim.** The pattern grammar fixed in [closure-rule-wire-format](teaching/explanations/closure-rule-wire-format.md) is:

1. **Complete** — every admissible substrate closure rule (per [predicate-generator-exhaustiveness](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md)) has a representation in the grammar.
2. **Closed under composition** — composing two rules expressible in the grammar produces another rule expressible in the grammar (per [predicate-generator-composition-table](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-generator-composition-table.md)).
3. **Closed under pullback** — pulling back a rule along a parameter-base morphism produces another rule expressible in the grammar (per [predicate-generator-pullback-closure](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-generator-pullback-closure.md)).

These three properties together mean the wire format is the *minimal complete* substrate-spec for closure-rule admission — no admissible rule needs richer pattern structure, and operations that should preserve admissibility (composition, pullback) do preserve it.

## Why this holds

**Part 1: Completeness.** Per [predicate-generator-exhaustiveness](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md), every closure rule's premise is structurally a quantification along one of the four [predicate-category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) generator classes:

- **Identity**: the cell at fixed (subject, predicate, object).
- **Subject-projection**: cells with given (predicate, object), subject varying.
- **Object-projection**: cells with given (subject, predicate), object varying.
- **Predicate-generator**: cells with given (subject, object), predicate varying.

The wire format's pattern grammar (with `pattern-ref` being `{"hash": ...}` for bound or `{"var": ...}` for varying) is exactly the syntactic counterpart — three components, each independently bound or varying. The four generator combinations correspond to the four ways three components can each be bound or varying (modulo the trivial "all varying" case, which corresponds to enumerating the entire fiber and is rejected as unbounded-radius).

**Part 2: Composition closure.** Per [predicate-generator-composition-table](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-generator-composition-table.md), composing two predicate-category generators along their shared variable produces another generator (or a finite combination). The wire-format grammar's multi-premise structure with shared `var-id`s expresses exactly this composition:

- Two premises sharing variable `Y` express the composition "for $X$ such that $X \to Y$ and $Y \to Z$, conclude $X \to Z$" — the structural composition of two generator-class premises.
- The composite rule's match radius is the sum of the constituent radii (or less, if the composition shortens the path).
- Per [predicate-generator-composition-table](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-generator-composition-table.md), the composite remains in the four generator classes, hence remains expressible in the grammar.

**Part 3: Pullback closure.** Per [predicate-generator-pullback-closure](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-generator-pullback-closure.md), the predicate-category generators are closed under pullback along arbitrary morphisms. Engineering translation: a rule defined for predicate $p$ may be substituted along a $\mathcal{C}$-morphism $f : p' \to p$ to produce a rule for $p'$. The wire format expresses this by replacing the bound predicate-hash with the new one — the variable structure is preserved.

## Engineering consequence

- **The substrate's admission discipline can validate rules statically.** Per the wire format's completeness, any well-formed pattern is a candidate rule; per the format's structural simplicity, validation reduces to checking variable-binding consistency, value-set membership, and match-radius boundedness. No semantic analysis required.
- **Rule composition is a substrate operation.** Per the composition closure, the substrate's runtime can derive a composite rule from two existing rules — for example, materializing a frequently-used compound rule for performance. Per [closure-rule-wire-format-canonicalization](teaching/explanations/closure-rule-wire-format.md), the composite is itself an admissible rule with its own canonical hash.
- **Rule pullback enables vocabulary translation.** Per [doctrine-fidelity-via-faithful-interfacer-functor](doctrine-fidelity-via-faithful-interfacer-functor.md), federation bridges translate between vocabularies. Per the pullback closure, a rule defined in one substrate's vocabulary can be pulled back to another substrate's vocabulary along the bridge's morphism — the translated rule is wire-format expressible.
- **Rule equality is hash equality.** Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), two rules with the same canonical-JSON have the same hash. Per the wire format's canonical structure, two semantically-equivalent rules (same premises, same conclusion, same value-constraints) produce the same canonical-JSON and hence the same hash. The substrate deduplicates rules by hash without needing semantic comparison.
- **The wire format covers all conformant rules.** Per [conformance-via-fiber-algebra-functor](conformance-via-fiber-algebra-functor.md), an implementation conformant on the value-domain admits exactly the rules expressible in this grammar. An implementation that admits richer pattern structure (e.g., negation in premises, disjunction across premises) is implementing a different value-domain — it's not conformant on $\mathbf{FOUR}$.

## What the theorem rules out

- **Admitting a rule with negation in the premise.** Per [predicate-generator-exhaustiveness](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md), the four generators are positive — there's no "and not present" generator. A "rule" with a negation premise is not in the grammar; per the theorem, it's not an admissible closure rule. The substrate refuses; the engineer's intent must be expressed via the bilattice's $\mathbf{f}$ value (told-false) rather than via "absence of $\mathbf{t}$."
- **Admitting a rule with unbounded match radius.** Per [wavefront-locality-via-cohomology-vanishing](wavefront-locality-via-cohomology-vanishing.md), bounded radius is structural to the substrate's wavefront discipline. The wire format requires explicit `match-radius`; admission rejects null or unbounded values.
- **Admitting a rule with mismatched variable scoping.** A `var-id` in the conclusion not bound in any premise has no value at match time. The substrate refuses at admission.
- **Admitting a rule with non-canonical JSON.** Per the wire format's canonical-JSON requirement, two implementations admitting the same rule must produce byte-identical canonical-JSON. An implementation that emits with different field ordering or different escape conventions is non-conformant.

## What the theorem requires

- The substrate's value-domain is $\mathbf{FOUR}$ per [bilattice-operation-table](teaching/explanations/bilattice-operation-table.md).
- The predicate-category satisfies the four-generator structure (per [predicate-generator-exhaustiveness](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md)).
- The substrate's canonical-JSON discipline is in place per [canonical-form-via-settling-quiescence](canonical-form-via-settling-quiescence.md).
- Match-radius is interpretable as graph-traversal depth from anchor entities.

## Position

Together with [bilattice-operation-table-correctness](bilattice-operation-table-correctness.md), this theorem grounds the substrate's two foundational specs — the value domain and the rule grammar — in the predication-categories' structural theorems. An implementer can build a substrate by transcribing the bilattice tables, implementing the wire format, and admitting rules conforming to the grammar; per the theorems, the resulting substrate is conformant on the value-domain and rule-admission layers. Higher-level operations (settlement, dispatch, federation) compose on top.
