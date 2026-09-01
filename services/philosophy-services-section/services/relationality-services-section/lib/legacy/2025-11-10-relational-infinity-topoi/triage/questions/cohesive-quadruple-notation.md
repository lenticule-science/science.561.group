---
name: cohesive-quadruple-notation
type: question
class: notation-choice
status: open
explores: [cohesive-quadruple, ritm]
depends-on:
  - cohesive-quadruple
  - ritm
---

The three source drafts use three different notations for the cohesive structure:

- **Draft 1:** $\Pi^{\to} \dashv \Box_r \dashv \Diamond_l \dashv \nabla^{\leftarrow}$ (Lawvere–Schreiber four-functor).
- **Draft 2:** $\Box \dashv \Diamond$ (modal-only, treating the outer two as auxiliary).
- **Draft 3:** $\Sigma \dashv \blacktriangleright \dashv \Pi$ (three-functor, with $\blacktriangleright$ replacing the middle pair).

The synthesis adopts the four-functor Lawvere–Schreiber form as primary because the [relational-calculus pilot](../../../../../relational-calculus/triage/concepts/cohesive-chain.md) and the [Lawvere–Schreiber reference](../../../../../relational-calculus/triage/references/lawvere-schreiber.md) already use it.

## The substantive question

Is draft 3's three-functor cohesion an *equivalent* repackaging of the four-functor structure, or a *different* (weaker) axiomatization?

If equivalent: $\blacktriangleright$ should decompose canonically as $\Box_r \Diamond_l$ or as a related composite, and the three-functor adjoint chain should determine the missing fourth adjoint uniquely.

If weaker: there are three-functor cohesive structures that do not extend to four-functor ones, and draft 3's theorems may apply to a strictly larger class of $(\infty, 1)$-toposes than draft 1's.

## Resolution

Trace draft 3's axiomatization back to its source (likely Schreiber's intermediate-form cohesion in some lecture notes) and check whether the fourth adjoint is constructed from the three or assumed missing. Until done, this subtheory's theorems are stated in the four-functor form, and any draft-3 result that does not survive translation to four-functor form is recorded as conditional on this question.
