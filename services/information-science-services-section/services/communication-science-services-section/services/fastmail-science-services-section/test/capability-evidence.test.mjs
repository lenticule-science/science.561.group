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


test('synthetic draft creation is a verified connector effect with readback', () => {
  const evidence = evidenceFor('email.draft.create');
  assert.equal(evidence.connectorExposure, 'HELD');
  assert.equal(evidence.harnessCallability, 'HELD');
  assert.equal(evidence.verifiedEffect, 'HELD');
  assert.equal(evidence.readback, 'HELD');
  assert.equal(inferenceFor('email.draft.create'), 'CONNECTOR_EFFECT_VERIFIED');
});

test('draft trash remains connector-exposed but harness-blocked with no effect', () => {
  const evidence = evidenceFor('email.draft.trash');
  assert.equal(evidence.connectorExposure, 'HELD');
  assert.equal(evidence.harnessCallability, 'REFUTED');
  assert.equal(evidence.verifiedEffect, 'UNKNOWN');
  assert.equal(evidence.readback, 'HELD_NO_EFFECT');
  assert.equal(inferenceFor('email.draft.trash'), 'CONNECTOR_EXPOSED_HARNESS_BLOCKED');
});
