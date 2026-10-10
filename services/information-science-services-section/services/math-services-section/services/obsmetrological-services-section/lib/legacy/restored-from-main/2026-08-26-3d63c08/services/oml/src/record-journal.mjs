import { createSemanticRecordJournal } from "@red-cup-engineering/semantic-record-journal-service";

const OBJECT_KIND = "lenticule.oml.change-bundle-journal-record";
const SUPPORT_ONLY = Object.freeze({ support: true, refutation: false });

/**
 * Provider-owned custody for OML's qualification evidence.  It accepts the
 * domain's existing category/payload pair and makes the epistemic charge
 * explicit rather than delegating custody to a remote RDF provider.
 */
export function createOmlRecordJournal({ root }) {
  const journal = createSemanticRecordJournal({ root, objectKind: OBJECT_KIND });
  return Object.freeze({
    record({ category, recordedAt, record }) {
      return journal.record({ category, recordedAt, record, charge: SUPPORT_ONLY });
    },
  });
}
