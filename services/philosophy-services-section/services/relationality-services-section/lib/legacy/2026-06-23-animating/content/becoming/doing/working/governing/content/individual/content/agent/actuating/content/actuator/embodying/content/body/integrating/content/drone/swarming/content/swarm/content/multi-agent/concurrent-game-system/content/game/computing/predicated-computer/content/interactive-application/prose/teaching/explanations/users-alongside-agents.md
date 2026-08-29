---
type: narrative
status: current
introduces: [user, account, user-state-predications]
discusses: [collaborative-editing, document, notification, authentication-flow]
---

# Users alongside agents

Predicated-computing has two sibling subtheories that commit to actors operating on the substrate. [agential-orchestration-platform](../../agential-orchestration-platform/_index.md) commits to *agents* — autonomous processes (human or AI alike, in AOP's terms) acting through dispatch, runbook execution, and skill invocation. This subtheory, interactive-application-platform, commits to *users* — humans acting through documents, lists, forms, notifications, and structured input. The two compose in a single substrate; the discipline is keeping them separable in the witness chain while sharing substrate content.

## Why both, not one

The temptation is to absorb users into agents: a user is just a special kind of agent, the one whose dispatcher is a UI rather than an LLM. The temptation is also to absorb agents into users: an agent is just a user that doesn't sleep, with the LLM as its decision-making aid. Both moves lose engineering precision.

A user's interaction with the substrate is *event-driven from outside*: a keystroke, a click, a form submission. The substrate has no control over when it happens. The substrate's discipline is to handle the event when it arrives — record the action, settle the consequences, surface the response in the UI. The user's cognitive load and ergonomic discipline are out-of-substrate concerns; the substrate sees them only through the events they produce.

An agent's interaction with the substrate is *closure-driven from inside*: the agent's tick comes from the substrate's heartbeat; the agent's next action comes from the substrate's dispatch matching the agent's current state to a registered skill. The substrate has full control over agent activity; the agent has no will independent of the substrate's settling. The agent's "decisions" are closure-rule applications.

The two are different shapes of relation between actor and substrate. Conflating them obscures the difference and produces engineering mistakes:

- Treating an agent like a user (substrate waits for the agent to "do something") deadlocks: agents have no will; nothing happens until the substrate's heartbeat ticks them.
- Treating a user like an agent (substrate dispatches the user to perform a skill) is non-sense: users have wills; the substrate cannot cause them to act.

The subtheories are separate because the actor-substrate relationship is structurally different. AOP is the discipline for substrate-internal actors; this subtheory is the discipline for substrate-external actors who interact through a UI surface.

## How they compose

A real interactive application — a project management tool, a collaborative document editor, a customer-support workspace — has both kinds of actor. Users edit documents, file tickets, comment on issues. Agents (an AI assistant, a workflow automation, a notification dispatcher) read substrate state, dispatch their skills, produce predication-cell updates that users see in their UI.

The substrate is shared. A document's content cells are written by both: a user typing produces text-span insertions; an agent suggesting a rewrite produces text-span insertions. The substrate's federation-convergence merges them; the document's version history shows both.

The discipline is in the witness chain. Per the parent's [witness](../../../objects/witness.md) discipline, each substrate operation records who performed it. Users sign their operations with the user-account credentials; agents sign with the agent's substrate identity (an AOP [agent](../../agential-orchestration-platform/concepts/agent.md) entity). Both witness signatures are first-class substrate content; the substrate can audit "which cells were written by users vs by agents" by inspecting the witness chain.

This separation is what lets the application surface the right view to each actor:

- A user reading a document sees agent-authored content marked as such (an agent-suggestion sidebar, a "rewritten by AI" badge on the relevant text-spans, an audit trail of agent actions).
- An agent operating on a document treats user-authored content as the input and produces its own output cells; the witness chain records the provenance so a future audit can trace any cell back to its actor.
- A federation peer receiving the document's substrate state sees both kinds of cell with both kinds of witness; it can apply its own policy (e.g., "accept only cells signed by trusted agents and known users").

## What this subtheory adds that AOP doesn't

AOP is rich on the agent side. It has [agent](../../agential-orchestration-platform/concepts/agent.md), [skill](../../agential-orchestration-platform/concepts/skill.md), [runbook](../../agential-orchestration-platform/concepts/runbook.md), [office](../../agential-orchestration-platform/concepts/office.md), [governance](../../agential-orchestration-platform/concepts/governance.md), and a settled discipline for how agents act. It has very little on users — a user appears as a peer-actor in the [agent-community-consensus](../../agential-orchestration-platform/theorems/agent-community-consensus.md) theorem but doesn't have its own object, its own authentication discipline, its own UI-adjacent semantics.

This subtheory adds:

- [user](../teaching/explanations/user.md) and [user-record](../objects/user-record.md) — the substrate-content representation of a person interacting through a UI.
- [account](../teaching/explanations/account.md) and [account-record](../objects/account-record.md) — the credentials-and-identity record that lets the substrate recognize a returning user across sessions.
- [authentication-flow](../teaching/explanations/authentication-flow.md) and the [authentication-as-modal-restriction](../theorems/authentication-as-modal-restriction.md) theorem — the discipline by which the substrate decides which user is performing an action and what they're allowed to see/do.
- [user-state-predications](../teaching/explanations/user-state-predications.md) — the substrate-content shape of user-specific state (preferences, drafts, recent activity, presence).
- The structured-input vocabulary: [document](../teaching/explanations/document.md), [list](../teaching/explanations/list.md), [form](../teaching/explanations/form.md), [notification](../teaching/explanations/notification.md), [validation-rule](../teaching/explanations/validation-rule.md), [text-span](../teaching/explanations/text-span.md) — the substrate-content shapes that a user-facing UI works with.

Each of these has an AOP-side counterpart that is structurally similar but interpreted differently. AOP's agent-state predications are read by the agent's dispatcher; this subtheory's user-state-predications are read by the UI render. AOP's agent-community-consensus is about agents agreeing on shared substrate state; this subtheory's [collaborative-edit-convergence](../theorems/collaborative-edit-convergence.md) is about users agreeing on shared document state. The structural similarity is intentional — it's the same substrate's federation-convergence applied to two actor populations — and the per-subtheory specialization captures what differs.

## What the composition leaves open

The currently-named open question is [multi-device-notification-convergence](../learning/questions/multi-device-notification-convergence.md), which is squarely in this subtheory. Two further open questions sit at the AOP / this-subtheory boundary and are not yet filed:

- *Cross-actor witness disambiguation under delegation.* When a user delegates a task to an agent ("write me a draft of this email"), the resulting cells are written by the agent on the user's behalf. The witness chain should show both — the agent wrote it, the user authorized it — but the discipline is not specified.
- *UI surfaces for agent-driven cells.* When an agent writes cells the user is interested in seeing, the substrate needs a notification or activity-feed mechanism that bridges this subtheory's [notification](../teaching/explanations/notification.md) discipline with AOP's agent-action witness chain. The bridge is implicit; making it explicit is open work.

These are candidate questions for the subtheory's questions/ directory as the work matures. The [collaborative-edit-convergence](../theorems/collaborative-edit-convergence.md) theorem's reference to AOP's [agent-community-consensus](../../agential-orchestration-platform/theorems/agent-community-consensus.md) is the structural anchor that lets the boundary questions be raised cleanly.
