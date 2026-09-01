/**
 * settling/optimization — the optimum IS the settling fixed point.
 *
 * The corpus's received-math `optimization` node says optimization "produces a
 * FIXED POINT … a point where no small change helps", requiring a measure and a
 * constraint. That fixed point is OUR settling / closure fixed point: optimization
 * is the settling dynamics read under a measure-and-constraint gloss. Ported from
 * `lean/RelMath/Optimization.lean` over the value-category hub:
 *
 *   * a **measure** = the order `≤_V` of a {@link ValueCategory} (*better = higher*);
 *   * **constraints** = its carrier (the allowed system the operator acts within);
 *   * an **improvement** = a monotone, inflationary, idempotent endo on `V` — exactly
 *     a {@link VClosure}. The **optimum** is its fixed point, reached by `settle`.
 *
 * So an `OptimizationProblem` *is* a `ValueCategory` paired with a `VClosure`; its
 * `optimum` is the hub's `settleOverValue`. No free data — every law is a reuse of
 * the value-category settle/least-fixed-point judgments.
 */
import { settleOverValue, settleFixedPoint, settleLeast, } from "./value-category.mjs";
/** Construct an optimization problem from a value category and an improvement closure. */
export const optimizationProblem = (V, improve) => Object.freeze({ kind: "settling.optimizationProblem", V, improve });
/** Read a `V`-settling as an optimization problem — a `VClosure` *is* an improvement
 * operator. (Lean `ofSettling`.) */
export const ofSettling = (V, improve) => optimizationProblem(V, improve);
/** The **optimum** of a problem from a seed: the fixed point the improvement reaches,
 * `optimum seed = settle seed = improve seed`. */
export const optimum = (p, seed) => settleOverValue(p.improve, seed);
/** **Locally optimal** at `x`: the improvement makes no move (`improve x = x`) — the
 * corpus's *"no small change helps"*. */
export const locallyOptimal = (p, x) => p.V.eq(p.improve.op(x), x);
/** Whether the optimum is **reachable** from the seed (`seed ≤_V optimum`) — true when
 * the improvement is inflationary (an improving move never retracts). */
export const optimumReachable = (p, seed) => p.V.le(seed, optimum(p, seed));
/** **The optimum is a fixed point (HEADLINE).** The corpus's *"optimization produces a
 * fixed-point"*: `improve (optimum seed) = optimum seed`. Reuses `settleFixedPoint`
 * (the improvement's idempotence). */
export const optimumIsFixedPoint = (p, seed) => settleFixedPoint(p.V, p.improve, seed);
/** **A settling IS an optimization (HEADLINE).** For any value category `V`,
 * `V`-settling `improve`, and seed, the settled value is the OPTIMUM: reachable
 * (inflation), locally optimal (a fixed point — *no small change helps*), and the
 * LEAST such above the seed (`settleLeast`). So settling and optimization are the
 * same fixed-point-finding process, and the four-regime convergence dichotomy
 * classifies optimization convergence too. */
export function settlingIsOptimization(V, improve, seed) {
    const p = ofSettling(V, improve);
    return Object.freeze({
        kind: "settling.settlingIsOptimization:witness",
        optimum: optimum(p, seed),
        reachable: optimumReachable(p, seed),
        locallyOptimal: locallyOptimal(p, optimum(p, seed)),
        least: (bound) => settleLeast(V, improve, seed, bound),
    });
}
/** **The metric (Lawvere-quantale `[0,∞]`) reading.** With the measure read as a
 * reversed distance and `improve` as *"relax toward shorter distance"*, the optimum
 * is the min / shortest-path fixed point: locally optimal, and the least optimum
 * above the seed. The `settlingIsOptimization` content under the metric gloss. */
export const metricOptimumIsMinFixedPoint = (p, seed, bound) => settleLeast(p.V, p.improve, seed, bound);
//# sourceMappingURL=optimization.mjs.map