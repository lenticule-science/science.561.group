import test from 'node:test';
import assert from 'node:assert/strict';
import { evidenceFor, inferenceFor } from '../src/capability-evidence.mjs';

test('draft revision is provider-supported but absent from current connector', () => {
  assert.equal(evidenceFor('email.draft.update').connectorExposure, 'REFUTED');
  assert.equal(evidenceFor('email.draft.update').providerSupport, 'HELD');
  assert.equal(inferenceFor('email.draft.update'), 'PROVIDER_SUPPORTED_CONNECTOR_GAP');
});

test('exposed send capability does not imply authority or complete provider semantics', () => {
  assert.equal(evidenceFor('email.compose.send').connectorExposure, 'HELD');
  assert.match(inferenceFor('email.compose.send'), /SEPARATE_EVIDENCE/);
});
