import type { Arc, FoldPath, FoldTower } from "./types.mjs";
export interface FoldResult {
    readonly paths: readonly FoldPath[];
    readonly tower: FoldTower;
}
/** Fold arcs to their transitive closure (head-of-head path composition).
 * Returns the derived multi-step paths and statistics about the fold tower. */
export declare function fold(arcs: readonly Arc[], opts?: {
    maxDepth?: number;
}): FoldResult;
//# sourceMappingURL=folding.d.mts.map