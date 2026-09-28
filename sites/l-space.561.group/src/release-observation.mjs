import { existsSync, statSync } from "node:fs";
import { join, resolve } from "node:path";

import { searchImmutableRoomIndex } from "@red-cup-engineering/cairn/room-index-search";
import { json } from "./release-json.mjs";

const ROOM_KEY = /^[0-9a-f]{64}$/u;
const RELEASE_ID = /^[0-9a-f]{64}$/u;
const cache = new Map();

export const DEFAULT_L_SPACE_RELEASE_ROOT = resolve(import.meta.dirname, "..", "dist", "vault");

function immutable(value) {
  if (value === null || typeof value !== "object" || Object.isFrozen(value)) return value;
  for (const child of Object.values(value)) immutable(child);
  return Object.freeze(value);
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

const GLOSSARY_TERM_MARKERS = Object.freeze([
  "/content/text/glossary/terms/",
  "/content/glossary/terms/",
]);

function slugOfConceptName(value) {
  return String(value).trim().toLowerCase().replace(/\s+/gu, "-");
}

function glossaryTermStem(roomId) {
  const normalized = `/${roomId}`;
  for (const marker of GLOSSARY_TERM_MARKERS) {
    const index = normalized.indexOf(marker);
    if (index < 0) continue;
    const filename = normalized.slice(index + marker.length);
    if (filename === "" || filename.includes("/") || !filename.endsWith(".md")) continue;
    return filename.slice(0, -3);
  }
  return null;
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

export function observeLSpaceRelease({ releaseRoot, query = "", match = "any", limit, collectionPrefix, pathPrefix, kind, kinds } = {}) {
  if (typeof query !== "string") throw new TypeError("query must be a string");
  const snapshot = releaseSnapshot(releaseRoot);
  const reading = searchImmutableRoomIndex(snapshot.index.rooms, {
    query,
    match,
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
    vaultMaze: Object.freeze({
      schemaVersion: snapshot.manifest.vaultSchemaVersion,
      participation: snapshot.index.participation,
      vocabulary: snapshot.index.vocabulary,
    }),
    query: query.trim(),
    filters: reading.filters,
    matched: reading.total,
    returned: rooms.length,
    rooms: Object.freeze(rooms),
    authority: "read-only release observation; no source, release, journal, or participation mutation",
  });
}

/**
 * Read one concept's ruling status against the house glossary convention.
 *
 * A concept is "ruled" exactly when a room's path matches
 * `content/text/glossary/terms/<name>.md` (or the legacy `content/glossary/terms/`
 * marker) with a filename stem equal to the queried name — the same convention
 * CLAUDE.md names directly. This is a plain path check, never a fuzzy search
 * match, so it cannot report a near-miss as a ruling.
 *
 * @param {string} name - concept name (glossary term filename stem)
 * @param {{releaseRoot?: string}} [options]
 * @returns {{ruled: boolean, statement: string, room: object|null, additionalDefinitions: object[]}}
 * @throws {TypeError} if name is not a non-empty string
 */
export function glossaryProvenanceOf(name, { releaseRoot } = {}) {
  if (typeof name !== "string" || name === "") throw new TypeError("name is required");
  const snapshot = releaseSnapshot(releaseRoot);
  const slug = slugOfConceptName(name);
  const matches = snapshot.index.rooms.filter((room) => glossaryTermStem(room.id) === slug);
  if (matches.length === 0) {
    return immutable({
      ruled: false,
      statement: `no glossary term file found for "${name}" under content/text/glossary/terms/`,
      room: null,
      additionalDefinitions: [],
    });
  }
  return immutable({
    ruled: true,
    statement: `ruled term: glossary definition at ${matches[0].id}`,
    room: roomSummary(matches[0]),
    additionalDefinitions: matches.slice(1).map(roomSummary),
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
