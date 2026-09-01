---
type: theorem
status: draft
depends-on: [cosmological-settling, cosmic-time-as-settling-bound]
---

# Arrow of time from knowledge monotonicity

**Statement.** In the [cosmological settling](../objects/cosmological-settling.md), the directionality of [cosmic time](../../../theories/evolution/terms/cosmic-time.md) is identified with the orientation of the [knowledge order](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) on the value bilattice.
Specifically: for every predicate $p$ and every cell $(s, p, o)$,

$$s \leq t \implies v_s(p)(s_0, o_0) \leq_k v_t(p)(s_0, o_0)$$

— evidence accumulates as cosmic time advances, never retracts.
The choice of "later" rather than "earlier" as the direction of $\leq_k$ is the choice of a time orientation on the [spacetime entity set](../objects/spacetime-entity-set.md), and a settling under the opposite orientation would have evidence accumulating in the reverse cosmic-time direction.

## Proof

By construction.
The cosmological settling is defined as a [predication settling](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md), and predication settlings are defined to satisfy [settling monotonicity](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md).
The identification of the settling-bound direction with cosmic time, made by [cosmic-time-as-settling-bound](../teaching/explanations/cosmic-time-as-settling-bound.md), then yields the stated implication directly. $\square$

## What this dissolves

The theorem dissolves one classical formulation of "the problem of the arrow of time": *why* does time have a direction in our universe?
In the predicated framing, this is not a separate question.
The cosmological settling is, by structural definition, a $\leq_k$-monotone family.
Time direction is the orientation of $\leq_k$.
The two are the same fact stated in two vocabularies.

## What this does not dissolve

The theorem does **not** dissolve the deeper question: *why does the universe's state-evolution take the form of a settling, rather than some non-monotone alternative?* That question is now sharper:

- It is a question about the *initial condition*: why does the universe start at the bottom of $\leq_k$ for most cells (the "low-entropy initial condition" of Penrose, Boltzmann, et al.)?
- It is a question about the *closure-rule system*: why are the laws of physics $\leq_k$-monotone — i.e., why do all interactions accumulate evidence rather than retract it?

Both questions remain open after the predicated reframing.
The reframing's contribution is to make the *separation* of these two questions visible: the ordinary "arrow of time" puzzle conflates the choice of orientation (a labeling matter) with the existence of a $\leq_k$-monotone dynamics (a structural matter).
Pulling them apart is half the work.

## Connection to thermodynamics

The Second Law of Thermodynamics — entropy increases over time — is the projection of the knowledge-order monotonicity onto a particular family of predicates: the macroscopic configurations of physical systems.
The "more determinate" content of a settling at later cosmic time is, on the macroscopic projection, the "more entropic" content of a thermodynamic system at later time.
The two are the same statement at different levels of coarse-graining.
Making this identification rigorous — showing that the entropy functional on the comoving-slice averaging of $v_t$ is monotone in $t$ — is the operational version of this theorem and is open.

## Status

Draft.
The structural statement is immediate from the definitions.
The thermodynamic reduction is open and is the first concrete bridge from this theorem back into mainstream physics.
