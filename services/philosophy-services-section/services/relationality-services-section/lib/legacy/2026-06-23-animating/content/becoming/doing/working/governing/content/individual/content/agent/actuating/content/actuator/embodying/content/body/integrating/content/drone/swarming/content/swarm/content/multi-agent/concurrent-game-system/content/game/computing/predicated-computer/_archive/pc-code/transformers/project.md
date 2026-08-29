---
type: morphism
class: observation-operator
realizes: [sublocale-as-application, doctrine-fidelity]
depends-on: [predication-graph-store, fiber, shape-record, predication-valuation, predication-fibration, application-sublocale]
see-also: [traversal, get-cell, interfacer, cost-discipline-reads-free]
---

# Project

The observation-side operator that composes substrate fibers into an external view — a sublocale projection. Where [admit](admit.md) is the boundary's intake, project is the boundary's *emission*: a structured read of the substrate's [predication valuation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md) restricted to a sub-fibration of the substrate's [predication fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md), shaped into whatever wire format an external consumer needs (markdown file, JSON response, ActivityStreams JSON-LD, CLI rendering, federation outbound message).

Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), project is *free* — it produces no substrate state change, emits no witness in the audit chain, and is bounded only by the read region's size. Multiple consumers projecting the same substrate state get cellwise-equal observations.

## Signature

`project(view-spec, substrate-state, observation-context) → projected-output`

Inputs:

- **`view-spec`** — references to a sublocale declaration (per [sublocale-as-application](teaching/explanations/sublocale-as-application.md)): which entities to include, which predicates to traverse, which [shape-record](../objects/shape-record.md) governs the output's structure. Structurally the view-spec defines a sub-fibration $\mathcal{E}_{\mathrm{view}} \hookrightarrow \mathcal{E}$.
- **`substrate-state`** — the [predication-graph store](../objects/predication-graph-store.md) at the chosen history, materializing the predication valuation $v_\tau$. Defaults to the current history but may be a [snapshot](../objects/snapshot.md) for replay.
- **`observation-context`** — the [scope-record](../objects/scope-record.md) bounding what's visible, the requesting agent's identity (when scope policy gates by identity), and the wire-format the consumer expects.

Outputs:

- **`projected-output`** — the formatted view: bytes in the requested wire format, suitable for transmission to the external consumer.

## Operational semantics

Project proceeds through four phases:

1. **Fiber composition.** Given the view-spec's sub-fibration declaration, the substrate's [traversal](traversal.md) operator produces a set of [fibers](../objects/fiber.md) from $v_\tau$. Each fiber's content is read via [get-cell](get-cell.md) and assembled into the view's intermediate predication graph — the restriction of $v_\tau$ to the view's sub-fibration.
2. **Shape-rendering.** The intermediate predications are rendered per the cited [shape-record](../objects/shape-record.md). Predications without applicable shape-records pass through with their default rendering; predications with applicable shapes are formatted per the shape's declarations.
3. **Wire-format serialization.** Per the observation-context's wire-format, the rendered view is serialized: markdown bodies for text consumers, JSON for HTTP APIs, ActivityStreams JSON-LD for fediverse consumers, RDF triples for semantic-web consumers.
4. **Scope-policy filtering.** Predications outside the requesting agent's scope are excluded from the output. Per [scope-record](../objects/scope-record.md), this is part of the substrate's read-discipline — consumers only see what their scope and identity admit.

The result is the projected output. The substrate's state is unchanged.

## Engineering invariants

- **Free at the substrate level.** Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), project produces no state change. The cost is local read cost (bounded by fiber widths) and local rendering cost (bounded by output size); neither bills against substrate fuel.
- **Deterministic on canonical input.** The same view-spec applied to the same substrate state at the same scope produces byte-identical output. Replay against a [snapshot](../objects/snapshot.md) reproduces the historical view exactly per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md).
- **Doctrine-fidelity-preserving in scope.** Per [doctrine-fidelity-compositionality](../theorems/doctrine-fidelity-compositionality.md), the project's output preserves the source predications' fibrational structure for what the wire format claims to represent. Lossy projections (an output that drops structure the consumer needs) are surfaced through the shape-record's declared kernel.
- **Witness-free unless instrumented.** Project does not emit a witness by default. Instrumented projects (those whose observation policy declares "audit reads") may emit a read-witness; this is opt-in.

## Failure modes

- **Out-of-scope view-spec.** The view-spec requests entities or predicates outside the observation-context's scope. The substrate returns a partial output, with the out-of-scope content elided per scope-policy filtering.
- **Missing shape-record.** A view-spec references a shape-record that doesn't exist or has been retired. The substrate falls back to default rendering.
- **Wire-format unsupported.** The observation-context requests a wire format the substrate's interfacers don't speak. The substrate returns an error rather than silently re-formatting.
- **Substrate-state inconsistency.** The projection encounters un-settled predications mid-region. Per [substrate-state](teaching/explanations/substrate-state.md), the consumer can choose to wait for settlement (blocking projection) or accept the un-settled flag (live projection).

## Position in the substrate

Project is the substrate's *emission primitive*. Per [substrate-anatomy-as-four-components](teaching/explanations/substrate-anatomy-as-four-components.md), it sits at the observation surface; per [substrate-as-stack-composition](teaching/explanations/substrate-as-stack-composition.md), it lives at the head of the observation stack. Every external view of substrate content is produced through project; the substrate's audit trail can identify what views have been projected (when audit instrumentation is on), but the substrate's behavior does not change because of projection.

The pattern composes with [traversal](traversal.md), [get-cell](get-cell.md), [interfacer](teaching/explanations/interfacer.md), and [admit](admit.md) (the dual primitive — intake versus emission, both at the boundary).
