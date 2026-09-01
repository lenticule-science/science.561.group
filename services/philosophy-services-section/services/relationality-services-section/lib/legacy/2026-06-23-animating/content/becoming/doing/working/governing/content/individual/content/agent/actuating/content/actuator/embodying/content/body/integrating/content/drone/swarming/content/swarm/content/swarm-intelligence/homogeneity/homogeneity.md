---
type: concept
class: foundational
status: active
depends-on: []
see-also:
  - swarm-coordinated-system.md
  - local-rule-coordination.md
  - ../objects/swarm-population.md
references:
  - references/bonabeau-dorigo-theraulaz1999.md
  - references/camazine2001.md
---

# Homogeneity

Homogeneity is the structural condition that all agents in a swarm- coordinated system run the same local rule with the same parameters and are interchangeable in role.
Agent identity is meaningful only as an index into the population; it does not affect the global behavior.
Permuting agent identities leaves the global trajectory invariant.

Homogeneity is what permits the classical swarm-intelligence convergence theorems to be stated as theorems about *the algorithm* rather than theorems about *each agent's contribution*.
When all agents run the same rule, the analysis can describe population-level behavior in aggregate without tracking individual agent identities.

## The permutation-invariance test

A multi-agent system is homogeneous iff its global behavior is invariant under permutation of agent identities.
Concretely: relabel the agents, re-run the system from the same initial conditions, and observe whether the resulting trajectory is statistically the same.
If yes, the system is homogeneous; if no, it is not.

The orchestrated multi-agent systems of the [agents theory](../../agents/_index.md) routinely fail this test.
An orchestrator-workers topology with one orchestrator and three workers is not invariant under the permutation that puts a worker in the orchestrator role: the system would cease to function.
Role-typed agents are by construction non-homogeneous.

## Weakening the condition

The strict homogeneity condition (every agent runs literally the same rule with literally the same parameters) is weakened in some classical work without leaving the swarm-intelligence regime:

- **Parameterized populations**: each agent's rule depends on a per-agent parameter drawn from a common distribution.
  Used in some PSO variants where particle inertia is heterogeneous.
  Permits population- averaged analysis if the parameter distribution is fixed.
- **Role-graded swarms**: a small number of distinct roles, with most agents in each role.
  The biological analog: ant colonies have workers, soldiers, and a queen.
  Permutation invariance holds within each role class.
  The mathematical analysis becomes a multi-population mean-field problem rather than a single-population one.

Both weakenings preserve the structural property that no individual agent's identity is load-bearing.
What is incompatible with homogeneity is *agent-specific behavior conditioned on identity* — when the agent labeled "agent_3" behaves differently from the agent labeled "agent_4" in a way not derivable from environmental state or a shared role parameter.

## Why homogeneity matters

Homogeneity is what enables the *interchangeable-replication* fault- tolerance property classical swarm intelligence is famous for: an ant colony continues to function after the death of any individual ant because no individual ant was load-bearing.
This is structurally distinct from an orchestrated multi-agent LLM system, where the loss of the orchestrator agent collapses the entire coordination structure.

Homogeneity also bounds the *design surface* of a swarm-coordinated system: there is one local rule to design and validate.
An orchestrated system with N role-typed agents has N local rules to design and N(N-1)/2 pairs of inter-role interactions to validate.
The design effort scales with role count, not with population size.
Homogeneity is therefore a property that simplifies system construction in addition to enabling mathematical analysis.

## What violates homogeneity

- **Role-typed agents**: orchestrator-workers, planner-executor-verifier, any architecture where named roles do different things.
- **Agents with persistent identity**: agents that accumulate per-agent history that influences their future behavior beyond what is encapsulated in role parameters.
- **Agents with distinct system prompts**: the LLM-agent analog of role-typed agents.
  A "coder" LLM and a "reviewer" LLM are not homogeneous in this sense.
