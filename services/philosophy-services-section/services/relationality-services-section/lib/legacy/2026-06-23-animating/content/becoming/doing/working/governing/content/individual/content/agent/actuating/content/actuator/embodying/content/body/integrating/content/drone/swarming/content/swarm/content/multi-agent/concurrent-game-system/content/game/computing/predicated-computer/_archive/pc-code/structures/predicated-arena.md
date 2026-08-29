---
type: definition
class: contract
depends-on: [port, stepping, predication-fibration, predicate-category]
see-also: [predicated-computer, federation-as-substrate-join, interfacer, federation-bridge]
---

# Relational arena

The **arena** of a [predicated computer](predicated-computer.md) is its full input/output type contract: what the computer accepts as steps and what it returns as observations, expressed at the level of *types* such that two computers can be inspected for connection compatibility without inspecting their internal implementations. Where the [port](teaching/explanations/port.md) names the substrate's input vocabulary alone, the arena pairs the input vocabulary with the output observation type to give the substrate's full external signature. Structurally, an arena declares the substrate's [predication fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md)'s external surface — which sub-[predicate-category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) is exposed as input vocabulary, which is exposed as output observation type.

The arena is the engineering object that makes substrate connection a typed concern: two predicated computers can be connected when their arenas align — when one's output type is receivable as the other's input type. Without an explicit arena, connection is implicit and asymmetric: the connecting party must reverse-engineer what the other will accept and what it will emit. With an arena, connection is a published contract.

## Two-component structure

A predicated arena is the pair `arena = (input-type, output-type)` where:

- **Input type** is the [port](teaching/explanations/port.md) — the typed message vocabulary the substrate accepts at its [boundary](teaching/explanations/boundary.md), together with the independence relation declaring which message kinds commute. The input type is what external systems must speak to admit content.
- **Output type** is the substrate's *observation contract* — the typed shape of what the substrate emits at its observation surface for each step. For step-by-step emission, the output type is the substrate's published per-step delta. For query-style observation, the output type is the catalog of observable views and their result shapes.

Both halves are explicit substrate content per [self-representation](teaching/explanations/self-representation.md): the arena is itself published as predications about the substrate, readable through the same observation surface the arena describes.

## Connection compatibility

Two predicated computers `A` and `B` can be connected when `A`'s output type is admissible against `B`'s input type — equivalently, when `A`'s emitted predications can be admitted to `B`'s input fibration, possibly via a [federation-bridge](federation-bridge.md). Three regimes follow:

- **Direct compatibility.** `A`'s output type is a subset of `B`'s input type; `A`'s emissions can be admitted to `B` without translation. The two computers share an arena fragment.
- **Translatable compatibility.** `A`'s output type and `B`'s input type are not directly compatible, but a federation-bridge (per [doctrine-fidelity-compositionality](../theorems/doctrine-fidelity-compositionality.md)) can convert between them.
- **Incompatible.** `A`'s output type cannot be expressed in `B`'s input type, even with translation. The computers cannot federate without first extending one's arena.

## What the arena is not

- **The arena is not the protocol.** A protocol is a [transport](teaching/explanations/transport.md) — JSON-RPC, MCP, HTTP, NATS subjects. The arena is the type-level contract; per [transport-tolerance-of-federation](../theorems/transport-tolerance-of-federation.md), multiple protocols can carry the same arena. Two computers sharing an arena can talk over any transport both speak.
- **The arena is not the closure-rule system.** Closure rules govern how admitted content settles inside the substrate; the arena governs what content the substrate accepts and what it emits. Two computers with the same arena may have different closure-rule systems and produce different settled outputs from the same admitted content.
- **The arena is not a guarantee of behavioral equivalence.** Two computers sharing an arena are connection-compatible but their internal settlement behavior may differ. Behavioral guarantees beyond the arena require additional published commitments per the substrate's theorems.

## The arena as the substrate's external interface

A predicated computer's arena is what an external system reads to decide whether to integrate. A publisher checking the arena learns:

- What message kinds it can submit (the port).
- What independence relation it can rely on (which submissions can be parallel, per [independence-implies-confluence](../theorems/independence-implies-confluence.md)).
- What observations it will receive in response (the output type).
- What rate, scope, and authorization concerns it must respect.

This is what makes the substrate's connection discipline deterministic: integration is a function of the arena, not of reading runtime code.

## Position in the substrate

The arena is the substrate's *typed external mouth and ear, paired*. It is the smallest object that captures both directions of substrate I/O at the type level. The pattern composes with [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md), with [federation-bridge](federation-bridge.md), with [interfacer](teaching/explanations/interfacer.md), and with [bootstrap](teaching/explanations/bootstrap.md) (a substrate's initial arena is established at bootstrap by admitting the arena's predications as substrate content).
