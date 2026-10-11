import test from 'node:test';
import assert from 'node:assert/strict';
import { claimFor, engineeringDispositionFor, researchBacklog } from '../src/evidence-ledger.mjs';

test('remote speech-in-noise evidence licenses prototyping, not clinical equivalence', () => {
  assert.equal(claimFor('remote-speech-in-noise.consumer-hardware').state, 'HELD_LIMITED');
  assert.equal(engineeringDispositionFor('remote-speech-in-noise.consumer-hardware'), 'PROTOTYPE_AND_VALIDATE');
});

test('pilot DIN evidence explicitly blocks OTC fitting-validation claims', () => {
  assert.equal(claimFor('din.otc-fitting-validation').state, 'NOT_YET_HELD');
  assert.equal(engineeringDispositionFor('din.otc-fitting-validation'), 'DO_NOT_USE_AS_FITTING_VALIDATION');
});

test('stimulus-rights resolution remains a first-class research dependency', () => {
  assert.ok(researchBacklog().some((x) => /stimuli/.test(x) && /rights/.test(x)));
});
