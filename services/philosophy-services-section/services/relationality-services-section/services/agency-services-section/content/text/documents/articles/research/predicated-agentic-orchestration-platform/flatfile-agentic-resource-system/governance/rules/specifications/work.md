---
name: work
description: Specification of resource files under a theory's `work/` directory. Work is the substrate's record of in-progress idealization and researching morphisms — the active activity that moves resource settlings toward theory ideals or extends theories themselves. Mathematically each work record is a substrate predication signed by its queueing agent, bounded by that agent's modally-restricted capability, dispatched per the substrate's scheduling closure rules.
title: work
---

A work resource file presents a single in-progress activity — a task, a log entry, an inbox item, a session record.

## What work is, mathematically

The basic unit of theory-driven knowledge production is the cycle of **researching followed by idealization** (per [researching morphism](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/researching.md) and [idealization morphism](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/idealization-morphism.md)):

- A [researching morphism](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/researching.md) $\rho : T \to T'$ extends a host theory by adding new predicates that produce strict knowledge-advance.
  It is non-free at the theory level — it requires genuine new discovery.
- An [idealization morphism](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/idealization-morphism.md) $\eta^T_R : v^R \to v^R_{T,\infty}$ moves a resource settling toward its theory-relative ideal — it witnesses that the resource is below the theory's ideal in the knowledge order and names the path that closes the gap.

Work is the substrate's record of these morphisms *in progress*.
A work record names what is being done, by what agent, against what theory ideal or research target, with what bounded capability.

Per the predicated-agentic-orchestration-platform's [agent-self-queued-work](../../../../agent/agential-self-generation/agent-self-queued-work/agent-self-queued-work.md) concept, a work item admitted by an agent is bounded by the agent's modal-restricted capability $\Box_R u_a$: agents cannot queue work requiring capability beyond their own modal restriction.
This is the structural answer to "AutoGPT runs away" — work is queueable but bounded.

A work record is itself a substrate predication signed by its queueing agent's session (per the substrate's signature discipline).
The substrate's scheduling closure rules dispatch the work when capacity allows.
Work admission, dispatch, completion, and failure each produce witnesses in the substrate's event log.

## File location

`<theory>/work/<resource-slug>.md` — or in a kind-specific sub-directory of `work/` when the realization distinguishes work content types:

- `work/tasks/<slug>.md` — task records (planned or in-progress work items).
- `work/inbox/<slug>.md` — inbox records (incoming items not yet triaged).
- `work/logs/<date>/<slug>.md` — log records (witnesses of completed activity, dated).
- `work/sessions/<slug>.md` — session records (an agent's working state at a point in time).

These sub-divisions are realization-specific; the canonical commitment is that all in-progress and audit-trail work content is in `work/` and SHALL be substrate-recorded.

## Frontmatter

### `name`

The slug naming this work record.
Required.

### `description`

One-sentence statement of what this work item is doing or recording.
Required.

## Body

Human-readable description: what the work item is, what it targets, what completion looks like, what witnesses it produces.

## Bounded autonomy invariants the spec inherits

Per AgOP's agent-self-queued-work concept, conformant work content MUST satisfy:

- **Signed.** Work items are signed by the queueing agent's session, structurally attributable.
- **Bounded by modal restriction.** A work item's required capability MUST be a subset of the queueing agent's $\Box_R u_a$.
  Capability non-amplification is structural at both admission and dispatch.
- **Substrate-recorded.** Work items are substrate predications, not external queue entries.
  Editing or cancelling a work item is editing substrate content.
- **Witnessed end-to-end.** Admission, dispatch, completion, and failure each produce a witness in the event log.

## What this specification does not pin

The structured frontmatter representing the kind of work content (task vs log vs inbox vs session) and the work-item structure (required-capability, cost-estimate, value-estimate, priority, expiry, queued-by, signature) is deferred to per-kind sub-specs.
Until then, the `name` + `description` minimum frame applies, and the body carries the structured content in prose.

The relationship between work records and the researching/idealization morphisms they witness — naming which morphism a given work item is enacting — is currently presentation-only.
A future refinement may add a `enacts-morphism:` key.
