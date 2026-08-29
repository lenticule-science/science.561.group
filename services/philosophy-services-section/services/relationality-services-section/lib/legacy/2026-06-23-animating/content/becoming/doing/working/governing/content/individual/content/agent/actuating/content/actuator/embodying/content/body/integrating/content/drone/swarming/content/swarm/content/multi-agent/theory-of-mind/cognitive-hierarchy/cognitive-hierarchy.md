---
type: concept
class: classical
status: active
depends-on:
  - theory-of-mind.md
see-also:
  - ../objects/belief-hierarchy.md
  - ../theorems/cognitive-hierarchy-bound.md
  - ../morphisms/recursive-reasoning.md
references:
  - references/camerer-ho-chong2004.md
---

# Cognitive hierarchy

The **cognitive hierarchy** (CH) framework formalizes *bounded* recursive reasoning: agents reason at level $k$, modeling other agents as reasoning at levels $0$ through $k - 1$.
It is the standard formal substitute for infinite-depth common-knowledge reasoning when agents are boundedly rational.

## The hierarchy

- **Level 0 (L0).** Plays randomly or follows some default heuristic, without modeling others.
- **Level 1 (L1).** Best-responds to L0 — assumes others are random.
- **Level 2 (L2).** Best-responds to L1 — assumes others assume others are random.
- **Level k (Lk).** Best-responds to a distribution over $L_0, \ldots, L_{k-1}$.

Each level requires the agent to *model* the lower-level reasoning of others.

## Two variants

- **Stahl-Wilson level-$k$ model** (1994).
  Agents at level $k$ believe *all* others are at level $k - 1$.
- **Camerer-Ho-Chong cognitive hierarchy** (2004).
  Agents at level $k$ believe others are distributed over levels $0, \ldots, k - 1$ according to a Poisson distribution.
  More empirically successful.

CHCH typically estimates the average level $\tau$ around $1.5$ in experimental data — most agents reason at L1 or L2.

## Empirical findings

- **Beauty contest game** (Keynes; Nagel 1995).
  Players pick a number 0-100; winner is closest to $2/3$ of average.
  Equilibrium = 0; experimental winners cluster around 22-33 (suggesting L1-L2 reasoning).
- **Two-thirds-of-average game.** Standard CH probe.
  Most participants reason at L1-L2, rarely deeper.
- **Cross-cultural and cross-population studies.** Mean cognitive level varies but is universally bounded (typically $\tau \in [1, 3]$).
- **Expert vs novice.** Experts in strategic reasoning reach higher levels than novices, but rarely beyond L4-L5.

## Why bounded

Reasons for bounded recursive reasoning:

- **Computational cost.** Each level multiplies computation.
- **Diminishing returns.** Higher levels rarely change predictions much in real games.
- **Common-knowledge limitations.** Even theoretically, true common knowledge is unattainable ([common-knowledge-impossibility](../theorems/common-knowledge-impossibility.md)).
- **Working memory constraints.** Holding beliefs about beliefs about beliefs strains memory.

## In multi-agent AI

CH frameworks apply when:

- **Predicting LLM agent reasoning.** What level of recursive reasoning do LLM agents implement when modeling other agents?
- **Multi-agent RL.** Opponent modeling in MARL often implicitly implements bounded-depth reasoning.
- **AI agents in human-AI interaction.** Modeling humans as bounded-rational reasoners (rather than perfectly rational) affects what AI should expect from them.
- **Recursive AI safety.** Iterative-debate-with-AI protocols implicitly assume bounded recursive reasoning.

## Limits

- **Heterogeneity of L0.** What "random" or "default" L0 looks like affects the entire hierarchy; choice is somewhat arbitrary.
- **Within-agent inconsistency.** Real agents may apply different levels in different situations; uniform level $k$ is an idealization.
- **Equilibrium relationship.** CH levels do not converge to Nash equilibrium even as $k \to \infty$ in general games; the framework is *behavioral*, not equilibrium-derived.

## Status

Foundational behavioral game theory framework.
Standard in experimental economics.
Adaptation to AI multi-agent analysis is active; the empirical level $\tau$ for LLM agents is partially studied (some evidence suggests LLMs reason at L1-L2 in standard games, similar to humans).
