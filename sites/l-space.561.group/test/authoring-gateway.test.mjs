import assert from "node:assert/strict";
import test from "node:test";
import { authoringResponse } from "../lib/cloudflare/src/worker.mjs";

const AUTHOR_EMAIL = "morgan.sennhauser@gmail.com";
const origin = "https://l-space.561.group";

function request(path, init) {
  return new Request(`${origin}${path}`, init);
}

function binding() {
  let revision = "sha256:old";
  return {
    async search(query) { return [{ path: "notes/example.md", title: query || "Example" }]; },
    async read(path) {
      if (path !== "notes/example.md") throw new RangeError("unknown document");
      return { type: "OpalDocumentReading", path, title: "Example", markdown: "# Example\n", revision, html: "<h1>Example</h1>" };
    },
    async editorDocument(path) { return { schemaVersion: "vaultmaze-editor-document/v1", title: path }; },
    async replace({ path, markdown, expectedRevision }) {
      if (path !== "notes/example.md") throw new RangeError("unknown document");
      if (expectedRevision !== revision) {
        const error = new Error("stale"); error.name = "MarkdownFileRevisionConflict"; error.currentRevision = revision; throw error;
      }
      revision = "sha256:new";
      return { type: "OpalMarkdownWriteReceipt", path, revision, changed: markdown !== "# Example\n" };
    },
  };
}

function session(email = AUTHOR_EMAIL, provider = "google") {
  return { provider, email, subjectHash: "sha256:subject" };
}

test("VaultMaze authoring is Google-only for Morgan and separate from reader admission", async () => {
  const env = { LSPACE_EDITOR_DISCORD_USER_IDS: "681333902740160598", VAULTMAZE_AUTHORING: binding() };
  for (const reader of [session(undefined, "discord"), session("someone.else@gmail.com"), session("morgan.sennhauser@gmail.com", "discord")]) {
    const response = await authoringResponse(request("/api/v1/vaultmaze/editor/search?q=Example"), env, new URL(`${origin}/api/v1/vaultmaze/editor/search?q=Example`), reader);
    assert.equal(response.status, 403);
    assert.deepEqual(await response.json(), { error: "authoring-authority-required" });
  }
});

test("an admitted curator can search, open the TUFTE projection, and replace one current revision", async () => {
  const env = { VAULTMAZE_AUTHORING: binding() };
  const identity = session("  Morgan.Sennhauser@GMAIL.com  ");
  const searched = await authoringResponse(request("/api/v1/vaultmaze/editor/search?q=Example"), env, new URL(`${origin}/api/v1/vaultmaze/editor/search?q=Example`), identity);
  assert.equal(searched.status, 200);
  assert.equal((await searched.json()).documents[0].path, "notes/example.md");
  const opened = await authoringResponse(request("/api/v1/vaultmaze/editor/note?path=notes%2Fexample.md"), env, new URL(`${origin}/api/v1/vaultmaze/editor/note?path=notes%2Fexample.md`), identity);
  const opening = await opened.json();
  assert.equal(opening.document.revision, "sha256:old");
  assert.equal(opening.editorDocument.schemaVersion, "vaultmaze-editor-document/v1");
  const saved = await authoringResponse(request("/api/v1/vaultmaze/editor/action", {
    method: "POST", headers: { origin, "content-type": "application/json" },
    body: JSON.stringify({ action: "vaultmaze:replace-document/v1", path: "notes/example.md", markdown: "# Changed\n", revision: "sha256:old" }),
  }), env, new URL(`${origin}/api/v1/vaultmaze/editor/action`), identity);
  assert.equal(saved.status, 200);
  assert.equal((await saved.json()).receipt.revision, "sha256:new");
  const stale = await authoringResponse(request("/api/v1/vaultmaze/editor/action", {
    method: "POST", headers: { origin, "content-type": "application/json" },
    body: JSON.stringify({ action: "vaultmaze:replace-document/v1", path: "notes/example.md", markdown: "# Stale\n", revision: "sha256:old" }),
  }), env, new URL(`${origin}/api/v1/vaultmaze/editor/action`), identity);
  assert.equal(stale.status, 409);
  assert.deepEqual(await stale.json(), { error: "revision-conflict", currentRevision: "sha256:new" });
});

test("authoring writes require the exact site origin and an admitted note path", async () => {
  const env = { VAULTMAZE_AUTHORING: binding() };
  const identity = session();
  const crossSite = await authoringResponse(request("/api/v1/vaultmaze/editor/action", {
    method: "POST", headers: { origin: "https://attacker.example", "content-type": "application/json" }, body: "{}",
  }), env, new URL(`${origin}/api/v1/vaultmaze/editor/action`), identity);
  assert.equal(crossSite.status, 403);
  const unknown = await authoringResponse(request("/api/v1/vaultmaze/editor/note?path=..%2Fsecret.md"), env, new URL(`${origin}/api/v1/vaultmaze/editor/note?path=..%2Fsecret.md`), identity);
  assert.equal(unknown.status, 404);
});
