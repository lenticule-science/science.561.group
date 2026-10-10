import { createHash } from "node:crypto";
import { cp, mkdir, rm, writeFile } from "node:fs/promises";
import { resolve } from "node:path";
import { canonicalStringify, validateWorld } from "@red-cup-engineering/vault-compiler/canonical";
import { projectWebFeedArtifacts } from "@red-cup-engineering/project-web-feed-artifacts-service";
import { renderMarkdownBlockHtml } from "@red-cup-engineering/markdown-engineering-services-section/render-markdown-block-html";
import { normalizeTufteModel } from "@red-cup-engineering/web-tufte-gui-services-section";
import { compileLSpace, lSpaceSurfacePolicy, roomVisibility } from "../src/index.mjs";

const appRoot = resolve(import.meta.dirname, "..");
const outputRoot = resolve(appRoot, "dist");
const vaultRoot = resolve(outputRoot, "vault");
const viewRoot = resolve(vaultRoot, "views");
const publicRoot = resolve(vaultRoot, "public");

const digest = (value) => createHash("sha256").update(value).digest("hex");

// CI has a fixed memory envelope. These stderr-only markers identify the phase
// holding memory when a release cannot complete without changing release bytes.
const buildStartedAt = process.hrtime.bigint();
function observeBuildPhase(phase) {
  const memory = process.memoryUsage();
  const elapsedMilliseconds = Number(process.hrtime.bigint() - buildStartedAt) / 1_000_000;
  process.stderr.write(`${JSON.stringify({
    type: "LSpaceCloudReleaseBuildObservation",
    phase,
    elapsedMilliseconds: Math.round(elapsedMilliseconds),
    rssBytes: memory.rss,
    heapUsedBytes: memory.heapUsed,
    heapTotalBytes: memory.heapTotal,
    externalBytes: memory.external,
  })}\n`);
}

/** Canonical bytes: sorted keys, so an unchanged corpus produces an unchanged release. */
const json = (value) => `${canonicalStringify(value)}\n`;

function summaryOf(room) {
  const offered = room.frontmatter.description ?? room.frontmatter.summary;
  const source = typeof offered === "string" ? offered : room.body;
  return source
    .replace(/```[\s\S]*?```/gu, " ")
    .replace(/!?(?:\[\[([^\]]+)\]\]|\[([^\]]+)\]\([^)]+\))/gu, "$1$2")
    .replace(/[#*_`>|~-]+/gu, " ")
    .replace(/\s+/gu, " ")
    .trim()
    .slice(0, 220);
}

function collectionOf(roomId) {
  const parts = roomId.split("/");
  if (parts[0] === "services" && parts[1]) return `services/${parts[1]}`;
  return parts[0] || "root";
}

function collectionTitle(collectionId) {
  return collectionId.split("/").at(-1)
    .replace(/-services-section$/u, "")
    .replaceAll("-", " ")
    .replace(/\b\w/gu, (letter) => letter.toUpperCase());
}

/** Render one FCA hall's intent as a human phrase: `type:concept` reads "type — concept". */
function hallTitle(intent) {
  if (intent.length === 0) return "Unnamed hall";
  return intent
    .map((term) => {
      const [field, ...rest] = term.split(":");
      const value = rest.join(":") || field;
      return rest.length === 0 ? value : `${field.replaceAll("-", " ")} — ${value}`;
    })
    .join(" · ");
}

function rfc3339(value) {
  if (typeof value !== "string") return null;
  const parsed = new Date(/^\d{4}-\d{2}-\d{2}$/u.test(value) ? `${value}T00:00:00Z` : value);
  return Number.isNaN(parsed.getTime()) ? null : parsed.toISOString();
}

await rm(outputRoot, { recursive: true, force: true });
await mkdir(resolve(vaultRoot, "rooms"), { recursive: true });
await mkdir(resolve(publicRoot, "rooms"), { recursive: true });
await mkdir(viewRoot, { recursive: true });
await cp(resolve(appRoot, "public"), outputRoot, { recursive: true });
observeBuildPhase("prepared-output");

const vault = await compileLSpace();
const wing = vault.wings[0];
observeBuildPhase("compiled-vault");

// A compiled world that fails its own schema is a release that must not ship.
validateWorld(wing.world);
observeBuildPhase("validated-world");

const gateByRoom = new Map(wing.passage.gates.map((gate) => [gate.roomId, gate]));
const cardsByRoom = new Map(wing.world.rooms.map((room) => [room.id, []]));
for (const card of wing.world.cards) cardsByRoom.get(card.roomId)?.push(card);
const doorsByRoom = new Map(wing.world.rooms.map((room) => [room.id, []]));
for (const door of wing.world.doors) {
  doorsByRoom.get(door.from)?.push({ direction: "outgoing", ...door });
  doorsByRoom.get(door.to)?.push({ direction: "incoming", ...door });
}
observeBuildPhase("indexed-world-links");

const index = [];
const publicIndex = [];
const publicRooms = [];
const keyByRoomId = new Map();

observeBuildPhase("serializing-rooms");
for (let offset = 0; offset < wing.world.rooms.length; offset += 1) {
  const room = wing.world.rooms[offset];
  const key = digest(room.id);
  keyByRoomId.set(room.id, key);
  const visibility = roomVisibility(room, wing.visibility);
  const entry = {
    id: room.id,
    key,
    title: room.title,
    kind: room.kind,
    summary: summaryOf(room),
    collection: collectionOf(room.id),
    visibility,
    space: wing.space[offset],
    tufte: wing.tufte[offset],
  };
  const detail = {
    schemaVersion: "l-space-room/v1",
    room,
    renderedBody: renderMarkdownBlockHtml(room.body, { emptyHtml: "<p>This room has no prose yet.</p>" }),
    visibility,
    space: entry.space,
    tufte: entry.tufte,
    gate: gateByRoom.get(room.id),
    cards: cardsByRoom.get(room.id),
    doors: doorsByRoom.get(room.id),
  };

  index.push(entry);
  await writeFile(resolve(vaultRoot, "rooms", `${key}.json`), json(detail));

  // The public tree receives only rooms whose own frontmatter opted in. Nothing
  // is copied here by default, so the anonymous surface cannot widen by accident.
  if (visibility === "public") {
    publicIndex.push(entry);
    publicRooms.push(room);
    await writeFile(resolve(publicRoot, "rooms", `${key}.json`), json(detail));
  }
}
observeBuildPhase("serialized-rooms");

let indexDocument = {
  schemaVersion: "l-space-index/v1",
  vocabulary: vault.vocabulary,
  participation: vault.participation,
  rooms: index,
};
let indexBytes = json(indexDocument);
observeBuildPhase("serialized-index");
const release = digest(json({
  schemaVersion: "l-space-release-identity/v2",
  index: indexDocument,
  roomDigests: wing.world.rooms.map((room) => digest(json(room))),
  doorDigest: digest(json(wing.world.doors)),
}));
observeBuildPhase("derived-release-identity");

// The release identity has consumed the discovery carrier. The Cloudflare
// release is deliberately cells plus their compact index: GEODE/FeltOS owns
// bounded graph readings at the authenticated capability boundary. Rebuilding
// its workspace snapshot and relation ledger here would create a second graph
// model, a 60 MiB deploy blocker, and an unacceptable compiler cost.
await writeFile(resolve(vaultRoot, "index.json"), indexBytes);
indexBytes = null;
indexDocument = null;

const generatedAt = new Date().toISOString();
observeBuildPhase("wrote-cell-release");

// Halls are the compiler's Formal Concept Analysis clusters: every set of rooms
// sharing a closed set of attributes. They were computed on every build and
// projected nowhere, which left the corpus with a whole navigable dimension the
// reader could not see.
const halls = wing.world.halls
  .map((hall) => ({
    id: hall.id,
    title: hallTitle(hall.intent),
    intent: hall.intent,
    stable: hall.stable,
    size: hall.rooms.length,
    rooms: hall.rooms.map((roomId) => ({ id: roomId, key: keyByRoomId.get(roomId) ?? null })),
  }))
  .filter((hall) => hall.size > 1)
  .sort((left, right) => right.size - left.size || left.title.localeCompare(right.title));

const hallsDocument = {
  schemaVersion: "l-space-halls/v1",
  release,
  counts: { halls: halls.length, stable: halls.filter((hall) => hall.stable).length },
  halls,
};
observeBuildPhase("projected-halls");

const collectionCounts = new Map();
for (const room of index) collectionCounts.set(room.collection, (collectionCounts.get(room.collection) ?? 0) + 1);

const garden = normalizeTufteModel({
  title: "L-Space",
  subtitle: "A living projection of the Lenticule Science knowledge forest.",
  eyebrow: "Authenticated digital garden",
  revision: release,
  tiles: [
    {
      id: "catalogue-atlas",
      role: "now",
      span: 8,
      title: "Catalogue atlas",
      content: `${index.length.toLocaleString()} rooms arranged in their deterministic TUFTE catalogue positions.`,
      view: "atlas",
    },
    {
      id: "vault-measures",
      role: "aside",
      span: 4,
      title: "Vault measures",
      content: `${wing.world.doors.length.toLocaleString()} doors · ${wing.world.cards.length.toLocaleString()} study cards · ${wing.world.halls.length.toLocaleString()} halls`,
      view: "measures",
    },
    {
      id: "halls",
      role: "standard",
      span: 6,
      title: "Halls",
      content: `${halls.length.toLocaleString()} concept halls, ${hallsDocument.counts.stable.toLocaleString()} of them rigid.`,
      view: "halls",
    },
    ...[...collectionCounts.entries()]
      .filter(([id]) => id.startsWith("services/"))
      .sort((left, right) => right[1] - left[1] || left[0].localeCompare(right[0]))
      .map(([collectionId, count]) => ({
        id: `collection-${digest(collectionId).slice(0, 12)}`,
        role: "standard",
        span: count > 1000 ? 6 : 4,
        title: collectionTitle(collectionId),
        content: `${count.toLocaleString()} rooms`,
        view: "collection",
        collectionId,
        count,
      })),
  ],
});

// The anonymous surface: fixed vocabulary, aggregate counts, and whatever rooms
// opted in. It never carries a title or summary from an authenticated room.
const surface = {
  schemaVersion: "l-space-surface/v1",
  title: vault.title,
  baseUrl: vault.baseUrl,
  vocabulary: vault.vocabulary,
  release,
  generatedAt,
  policy: lSpaceSurfacePolicy,
  counts: { publicRooms: publicIndex.length },
  invitation: publicIndex.length === 0
    ? "L-Space is open to its readers. No room has been published to the anonymous surface yet."
    : `${publicIndex.length.toLocaleString()} rooms are readable without an account.`,
};

const feedItems = publicIndex
  .map((entry) => {
    const room = publicRooms.find((candidate) => candidate.id === entry.id);
    const published = rfc3339(room?.dateCreated ?? room?.frontmatter?.["date-created"]);
    return published === null ? null : {
      id: `${vault.baseUrl}/#/room/${entry.key}`,
      url: `${vault.baseUrl}/#/room/${entry.key}`,
      title: entry.title,
      summary: entry.summary,
      published,
      tags: entry.space.semanticPosition.tags ?? [],
    };
  })
  .filter(Boolean)
  .sort((left, right) => right.published.localeCompare(left.published));

const feeds = projectWebFeedArtifacts({
  channel: {
    title: "L-Space",
    homePageUrl: `${vault.baseUrl}/`,
    description: "Published rooms from the Lenticule Science knowledge garden.",
    language: "en",
  },
  items: feedItems,
  updated: generatedAt,
  paths: { rss: "feed.xml", atom: "feed.atom", json: "feed.json" },
});
observeBuildPhase("projected-public-surface");

const manifest = {
  schemaVersion: "l-space-cloud-release/v1",
  release,
  sourceRevision: process.env.GITHUB_SHA ?? process.env.LENTICULE_SCIENCE_SOURCE_REVISION ?? null,
  generatedAt,
  vaultSchemaVersion: vault.schemaVersion,
  title: vault.title,
  baseUrl: vault.baseUrl,
  counts: {
    rooms: wing.world.rooms.length,
    publicRooms: publicIndex.length,
    doors: wing.world.doors.length,
    halls: wing.world.halls.length,
    projectedHalls: halls.length,
    cards: wing.world.cards.length,
    warnings: wing.world.warnings.length,
  },
  index: "/api/v1/vault/index",
  garden: "/api/v1/vault/garden",
  halls: "/api/v1/vault/halls",
  surface: "/api/v1/surface",
  publicIndex: "/api/v1/public/index",
  roomTemplate: "/api/v1/vault/rooms/{sha256-room-id}",
  publicRoomTemplate: "/api/v1/public/rooms/{sha256-room-id}",
};

await Promise.all([
  writeFile(resolve(vaultRoot, "manifest.json"), json(manifest)),
  writeFile(resolve(viewRoot, "garden.json"), json(garden)),
  writeFile(resolve(viewRoot, "halls.json"), json(hallsDocument)),
  writeFile(resolve(publicRoot, "surface.json"), json(surface)),
  writeFile(resolve(publicRoot, "index.json"), json({
    schemaVersion: "l-space-public-index/v1",
    release,
    rooms: publicIndex,
  })),
  ...feeds.artifacts.map((artifact) => writeFile(resolve(publicRoot, artifact.path), artifact.body)),
]);
observeBuildPhase("wrote-release");

console.log(canonicalStringify(manifest));
