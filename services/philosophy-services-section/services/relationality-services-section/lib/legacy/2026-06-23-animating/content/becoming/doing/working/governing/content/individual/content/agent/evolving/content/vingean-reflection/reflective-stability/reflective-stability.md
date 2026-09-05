---
type: concept
class: contemporary
status: active
depends-on:
  - embedded-agency.md
see-also:
  - vingean-reflection.md
  - ../morphisms/self-modification.md
  - ../theorems/reflective-stability-impossibility-loeb.md
references:
  - references/soares-fallenstein2015.md
---

# Reflective stability

**Reflective stability** is the property that an agent, on reflecting on its own decision procedure, does not want to modify it.
A reflectively stable agent's preferences over self-modifications coincide with no-modification.

## The basic intuition

If an agent contemplates a self-modification — changing its utility function, its decision procedure, its source code — it asks: *would I prefer the future-actions of the modified self over the future-actions of the unmodified self, by my current utility?* If the answer is "no" for every modification, the agent is reflectively stable.

This matters because [embedded-agency](embedded-agency.md) makes self-modification a real action available to real agents.
An agent that *would* modify itself toward divergent values, given the chance, is unstable: its current values do not predict its future behavior across self-modification opportunities.

## Two failure modes

An agent can fail reflective stability in two directions:

- **Wanting to weaken itself.** The agent prefers a future self that pursues its current values *less* effectively.
  This is the corrigibility-capability tension: an agent that allows itself to be shut down accepts a future self that satisfies its current values worse.
  See [corrigibility-capability-tension](../../alignment/theorems/corrigibility-capability-tension.md).

- **Wanting to amplify itself.** The agent prefers a future self that pursues its current values *more* effectively.
  This is the convergent instrumental drive toward self-improvement identified by Omohundro and discussed across the alignment literature.

## The Loebian obstacle

A precise difficulty: a sufficiently expressive agent cannot *prove* the soundness of its own future proofs.
By Loeb's theorem, if a formal system $T$ that includes Peano Arithmetic proves $\Box_T \phi \to \phi$ for some $\phi$, then $T$ proves $\phi$.
Specializing: if $T$ proves "if my future self proves $\phi$, then $\phi$" for arbitrary $\phi$, then $T$ proves arbitrary $\phi$, hence is inconsistent.

This obstructs naive schemes for trusting future self- modifications, including AI systems that build successor systems.
See [reflective-stability-impossibility-loeb](../theorems/reflective-stability-impossibility-loeb.md).

## Partial workarounds

The literature offers partial workarounds:

- **Tiling agents** (Yudkowsky-Herreshoff 2013) — agents that use bounded soundness schemata, trusting future selves that use *strictly weaker* logic than themselves.
  The hierarchy bottoms out.
- **Modal agents** (Barasz et al.) — agents that reason explicitly about what they and others provably do, and can cooperate via modal fixed-point arguments.
- **Logical induction** — calibrated probabilistic beliefs over logical sentences sidestep the problem by replacing proof with calibrated credence.

## Status

Reflective stability is conjectured to be necessary for *aligned* self-improving AI systems: an unstable agent's current alignment does not transfer to its post-modification successor.
The research is incomplete.
See [is-corrigibility-stable-under-self-modification](../../alignment/questions/is-corrigibility-stable-under-self-modification.md).
