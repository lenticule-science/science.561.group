---
type: question
status: open
see-also:
  - ../morphisms/bayesian-update.md
  - teaching/explanations/naturalized-induction.md
  - teaching/explanations/embedded-agency.md
references:
  - references/demski-garrabrant2019.md
---

# What replaces Bayesian updating for embedded agents?

## The question

Bayesian updating breaks down for agents that are physical subsystems of the environments they reason about ([embedded-agent-impossibility](../theorems/embedded-agent-impossibility.md)).
What replaces it?

The replacement must: - Handle observations whose generation involves the agent itself. - Permit hypotheses that include the agent as one possible structure. - Coexist with logical uncertainty (uncertainty over necessary truths). - Coexist with self-modification (the updating procedure must remain coherent across changes to the procedure). - Reduce to ordinary Bayesian updating in the Cartesian limit.

## Candidate replacements

- **Logical induction** (Garrabrant 2016).
  Calibrated belief over sentences via the trader-criterion.
  Handles logical uncertainty and self-reference; integration with decision theory non-trivial.
- **Reflective oracles** (Christiano et al. 2013).
  A probabilistic relaxation of self-prediction that admits consistent fixed-points; non-classically computable.
- **Updateless decision theory.** Refuses to update on observations the prior could have foreseen, sidestepping the question by routing decisions through the prior.
- **Cartesian frames** (Garrabrant 2020).
  A framework for specifying agent-environment boundaries that permits ambiguity; the "right" updating depends on the chosen frame.
- **Imprecise probability.** Use sets of priors instead of single priors; update each member of the set; aggregate by some rule.

None of these is a complete replacement for Bayesian updating.
Each handles some failure mode of strict Bayesianism but introduces its own restrictions.

## Why it matters

Almost every result in classical statistics, decision theory, and machine learning presupposes Bayesian (or likelihood-principle-respecting) updating.
Replacements propagate: results re-derive differently, sometimes invalid.
The alignment program that builds on Bayesian agents — including ELK, mesa-optimization analysis, and corrigibility arguments — is in this sense built on a foundation the embedded-agency program is in the process of replacing.
The replacement may preserve, modify, or invalidate the existing alignment results.

## Status

Open and central.
This is one of the four problems Demski- Garrabrant (2019) identify as core to the embedded-agency program.
No replacement has been adopted as canonical; partial frameworks coexist.
