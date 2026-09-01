---
type: concept
class: framing
depends-on: [predication-substrate]
see-also: [substrate-universality, settling-as-computation, engine]
---

# Substrate modes

The word "substrate" names three structurally distinct relationships between a lower layer and what is built on or acts through it. The predicated-computing literature elsewhere uses "substrate" loosely; this concept makes explicit that *which* mode is meant determines what disciplines apply and what guarantees can be expected. A substrate-mode confusion is the engineering pathology of asking a `Patient`-mode substrate to behave like a `Foundation` (durable across operations), or asking a `Base`-mode substrate to enforce conditions only a `Foundation` can enforce.

The three modes are:

- **Base.** Positional indexing only — *where* without *how*. A base supplies the addressing structure: a set of points and the transitions between them. It carries no covering structure, no enabling conditions, no validation. Anything functorial on the points is admissible. The base is preserved through every operation that takes place over it.
- **Foundation.** A base enriched with conditions for what counts as a coherent superstructure — *where, plus the rules for admissible builds*. A foundation specifies which families of points form covers, which presheaves over the points are sheaves, which assignments are admissible. The foundation is preserved through every operation; it is the stable contract the superstructure must satisfy. Two implementations sharing a foundation are interchangeable for any superstructure that respects the foundation's conditions.
- **Patient.** The substrate that is *acted upon and transformed* by an operation. Unlike base and foundation, the patient is not preserved — it enters as input, the operation transforms it, the output is an enriched (or reduced) form of the same patient. The patient is the molecular substrate of biochemistry, the workpiece of a manufacturing step, the predication being settled by closure-rule application.

These are not synonyms. A predicated computer involves all three at once, and the engineering work is to keep them named distinctly.

## Where each mode shows up

In a predicated computer:

- The [predication-graph store](../objects/predication-graph-store.md)'s addressing — entity ids, predicate names, the canonical-form hash space — is a **base**. It supplies the points and transitions; it does not impose conditions on what assignments are coherent. Any predication shape consistent with the addressing's functoriality is admissible at the base level.
- The [closure-rule system](closure-rule.md), the [shapes](theories/agential-orchestration-platform/objects/shape-record.md), the [coherence-glue](../morphisms/coherence-glue.md) discipline, the canonical-form discipline, and the [seven closure conditions](closure-conditions.md) are the **foundation**: the substrate's published rules for what counts as admissible content, settled state, complete sublocale. Two implementations sharing this foundation are interchangeable; the foundation is what the engine respects when it settles.
- A specific predication being acted on by a closure rule — the value being raised by an inference, the canonical form being computed, the shape being checked against — is a **patient**. The closure rule transforms the patient; the engine's inner loop is patient-by-patient processing.

The three modes co-exist in a single substrate operation. When the engine applies a closure rule, the addressing (base) tells it where to look, the rule's premise (foundation) tells it whether the rule applies, and the predication being raised (patient) is what gets transformed. Confusing them produces silent bugs: a closure rule that mutates the addressing is breaking the base's preservation; a foundation rule that secretly depends on host-platform behavior is breaking the foundation's portability; a patient transformation that updates the foundation in place is breaking foundation's preservation across operations.

## Why the distinction matters

Three engineering consequences:

- **Substrate independence is a foundation claim.** When the engineering theory says a predicated computer is substrate-independent — that the same computer can run on a flatfile store, a database store, a network-attached store — the claim is that the *foundation* is portable across the storage choices, not that any particular base is shared. Two implementations with different bases (different addressing schemes, different canonical forms) but the same foundation (same closure conditions, same shape discipline) are equivalent computers. Two implementations with the same base but different foundations are different computers running on the same address space.
- **Mode mismatch is a frequent pathology.** A substrate that hardcodes patient-level details into the foundation (e.g., a closure rule that bakes in a specific value's address) is fragile under [schema-evolution](schema-evolution.md). A substrate that asks the base to perform foundation work (e.g., a graph store that enforces shape conformance at the addressing layer) has crossed mode boundaries and lost the base's neutrality. The engineering discipline is to keep each mode at its proper layer.
- **The substrate's dynamics are patient-mode.** [Settling as computation](settling-as-computation.md) is a patient-mode operation: the predication being settled is the patient; the foundation's closure rules govern the settlement; the base is preserved throughout. An engine that treats settlement as a foundation-mutation operation has elevated patient work into foundation work and broken the substrate's stability.

## Mode and operation

Different operators act on different modes:

| Operator class | Acts on | Examples |
|---|---|---|
| Address operator | Base | hash, canonical-form construction, traversal-by-name |
| Foundation operator | Foundation | closure-rule registration, shape declaration, scope policy edit |
| Patient operator | Patient (a specific predication) | closure-rule application, repair invocation, value raise |

When an operator straddles modes — for example, a [snapshot](../objects/snapshot.md) operation that preserves the base's identity, the foundation's rules, and a patient configuration at one moment — the operator's specification names which mode each input belongs to. The substrate's audit trail records each transformation at its mode level: a base-level change (a fork's parent id), a foundation-level change (a new closure rule), a patient-level change (a settled predication). The three streams of changes are auditable separately and reconcile into a single canonical history.

## Position in the substrate

Substrate modes are the substrate's *name for its layers*. Without the distinction, "the substrate" is a single word covering at least three different things, and engineering arguments about the substrate routinely conflate base portability with foundation portability with patient transformability. With the distinction, claims about a predicated computer can be precise: which mode is preserved, which mode is transformed, which mode is published as a contract.

The framing composes with [substrate-universality](substrate-universality.md) (the foundation is what is universal across substrate realizations; the base is allowed to vary), with [self-representation](self-representation.md) (closure rules and shapes are foundation-mode entities, but their declarations are patient-mode admissions when first introduced), and with [driver-substrate-split](driver-substrate-split.md) (the runtime carries no foundation; the foundation lives in substrate content).
