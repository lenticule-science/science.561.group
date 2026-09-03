import assert from "node:assert/strict";
import { mkdir, mkdtemp, rm, writeFile } from "node:fs/promises";
import { tmpdir } from "node:os";
import { join } from "node:path";
import test from "node:test";

import { handleMcpRequest } from "../scripts/serve-mcp.mjs";
import { projectLSpaceReleaseGraph } from "../src/release-graph-artifact.mjs";
import { glossaryProvenanceOf, observeLSpaceRelease, traverseLSpaceRoom } from "../src/release-observation.mjs";

const release = "a".repeat(64);
const absurd = "services/philosophy/content/text/documents/absurd.md";
const endeavor = "services/philosophy/content/text/glossary/terms/endeavor.md";
const keys = Object.freeze({ absurd: "1".repeat(64), endeavor: "2".repeat(64) });
let releaseRoot;
let priorReleaseRoot;

function room(id, key, title, summary, frontmatter = {}) {
  return Object.freeze({ id, key, title, summary, kind: "note", collection: "services/philosophy", visibility: "authenticated", space: Object.freeze({ id }), frontmatter });
}

test.before(async () => {
  releaseRoot = await mkdtemp(join(tmpdir(), "l-space-release-observation-"));
  priorReleaseRoot = process.env.L_SPACE_RELEASE_ROOT;
  const rooms = Object.freeze([
    room(absurd, keys.absurd, "Absurd", "Absurd knowledge graph inquiry", { keywords: ["absurd", "knowledge"] }),
    room(endeavor, keys.endeavor, "Endeavor", "Endeavor grounds RDF SPARQL MCP work", { keywords: ["endeavor", "graph", "RDF", "SPARQL", "MCP"] }),
  ]);
  const wing = Object.freeze({ world: Object.freeze({ rooms, doors: Object.freeze([Object.freeze({ from: absurd, to: endeavor, weight: "hard", reason: "declared inquiry" })]), warnings: Object.freeze([]) }) });
  const ledger = Object.freeze({ type: "GeodeDeclaredRelationLedger", schemaVersion: "geode-declared-relations/v1", rows: Object.freeze([Object.freeze({ e: endeavor, a: "declares-keyword", v: "endeavor", t: "fixture" })]), documents: 1, scanned: 2, unnamed: 0, defects: Object.freeze([]) });
  const graph = projectLSpaceReleaseGraph({ release, generatedAt: "2026-09-02T00:00:00.000Z", wing, ledger });
  const manifest = Object.freeze({ schemaVersion: "l-space-cloud-release/v1", release, generatedAt: "2026-09-02T00:00:00.000Z", baseUrl: "https://l-space.561.group", vaultSchemaVersion: "vault/v1", counts: Object.freeze({ rooms: rooms.length }), victor: Object.freeze({}), graph: Object.freeze({ file: "graph.json" }) });
  const index = Object.freeze({ schemaVersion: "l-space-index/v1", vocabulary: Object.freeze({}), participation: Object.freeze({}), rooms });
  await mkdir(join(releaseRoot, "rooms"), { recursive: true });
  await Promise.all([
    writeFile(join(releaseRoot, "manifest.json"), JSON.stringify(manifest)), writeFile(join(releaseRoot, "index.json"), JSON.stringify(index)), writeFile(join(releaseRoot, "graph.json"), JSON.stringify(graph)),
    writeFile(join(releaseRoot, "rooms", `${keys.absurd}.json`), JSON.stringify({ schemaVersion: "l-space-room/v1", room: { ...rooms[0], body: "Absurd knowledge graph." }, doors: [{ direction: "outgoing", ...wing.world.doors[0] }], space: rooms[0].space, gate: null, cards: [] })),
    writeFile(join(releaseRoot, "rooms", `${keys.endeavor}.json`), JSON.stringify({ schemaVersion: "l-space-room/v1", room: { ...rooms[1], body: "Endeavor connects RDF SPARQL MCP." }, doors: [{ direction: "incoming", ...wing.world.doors[0] }], space: rooms[1].space, gate: null, cards: [] })),
  ]);
  process.env.L_SPACE_RELEASE_ROOT = releaseRoot;
});

test.after(async () => {
  if (priorReleaseRoot === undefined) delete process.env.L_SPACE_RELEASE_ROOT;
  else process.env.L_SPACE_RELEASE_ROOT = priorReleaseRoot;
  await rm(releaseRoot, { recursive: true, force: true });
});

test("L-Space owns its immutable release observation", () => {
  const observed = observeLSpaceRelease({ releaseRoot, query: "absurd", limit: 3 });
  assert.equal(observed.type, "LSpaceReleaseObservation");
  assert.ok(observed.returned <= 3);
  assert.equal(observed.release, release);
  assert.throws(() => observeLSpaceRelease({ releaseRoot: join(releaseRoot, "missing") }), /release is unavailable/u);
});

test("L-Space searches ordinary multi-word questions without requiring every word", () => {
  const observed = observeLSpaceRelease({ releaseRoot, query: "knowledge graph RDF SPARQL MCP", limit: 8 });
  assert.ok(observed.returned > 0);
  assert.equal(observed.filters.match, "any");
  assert.ok(observed.rooms.every(({ search }) => search.evidence.length > 0));
});

test("L-Space traverses an indexed room through its own release", () => {
  const observed = observeLSpaceRelease({ releaseRoot, query: "absurd", limit: 1 });
  assert.equal(observed.returned, 1);
  const traversed = traverseLSpaceRoom({ releaseRoot, roomId: observed.rooms[0].id, limit: 2, bodyCharacterLimit: 80 });
  assert.equal(traversed.type, "LSpaceRoomTraversal");
  assert.equal(traversed.room.id, observed.rooms[0].id);
  assert.equal(traversed.returnedDoorCount, 1);
});

test("glossary provenance names the ruling room for a term the house glossary defines", () => {
  const provenance = glossaryProvenanceOf("endeavor", { releaseRoot });
  assert.equal(provenance.ruled, true);
  assert.equal(provenance.room.id, endeavor);
  assert.match(provenance.statement, /^ruled term: glossary definition at /u);
});

test("glossary provenance is plain and negative for a name the glossary does not define", () => {
  const provenance = glossaryProvenanceOf("zzz-not-a-glossary-term-zzz", { releaseRoot });
  assert.equal(provenance.ruled, false);
  assert.equal(provenance.room, null);
  assert.match(provenance.statement, /^no glossary term file found for /u);
});

test("query_l_space_concept answers with glossary provenance alongside the declared-relation reading", async () => {
  const result = await handleMcpRequest({
    method: "tools/call",
    params: { name: "query_l_space_concept", arguments: { name: "endeavor" } },
  });
  assert.equal(result.structuredContent.type, "GeodeConceptReading");
  assert.equal(result.structuredContent.provenance.ruled, true);
});

test("the direct L-Space MCP face advertises release, concept, graph, and bounded SPARQL reading", async () => {
  const listed = await handleMcpRequest({ method: "tools/list" });
  assert.deepEqual(listed.tools.map(({ name }) => name), [
    "search_l_space",
    "observe_l_space_release",
    "traverse_l_space_room",
    "query_l_space_concept",
    "query_l_space_sparql_bgp",
    "observe_l_space_fae_graph",
    "query_l_space_fae_relations",
    "query_l_space_fae_entity",
    "observe_l_space_fae_diagnostics",
    "drew_catalog",
    "drew_relations",
    "drew_entity",
    "drew_project",
    "drew_explain",
    "drew_diagnostics",
  ]);
});
