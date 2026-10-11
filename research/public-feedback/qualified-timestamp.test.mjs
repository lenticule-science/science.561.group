import test from 'node:test';
import assert from 'node:assert/strict';
import fixture from './koios-live-observation.json' with { type: 'json' };
import { admitPublicFeedback, assessCurrentEditorialTarget } from './evidence-assay.mjs';

// This verifier is a test stub, not an authenticated public-readback provider.
const fixtureVerifier = { verifyObservation: () => true };
const sample = () => structuredClone(fixture);
test('impossible Gregorian days, 24-hour normalization and illegal offsets fail closed', () => {
  for (const at of ['2026-02-30T23:25:15Z', '2025-02-29T23:25:15Z',
    '2026-10-11T24:00:00Z', '2026-10-11T23:25:15+14:30',
    '2026-10-11T23:25:15-14:01', '2026-10-11T23:25:15']) {
    const row = sample();
    row.observations[0].at = at;
    assert.throws(() => admitPublicFeedback(row, fixtureVerifier), /invalid observation/, at);
  }
});
test('Science and Coesite agree on nanosecond timestamp precision at both admission boundaries', () => {
  for (const at of ['2026-10-10T23:25:15.1Z', '2026-10-10T23:25:15.123456789Z',
    '2026-10-10T23:25:15.123456789+14:00']) {
    const row = sample();
    row.observations[0].at = at;
    assert.equal(admitPublicFeedback(row, fixtureVerifier).customerAcceptance, 'unverified', at);
  }
  for (const at of ['2026-10-10T23:25:15.1234567890Z',
    '2026-10-10T23:25:15.123456789012345Z',
    '2026-10-10T23:25:15.1234567890+14:00']) {
    const row = sample();
    row.observations[0].at = at;
    assert.throws(() => admitPublicFeedback(row, fixtureVerifier), /invalid observation/, at);
    const policy = {profiles:{brief:{evidenceBudget:{targetWords:{minimum:300},minimumSections:1}}}};
    const snapshot = {articleUrl:'https://example.org/article',profile:'brief',
      profileEvidence:'publisher-profile-receipt',articleVersionDigest:'a'.repeat(64),
      versionObservedAt:at,bodyWords:100,contextSections:0};
    assert.equal(assessCurrentEditorialTarget(snapshot, policy, {
      verifyPolicy:()=>true, verifyArticle:()=>true
    }).classification, 'indeterminate', at);
  }
});
test('real leap day, bounded offset, and existing dated fixture remain syntactically valid', () => {
  for (const at of ['2024-02-29T23:25:15Z', '2026-10-11T23:25:15+14:00']) {
    const row = sample();
    row.observations[0].at = at;
    assert.equal(admitPublicFeedback(row, fixtureVerifier).customerAcceptance, 'unverified');
  }
  assert.equal(admitPublicFeedback(sample(), fixtureVerifier).statuses.length, 4);
});
test('invalid version-observation time cannot promote a reported editorial snapshot', () => {
  const policy = {profiles:{brief:{evidenceBudget:{targetWords:{minimum:300},minimumSections:1}}}};
  const snapshot = {articleUrl:'https://example.org/article',profile:'brief',profileEvidence:'publisher-profile-receipt',
    articleVersionDigest:'a'.repeat(64),versionObservedAt:'2026-02-30T23:25:15Z',
    bodyWords:100,contextSections:0};
  const out = assessCurrentEditorialTarget(snapshot,policy,{verifyPolicy:()=>true,verifyArticle:()=>true});
  assert.equal(out.classification, 'indeterminate');
});
