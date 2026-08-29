/**
 * Reducer registry.
 *
 * A reducer is a pure function `(workingModel, event, context) →
 * workingModel` that applies one event's effect to a working model.
 * Reducers are registered by `(channel, op)` and dispatched by the
 * replay engine (and by live append paths that want to apply the
 * same effect without a full replay).
 *
 * The context is a per-replay/per-dispatch object carrying shared
 * resources the reducer may need: the root directory, the blob
 * store, any already-applied eventIds (for idempotence). Reducers
 * should never mutate the context; they may read from it.
 *
 * Unknown (channel, op) pairs are looked up, not executed — the
 * dispatcher returns null and the caller decides whether to skip
 * or to emit a diagnostic.
 */

// The event log does NOT statically import projector reducers. That
// would create a cycle: the event log lives inside predication-algebra-
// model, and the projector packages (filesystem-server, MCP server)
// already depend on predication-algebra-model. Instead, each projector
// package registers its own reducers as a side effect of being
// required (see their index.js files). The composition root — or any
// replay-driving code — pulls in the projectors whose reducers it
// needs, and those side-effect registrations happen before replay.
//
// Kernel and meta reducers are internal to the event log and are
// registered directly below.
import * as kernel from "./kernel-reducer.js";

const registry = new Map();

function key(channel, op) {
  return `${channel}\u0000${op}`;
}

function register(channel, op, reducer) {
  if (typeof reducer !== "function") {
    throw new TypeError(`reducer for ${channel}/${op} must be a function`);
  }
  registry.set(key(channel, op), reducer);
}

function lookup(channel, op) {
  return registry.get(key(channel, op)) || null;
}

function dispatch(workingModel, event, context = {}) {
  const reducer = lookup(event.channel, event.op);
  if (!reducer) return { workingModel, applied: false, reason: "unknown-op" };
  try {
    const next = reducer(workingModel, event, context);
    return { workingModel: next || workingModel, applied: true };
  } catch (err) {
    return {
      workingModel,
      applied: false,
      reason: "reducer-error",
      error: err.message,
    };
  }
}

function allRegistered() {
  const out = [];
  for (const [k] of registry) {
    const [channel, op] = k.split("\u0000");
    out.push({ channel, op });
  }
  return out;
}

// Built-in reducers owned by the event log itself. Domain reducers
// (substrate, messages, filetypes) are registered by their owning
// projector packages on require.
register("kernel", "settle",  kernel.settle);
register("kernel", "settled", kernel.settled);
register("kernel", "compact", kernel.compact);
register("kernel", "compaction-performed", kernel.compactionPerformed);
register("kernel", "checkpoint", kernel.checkpoint);

register("meta", "replay-error", kernel.replayError);

export {
  register,
  lookup,
  dispatch,
  allRegistered,
};
