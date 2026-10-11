import assert from "node:assert/strict";
import { spawn } from "node:child_process";
import { mkdtemp, readFile, rm, writeFile } from "node:fs/promises";
import { tmpdir } from "node:os";
import { join } from "node:path";
import test from "node:test";
import { fileURLToPath } from "node:url";

const script = fileURLToPath(new URL("../scripts/build-mcp-runtime.mjs", import.meta.url));

test("build:mcp refuses an existing operator output without deleting it", async () => {
  const output = await mkdtemp(join(tmpdir(), "l-space-mcp-existing-output-"));
  const sentinel = join(output, "must-remain.txt");
  try {
    await writeFile(sentinel, "preserved\n");
    const child = spawn(process.execPath, [script], {
      env: { ...process.env, L_SPACE_MCP_RUNTIME_ROOT: output },
      stdio: "ignore",
    });
    const status = await new Promise((resolve, reject) => {
      child.once("error", reject);
      child.once("exit", resolve);
    });
    assert.notEqual(status, 0);
    assert.equal(await readFile(sentinel, "utf8"), "preserved\n");
  } finally { await rm(output, { recursive: true, force: true }); }
});
