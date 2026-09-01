---
type: concept
class: framing
depends-on: [substrate-modes]
see-also: [substrate-universality, two-store-coherence, repair]
---

# Infrastructure as substrate

The framing under which a predicated computer's substrate is *infrastructure* in the technical sense studied in science-and-technology studies, civil engineering, and software architecture: a layer that supports practice, is invisible while it works, becomes visible only on breakdown, and is constrained by what was already installed. The framing is complementary to [substrate-modes](substrate-modes.md) (Base/Foundation/Patient): it adds the temporal and operational dimensions of a substrate-as-infrastructure relationship, capturing what the substrate's engineering must commit to for the substrate to deserve being called infrastructure rather than mere implementation.

The framing is useful because it points at engineering decisions that the modes framing alone leaves implicit. *When* should a substrate's content be visible to operators? *Under what conditions* must operators attend to the substrate directly versus working transparently through it? *How* is the installed substrate constrained by what came before? These are infrastructure-level questions, and the framing names them so the substrate's discipline can answer them explicitly.

## Seven engineering invariants

The substrate-as-infrastructure framing commits to seven invariants, each substrate-observable and each falsifiable:

- **Enabling.** The substrate is *necessary* for the practice that runs on it. Removing the substrate removes the ability to do the practice; no amount of practice-side cleverness substitutes for substrate availability. A substrate's commitment to be infrastructure is its commitment to be the layer practice depends on.
- **Substrate priority.** The substrate is defined independently of any particular practice. A substrate that requires knowing what practice it serves before it can be specified is *not* infrastructure — it is application logic. The substrate's [arena](../objects/predicated-arena.md) is the contract; what runs on top is decoupled.
- **Transparency in use.** When the substrate is at fixed-point — settled, coherent, no contested predications — operators attend to *practice*, not to the substrate. Queries return the right answers, settlements complete, federation peers respond. The substrate is invisible. This is not a bug or a missing feature; it is the substrate's signal that it is working.
- **Visibility on breakdown.** When the substrate is *not* at fixed-point — un-settled wavefront, contested predications, lost coherence-glue — operators must attend to the substrate directly. The substrate's [repair](repair.md) discipline surfaces the disorder; the substrate's [telemetry](telemetry.md) makes it inspectable; operators do substrate-level work to restore the fixed-point. After repair, the substrate returns to transparent.
- **Installed-base constraint.** The substrate at any moment is constrained by the substrate that came before. New substrate state must be compatible with prior substrate state — the [restriction maps](substrate-state.md) must hold; the [event log](../objects/event-log.md) must replay; the [hash-discipline](hash-discipline.md) must remain canonical. A substrate cannot retroactively change its installed history without producing a different substrate.
- **Substitutability under enabling conditions.** Two substrates that both satisfy the practice's enabling conditions are interchangeable from the practice's perspective. A practice that runs on substrate A and the same practice running on substrate B (per [substrate-universality](substrate-universality.md)) cannot tell the substrates apart through the practice's interface to them. Substitutability is what makes substrate migration a real engineering option.
- **Dependency direction.** The only morphisms across the substrate/practice boundary go from practice to substrate (practice queries substrate, practice admits to substrate). The substrate does not depend on the practice's content; substrate operations are specified without reference to which practice runs on the substrate. A substrate that depends on the practice has crossed the dependency direction and is no longer infrastructure.

The seven together are what makes the substrate's infrastructure-claim operative. A substrate satisfying all seven is checkable infrastructure; a substrate that satisfies six and fails one (typically transparency or substitutability) is degraded infrastructure with a known failure mode.

## What transparency and visibility look like in practice

The transparency/visibility duality has substrate-level concrete realizations:

- **Transparent operations.** Reading a settled cell, traversing along a settled relation, projecting a settled sublocale — none surface substrate content to the operator. The operator sees the practice-level content (a markdown file's body, a JSON response, a CLI rendering) and reasons at the practice level. The substrate's cells, witnesses, and event-log ordinals are invisible because there is nothing for the operator to do at that layer.
- **Visible operations.** Reading a contested predication surfaces the contention to the operator. Reading an un-settled cell surfaces the un-settled flag. Reading a sublocale that has lost coherence-glue surfaces the gap. In each case, the substrate signals "the practice's normal expectation is not currently met"; the operator's job is to repair the substrate before the practice can resume relying on transparency.

The discipline points at a substrate-level commitment: the substrate must be able to tell the operator *what is wrong* in operationally meaningful terms — a contested-predication identifier, a coherence-glue gap location, a vocabulary-debt entity. A substrate that signals "something is wrong" without identifying what is failing transparency on breakdown.

## Engineering consequences

The framing produces substrate-level commitments engineering can check:

- **Substrate audits should be readable without practice context.** A substrate's [witness chain](witness.md), [event log](../objects/event-log.md), and audit views should be inspectable by an operator who knows the substrate's algebra but knows nothing about the specific practice running on it. The operator should be able to identify substrate-level anomalies (un-settled wavefronts, contested predications, lost coherence-glue) without needing practice-level expertise.
- **Substrate failures must surface substrate language.** When the substrate cannot satisfy an operation, the failure message names substrate concepts (port mismatch, shape conformance violation, fuel exhaustion, contested predication), not practice concepts. The substrate's operational interface is its own; failure messages that describe the practice's experience without identifying the substrate's contribution have collapsed the dependency direction.
- **Substrate migration is a practice-transparent operation.** Per [substrate-universality](substrate-universality.md), moving a practice from substrate A to substrate B (both satisfying the practice's enabling conditions) should not change the practice. The migration is the substrate's installed-base transfer; the practice continues running. A substrate whose migration breaks the practice has failed substitutability.

## Position in the substrate

Infrastructure-as-substrate is the substrate's *operational stance*. Without naming the framing, claims about substrate "transparency" and "reliability" are vague; with the framing, they are checkable against the seven invariants. The substrate's engineering can point to specific operations and ask, of each: is this transparent under fixed-point? Does it surface substrate language on breakdown? Does it respect the installed base? Is it independent of the practice running on top?

The framing composes with [substrate-modes](substrate-modes.md) (the seven invariants apply differently to Base, Foundation, and Patient modes — the base layer's installed-base constraint is graph addressing; the foundation's is the closure-rule system; the patient's is the latest fiber's content), with [substrate-universality](substrate-universality.md) (substitutability is the universality claim restricted to enabling conditions), and with [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md) (each federated substrate is infrastructure for its peers; the federation's transparency is each peer respecting the seven invariants from the others' perspective).

The discipline is what distinguishes a substrate from a tightly-coupled application: a substrate that fails the seven invariants has built application logic into its layer and is no longer infrastructure for the practice it supports.
