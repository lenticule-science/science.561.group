import assert from "node:assert/strict";
import test from "node:test";

import { handleMcpRequest } from "../scripts/serve-mcp.mjs";
import { observeLSpaceRelease, traverseLSpaceRoom } from "../src/release-observation.mjs";

test("L-Space owns its immutable release observation", () => {
  const observed = observeLSpaceRelease({ query: "absurd", limit: 3 });
  assert.equal(observed.type, "LSpaceReleaseObservation");
  assert.ok(observed.returned <= 3);
  assert.match(observed.release, /^[0-9a-f]{64}$/u);
});

test("L-Space searches ordinary multi-word questions without requiring every word", () => {
  const observed = observeLSpaceRelease({ query: "knowledge graph RDF SPARQL MCP", limit: 8 });
  assert.ok(observed.returned > 0);
  assert.equal(observed.filters.match, "any");
  assert.ok(observed.rooms.every(({ search }) => search.evidence.length > 0));
});

test("L-Space traverses an indexed room through its own release", () => {
  const observed = observeLSpaceRelease({ query: "absurd", limit: 1 });
  assert.equal(observed.returned, 1);
  const traversed = traverseLSpaceRoom({ roomId: observed.rooms[0].id, limit: 2, bodyCharacterLimit: 80 });
  assert.equal(traversed.type, "LSpaceRoomTraversal");
  assert.equal(traversed.room.id, observed.rooms[0].id);
  assert.ok(traversed.returnedDoorCount <= 2);
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
