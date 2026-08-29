// Temporal queries — query interfaces over the event log's temporal
// structure. Thin wrappers over replay and channels.

import * as channels from "./channels.js";
import { replay } from "./replay.js";

/**
 * Replay the event log up to a given timestamp, returning the
 * geometry at that point in time.
 *
 * @param {string} root - Substrate root directory.
 * @param {string} timestamp - ISO-8601 cutoff (inclusive).
 * @param {object} [options] - Passed through to replay().
 * @returns {{ workingModel, report }}
 */
function geometryAt(root, timestamp, options) {
  return replay(root, null, {
    ...options,
    toTimestamp: timestamp
  });
}

/**
 * Return all events after a given timestamp, merge-sorted across
 * all channels.
 *
 * @param {string} root - Substrate root directory.
 * @param {string} timestamp - ISO-8601 cutoff (exclusive).
 * @param {object} [options] - { channels?: string[] }
 * @returns {Array} Sorted events.
 */
function eventsSince(root, timestamp, options) {
  const channelNames = (options && options.channels) || channels.listChannels(root);
  const allEvents = [];
  for (const name of channelNames) {
    const events = channels.readSince(root, name, timestamp);
    for (const e of events) allEvents.push(e);
  }
  allEvents.sort((a, b) => {
    if (a.timestamp !== b.timestamp) return a.timestamp < b.timestamp ? -1 : 1;
    return a.eventId < b.eventId ? -1 : a.eventId > b.eventId ? 1 : 0;
  });
  return allEvents;
}

/**
 * Compute the difference between two points in time.
 *
 * Under monotonic knowledge-join, "removed" should always be empty
 * unless elision removed events between the two timestamps.
 *
 * @param {string} root - Substrate root directory.
 * @param {string} t1 - Earlier timestamp.
 * @param {string} t2 - Later timestamp.
 * @param {object} [options] - Passed through to replay().
 * @returns {{ added, removed, changed }}
 */
function delta(root, t1, t2, options) {
  const { workingModel: geo1 } = geometryAt(root, t1, options);
  const { workingModel: geo2 } = geometryAt(root, t2, options);

  // Build dedup-key-indexed maps from both geometries.
  const map1 = new Map();
  for (const t of (geo1.triples || [])) {
    if (t) map1.set(`${t.sid},${t.pid},${t.oid}`, t);
  }
  const map2 = new Map();
  for (const t of (geo2.triples || [])) {
    if (t) map2.set(`${t.sid},${t.pid},${t.oid}`, t);
  }

  const added = [];
  const removed = [];
  const changed = [];
  const s = geo2.strings || geo1.strings;

  for (const [dk, t2] of map2) {
    const t1 = map1.get(dk);
    if (!t1) {
      added.push(s ? { subject: s.value(t2.sid), predicate: s.value(t2.pid), object: s.value(t2.oid), value: t2.value } : t2);
    } else if (t1.value !== t2.value) {
      changed.push({ before: t1.value, after: t2.value, triple: t2 });
    }
  }

  for (const [dk, t1] of map1) {
    if (!map2.has(dk)) {
      removed.push(s ? { subject: s.value(t1.sid), predicate: s.value(t1.pid), object: s.value(t1.oid), value: t1.value } : t1);
    }
  }

  return { added, removed, changed };
}

export { geometryAt, eventsSince, delta };
