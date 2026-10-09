---
type: narrative
status: active
references:
  - ../references/pearl-causality2009.md
  - ../references/pearl-bookofwhy2018.md
title: The Pearl causality revolution
description: For most of the 20th century, statistics treated causality as suspect.
---

# The Pearl causality revolution

For most of the 20th century, statistics treated
causality as suspect. Pearson, founder of modern
statistics, declared causation a metaphysical notion
that science should replace with correlation. Working
statisticians took the methodological hint:
*correlation is what we measure; causation is what
we don't talk about*.

This left a gap. Practitioners *needed* causal claims
— for medicine, economics, public policy — but the
official tools didn't support them. The gap was
filled with informal practices: randomized trials
when possible, hand-waving about confounders when
not.

## Pearl's intervention

Beginning in the 1980s, Judea Pearl developed a
mathematical framework that put causality back on
formal footing:

- **Causal graphs.** DAGs whose edges are causal
  influences.
- **Structural causal models.** Equations with
  asymmetric assignment $:=$ encoding mechanisms.
- **The do-operator.** Formal notation for
  intervention, distinct from observation.
- **Do-calculus.** Inference rules for manipulating
  do-expressions, with proven completeness.

Together these gave causality the same formal
treatment statistics had given association: precise
mathematical objects, clear inference rules,
algorithmic decidability.

## What changed

Before Pearl:

- "Causality" was an informal notion; technical work
  used "association" and added causal interpretation
  outside the math.
- Identifiability was an open question for many
  problems.
- Different methodological camps (Fisher's
  experimentation, Rubin's potential outcomes,
  econometric IV) used different vocabularies.

After Pearl:

- Causal claims are formal objects.
- Identifiability is algorithmically decidable.
- Different traditions are translatable through SCMs.
- Pedagogy is unified through the causal hierarchy.

This is what justifies "revolution" — not new methods
but a *unified mathematical foundation*.

## The graphical move

The most influential technical contribution was the
*graphical* approach:

- Causal claims are encoded in a graph.
- Identifiability is a graph-theoretic property.
- D-separation translates structure to statistics.
- Surgery on graphs models intervention.

This made causal reasoning *visual* and *modular*.
Practitioners could draw their assumptions and check
identifiability mechanically.

## The ladder

Pearl's *causal hierarchy* — associational,
interventional, counterfactual — gave a clean
typology:

- Different questions live at different rungs.
- Different data answers different rungs.
- Climbing the ladder requires structure.

This typology now organizes how the field thinks
about causal claims and what's needed to answer them.

## The book of why

Pearl's 2018 popular book *The Book of Why* (with
Mackenzie) brought the revolution to a broader
audience. Its central argument: AI cannot achieve
human-like reasoning without climbing Pearl's ladder.
LLMs, on this view, are stuck at rung-1
(associational) and need explicit causal machinery to
do better.

This claim is contested (see
[can-llms-do-causal-reasoning](can-llms-do-causal-reasoning.md))
but it has framed the debate.

## What remains

Despite the revolution, gaps remain:

- **Discovery.** Inferring causal graphs from data
  is hard.
- **Real-world fit.** SCMs are idealizations; real
  systems are richer.
- **Integration with deep learning.** Active research
  but no settled approach.
- **Foundation models.** How LLMs do or don't reason
  causally is open.

The revolution gave us tools; using them well is
ongoing work.

## Lesson

The Pearl revolution shows what mathematical
formalization can do: it doesn't *solve* causal
inference (the substantive problems remain) but it
*organizes* the field, makes precise claims
checkable, and reveals where assumptions enter. AI
work that engages causal questions is now expected to
engage Pearl's framework, even when adapting it.
