import test from "node:test";
import assert from "node:assert/strict";

test("root and writing boundaries import independently", async () => {
  const writing = await import("../../dist/src/writing.mjs");
  const root = await import("../../dist/src/index.mjs");
  assert.equal(typeof writing.define, "function");
  assert.equal(typeof root.action, "function");
});
