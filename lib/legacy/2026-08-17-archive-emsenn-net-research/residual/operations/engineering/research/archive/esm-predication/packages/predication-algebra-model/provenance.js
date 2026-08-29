// Provenance traversal — walk the geometry's provenance records
// backward from a target claim to its source claims.
//
// The data is already tracked by encodeDerivedClaim in claim.js;
// this module adds the backward traversal and tree construction.

/**
 * Build a provenance tree for a claim, walking backward through
 * derivation sources.
 *
 * @param {object} geometry - Settled geometry with .provenance and .claims.
 * @param {string} claimAddress - Address of the target claim.
 * @param {object} [options] - { maxDepth?: number }
 * @returns {object} ProvenanceTree
 */
function why(geometry, claimAddress, options) {
  const maxDepth = (options && options.maxDepth) || 32;
  const visited = new Set();
  return buildTree(geometry, claimAddress, visited, 0, maxDepth);
}

function buildTree(geometry, claimAddress, visited, depth, maxDepth) {
  if (visited.has(claimAddress)) {
    return { address: claimAddress, source: "cycle" };
  }
  if (depth >= maxDepth) {
    return { address: claimAddress, source: "depth-limit" };
  }
  visited.add(claimAddress);

  const claim = geometry.claims && geometry.claims[claimAddress];
  if (!claim) {
    return { address: claimAddress, source: "missing" };
  }

  // Provenance lives on the claim object itself (claim.provenance)
  // or in the geometry-level provenance map (geometry.provenance).
  const prov = claim.provenance ||
    (geometry.provenance && geometry.provenance[claimAddress]);
  if (!prov || prov.mode === "message") {
    return {
      address: claimAddress,
      source: "fact",
      claim: { subject: claim.subject, predicate: claim.predicate, object: claim.object },
      value: claim.value
    };
  }

  const children = [];
  if (Array.isArray(prov.sources)) {
    for (const srcAddr of prov.sources) {
      if (srcAddr === claimAddress) continue;
      children.push(buildTree(geometry, srcAddr, visited, depth + 1, maxDepth));
    }
  }

  return {
    address: claimAddress,
    source: "derived",
    claim: { subject: claim.subject, predicate: claim.predicate, object: claim.object },
    value: claim.value,
    channels: prov.channels || [],
    transforms: prov.transforms || [],
    children
  };
}

/**
 * Flatten a provenance tree to a depth-first list of nodes.
 *
 * @param {object} tree - ProvenanceTree from why().
 * @returns {Array} Flat list of tree nodes.
 */
function flattenProvenance(tree) {
  const result = [];
  function walk(node) {
    result.push(node);
    if (node.children) {
      for (const child of node.children) walk(child);
    }
  }
  walk(tree);
  return result;
}

export { why, flattenProvenance };
