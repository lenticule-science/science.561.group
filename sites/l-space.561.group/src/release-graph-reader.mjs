import { existsSync, statSync } from "node:fs";
import { basename, join, resolve } from "node:path";

import { createGeodeReleaseGraph } from "@red-cup-engineering/geode/release-graph";

import { DEFAULT_L_SPACE_RELEASE_ROOT } from "./release-observation.mjs";
import { validateLSpaceReleaseGraph } from "./release-graph-artifact.mjs";
import { json } from "./release-json.mjs";

const cache = new Map();



export function openLSpaceReleaseGraph({ releaseRoot } = {}) {
  const root = resolve(releaseRoot ?? process.env.L_SPACE_RELEASE_ROOT ?? DEFAULT_L_SPACE_RELEASE_ROOT);
  const manifestPath = join(root, "manifest.json");
  if (!existsSync(manifestPath)) throw new Error(`L-Space release is unavailable: ${manifestPath}`);
  const manifest = json(manifestPath, "L-Space release manifest");
  const graphFile = manifest?.graph?.file;
  if (typeof graphFile !== "string" || basename(graphFile) !== graphFile || graphFile !== "graph.json") {
    throw new TypeError("L-Space release manifest does not name its graph artifact");
  }
  const graphPath = join(root, graphFile);
  if (!existsSync(graphPath)) throw new Error(`L-Space release graph is unavailable: ${graphPath}`);
  const signature = `${manifest.release}:${statSync(manifestPath).mtimeMs}:${statSync(graphPath).mtimeMs}:${statSync(graphPath).size}`;
  const prior = cache.get(root);
  if (prior?.signature === signature) return prior.promise;

  const promise = Promise.resolve().then(() => {
    const artifact = validateLSpaceReleaseGraph(json(graphPath, "L-Space release graph"), {
      release: manifest.release,
      roomCount: manifest.counts?.rooms,
    });
    return createGeodeReleaseGraph({ snapshot: artifact.snapshot, ledger: artifact.ledger });
  }).catch((error) => {
    if (cache.get(root)?.promise === promise) cache.delete(root);
    throw error;
  });
  cache.set(root, Object.freeze({ signature, promise }));
  return promise;
}
