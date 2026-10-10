// federation: (local-trace, peer-witnesses) → trace
// Per platform-opener: federation = substrate merge of signed witnesses.
// For minimum-viable: each witness is checked for signature (stub: presence of
// signature field), then admitted via merging if signature ok. Real signature
// verification (Ed25519 per RFC 8032) comes later.

import merging from "#script/merging";

/**
 * @param {{path: string, rowIds: string[]}} localTrace
 * @param {Array<{witnessId: string, signature?: string, traceRows: string[]}>} peerWitnesses
 * @returns {{outputTrace: object, admissionDecisions: Array<object>}}
 */
export default function federation(localTrace, peerWitnesses) {
  if (!localTrace || typeof localTrace.path !== "string") {
    throw new Error("federation: localTrace must have path");
  }
  if (!Array.isArray(peerWitnesses)) {
    throw new Error("federation: peerWitnesses must be array");
  }
  const decisions = [];
  let current = localTrace;
  for (const w of peerWitnesses) {
    if (!w.signature) {
      decisions.push({
        witnessId: w.witnessId,
        decision: "rejected",
        reason: "missing signature"
      });
      continue;
    }
    // Treat the witness's traceRows as a peer trace fragment at the same path,
    // then G-Set merge. Real implementation would verify signature first.
    const peerTrace = { path: localTrace.path, rowIds: w.traceRows };
    current = merging(current, peerTrace);
    decisions.push({ witnessId: w.witnessId, decision: "admitted" });
  }
  return { outputTrace: current, admissionDecisions: decisions };
}
