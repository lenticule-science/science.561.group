---
type: concept
class: practical
status: stable
depends-on:
  - planning-under-uncertainty.md
see-also:
  - ../objects/plan.md
  - ../../agents/concepts/agentic-system.md
references:
  - references/ghallab-nau-traverso2016.md
---

# Plan execution monitoring

**Plan execution monitoring** is the runtime activity of detecting when an executing plan deviates from its expected trajectory and deciding how to respond.
It is the bridge between planning (which produces a plan against a model) and acting (which executes the plan in an actual environment that may not match the model).

## Why monitoring is required

Classical planning assumes the model is correct.
Real environments violate this assumption: actions may fail, observations may be incorrect, the environment may change exogenously, the model may be incomplete.
A plan generated under model assumptions $M$ executed in environment $M'$ may diverge from expectation in three ways:

1. **Action failure**: the executed action did not produce the expected effect.
2. **State surprise**: the agent observes a state inconsistent with the planned trajectory.
3. **Goal change**: the principal updates the goal mid-execution.

Each requires a response.

## Standard responses

**Continue.** If the deviation is small and recoverable by subsequent plan steps, continue executing.
Cheapest response; appropriate when the deviation is within plan tolerance.

**Plan repair.** Make local modifications to the existing plan to accommodate the deviation, preserving as much of the original plan as possible.
Faster than full replanning; assumes the deviation is local.

**Replanning.** Discard the current plan and re-invoke the planner from the current state.
The most expensive response but the most robust; appropriate when the deviation is large or repair is infeasible.

**Escalation.** Hand control back to the principal (in human-in-the-loop settings) or to a higher-level planner.
Appropriate when the agent's planning capability is exhausted or the situation requires authorization.

The choice among these is itself a meta-level decision; production agentic systems typically use heuristics (continue if state is on plan trajectory; repair if state is one step off; replan if multiple steps off; escalate on safety-relevant deviations).

## The monitoring–planning loop

The execution-monitoring activity composes with the planner into a **monitor–plan–act loop** characteristic of deployed planning agents.

```
state ← initial
plan ← plan(state, goal)
loop:
    if state ⊨ goal: return success
    action ← next(plan)
    observation ← execute(action)
    state ← update(state, observation)
    if deviation(state, plan):
        plan ← respond(plan, deviation)
```

The `respond` step is the monitoring decision; its quality determines the overall robustness of the system.
Most production deployments treat `respond` as a substantial engineering problem: classifying deviations, choosing among continue/repair/replan/escalate, and managing the cost of each.

## Connection to agentic systems

The monitor–plan–act loop is structurally identical to the *agentic-system* characterization in the [agents theory](../../agents/concepts/agentic-system.md): an agent is a system that takes goal-directed action under partial information and updates its plan based on observations.
Plan execution monitoring is the planning-theory side of this loop; the agents theory describes the surrounding orchestration and accountability structure.

## Connection to LLM agents

Modern LLM agents (AutoGPT-style scaffolds, Voyager, agentic frameworks) implement the monitor–plan–act loop by repeatedly prompting the LLM with the current state, the original goal, and the plan history.
The LLM's response is interpreted as either a next action or a re-plan signal; the surrounding scaffold handles execution, observation collection, and state update.

The monitoring decision is implicit in the LLM's prompt-conditioned output rather than explicit.
This has the typical LLM-agent advantages (broad domain coverage, no manual deviation classifier) and disadvantages (no soundness guarantees about when the LLM chooses to replan vs continue; limited debuggability when the loop goes wrong).

The boundary between the planner and the monitor blurs in such systems: the LLM both plans and monitors, and the same forward pass that produces an action also (implicitly) decides whether to keep executing or revise the plan.
Whether this is a feature (unified reasoning) or a bug (no separation of concerns) is contested.
