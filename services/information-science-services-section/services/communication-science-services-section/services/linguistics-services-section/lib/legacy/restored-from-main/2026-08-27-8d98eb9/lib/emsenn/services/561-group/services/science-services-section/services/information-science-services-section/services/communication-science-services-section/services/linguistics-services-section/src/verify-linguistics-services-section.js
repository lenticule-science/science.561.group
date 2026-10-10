#!/usr/bin/env node

import { createHash } from "node:crypto";
import { existsSync, readFileSync } from "node:fs";
import { join, resolve } from "node:path";
import { fileURLToPath } from "node:url";

import { parseLeaderMessage } from "./parse-leader-message.js";

const ROOT = resolve(fileURLToPath(new URL("..", import.meta.url)));
const BLOBS = [
  "28/28bdjBPXLwdp4SgcKU1V-ct-Pup44fiD7rd9sRlFr6w.rmn.cbor",
  "BC/BCIruVGy-c8bXa0h3xzjIgzTzQNdw_TgbvmC9LDDq_U.rmn.cbor",
  "fI/fI1IBmuiuloHDEZYyFMT6sWD_50-AjSPlVd9iteYNn4.rmn.cbor",
  "jq/jqvIvR9LOTM1zdAqeq-9xbViPkKwfSxbAww2KJUvLDs.rmn.cbor",
  "lJ/lJSdWn3DSDJ_vpCwH2ievmOOPWkwqnJHoymz5my6JWc.rmn.cbor",
];
const assert = (condition, message) => { if (!condition) throw new Error(message); };

export function verify() {
  const pkg = JSON.parse(readFileSync(join(ROOT, "package.json"), "utf8"));
  assert(pkg.dependencies["@lenticule-science/communicating"] === "0.0.4", "communicating provider is not pinned");
  assert(pkg.dependencies["@lenticule-science/english-language-algebra"] === "0.1.5", "default English fiber is not pinned");
  assert(!Object.keys(pkg.dependencies).some((name) => /runtime|rdf|cbor-codec/u.test(name)), "root retains a deprecated runtime or RDF custody edge");
  const allowedDependencies = new Set(["@lenticule-science/communicating", "@lenticule-science/english-language-algebra", "@red-cup-engineering/relational-value-graph-service", "@red-cup-engineering/semantic-content-identify-service", "@red-cup-engineering/semantic-record-journal-service"]);
  assert(Object.keys(pkg.dependencies).every((name) => allowedDependencies.has(name)), "package dependency allowlist widened");
  for (const source of ["parse-leader-message.js", "contract-leader-message-parsing.js", "legacy-linguistics-relational-wire.js"]) {
    const text = readFileSync(join(ROOT, "src", source), "utf8");
    assert(!/(?:API[_-]?KEY|CLIENT[_-]?SECRET|PASSWORD|AUTHORIZATION)/iu.test(text), `source contains a secret-shaped capability: ${source}`);
    const urls = text.match(/https?:\/\/[^\s"']+/gu) ?? [];
    assert(urls.every((url) => url === "https://www.w3.org/ns/activitystreams"), `source contains an undeclared network target: ${source}`);
  }
  for (const relative of BLOBS) {
    const bytes = readFileSync(join(ROOT, "data/rmn/sha-256", relative));
    const expected = relative.split("/").at(-1).replace(".rmn.cbor", "");
    assert(createHash("sha256").update(bytes).digest("base64url") === expected, `legacy blob drifted: ${relative}`);
  }
  const fixture = "The Leader can switch from Ming Daoism to semiosis; SHP must not block the service.";
  const first = parseLeaderMessage(fixture); const second = parseLeaderMessage(fixture);
  assert(first.id === second.id, "repeat parsing is not deterministic");
  assert(first.source.text === fixture && first.forest.text === fixture, "parse does not preserve source text");
  assert(first.ambiguity.obstructions.length > 0 && first.repairObligations.length > 0, "parse omits ambiguity or repair obligations");
  assert(first.language.fiber !== first.language.contentToken, "declared English fiber was confused with content identity");
  return { ok: true, node: "linguistics-services-section", sourcePreserved: true, candidateOnly: true, legacyBlobsVerified: BLOBS.length, publishedLegacyBlobs: false };
}

try { process.stdout.write(`${JSON.stringify(verify(), null, 2)}\n`); }
catch (error) { process.stderr.write(`verify-linguistics-services-section: ${error instanceof Error ? error.message : String(error)}\n`); process.exitCode = 1; }
