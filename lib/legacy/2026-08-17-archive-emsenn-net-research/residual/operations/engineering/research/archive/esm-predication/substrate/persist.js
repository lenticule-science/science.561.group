// Persistence: append-only event log per channel (JSONL) and a
// snapshot (JSON). Boot = load snapshot, replay events since its
// cutoff; on any snapshot error, full replay from the log.
//
// Layout under <root>/.substrate/:
//   events/<channel>.jsonl   one event per line
//   snapshot.json            {v, claims[[k,v]...], provenance[[k,prov]...],
//                             strings[[id,value]...], cutoff}

import fs from "node:fs";
import path from "node:path";
import crypto from "node:crypto";
import { State } from "./state.js";

function storeDir(root) { return path.join(root, ".substrate"); }
function eventsDir(root) { return path.join(storeDir(root), "events"); }
function snapshotFile(root) { return path.join(storeDir(root), "snapshot.json"); }
function channelFile(root, channel) { return path.join(eventsDir(root), channel + ".jsonl"); }

function eventId() {
  return "evt:" + crypto.randomBytes(12).toString("hex");
}

function append(root, channel, event) {
  fs.mkdirSync(eventsDir(root), { recursive: true });
  const full = {
    eventId: event.eventId || eventId(),
    timestamp: event.timestamp || new Date().toISOString(),
    channel,
    ...event,
  };
  fs.appendFileSync(channelFile(root, channel), JSON.stringify(full) + "\n");
  return full;
}

function *streamEvents(root, channel) {
  const f = channelFile(root, channel);
  if (!fs.existsSync(f)) return;
  const lines = fs.readFileSync(f, "utf8").split("\n");
  for (const line of lines) {
    if (!line.trim()) continue;
    try { yield JSON.parse(line); } catch (_) { /* skip corrupt line */ }
  }
}

function listChannels(root) {
  const dir = eventsDir(root);
  if (!fs.existsSync(dir)) return [];
  return fs.readdirSync(dir).filter((f) => f.endsWith(".jsonl")).map((f) => f.slice(0, -6));
}

function writeSnapshot(root, state) {
  fs.mkdirSync(storeDir(root), { recursive: true });
  const maxTs = {};
  for (const channel of listChannels(root)) {
    for (const e of streamEvents(root, channel)) {
      if (!e.timestamp) continue;
      if (!maxTs[channel] || e.timestamp > maxTs[channel]) maxTs[channel] = e.timestamp;
    }
  }
  const strings = [];
  for (let id = 0; id < state.strings.size; id++) strings.push(state.strings.value(id));
  const data = {
    v: 1,
    writtenAt: new Date().toISOString(),
    cutoffByChannel: maxTs,
    strings,
    claims: [...state.claims.entries()],
    provenance: [...state.provenance.entries()],
  };
  const tmp = snapshotFile(root) + ".tmp";
  fs.writeFileSync(tmp, JSON.stringify(data));
  fs.renameSync(tmp, snapshotFile(root));
  return { claimCount: state.claims.size, cutoffByChannel: maxTs };
}

function loadSnapshot(root) {
  const f = snapshotFile(root);
  if (!fs.existsSync(f)) return null;
  let data;
  try { data = JSON.parse(fs.readFileSync(f, "utf8")); }
  catch (_) { return null; }
  if (!data || data.v !== 1) return null;

  const state = new State();
  for (const s of (data.strings || [])) state.strings.intern(s);
  for (const [k, v] of (data.claims || [])) {
    state.claims.set(k, v);
    const pid = Number(k.split("\u0000")[1]);
    let bucket = state.byPid.get(pid);
    if (!bucket) { bucket = new Set(); state.byPid.set(pid, bucket); }
    bucket.add(k);
  }
  for (const [k, prov] of (data.provenance || [])) state.provenance.set(k, prov);

  return { state, cutoffByChannel: data.cutoffByChannel || {} };
}

export {
  append, streamEvents, listChannels,
  writeSnapshot, loadSnapshot,
  storeDir, eventsDir, snapshotFile,
  eventId,
};
