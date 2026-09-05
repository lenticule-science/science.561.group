---
type: narrative
status: current
recaps: [scope, boundary]
introduces: []
---

# Scope is predication, not procedural permission

The traditional shape of access control on a Boolean computer is a procedural check: when an operation tries to act on a resource, the runtime calls into a permission system, which evaluates a policy against the operation, the actor, and the resource, and returns allow-or-deny. The permission system is a separate subsystem. Its policy is encoded in code or in policy documents that the runtime parses and interprets. The check fires at every operation. The cost is a function call per operation; the audit trail is a log produced by the permission system separately from the operations themselves.

This pattern has three failure modes that are difficult to fix within the procedural shape:

- **Drift between policy and implementation.** The policy says one thing; the runtime's check implements something close-but-not-identical. The two can diverge silently, and the only ground truth is the runtime's behavior.
- **Audit isn't algebraic.** The permission system records its decisions, but the decisions are not substrate content — they are subsystem outputs. Reasoning about who could do what at which past moment requires reading the permission system's logs, which may or may not have been preserved, and which exist outside the substrate's audit trail.
- **Composition is procedural.** When multiple constraints apply (the actor's role, the actor's individual permissions, the resource's policy, the session's mode), the runtime composes them with imperative code: if-this-and-that, with the order of checks mattering for behavior. The composed policy lives in code.

The substrate's response is to make scope itself substrate content. Per [scope](../teaching/explanations/scope.md), a scope is a bounded sub-region of the predication graph: a set of entities, a predicate vocabulary, an admission discipline. An actor's *capability within a scope* is itself substrate content — predications on the actor's entity stating what the actor reads, what the actor writes, which entities the actor can act on. The capability is loaded once when the actor enters the scope (at investiture, at session start, at boundary establishment) and is queried by every subsequent operation as a single fiber composition rather than a procedural check.

The shape is concrete. A scope's capability predication has the form: a list of entity references the actor may read, a list the actor may write, a list of operations the actor may invoke. These are not free-form permissions; they are entity references the substrate can traverse. When the actor attempts an operation, the substrate composes the operation's required-capabilities fiber with the actor's possessed-capabilities fiber. If the composition produces consistent predications, the operation is admitted. If it produces a contradiction, the operation is rejected with the contradiction itself as the reason — the substrate's predicate-level disagreement is the rejection's justification.

Several engineering consequences follow:

- **One algebra, not a separate subsystem.** The same fiber composition that performs every other substrate operation performs admission control. There is no permission system to drift from the substrate; admission is a substrate operation like any other.
- **Audit is substrate-native.** Per [witness](../teaching/explanations/witness.md), the admission decision is witnessed, the witness is in the [event log](../objects/event-log.md), the substrate's audit trail covers admission as a first-class operation. Reasoning about past admissions is reasoning about past substrate state, not about a separate log.
- **Composition is structural.** When multiple capability predications apply to an actor (the office's defaults, the personnel record's overrides, the session's mode-imposed restrictions), the substrate's join composes them per the substrate's value-domain. The composed capability is a fiber, derivable deterministically from its components.
- **Capability changes are substrate edits.** Adding a capability is inserting a predication. Revoking a capability is retracting one. The change is auditable, replicable, and reversible by the substrate's repair discipline. There is no "deploy a new policy" step.

This is how a substrate satisfies the engineering claim that its admission discipline is *the same kind of thing as its content*. The procedural shape's failure modes follow from making admission a separate subsystem; the substrate's resolution is to absorb admission into substrate content. The result is that an actor's capability at any past moment is the substrate's recorded capability predication at that moment — recoverable, replayable, and reasoned about with the substrate's own algebra.

The pattern composes with [mode](../theories/agential-orchestration-platform/concepts/mode.md): a mode is an additional restriction on a scope's capability fiber, not a separate permission overlay. With [office](../theories/agential-orchestration-platform/concepts/office.md): an office's authority is a capability predication on the office entity, inheritable by personnel through additive composition. With [federation](../theories/agential-orchestration-platform/concepts/federation.md): when an actor crosses substrates, the destination substrate composes the actor's incoming capability claim with the destination's local policy fiber, and the resulting composition is the actor's capability at the new substrate. None of these require additional subsystems; they are all instances of the substrate's one capability-as-predication discipline.

The discipline's hard edge is its insistence that capability is *not* prose. A scope's reads and writes are entity references the substrate can traverse, not paragraphs of policy text the runtime has to interpret. Prose-described capability is the substrate's signal that the relevant vocabulary is incomplete: the predicates needed to express the capability structurally have not yet been declared. Per [vocabulary-completeness](../teaching/explanations/vocabulary-completeness.md), the substrate surfaces this as vocabulary debt; the engineering response is to declare the predicates, not to leave the capability prose-described and rely on a procedural subsystem to enforce it.
