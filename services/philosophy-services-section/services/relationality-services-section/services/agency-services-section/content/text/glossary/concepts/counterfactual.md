---
type: concept
class: foundational
status: active
depends-on:
  - causal-reasoning.md
  - intervention.md
see-also:
  - ../objects/counterfactual-world.md
  - ../morphisms/counterfactual-inference.md
references:
  - references/pearl-causality2009.md
title: Counterfactual
description: "A counterfactual is a hypothetical: \"given that I observed X = x and Y = y, what would Y have been if X had been x' instead?\" The third rung of Pearl's causal hierarchy and the strongest form of causal claim."
---

# Counterfactual

A **counterfactual** is a hypothetical: "given that I
observed X = x and Y = y, what would Y have been if X
had been x' instead?" The third rung of Pearl's causal
hierarchy and the strongest form of causal claim.

## The structure

A counterfactual involves:

- **Observed evidence.** What actually happened
  ($X = x, Y = y$).
- **Hypothetical antecedent.** What we change
  ($X = x'$).
- **Hypothetical consequent.** What we ask about
  ($Y_{X = x'}$, the value Y would have taken).

The notation $Y_{X = x'}$ denotes "Y under
counterfactual intervention X = x'."

## Distinction from intervention

Compare:

- **Interventional.** "If I set X to x', what is Y?"
  Asks about a *future* hypothetical.
- **Counterfactual.** "Given that I saw X = x and Y =
  y, what would Y have been if X had been x'?" Asks
  about a *past-conditional* hypothetical.

The counterfactual conditions on observed evidence and
asks what would have happened *for the same individual
unit*. This requires knowing or inferring the
*specific noise realization* for that unit.

## The three-step procedure

Counterfactual inference (Pearl) proceeds:

1. **Abduction.** From observed evidence
   $(X = x, Y = y, \ldots)$, infer the noise variables
   $U$ (the "individual factors" specific to this
   case).
2. **Action.** Modify the structural model: replace
   $X$'s equation with $X := x'$.
3. **Prediction.** Compute $Y$ in the modified model
   given the inferred $U$.

This produces the counterfactual outcome for the
specific evidence-conditioned case.

## Why counterfactuals are stronger than interventions

Interventional questions ask about *populations* under
intervention; counterfactual questions ask about
*specific units* given their observed history.

- "Drug effect on the population": interventional.
- "What would have happened to this patient who
  recovered without the drug, had they taken the
  drug?": counterfactual.

The counterfactual carries more information because it
conditions on observed evidence about the specific unit.

## Identifiability

Counterfactuals are *generally less identifiable* than
interventions:

- **Effect of treatment on the treated.** Sometimes
  identifiable from observational data under
  conditions.
- **Probability of necessity / sufficiency.**
  Counterfactual quantities; identifiable only under
  strong assumptions.
- **Individual counterfactuals.** Generally not
  identifiable without strong assumptions about noise
  distribution.

This is part of why counterfactuals form the highest
rung — they require more structural assumptions.

## Why they matter

- **Explanation.** "What caused this outcome?" is
  often a counterfactual: "would it have happened
  without X?"
- **Attribution.** Legal and ethical attribution
  often counterfactual.
- **Fairness.** "Would the decision have been the
  same if the protected attribute had been
  different?" — counterfactual fairness.
- **Diagnosis.** "What was different about this
  case?" — counterfactual reasoning.

Many practical questions are counterfactual even when
people don't notice.

## In contemporary AI

- **Counterfactual fairness** (Kusner et al. 2017
  and follow-ups). Fairness defined via
  counterfactual claims.
- **Counterfactual explanations.** XAI methods
  producing "what would have to change for the
  decision to flip."
- **Counterfactual data augmentation.** Generating
  hypothetical examples for training.
- **Counterfactual RL.** Reasoning about what would
  have happened under alternative policies.

## Limits

- **Identifiability.** Stronger assumptions needed
  than for interventional questions.
- **Distributional assumptions.** Counterfactual
  inference requires distributional assumptions about
  noise.
- **Untestable.** Counterfactuals are inherently
  unobservable; cannot be checked against data
  directly.
- **Multiple worlds.** Some philosophers question the
  meaningfulness of counterfactual claims.

## Status

Foundational concept; well-developed theoretical
treatment. potential integration with fairness, XAI, and
RL. Inherently more contested than interventional
reasoning due to identifiability and metaphysical
issues.
