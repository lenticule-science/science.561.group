/-
# Optimization is settling — the optimum IS the closure fixed point

The corpus's received-math node `optimization.md` (the math `_archive`) says:

> Optimization is finding the best option within constraints … the best you can do is
> find a point where no small change helps, which is a FIXED POINT of the optimization
> process. … requires: measure, constraint; PRODUCES: fixed-point.

This is the received-math *shadow* of optimization, and it already names our spine:
the corpus EXPLICITLY says optimization **produces a fixed point** — and the fixed
point it produces is exactly OUR settling / closure fixed point. So optimization is
not a new dynamics; it is the settling dynamics read under a measure-and-constraint
gloss. We make the corpus's claim a theorem.

The dictionary, derived against `SettlingOverValueCategory` (the universal `F_U` over
a value category `V`):

* a **measure** = a valuation into an ordered value `V` (reuse `ValueCategory`):
  *better = higher in the `V`-order* (`≤_V`). The order IS the measure comparison.
* **constraints** = the system / allowed set the operator acts within — exactly the
  carrier of the `ValueCategory`. Staying in `V` IS staying within constraints.
* an **improvement** operation = a **monotone, inflationary, idempotent** endo on `V`
  — *improving* means `x ≤_V improve x` (inflationary: an improving move never makes
  things worse), monotone (improvement respects the measure order), idempotent (the
  improvement saturates). That is **exactly** a `VClosure` — a value-category closure
  operator. The **optimum** is its fixed point, reached by `settle`.

So an `OptimizationProblem` is *literally* a `ValueCategory` (constraints + measure)
together with a `VClosure` (the improvement operator); its `optimum` is the hub's
`settle`. We then prove the two corpus identifications:

* **`optimum_is_fixed_point`** — the optimum IS a fixed point of the
  improvement operation: `improve (optimum p) = optimum p`. This is the corpus's
  "optimization PRODUCES a fixed-point" PROVEN, reusing `VClosure.settle_fixed`
  (= idempotence). And `LocallyOptimal (optimum p)` holds — at the optimum no small
  change helps (`improve x = x`).
* **`settling_is_optimization`** — a SETTLING *is* an optimization: the
  settled value is the OPTIMUM. It is **reachable** (`seed ≤_V settle seed`, by
  inflation — an improving move never retracts); **locally optimal** (a fixed point —
  `improve (settle seed) = settle seed`); and the **LEAST such above the seed** /
  the best reachable optimum (reuse `VClosure.settle_least`). Quiescence — the
  Eilenberg–Moore reading `settling_quiescent_is_algebra` — says *settled = fixed =
  no improving move remains*, exactly the corpus's "no small change helps". So
  settling and optimization are the same fixed-point-finding process, and the
  four-regime convergence dichotomy of settling classifies optimization convergence
  too (strict / Scott / transfinite-bounded / aperiodic descent).

A Lawvere-quantale `V = [0,∞]` metric reading is recorded as a remark and a concrete
abstract instance: with the measure read as a (reversed) distance, `improve` =
"relax toward shorter distance" and the optimum is the shortest-path / min fixed
point. We keep `V` abstract (NO reals): the instance is a `ValueCategory` carrying a
seed and a closure whose optimum is the settled / least value above the seed.
-/
import RelMath.SettlingOverValueCategory
import RelMath.SettlingMonotonicityQuiescence
import RelMath.ClosureOperatorFiber

namespace RelMath
namespace Optimization

open ValueSettling

/-! ## (A) The optimization problem — a measure, constraints, and an improvement operator

An `OptimizationProblem` is the corpus's *measure + constraint + improvement* triple,
derived against the settling hub: the `ValueCategory V` supplies the **measure** (the
`V`-order `≤_V`, *better = higher*) and the **constraints** (its carrier — the allowed
system the operator acts within); the `VClosure` is the **improvement** operator
(monotone + inflationary + idempotent — *improving never retracts, saturates*). No new
data: the problem IS the pair `(V, improve)`. -/

/-- An **optimization problem** (the corpus's *measure + constraint + improvement*):

* `V : ValueCategory` — the **measure** (its order `≤_V` is the *better-than*
  comparison, *better = higher*) and the **constraints** (its carrier is the allowed
  system the improvement acts within);
* `improve : VClosure V` — the **improvement** operation: monotone (respects the
  measure), inflationary (`x ≤_V improve x` — an improving move never makes things
  worse), idempotent (improvement saturates). Exactly a value-category closure.

The **optimum** is the fixed point this improvement reaches (`optimum := settle`).
No free data: this is literally a `ValueCategory` paired with a `VClosure`. -/
structure OptimizationProblem where
  /-- The measure-and-constraint value category: order `≤_V` is the measure, carrier
  is the constraint set. -/
  V : ValueCategory
  /-- The improvement operator — a monotone, inflationary, idempotent endo on `V`
  (a value-category closure). Its fixed point is the optimum. -/
  improve : VClosure V

namespace OptimizationProblem
variable (p : OptimizationProblem)

/-- The **optimum** of an optimization problem from a seed: the fixed point the
improvement operation reaches, `optimum seed = settle seed = improve seed`. This is
the corpus's *"best point — a fixed point of the optimization process"*, reusing the
hub's universal settling `F_U` over `V`. -/
def optimum (seed : p.V.carrier) : p.V.carrier := p.improve.settle seed

/-- **Locally optimal** at `x`: the improvement makes no move — `improve x = x`. This
is the corpus's *"a point where no small change helps"*: every improving step leaves
`x` fixed, so there is no better neighbour within the constraints. -/
def LocallyOptimal (x : p.V.carrier) : Prop := p.improve.op x = x

/-- **Local optimality is being a fixed point** of the improvement — definitional
unfolding (`LocallyOptimal x ↔ improve x = x`). The Eilenberg–Moore / quiescence
reading: *no improving move = fixed point = settled*. -/
theorem locallyOptimal_iff_fixed (x : p.V.carrier) :
    p.LocallyOptimal x ↔ p.improve.op x = x := Iff.rfl

/-- The optimum is **reachable** from the seed: `seed ≤_V optimum seed`, by the
improvement's inflationary law — an improving move never retracts the measure, so the
optimum is at least as good as the seed. -/
theorem seed_le_optimum (seed : p.V.carrier) : p.V.le seed (p.optimum seed) :=
  p.improve.infl seed

end OptimizationProblem

/-! ## (B) The optimum IS a fixed point of the optimization operator

The corpus says optimization PRODUCES a fixed point. We prove it: the optimum is a
fixed point of the improvement operation, and is locally optimal (no small change
helps). Reuses `VClosure.settle_fixed` (= the improvement's idempotence). -/

/-- **The optimum is a fixed point.** The corpus's *"optimization produces
a fixed-point"* PROVEN: for every optimization problem `p` and seed, the improvement
fixes the optimum, and the optimum is locally optimal:

* `improve (optimum seed) = optimum seed` — the optimum is a fixed point of the
  optimization operator (reusing `VClosure.settle_fixed` = idempotence);
* `LocallyOptimal (optimum seed)` — *no small change helps* at the optimum (the same
  fixed-point fact read as local optimality).

So the point the optimization process reaches is exactly a settling / closure fixed
point — the corpus's received-math shadow is our spine. -/
theorem optimum_is_fixed_point (p : OptimizationProblem) (seed : p.V.carrier) :
    p.improve.op (p.optimum seed) = p.optimum seed
    ∧ p.LocallyOptimal (p.optimum seed) :=
  ⟨p.improve.settle_fixed seed, p.improve.settle_fixed seed⟩

/-! ## (C) A settling IS an optimization

The converse identification: every settling over `V` is an optimization, and the
settled value is the OPTIMUM. Reachable (inflation), locally optimal (fixed point),
and the LEAST such above the seed / best reachable (`settle_least` + quiescence). So
settling and optimization are the same fixed-point-finding process — and the
four-regime dichotomy of settling classifies optimization convergence too. -/

/-- **Read a `V`-settling as an optimization problem.** A `VClosure T` over `V` *is*
an improvement operator: the value category supplies measure + constraints, `T`
supplies the (monotone, inflationary, idempotent) improvement. So every settling is
an optimization problem whose `optimum` is `T.settle`. -/
def ofSettling (V : ValueCategory) (T : VClosure V) : OptimizationProblem :=
  { V := V, improve := T }

/-- `ofSettling`'s optimum **is** the settling: `(ofSettling V T).optimum seed =
T.settle seed`. Settling and finding-the-optimum are the same evaluation. -/
theorem ofSettling_optimum (V : ValueCategory) (T : VClosure V) (seed : V.carrier) :
    (ofSettling V T).optimum seed = T.settle seed := rfl

/-- **A settling IS an optimization.** For any value category `V`, any
`V`-settling `T`, and any seed, the settled value `T.settle seed` is the OPTIMUM of
the optimization problem `ofSettling V T`:

* **reachable** — `seed ≤_V optimum`: an improving move never retracts (inflation);
* **locally optimal** — `improve (optimum) = optimum`: a fixed point, *no improving
  move remains* (the corpus's *"no small change helps"*, via `settle_fixed`);
* **least / best reachable** — every fixed point `x ≥_V seed` of the improvement lies
  `≥_V` the optimum (`settle_least`): the optimum is the LEAST optimum above the seed,
  i.e. the best the improving process actually reaches from `seed` without overshoot;
* and the optimum coincides with the settling (`ofSettling_optimum`).

So settling = optimization: the same fixed-point-finding process, with the optimum =
the settling = the closure fixed point. The settling four-regime convergence
dichotomy (`four_regime_v_independent`) therefore classifies optimization convergence
too (strict / Scott / transfinite-bounded / aperiodic descent to the optimum).sound`. -/
theorem settling_is_optimization (V : ValueCategory) (T : VClosure V) (seed : V.carrier) :
    (ofSettling V T).optimum seed = T.settle seed
    ∧ V.le seed ((ofSettling V T).optimum seed)
    ∧ (ofSettling V T).LocallyOptimal ((ofSettling V T).optimum seed)
    ∧ (∀ x, V.le seed x → T.op x = x →
        V.le ((ofSettling V T).optimum seed) x) :=
  ⟨rfl,
   (ofSettling V T).seed_le_optimum seed,
   T.settle_fixed seed,
   fun x hsx hfx => T.settle_least seed x hsx hfx⟩

/-! ## (D) The Lawvere-quantale `V = [0,∞]` metric reading (abstract, NO reals)

The corpus's metric/optimization reading: with the measure taken as a (reversed)
distance into the Lawvere quantale `V = [0,∞]`, `improve` = *"relax toward shorter
distance"* and the optimum is the shortest-path / min fixed point — the least value
the relaxation reaches above the seed. We keep `V` fully abstract (NO reals): the
remark is realized by any optimization problem, whose optimum is, by
`settling_is_optimization`, the LEAST optimum above the seed — exactly the min /
shortest-path fixed point character of the Lawvere-quantale reading. -/

/-- **The metric (Lawvere-quantale `[0,∞]`) reading, abstractly.**
For any optimization problem `p` read as a metric relaxation — measure = reversed
distance into `V = [0,∞]`, `improve` = "relax toward shorter distance" — the optimum
is the **min / shortest-path fixed point**: it is locally optimal (a fixed point of
the relaxation) and the LEAST optimum above the seed (every relaxation fixed point
`x ≥_V seed` lies above it). Stated for abstract `V` (NO reals): it is the
`settling_is_optimization` content specialized to the metric gloss. -/
theorem metric_optimum_is_min_fixed_point (p : OptimizationProblem) (seed : p.V.carrier) :
    p.LocallyOptimal (p.optimum seed)
    ∧ (∀ x, p.V.le seed x → p.improve.op x = x →
        p.V.le (p.optimum seed) x) :=
  ⟨p.improve.settle_fixed seed,
   fun x hsx hfx => p.improve.settle_least seed x hsx hfx⟩

end Optimization
end RelMath
