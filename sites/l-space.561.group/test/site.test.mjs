// Exercise the current L-Space FeltOS companion directly. This is deliberately
// not a static-site-publisher/VICTOR test: src/site.mjs is the deployable
// application and VaultMaze owns the live room projection.
import assert from "node:assert/strict";
import { mkdtemp, mkdir, rm, writeFile } from "node:fs/promises";
import { join } from "node:path";
import test from "node:test";
import { startNativeApplication } from "@red-cup-engineering/computer-web-server/native-application";

import {
  GROUP_ROOT,
  admissionProviders,
  lSpaceApplication,
  lSpacePublicRoute,
  lSpaceSectionPath,
} from "../src/site.mjs";

async function scienceFixture(t) {
  // lSpaceSectionPath intentionally requires a root inside the 561 Group. Keep
  // the fixture inside that boundary so the test exercises the same invariant
  // rather than introducing a test-only path exception.
  const root = await mkdtemp(join(GROUP_ROOT, ".l-space-site-test-"));
  const stateDir = await mkdtemp(join(GROUP_ROOT, ".l-space-state-test-"));
  t.after(() => Promise.all([
    rm(root, { recursive: true, force: true }),
    rm(stateDir, { recursive: true, force: true }),
  ]));

  await mkdir(join(root, "content"), { recursive: true });
  await mkdir(join(root, "legacy"), { recursive: true });
  await writeFile(join(root, "content", "welcome.md"), `---
title: Welcome
description: A public fixture room.
date-created: 2026-10-05
visibility: public
---

The open door.
`);
  await writeFile(join(root, "content", "secret.md"), `---
title: Secret
description: An authenticated fixture room.
date-created: 2026-10-05
---

For admitted readers only.
`);
  await writeFile(join(root, "legacy", "old.md"), `---
title: Old
description: Custody, not a room.
date-created: 2026-10-05
---

Historical custody.
`);

  return { root, stateDir };
}

async function startFixture(t) {
  const { root, stateDir } = await scienceFixture(t);
  const environment = {
    LSPACE_ROOT: root,
    LSPACE_STATE_DIR: stateDir,
    LSPACE_NOTEBOOK_BUCKETS: "false",
    LSPACE_WING: "l-space-test",
    PUBLIC_BASE_URL: "https://l-space.test",
  };
  const app = await lSpaceApplication(environment);
  const server = await startNativeApplication(app, { host: "127.0.0.1", port: 0 });
  t.after(() => server.close());
  const local = (path, init = {}) =>
    fetch(`http://127.0.0.1:${server.port}${path}`, {
      redirect: "manual",
      ...init,
      headers: { host: "l-space.test", ...(init.headers ?? {}) },
    });

  // Native listeners can briefly refuse the first loopback connection.
  for (
    let attempt = 0;
    attempt < 50 && !(await local("/healthz").then((response) => response.ok, () => false));
    attempt += 1
  ) {
    await new Promise((resolve) => setTimeout(resolve, 20));
  }
  return { local, root };
}

test("the companion fails closed when no sign-in provider is configured", () => {
  assert.deepEqual(admissionProviders({}), {});
  assert.equal(lSpacePublicRoute("/healthz", "GET"), true);
  assert.equal(lSpacePublicRoute("/mcp", "POST"), true, "MCP performs its own OAuth admission");
});

test("a garden root must remain inside the 561 Group source boundary", () => {
  assert.throws(() => lSpaceSectionPath("/tmp/not-the-561-group"), /outside the 561 Group/u);
});

test("the current companion exposes public rooms while private and custody material remain closed", async (t) => {
  const { local } = await startFixture(t);

  const publicIndexResponse = await local("/vault/public/index.json");
  assert.equal(publicIndexResponse.status, 200);
  const publicIndex = await publicIndexResponse.json();
  assert.deepEqual(publicIndex.rooms.map((room) => room.id), ["content/welcome.md"]);

  const publicRoom = await local(`/vault/public/rooms/${publicIndex.rooms[0].key}.json`);
  assert.equal(publicRoom.status, 200);

  for (const path of [
    "/vault/index.json",
    "/vault/manifest.json",
    "/vault/views/garden.json",
    "/api/v1/me",
    "/api/v1/reviews",
  ]) {
    const refused = await local(path);
    assert.equal(refused.status, 401, `${path} must refuse an anonymous reader`);
    assert.deepEqual(await refused.json(), { error: "access-required" });
  }

  const privateGuess = await local("/content/secret/");
  assert.notEqual(privateGuess.status, 200, "an ordinary-looking private path must not bypass admission");
  const legacyGuess = await local("/legacy/old/");
  assert.notEqual(legacyGuess.status, 200, "excluded custody material must not become a public document");
});

test("the current public room index carries the ordinary route already derived by VaultMaze", async (t) => {
  const { local } = await startFixture(t);
  const publicIndex = await (await local("/vault/public/index.json")).json();
  assert.equal(publicIndex.rooms.length, 1);
  assert.equal(typeof publicIndex.rooms[0].route, "string");
  assert.ok(publicIndex.rooms[0].route.startsWith("/"));
  assert.notEqual(publicIndex.rooms[0].route.includes("#"), true);
});
