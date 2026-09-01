---
type: concept
class: federation-discipline
depends-on: [federation-graph, federation-envelope, federation-bridge, vocabulary-completeness, doctrine-fidelity, doctrine-fidelity-via-faithful-interfacer-functor, hash-injectivity-under-canonical-form]
see-also: [federation-trust-bilattice-graded, form-submission-doctrine-fidelity]
---

# Shared-vocabulary federation

The substrate's *discipline for two substrates discovering and confirming a shared vocabulary before exchanging structured content*. In the substrate's hyperdoctrine setting, shared-vocabulary federation is *the substrate-side instance of confirming both peers' [parameter-base categories](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/parameter-base-category.md) overlap on the predicates the structured exchange will use*. Without this discipline, a federation envelope carrying a typed predication could arrive at a peer that doesn't recognize the predicate — the receiver can't admit it without knowing the predicate's schema.

This concept fixes the discovery-and-handshake protocol by which substrates negotiate vocabulary-compatibility, and the fallback when vocabularies don't fully overlap.

## Why this concept exists

The substrate's win on cross-user typed transactions (per [form-submission-doctrine-fidelity](../theorems/form-submission-doctrine-fidelity.md)) requires that the receiver substrate *understands the predicate types* the submission carries. If substrate $A$ has `print-widget-request` in its vocabulary but substrate $B$ doesn't, a typed submission from $A$ to $B$ has nowhere to land.

Existing concepts cover federation envelopes, federation graphs, and federation-bridges (translation between vocabularies), but don't specify *how vocabularies are discovered and confirmed* before structured federation begins. This concept fills that gap.

## Vocabulary-discovery handshake

When two substrates establish or refresh a federation link, they perform a vocabulary-discovery handshake:

### Phase 1: Vocabulary advertisement

Each substrate emits a `vocabulary-manifest` envelope listing its admissible predicates, schemas, and forms:

```json
{
  "kind": "vocabulary-manifest",
  "manifest-id": "<canonical hash>",
  "substrate-id": "<emitter's substrate id>",
  "manifest-version": "<version-hash>",
  "predicates": [
    {
      "predicate-id": "<predicate-hash>",
      "name": "<canonical name>",
      "schema-hash": "<schema-record-hash>",
      "stability": "stable | beta | experimental"
    },
    ...
  ],
  "forms": [
    {
      "form-id": "<form-hash>",
      "form-version": "<version-hash>",
      "input-schema-hash": "<schema-hash>",
      "output-predication-kind": "<predicate-hash>"
    },
    ...
  ],
  "value-domain-version": "FOUR-v1"
}
```

Per [hash-injectivity-under-canonical-form](../../theorems/hash-injectivity-under-canonical-form.md), each predicate's `predicate-id` is the canonical hash of its definition. Two substrates that admit the same predicate (same canonical-form schema) have the same `predicate-id` — by-content matching, not by-name.

### Phase 2: Intersection computation

Both substrates compute the intersection of their vocabularies — predicates and forms whose `predicate-id` / `form-id` match by hash. The intersection is the *agreed vocabulary* for the federation link.

### Phase 3: Mutual confirmation

Each substrate emits a `vocabulary-agreement` envelope listing the agreed vocabulary:

```json
{
  "kind": "vocabulary-agreement",
  "peer-substrate-id": "<the other substrate>",
  "agreed-predicates": [<predicate-id>, ...],
  "agreed-forms": [<form-id>, ...],
  "established-at-ordinal": <substrate ordinal>
}
```

After mutual confirmation, the federation link admits structured content using only the agreed vocabulary; per [doctrine-fidelity-via-faithful-interfacer-functor](../../theorems/doctrine-fidelity-via-faithful-interfacer-functor.md), the receiver's interfacer is faithful on the agreed vocabulary.

## Vocabulary mismatch handling

When a federation envelope arrives carrying a predicate not in the agreed vocabulary, the receiver's response per the substrate's policy:

- **Reject.** The strictest policy. The envelope is rejected at admission; sender notified.
- **Bridge.** If a [federation-bridge](../objects/federation-bridge.md) exists translating the foreign predicate to a known predicate, apply the bridge. Per the bridge's doctrine-fidelity, the translation preserves structural meaning.
- **Quarantine.** Admit the envelope to a quarantine sub-region, surface for governance review. Per [audit-content-via-inconsistency-sheaf-cohomology](../theorems/audit-content-via-inconsistency-sheaf-cohomology.md), accumulated quarantined envelopes produce $\top$-cells signaling vocabulary-mismatch patterns.
- **Renegotiate.** Trigger a new vocabulary-discovery handshake; perhaps the sender has admitted a new predicate the receiver should also admit.

## Vocabulary growth: peer-driven predicate adoption

When two substrates federate and substrate $A$ has a predicate substrate $B$ wants:

1. Substrate $B$ requests the predicate's full schema from substrate $A$.
2. Substrate $A$ emits the schema (a substrate predication) via federation envelope.
3. Substrate $B$'s governance evaluates the schema (per [governance-decision-modal-decidability](../theorems/governance-decision-modal-decidability.md), this is a decidable modal check on the substrate's vocabulary policy).
4. If approved, substrate $B$ admits the predicate into its vocabulary.
5. Substrates $A$ and $B$ re-run the vocabulary-handshake; the agreed vocabulary now includes the new predicate.

This is the substrate's *organic vocabulary growth* mechanism — predicates spread through the federation as substrates choose to admit them, not via a centralized standards body.

## Vocabulary versioning

Predicate definitions evolve. Per [hash-injectivity-under-canonical-form](../../theorems/hash-injectivity-under-canonical-form.md), a changed predicate definition has a different `predicate-id`. The substrate's discipline:

- The original predicate-id stays valid; envelopes using it continue to be admitted (backward compatibility).
- The new predicate-id is a separate predicate; envelopes using it require the new schema.
- A `predicate-evolution` predication links the two: `succeeds-predicate: {old-id -> new-id}` with the migration-recipe.
- Per [schema-evolution-via-base-admissibility](../theorems/schema-evolution-via-base-admissibility.md), evolving the predicate is a base-morphism in the substrate's parameter-base category; the substrate verifies the evolution preserves the regime.

## Federation-bridge as vocabulary translator

When two substrates' vocabularies don't fully overlap but bridging is desired, a [federation-bridge](../objects/federation-bridge.md) entity provides translation:

```json
{
  "kind": "federation-bridge",
  "bridge-id": "<canonical hash>",
  "from-substrate-id": "<source substrate>",
  "to-substrate-id": "<destination substrate>",
  "translations": [
    {
      "from-predicate": "<source predicate-id>",
      "to-predicate": "<destination predicate-id>",
      "field-mapping": {<source-field>: <destination-field>, ...},
      "fidelity": "exact | lossy | approximate"
    },
    ...
  ],
  "signed-by": "<authority-record-hash>"
}
```

Per [doctrine-fidelity-via-faithful-interfacer-functor](../../theorems/doctrine-fidelity-via-faithful-interfacer-functor.md), the bridge is a faithful interfacer functor — distinct source predications produce distinct translations. Per `fidelity: "exact"`, the bridge is fully faithful; `lossy` or `approximate` translations carry an explicit accuracy degradation that downstream consumers can read.

## What the discipline rules out

- **Federation without vocabulary discovery.** Substrates that exchange structured content without agreeing on vocabulary risk silent admission failures. The substrate's discipline is mandatory vocabulary-handshake before structured federation.
- **By-name vocabulary matching.** Matching predicates by their human-readable name (rather than canonical hash) is fragile — two substrates may use the same name for different schemas. Per [hash-injectivity-under-canonical-form](../../theorems/hash-injectivity-under-canonical-form.md), the substrate matches by content-hash.
- **Implicit vocabulary growth.** A substrate that silently admits new predicates from federation peers without governance review is exposing its vocabulary to peer-controlled changes. The substrate's discipline is explicit governance approval per [governance-decision-modal-decidability](../theorems/governance-decision-modal-decidability.md).
- **Bridges without authority.** A federation-bridge that isn't signed by an authority both substrates recognize is unauthenticated translation; receivers should refuse to apply it. Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), the bridge's signing-authority is the chain of trust.

## Position

Shared-vocabulary federation is the substrate's *cross-substrate-typed-content prerequisite*. Per [form-submission-doctrine-fidelity](../theorems/form-submission-doctrine-fidelity.md), typed submissions cross substrates faithfully — but only when the receiver knows the type. Per this concept, the substrate's discipline is to negotiate vocabulary-compatibility before admitting typed content.

The concept composes with [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md) (where shared-vocabulary information is recorded), with [federation-envelope](federation-envelope.md) (the carrier of vocabulary-manifest envelopes), with [federation-bridge](../objects/federation-bridge.md) (the translation layer when vocabularies differ), with [vocabulary-completeness](vocabulary-completeness.md) (the substrate's discipline of admitting predicates explicitly), and with [device-substrate](device-substrate.md) (devices declare a restricted vocabulary as part of their conformance profile).
