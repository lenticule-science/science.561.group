import test from 'node:test';
import assert from 'node:assert/strict';
import {assayNewsroomThroughput as assay} from './newsroom-throughput-identifiability.mjs';

const packet=()=>({
 workRef:'causeway-services/koios-news#57',
 source:{repository:'causeway-services/koios-news',revision:'a'.repeat(40),
  observedAt:'2026-10-11T18:21:45.393Z',evidenceClass:'causeway-source-report',
  rightsClass:'internal-aggregate-only'},
 window:{start:'2026-10-11T00:00:00Z',end:'2026-10-12T00:00:00Z'},
 events:[],coverageClaims:[]
});
const event=(time,stage='draft',outcome='failed')=>({
 eventRef:'attempt-1',effectRef:'edition-1',stage,outcome,
 evidenceClass:'causeway-reported',evidenceRef:'issue-57-claim',
 observedAt:time
});

test('millisecond after whole-second start is inside the window',()=>{
 const p=packet();p.events=[event('2026-10-11T00:00:00.001Z')];
 assert.equal(assay(p).stages.find(s=>s.stage==='draft').failedAttempts,1);
});
test('millisecond before whole-second end is inside the window',()=>{
 const p=packet();p.events=[event('2026-10-11T23:59:59.999Z')];
 assert.equal(assay(p).stages.find(s=>s.stage==='draft').failedAttempts,1);
});
test('exact end boundary is exclusive regardless of fractional representation',()=>{
 const p=packet();p.events=[event('2026-10-12T00:00:00.000Z')];
 assert.throws(()=>assay(p),/invalid or duplicated event/);
});
test('submillisecond observation remains inside nanosecond-resolution window',()=>{
 const p=packet();p.window={start:'2026-10-11T00:00:00.000000001Z',end:'2026-10-11T00:00:00.000000003Z'};
 p.events=[event('2026-10-11T00:00:00.000000002Z')];
 assert.equal(assay(p).stages.find(s=>s.stage==='draft').failedAttempts,1);
});
test('equal instants in differing precision do not create phantom window',()=>{
 const p=packet();p.window={start:'2026-10-11T00:00:00Z',end:'2026-10-11T00:00:00.000Z'};
 assert.throws(()=>assay(p),/invalid provenance or window/);
});
test('invalid Gregorian day and oversized fractional precision fail closed',()=>{
 const p=packet();p.events=[event('2026-02-29T12:00:00Z')];
 assert.throws(()=>assay(p),/invalid or duplicated event/);
 p.events=[event('2026-10-11T12:00:00.1234567890Z')];
 assert.throws(()=>assay(p),/invalid or duplicated event/);
});
test('draft failure is observed but does not causally identify publication shortfall',()=>{
 const p=packet();p.events=[event('2026-10-11T12:00:00Z')];
 const r=assay(p);
 assert.equal(r.attribution.writerFailureObserved,true);
 assert.equal(r.attribution.failedWriterCausedPublicationShortfall,'not-identifiable');
});
test('empty stage events without verified coverage are not observable as zero',()=>{
 const r=assay(packet());
 assert.equal(r.stages.find(s=>s.stage==='published-ledger').zeroInterpretation,'not-observable-as-zero');
});
test('coverage claim without an independent verifier is not verified zero',()=>{
 const p=packet();p.coverageClaims=[{stage:'published-ledger',coverageRef:'ledger-public',
  windowStart:p.window.start,windowEnd:p.window.end,claimedBy:'causeway-reported',exhaustive:true}];
 assert.equal(assay(p).stages.find(s=>s.stage==='published-ledger').zeroInterpretation,'owner-or-provider-claims-zero');
});
test('verified coverage remains caller-verifier accepted, not independent outcome',()=>{
 const p=packet();p.coverageClaims=[{stage:'published-ledger',coverageRef:'ledger',
  windowStart:p.window.start,windowEnd:p.window.end,claimedBy:'provider-receipt',exhaustive:true}];
 assert.equal(assay(p,()=>true).stages.find(s=>s.stage==='published-ledger').zeroInterpretation,'zero-with-caller-verified-coverage');
});
test('independent-public readback is distinct from internal draft',()=>{
 const p=packet();p.events=[event('2026-10-11T12:00:00.001Z','public-readback','succeeded')];
 const r=assay(p);
 assert.equal(r.publicReceiving.observedPublicReadbackEffects,1);
 assert.equal(r.publicReceiving.customerOutcomes,'not-observed-by-this-assay');
});
test('duplicate event identities and rights-class violations are rejected',()=>{
 const p=packet();p.events=[event('2026-10-11T12:00:00Z'),event('2026-10-11T12:01:00Z')];
 assert.throws(()=>assay(p),/invalid or duplicated event/);
 p.events=[];p.source.rightsClass='client-private';
 assert.throws(()=>assay(p),/invalid provenance or window/);
});
