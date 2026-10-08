---
type: theorem
class: contemporary
status: empirical
depends-on:
  - ../objects/context-window.md
see-also:
  - teaching/explanations/context-as-memory.md
references: []
title: Context window limits
description: LLM in-context retrieval — the model's ability to attend to and use information from earlier in its context window — degrades systematically beyond a context-length threshold, in the form of position-dependent recall failures collectively…
---

# Context window limits

## Statement (empirical)

LLM in-context retrieval — the model's ability to attend to
and use information from earlier in its context window —
**degrades systematically** beyond a context-length
threshold, in the form of position-dependent recall failures
collectively called the "lost-in-the-middle" effect (Liu
et al. 2023):

- Items at the **start** of the context window are recalled
  reliably.
- Items at the **end** of the context are recalled reliably.
- Items in the **middle** of long contexts are recalled
  unreliably, with recall accuracy substantially below the
  start/end positions.

The effect is robust across model families, instruction
styles, and tasks. It is empirical (no proven lower bound on
recall as a function of position) but well-replicated.

## Empirical pattern

For a needle-in-haystack task (find a specific fact placed at
position $p$ in a context of length $n$):

- Recall is high (>95%) when $p$ is in the first $\sim 10\%$
  or last $\sim 10\%$ of the context.
- Recall dips to 60-80% for $p$ in the middle 80%, especially
  for $n$ approaching the model's claimed context limit.
- The dip deepens as $n$ approaches the context limit.

The shape is U-shaped over position, with a flat middle.

## Hypothesized causes

No single accepted explanation. Candidates:

- **Training data structure.** Most training documents are
  short; models don't see many examples of mid-context
  retrieval.
- **Positional encoding artifacts.** Rotary, ALiBi, and
  related positional schemes may favor recent and initial
  tokens.
- **Attention dilution.** With many tokens, attention mass
  spreads thin; the relevant token doesn't get enough
  weight unless particularly salient.
- **Instruction-following bias.** Models trained on system-
  prompt-then-query format learn to weight the start (system)
  and end (current query) heavily.

## Operational implication

Long context windows do not provide *uniform* in-context
retrieval. Architectures relying on long context to replace
external retrieval ("just put everything in the context")
exhibit degradation precisely on the items they hoped to
retrieve.

This is the substrate of the practical recommendation:
**use context for current state and reasoning; use external
retrieval for facts**. Long context complements but does
not replace [retrieval-augmented-generation](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/memory/archive/teaching/explanations/retrieval-augmented-generation.md).

## Bounds and improvements

Successive model releases improve mid-context recall but do
not eliminate the effect. Contemporary frontier models
($\sim 2024$-25) achieve near-uniform recall on synthetic
needle-in-haystack tasks for contexts up to several hundred
thousand tokens, but degrade on realistic multi-needle and
reasoning-over-context tasks.

The empirical bound moves; whether it can be eliminated
entirely with architectural changes (vs being a fundamental
attention-mechanism limit) is open research.

## Status

Empirical, well-replicated, no proven lower bound. The effect
is widely treated as a binding design constraint for long-
context agent architectures.
