import assert from "node:assert/strict";
import { mkdtemp, rm } from "node:fs/promises";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { pathToFileURL } from "node:url";
import { test } from "node:test";
import { buildBrowserKernel } from "../scripts/build-browser-kernel.mjs";

test("browser kernel projection strips source modules into importable ESM", async () => {
  const outputDirectory = await mkdtemp(join(tmpdir(), "weiqi-browser-kernel-"));
  try {
    const { moduleCount } = await buildBrowserKernel(outputDirectory);
    assert.equal(moduleCount, 9);

    const events = await import(pathToFileURL(join(outputDirectory, "events.mjs")).href);
    assert.equal(typeof events.annotateMove, "function");
    assert.equal(typeof events.annotatePass, "function");
  } finally {
    await rm(outputDirectory, { recursive: true, force: true });
  }
});
