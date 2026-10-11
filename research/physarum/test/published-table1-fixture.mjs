import { readFileSync } from 'node:fs';
import { createHash } from 'node:crypto';

/** The owning mycology publication transcription, never a copy in research/. */
export const PAPER_TABLE1_URL = new URL(
  '../../../services/natural-science-services-section/services/biological-science-services-section/services/mycology-services-section/data/records/physarum/paper-table1.json',
  import.meta.url
);
export const ADMITTED_TABLE1_BLOB_SHA = 'a44a29383a598f410a64d1c4a8a2024c1c034aae';

export function verifyPublishedTable1Bytes(bytes) {
  if (!Buffer.isBuffer(bytes)) throw new TypeError('Table 1 source bytes must be a Buffer');
  const actual = createHash('sha1')
    .update(`blob ${bytes.byteLength}\0`).update(bytes).digest('hex');
  if (actual !== ADMITTED_TABLE1_BLOB_SHA)
    throw new Error('Table 1 source revision mismatch: re-admit scientific source before use');
  const table = JSON.parse(bytes.toString('utf8'));
  if (table.workRef !== 'lenticule-science/science-services-section#27' ||
      table.source?.doi !== '10.1016/j.protis.2026.126156')
    throw new Error('Table 1 provenance mismatch');
  return table;
}
export function publishedTable1Bytes() {
  return readFileSync(PAPER_TABLE1_URL);
}
export function readPublishedTable1() {
  return verifyPublishedTable1Bytes(publishedTable1Bytes());
}
