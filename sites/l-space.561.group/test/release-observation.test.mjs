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

test("L-Space traverses an indexed room through its own release", () => {
  const observed = observeLSpaceRelease({ query: "absurd", limit: 1 });
  assert.equal(observed.returned, 1);
  const traversed = traverseLSpaceRoom({ roomId: observed.rooms[0].id, limit: 2, bodyCharacterLimit: 80 });
  assert.equal(traversed.type, "LSpaceRoomTraversal");
  assert.equal(traversed.room.id, observed.rooms[0].id);
  assert.ok(traversed.returnedDoorCount <= 2);
});

test("the direct L-Space MCP face advertises only L-Space reading", () => {
  const listed = handleMcpRequest({ method: "tools/list" });
  assert.deepEqual(listed.tools.map(({ name }) => name), ["observe_l_space_release", "traverse_l_space_room"]);
});
