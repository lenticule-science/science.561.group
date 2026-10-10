// Finite CoverNerve rank readout used by this relational-graph service.
// For a graph with V entities, E cells, and C connected components,
// H1rank = E + C - V; that rank is both the coordination cost and the
// Landauer bit count.
function isNat(value) {
  return typeof value === "number" && Number.isSafeInteger(value) && value >= 0;
}

export function computeCoverNerve({ entities, cells, components } = {}) {
  if (![entities, cells, components].every(isNat)) {
    throw new Error("entities, cells, components must be non-negative safe integers");
  }
  if (components > entities) {
    throw new Error("not an admissible CoverNerve: components must be no greater than entities");
  }
  if (entities > cells + components) {
    throw new Error("not an admissible CoverNerve: entities must be no greater than cells plus components");
  }

  const h0rank = components;
  const h1rank = cells + components - entities;
  return {
    h0rank,
    h1rank,
    coordinationFree: h1rank === 0,
    landauerBits: h1rank,
    coordinationCost: h1rank,
  };
}
