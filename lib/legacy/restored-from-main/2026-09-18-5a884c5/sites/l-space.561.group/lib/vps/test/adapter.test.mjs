import assert from "node:assert/strict";
import { mkdtemp, rm, writeFile } from "node:fs/promises";
import { tmpdir } from "node:os";
import { join } from "node:path";
import test from "node:test";
import { applyMigrations, createAssetFetcher, createD1Adapter, createDatabase } from "../adapter.mjs";
import { loadEnvironment, startServer } from "../server.mjs";

test("the D1 adapter supports the Worker statement methods and batches atomically", async () => {
  const database = createDatabase(":memory:");
  database.exec("CREATE TABLE rows (id INTEGER PRIMARY KEY, value TEXT)");
  const d1 = createD1Adapter(database);
  await d1.prepare("INSERT INTO rows (value) VALUES (?)").bind("one").run();
  assert.deepEqual(await d1.prepare("SELECT value FROM rows WHERE id = ?").bind(1).first(), { value: "one" });
  assert.deepEqual((await d1.prepare("SELECT value FROM rows").all()).results, [{ value: "one" }]);
  await d1.batch([d1.prepare("INSERT INTO rows (value) VALUES (?)").bind("two")]);
  assert.equal((await d1.prepare("SELECT * FROM rows").all()).results.length, 2);
  database.close();
});

test("migrations apply once, including non-idempotent historical migration files", async () => {
  const directory = await mkdtemp(join(tmpdir(), "l-space-vps-"));
  const migrations = join(directory, "migrations");
  await (await import("node:fs/promises")).mkdir(migrations);
  await writeFile(join(migrations, "0001_initial.sql"), "CREATE TABLE persisted (value TEXT); INSERT INTO persisted VALUES ('one');");
  const database = createDatabase(join(directory, "state.sqlite"));
  await applyMigrations(database, migrations);
  await applyMigrations(database, migrations);
  assert.equal(database.prepare("SELECT count(*) AS count FROM persisted").get().count, 1);
  database.close();
  await rm(directory, { recursive: true, force: true });
});

test("asset fetcher serves static files, prevents traversal, and supplies SPA fallback", async () => {
  const directory = await mkdtemp(join(tmpdir(), "l-space-vps-"));
  await writeFile(join(directory, "index.html"), "shell");
  await writeFile(join(directory, "app.js"), "app");
  const assets = createAssetFetcher(directory);
  assert.equal(await (await assets.fetch(new Request("https://l-space.test/app.js"))).text(), "app");
  assert.equal(await (await assets.fetch(new Request("https://l-space.test/room/a"))).text(), "shell");
  assert.equal(await (await assets.fetch(new Request("https://l-space.test/%2e%2e/secret"))).text(), "shell");
  await rm(directory, { recursive: true, force: true });
});

test("environment files load without replacing explicit process environment", async () => {
  const directory = await mkdtemp(join(tmpdir(), "l-space-vps-"));
  const file = join(directory, "runtime.env");
  await writeFile(file, "# secret values are never logged\nSESSION_SECRET = 'from-file'\nPORT=9999\n");
  assert.deepEqual(await loadEnvironment(file, { PORT: "8787" }), { SESSION_SECRET: "from-file", PORT: "8787" });
  await rm(directory, { recursive: true, force: true });
});

test("the Node server delegates the public shell and health check to the Worker", async () => {
  const directory = await mkdtemp(join(tmpdir(), "l-space-vps-"));
  const dist = join(directory, "dist");
  await (await import("node:fs/promises")).mkdir(dist);
  await writeFile(join(dist, "index.html"), "<!doctype html><title>L-Space</title>");
  const app = await startServer({
    port: 0,
    env: {
      LSPACE_DATABASE_PATH: join(directory, "state", "l-space.sqlite"),
      LSPACE_DIST_DIRECTORY: dist,
      SESSION_SECRET: "test-session-secret-value",
    },
  });
  const { port } = app.server.address();
  const fetchLocal = async (path) => {
    let failure;
    for (let attempt = 0; attempt < 10; attempt += 1) {
      try { return await fetch(`http://127.0.0.1:${port}${path}`); }
      catch (error) { failure = error; await new Promise((accept) => setTimeout(accept, 25)); }
    }
    throw failure;
  };
  try {
    assert.match(await (await fetchLocal("/")).text(), /L-Space/u);
    assert.deepEqual(await (await fetchLocal("/healthz")).json(), { status: "ok" });
  } finally {
    await app.close();
  }
  await rm(directory, { recursive: true, force: true });
});
