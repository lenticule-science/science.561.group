#!/usr/bin/env node
// occupation-entropy.mjs — the die's pure computation, specified by
// Obsmetrologia/Thermodynamics/BoltzmannEntropy.lean
// (Obsmetrologia.Thermodynamics.fact/.cellH/.configH). Served exclusively
// over the signed A2A face (scripts/serve-a2a.mjs + scripts/execute-a2a-task.mjs);
// consumers that must not block on transport import these functions
// directly as their fallback. The JavaScript here is a separate
// implementation, not an extraction from the Lean.

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
