---
type: theorem
class: empirical
status: active
depends-on:
  - teaching/explanations/cognitive-hierarchy.md
see-also:
  - ../objects/belief-hierarchy.md
references:
  - references/camerer-ho-chong2004.md
---

# Cognitive hierarchy bound

**Statement (empirical).** In strategic-reasoning experiments, the average level of recursive reasoning $\tau$ exhibited by human participants is bounded — typically $\tau \in [1, 4]$, with most populations clustering near $\tau \approx 1.5$.
Reasoning at depth beyond $4$-$5$ is rare in any population.

## The empirical claim

Across many experimental games (beauty contests, two-thirds-of-average, p-beauty contests, dominance- solvable games):

- **Most participants** reason at L1 or L2 (best- responding to randomized opponents or to opponents who best-respond to random).
- **Some** reach L3-L4.
- **Very few** reach L5+.
- **Estimated $\tau$** (CHCH model parameter) is typically $1.5 \pm 0.5$ across experiments.

This is *empirical*, not derived.
The bound is contingent on cognitive constraints, computational costs, and pragmatic considerations.

## Why the bound exists

Several mutually reinforcing reasons:

- **Working memory limits.** Holding many levels of meta-belief strains memory.
- **Computational cost.** Each level multiplies reasoning cost.
- **Diminishing returns.** Higher levels rarely change predictions much.
- **Common-knowledge regress avoidance.** Beyond some depth, agents recognize the regress and stop.
- **Pragmatic stopping.** "Good enough" decisions reached before deep reasoning.

## Variation across populations

- **Experts** in strategic reasoning (game theorists, poker professionals) reach higher levels in their domains.
- **Children** start at lower levels, increase with age.
- **Cultural variation** exists but the *bound* is universal — even highly strategic populations rarely exceed L5.
- **Time pressure** reduces depth.
- **Stakes** can either increase depth (motivation) or decrease it (heuristic shortcuts under stress).

## Status as empirical bound

The bound is *consistent across experiments* and *robust to design variations*, but it is not a mathematical impossibility — deeper reasoning is in principle possible, just empirically rare.

## Implications for multi-agent AI

For LLM agents and other AI systems:

- **Predicting human strategic behavior.** AI interacting with humans should model human reasoning at L1-L3, not deeper.
- **AI agent reasoning depth.** Whether LLM agents reason at higher depth than humans is empirically partial; some evidence suggests LLMs reason at L1-L2 on standard games (similar to humans), with few reaching deeper.
- **Recursive AI safety.** Iterative debate and recursive oversight protocols should account for bounded recursive reasoning capacity in AI agents.
- **Strategic exploitation.** AI capable of deeper reasoning could systematically exploit shallower- reasoning agents.

## Empirical evidence in LLMs

Limited but growing:

- **LLMs in beauty contests.** Recent studies show LLMs produce numbers consistent with L1-L2 reasoning, similar to humans.
- **LLMs in iterated games.** LLM agents show learning dynamics consistent with bounded reasoning depth.
- **LLMs prompted to reason recursively.** Can produce L3-L4 reasoning on prompt, but often without consistent application.

The empirical landscape is preliminary; comprehensive LLM cognitive-hierarchy studies are early.

## Limits of the bound

- **Domain-dependent.** Bound varies across games and contexts.
- **Aggregate statistic.** Population $\tau$ aggregates individual variation; some individuals reason consistently deeper.
- **Not a hard ceiling.** Deeper reasoning is achievable with effort, training, and time; the bound is statistical.
- **AI may eventually exceed.** Future AI systems may reliably reason at depths well beyond human empirical bounds.

## Status

Well-established in behavioral game theory; CHCH model (Camerer-Ho-Chong 2004) is the standard reference.
The *magnitude* of the bound is robust; the *sources* are incompletely understood.
Application to AI agent behavior is active research.
