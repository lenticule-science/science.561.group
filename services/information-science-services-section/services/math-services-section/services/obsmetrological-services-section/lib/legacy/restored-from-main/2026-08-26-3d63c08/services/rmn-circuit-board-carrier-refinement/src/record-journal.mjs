import { createSemanticRecordJournal } from "@red-cup-engineering/semantic-record-journal-service";

const OBJECT_KIND = "lenticule.rmn-circuit-board-carrier-refinement.journal-record";
const SUPPORT_ONLY = Object.freeze({ support: true, refutation: false });

/** Package-local custody for assay evidence; no network journal is an authority here. */
export function createRmnCircuitBoardCarrierRefinementRecordJournal({ root }) {
  const journal = createSemanticRecordJournal({ root, objectKind: OBJECT_KIND });
  const record = (category, value, recordedAt) => journal.record({ category, record: value, recordedAt, charge: SUPPORT_ONLY });
  return Object.freeze({
    ...journal,
    recordProof: (proof, recordedAt) => record("rmn-circuit-board-carrier-refinement.proof", proof, recordedAt),
    recordReceipt: (receipt, recordedAt) => record("rmn-circuit-board-carrier-refinement.receipt", receipt, recordedAt),
  });
}
