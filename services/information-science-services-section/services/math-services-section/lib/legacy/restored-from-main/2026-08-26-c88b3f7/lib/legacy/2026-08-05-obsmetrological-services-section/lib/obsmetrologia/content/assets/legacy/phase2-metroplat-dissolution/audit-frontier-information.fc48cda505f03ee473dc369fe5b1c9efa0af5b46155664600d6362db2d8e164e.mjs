#!/usr/bin/env node

import { existsSync, mkdirSync, readFileSync, readdirSync, statSync, writeFileSync } from "node:fs";
import { basename, extname, join, relative, sep } from "node:path";

import { readLeanWorkspace } from "@emsenn/metroplat/integrations/lean";

const root = process.cwd();
const outDir = join(root, "sites", "docs", "coverage");
const informationJsonPath = join(outDir, "lean-frontier-information.json");
const informationMarkdownPath = join(outDir, "lean-frontier-information.md");
const legacyJsonPath = join(outDir, "lean-frontier-audit.json");
const legacyMarkdownPath = join(outDir, "lean-frontier-audit.md");
const blueprintPath = join(outDir, "blueprint-nodes.json");
const failOnTrust = process.argv.includes("--fail-on-trust");

const hardTrustCodes = new Set(["axiom", "constant", "opaque", "native_decide"]);
const baseBlueprintLabels = new Set(["def:mark", "def:utterance", "def:articulating"]);
const externalBlueprintPrefixes = ["mathlib:"];
const expectedAuditArtifacts = Object.freeze([
  "blueprint-nodes.json",
  "blueprint-nodes.tsv",
  "collatz-axiom-audit.json",
  "collatz-axiom-audit.md",
  "collatz-frontier-audit.json",
  "collatz-frontier-audit.md",
  "collatz-parent-gap-audit.json",
  "collatz-parent-gap-audit.md",
  "cross-surface-audit.json",
  "cross-surface-audit.md",
  "index.html",
  "lean-blueprint-weld.html",
  "lean-blueprint-weld.json",
  "lean-frontier-audit.json",
  "lean-frontier-audit.md",
  "lean-frontier-information.json",
  "lean-frontier-information.md",
]);

function rel(path) {
  return relative(root, path).replaceAll(sep, "/");
}

function htmlFree(value) {
  return String(value ?? "").replace(/\|/g, "\\|").replace(/\r?\n/g, " ");
}

function uniqueSorted(values) {
  return Object.freeze([...new Set(values)].sort((left, right) => left.localeCompare(right)));
}

function walkLean(fileOrDir) {
  if (!existsSync(fileOrDir)) return [];
  const entries = readdirSync(fileOrDir, { withFileTypes: true });
  const out = [];
  for (const entry of entries) {
    const path = join(fileOrDir, entry.name);
    if (entry.isDirectory()) {
      out.push(...walkLean(path));
    } else if (entry.isFile() && entry.name.endsWith(".lean")) {
      out.push(path);
    }
  }
  return out;
}

function leanFiles() {
  return uniqueSorted([
    ...(existsSync(join(root, "Obsmetrologia.lean")) ? [join(root, "Obsmetrologia.lean")] : []),
    ...walkLean(join(root, "Obsmetrologia")),
  ]);
}

function stripBlockAndLineComments(line, state) {
  let out = "";
  let index = 0;

  while (index < line.length) {
    const pair = line.slice(index, index + 2);

    if (state.blockDepth > 0) {
      if (pair === "/-") {
        state.blockDepth += 1;
        index += 2;
      } else if (pair === "-/") {
        state.blockDepth -= 1;
        index += 2;
      } else {
        out += " ";
        index += 1;
      }
      continue;
    }

    if (pair === "--") break;
    if (pair === "/-") {
      state.blockDepth += 1;
      out += "  ";
      index += 2;
      continue;
    }

    out += line[index] ?? "";
    index += 1;
  }

  return out;
}

const declarationPattern =
  /^\s*(?:@\[[^\]]*\]\s*)*(?:protected\s+|private\s+|noncomputable\s+|partial\s+|unsafe\s+)*(axiom|constant|opaque|theorem|lemma|def|abbrev|instance|inductive|structure|class)\s+([A-Za-z_][A-Za-z0-9_'.]*)/;

function qualifyName(name, namespaceStack) {
  if (name.includes(".") || namespaceStack.length === 0) return name;
  return `${namespaceStack.join(".")}.${name}`;
}

function readLeanFrontierSites(files) {
  const frontierSites = [];
  const trustSites = [];

  for (const file of files) {
    const lines = readFileSync(file, "utf8").split(/\r?\n/);
    const commentState = { blockDepth: 0 };
    const namespaceStack = [];
    let currentDeclaration = null;

    for (let index = 0; index < lines.length; index += 1) {
      const lineNo = index + 1;
      const code = stripBlockAndLineComments(lines[index] ?? "", commentState);
      const namespace = code.match(/^\s*namespace\s+([A-Za-z_][A-Za-z0-9_'.]*)/);
      if (namespace) {
        namespaceStack.push(namespace[1]);
        continue;
      }

      if (/^\s*end(?:\s+[A-Za-z_][A-Za-z0-9_'.]*)?\s*$/.test(code) && namespaceStack.length > 0) {
        namespaceStack.pop();
        continue;
      }

      const declaration = code.match(declarationPattern);
      if (declaration) {
        const name = declaration[2];
        currentDeclaration = {
          kind: declaration[1],
          name,
          qualifiedName: qualifyName(name, namespaceStack),
          file: rel(file),
          line: lineNo,
        };

        if (hardTrustCodes.has(declaration[1])) {
          trustSites.push({
            code: declaration[1],
            declaration: currentDeclaration,
            file: rel(file),
            line: lineNo,
            source: code.trim(),
          });
        }
      }

      if (/\bnative_decide\b/.test(code)) {
        trustSites.push({
          code: "native_decide",
          declaration: currentDeclaration,
          file: rel(file),
          line: lineNo,
          source: code.trim(),
        });
      }

      for (const match of code.matchAll(/\b(sorry|admit)\b/g)) {
        frontierSites.push({
          code: match[1],
          declaration: currentDeclaration,
          file: rel(file),
          line: lineNo,
          source: code.trim(),
        });
      }
    }
  }

  return {
    frontierSites: Object.freeze(frontierSites),
    sorrySites: Object.freeze(frontierSites.filter((site) => site.code === "sorry")),
    admitSites: Object.freeze(frontierSites.filter((site) => site.code === "admit")),
    trustSites: Object.freeze(trustSites),
  };
}

function readBlueprint() {
  if (!existsSync(blueprintPath)) {
    throw new Error(`missing ${rel(blueprintPath)}; run \`node scripts/blueprint-coverage.mjs\` first`);
  }
  return JSON.parse(readFileSync(blueprintPath, "utf8"));
}

function leanRefsForNode(node) {
  return String(node.lean ?? "")
    .split(",")
    .map((value) => value.trim())
    .filter(Boolean);
}

function countBy(values, key) {
  const out = {};
  for (const value of values) {
    const name = key(value) || "(none)";
    out[name] = (out[name] ?? 0) + 1;
  }
  return out;
}

function dependencyHeight(nodes) {
  const byLabel = new Map(nodes.filter((node) => node.label).map((node) => [node.label, node]));
  const memo = new Map();
  const visiting = new Set();

  function height(label) {
    if (memo.has(label)) return memo.get(label);
    if (visiting.has(label)) return 0;
    const node = byLabel.get(label);
    if (!node || node.uses.length === 0) {
      memo.set(label, 0);
      return 0;
    }
    visiting.add(label);
    const value = 1 + Math.max(0, ...node.uses.map((used) => height(used)));
    visiting.delete(label);
    memo.set(label, value);
    return value;
  }

  return Math.max(0, ...nodes.map((node) => node.label ? height(node.label) : 0));
}

function isExternalBlueprintLabel(label) {
  return externalBlueprintPrefixes.some((prefix) => label.startsWith(prefix));
}

function frontierGradient(nodes) {
  const byLabel = new Map(nodes.filter((node) => node.label).map((node) => [node.label, node]));
  const redNodes = nodes.filter((node) => node.status === "red");
  const incomingRedEdges = new Map();

  for (const node of redNodes) {
    for (const used of node.uses ?? []) {
      const usedNode = byLabel.get(used);
      if (usedNode?.status !== "red") continue;
      incomingRedEdges.set(used, (incomingRedEdges.get(used) ?? 0) + 1);
    }
  }

  const readings = redNodes.map((node) => {
    const uses = node.uses ?? [];
    const missingUses = [];
    const redUses = [];
    const greenUses = [];
    const baseUses = [];
    const externalUses = [];

    for (const used of uses) {
      if (baseBlueprintLabels.has(used)) {
        baseUses.push(used);
        continue;
      }
      if (isExternalBlueprintLabel(used)) {
        externalUses.push(used);
        continue;
      }
      const upstream = byLabel.get(used);
      if (!upstream) {
        missingUses.push(used);
      } else if (upstream.status === "red") {
        redUses.push(used);
      } else if (upstream.status === "green") {
        greenUses.push(used);
      }
    }

    const rootless = uses.length === 0 && !baseBlueprintLabels.has(node.label);
    const ready = !rootless && missingUses.length === 0 && redUses.length === 0;
    return Object.freeze({
      label: node.label,
      title: node.title,
      kind: node.kind,
      part: node.part,
      chapter: node.chapter,
      section: node.section,
      file: node.file,
      line: node.line,
      uses,
      greenUses: Object.freeze(greenUses),
      redUses: Object.freeze(redUses),
      missingUses: Object.freeze(missingUses),
      baseUses: Object.freeze(baseUses),
      externalUses: Object.freeze(externalUses),
      ready,
      rootless,
      unlocks: incomingRedEdges.get(node.label) ?? 0,
    });
  });

  const readyNodes = readings.filter((node) => node.ready);
  const blockedByRed = readings.filter((node) => node.redUses.length > 0);
  const dangling = readings.filter((node) => node.missingUses.length > 0);
  const rootless = readings.filter((node) => node.rootless);
  const candidates = [...readyNodes]
    .sort((left, right) =>
      right.unlocks - left.unlocks
      || left.uses.length - right.uses.length
      || String(left.label).localeCompare(String(right.label)))
    .slice(0, 20);

  return Object.freeze({
    counts: Object.freeze({
      redNodes: redNodes.length,
      ready: readyNodes.length,
      blockedByRed: blockedByRed.length,
      dangling: dangling.length,
      rootless: rootless.length,
      redDependencyEdges: readings.reduce((sum, node) => sum + node.redUses.length, 0),
      missingDependencyEdges: readings.reduce((sum, node) => sum + node.missingUses.length, 0),
      greenDependencyEdges: readings.reduce((sum, node) => sum + node.greenUses.length, 0),
      settledDependencyEdges: readings.reduce((sum, node) =>
        sum + node.greenUses.length + node.baseUses.length + node.externalUses.length, 0),
      readinessRatio: redNodes.length === 0 ? 1 : readyNodes.length / redNodes.length,
    }),
    candidates: Object.freeze(candidates),
    nodes: Object.freeze(readings),
  });
}

function byteEntropy(buffer) {
  if (buffer.length === 0) return 0;
  const counts = new Array(256).fill(0);
  for (const byte of buffer) counts[byte] += 1;
  return counts.reduce((sum, count) => {
    if (count === 0) return sum;
    const p = count / buffer.length;
    return sum - (p * Math.log2(p));
  }, 0);
}

function jsonShape(value) {
  const shape = {
    objects: 0,
    arrays: 0,
    strings: 0,
    numbers: 0,
    booleans: 0,
    nulls: 0,
    maxDepth: 0,
    keys: {},
  };
  const seen = new Set();

  function visit(node, depth) {
    shape.maxDepth = Math.max(shape.maxDepth, depth);
    if (node === null) {
      shape.nulls += 1;
      return;
    }
    if (Array.isArray(node)) {
      if (seen.has(node)) return;
      seen.add(node);
      shape.arrays += 1;
      for (const item of node) visit(item, depth + 1);
      return;
    }
    if (typeof node === "object") {
      if (seen.has(node)) return;
      seen.add(node);
      shape.objects += 1;
      for (const [key, item] of Object.entries(node)) {
        shape.keys[key] = (shape.keys[key] ?? 0) + 1;
        visit(item, depth + 1);
      }
      return;
    }
    if (typeof node === "string") shape.strings += 1;
    else if (typeof node === "number") shape.numbers += 1;
    else if (typeof node === "boolean") shape.booleans += 1;
  }

  visit(value, 0);
  return Object.freeze({
    ...shape,
    keys: Object.freeze(Object.fromEntries(Object.entries(shape.keys)
      .sort(([left], [right]) => left.localeCompare(right)))),
  });
}

function auditArtifactRole(id) {
  if (id.startsWith("blueprint-nodes")) return "blueprint-claim-site-inventory";
  if (id.startsWith("lean-blueprint-weld")) return "lean-blueprint-weld";
  if (id.startsWith("lean-frontier-information")) return "frontier-information-carrier";
  if (id.startsWith("lean-frontier-audit")) return "frontier-compatibility-carrier";
  if (id.startsWith("collatz-frontier")) return "collatz-frontier-guardrail";
  if (id.startsWith("collatz-axiom")) return "collatz-axiom-clean-guardrail";
  if (id.startsWith("collatz-parent-gap")) return "collatz-finite-evidence-enumeration";
  if (id.startsWith("cross-surface")) return "lean-blueprint-verso-cross-surface";
  if (id === "index.html") return "coverage-cockpit-page";
  return "coverage-artifact";
}

function mediaFamilyFor(id) {
  const extension = extname(id);
  if (extension === ".json") return "json";
  if (extension === ".md") return "markdown";
  if (extension === ".html") return "html";
  if (extension === ".tsv") return "tsv";
  return extension.replace(/^\./, "") || "unknown";
}

function graphComponents(nodes, edges) {
  const adjacency = new Map(nodes.map((node) => [node, []]));
  for (const edge of edges) {
    if (!adjacency.has(edge.from) || !adjacency.has(edge.to)) continue;
    adjacency.get(edge.from).push(edge.to);
    adjacency.get(edge.to).push(edge.from);
  }
  const seen = new Set();
  let components = 0;
  for (const node of nodes) {
    if (seen.has(node)) continue;
    components += 1;
    const stack = [node];
    seen.add(node);
    while (stack.length > 0) {
      const current = stack.pop();
      for (const next of adjacency.get(current) ?? []) {
        if (seen.has(next)) continue;
        seen.add(next);
        stack.push(next);
      }
    }
  }
  return components;
}

function auditOutputLayers(baseMeasurement) {
  const artifacts = [];
  const parseFailures = [];
  const artifactById = new Map();
  const currentId = basename(informationJsonPath);
  const entries = readdirSync(outDir, { withFileTypes: true })
    .filter((entry) => entry.isFile())
    .map((entry) => entry.name)
    .filter((name) => expectedAuditArtifacts.includes(name))
    .sort((left, right) => left.localeCompare(right));

  for (const id of entries) {
    const path = join(outDir, id);
    const buffer = id === currentId
      ? Buffer.from(`${JSON.stringify(baseMeasurement, null, 2)}\n`, "utf8")
      : readFileSync(path);
    const entropyBitsPerByte = byteEntropy(buffer);
    let parsed = undefined;
    let shape = undefined;
    if (extname(id) === ".json") {
      try {
        parsed = JSON.parse(buffer.toString("utf8"));
        shape = jsonShape(parsed);
      } catch (error) {
        parseFailures.push({
          artifact: id,
          message: error instanceof Error ? error.message : String(error),
        });
      }
    }
    const artifact = Object.freeze({
      id,
      path: rel(path),
      role: auditArtifactRole(id),
      mediaFamily: mediaFamilyFor(id),
      bytes: buffer.length,
      entropyBitsPerByte,
      selfInformationBits: buffer.length * entropyBitsPerByte,
      modifiedAt: id === currentId ? "current-run" : statSync(path).mtime.toISOString(),
      virtualCurrentRun: id === currentId,
      ...(shape === undefined ? {} : { jsonShape: shape }),
    });
    artifacts.push(artifact);
    artifactById.set(id, { artifact, parsed });
  }

  const present = new Set(artifacts.map((artifact) => artifact.id));
  const missingArtifacts = expectedAuditArtifacts.filter((id) => !present.has(id));
  const edges = [];
  function addEdge(from, to, relation) {
    if (!present.has(from) || !present.has(to)) return;
    edges.push(Object.freeze({ from, to, relation }));
  }

  addEdge("blueprint-nodes.json", "lean-frontier-information.json", "claim-site-input");
  addEdge("blueprint-nodes.json", "lean-blueprint-weld.json", "claim-site-input");
  addEdge("blueprint-nodes.json", "index.html", "renders-cockpit");
  addEdge("lean-blueprint-weld.json", "cross-surface-audit.json", "surface-alignment-input");
  addEdge("lean-frontier-information.json", "lean-frontier-audit.json", "legacy-frontier-projection");
  addEdge("lean-frontier-audit.json", "collatz-frontier-audit.json", "collatz-frontier-input");
  addEdge("collatz-frontier-audit.json", "collatz-axiom-audit.json", "same-collatz-frontier-face");
  addEdge("collatz-parent-gap-audit.json", "collatz-frontier-audit.json", "finite-evidence-face");
  addEdge("cross-surface-audit.json", "index.html", "renders-cockpit");
  addEdge("lean-blueprint-weld.json", "index.html", "renders-cockpit");

  for (const [id, entry] of artifactById.entries()) {
    const sourceBlueprint = entry.parsed?.source?.blueprint;
    if (sourceBlueprint === "sites/docs/coverage/blueprint-nodes.json") {
      addEdge("blueprint-nodes.json", id, "declared-source");
    }
    const frontierInformation = entry.parsed?.frontierInformation;
    if (frontierInformation === "sites/docs/coverage/lean-frontier-information.json") {
      addEdge("lean-frontier-information.json", id, "declared-source");
    }
  }

  const nodes = artifacts.map((artifact) => artifact.id);
  const components = graphComponents(nodes, edges);
  const h1 = Math.max(0, edges.length - nodes.length + components);
  const totalBytes = artifacts.reduce((sum, artifact) => sum + artifact.bytes, 0);
  const totalInformationBits = artifacts.reduce((sum, artifact) => sum + artifact.selfInformationBits, 0);
  const weightedEntropyBitsPerByte = totalBytes === 0 ? 0 : totalInformationBits / totalBytes;
  const jsonArtifacts = artifacts.filter((artifact) => artifact.mediaFamily === "json");
  const keySupport = {};
  for (const artifact of jsonArtifacts) {
    for (const key of Object.keys(artifact.jsonShape?.keys ?? {})) {
      keySupport[key] = (keySupport[key] ?? 0) + 1;
    }
  }

  const counts = Object.freeze({
    expectedArtifacts: expectedAuditArtifacts.length,
    artifacts: artifacts.length,
    missingArtifacts: missingArtifacts.length,
    jsonArtifacts: jsonArtifacts.length,
    parseFailures: parseFailures.length,
    relationEdges: edges.length,
    relationComponents: components,
    relationH1: h1,
    totalBytes,
    totalInformationBits,
    weightedEntropyBitsPerByte,
  });

  return Object.freeze({
    kind: "obsmetrologia.frontier-information.audit-output-layer",
    reading: "coverage artifacts treated as finite relational information over audit carriers",
    selfReferenceMode:
      "predicative-one-step: the current frontier-information JSON is measured before embedding auditLayers, avoiding recursive self-counting",
    counts,
    chargeRead: Object.freeze({
      potential: Object.freeze({
        meaning: "Expected audit carriers not currently present.",
        count: missingArtifacts.length,
      }),
      active: Object.freeze({
        meaning: "Projection/dependency relations among audit carriers.",
        count: edges.length,
      }),
      stable: Object.freeze({
        meaning: "Parseable JSON audit carriers.",
        count: jsonArtifacts.length - parseFailures.length,
      }),
      absurd: Object.freeze({
        meaning: "Audit carriers that failed their own JSON admission.",
        count: parseFailures.length,
      }),
    }),
    layerStack: Object.freeze([
      Object.freeze({
        id: "L0-source-surfaces",
        reads: Object.freeze(["Lean workspace", "Blueprint claim-site graph", "Verso/cross-surface references"]),
      }),
      Object.freeze({
        id: "L1-frontier-carriers",
        reads: Object.freeze(["lean-frontier-information", "legacy frontier audit", "Collatz guardrails"]),
      }),
      Object.freeze({
        id: "L2-audit-output-relations",
        reads: Object.freeze(["coverage artifact graph", "artifact entropy", "JSON key support", "audit charge read"]),
      }),
    ]),
    relationGraph: Object.freeze({
      nodes: Object.freeze(nodes),
      edges: Object.freeze(edges),
      components,
      h1,
    }),
    selfInformation: Object.freeze({
      totalBytes,
      totalInformationBits,
      weightedEntropyBitsPerByte,
      largestArtifacts: Object.freeze([...artifacts]
        .sort((left, right) => right.bytes - left.bytes)
        .slice(0, 8)
        .map((artifact) => Object.freeze({
          id: artifact.id,
          bytes: artifact.bytes,
          role: artifact.role,
        }))),
      mostEntropicArtifacts: Object.freeze([...artifacts]
        .sort((left, right) => right.entropyBitsPerByte - left.entropyBitsPerByte)
        .slice(0, 8)
        .map((artifact) => Object.freeze({
          id: artifact.id,
          entropyBitsPerByte: artifact.entropyBitsPerByte,
          role: artifact.role,
        }))),
      jsonKeySupport: Object.freeze(Object.fromEntries(Object.entries(keySupport)
        .sort(([, left], [, right]) => right - left)
        .slice(0, 40))),
    }),
    missingArtifacts: Object.freeze(missingArtifacts),
    parseFailures: Object.freeze(parseFailures),
    artifacts: Object.freeze(artifacts),
  });
}

function location(site) {
  return `${site.file}:${site.line}`;
}

mkdirSync(outDir, { recursive: true });

const workspace = readLeanWorkspace(root, {
  referenceRoots: [],
  includePackageCapabilitySurface: false,
});
const files = leanFiles();
const { frontierSites, sorrySites, admitSites, trustSites } = readLeanFrontierSites(files);
const blueprint = readBlueprint();
const blueprintNodes = blueprint.nodes ?? [];
const redBlueprintNodes = blueprintNodes.filter((node) => node.status === "red");
const greenBlueprintNodes = blueprintNodes.filter((node) => node.status === "green");
const provedNames = new Set(workspace.declarationCatalog.entries
  .filter((entry) => entry.proofStatus === "proved")
  .map((entry) => entry.name));
const presentNames = new Set(workspace.declarationCatalog.entries.map((entry) => entry.name));
const greenLeanRefs = uniqueSorted(greenBlueprintNodes.flatMap(leanRefsForNode));
const missingGreenLeanRefs = greenLeanRefs.filter((name) => !presentNames.has(name));
const unprovedGreenLeanRefs = greenLeanRefs.filter((name) => presentNames.has(name) && !provedNames.has(name));

const declarationCounts = countBy(workspace.declarationCatalog.entries, (entry) => entry.kind);
const theoremLike = (declarationCounts.theorem ?? 0) + (declarationCounts.lemma ?? 0);
const frontierDeclarationNames = uniqueSorted(frontierSites.flatMap((site) =>
  site.declaration?.qualifiedName ? [site.declaration.qualifiedName] : []));
const frontierDependencyHeight = dependencyHeight(redBlueprintNodes);
const gradient = frontierGradient(blueprintNodes);

const chargeRead = {
  potential: {
    meaning: "Blueprint-red claim-sites: stated frontier claims whose proof has not settled.",
    count: redBlueprintNodes.length,
  },
  active: {
    meaning: "Lean frontier proof sites: declarations with an explicit admitted proof marker.",
    count: frontierSites.length,
  },
  stable: {
    meaning: "Blueprint-green claim-sites paired with currently proved Lean declarations where a Lean witness is named.",
    count: greenBlueprintNodes.filter((node) => leanRefsForNode(node).some((name) => provedNames.has(name))).length,
  },
  absurd: {
    meaning: "Hard trust/free-data surfaces: axiom, constant, opaque, or native_decide.",
    count: trustSites.length,
  },
};

const informationMeasure = {
  closureRegime: "strict-finite audit carrier",
  kappa: {
    leanFiles: files.length,
    modules: workspace.modules.length,
    frontierDependencyHeight,
    importCycleRank: workspace.importGraph.h1,
  },
  chargeRead,
  frontierGradient: gradient.counts,
  frontierEnergy: {
    value:
      chargeRead.potential.count
      + (3 * chargeRead.active.count)
      + (13 * chargeRead.absurd.count)
      + (workspace.obligationCoverage?.missing.length ?? 0),
    weights: {
      potential: 1,
      active: 3,
      absurd: 13,
      missingDeclaredObligation: 1,
    },
    note: "Finite diagnostic cost only: a transparent ranking signal, not a theorem about physical energy.",
  },
};

const counts = {
  leanFiles: files.length,
  modules: workspace.modules.length,
  declarations: workspace.declarationCatalog.entries.length,
  theoremLike,
  sorrySites: sorrySites.length,
  admitSites: admitSites.length,
  frontierSites: frontierSites.length,
  trustSites: trustSites.length,
  declarationsWithFrontier: frontierDeclarationNames.length,
  blueprintNodes: blueprintNodes.length,
  blueprintGreen: greenBlueprintNodes.length,
  blueprintRed: redBlueprintNodes.length,
  blueprintNone: blueprintNodes.filter((node) => node.status === "none").length,
  greenLeanRefs: greenLeanRefs.length,
  missingGreenLeanRefs: missingGreenLeanRefs.length,
  unprovedGreenLeanRefs: unprovedGreenLeanRefs.length,
};

const baseResult = {
  kind: "obsmetrologia.frontier-information.measurement",
  mediaType: "application/vnd.obsmetrologia.frontier-information+json",
  source: {
    leanWorkspace: "metroplat/services/lean-workspace.readLeanWorkspace",
    blueprint: rel(blueprintPath),
  },
  counts,
  declarationCounts,
  informationMeasure,
  metroplat: {
    rootModule: workspace.rootModule,
    importCycles: workspace.importGraph.cycles,
    importH1: workspace.importGraph.h1,
    theoremSpine: {
      entries: workspace.theoremSpine.entries.length,
      admitted: workspace.theoremSpine.admitted,
    },
    obligationCoverage: workspace.obligationCoverage,
    relationalConfigurationReport: workspace.relationalConfigurationReport,
  },
  frontierSites,
  trustSites,
  blueprintFrontier: {
    dependencyHeight: frontierDependencyHeight,
    byPart: countBy(redBlueprintNodes, (node) => node.part),
    byChapter: countBy(redBlueprintNodes, (node) => node.chapter),
    nodes: redBlueprintNodes,
  },
  frontierGradient: gradient,
  greenWitnessRead: {
    leanRefs: greenLeanRefs,
    missingLeanRefs: missingGreenLeanRefs,
    unprovedLeanRefs: unprovedGreenLeanRefs,
  },
};
const auditLayers = auditOutputLayers(baseResult);
const result = {
  ...baseResult,
  auditLayers,
};

writeFileSync(informationJsonPath, `${JSON.stringify(result, null, 2)}\n`, "utf8");

const legacyCounts = {
  leanFiles: counts.leanFiles,
  sorrySites: counts.sorrySites,
  trustSites: counts.trustSites,
  declarationsWithSorry: new Set(sorrySites.map((site) => site.declaration?.name ?? "(unknown)")).size,
};
writeFileSync(
  legacyJsonPath,
  `${JSON.stringify({
    counts: legacyCounts,
    sorrySites,
    trustSites,
    frontierInformation: rel(informationJsonPath),
  }, null, 2)}\n`,
  "utf8",
);

const markdown = [
  "# Lean Frontier Information",
  "",
  `- Lean files: ${counts.leanFiles}`,
  `- Lean modules read through metroplat: ${counts.modules}`,
  `- Declarations: ${counts.declarations} (${counts.theoremLike} theorem/lemma)`,
  `- Blueprint nodes: ${counts.blueprintNodes} (${counts.blueprintGreen} green, ${counts.blueprintRed} red)`,
  `- Frontier proof sites: ${counts.frontierSites} (${counts.sorrySites} sorry, ${counts.admitSites} admit)`,
  `- Hard trust surfaces: ${counts.trustSites}`,
  `- Frontier energy: ${informationMeasure.frontierEnergy.value}`,
  `- Ready Blueprint-red nodes: ${gradient.counts.ready}/${gradient.counts.redNodes}`,
  `- Audit-output layer: ${auditLayers.counts.artifacts}/${auditLayers.counts.expectedArtifacts} artifacts, H1=${auditLayers.counts.relationH1}, entropy=${auditLayers.counts.weightedEntropyBitsPerByte.toFixed(3)} bits/byte`,
  "",
  "## Charge Read",
  "",
  "| charge | count | reading |",
  "|---|---:|---|",
  ...Object.entries(chargeRead).map(([charge, read]) =>
    `| ${charge} | ${read.count} | ${htmlFree(read.meaning)} |`),
  "",
  "## Frontier Gradient",
  "",
  `- Ready red nodes: ${gradient.counts.ready}`,
  `- Red nodes blocked by red upstream claims: ${gradient.counts.blockedByRed}`,
  `- Red nodes with missing upstream labels: ${gradient.counts.dangling}`,
  `- Red-to-red dependency edges: ${gradient.counts.redDependencyEdges}`,
  "",
  "| ready candidate | chapter | unlocks | upstream uses | location |",
  "|---|---|---:|---:|---|",
  ...(gradient.candidates.length === 0
    ? ["| None |  | 0 | 0 |  |"]
    : gradient.candidates.map((node) =>
        `| ${htmlFree(node.label)} | ${htmlFree(node.chapter)} | ${node.unlocks} | ${node.uses.length} | ${node.file}:${node.line} |`)),
  "",
  "## Audit-Output Layer",
  "",
  `- Artifacts present: ${auditLayers.counts.artifacts}/${auditLayers.counts.expectedArtifacts}`,
  `- Parse failures: ${auditLayers.counts.parseFailures}`,
  `- Relation edges: ${auditLayers.counts.relationEdges}`,
  `- Relation H1: ${auditLayers.counts.relationH1}`,
  `- Total bytes: ${auditLayers.counts.totalBytes}`,
  `- Weighted entropy: ${auditLayers.counts.weightedEntropyBitsPerByte.toFixed(3)} bits/byte`,
  "",
  "| charge | count | reading |",
  "|---|---:|---|",
  ...Object.entries(auditLayers.chargeRead).map(([charge, read]) =>
    `| ${charge} | ${read.count} | ${htmlFree(read.meaning)} |`),
  "",
  "| largest artifact | bytes | role |",
  "|---|---:|---|",
  ...auditLayers.selfInformation.largestArtifacts.map((artifact) =>
    `| ${artifact.id} | ${artifact.bytes} | ${htmlFree(artifact.role)} |`),
  "",
  "## Frontier Sites",
  "",
  ...(frontierSites.length === 0
    ? ["None."]
    : frontierSites.map((site) => {
        const decl = site.declaration
          ? `${site.declaration.kind} ${site.declaration.qualifiedName}`
          : "unknown declaration";
        return `- ${location(site)} ${site.code} (${decl})`;
      })),
  "",
  "## Hard Trust Surfaces",
  "",
  ...(trustSites.length === 0
    ? ["None."]
    : trustSites.map((site) => {
        const decl = site.declaration
          ? `${site.declaration.kind} ${site.declaration.qualifiedName}`
          : "unknown declaration";
        return `- ${location(site)} ${site.code} (${decl})`;
      })),
  "",
  "## Blueprint Frontier By Chapter",
  "",
  "| chapter | red nodes |",
  "|---|---:|",
  ...Object.entries(result.blueprintFrontier.byChapter)
    .sort(([left], [right]) => left.localeCompare(right))
    .map(([chapter, count]) => `| ${htmlFree(chapter)} | ${count} |`),
  "",
  "## Green Witness Read",
  "",
  `- Green Lean refs: ${counts.greenLeanRefs}`,
  `- Missing green Lean refs: ${counts.missingGreenLeanRefs}`,
  `- Unproved green Lean refs: ${counts.unprovedGreenLeanRefs}`,
  "",
];

writeFileSync(informationMarkdownPath, `${markdown.join("\n")}\n`, "utf8");

const legacyMarkdown = [
  "# Lean Frontier Audit",
  "",
  `- Lean files: ${legacyCounts.leanFiles}`,
  `- Sorry sites: ${legacyCounts.sorrySites}`,
  `- Declarations with sorry: ${legacyCounts.declarationsWithSorry}`,
  `- Hard trust surfaces: ${legacyCounts.trustSites}`,
  `- Frontier information: ${rel(informationJsonPath)}`,
  "",
  "## Sorry Sites",
  "",
  ...(sorrySites.length === 0
    ? ["None."]
    : sorrySites.map((site) => {
        const decl = site.declaration ? `${site.declaration.kind} ${site.declaration.name}` : "unknown declaration";
        return `- ${site.file}:${site.line} (${decl})`;
      })),
  "",
  "## Hard Trust Surfaces",
  "",
  ...(trustSites.length === 0
    ? ["None."]
    : trustSites.map((site) => {
        const decl = site.declaration ? `${site.declaration.kind} ${site.declaration.name}` : "unknown declaration";
        return `- ${site.file}:${site.line} ${site.code} (${decl})`;
      })),
  "",
];

writeFileSync(legacyMarkdownPath, `${legacyMarkdown.join("\n")}\n`, "utf8");

console.log(
  `Lean frontier information: ${counts.frontierSites} frontier site(s), ${counts.trustSites} hard trust surface(s), ${counts.blueprintRed} blueprint-red node(s) -> ${rel(informationJsonPath)}`,
);

if (failOnTrust && trustSites.length > 0) {
  process.exitCode = 1;
}
