import test from 'node:test';
import assert from 'node:assert/strict';
import { evidenceFor, inferenceFor } from '../src/capability-evidence.mjs';

test('draft-update observation refuses to infer provider absence', () => {
  assert.equal(evidenceFor('email.draft.update').connectorExposure, 'REFUTED');
  assert.equal(evidenceFor('email.draft.update').providerSupport, 'UNKNOWN');
  assert.equal(inferenceFor('email.draft.update'), 'CONNECTOR_GAP_PROVIDER_UNRESOLVED');
});

test('exposed send capability does not imply authority or complete provider semantics', () => {
  assert.equal(evidenceFor('email.compose.send').connectorExposure, 'HELD');
  assert.match(inferenceFor('email.compose.send'), /SEPARATE_EVIDENCE/);
});
