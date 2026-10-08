---
name: 2026-05-04-working-by-hand-out-of-fars-workstream
description: Captain works directly with one large agent instead of dispatching to a FARS-orchestrated swarm
type: friction-log
class: workstream-bypass
date: 2026-05-04
status: open
see-also: [2026-05-04-substrate-records-by-hand, 2026-05-04-trusted-agent-authored-substrate, ../../questions/mcp-client-as-swarm-participant, ../../teaching/explanations/friction-log]
title: 2026-05-04-working-by-hand-out-of-fars-workstream
date-created: 2026-05-04
---

# Captain works directly with one large agent instead of dispatching to a FARS-orchestrated swarm

This is the meta-friction subsuming every other entry today, and per the captain's framing, the *biggest* one in the substrate's current operation: "Doing things by hand not filing tasks that get dispatched to agents by FARS *is* a friction, too: if we don't view 'doing work ourselves out of the FARS workstream' as a friction, we will be blind to our BIGGEST issues."

Empirical material: this entire session.

The captain typed messages to one large model (me); I performed every action — substrate reads, substrate edits, install-harness invocations, friction-log writing, harness drafting, code edits, ship registrations, polity-record updates.
None of it was *dispatched* to specialized agents via FARS.
None of it produced witnesses tied to a dispatch table.
None of it was scoped by office or skill-record.
The substrate has all the apparatus (`AgentRecord`, `SkillRecord`, `RunbookRecord`, dispatch, heartbeat, scope, governance) but it sat unused; the work flowed entirely outside it.

Tried: nothing else.
The harness I'm running on (Claude Code) doesn't expose a "submit task to FARS" verb to me.
The captain's interface (this chat) doesn't expose a "dispatch this to FARS" affordance to them.
The substrate's dispatch operator exists in code (`fars dispatch` is one of the 50 verbs); but neither side of the captain-agent conversation has a way to route through it.

Had to: the captain hand-prompts me; I hand-execute; the substrate records nothing about who did what under which authorization.
Every entity created today (`swarm.md`, `confederation.md`, four question records, `friction-log.md`, five friction entries, the nix-flake harness, the ship records, this entry) was attributed in the substrate to nothing and nobody — no `actor:` field, no witness chain, no dispatch trail.
The work happened; the substrate's *accounting of agential activity* missed it entirely.

Violates: every load-bearing FARS commitment.

- *Agential-self-generation* — every operative element should be a substrate entity.
  The work itself is operative; the captain's prompts and my actions are operative.
  Neither were entities.
- *Witness chain* — every operation produces a witness tied to actor + scope + mode + office.
  Today: no witnesses produced.
- *Dispatch* — work is matched to agent-skill pairs via twist-product fusion in the closure-rule sub-system.
  Today: I did everything; no skill-record matched, no agent-record dispatched.
- *Scope and authorization* — agents act under bounded scope and authorized capability.
  I had no scope; I acted with whatever capabilities the host harness happened to expose (full filesystem, full git, full repo).

Gap: the entire swarm-over-the-web architecture the captain is building toward.
Concretely:

1. **MCP/A2A exposure of FARS dispatch.** The captain's chat client (or any cloud-agent) needs to be able to submit a task into FARS, not just have its prompts forwarded to a single model.
  This is the substantive resolution of the [`mcp-client-as-swarm-participant`](../../../mcp-client-as-swarm-participant/mcp-client-as-swarm-participant.md) question.
2. **Substrate-resident task records.** Every thing the captain wants done becomes a task entity with predications about its required-skills, required-scope, required-witness-shape; FARS dispatch routes it to whichever agent can settle it.
  Today's session would have been ~30 task records, ~30 dispatches, ~30 witnesses.
  The substrate would actually be the substrate.
3. **Agent-runtime harnesses that are substrate-aware.** Claude Code, ChatGPT, the Android Claude app, etc., would receive *specific scoped tasks* via MCP tool calls rather than free-form prompts.
  Each task-completion produces a witness.
  The captain's chat client becomes a coordination surface, not an execution surface.

This friction is the substrate's own existence-validation gap: a substrate built around agential-self-generation is, today, generating its agential activity *outside itself*.
Everything done in this session is in a precise sense missing from the substrate's accounting — even though the artifacts are committed, the *who-did-what-when-under-what-authorization* trail is not.
The substrate sees the diff but not the agential structure that produced it.

Closing this is the road from "captain talks to a big model" to "polity dispatches work to its swarm via its substrate."
Until it closes, every other friction in this directory is downstream of this one.
