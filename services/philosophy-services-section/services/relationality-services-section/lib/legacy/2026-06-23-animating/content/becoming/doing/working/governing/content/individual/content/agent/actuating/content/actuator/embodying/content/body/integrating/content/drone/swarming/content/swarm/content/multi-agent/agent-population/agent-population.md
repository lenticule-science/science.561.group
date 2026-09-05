---
type: object
class: classical
status: active
depends-on: []
see-also:
  - teaching/explanations/multi-agent-system.md
  - joint-policy.md
references: []
---

# Agent population

An **agent population** is the set of agents constituting a multi-agent system, together with their associated capabilities, roles, types, and relationships.
The population is the *who* of the system — the set of participants whose interactions the multi-agent theory analyzes.

## Structure

A specified agent population names:

- **Identity.** Distinct agent identifiers (agents 1, 2, ..., n).
- **Capabilities.** What each agent can do (action spaces, observation capabilities, computational budgets).
- **Types.** Private information distinguishing agents (preferences, beliefs, expertise).
- **Roles.** Designed positions in the system (leader, follower, specialist, generalist).
- **Relationships.** Communication topology, trust relations, hierarchy.

Different theories foreground different aspects: mechanism design foregrounds types; orchestration foregrounds roles; distributed systems foregrounds topology.

## Homogeneous vs heterogeneous populations

- **Homogeneous.** All agents identical (same capabilities, same prompts, same model).
  Common in swarm-style systems and replication-based protocols.
- **Heterogeneous.** Agents differ in capabilities or roles.
  Common in orchestration (supervisor, workers, specialists) and mixed-motive games.

The distinction affects which theoretical results apply: many classical results assume homogeneity (or symmetry); heterogeneous populations require richer analysis.

## Static vs dynamic populations

- **Static.** Population fixed for the system's lifetime.
  Most classical analysis assumes this.
- **Dynamic.** Agents enter and leave; population evolves.
  Common in open systems, marketplaces, and long-running agent ecosystems.

Dynamic populations require additional protocols (entry admission, exit handling) and complicate consensus guarantees.

## Population size

Multi-agent system properties depend strongly on size:

- **Two-agent.** Game-theoretic two-player analysis (zero-sum, prisoner's dilemma).
- **Small group (3-10).** Classical mechanism design, small-team coordination.
- **Medium (10s-100s).** BFT protocols, specialized orchestrations.
- **Large (100s-millions).** Swarm intelligence, market dynamics, statistical population analysis.

Different size regimes invoke different theoretical machinery.

## In contemporary systems

For LLM-based multi-agent systems:

- Population is often *defined by prompts* (each prompt variant = a different "agent" persona).
- Population may be *one underlying model* with multiple conversation contexts; whether these are "different agents" is a definitional choice.
- Population may include *external tools* and *human participants* alongside LLM agents — heterogeneous in a strong sense.

The classical agent-population vocabulary applies imperfectly; new vocabulary is emerging.
