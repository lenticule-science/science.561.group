/**
 * Kernel reducers — settle, settled, compact, and replay-error.
 *
 * These ops record the kernel's own activity as events. Settlement
 * is recorded because it's expensive and replay can short-circuit
 * by consulting the stored outcome. Compaction is recorded so the
 * compaction history is itself auditable. Replay errors are emitted
 * to the meta channel so diagnostic events flow through the same
 * replay infrastructure as everything else.
 *
 * Ops:
 *
 *   settle    payload: { scope? }
 *             Run pam.infer over the working model. Emits a
 *             `kernel/settled` event (via context.emit) with the
 *             resulting inference state. If the replay engine is
 *             tracking a settled-outcome cache, this op is the one
 *             that triggers re-inference.
 *
 *   settled   payload: { iterations, derivedCount, contradictions, settledAt }
 *             The resulting state of a previous settle operation.
 *             On replay this is a no-op — the inference was recorded
 *             historically and the morphism kernel is deterministic,
 *             so applying the same sequence of reducers up to this
 *             point produces the same derived state. Its purpose is
 *             observability, not mutation.
 *
 *   compact   payload: { sourceChannel, firstEventId, lastEventId, replacementEvents }
 *             Marker event indicating that a range of events in the
 *             source channel has been replaced with a smaller set of
 *             equivalent events. On replay this is a no-op (the
 *             source channel has already been rewritten by the
 *             compact tool). The event is recorded so the compaction
 *             history is queryable.
 *
 *   compaction-performed
 *             Emitted to the kernel channel by the compact tool
 *             after a successful compaction. Same shape as `compact`.
 *             A distinct op name makes audit queries explicit.
 *
 *   replay-error (on the meta channel)
 *             Emitted by the replay engine when a reducer throws.
 *             No-op on subsequent replays — the error is historical
 *             record, not state.
 */

// pam.infer was the legacy fixpoint pass that ran every morphism
// declaration to convergence. Under the wavefront-based architecture,
// settlement is automatic on every assertion: pam.message and pam.assert
// run the wavefront procedure to fixpoint as part of insertion. The
// kernel/settle event is therefore a no-op at the working-model layer
// — its purpose is observability (the event is recorded so the history
// of explicit settle calls is queryable), not mutation. Per
// docs/architecture/principles.md principle 3, settlement is not a separate
// public operation; it's a consequence of message().

function settle(workingModel /*, event, context */) {
  return workingModel;
}

function settled(workingModel /*, event */) {
  // No-op: settled is observability. The derived state is already
  // materialized by the sequence of reducers preceding this event.
  return workingModel;
}

function compact(workingModel /*, event */) {
  // No-op: compact is a marker. Replacement events were written to
  // the channel file by the compact tool before this event was
  // emitted, so replay already sees the compacted stream.
  return workingModel;
}

function compactionPerformed(workingModel /*, event */) {
  return workingModel;
}

function replayError(workingModel /*, event */) {
  return workingModel;
}

// kernel/checkpoint events record that a content-addressed segment +
// manifest in `blobs/` represents the working-model state as of the
// payload's cutoffTimestamp. The reducer is a no-op at the working-
// model layer — the checkpoint is observability, the source of truth
// is still the events themselves. The bootstrap path consults
// kernel/checkpoint events directly (via model-checkpoint.js's
// findLatestValidCheckpoint) when deciding which checkpoint to load.
function checkpoint(workingModel /*, event */) {
  return workingModel;
}

export {
  settle,
  settled,
  compact,
  compactionPerformed,
  checkpoint,
  replayError,
};
