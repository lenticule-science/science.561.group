import type { Entry, SpecializationEdge, DescentResult } from "./types.mjs";
/** Settle charges along specialization edges to a least fixed point.
 *
 * Algorithm:
 *  1. Load all entries into unary and binary charge maps.
 *  2. Project binary arcs to unary "has-<rel>" / "is-<rel>" predicates.
 *  3. Transitively close the specialization edges.
 *  4. Iterate: for each (source→target) edge and each subject, join
 *     charge[subject,source] into charge[subject,target] until stable.
 */
export declare function descend(entries: readonly Entry[], specialization?: readonly SpecializationEdge[]): DescentResult;
//# sourceMappingURL=descending.d.mts.map