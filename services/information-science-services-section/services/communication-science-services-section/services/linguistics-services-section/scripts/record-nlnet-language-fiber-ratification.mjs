#!/usr/bin/env node
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { createSemanticRecordJournal } from "@red-cup-engineering/semantic-record-journal-service";

/** This section's own root, the default semantic-record-journal custody root (writes land at data/logs/, per house data-custody law). */
export const NODE_ROOT = resolve(dirname(fileURLToPath(import.meta.url)), "..");

/** The objectKind this section's semantic record journal uses for enterprise-ratification records. */
export const RATIFICATION_OBJECT_KIND = "linguistics.enterprise-ratification-record";

/** The journal category NLnet/language-fiber ratification records are written and queried under. */
export const RATIFICATION_CATEGORY = "linguistics.nlnet-language-fiber-ratification";

/**
 * Records one founder ratification of the NLnet application / language-fiber
 * enterprise pursuit into this section's semantic record journal.
 * @param {object} record
 * @param {{dataRoot?: string, recordedAt?: string}} [options]
 * @returns {{id: string, objectKind: string, contentAppended: number, claimsAppended: number, charge: {support: boolean, refutation: boolean}}} the journal's record receipt.
 */
export function recordRatification(record, options = {}) {
  const dataRoot = resolve(options.dataRoot ?? NODE_ROOT);
  const journal = createSemanticRecordJournal({ root: dataRoot, objectKind: RATIFICATION_OBJECT_KIND });
  return journal.record({
    category: RATIFICATION_CATEGORY,
    recordedAt: options.recordedAt ?? new Date().toISOString(),
    record,
    charge: { support: true, refutation: false },
  });
}

if (import.meta.main) {
  const record = {
    event: "founder-ratification",
    quote: "I'm sold on pursuing this",
    date: "2026-09-01",
    scope: "NLnet NGI application and the @lenticule-science/communicating language-fiber enterprise (family-first, Lakota flagship)",
    preconditions: [
      "engine and all five fibers currently license: UNLICENSED; Apache-2.0 decided as the target license",
      "public repository target: github.com/lenticule-science (queued go-public engineering work)",
      "lakota-language-algebra's lakota-die.mjs still carries rejected urn:ame actor ids (src/lakota-die.mjs lines 14-15) -- conformance debt riding the go-public push",
      "NLnet call opens 2026-09-03, deadline 2026-11-03",
      "corpus/lexicon provenance and any community engagement remain founder-supplied HANDS items, not agent-settled",
    ],
    strategyNote: "content/text/documents/articles/notes/2026/09/01/2026-09-01-note-on-the-nlnet-language-fiber-enterprise-pursuit.md",
    nlnetDraft: "content/text/documents/articles/notes/2026/08/31/2026-08-31-note-on-nlnet-ngi-grant-application-draft-for-lakota-language-algebra.md",
  };
  const receipt = recordRatification(record);
  process.stdout.write(`${JSON.stringify(receipt, null, 2)}\n`);
}
