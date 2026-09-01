import type { EAVTRecord } from "../../codecs/eavt.mjs";
import type { Witness } from "./cells.mjs";
import { type ContentProjection } from "./content.mjs";
import { type StateView } from "./state.mjs";
import { type WitnessStore } from "./store.mjs";
/** A feed: how to witness one observation, and which attributes are functional. */
export interface Feed<Observation> {
    readonly name: string;
    /** Turn one observation, witnessed at `at`, into EAVT cells. */
    readonly cellize: (observation: Observation, at: Witness) => readonly EAVTRecord[];
    /** Attributes holding one value at a time (latest witness wins on projection). */
    readonly functional: readonly string[];
}
/** Witness one observation: append only the cells new since the last witness.
 *  Returns the count of genuinely new rows — this feed's per-witness growth. */
export declare function witnessObservation<Observation>(store: WitnessStore, feed: Feed<Observation>, observation: Observation, at: Witness): {
    readonly appended: number;
};
/** Project the feed's current view and write it to the state tier. */
export declare function projectFeedState<Observation>(store: WitnessStore, feed: Feed<Observation>): StateView;
/** Project the feed's bulk into the content tier: take the cut the projection
 *  accepts and write each accepted entity to its own term-addressed document
 *  (default: markdown with YAML frontmatter). Returns the paths written. By
 *  default the source is the read-model projected from the log; pass `opts.view`
 *  to project a settled record view instead. */
export declare function projectFeedContent<Observation>(store: WitnessStore, feed: Feed<Observation>, opts?: {
    readonly projection?: ContentProjection;
    readonly view?: StateView;
}): readonly string[];
//# sourceMappingURL=feed.d.mts.map