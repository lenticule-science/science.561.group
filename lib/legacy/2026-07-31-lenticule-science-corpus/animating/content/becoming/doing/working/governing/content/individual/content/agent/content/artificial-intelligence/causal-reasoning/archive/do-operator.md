---
type: morphism
class: foundational
status: active
depends-on:
  - ../objects/structural-equation.md
  - ../objects/intervention-distribution.md
see-also:
  - teaching/explanations/intervention.md
  - teaching/explanations/do-calculus.md
references: []
---

# Do operator

The **do-operator** $\mathrm{do}(X = x)$ is the formal
operation of intervening on a structural causal model
to set variable $X$ to value $x$. It is the syntactic
device by which Pearl's framework expresses
intervention.

## Definition

In an SCM $M$, $\mathrm{do}(X = x)$ produces a modified
SCM $M_{\mathrm{do}(X = x)}$:

- Remove $X$'s structural equation.
- Replace with $X := x$.
- Leave all other equations unchanged.

The intervention distribution $P(V | \mathrm{do}(X =
x))$ is the joint distribution under the modified SCM.

## Graphical interpretation

In the causal graph $G$:

- $\mathrm{do}(X = x)$ corresponds to *graphical
  surgery*: remove all edges *into* $X$.
- The resulting graph $G_{\overline{X}}$ encodes the
  causal structure under intervention.
- Conditional independencies in $G_{\overline{X}}$
  govern identification of intervention distributions.

This graphical view is what powers do-calculus.

## What it captures

Do-operator captures the *modular* nature of causal
mechanisms:

- Intervention modifies one mechanism (X's equation).
- Other mechanisms are unaffected.
- Downstream effects propagate through unchanged
  mechanisms.

This modularity is the substantive content of "X is a
cause of Y": forcing X changes Y through the existing
causal mechanisms.

## Distinguishing from observation

$\mathrm{do}(X = x)$ vs $X = x$:

- $\mathrm{do}(X = x)$: actively set X by external
  manipulation.
- $X = x$: observe X happens to be x.

The two coincide when X has no incoming edges
(exogenous X) but generally differ otherwise.

## Variants

Beyond the basic hard intervention:

- **Stochastic intervention.** Set X according to a
  policy distribution rather than a fixed value.
- **Conditional intervention.** $\mathrm{do}(X = g(Z))$
  for some function of observed Z.
- **Soft intervention.** Modify X's equation rather
  than fix value.
- **Dynamic intervention.** Time-varying intervention
  policies.

Each generalizes the basic do-operator with
corresponding modifications to the modified SCM.

## What it enables

- **Intervention distributions.** Mathematically
  well-defined object for "what would happen if".
- **Do-calculus.** Inference rules for manipulating
  do-expressions.
- **Identification analysis.** Determining when
  intervention distributions are computable from
  observational data.
- **Counterfactual evaluation.** The Action step in
  the abduction-action-prediction procedure.

The do-operator is the *gateway* to formal causal
reasoning; without it, intervention is only
informally specified.

## Limits

- **Hard intervention idealization.** Real
  interventions are rarely hard sets to specific
  values; they're distributional, partial, or
  conditional.
- **Modular-mechanism assumption.** Assumes
  mechanisms are independently modifiable; sometimes
  questioned.
- **Variable-choice dependence.** What counts as
  "intervening on X" depends on what X is; finer-
  grained variable definitions yield different
  interventions.

## Status

Foundational morphism. Standard formal apparatus.
Necessary for formal causal-effect identification and
do-calculus reasoning.
