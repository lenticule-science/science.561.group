/**
 * Channels — named append-only event streams.
 *
 * A channel is a JSONL file at <root>/.fars-store/events/<name>.jsonl.
 * Producers append events by name; consumers read events by name.
 * The channel abstraction decouples producers from consumers so new
 * channels can be introduced without changing existing code.
 *
 * Append semantics: one event per line, single atomic write of a
 * pre-serialized JSON string. fs.appendFileSync is atomic for small
 * writes on POSIX so concurrent appends from a single process don't
 * tear. Multi-process appends are safe under the same syscall
 * guarantees for write sizes under PIPE_BUF; larger events lose that
 * guarantee but the math is CRDT-convergent anyway so divergent
 * writes reconcile on replay.
 *
 * Read semantics: iterate events one line at a time from the start
 * of the file, or from after a given timestamp. Blank lines are
 * skipped. Lines that fail to parse or fail schema validation emit
 * a warning and are skipped (the rest of the log stays readable).
 *
 * Schema: every appended event is validated via schema.validateEvent
 * before being written. The eventId is recomputed and compared
 * against what the caller provided; mismatches are rejected. This
 * guarantees the log never contains invalid events.
 */

import fs from "node:fs";
import path from "node:path";

import * as schema from "./schema.js";

const EVENTS_DIRNAME = "events";
const CHANNEL_EXT = ".jsonl";

function eventsRoot(root) {
  return path.join(root, ".fars-store", EVENTS_DIRNAME);
}

function channelPath(root, name) {
  return path.join(eventsRoot(root), `${name}${CHANNEL_EXT}`);
}

function ensureChannelDir(root) {
  const dir = eventsRoot(root);
  if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true });
}

/**
 * Append one event to the named channel. Validates the event's
 * shape, verifies the eventId matches the computed content address,
 * and writes the serialized form plus a newline. Returns the
 * written event (same as input if validation passes). Throws on
 * validation failure without writing anything.
 */
function append(root, name, event) {
  if (event.channel !== name) {
    throw new TypeError(
      `channel mismatch: event.channel=${event.channel} but appending to ${name}`
    );
  }

  const validation = schema.validateEvent(event);
  if (!validation.valid) {
    throw new TypeError(`invalid event: ${validation.error}`);
  }

  const expectedId = schema.computeEventId(event);
  if (event.eventId !== expectedId) {
    throw new TypeError(
      `eventId mismatch: provided=${event.eventId} computed=${expectedId}`
    );
  }

  ensureChannelDir(root);
  const filePath = channelPath(root, name);
  fs.appendFileSync(filePath, JSON.stringify(event) + "\n", "utf8");
  return event;
}

/**
 * Read every event in the named channel in append order. Returns an
 * array of events; skips blank lines and lines that fail to parse
 * or validate (those are logged to stderr as diagnostics).
 *
 * Returns an empty array if the channel file doesn't exist.
 */
function readAll(root, name, options = {}) {
  const filePath = channelPath(root, name);
  if (!fs.existsSync(filePath)) return [];

  const content = fs.readFileSync(filePath, "utf8");
  const events = [];

  for (const line of content.split("\n")) {
    const trimmed = line.trim();
    if (!trimmed) continue;

    let parsed;
    try {
      parsed = JSON.parse(trimmed);
    } catch (err) {
      if (options.onSkip) {
        options.onSkip({ reason: "parse-error", line: trimmed, error: err.message });
      }
      continue;
    }

    const validation = schema.validateEvent(parsed);
    if (!validation.valid) {
      if (options.onSkip) {
        options.onSkip({ reason: "schema-error", event: parsed, error: validation.error });
      }
      continue;
    }

    events.push(parsed);
  }

  return events;
}

/**
 * Read events with timestamp strictly greater than the given
 * threshold. Same skip semantics as readAll.
 */
function readSince(root, name, sinceTimestamp, options) {
  const all = readAll(root, name, options);
  return all.filter((e) => e.timestamp > sinceTimestamp);
}

/**
 * Stream events from a channel one at a time, parsing on demand and
 * discarding after yield. Chunked file read keeps resident memory
 * bounded by CHUNK_SIZE + the largest single line, regardless of
 * the channel's total size.
 *
 * Same skip semantics as readAll: blank lines, parse errors, and
 * schema-validation failures are reported via options.onSkip.
 *
 * Returns an empty iterator if the channel file doesn't exist.
 *
 * Use this in preference to readAll when processing large channels:
 * a channel of N events can be walked in O(largest-line) memory
 * instead of O(N × event-size). Replay's two-pass elision-then-apply
 * uses this to keep cold-start memory bounded.
 */
const STREAM_CHUNK_SIZE = 65536;

function* streamAll(root, name, options = {}) {
  const filePath = channelPath(root, name);
  if (!fs.existsSync(filePath)) return;

  const fd = fs.openSync(filePath, "r");
  try {
    const buf = Buffer.alloc(STREAM_CHUNK_SIZE);
    // Buffer rather than string for the trailing-partial-line carry:
    // V8's String.slice returns a SlicedString that holds a reference
    // to the parent. Carrying a sliced string across chunks transitively
    // pins every prior chunk's string in memory, which is the exact
    // unbounded growth this streaming form exists to avoid. Buffers
    // are explicitly copied via Buffer.from below, breaking the chain.
    let leftover = Buffer.alloc(0);

    while (true) {
      const bytesRead = fs.readSync(fd, buf, 0, STREAM_CHUNK_SIZE, null);
      if (bytesRead === 0) break;

      // Concat the trailing partial from the previous chunk with the
      // new bytes into one contiguous buffer for line-walking.
      const combined = Buffer.concat([leftover, buf.subarray(0, bytesRead)]);

      let start = 0;
      while (true) {
        const nl = combined.indexOf(0x0a, start); // '\n'
        if (nl === -1) break;
        const lineStr = combined.toString("utf8", start, nl).trim();
        start = nl + 1;
        if (lineStr) {
          const event = parseAndValidate(lineStr, options);
          if (event !== undefined) yield event;
        }
      }

      // Forced copy: Buffer.from(...) on a subarray allocates a fresh
      // buffer holding only the trailing partial-line bytes. The
      // `combined` buffer is now garbage and can be reclaimed.
      leftover = start < combined.length
        ? Buffer.from(combined.subarray(start))
        : Buffer.alloc(0);
    }

    // Last line without trailing newline.
    const tail = leftover.toString("utf8").trim();
    if (tail) {
      const event = parseAndValidate(tail, options);
      if (event !== undefined) yield event;
    }
  } finally {
    fs.closeSync(fd);
  }
}

function parseAndValidate(line, options) {
  let parsed;
  try {
    parsed = JSON.parse(line);
  } catch (err) {
    if (options.onSkip) {
      options.onSkip({ reason: "parse-error", line, error: err.message });
    }
    return undefined;
  }

  const validation = schema.validateEvent(parsed);
  if (!validation.valid) {
    if (options.onSkip) {
      options.onSkip({ reason: "schema-error", event: parsed, error: validation.error });
    }
    return undefined;
  }

  return parsed;
}

/**
 * List the names of every channel file in the events directory.
 */
function listChannels(root) {
  const dir = eventsRoot(root);
  if (!fs.existsSync(dir)) return [];
  return fs
    .readdirSync(dir)
    .filter((name) => name.endsWith(CHANNEL_EXT))
    .map((name) => name.slice(0, -CHANNEL_EXT.length))
    .sort();
}

/**
 * Replace a channel's contents atomically. Writes to a temporary
 * file in the same directory, then renames over the target. Used
 * by the compact tool to swap in a compacted channel file.
 */
function replaceChannel(root, name, events) {
  ensureChannelDir(root);
  const filePath = channelPath(root, name);
  const tmpPath = `${filePath}.tmp.${process.pid}.${Date.now()}`;

  const lines = events.map((e) => {
    const validation = schema.validateEvent(e);
    if (!validation.valid) {
      throw new TypeError(`invalid event during replaceChannel: ${validation.error}`);
    }
    return JSON.stringify(e);
  });

  fs.writeFileSync(tmpPath, lines.join("\n") + (lines.length > 0 ? "\n" : ""), "utf8");
  fs.renameSync(tmpPath, filePath);
}

export {
  EVENTS_DIRNAME,
  CHANNEL_EXT,
  eventsRoot,
  channelPath,
  ensureChannelDir,
  append,
  readAll,
  streamAll,
  readSince,
  listChannels,
  replaceChannel,
};
