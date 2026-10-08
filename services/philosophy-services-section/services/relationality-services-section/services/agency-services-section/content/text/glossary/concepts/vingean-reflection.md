---
type: concept
class: contemporary
status: active
depends-on:
  - embedded-agency.md
  - reflective-stability.md
see-also:
  - ../morphisms/reflection.md
  - ../theorems/reflective-stability-impossibility-loeb.md
references:
  - references/soares-fallenstein2015.md
title: Vingean reflection
description: Vingean reflection is the problem of reasoning about agents (or future selves) that are more capable than oneself — agents whose decisions one cannot predict because predicting them would require capabilities one lacks.
derives-from: agent
---

# Vingean reflection

**Vingean reflection** is the problem of reasoning about agents (or future selves) that are *more capable than oneself* — agents whose decisions one cannot predict because predicting them would require capabilities one lacks.
The name is from Vernor Vinge's observation that one cannot, by definition, write convincing fiction about superintelligent characters.

## The problem statement

Consider an agent $A$ contemplating delegation to, or trust in, a more capable successor $A'$.
Standard decision theory says $A$ should choose to delegate iff $A$ expects $A'$'s actions to be better, by $A$'s utility, than $A$'s own actions.

But computing $\mathbb{E}[u(A'\text{'s action})]$ requires predicting $A'$'s action, which by hypothesis $A$ cannot do (if $A$ could predict it, $A'$ would not be more capable than $A$ on that task).
So $A$ must form beliefs about $A'$'s actions *without* simulating them.

## What can be predicted

$A$ can have *abstract* knowledge about $A'$'s actions even without simulation:

- **Outcome predictions.** $A$ may know that $A'$ will produce a winning move in chess without knowing which move.
  The *abstract property* "winning" is predictable; the move is not.
- **Optimization-target predictions.** $A$ may know what $A'$ is optimizing for (its objective, value function), and predict that $A'$'s actions will tend to score high on that objective, without predicting any specific action.
- **Process predictions.** $A$ may know what algorithm $A'$ runs (e.g. "alpha-beta search to depth 30") and predict bounds on $A'$'s behavior from algorithmic properties.

These predictions are abstract enough not to require running $A'$.

## Why it matters

Vingean reflection is foundational to several important problems:

- **Robust delegation.** A principal that wants to delegate to a more capable AI agent needs to form rational beliefs about the agent's behavior without out-thinking it.
- **Successor agents.** A self-improving AI must reason about its post-modification successor, which is more capable than the current self.
  See [reflective-stability](reflective-stability.md).
- **Alignment under capability gaps.** The alignment problem partly reduces to: can humans formulate a vingean-reflection argument that a more-capable AI will pursue human-aligned goals?
  See [eliciting-latent-knowledge-hardness](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/evolving/alignment/theorems/eliciting-latent-knowledge-hardness.md).

## Partial frameworks

- **Predictive properties over algorithms** — characterizing what one can know about an algorithm by reading its source rather than running it.
- **Trustworthy cognition specifications** — formal specifications of "the agent reasons in such-and-such a way" that are both verifiable and sufficient for trust.
- **Garrabrant's logical induction** — gives calibrated beliefs over logical sentences including sentences about more-capable agents' behavior.

No general framework exists.
Vingean reflection is among the core open problems of the agent-foundations program.
