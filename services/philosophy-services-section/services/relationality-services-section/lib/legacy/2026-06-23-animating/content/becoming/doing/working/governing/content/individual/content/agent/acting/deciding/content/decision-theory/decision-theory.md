---
type: concept
class: classical
status: active
depends-on: []
see-also:
  - ../objects/decision-problem.md
  - ../objects/utility-function.md
  - ../theorems/vnm-utility-theorem.md
references:
  - references/vnm1944.md
  - references/savage1954.md
  - references/jeffrey1965.md
---

# Decision theory

**Decision theory** is the formal study of rational choice under uncertainty.
It takes as input a decision-maker's preferences over outcomes and beliefs about which outcomes follow from which acts, and asks: what does it mean to choose well?

## The classical answer

The classical normative answer, due to von Neumann-Morgenstern (1944) and Savage (1954), is **expected-utility maximization**.
Given a probability distribution $P$ over states of the world and a utility function $u$ over outcomes, the rational act $a^*$ is

$$ a^* = \arg\max_a \mathbb{E}_{s \sim P}[u(o(a, s))] $$

where $o(a, s)$ is the outcome of taking act $a$ when the state is $s$.
The [vnm-utility-theorem](../theorems/vnm-utility-theorem.md) shows that any preference relation satisfying four axioms (completeness, transitivity, continuity, independence) admits a representation in this form, and conversely any expected-utility maximizer satisfies the axioms.

## Three classical formulations

The classical literature gives three closely related but distinct formulations:

- **Von Neumann-Morgenstern (1944)** takes preferences over *lotteries* (probability distributions over outcomes) as primitive.
  Probabilities are objective.
- **Savage (1954)** takes preferences over *acts* (functions from states to outcomes) as primitive.
  Probabilities are derived from preferences ("subjective expected utility").
- **Jeffrey (1965)** takes preferences over *propositions* as primitive, using conditional probabilities for evidential inference.
  This becomes the basis for Evidential Decision Theory.

The three frameworks agree on standard decision problems and diverge on Newcomblike problems (see [cdt-edt-divergence-newcomb](../theorems/cdt-edt-divergence-newcomb.md)).

## Where it breaks

The classical theory is well-defined when (a) the agent is external to the world being decided about, (b) probabilities and utilities are well-defined, and (c) the act space is finite.
It runs into trouble in three regimes:

- **Newcomblike scenarios**, where the act and the state are correlated through a predictor or a copy (see [embedded-agency](embedded-agency.md)).
- **Logical uncertainty**, where the agent is uncertain about necessary truths (the trillionth digit of $\pi$).
  Bayesian conditioning collapses on logically equivalent propositions but the agent does not know they are equivalent.
- **Computational limits**, where computing the expected utility exhaustively is infeasible.
  See [bounded-rationality](bounded-rationality.md).

These failures motivate the contemporary [embedded-agency](embedded-agency.md) program.

## Where it appears

Decision theory provides the formal substrate for:

- The reward maximization formulation of [reinforcement-learning](../../reinforcement-learning/_index.md).
- The base-objective specification studied by [alignment](../../alignment/_index.md).
- The instrumental-rationality assumptions in mesa-optimization arguments.
