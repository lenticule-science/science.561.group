import { existsSync, readFileSync, statSync } from "node:fs";
import { join, resolve } from "node:path";

import { searchImmutableRoomIndex } from "@red-cup-engineering/cairn/room-index-search";

const ROOM_KEY = /^[0-9a-f]{64}$/u;
const RELEASE_ID = /^[0-9a-f]{64}$/u;
const cache = new Map();

export const DEFAULT_L_SPACE_RELEASE_ROOT = resolve("dist/vault");

function immutable(value) {
  if (value === null || typeof value !== "object" || Object.isFrozen(value)) return value;
  for (const child of Object.values(value)) immutable(child);
  return Object.freeze(value);
}

function json(path, label) {
  try { return JSON.parse(readFileSync(path, "utf8")); }
  catch (error) { throw new Error(`cannot read ${label} at ${path}: ${error instanceof Error ? error.message : String(error)}`); }
}

function fixedReleaseRoot(offered) {
  const root = resolve(offered ?? process.env.L_SPACE_RELEASE_ROOT ?? DEFAULT_L_SPACE_RELEASE_ROOT);
  for (const file of ["manifest.json", "index.json"]) {
    if (!existsSync(join(root, file))) throw new Error(`L-Space release is unavailable: ${join(root, file)}`);
  }
  return root;
}

function releaseSnapshot(offeredRoot) {
  const root = fixedReleaseRoot(offeredRoot);
  const manifestPath = join(root, "manifest.json"), indexPath = join(root, "index.json");
  const signature = `${statSync(manifestPath).mtimeMs}:${statSync(indexPath).mtimeMs}:${statSync(indexPath).size}`;
  const prior = cache.get(root);
  if (prior?.signature === signature) return prior;

  const manifest = json(manifestPath, "L-Space release manifest");
  const index = json(indexPath, "L-Space room index");
  if (manifest?.schemaVersion !== "l-space-cloud-release/v1" || !RELEASE_ID.test(manifest.release ?? "")) {
    throw new TypeError("L-Space release manifest has an unsupported schema or release identity");
  }
  if (index?.schemaVersion !== "l-space-index/v1" || !Array.isArray(index.rooms)) {
    throw new TypeError("L-Space room index has an unsupported schema");
  }
  if (manifest.counts?.rooms !== index.rooms.length) {
    throw new TypeError("L-Space manifest and room index disagree about the room count");
  }

  const byId = new Map();
  for (const room of index.rooms) {
    if (typeof room?.id !== "string" || !ROOM_KEY.test(room?.key ?? "") || byId.has(room.id)) {
      throw new TypeError("L-Space room index contains an invalid or duplicate room record");
    }
    byId.set(room.id, immutable(room));
  }
  const snapshot = Object.freeze({ root, signature, manifest: immutable(manifest), index: immutable(index), byId });
  cache.set(root, snapshot);
  return snapshot;
}

function positiveBound(value, fallback, maximum, name) {
  const selected = value ?? fallback;
  if (!Number.isSafeInteger(selected) || selected < 1 || selected > maximum) throw new RangeError(`${name} must be an integer from 1 through ${maximum}`);
  return selected;
}

function roomSummary(room) {
  return Object.freeze({
    id: room.id,
    key: room.key,
    title: room.title,
    summary: room.summary,
    kind: room.kind,
    collection: room.collection,
    visibility: room.visibility,
    space: room.space,
  });
}

export function observeLSpaceRelease({ releaseRoot, query = "", limit, collectionPrefix, pathPrefix, kind, kinds } = {}) {
  if (typeof query !== "string") throw new TypeError("query must be a string");
  const snapshot = releaseSnapshot(releaseRoot);
  const reading = searchImmutableRoomIndex(snapshot.index.rooms, {
    query,
    limit: positiveBound(limit, 20, 100, "limit"),
    collectionPrefix,
    pathPrefix,
    kind,
    kinds,
  });
  const rooms = reading.results.map(({ room, exactTitle, score, reasons, evidence }) => Object.freeze({
    ...roomSummary(room),
    search: Object.freeze({ exactTitle, score, reasons, evidence }),
  }));
  return immutable({
    type: "LSpaceReleaseObservation",
    version: 1,
    release: snapshot.manifest.release,
    generatedAt: snapshot.manifest.generatedAt,
    baseUrl: snapshot.manifest.baseUrl,
    counts: snapshot.manifest.counts,
    knowledgeVault: Object.freeze({
      schemaVersion: snapshot.manifest.vaultSchemaVersion,
      participation: snapshot.index.participation,
      vocabulary: snapshot.index.vocabulary,
      victor: snapshot.manifest.victor,
    }),
    query: query.trim(),
    filters: reading.filters,
    matched: reading.total,
    returned: rooms.length,
    rooms: Object.freeze(rooms),
    authority: "read-only release observation; no source, release, journal, or participation mutation",
  });
}

export function traverseLSpaceRoom({ releaseRoot, roomId, direction = "both", limit, bodyCharacterLimit } = {}) {
  if (typeof roomId !== "string" || roomId.length === 0) throw new TypeError("roomId must be one exact L-Space room id");
  if (!["incoming", "outgoing", "both"].includes(direction)) throw new RangeError("direction must be incoming, outgoing, or both");
  const snapshot = releaseSnapshot(releaseRoot);
  const indexed = snapshot.byId.get(roomId);
  if (!indexed) throw new RangeError(`unknown L-Space room: ${roomId}`);
  const detail = json(join(snapshot.root, "rooms", `${indexed.key}.json`), "L-Space room projection");
  if (detail?.schemaVersion !== "l-space-room/v1" || detail.room?.id !== roomId || !Array.isArray(detail.doors)) {
    throw new TypeError(`L-Space room projection disagrees with its index entry: ${roomId}`);
  }
  const matchingDoors = detail.doors.filter((door) => direction === "both" || door.direction === direction);
  const doors = matchingDoors.slice(0, positiveBound(limit, 25, 100, "limit")).map((door) => {
    const neighborId = door.direction === "incoming" ? door.from : door.to;
    const neighbor = snapshot.byId.get(neighborId);
    return Object.freeze({ ...door, neighbor: neighbor ? roomSummary(neighbor) : null });
  });
  const bodyCap = positiveBound(bodyCharacterLimit, 12_000, 50_000, "bodyCharacterLimit");
  const roomBody = typeof detail.room.body === "string" ? detail.room.body : "";
  return immutable({
    type: "LSpaceRoomTraversal",
    version: 1,
    release: snapshot.manifest.release,
    room: Object.freeze({ ...detail.room, body: roomBody.slice(0, bodyCap), bodyTruncated: roomBody.length > bodyCap }),
    space: detail.space,
    gate: detail.gate,
    cards: detail.cards,
    direction,
    availableDoorCount: matchingDoors.length,
    returnedDoorCount: doors.length,
    doors: Object.freeze(doors),
    authority: "read-only one-step traversal of the immutable L-Space release",
  });
}
