import test from 'node:test';
import assert from 'node:assert/strict';
import {assayOwnerMetricIdentifiability as assay} from './owner-metric-identifiability.mjs';
const fixture=()=>({workRef:'causeway-services/koios-news#4',
 source:{repository:'causeway-services/koios-news-data',commit:'fbc33aacd753671acd3e7f1e5fc153842daefee9',
 gitBlobSha:'22413f2b20ad5b01037a219abdf49841361a529e',path:'feedback/latest.json',
 observedAt:'2026-10-11T15:23:23.224Z',evidenceClass:'causeway-service-owner-reported',rightsClass:'internal-aggregate-only'},
 cohort:76,strata:{passContext:38,passNoContext:0,failContext:15,failNoContext:23},
 sampleTargets:{passContext:12,passNoContext:0,failContext:6,failNoContext:6},
 independentLabels:{readerTaskArticles:0,sourceAdjudicatedArticles:0}});
test('source-pinned owner cohort is properly stratified',()=>{const r=assay(fixture());
 assert.equal(r.counts.ownerPass,38);assert.equal(r.counts.ownerFail,38);
 assert.equal(r.counts.contextAbsent,23);assert.equal(r.pilot.size,24);
 assert.equal(r.pilot.strata.passNoContext.structuralZero,true);});
test('no customer outcome observations never means zero measured successes',()=>{const r=assay(fixture());
 assert.equal(r.independentOutcomeState.readerTask,'unmeasured');
 assert.equal(r.independentOutcomeState.verifiedReaderSuccesses,null);
 assert.equal(r.inference.positivePredictiveValue,null);
 assert.deepEqual(r.inference.noReaderLabelBounds,[0,1]);});
test('missing positivity blocks context effect within passing stratum',()=>{const r=assay(fixture());
 assert.equal(r.inference.contextEffectWithinPassingStratumIdentifiable,false);});
test('stratum with no population cannot be selected',()=>{const p=fixture();p.sampleTargets.passNoContext=1;
 assert.throws(()=>assay(p),/invalid pinned aggregate/);});
test('nonexistent Gregorian day rejected, leap day admitted',()=>{const p=fixture();
 p.source.observedAt='2026-02-29T12:00:00Z';assert.throws(()=>assay(p),/invalid pinned aggregate/);
 p.source.observedAt='2024-02-29T12:00:00Z';assert.equal(assay(p).counts.cohort,76);});
test('private extra source and cohort drift fail closed',()=>{const p=fixture();p.source.clientName='private';
 assert.throws(()=>assay(p),/invalid pinned aggregate/);
 const q=fixture();q.cohort=77;assert.throws(()=>assay(q),/invalid pinned aggregate/);});
test('one reader label is not evidence for a predictive claim',()=>{const p=fixture();
 p.independentLabels.readerTaskArticles=1;const r=assay(p);
 assert.equal(r.inference.positivePredictiveValue,'not-estimated');
 assert.equal(r.independentOutcomeState.verifiedReaderSuccesses,null);});
test('sampling is explicitly weighted, without a fabricated zero cell',()=>{const r=assay(fixture());
 assert.equal(r.pilot.strata.passContext.inclusionProbability,12/38);
 assert.equal(r.pilot.strata.failContext.inverseProbabilityWeight,15/6);
 assert.equal(r.pilot.strata.passNoContext.inclusionProbability,null);});
test('pilot cannot be described as admitted without selections',()=>{const p=fixture();
 p.sampleTargets={passContext:0,passNoContext:0,failContext:0,failNoContext:0};
 assert.throws(()=>assay(p),/no pilot sample admitted/);});
