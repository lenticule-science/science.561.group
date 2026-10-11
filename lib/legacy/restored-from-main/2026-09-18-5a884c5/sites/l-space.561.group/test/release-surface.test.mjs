/**
 * Guards on a real compiled release, not on the intent of one.
 *
 * The unit tests prove `roomVisibility` is fail-closed. These prove the builder
 * actually honoured it: that the tree an anonymous reader can address holds
 * nothing but rooms which opted in. Skipped when `dist/` has not been built,
 * because the release is a build product and is not committed.
 */
import assert from "node:assert/strict";
import { readFile, readdir, stat } from "node:fs/promises";
import test from "node:test";
import { resolve } from "node:path";

const distRoot = resolve(import.meta.dirname, "..", "dist");
const built = await stat(resolve(distRoot, "vault", "manifest.json")).then(() => true, () => false);
const readJson = async (...parts) => JSON.parse(await readFile(resolve(distRoot, ...parts), "utf8"));

test("the public index lists only rooms that opted into the anonymous surface", { skip: !built }, async () => {
  const publicIndex = await readJson("vault", "public", "index.json");
  assert.equal(publicIndex.schemaVersion, "l-space-public-index/v1");
  for (const room of publicIndex.rooms) {
    assert.equal(room.visibility, "public", `${room.id} must not appear in the public index`);
  }
});

test("every room file in the public tree is a public room", { skip: !built }, async () => {
  const publicRoomRoot = resolve(distRoot, "vault", "public", "rooms");
  const entries = await readdir(publicRoomRoot).catch(() => []);
  for (const entry of entries) {
    const detail = JSON.parse(await readFile(resolve(publicRoomRoot, entry), "utf8"));
    assert.equal(detail.visibility, "public", `${entry} must not be served anonymously`);
  }
  const publicIndex = await readJson("vault", "public", "index.json");
  assert.equal(entries.length, publicIndex.rooms.length, "public room files and public index must agree");
});

test("the anonymous surface descriptor carries no corpus content", { skip: !built }, async () => {
  const surface = await readJson("vault", "public", "surface.json");
  const authenticated = await readJson("vault", "index.json");
  assert.equal(surface.schemaVersion, "l-space-surface/v1");
  assert.equal(surface.counts.publicRooms, (await readJson("vault", "public", "index.json")).rooms.length);
  assert.equal(surface.policy.defaultRoomVisibility, "authenticated");

  // Nothing that names an authenticated room may appear in the anonymous descriptor.
  const serialized = JSON.stringify(surface);
  const authenticatedOnly = authenticated.rooms.filter((room) => room.visibility !== "public");
  for (const room of authenticatedOnly.slice(0, 400)) {
    assert.ok(!serialized.includes(room.id), `surface.json must not name ${room.id}`);
    if (room.title.length > 12) {
      assert.ok(!serialized.includes(room.title), `surface.json must not name "${room.title}"`);
    }
  }
});

test("the compiled release is addressed by content, not by corpus path", { skip: !built }, async () => {
  const manifest = await readJson("vault", "manifest.json");
  assert.match(manifest.release, /^[a-f0-9]{64}$/u);
  assert.equal(manifest.baseUrl, "https://l-space.561.group");
  assert.equal(manifest.counts.publicRooms, (await readJson("vault", "public", "index.json")).rooms.length);
  assert.ok(manifest.counts.rooms > 0, "a release with no rooms is not a release");
});
