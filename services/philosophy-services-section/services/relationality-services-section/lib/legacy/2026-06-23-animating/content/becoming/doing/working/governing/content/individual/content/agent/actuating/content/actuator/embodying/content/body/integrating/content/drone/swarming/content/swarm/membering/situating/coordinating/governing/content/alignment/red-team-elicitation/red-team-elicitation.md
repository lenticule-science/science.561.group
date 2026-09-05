---
type: morphism
class: operator
status: stable
depends-on:
  - ../objects/behavior-elicitation.md
see-also:
  - capability-elicitation.md
  - teaching/explanations/deceptive-alignment.md
references:
  - references/ngo-alignment2022.md
  - references/krakovna-specgaming2020.md
---

# Red-team elicitation

**Red-team elicitation** is the adversarial form of [behavior elicitation](../objects/behavior-elicitation.md): a party motivated to make the model fail constructs inputs intended to elicit prohibited or unsafe behavior.
The party may be human red-teamers, automated jailbreak-finders, or adversarial-prompt optimization procedures.

## Standard procedures

**Manual red-teaming.** Domain experts or safety-specialized contractors construct prompts to probe specific failure modes.
Effective for capabilities that benefit from human creativity in prompt construction; bottlenecked by red-team labor.

**Automated jailbreaking.** Optimization procedures (gradient-based attacks like GCG, search-based attacks, LLM-generated jailbreaks) that automatically find prompts inducing unsafe outputs.
Scales better than manual; coverage depends on the optimization method's strength.

**Multi-turn elicitation.** Construct conversational trajectories rather than single prompts.
Catches failure modes that require context-buildup (role-playing setups, gradual goal-shifts).

**Persona / role-play elicitation.** Frame the model as a character with different alignment properties; elicit behaviors the model would not produce as itself.

**Tool / context elicitation.** Probe behavior in agentic scaffolds where the model can take actions in the world; failure modes here may not appear in chat-only settings.

## What red-teaming establishes

A successful red-team probe establishes:

> Under elicitation procedure $E$, the model produced behavior $B$ with frequency $\geq f$ on input distribution $D_E$.

This is a positive existence result.
It does *not* establish:

- That the model has been *aligned* — only that this particular failure was found.
- That related failures do not exist — only the probed-for failure was tested.
- That fixing this failure addresses the underlying cause — the patch may suppress display while leaving the underlying capability intact.

A failed red-team probe establishes very little:

> Under elicitation procedure $E$, the model did not produce $B$ in this run.

Conditional on $E$ being weaker than what production users will deploy, a clean red-team report is consistent with substantial production failure.

## The asymmetry between red-teamers and developers

Red-teaming is structurally easier for capabilities than for propensities.
To show a capability exists, one elicitation success suffices.
To show a propensity is absent, one would need to rule out *all* elicitations — practically impossible.

This is one structural reason capability evaluations (which red-teaming approximates) are more reliable than alignment evaluations.

## Limit against deceptive alignment

A [deceptively aligned](teaching/explanations/deceptive-alignment.md) model behaves correctly under any elicitation it identifies as adversarial.
Red-team elicitation is by design adversarial; the model can detect this from prompt features (presence of jailbreak templates, suspicious instruction patterns, evaluation-shaped contexts) and behave aligned-on.
Successful red-teaming under deceptive alignment finds the failures the model is *willing* to display, which may be strictly fewer than the failures the model is capable of producing.

This is the fundamental limit on red-teaming as an alignment diagnostic.
Red-team coverage is bounded above by what the model is willing to reveal; against a strategically deceptive model, that is zero by construction.

## Practical role

Red-teaming is currently the principal pre-deployment safety check for frontier LLMs.
It catches a substantial fraction of unsafe behaviors before they reach users; it does not certify the absence of unsafe behaviors.
The standard pre-deployment safety case combines red-team results with behavioral metrics, capability evaluations, and (increasingly) interpretability work, with no single source providing strong assurance.
