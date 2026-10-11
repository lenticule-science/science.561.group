import test from 'node:test';
import assert from 'node:assert/strict';
import { auditProgramEvidence } from '../temporal-program-evidence.mjs';

// Reproducible metamorphic property, not live or authoritative program evidence.
const t = d => `2026-10-${String(d).padStart(2,'0')}T12:00:00Z`;
const source = (id, authority, retrievedDay, status = 'open', supersedes = []) => ({
  record_id:id, program_id:'regional-relief', authority_id:authority,
  source_url:`https://${authority}.example.org/program`, revision:'v1',
  published_at:t(1), retrieved_at:t(retrievedDay), effective_from:t(1),
  effective_to:null, status, snapshot_sha256:'a'.repeat(64), supersedes
});
const run = (evidence, maximumAge) => auditProgramEvidence(evidence, {
  program_id:'regional-relief', valid_at:t(10), known_at:t(10), max_age_days:maximumAge
});

test('metamorphic: adding an unrelated agreeing recent source cannot make a stale collection pass', () => {
  let combinations = 0;
  for (const staleRetrievedDay of [2,3,4,5,6,7]) {
    for (const newRetrievedDay of [8,9,10]) {
      for (const threshold of [0,1,2]) {
        for (const status of ['open','closed','revoked','suspended']) {
          const stale = source('original','authority-one',staleRetrievedDay,status);
          const fresh = source('additional','authority-two',newRetrievedDay,status);
          if ((10-staleRetrievedDay) <= threshold) continue;
          const before = run([stale], threshold);
          const after = run([stale,fresh], threshold);
          assert.equal(before.disposition, 'STALE_SOURCE_UNRESOLVED');
          assert.equal(after.disposition, 'STALE_SOURCE_UNRESOLVED');
          assert.deepEqual(after.source_freshness.stale_source_ids.includes('original'), true);
          assert.ok(after.source_freshness.oldest_age_days >= 10-staleRetrievedDay);
          assert.equal(after.client_eligibility_established,false);
          combinations++;
        }
      }
    }
  }
  assert.equal(combinations,216);
});

test('provenance supersession rather than a fresh timestamp removes stale source from active claims',()=>{
  for(const oldDay of [2,3,4,5,6,7]) {
    const previous=source('previous','agency-one',oldDay);
    const replacement=source('replacement','agency-one',9,'open',['previous']);
    const result=run([previous,replacement],2);
    assert.equal(result.disposition,'CONSISTENT_REPORTED_SOURCE');
    assert.deepEqual(result.active_source_ids,['replacement']);
    assert.deepEqual(result.superseded_source_ids,['previous']);
  }
});

test('cross-authority replacement cannot forge a supersession edge',()=>{
  const previous=source('previous','agency-one',2);
  const adversary=source('adversary','agency-two',9,'open',['previous']);
  assert.throws(()=>run([previous,adversary],2),/cross-authority/);
});
