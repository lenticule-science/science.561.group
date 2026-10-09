import test from 'node:test';
import assert from 'node:assert/strict';
import { readFile } from 'node:fs/promises';

const fixtureUrl = new URL('../data/attachment-read-evidence.json', import.meta.url);

test('attachment read remains provider-supported but unavailable on current connector', async () => {
  const evidence = JSON.parse(await readFile(fixtureUrl, 'utf8'));
  assert.equal(evidence.capabilityId, 'email.attachment.read');
  assert.equal(evidence.providerProtocolSupport, 'HELD');
  assert.equal(evidence.connectorExposure, 'REFUTED');
  assert.equal(evidence.harnessCallability, 'REFUTED');
  assert.equal(evidence.verifiedEffect, 'UNKNOWN');
  assert.equal(evidence.readback, 'UNKNOWN');
  assert.match(evidence.acceptanceInvariant, /exact-source-binding/);
  assert.match(evidence.acceptanceInvariant, /mailbox-state-unchanged/);
  assert.ok(evidence.falsifier.includes('callable principal-bound connector action'));
});
