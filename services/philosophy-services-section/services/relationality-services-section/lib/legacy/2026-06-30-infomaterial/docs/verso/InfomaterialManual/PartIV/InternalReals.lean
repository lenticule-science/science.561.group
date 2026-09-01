import InfomaterialManual.DocSetup
import Infomaterial

open Verso.Genre Manual InlineLean
open Infomaterial.Real.Internal

/-!
A recovered-foundations chapter: the real numbers derived inside the chain as the
Scott-continuous settling completion of the rationals — dependency-free, no `Classical`.
Welds against `Infomaterial.Real.Internal`; `{docstring}` is kept to the headline objects and
the completeness theorem, everything else is the cheap `{name}` weld.
-/

#doc (Manual) "Internal reals: ℝ as the settling completion of ℚ" =>

# Internal Reals — ℝ as the Scott-Continuous Settling Completion of ℚ

_A recovered foundation, and the flagship: the continuum is not imported, it is the
value a rational-approximation flow settles to at stage ω._

The corpus's continuous-valued-settling node lets the value category range over the
genuine continuum — `ℝ`, `[0,∞]`, `[0,1]` — and names the Cauchy completion the *κ=ω
Scott-continuous regime*: ℝ is the settling that closes the rational-approximation
orbit at the first infinite stage, the directed join of its approximations. This
chapter derives the reals to that specification, in Lean core only — no Mathlib, no
`Classical` — which is the concrete refutation of "you cannot internally derive the
reals."

## 1. The rationals, in chain

{name Infomaterial.Real.Internal.Rat}`Rat` is built first as an ordered field fragment over
`Int`/`Nat` (a `PreRat` of numerator, positive denominator, quotiented by
cross-multiplication). It is the carrier the approximation orbit runs in.

## 2. The Bishop reals

A real is a regular Cauchy sequence of rationals carrying its own modulus of
convergence — constructive content, not a classical limit.

{docstring Infomaterial.Real.Internal.Real}

{name Infomaterial.Real.Internal.RReal}`RReal` is the quotient by coincidence of sequences.
On it the field and order operations are defined and their laws *proven* — `RReal` is
an abelian group under addition and a partial order:

```lean
example (a b : RReal) : a + b = b + a :=
  RReal.add_comm a b

example {a b : RReal}
    (h1 : a ≤ b) (h2 : b ≤ a) : a = b :=
  RReal.le_antisymm h1 h2
```

It is Archimedean — every real is bounded above by a natural
({name Infomaterial.Real.Internal.RReal.archimedean}`archimedean`) — which is what keeps the
order in contact with the rational scale.

## 3. Completeness

The decisive theorem: a regular Cauchy sequence of reals converges, with the limit
given *explicitly* by the diagonal sequence — no choice, no excluded middle.

{docstring Infomaterial.Real.Internal.RReal.real_completeness}

## 4. ℝ is the settling completion

Completeness is exactly the settling statement. The rational orbit of a real converges
to it, and Cauchy sequences converge — the two halves of "ℝ is the directed-join
closure of ℚ at stage ω":

{docstring Infomaterial.Real.Internal.RReal.reals_are_the_scott_continuous_settling_completion}

And the genuine reals close the abstract hub: they instantiate the value category that
`SettlingOverValueCategory` (and hence the abstract `[0,1]` of stochastic settling)
quantifies over, via {name Infomaterial.Real.Internal.RReal.realValueCategory}`realValueCategory`.

## Honest scope

The partial-order-with-seed that `ValueCategory` needs is proven in full. What is *not*
claimed: decidable trichotomy (it would need LPO) and arbitrary suprema / the full
complete-lattice structure (choice beyond the Cauchy-completeness proven here). The
corpus's `V` is morally a complete lattice; this chapter instances exactly the
choice-free part and is explicit that the rest is the standard classical extension. The
point stands: the reals, and their characterization as the ω-stage settling completion
of the rationals, are derived in-chain with no foundational import.
