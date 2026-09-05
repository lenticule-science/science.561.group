---
type: concept
class: cryptographic-identity
depends-on: [identity-by-relations, hash-discipline, witness]
see-also: [signature, encryption]
---

# Identity key

A cryptographic key-pair (public + private) bound to an [entity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/entity.md) of the substrate. The identity key is the *cryptographic* layer of an entity's identity, distinct from but composable with [identity-by-relations](identity-by-relations.md) (the substrate's structural layer of identity-as-incident-predications).

The two layers play different roles. Identity-by-relations answers "is this the same entity?" structurally — by checking whether two references resolve to the same predication-graph node. The identity key answers "did this entity assert this content?" cryptographically — by checking whether the content's signature verifies against the entity's known public key. The substrate's federation discipline depends on both: the identity-by-relations layer determines what the entity *is* in the substrate; the identity key determines what the entity *said*.

An entity may have multiple identity keys (key rotation, multi-signature schemes, federated-identity bridging). Each key is itself a substrate predication on the entity, with its own provenance, validity-period, and revocation status. The substrate's [hash-discipline](hash-discipline.md) provides the canonical-form hash that signatures are computed over.

The identity key's *private* component is not substrate content — the substrate stores the public component and the key's metadata, while the private component lives in the entity's host environment (a hardware token, a key-management service, a per-host keychain). The substrate's discipline is to never store private keys; signatures are produced at the entity's host and verified at the substrate.

For non-human entities (AI agents, automated processes), identity-key creation is a substrate operation that produces the key-pair, signs the public component into the substrate, and emits the private component to the entity's host through a controlled channel. Key creation is a [provenance](provenance.md)-bearing event; rotation and revocation are also substrate events.
