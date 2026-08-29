// holography/projecting/feed — the parameterizable "get this, witness it here" driver.
//
// A Feed is the only thing a caller writes: a name, a cellizer turning one
// observation into grain-of-change EAVT cells, and which attributes are
// functional. The two tiers — witness (append-only log) and state (current
// projection) — are then generic over any feed. This driver is the thin
// orchestration over the pure projection (./state) and the fs binding (./store):
// read → project → write.
import { projectContentDocuments } from "./content.mjs";
import { projectStateView } from "./state.mjs";
import { appendWitnesses, readWitnessLog, writeContentDocument, writeJsonAtomic } from "./store.mjs";
/** Witness one observation: append only the cells new since the last witness.
 *  Returns the count of genuinely new rows — this feed's per-witness growth. */
export function witnessObservation(store, feed, observation, at) {
    return appendWitnesses(store, feed.name, feed.cellize(observation, at));
}
/** Project the feed's current view and write it to the state tier. */
export function projectFeedState(store, feed) {
    const view = projectStateView(readWitnessLog(store, feed.name), new Set(feed.functional));
    writeJsonAtomic(store.stateDir, feed.name, view);
    return view;
}
/** Project the feed's bulk into the content tier: take the cut the projection
 *  accepts and write each accepted entity to its own term-addressed document
 *  (default: markdown with YAML frontmatter). Returns the paths written. By
 *  default the source is the read-model projected from the log; pass `opts.view`
 *  to project a settled record view instead. */
export function projectFeedContent(store, feed, opts = {}) {
    const view = opts.view ?? projectStateView(readWitnessLog(store, feed.name), new Set(feed.functional));
    const documents = projectContentDocuments(view, opts.projection);
    return Object.freeze(documents.map((document) => writeContentDocument(store, document)));
}
//# sourceMappingURL=feed.mjs.map