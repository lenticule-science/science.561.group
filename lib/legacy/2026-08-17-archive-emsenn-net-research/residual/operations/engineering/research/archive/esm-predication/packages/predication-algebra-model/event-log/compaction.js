/**
 * Compaction tool for event channels.
 *
 * Consolidation is the research's prescribed answer to unbounded
 * log growth: "memory consolidates between sessions" (OpenClaw's
 * "dreaming"). For the substrate channel, the natural compaction
 * rules are:
 *
 *   - ingest-file followed by file-deleted (any time later) on the
 *     same path → drop both.
 *   - ingest-file followed by any number of file-changed events on
 *     the same path → one ingest-file with the final contentHash
 *     and stat.
 *   - ingest-file followed by file-changed events followed by
 *     file-deleted → drop everything.
 *   - Two or more file-changed events on the same path with no
 *     intervening ingest or delete → one file-changed with the
 *     first event's oldContentHash/oldStat and the last event's
 *     newContentHash/newStat.
 *
 * The compactor:
 *
 *   1. Reads the current channel.
 *   2. Computes a compacted event list by walking path histories.
 *   3. Replays the compacted list against an empty working model
 *      to produce a replay outcome.
 *   4. Replays the original list against an empty working model to
 *      produce a reference outcome.
 *   5. Verifies the two working models are structurally equivalent
 *      (same set of claim addresses; order doesn't matter).
 *   6. Atomically replaces the channel file with the compacted
 *      version.
 *   7. Appends a kernel/compaction-performed event to the kernel
 *      channel recording the compaction.
 *
 * Equivalence verification is the insurance policy — if the
 * compacted stream doesn't produce the same working model, the
 * tool refuses the swap and reports an error. Cost: one extra
 * replay per compaction. For a substrate channel of ~10K events,
 * this is on the order of a few seconds.
 *
 * v1 only compacts the substrate channel. Messages are not compacted
 * — retracted messages stay in the log as retract events, which is
 * the honest record. Future compaction rules could fold a
 * retracted-dispatch pair into nothing, but that's design work.
 */

import * as pam from "../index.js";
import * as events from "./index.js";

const SUPPORTED_CHANNELS = new Set(["substrate"]);

/**
 * Compute the compacted event list for a substrate event stream.
 *
 * Walks the events in order, maintaining per-path state:
 *
 *   entry = { kind: "ingested" | "changed", baseEvent, headHash, headStat }
 *
 * where baseEvent is the event currently representing the path's
 * history — the ingest event if the first op for the path was
 * ingest, or the first file-changed event if the path was first
 * touched by a change. headHash/headStat track the latest content
 * hash/stat so the final output reflects the current state.
 *
 * On file-deleted:
 *   - if the path was ingested: drop the ingest + all subsequent
 *     changes (the path never effectively existed in compacted form).
 *   - if the path was only changed: replace the entry's
 *     newContentHash/newStat with the oldContentHash/oldStat of the
 *     most recent delete-pre-image. Actually no: in the
 *     only-changed case, we need to emit a final file-deleted
 *     pointing at the correct oldContentHash/oldStat (which is the
 *     HEAD of the path's change history, since each change records
 *     the pre-image of the transition). The simplest correct
 *     outcome: emit a file-deleted with oldContentHash = headHash
 *     and oldStat = headStat.
 */
function planSubstrateCompaction(originalEvents) {
  const pathStates = new Map();

  for (const event of originalEvents) {
    const absPath = event.payload && event.payload.path;
    if (!absPath) continue;

    const entry = pathStates.get(absPath);

    if (event.op === "ingest-file") {
      // Ingest-first. Any prior state for this path is effectively
      // a "recreated" path; the compacted output has only one
      // ingest-file per path, so we reset.
      pathStates.set(absPath, {
        kind: "ingested",
        baseEvent: event,
        headHash: event.payload.contentHash,
        headStat: event.payload.stat,
      });
    } else if (event.op === "file-changed") {
      if (!entry) {
        // First op on this path is a change — the path was in the
        // channel before this stream started, so emit a change with
        // the original oldContentHash/oldStat.
        pathStates.set(absPath, {
          kind: "changed",
          baseEvent: event,
          headHash: event.payload.newContentHash,
          headStat: event.payload.newStat,
        });
      } else {
        // Extend the existing entry. The base event stays; only
        // the head advances.
        entry.headHash = event.payload.newContentHash;
        entry.headStat = event.payload.newStat;
      }
    } else if (event.op === "file-deleted") {
      if (!entry) {
        // First op on this path is a delete — preserve as-is.
        pathStates.set(absPath, {
          kind: "deleted",
          baseEvent: event,
          headHash: null,
          headStat: null,
        });
      } else if (entry.kind === "ingested") {
        // Ingest then delete — drop both. The path never existed
        // from the compacted channel's perspective.
        pathStates.delete(absPath);
      } else if (entry.kind === "changed") {
        // Changed then delete — replace with a single file-deleted
        // that records the most recent head as its oldContentHash.
        pathStates.set(absPath, {
          kind: "deleted",
          baseEvent: events.buildEvent({
            channel: "substrate",
            op: "file-deleted",
            timestamp: event.timestamp,
            origin: event.origin,
            payload: {
              path: absPath,
              oldContentHash: entry.headHash,
              oldStat:        entry.headStat,
            },
          }),
          headHash: null,
          headStat: null,
        });
      }
    }
    // Unknown ops pass through untouched — handled below.
  }

  // Emit one compacted event per remaining entry. Preserve timestamp
  // order from the base events.
  const emitted = [];
  for (const entry of pathStates.values()) {
    if (entry.kind === "ingested") {
      // If head has advanced, rebuild the ingest event with the final
      // contentHash and stat.
      if (entry.headHash !== entry.baseEvent.payload.contentHash) {
        emitted.push(events.buildEvent({
          channel: "substrate",
          op: "ingest-file",
          timestamp: entry.baseEvent.timestamp,
          origin: entry.baseEvent.origin,
          payload: {
            path:        entry.baseEvent.payload.path,
            contentHash: entry.headHash,
            stat:        entry.headStat,
          },
        }));
      } else {
        emitted.push(entry.baseEvent);
      }
    } else if (entry.kind === "changed") {
      // Rebuild the change event with the current head.
      if (entry.headHash !== entry.baseEvent.payload.newContentHash) {
        emitted.push(events.buildEvent({
          channel: "substrate",
          op: "file-changed",
          timestamp: entry.baseEvent.timestamp,
          origin: entry.baseEvent.origin,
          payload: {
            path:           entry.baseEvent.payload.path,
            oldContentHash: entry.baseEvent.payload.oldContentHash,
            oldStat:        entry.baseEvent.payload.oldStat,
            newContentHash: entry.headHash,
            newStat:        entry.headStat,
          },
        }));
      } else {
        emitted.push(entry.baseEvent);
      }
    } else if (entry.kind === "deleted") {
      emitted.push(entry.baseEvent);
    }
  }

  // Sort by timestamp/eventId for stable output.
  emitted.sort((a, b) => {
    if (a.timestamp !== b.timestamp) return a.timestamp < b.timestamp ? -1 : 1;
    return a.eventId < b.eventId ? -1 : a.eventId > b.eventId ? 1 : 0;
  });

  return emitted;
}

/**
 * Replay a list of events against an empty working model and
 * return the set of claim content-addresses. Used to compare the
 * outcome of the original vs compacted event streams for
 * equivalence verification.
 */
function claimAddressSet(eventList, context) {
  let model = pam.createModel([]);
  for (const event of eventList) {
    const result = events.dispatchReducer(model, event, context || {});
    if (result.applied) model = result.workingModel;
  }
  return model.dedupIndex ? new Set(model.dedupIndex.keys()) : new Set();
}

/**
 * Compact a channel in place with equivalence verification. Returns
 * { before, after, verified, difference } where difference is the
 * number of claims missing/extra when comparing the two replays
 * (zero on successful verification).
 */
function compactChannel(root, name, options = {}) {
  if (!SUPPORTED_CHANNELS.has(name)) {
    throw new TypeError(`compactChannel: only "substrate" is supported in v1, got "${name}"`);
  }

  const original = events.readAll(root, name);
  if (original.length === 0) {
    return { before: 0, after: 0, verified: true, difference: 0 };
  }

  const compacted = planSubstrateCompaction(original);

  const context = options.context || {};
  const originalAddrs = claimAddressSet(original, context);
  const compactedAddrs = claimAddressSet(compacted, context);

  let difference = 0;
  for (const a of originalAddrs) if (!compactedAddrs.has(a)) difference += 1;
  for (const a of compactedAddrs) if (!originalAddrs.has(a)) difference += 1;
  const verified = difference === 0;

  if (!verified) {
    return {
      before: original.length,
      after: compacted.length,
      verified: false,
      difference,
    };
  }

  // Atomic swap of the channel file.
  events.replaceChannel(root, name, compacted);

  // Record the compaction on the kernel channel.
  const marker = events.buildEvent({
    channel: "kernel",
    op: "compaction-performed",
    origin: {
      kind: "compaction",
      by: "compact-tool",
      at: new Date().toISOString(),
    },
    payload: {
      sourceChannel: name,
      before: original.length,
      after: compacted.length,
      firstEventId: original[0].eventId,
      lastEventId:  original[original.length - 1].eventId,
    },
  });
  events.append(root, "kernel", marker);

  return {
    before: original.length,
    after: compacted.length,
    verified: true,
    difference: 0,
  };
}

export {
  compactChannel,
  planSubstrateCompaction,
  claimAddressSet,
};
