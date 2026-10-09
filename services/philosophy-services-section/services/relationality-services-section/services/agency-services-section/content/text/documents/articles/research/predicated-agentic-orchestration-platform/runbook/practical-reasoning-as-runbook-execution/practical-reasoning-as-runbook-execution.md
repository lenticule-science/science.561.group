---
type: concept
class: agent
status: sketch
depends-on: [agent, runbook, dispatch, tick, rao-georgeff1995, bratman1987]
see-also: [intention-as-scope-bounded-commitment, belief-base-as-fiber-restriction]
title: Practical reasoning as runbook execution
description: "The platform's reformulation of the practical-reasoning loop in the BDI tradition (Rao–Georgeff (1995), Bratman (1987)): the classical BDI deliberate-then-execute cycle (read beliefs, consider options, commit to intentions, execute steps)…"
---

# Practical reasoning as runbook execution

The platform's reformulation of the *practical-reasoning loop* in the BDI tradition ([Rao–Georgeff (1995)](../../goal/rao-georgeff1995/rao-georgeff1995.md), [Bratman (1987)](../../goal/bratman1987/bratman1987.md)): the classical BDI deliberate-then-execute cycle (read beliefs, consider options, commit to intentions, execute steps) is structurally the platform's tick / dispatch / runbook-execution cycle, with the four BDI structures recovered as substrate predications.

The classical view: a BDI agent maintains a *belief base* (its representation of the world's current state), a *desire / goal set* (states it wants to bring about), and an *intention set* (goals it has committed to pursuing, paired with the partial plans it is executing).
At each reasoning cycle, the agent (1) updates its belief base from new percepts, (2) generates options (desires whose preconditions hold), (3) deliberates to select new intentions to adopt or drop, (4) executes one step of a current intention's plan.
The cycle is the load-bearing engineering shape of practical-reasoning agents.

The platform's reformulation: each of the four cycle steps is a substrate operator running over substrate predications.

- **Update belief base** ↔ the substrate's normal admission of new predications via boundary inputs and federation merge.
  The agent's "belief base" is its session's view of the predication-graph store, restricted to its [scope](../../scope/scope.md) per [belief-base-as-fiber-restriction](../../memory/belief-base-as-fiber-restriction/belief-base-as-fiber-restriction.md).
  Update is the substrate's normal settlement of newly-admitted content.
- **Generate options** ↔ the platform's [dispatch](dispatch.md) operator's eligible-set computation: the candidate skill-and-runbook pairs whose preconditions match the agent's current scope state.
- **Deliberate and select intention** ↔ dispatch's match-strength ranking and the runbook-selection step.
  The selected runbook becomes a [scope-bounded commitment](../../goal/intention-as-scope-bounded-commitment/intention-as-scope-bounded-commitment.md) on the agent's session — an intention in Bratman's sense.
- **Execute one step of current intention** ↔ a [tick](tick.md) on the agent advancing one [skill-invocation](../../skill/skill-invocation/skill-invocation.md) in the runbook in progress.
  The runbook's structure (sequence, branching, bound state) supplies the partial-plan structure Bratman analyzed.

The cycle is substrate-resident: there is no separate agent-process loop running the BDI machinery.
The [heartbeat](heartbeat.md) scheduler ticks each agent through one cycle iteration per heartbeat; dispatch reads substrate state; runbook execution mutates substrate state; the next heartbeat finds the substrate updated and runs dispatch against the new state.
The classical BDI architecture's reasoning loop becomes the substrate's normal operator schedule.

Three engineering consequences:

- **Practical reasoning composes with federation.** A federated substrate gives the agent a federation-view of its belief base — predications from multiple substrates merged through the substrate's value-domain join.
  The BDI cycle runs identically over federated state; the agent's reasoning is substrate-blind to whether predications come from local admission or federation.
- **Practical reasoning composes with governance.** The platform's [governance](governance.md) and [authorization](../../governance/authorization/authorization.md) checks are part of dispatch; an intention that would violate substrate-recorded governance is filtered out of the eligible set at dispatch time, before adoption.
  Bratman's *consistency* norm on intentions is enforced by the substrate's authorization fiber rather than by separately-engineered consistency-maintenance procedures.
- **Practical reasoning is auditable by replay.** Each cycle iteration produces witnesses (a dispatch witness, a skill-invocation witness, a runbook-step witness).
  Replay reconstructs the agent's deliberation history; an auditor reading the witness chain sees exactly why each intention was adopted, which beliefs were in scope at the time, and which runbook step was chosen.

The concept is *sketch* status: it names the relationship between the BDI practical-reasoning tradition and the platform's tick / dispatch / runbook discipline so the [upstream-classical-mas](../../upstream-classical-mas/upstream-classical-mas.md) narrative has an atomized referent.
A theorem-level statement — that the platform's tick / dispatch / runbook cycle on a session with `goal` and `intention` predications is *bisimilar* to a BDI agent's reasoning loop on the corresponding belief, desire, and intention sets — is left for follow-up work.
