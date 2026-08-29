import type { Word, Arc } from "./types.mjs";
import type { CompiledBundle } from "./types.mjs";
/** A proposed arc with the source rule that licensed it. */
export interface Proposal {
    readonly arc: Arc;
    readonly rule: string;
}
/** Run all attachment rules and return all proposed arcs. */
export declare function relate(words: readonly Word[], bundle: CompiledBundle): readonly Proposal[];
//# sourceMappingURL=relating.d.mts.map