import assert from 'node:assert/strict';
import { rewritePTGAE, SAFE_REWRITE_CODES } from '../tools/ptgae-rewrite.mjs';

const cases = [
  ['The change may potentially affect the parser.', 'The change may affect the parser.', 'PTR001'],
  ['The change could possibly affect the parser.', 'The change could affect the parser.', 'PTR002'],
  ['We parse in order to preserve provenance.', 'We parse to preserve provenance.', 'PTR004'],
  ['The build failed due to the fact that the lockfile changed.', 'The build failed because the lockfile changed.', 'PTR005'],
  ['The Sociology Services Section maintains knowledge and practices for the study of social structure.', 'The Sociology Services Section studies social structure.', 'PTR026'],
  ['The Music Services Section maintains knowledge and practices for this service domain.', 'Description incomplete.', 'PTR027'],
  ['This section holds shared knowledge and services concerning Tai Chi.', 'This section provides shared Tai Chi knowledge and services.', 'PTR028'],
  ['This is the home for OECD FORD 5.3, education research.', 'This section covers OECD FORD 5.3: education research.', 'PTR029']
];

for (const [source, expected, code] of cases) {
  const result = rewritePTGAE(source);
  assert.equal(result.text, expected, code + ' output mismatch');
  assert.ok(result.changes.includes(code), code + ' missing change receipt');
  assert.ok(SAFE_REWRITE_CODES.has(code), code + ' missing safe-rewrite registration');
}

for (const source of [
  'It is important to note that the parser preserves provenance.',
  'Unknown: the provider does not expose remaining quota.',
  'The repository is the canonical home of the signed corpus.',
  '`may potentially` names a banned stacked-modality phrase.',
  '```\nThe change may potentially affect the parser.\n```',
  '> The source says the change may potentially affect the parser.',
  '   > It is important to note that this is quoted source text.'
]) {
  const result = rewritePTGAE(source);
  assert.equal(result.text, source, 'unsafe, quoted, or protected text changed: ' + source);
  assert.equal(result.changed, false, 'unexpected rewrite receipt: ' + source);
}

console.log('ok ' + cases.length + ' safe rewrite fixtures; protected prose unchanged');
