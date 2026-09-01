import assert from "node:assert/strict";
import { mkdir, mkdtemp, rm, writeFile } from "node:fs/promises";
import { tmpdir } from "node:os";
import { dirname, join } from "node:path";
import test from "node:test";
import { indexConcepts, projectConcept } from "@red-cup-engineering/geode/concept-index";

import {
  projectLSpaceRelationLedger,
  projectLSpaceReleaseGraph,
  validateLSpaceReleaseGraph,
} from "../src/release-graph-artifact.mjs";

const release = "a".repeat(64);
const ledger = Object.freeze({
  type: "GeodeDeclaredRelationLedger",
  schemaVersion: "geode-declared-relations/v1",
  rows: Object.freeze([{ e: "one.md", a: "declares-keyword", v: "model", t: "witness" }]),
  documents: 1,
  scanned: 2,
  unnamed: 0,
  defects: Object.freeze([]),
});
const wing = Object.freeze({ world: Object.freeze({
  rooms: Object.freeze([
    Object.freeze({ id: "one.md", title: "One", aliases: [], frontmatter: { tags: ["first"] } }),
    Object.freeze({ id: "two.md", title: "Two", aliases: [], frontmatter: {} }),
  ]),
  doors: Object.freeze([Object.freeze({ from: "one.md", to: "two.md", weight: "hard", reason: "declared link" })]),
  warnings: Object.freeze([]),
}) });

test("the release ledger derives compound keywords, reverse backlinks, and no sibling relations", async (t) => {
  const root = await mkdtemp(join(tmpdir(), "l-space-release-ledger-"));
  t.after(() => rm(root, { recursive: true, force: true }));
  const paths = {
    model: "services/content/text/glossary/terms/model.md",
    bamboo: "services/example/content/text/glossary/terms/bamboo.md",
    siblingOperation: "services/other/content/text/glossary/terms/operation.md",
  };
  const carriers = new Map([
    [paths.model, "---\nname: Model\n---\n\nA model is a purpose-bounded representation used to answer specified questions about what it represents. Its omissions and transformations are part of its engineering contract, so a model is judged against its intended use rather than by resemblance alone.\n"],
    [paths.bamboo, "---\nname: BAMBOO\nkeywords: model, operation\n---\n\nBAMBOO is a compound engineering term whose declared constituents are carried only by its keywords. This fixture makes no reciprocal claim in either primitive term.\n"],
    [paths.siblingOperation, "---\nname: Operation\n---\n\nAn operation is an admitted transformation from specified inputs and state to specified outputs and state. This sibling definition must not enter another service's glossary scope.\n"],
  ]);
  for (const [path, text] of carriers) {
    await mkdir(dirname(join(root, path)), { recursive: true });
    await writeFile(join(root, path), text);
  }
  const rooms = [...carriers].map(([id]) => ({ id, title: id, frontmatter: {} }));
  const projected = await projectLSpaceRelationLedger({ root, rooms });
  assert.equal(projected.scanned, 3);
  assert.equal(projected.documents, 1);
  assert.deepEqual(projected.rows.map(({ e, a, v }) => ({ e, a, v })), [{
    e: paths.bamboo,
    a: "declares-keyword",
    v: "model",
  }]);
  assert.deepEqual(projected.unresolved, [{
    path: paths.bamboo,
    keyword: "operation",
    reason: "not-found-in-current-or-ancestor-scope",
  }]);

  const reading = projectConcept(indexConcepts(projected.rows), "model");
  assert.deepEqual(reading.keywordBacklinks, [paths.bamboo]);
});

test("the compiled graph artifact carries the same immutable release as search", () => {
  const artifact = projectLSpaceReleaseGraph({ release, generatedAt: "2026-08-31T12:00:00.000Z", wing, ledger });
  assert.equal(validateLSpaceReleaseGraph(artifact, { release, roomCount: 2 }), artifact);
  assert.equal(artifact.snapshot.documents.length, 2);
  assert.deepEqual(artifact.snapshot.graph.edges[0], {
    sourcePath: "one.md",
    predicate: "urn:l-space:door:hard",
    kind: "urn:l-space:door:hard",
    target: "declared link",
    targetPath: "two.md",
    status: "resolved",
    evidence: { kind: "l-space.compiled-door", weight: "hard", reason: "declared link" },
  });
  assert.throws(() => validateLSpaceReleaseGraph(artifact, { release: "b".repeat(64), roomCount: 2 }), /does not match/u);
  assert.throws(() => validateLSpaceReleaseGraph(artifact, { release, roomCount: 3 }), /room index disagree/u);
});
