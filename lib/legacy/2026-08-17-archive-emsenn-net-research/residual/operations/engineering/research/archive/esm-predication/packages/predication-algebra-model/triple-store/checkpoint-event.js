/**
 * kernel/checkpoint event helpers.
 *
 * A kernel/checkpoint event is the durable, discoverable root of a
 * TripleStore view. It carries nothing but a manifest hash and a
 * cutoffTimestamp. Walking the kernel channel newest-to-oldest and
 * picking the first checkpoint whose manifest + every referenced
 * segment resolves in the blob store is how `loadLatestCheckpoint`
 * finds what to open.
 *
 * Because events are append-only and content-addressed, every
 * successful transaction leaves a durable breadcrumb. Losing the
 * latest checkpoint's segments falls back to the previous; losing
 * the manifest itself falls back further; losing every checkpoint
 * event falls back to full replay. No stray `rm` strands the
 * substrate.
 */

import * as channels from "../event-log/channels.js";
import * as schema from "../event-log/schema.js";
import { parseManifest, allHashes } from "./manifest.js";
import { openStore } from "./store.js";
import os from "node:os";

/**
 * Append a kernel/checkpoint event pointing at the given manifest
 * hash. Returns the event object (caller can inspect eventId, etc.).
 *
 * The manifest is expected to already be in the blob store (i.e.
 * writeCheckpoint is called AFTER Transaction.commit which writes
 * the manifest). This function does not touch the blob store.
 */
function writeCheckpointEvent({ root, manifestHash, cutoffTimestamp, tripleCount, segmentCount }) {
  const event = schema.buildEvent({
    channel: "kernel",
    op: "checkpoint",
    origin: { kind: "kernel", by: `pid:${process.pid}@${os.hostname()}` },
    payload: {
      manifestHash,
      cutoffTimestamp: cutoffTimestamp || "",
      tripleCount: tripleCount || 0,
      segmentCount: segmentCount || 0,
    },
  });
  channels.append(root, "kernel", event);
  return event;
}

/**
 * Walk the kernel channel newest-to-oldest. Return the first
 * checkpoint event whose manifest blob is present AND whose every
 * referenced blob (segments + strings) resolves. Lost/corrupt
 * artifacts fall through to the next-older checkpoint.
 *
 * Returns { event, manifest } or null.
 */
function findLatestValidCheckpoint({ root, blobs }) {
  // streamAll yields in append order; we want newest-first. The
  // kernel channel is typically small (one event per commit plus
  // compaction markers), so collecting all checkpoint events is
  // cheap.
  const checkpointEvents = [];
  for (const e of channels.streamAll(root, "kernel")) {
    if (e.op === "checkpoint") checkpointEvents.push(e);
  }

  for (let i = checkpointEvents.length - 1; i >= 0; i--) {
    const e = checkpointEvents[i];
    const manifestHash = e.payload && e.payload.manifestHash;
    if (!manifestHash || !blobs.hasBlob(root, manifestHash)) continue;

    const manifestText = blobs.getBlobText(root, manifestHash);
    if (manifestText == null) continue;
    let manifest;
    try { manifest = parseManifest(manifestText); }
    catch (_) { continue; }

    let allResolve = true;
    for (const h of allHashes(manifest)) {
      if (!blobs.hasBlob(root, h)) { allResolve = false; break; }
    }
    if (!allResolve) continue;

    return { event: e, manifest, manifestHash };
  }
  return null;
}

/**
 * Open the latest valid checkpoint as a TripleStore. Returns null
 * if no valid checkpoint exists; callers fall through to full-replay
 * or empty-store creation.
 */
function loadLatestCheckpoint({ root, blobs, InternTable }) {
  const found = findLatestValidCheckpoint({ root, blobs });
  if (!found) return null;
  return openStore({ root, manifestHash: found.manifestHash, blobs, InternTable });
}

/**
 * Convenience: commit a TripleStore transaction AND write the
 * corresponding kernel/checkpoint event atomically (from the caller's
 * perspective). Returns { store, event }.
 *
 * The commit happens first; if it throws, no event is written. If
 * the commit succeeds and the event append throws, the new manifest
 * + segments are already in the blob store — they're just
 * unreferenced by any event. A future commit will reference them
 * through structural sharing; they're not lost.
 */
function commitAndCheckpoint(tx, { cutoffTimestamp, root }) {
  const newStore = tx.commit({ cutoffTimestamp });
  // writeCheckpoint expects the manifest already in blob store.
  // Transaction.commit() writes the manifest implicitly via
  // store.manifest — but does it write the manifest blob? Let me
  // check: commit writes segments and builds the manifest JS
  // object, then returns a new TripleStore. The manifest itself
  // is only in memory at that point. We need to write it as a blob.
  const manifestJson = JSON.stringify(newStore.manifest);
  const manifestHash = newStore.blobs.putBlob(root, manifestJson);

  const event = writeCheckpointEvent({
    root,
    manifestHash,
    cutoffTimestamp,
    tripleCount: newStore.tripleCount,
    segmentCount: newStore.manifest.indexes.eavt.length
                + newStore.manifest.indexes.aevt.length
                + newStore.manifest.indexes.avet.length
                + 1,
  });

  return { store: newStore, event, manifestHash };
}

export {
  writeCheckpointEvent,
  findLatestValidCheckpoint,
  loadLatestCheckpoint,
  commitAndCheckpoint,
};
