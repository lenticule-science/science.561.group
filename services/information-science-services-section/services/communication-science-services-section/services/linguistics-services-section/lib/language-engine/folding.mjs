// language-engine/folding.mjs — head-of-head path composition (the predication monad
// μ). Mechanically ported (types stripped) from the recovered
// @lenticule-science/language-topology/src/folding.mts. Logic is unchanged.
// The parse is the LIMIT of iterating μ: each fold derives transitive
// relations. Terminates on finite acyclic arc sets; bounded by maxDepth for
// cyclic cases.

/** Fold arcs to their transitive closure (head-of-head path composition).
 * Returns the derived multi-step paths and statistics about the fold tower. */
export function fold(arcs, opts) {
  const maxDepth = opts?.maxDepth ?? 16;
  const sizes = [];

  // Build adjacency: head → [{rel, dep}]
  const adj = new Map();
  for (const a of arcs) {
    const list = adj.get(a.head) ?? [];
    list.push({ rel: a.rel, dep: a.dependent });
    adj.set(a.head, list);
  }

  // Paths found so far: (head, path[], dep) — path is the arc label sequence
  const pathKey = (h, p, d) => `${h}\x00${p.join(",")}\x00${d}`;
  const seen = new Set();
  const paths = [];

  // Seed with length-1 paths (direct arcs)
  for (const a of arcs) {
    const k = pathKey(a.head, [a.rel], a.dependent);
    if (!seen.has(k)) {
      seen.add(k);
      // Only record multi-step paths (length > 1 is what fold adds)
    }
  }

  // Iterate: extend existing paths by one arc at the dependent end
  let frontier = arcs.map((a) => ({ head: a.head, path: [a.rel], dependent: a.dependent }));

  let folds = 0;
  let fixedPoint = false;

  for (let depth = 0; depth < maxDepth; depth++) {
    const nextFrontier = [];
    for (const fp of frontier) {
      const ext = adj.get(fp.dependent);
      if (!ext) continue;
      for (const { rel, dep } of ext) {
        const newPath = [...fp.path, rel];
        const k = pathKey(fp.head, newPath, dep);
        if (!seen.has(k)) {
          seen.add(k);
          const composed = { head: fp.head, path: newPath, dependent: dep };
          nextFrontier.push(composed);
          paths.push(composed);
        }
      }
    }
    sizes.push(paths.length);
    if (nextFrontier.length === 0) {
      fixedPoint = true;
      folds = depth + 1;
      break;
    }
    frontier = nextFrontier;
    folds = depth + 1;
  }

  return {
    paths,
    tower: { folds, fixedPoint, sizes },
  };
}
