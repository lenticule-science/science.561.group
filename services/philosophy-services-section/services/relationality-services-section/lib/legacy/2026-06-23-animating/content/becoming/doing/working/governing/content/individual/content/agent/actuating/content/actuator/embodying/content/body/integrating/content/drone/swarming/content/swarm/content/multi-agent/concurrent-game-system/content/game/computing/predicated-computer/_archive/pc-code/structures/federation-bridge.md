---
type: definition
class: substrate-entity
realizes: [federation-as-substrate-join]
depends-on: [predicated-arena, interfacer, predication-fibration, multi-observer-system]
see-also: [doctrine-fidelity, witness, scope-record]
---

# Federation bridge

The substrate-entity formal definition of a *vocabulary-translation interfacer* between two predicated computers whose [arenas](predicated-arena.md) do not directly align. Where two substrates publish compatible arenas (one's output type is admissible against the other's input type), federation proceeds without a bridge as a pointwise [multi-observer system](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/multi-observer-system.md) on the discrete observer category $\{S_1, S_2\}$; where the arenas differ, a bridge is required to translate. The bridge is itself substrate content, witnessed and replicable, per [self-representation](teaching/explanations/self-representation.md).

A federation bridge between substrates $S_1$ and $S_2$ is a fibration morphism between their [predication fibrations](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) that preserves bilattice-residuated structure on its declared scope (per [doctrine-fidelity-compositionality](../theorems/doctrine-fidelity-compositionality.md)). When two such bridges connect a federation graph of $N$ substrates, the resulting structure is a [multi-observer system](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/multi-observer-system.md) $V : \hat G \to \mathrm{Settlings}_B$ on the bridge graph $G$, whose consensus and disagreement are characterized by [bilattice network-sheaf consensus on agent graphs](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md).

## Structural fields

A federation-bridge record carries:

- **`id`** — kebab-case identifier, commonly naming the source-and-target vocabularies (e.g., `mastodon-activitystreams-to-substrate-v3`, `legacy-predicate-rename-bridge`).
- **`description`** — one-line summary of the translation the bridge performs.
- **`source-arena`** — reference to the [predicated-arena](predicated-arena.md) record describing the source substrate's I/O type contract. May reference a peer substrate's arena directly or a stand-in record describing an external system's effective arena.
- **`target-arena`** — reference to the receiving substrate's arena.
- **`predicate-mapping`** — declarations of how source predicates translate to target predicates. May be one-to-one, one-to-many (a source predicate splits into multiple target predicates), or many-to-one (multiple source predicates compose into a single target predicate). Each mapping must induce a valid morphism between the two substrates' [predicate categories](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md).
- **`value-translation`** — for value-domains that differ between the two arenas (e.g., a Boolean source mapping to a four-bilattice target), declarations of how source values translate to target values. Must be a bilattice-residuated homomorphism on its scope.
- **`identity-mapping`** — how source entity ids translate to target entity ids. Common patterns: hash-derived (target id = canonical hash of source id), direct (source id is admissible as target id), or registered (a substrate-recorded entity-id-mapping table).
- **`signing-key`** — reference to the cryptographic identity the bridge uses to sign translated outputs that cross substrate boundaries.
- **`error-policy`** — what the bridge does when a source predication is untranslatable: `reject` (refuse the predication, surface as a witness), `partial` (translate what's translatable, flag the rest), or `escalate` (refer the contested case to a [repair-catalog](repair-catalog.md) entry).

## Invariants

- **Doctrine-fidelity-preserving in scope.** Per [doctrine-fidelity](teaching/explanations/doctrine-fidelity.md), the bridge's translation must preserve the source's fibrational structure for the predications the bridge claims to translate. A bridge that loses structure is not doctrine-fidel and produces silent representation gaps.
- **Counit-law respecting per [interfacer-counit-law](../theorems/interfacer-counit-law.md).** A round-trip through the bridge — translate source-to-target, then target-to-source — must recover the original predications joined with any introduced annotations. Lossy round-trips are prohibited.
- **Substrate-recorded.** Every active bridge is a substrate entity, queryable through normal traversal. A bridge that exists only as runtime code is not substrate-recorded and breaks the [driver-substrate-split](teaching/explanations/driver-substrate-split.md).
- **Witness-emitting.** Every translation operation through the bridge produces a witness recording the source predications, the bridge's id, the target predications, and any error-policy invocations.
- **Composes per [doctrine-fidelity-compositionality](../theorems/doctrine-fidelity-compositionality.md).** A chain of bridges $B_1 \to B_2 \to B_3$ is doctrine-fidel on the intersection of the three scopes' fidelity. Engineers can verify each bridge in isolation rather than testing every chain combination.

## Operations

- *Translate-out.* Given a substrate predication addressed for a peer with a different arena, apply the bridge's predicate-mapping, value-translation, and identity-mapping to produce a target-arena-admissible representation. Sign with the bridge's signing-key. Emit a witness.
- *Translate-in.* Given a peer-substrate predication received at the boundary, apply the bridge's reverse mapping to produce substrate-admissible content. Pass through the substrate's normal admission discipline (port validation, shape conformance, constraint evaluation).
- *Validate.* Run a sample of round-trip translations to verify the counit law holds. The substrate's audit can run this validation periodically to detect bridge drift.
- *Compose.* Two bridges may compose if the target arena of the first equals the source arena of the second. The composition is itself a bridge, with the predicate-mapping, value-translation, and identity-mapping being the appropriate functorial compositions; doctrine fidelity composes by [doctrine-fidelity-compositionality](../theorems/doctrine-fidelity-compositionality.md).
- *Retire.* When a federated peer changes its arena, retiring the now-incorrect bridge is itself a substrate operation; the retirement is witnessed, future federation attempts using the retired bridge are rejected.

## What the federation bridge is not

- **Not the federation protocol.** Per [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md), the substrate's algebra is the federation protocol — the closure-merge commutation lemma of [crdt-convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence.md) is what gives convergence. The bridge is what makes federation possible when two substrates' arenas don't directly align; the protocol layer underneath the bridge remains the substrate's normal merge discipline.
- **Not a wire format.** ActivityStreams, RDF/OWL, custom JSON — these are wire encodings. The bridge is the *semantic* translator; wire-format adapters are typically separate from bridges, with the bridge sitting at the substrate-content layer above the wire.
- **Not a one-time migration.** A migration runs once to transform substrate content; a bridge runs continuously to translate cross-substrate communication. The two have different lifetimes and different audit-trail concerns.

## Position in the substrate

The federation bridge is the substrate's *vocabulary translator at the federation boundary*. Without it, two substrates with mismatched arenas cannot federate at all — every cross-substrate message would be untranslatable. With it, vocabulary mismatches are explicit substrate content; an auditor can inspect what translations a substrate accepts, what it rejects, and what it flags as repairable. The bridge graph of an N-substrate federation is the multi-observer system on which the consensus / disagreement structure of [bilattice network-sheaf consensus on agent graphs](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) lives.

The pattern composes with [predicated-arena](predicated-arena.md) (which the bridge translates between), with [interfacer](teaching/explanations/interfacer.md) (which the bridge specializes for cross-substrate vocabulary), with [doctrine-fidelity](teaching/explanations/doctrine-fidelity.md) (which the bridge must respect), and with the [agential-orchestration-platform](theories/agential-orchestration-platform/objects/federation-bridge.md)'s federation-bridge object (the agential subtheory's specialization, which adds agent-identity translation and per-agent authorization mapping).
