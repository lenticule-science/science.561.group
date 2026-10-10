import { readDeclaredRelationLedger } from "@red-cup-engineering/geode/declared-relations";

const RELEASE_ID = /^[0-9a-f]{64}$/u;

export const L_SPACE_GRAPH_ARTIFACT_SCHEMA = "l-space-release-graph/v1";

export async function projectLSpaceRelationLedger({ root, rooms } = {}) {
  if (typeof root !== "string" || root === "") throw new TypeError("root is required");
  if (!Array.isArray(rooms)) throw new TypeError("rooms must be an array");
  return readDeclaredRelationLedger({ root, paths: rooms.map(({ id }) => id) });
}

function strings(value) {
  if (typeof value === "string") return value.trim() === "" ? [] : [value.trim()];
  if (Array.isArray(value)) return value.flatMap(strings);
  return [];
}

function graphEdge(door) {
  return Object.freeze({
    sourcePath: door.from,
    predicate: `urn:l-space:door:${door.weight}`,
    kind: `urn:l-space:door:${door.weight}`,
    target: door.reason,
    targetPath: door.to,
    status: "resolved",
    evidence: Object.freeze({
      kind: "l-space.compiled-door",
      weight: door.weight,
      reason: door.reason,
    }),
  });
}

export function projectLSpaceReleaseGraph({ release, generatedAt, wing, ledger } = {}) {
  if (!RELEASE_ID.test(release ?? "")) throw new TypeError("release must be a SHA-256 hex identity");
  if (typeof generatedAt !== "string" || Number.isNaN(Date.parse(generatedAt))) throw new TypeError("generatedAt must be a timestamp");
  if (!Array.isArray(wing?.world?.rooms) || !Array.isArray(wing?.world?.doors)) throw new TypeError("wing must carry a compiled world");
  if (ledger?.type !== "GeodeDeclaredRelationLedger" || !Array.isArray(ledger.rows)) throw new TypeError("ledger must be a Geode declared-relation ledger");

  const documents = wing.world.rooms.map((room) => Object.freeze({
    path: room.id,
    title: room.title,
    aliases: Object.freeze(strings(room.aliases ?? room.frontmatter?.aliases ?? room.frontmatter?.alias)),
    keywords: Object.freeze(strings(room.frontmatter?.keywords ?? room.frontmatter?.tags)),
    headings: Object.freeze([]),
    properties: Object.freeze({ ...(room.frontmatter ?? {}) }),
  }));
  const edges = wing.world.doors.map(graphEdge);
  const snapshot = Object.freeze({
    type: "GeodeWorkspaceSnapshot",
    schemaVersion: "geode-workspace/v1",
    observedAt: generatedAt,
    region: "",
    excludes: Object.freeze([]),
    scanned: documents.length,
    excluded: 0,
    available: documents.length,
    truncated: false,
    documents: Object.freeze(documents),
    graph: Object.freeze({
      nodes: Object.freeze(documents.map(({ path }) => path)),
      edges: Object.freeze(edges),
      externalUrls: Object.freeze([]),
      diagnostics: Object.freeze([...(wing.world.warnings ?? [])]),
      derivation: Object.freeze({ kind: "l-space.compiled-world", release }),
    }),
  });
  return Object.freeze({
    schemaVersion: L_SPACE_GRAPH_ARTIFACT_SCHEMA,
    release,
    generatedAt,
    counts: Object.freeze({
      documents: documents.length,
      edges: edges.length,
      relationRows: ledger.rows.length,
      diagnostics: snapshot.graph.diagnostics.length + ledger.defects.length,
    }),
    snapshot,
    ledger,
  });
}

export function validateLSpaceReleaseGraph(artifact, { release, roomCount } = {}) {
  if (artifact?.schemaVersion !== L_SPACE_GRAPH_ARTIFACT_SCHEMA) throw new TypeError("L-Space graph artifact has an unsupported schema");
  if (!RELEASE_ID.test(artifact.release ?? "") || artifact.release !== release) throw new TypeError("L-Space graph artifact does not match the release manifest");
  if (artifact.snapshot?.type !== "GeodeWorkspaceSnapshot" || !Array.isArray(artifact.snapshot.documents) || !Array.isArray(artifact.snapshot.graph?.edges)) {
    throw new TypeError("L-Space graph artifact has an invalid GEODE snapshot");
  }
  if (artifact.ledger?.type !== "GeodeDeclaredRelationLedger" || !Array.isArray(artifact.ledger.rows)) throw new TypeError("L-Space graph artifact has an invalid relation ledger");
  if (roomCount !== undefined && artifact.snapshot.documents.length !== roomCount) throw new TypeError("L-Space graph artifact and room index disagree about the room count");
  return artifact;
}
