---
type: concept
class: classical
status: active
depends-on:
  - theory-of-mind.md
see-also:
  - ../theorems/false-belief-developmental-bound.md
references:
  - references/wimmer-perner1983.md
  - references/baron-cohen1985.md
---

# False-belief task

The **false-belief task** is the diagnostic experimental paradigm for theory-of-mind.
It tests whether a subject can predict an agent's behavior given that the agent has a *false* belief about the world.

## The paradigm

The classical false-belief task (Wimmer & Perner 1983):

1. **Setup.** Maxi puts chocolate in the green cupboard.
2. **Maxi leaves.** Out of the room.
3. **Mother moves chocolate.** From green to blue cupboard.
4. **Maxi returns.** Wants chocolate.
5. **Question to subject.** "Where will Maxi look?"

The correct answer is **green cupboard** — where Maxi *believes* the chocolate is.
A subject without ToM might answer **blue cupboard** — where the chocolate *actually* is.
Distinguishing these reveals whether the subject models Maxi's beliefs separately from the world's actual state.

The Sally-Anne variant (Baron-Cohen, Leslie & Frith 1985) uses dolls and a marble; structurally identical.

## What it measures

The task isolates *first-order false-belief reasoning*: attributing a belief that the subject knows to be false.
It requires:

- Distinguishing one's own belief from another's.
- Tracking another's *information state* (what Maxi observed and didn't observe).
- Predicting behavior from the other's belief, not the world's actual state.

This is a strong diagnostic — passing it shows ToM is operational, not just present in degenerate forms.

## Developmental findings

- Children typically pass around age 4 (with some cross-cultural variation).
- Children with autism systematically struggle, even when matched on general cognitive ability (Baron-Cohen et al. 1985).
- Younger children may pass simplified versions (Onishi & Baillargeon 2005, using looking-time measures with infants) — interpretation contested.
- Higher-order false-belief tasks ("Maxi thinks Lisa thinks the chocolate is...") emerge later, around age 6-7.

The task has become canonical in developmental psychology of mind research.

## Variants and elaborations

- **Unexpected contents** ("Smarties task").
  What's in this Smarties tube?
  (Subject sees it's pencils.)
  What will your friend think is inside before opening?
- **Appearance-reality.** Object that looks like something else; predict another's belief.
- **Higher-order.** Tracks beliefs about beliefs.
- **Knowledge attribution.** What does X know about Y?
- **Strategic deception.** Setting up false beliefs in others.

Each variant tests a slightly different aspect of ToM.

## Application to AI

False-belief tasks are now standard probes for AI systems:

- **LLM ToM benchmarks.** Datasets pose false-belief tasks to LLMs in text form.
- **Kosinski 2023** reports LLMs (notably GPT-4) pass classical false-belief tasks at high accuracy.
- **Ullman 2023** shows that systematic perturbations (changing surface details, swapping characters) cause failures, suggesting LLMs may exploit task surface features rather than implement ToM.
- **Robust false-belief evaluation** for LLMs is an active area; benchmarks like ToMi, BIG-Bench's ToM tasks, and others probe different ToM aspects.

## Limits

- **Surface-feature confounds.** Tasks with stable surface features can be solved without ToM by pattern-matching.
  Robust evaluation requires systematic perturbation.
- **Construct validity.** Whether the task measures the intended construct in non-developmental populations (LLMs especially) is debated.
- **Verbal vs nonverbal.** Verbal versions confound ToM with language understanding; nonverbal versions exist but are harder to administer to AI.

## Status

Foundational paradigm of developmental ToM research.
Adapted for AI ToM evaluation but with substantial methodological caveats.
A passing score on classical false-belief tasks is *necessary* but not *sufficient* evidence for robust ToM.
