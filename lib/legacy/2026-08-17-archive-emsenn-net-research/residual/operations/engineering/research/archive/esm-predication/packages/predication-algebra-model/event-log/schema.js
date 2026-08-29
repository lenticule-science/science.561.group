/**
 * Event schema for the event substrate.
 *
 * Every event has a typed shape:
 *
 *   {
 *     logVersion: 1,
 *     eventId:    "event:<sha256>",
 *     channel:    "<channel-name>",
 *     op:         "<op-name>",
 *     timestamp:  "<ISO-8601 with millis>",
 *     origin:     { kind: "...", by: "...", at: "...", ... },
 *     payload:    { ...op-specific... }
 *   }
 *
 * `eventId` is a content address over `(channel, op, timestamp, origin,
 * payload)`. Two events with identical content produce identical ids;
 * replay deduplicates by id, which is what makes multi-writer
 * convergence safe without coordination (bilattice k-join is a CRDT).
 *
 * `origin` is mandatory. Anonymous events are a bug. `origin.kind` is
 * a discriminator ("fars-regenerate", "mcp", "kernel", "compaction",
 * "external"); `origin.by` identifies the specific producer (process
 * id, sender id, tool name); `origin.at` is the origin's own
 * timestamp when it differs from the event timestamp.
 *
 * `channel` is a named string — the message channel, the substrate
 * channel, the kernel channel, the meta channel — and decouples
 * producer from consumer.
 *
 * `op` is the verb. Every op has a registered reducer in
 * reducers/index.js; unknown ops are skipped on replay with a
 * warning.
 *
 * Schema validation happens at append time (channels.js) and at
 * replay time (replay.js). The same validateEvent() function is used
 * by both so there is exactly one definition of "valid event".
 */

import * as pam from "../index.js";

const LOG_VERSION = 1;

/**
 * Compute the content-addressed eventId for an event body. Excludes
 * the eventId itself from the canonicalized form (that would be
 * circular) and excludes logVersion (it's metadata about the storage
 * format, not the event's content identity).
 */
function computeEventId(event) {
  const { eventId: _ignoredId, logVersion: _ignoredVersion, ...body } = event;
  return pam.addressOf(body, "event");
}

/**
 * Validate an event's shape. Returns { valid: true } or
 * { valid: false, error: "<message>" }. Does NOT check that the
 * eventId matches computeEventId() — that's a separate check used
 * by channels.js on append.
 */
function validateEvent(event) {
  if (event == null || typeof event !== "object") {
    return { valid: false, error: "event must be an object" };
  }
  if (event.logVersion !== LOG_VERSION) {
    return { valid: false, error: `unsupported logVersion: ${event.logVersion}` };
  }
  if (typeof event.channel !== "string" || event.channel.length === 0) {
    return { valid: false, error: "event.channel must be a non-empty string" };
  }
  if (typeof event.op !== "string" || event.op.length === 0) {
    return { valid: false, error: "event.op must be a non-empty string" };
  }
  if (typeof event.timestamp !== "string" || !isIsoTimestamp(event.timestamp)) {
    return { valid: false, error: "event.timestamp must be ISO-8601" };
  }
  if (event.origin == null || typeof event.origin !== "object") {
    return { valid: false, error: "event.origin is required" };
  }
  if (typeof event.origin.kind !== "string" || event.origin.kind.length === 0) {
    return { valid: false, error: "event.origin.kind is required" };
  }
  if (typeof event.origin.by !== "string" || event.origin.by.length === 0) {
    return { valid: false, error: "event.origin.by is required" };
  }
  if (event.payload == null || typeof event.payload !== "object") {
    return { valid: false, error: "event.payload must be an object (empty is allowed)" };
  }
  return { valid: true };
}

function isIsoTimestamp(s) {
  // ISO 8601 with millis: "2026-04-11T12:34:56.789Z" or with timezone
  // offsets. Keep it permissive enough to accept anything Date.prototype
  // .toISOString produces.
  return /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(\.\d+)?(Z|[+-]\d{2}:\d{2})$/.test(s);
}

/**
 * Build an event, computing its eventId in the process. Throws on
 * validation failure. Callers pass the body without logVersion or
 * eventId; this function fills both in.
 */
function buildEvent({ channel, op, timestamp, origin, payload }) {
  const draft = {
    logVersion: LOG_VERSION,
    channel,
    op,
    timestamp: timestamp || new Date().toISOString(),
    origin,
    payload: payload || {},
  };
  const validation = validateEvent(draft);
  if (!validation.valid) {
    throw new TypeError(`invalid event: ${validation.error}`);
  }
  draft.eventId = computeEventId(draft);
  return draft;
}

export {
  LOG_VERSION,
  computeEventId,
  validateEvent,
  buildEvent,
  isIsoTimestamp,
};
