import test from 'node:test';
import assert from 'node:assert/strict';
import {auditProgramEvidence} from '../temporal-program-evidence.mjs';
const digest='a'.repeat(64);
const t=(x)=>`2026-10-${String(x).padStart(2,'0')}T12:00:00Z`;
const base={record_id:'a',program_id:'regional-relief',authority_id:'agency-1',source_url:'https://agency.example/program',revision:'v1',published_at:t(1),retrieved_at:t(2),effective_from:t(1),effective_to:null,status:'open',snapshot_sha256:digest,supersedes:[]};
const override=(x)=>({...structuredClone(base),...x});
const query=(records,valid=8,known=8,rest={})=>auditProgramEvidence(records,{program_id:'regional-relief',valid_at:t(valid),known_at:t(known),...rest});
test('initial published rule gives qualified *reported* state, not eligibility',()=>{
 const r=query([base]);assert.equal(r.disposition,'CONSISTENT_REPORTED_SOURCE');assert.equal(r.reported_status,'open');assert.equal(r.client_eligibility_established,false);assert.equal(r.requires_independent_authority_verification,true);
});
test('publication and retrieval are bitemporal; future observation is not knowable',()=>{
 const later=override({record_id:'b',revision:'v2',published_at:t(5),retrieved_at:t(12),effective_from:t(5),status:'revoked',supersedes:['a']});
 assert.equal(query([base,later],8,8).reported_status,'open');
 assert.equal(query([base,later],8,13).reported_status,'revoked');
});
test('effective time is not retrieval time',()=>{
 const later=override({record_id:'b',revision:'v2',published_at:t(4),retrieved_at:t(4),effective_from:t(10),status:'revoked',supersedes:['a']});
 assert.equal(query([base,later],8,14).reported_status,'open');
 assert.equal(query([base,later],11,14).reported_status,'revoked');
});
test('latest retrieval cannot silently override contradictory official claims',()=>{
 const different=override({record_id:'b',authority_id:'agency-2',revision:'v2',published_at:t(3),retrieved_at:t(7),status:'closed'});
 const r=query([base,different]);assert.equal(r.disposition,'CONTESTED_SOURCE_UNRESOLVED');assert.equal(r.reported_status,null);assert.deepEqual(r.statuses_considered,['closed','open']);
});
test('same authority but no explicit supersession preserves a conflict',()=>{
 const conflicting=override({record_id:'b',revision:'v2',published_at:t(3),retrieved_at:t(6),status:'revoked'});
 assert.equal(query([base,conflicting]).disposition,'CONTESTED_SOURCE_UNRESOLVED');
});
test('explicit same-authority supersession eliminates prior claim only when knowable',()=>{
 const replacement=override({record_id:'b',revision:'v2',published_at:t(4),retrieved_at:t(5),status:'closed',supersedes:['a']});
 assert.deepEqual(query([base,replacement],8,8).superseded_source_ids,['a']);
 assert.equal(query([base,replacement],8,4).reported_status,'open');
 assert.equal(query([base,replacement],8,8).reported_status,'closed');
});
test('finite valid-time intervals are half open',()=>{
 const ended=override({effective_to:t(7)});
 assert.equal(query([ended],6).reported_status,'open');
 assert.equal(query([ended],7).disposition,'NO_CURRENT_SOURCE');
});
test('an explicit freshness threshold prevents stale records from masquerading as live',()=>{
 assert.equal(query([base],8,8,{max_age_days:2}).disposition,'STALE_SOURCE_UNRESOLVED');
 assert.equal(query([base],8,8,{max_age_days:6}).disposition,'CONSISTENT_REPORTED_SOURCE');
});
test('unknown status is not treated as zero, negative, or open',()=>{
 const r=query([override({status:'unknown'})]);assert.equal(r.reported_status,null);assert.equal(r.disposition,'CONTESTED_SOURCE_UNRESOLVED');
});
test('cross-authority supersession is rejected',()=>{
 const bad=override({record_id:'b',authority_id:'agency-2',supersedes:['a']});assert.throws(()=>query([base,bad]),/cross-authority/);
});
test('cross-program supersession is rejected',()=>{
 const bad=override({record_id:'b',program_id:'elsewhere',supersedes:['a']});assert.throws(()=>query([base,bad]),/cross-authority/);
});
test('self and cyclic supersession fail closed',()=>{
 assert.throws(()=>query([override({supersedes:['a']})]),/self-supersession/);
 const a=override({supersedes:['b']});const b=override({record_id:'b',supersedes:['a']});assert.throws(()=>query([a,b]),/cyclic/);
});
test('unresolved supersession reference fails closed',()=>assert.throws(()=>query([override({supersedes:['missing']})]),/unresolved/));
test('extra client-specific data cannot enter public provider evidence',()=>{
 for(const key of ['household_income','tribal_membership','private_client_eligibility','full_subscribers']) {
  assert.throws(()=>query([override({[key]:'secret'})]),/unadmitted field/);
 }
});
test('all mandatory provenance dimensions are required',()=>{
 for(const key of ['record_id','program_id','authority_id','source_url','revision','published_at','retrieved_at','effective_from','effective_to','status','snapshot_sha256','supersedes']){
  const broken=override({});delete broken[key];assert.throws(()=>query([broken]));
 }
});
test('invalid timestamps, non-UTC time, impossible days and reversed intervals are rejected',()=>{
 for(const x of [override({retrieved_at:'2026-10-08T13:00:00-05:00'}),override({retrieved_at:'2026-02-30T12:00:00Z'}),override({effective_to:t(1)}),override({published_at:t(9)})]) assert.throws(()=>query([x]));
});
test('wrong snapshot checksum and insecure source URL fail',()=>{
 assert.throws(()=>query([override({snapshot_sha256:'abc'})]),/snapshot_sha256/);
 assert.throws(()=>query([override({source_url:'http://agency.example/program'})]),/HTTPS/);
});
test('duplicate record IDs are refused even with divergent evidence',()=>assert.throws(()=>query([base,base]),/duplicate/));
test('empty corpus returns unresolved rather than asserting closed',()=>{
 assert.equal(query([]).disposition,'NO_CURRENT_SOURCE');assert.equal(query([]).reported_status,null);
});
test('input remains unchanged across negative/positive controls',()=>{
 const input=[structuredClone(base)];const before=JSON.stringify(input);query(input);assert.equal(JSON.stringify(input),before);
});

test('fresh unrelated evidence cannot launder a stale active source',()=>{
 const old=override({record_id:'old',authority_id:'agency-1'});
 const fresh=override({record_id:'fresh',authority_id:'agency-2',source_url:'https://agency2.example/program',revision:'v1',published_at:t(7),retrieved_at:t(9)});
 const single=query([old],10,10,{max_age_days:2});
 const withExtra=query([old,fresh],10,10,{max_age_days:2});
 assert.equal(single.disposition,'STALE_SOURCE_UNRESOLVED');
 assert.equal(withExtra.disposition,'STALE_SOURCE_UNRESOLVED');
 assert.deepEqual(withExtra.source_freshness.stale_source_ids,['old']);
 assert.equal(withExtra.source_freshness.newest_age_days,1);
 assert.equal(withExtra.source_freshness.oldest_age_days,8);
});
test('explicit eligible supersession clears only the stale source it actually replaces',()=>{
 const old=override({record_id:'old'});
 const revised=override({record_id:'new',published_at:t(7),retrieved_at:t(9),effective_from:t(7),revision:'v2',supersedes:['old']});
 const x=query([old,revised],10,10,{max_age_days:2});
 assert.equal(x.disposition,'CONSISTENT_REPORTED_SOURCE');
 assert.deepEqual(x.active_source_ids,['new']);
 assert.deepEqual(x.superseded_source_ids,['old']);
 assert.deepEqual(x.source_freshness.stale_source_ids,[]);
 assert.equal(x.source_freshness.oldest_age_days,1);
});
test('missing source has no ages, and no threshold does not invent staleness',()=>{
 const empty=query([],10,10,{max_age_days:2});
 assert.deepEqual(empty.source_freshness,{newest_age_days:null,oldest_age_days:null,stale_source_ids:[]});
 assert.equal(empty.disposition,'NO_CURRENT_SOURCE');
 const noThreshold=query([base],10,10);
 assert.equal(noThreshold.disposition,'CONSISTENT_REPORTED_SOURCE');
 assert.deepEqual(noThreshold.source_freshness.stale_source_ids,[]);
});
