import assert from 'node:assert/strict';
import { lintPTGAE } from '../tools/ptgae-lint.mjs';

const poison = [
  ['PTG001', 'It is important to note that the parser preserves provenance.'],
  ['PTG001', 'It is worth noting that the parser preserves provenance.'],
  ['PTG002', 'The change may potentially affect the parser.'],
  ['PTG002', 'The change could possibly affect the parser.'],
  ['PTG003', 'One possible approach could be a typed event log.'],
  ['PTG004', 'We parse the record in order to preserve provenance.'],
  ['PTG005', 'This module serves as the parser.'],
  ['PTG006', 'This represents a significant improvement.'],
  ['PTG007', 'This does not necessarily mean the record is valid.'],
  ['PTG008', 'While this has not been conclusively demonstrated, the model predicts X.'],
  ['PTG009', 'It is possible that the cache is stale.'],
  ['PTG010', 'The build failed due to the fact that the lockfile changed.'],
  ['PTG011', 'The parser has the ability to preserve provenance.'],
  ['PTG012', 'It should be noted that the API is internal.'],
  ['PTG013', 'The Music Services Section maintains knowledge and practices for this service domain.']
];

for (const [code, source] of poison) {
  assert.ok(lintPTGAE(source).some(f => f.code === code), `${code} did not match: ${source}`);
}

const clean = [
  'The parser preserves provenance.',
  'Hypothesis: information precedes quantum structure.',
  'Model prediction: X.',
  'We propose a typed event log.',
  'Measured on 2026-10-06: 14.2 GB free.',
  'The cache may be stale.',
  'The API is internal.',
  'We cannot establish the value from the available telemetry.',
  'The section description is incomplete.',
  '`It is important to note` is a banned throat-clearing phrase.',
  '```\nIt is important to note that this example is intentionally bad.\n```'
];

for (const source of clean) {
  assert.deepEqual(lintPTGAE(source), [], `clean fixture was flagged: ${source}`);
}

console.log(`ok ${poison.length} poison fixtures; ${clean.length} clean fixtures`);
