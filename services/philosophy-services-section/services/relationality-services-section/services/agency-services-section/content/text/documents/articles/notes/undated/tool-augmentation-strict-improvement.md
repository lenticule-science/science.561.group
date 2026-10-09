---
type: theorem
class: informal
status: active
depends-on:
  - teaching/explanations/tool-use.md
see-also:
  - tool-use-expressivity.md
references:
  - references/mialon-augmented-llm-survey2023.md
title: Tool-augmentation strict improvement
description: Statement (informal).
---

# Tool-augmentation strict improvement

**Statement (informal).** Tool augmentation strictly expands the agent's effective action space.
Tasks unachievable by pure text generation become achievable with appropriate tools; the agent's effective capability set is strictly larger with tools than without.

## What it asserts

For any LLM agent with access to tools $T_1, \ldots, T_k$:

- The agent can do everything it could without tools (the tools are optional).
- The agent can additionally do everything tools enable.
- Therefore the with-tool capability set is a *strict superset* of the without-tool set, provided at least one tool enables a task that pure generation cannot.

The "strict" is trivially satisfied for any non-trivial tool: text generation alone cannot send email, query external databases at runtime, etc.

## Why it's worth stating

The result is obvious in one sense (more capabilities is more capabilities) but worth stating because:

- **It establishes tool-use as qualitative, not just quantitative.** Tools don't just make things faster; they enable things impossible without tools.
- **It justifies the engineering investment.** The capability gain is genuine.
- **It clarifies what evaluation must measure.** Tool-augmented agents need new benchmarks; pure- text benchmarks don't capture the gain.
- **It contextualizes risk discussions.** Capability gain implies risk-surface gain.

## Quantitative claims are harder

The qualitative claim is straightforward; quantitative claims require care:

- **How much** capability does tool augmentation add?
  Depends on tool set.
- **For which task classes** is the gain large vs small?
  Domain-dependent.
- **How does augmentation interact with model scale?** Empirically: weaker models gain more from tools; strong models gain less proportionally (because they can do more without tools).

Empirical work on these questions is ongoing.

## Risk implications

Strict capability improvement implies:

- **New action capacity.** Agent can do new things, including potentially harmful things.
- **New attack surface.** Tool integrations introduce vulnerabilities.
- **New verification burden.** Capabilities must be verified; behavior must be monitored.
- **New gating needs.** Per [side-effect-irreversibility-bound](side-effect-irreversibility-bound.md), high-stakes capabilities need gating.

The capability gain and risk gain travel together.

## Implications for design

- **Tools should be added intentionally.** Each tool expands action space; expansion should be reasoned about.
- **Tool selection has safety implications.** What's in the registry constrains agent behavior.
- **Capability evaluation matters.** Knowing what an agent *can* do is harder than knowing what it usually does.
- **Disablement.** Removing tools constrains capability; useful for safety-critical contexts.

## Connection to expressivity

[Tool-use-expressivity](tool-use-expressivity.md) extends this: with code-interpreter access, the capability gain becomes Turing-complete in principle.
Different tools yield different capability gains; code interpreter is a near-upper-bound.

## Limits

- **Informal.** No precise statement.
- **"Capability set" is fuzzy.** What counts as a distinct capability depends on individuation.
- **Capability ≠ reliable execution.** Having a capability doesn't mean exercising it reliably.
- **Tool interaction.** Some tools may *reduce* effective capability through confusion (too many tools degrade selection).

## Status

Standard observation in agentic-system literature.
Foundational to the case for investing in tools.
Implicit in essentially all evaluation methodology distinguishing tool-augmented from pure-text agents.
