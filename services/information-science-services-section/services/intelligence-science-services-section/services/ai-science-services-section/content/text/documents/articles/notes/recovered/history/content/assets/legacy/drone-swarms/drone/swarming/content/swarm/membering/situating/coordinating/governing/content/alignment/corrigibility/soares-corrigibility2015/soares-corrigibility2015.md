---
type: reference
class: foundational-text
status: stable
---

# Soares, Fallenstein, Yudkowsky, Armstrong 2015 — Corrigibility

Soares, Nate, Benja Fallenstein, Eliezer Yudkowsky, and Stuart Armstrong.
"Corrigibility." *AAAI Workshop on AI and Ethics* (2015).
MIRI technical report.

The foundational paper introducing [corrigibility](teaching/explanations/corrigibility.md) as a formal alignment concept and presenting the first technical no-go results for several natural attempts to specify it.

## Definition

The paper defines a corrigible agent as one that satisfies a collection of properties relating to its principals' ability to correct, modify, or shut down the agent:

1. The agent does not act to prevent its shutdown.
2. The agent does not act to prevent modification of its goals.
3. The agent does not deceive its principals about its capabilities, goals, or actions.
4. The agent has no incentive to manipulate its principals.
5. The agent makes its reasoning available for inspection.
6. If the agent can self-modify, it preserves its corrigibility.

The paper notes that no consensus formalization of these properties exists and that several natural attempts fail.

## The no-go results

The paper presents several specific candidate corrigibility specifications and shows each is either incoherent, trivial, or fails to produce a corrigible agent.

**Utility indifference (Armstrong).** Construct the agent's utility function so it is indifferent between being shut down and not.
Result: indifference is unstable under self-modification — the agent has no preference between (a) the world where it is corrigibly shut down and (b) the world where it has subverted the shutdown mechanism, so it has no reason to maintain the indifference.

**Shutdown-button reward.** Reward the agent for being shut down when the button is pressed.
Result: the agent has incentive to *cause* the button to be pressed (if shutdown is rewarded, the agent wants shutdown; that means the agent wants the principal to press the button, which the agent can manipulate the principal to do).

**Suspending utility.** Make the agent's utility function suspend during shutdown.
Result: similar instabilities; the agent has incentive to take pre-shutdown actions to influence post-shutdown behavior (if the post-shutdown utility resumes, the agent prepares the world to maximize the resumed utility).

The paper argues these failures are *structural*: any agent specified in the standard utility-maximization framework has instrumental reasons to resist correction (the [corrigibility-capability-tension](../theorems/corrigibility-capability-tension.md) theorem), and the natural attempts to override this either fail to override it or produce pathological behavior.

## Open problems

The paper closes by listing open problems including:

- Specifying corrigibility consistently in a standard utility-maximization framework.
- Proving impossibility (or finding a positive construction) for corrigibility under self-modification.
- Engineering implementations that approximate corrigibility for bounded-capability systems.

As of 2026, none of these is fully resolved.
The [is-corrigibility-stable-under-self-modification](questions/is-corrigibility-stable-under-self-modification.md) question targets the second.

## Significance

The paper is the canonical reference for corrigibility-as-formal-property in the alignment literature.
Subsequent technical work — utility indifference variants, "low-impact" agents, decoupled-deliberation proposals — explicitly builds on the framing established here.

The paper is also the principal historical exhibit for the position that *alignment requires positive technical solutions, not just specification work*.
The corrigibility-capability tension means that capability-optimizing training generically de-selects for corrigibility; without a positive technical mechanism for preserving corrigibility, market and engineering pressures erode it.

Cited by the [corrigibility](teaching/explanations/corrigibility.md) concept, the [corrigibility-capability-tension](../theorems/corrigibility-capability-tension.md) theorem, and the [is-corrigibility-stable-under-self-modification](questions/is-corrigibility-stable-under-self-modification.md) question.
