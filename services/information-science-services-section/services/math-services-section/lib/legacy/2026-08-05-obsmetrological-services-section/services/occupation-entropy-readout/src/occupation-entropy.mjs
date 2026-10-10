#!/usr/bin/env node
// occupation-entropy.mjs — the die's pure computation, specified by
// Obsmetrologia/Thermodynamics/BoltzmannEntropy.lean and pinned to its exact
// source bytes. Served exclusively over the signed A2A face
// (scripts/serve-a2a.mjs + scripts/execute-a2a-task.mjs); consumers that must not
// block on transport import these functions directly as their fallback.

import { createHash } from "node:crypto";
import { readFileSync } from "node:fs";

const SOURCES = [
  {
    declarationFile: "Obsmetrologia/Thermodynamics/BoltzmannEntropy.lean",
    url: new URL("../../../lib/obsmetrologia/Obsmetrologia/Thermodynamics/BoltzmannEntropy.lean", import.meta.url),
    sha256: "0c93b0daa706c83c2fa62d1023594a159d39f84f689e2edb1c37255f20a8e0e5",
  },
];

const DECLARATIONS = [
  "Obsmetrologia.Thermodynamics.fact",
  "Obsmetrologia.Thermodynamics.cellH",
  "Obsmetrologia.Thermodynamics.configH",
];

function sha256(bytes) {
  return createHash("sha256").update(bytes).digest("hex");
}

export function attestMathematicalSources() {
  const observed = SOURCES.map((source) => {
    const digest = sha256(readFileSync(source.url));
    return {
      file: source.declarationFile,
      expectedSha256: source.sha256,
      observedSha256: digest,
      matches: digest === source.sha256,
    };
  });
  const drift = observed.filter((record) => !record.matches);
  if (drift.length) {
    const error = new Error("admitted Obsmetrologia source bytes have drifted; conformance evidence is stale");
    error.data = { sources: observed };
    throw error;
  }
  return {
    library: "@lenticule-science/obsmetrologia",
    sources: observed,
    declarations: DECLARATIONS,
    assurance: {
      kind: "source-pinned-executable-projection",
      conformance: "Lean examples and JavaScript regression vectors exercise the same admitted occupation-entropy cases",
      limitation: "the JavaScript is separately implemented and is not a formally verified extraction from Lean",
    },
  };
}

function isNonNegSafeInt(value) {
  return typeof value === "number" && Number.isSafeInteger(value) && value >= 0;
}

// log2(n!) as an exact log-sum, sidestepping factorial overflow: n! grows
// past Number.MAX_SAFE_INTEGER at n = 19, so the factorial itself is never
// formed; only the sum of its terms' logs is.
function log2Factorial(n) {
  let acc = 0;
  for (let k = 2; k <= n; k += 1) acc += Math.log2(k);
  return acc;
}

// The Boltzmann occupation-entropy readout of an occupation list: `occupation`
// is one non-negative integer per cell (e.g. hires per provider). configH is
// Boltzmann's H = Σ log2(n_i!) (BoltzmannEntropy.lean's `configH`); entropyBits
// is the log2 multinomial multiplicity log2(N! / Π n_i!) = log2(N!) − configH
// — zero when every object sits in one cell, maximal when evenly spread.
export function computeOccupationEntropy({ occupation } = {}) {
  if (!Array.isArray(occupation) || occupation.length === 0) {
    throw new Error("occupation must be a non-empty array of non-negative safe integers");
  }
  for (const n of occupation) {
    if (!isNonNegSafeInt(n)) {
      throw new Error("occupation must be a non-empty array of non-negative safe integers");
    }
  }
  const cells = occupation.length;
  const totalObjects = occupation.reduce((sum, n) => sum + n, 0);
  if (totalObjects === 0) {
    return { cells, totalObjects: 0, configH: 0, entropyBits: 0 };
  }
  const configH = occupation.reduce((sum, n) => sum + log2Factorial(n), 0);
  const entropyBits = log2Factorial(totalObjects) - configH;
  return { cells, totalObjects, configH, entropyBits };
}
