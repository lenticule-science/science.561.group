---
type: concept
class: predication-pattern
depends-on: [witness, provenance]
see-also: [event-log]
---

# Origin

The discipline that *every event in a predicated computer carries a predication declaring its originating cause*: which entity, operator, hook, agent, or external boundary caused the event. Origin is part of the [witness](witness.md) chain — every event's witness records its origin alongside the event's content, hash, and operator specification.

Origin is structurally distinct from [provenance](provenance.md):

- *Provenance* is the chain of causally-prior events that, taken together, justify the current event. The chain has multiple steps; the substrate traverses it backward through the event log.
- *Origin* is the immediate cause: the *single* substrate entity (or the declared external boundary) that the event was emitted from. Each event has exactly one origin.

The two are related: provenance is the transitive closure of origin chained backward through events.

Three engineering uses:

- **Audit traceability.** When an action goes wrong in a long-running, autonomous, multi-agent session, the substrate can trace the action to its source by following origin predications backward. An event with no origin is a substrate-level violation: the event arrived without declared cause.
- **Trust and authorization.** An event's origin determines whose authorization is checked: an event originating from agent $a$ is checked against $a$'s authorization predications; an event originating from the external boundary $b$ is checked against the boundary's signed-witness verification. The same event content carries different admissibility consequences depending on its origin.
- **Origin-aware security policies.** A privileged operation may be admissible only when invoked from particular origins (a system-level closure rule, an internal driver, or an operator with declared elevated authorization), refused when invoked from other origins. The substrate's closure rules consult the event's origin predication directly.

The discipline is what makes the substrate's audit non-vague. A computer without origin discipline can record *what happened* but not *who or what caused each thing to happen*; it can replay the sequence but cannot answer "which agent's action triggered this state change?" without reconstruction. A computer with origin discipline answers the question by direct traversal.

A multi-agent platform inherits the discipline naturally: each agent's actions are events with origin = agent-identity. Autonomous loops that trigger their own events without declaring origin are violations to be diagnosed; the discipline is an engineering tool for detecting such violations at substrate level rather than at debugging time.
