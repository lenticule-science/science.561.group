---
type: concept
class: classical
status: active
depends-on: []
see-also:
  - cognitive-hierarchy.md
  - ../theorems/aumann-agreement.md
  - ../theorems/common-knowledge-impossibility.md
  - ../objects/belief-hierarchy.md
references:
  - references/aumann1976.md
---

# Common knowledge

A fact $p$ is **common knowledge** among a group of agents when:

- All agents know $p$.
- All agents know that all know $p$.
- All agents know that all know that all know $p$.
- ... ad infinitum.

The infinite tower of mutual knowledge is the technical core.
Common knowledge is *strictly stronger* than mutual knowledge (everyone knowing); it requires the full recursive structure.

## Where it matters

Many coordination outcomes require common knowledge:

- **Mutual cooperation.** Stable cooperation requires not just both agents wanting to cooperate but mutual knowledge of this.
- **Convention adherence.** Following a convention requires common knowledge that the convention is in force.
- **Deception detection.** Detecting deception often requires common knowledge of what would constitute honest behavior.
- **Strategic coordination.** Selecting among multiple equilibria often requires common knowledge to pin down the selected equilibrium.
- **Aumann's agreement** ([aumann-agreement](../theorems/aumann-agreement.md)).
  Bayesian agents with common priors and common knowledge of posteriors must agree.

## How it's established

In principle, common knowledge can be established by:

- **Public announcement.** "Everyone hear this:" — if the announcement is observed by all and observed-to- be-observed by all.
- **Shared salience.** Co-presence at a publicly visible event.
- **Trusted infrastructure.** Broadcasts via channels whose reliability is itself common knowledge.

The structure is delicate: any failure at any meta-level breaks common knowledge.

## Why it's hard

[Common-knowledge-impossibility](../theorems/common-knowledge-impossibility.md): true common knowledge cannot be established through finite protocols over networks where messages may be lost.
The classical *coordinated attack problem* (Halpern & Moses 1990) demonstrates: two generals trying to coordinate an attack via messengers who may be captured can never establish common knowledge of attack timing through any finite exchange.

This is structural, not engineering: no protocol cleverness escapes it.

## In practice: approximations

Real systems use *approximations*:

- **Practical common knowledge.** "Everyone knows we expect everyone to know..." even when strict common knowledge is impossible.
- **Bounded-depth reasoning.** Per [cognitive-hierarchy](cognitive-hierarchy.md), agents reason at finite depth; full common-knowledge reasoning isn't required.
- **Trust-based shortcuts.** Trusted institutions and norms substitute for explicit common-knowledge derivation.

These approximations work for most practical coordination but break down in adversarial or high- uncertainty settings.

## In multi-agent AI

Common knowledge matters when:

- **Coordinating LLM agents** that need to reach shared understanding before acting jointly.
- **Multi-agent debate.** Conclusions binding all participants require shared epistemic ground.
- **Distributed AI consensus.** Some consensus protocols implicitly assume common-knowledge-like structures.
- **AI deception analysis.** Detecting deception requires modeling what would be common knowledge in honest interaction.

## Variants

- **Shared knowledge** (mutual knowledge).
  Everyone knows; not necessarily known to be known.
  Weaker.
- **Distributed knowledge.** What's known if all agents pool their knowledge.
  Stronger than common knowledge in some sense (more known) but unavailable without pooling.
- **Common belief.** All believe, all believe all believe... weaker than common knowledge (beliefs not necessarily true).
- **$\epsilon$-common knowledge.** Common knowledge up to depth $\epsilon$; finite analog.

## Status

Foundational concept in epistemic logic, game theory, and distributed systems.
The impossibility of strict common knowledge in lossy networks is well-established; the practical management of common-knowledge-like structures in real multi-agent systems is ongoing.
