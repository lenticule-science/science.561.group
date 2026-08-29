---
type: concept
class: substrate-primitive
depends-on: [predicate-category, parameter-base-category, predication-fiber-algebra, predication-priestley-dual, jung-rivieccio-duality, predication-fibration, hash-discipline, self-representation, vocabulary-completeness]
see-also: [shared-vocabulary-federation, closure-rule-wire-format, schema-evolution-via-base-admissibility]
---

# Vocabulary

The substrate's *set of admissible predicates and their definitions, recorded as substrate content* — the substrate-side instance of the [predicate category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md)'s objects with their schemas. In the substrate's hyperdoctrine setting, vocabulary is *the substrate-content presentation of the [parameter-base category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/parameter-base-category.md) $\mathcal{C}$* — each predicate is a $\mathcal{C}$-object recorded as a substrate predication, and the vocabulary is the collection of all such records.

Per [vocabulary-completeness](vocabulary-completeness.md), the substrate's discipline is to admit predicates *explicitly* before they appear in content — every predicate used in any cell, witness, or closure rule must have a vocabulary record. This concept names the vocabulary as a primitive object so the discipline has something to name.

## Why this concept exists

Multiple PredComp concepts reference "the substrate's vocabulary" — [shared-vocabulary-federation](shared-vocabulary-federation.md), [closure-rule-wire-format](closure-rule-wire-format.md), [schema-evolution-via-base-admissibility](../theorems/schema-evolution-via-base-admissibility.md), [vocabulary-completeness](vocabulary-completeness.md), [doctrine-fidelity](doctrine-fidelity.md). Each treats the vocabulary as *something* the substrate has; none names what it is structurally. The result: vocabulary is implicit, and disciplines that depend on it (federation handshake, schema evolution, conformance) lack a structural reference.

This concept fixes the vocabulary as a substrate-content object — a particular sub-region of the substrate that records predicate definitions, queryable like any other content.

## Hyperdoctrinal grounding

Per [predicate-category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md), $\mathcal{C}$ is the category whose objects are predicates and whose morphisms are predicate-category generators. Per [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md), each predicate $p \in \mathcal{C}$ has a fiber $A_p$ — the [predication fiber-algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) of cells over $p$.

The substrate's *vocabulary* is the substrate-content presentation of $\mathcal{C}$:

- For each predicate $p$, a `predicate-record:{p}` cell encoding $p$'s schema.
- For each $\mathcal{C}$-morphism $f: p \to p'$ admissible in the substrate, a `predicate-morphism:{f}` cell.
- The collection of these cells is the substrate's vocabulary.

Per [predication-priestley-dual](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-priestley-dual.md), the predicate-category is dual to a paired Priestley space; per [jung-rivieccio-duality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/jung-rivieccio-duality.md), the duality is contravariant. So vocabulary records have a structural dual presentation: the predicate-record's canonical form encodes the predicate's Priestley-dual point. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the predicate's identity is the canonical-form hash of its schema.

## Vocabulary record structure

A predicate-record has the canonical-JSON shape:

```json
{
  "kind": "predicate-record",
  "predicate-id": "<canonical hash of remaining content>",
  "name": "<canonical-name string>",
  "arity": <integer, typically 2 for binary substrate predicates>,
  "subject-type": "<entity-class hash>",
  "object-type": "<entity-class hash | value-class hash>",
  "value-domain": "FOUR-v1",
  "definition": {
    "informal": "<human-readable description>",
    "shape": <canonical-form schema for cell content>,
    "validation-rules": [<rule-hash>, ...]
  },
  "lifecycle": {
    "introduced-at-ordinal": <substrate ordinal>,
    "stability": "stable | beta | experimental | deprecated",
    "successor": "<predicate-id | null>",
    "deprecation-ordinal": "<ordinal | null>"
  },
  "introduced-by": "<principal-record-hash>",
  "signature": {<authority signature>}
}
```

Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the predicate-id is the canonical-form hash. Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), the introducing-principal's signature binds the predicate definition.

## Vocabulary lifecycle

A predicate moves through lifecycle states:

- **Experimental**: a principal admits a predicate-record with `stability: experimental`. The predicate is admissible but other principals may decline to use it pending validation.
- **Beta**: per governance review, the predicate moves to `stability: beta`. Wider use is encouraged but breaking changes are still possible.
- **Stable**: per governance, the predicate is `stability: stable`. The substrate commits to backward compatibility — changes that would break existing content are not admissible.
- **Deprecated**: a successor predicate is identified; the deprecated predicate stays admissible but new content using it produces a warning. Per [schema-evolution-via-base-admissibility](../theorems/schema-evolution-via-base-admissibility.md), deprecation respects regime-preservation.
- **Retired**: per [retraction](../morphisms/retraction.md), the predicate is no longer admissible for new content; existing content using it remains. The substrate's audit chain is preserved.

Per [witness-chain-as-proof-object](../theorems/witness-chain-as-proof-object.md), every lifecycle transition is witnessed.

## Vocabulary scoping

Different scopes may admit different vocabularies. Per [scope-cover-via-grothendieck-site](../theorems/scope-cover-via-grothendieck-site.md), the substrate's scopes form a Grothendieck site; per the cover, each scope's vocabulary is a sub-vocabulary of the substrate's overall vocabulary.

A scope-specific vocabulary record:

```json
{
  "kind": "scope-vocabulary",
  "scope-hash": "<scope-record-hash>",
  "admitted-predicates": [<predicate-id>, ...]
}
```

Cells using a predicate not in the scope's vocabulary are inadmissible at that scope; per [conformance-via-fiber-algebra-functor](../theorems/conformance-via-fiber-algebra-functor.md), the conformance check is per-scope.

## Vocabulary federation

Per [shared-vocabulary-federation](shared-vocabulary-federation.md), federation peers negotiate vocabulary intersection during the federation handshake. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), predicates match by `predicate-id` (content-hash), not by name — two substrates with the same canonical predicate-record have the same predicate-id and therefore the same predicate.

Vocabulary growth across federation: when peer $A$ introduces a predicate peer $B$ wants to use, $B$ admits $A$'s predicate-record into its own vocabulary (subject to governance per [governance-decision-modal-decidability](../theorems/governance-decision-modal-decidability.md)). The new predicate has the same predicate-id on both peers.

## What the discipline rules out

- **Implicit predicates.** A predicate referenced in content without a vocabulary record is structurally inadmissible. Per [vocabulary-completeness](vocabulary-completeness.md), all predicates must be declared.
- **By-name predicate matching across substrates.** Two substrates using the same human-readable name for different schemas would conflate them. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), matching is by content-hash; different schemas have different predicate-ids.
- **Vocabulary changes without governance review.** Adding, deprecating, or retiring predicates affects what content the substrate admits. Per [governance-decision-modal-decidability](../theorems/governance-decision-modal-decidability.md), the substrate's discipline is to require governance authorization for vocabulary changes (modulo experimental-stability allowances).
- **Vocabulary with implicit value-domain.** A predicate-record without an explicit `value-domain` declaration is ambiguous — different substrates might assume different value-domains. Per [bilattice-operation-table](bilattice-operation-table.md), the value-domain is fixed substrate content; predicate-records cite which.

## Position

Vocabulary is the substrate's *predicate-set primitive* — the substrate-content presentation of the parameter-base category $\mathcal{C}$. Per [vocabulary-completeness](vocabulary-completeness.md), no predicate can be used without a vocabulary record; per [shared-vocabulary-federation](shared-vocabulary-federation.md), federation negotiates vocabulary intersection; per [schema-evolution-via-base-admissibility](../theorems/schema-evolution-via-base-admissibility.md), vocabulary evolution is base-morphism in the fibration.

The concept composes with [predicate-category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) (the math object the vocabulary presents), [vocabulary-completeness](vocabulary-completeness.md) (the discipline that requires explicit declaration), [shared-vocabulary-federation](shared-vocabulary-federation.md) (cross-substrate vocabulary negotiation), [closure-rule-wire-format](closure-rule-wire-format.md) (closure rules reference vocabulary predicates), [doctrine-fidelity](doctrine-fidelity.md) (interfacers admit content into the vocabulary's predicates), and [schema-evolution-via-base-admissibility](../theorems/schema-evolution-via-base-admissibility.md) (vocabulary evolution).
