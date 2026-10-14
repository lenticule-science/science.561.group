import test from 'node:test';
import assert from 'node:assert/strict';
import {assayClaimLineage as assay} from './claim-lineage-assay.mjs';
const source=(claimRef,kind='fact',more={})=>({
 claimRef,propositionRef:`proposition-${claimRef}`,scopeRef:'world-and-time-v1',
 kind,sourceRevision:'koios-article-source-v7',sourceRef:'source-provider:replayable-1',
 ...(kind==='commitment'||kind==='forecast'?{horizonRef:'2027',conditionsRef:'declared-conditions-v1'}:{}),...more
});
const render=(s,more={})=>({
 claimRef:`reader-${s.claimRef}`,sourceClaimRef:s.claimRef,propositionRef:s.propositionRef,
 scopeRef:s.scopeRef,kind:s.kind,sourceRevision:s.sourceRevision,
 ...(s.horizonRef?{horizonRef:s.horizonRef,conditionsRef:s.conditionsRef}:{}),...more
});
const pack=(s,r,required=[...s.map(x=>x.claimRef)])=>({
 workRef:'causeway-services/koios-news#4',sourceRevision:'koios-article-source-v7',
 requiredClaimRefs:required,sourceClaims:s,renderedClaims:r
});
test('short but complete brief is structurally complete without word quota',()=>{
 const s=[source('a')]; const x=assay(pack(s,[render(s[0])]));
 assert.equal(x.status,'structurally-consistent');assert.equal(x.taskCoverage,1);
});
test('longer story with omitted commissioned question is incomplete',()=>{
 const s=[source('a'),source('b')],x=assay(pack(s,[render(s[0])]));
 assert.equal(x.status,'task-incomplete');assert.deepEqual(x.missingRequired,['b']);
});
test('commitment upgraded to accomplished fact is not preserved',()=>{
 const s=source('build','commitment');
 const x=assay(pack([s],[render(s,{kind:'fact'})]));
 assert.equal(x.status,'structural-mismatch');
 assert.equal(x.findings[0].status,'changed-evidential-act');
});
test('attributed claim upgraded to unqualified assertion is not preserved',()=>{
 const s=source('reported','attributed');
 assert.equal(assay(pack([s],[render(s,{kind:'fact'})])).status,'structural-mismatch');
});
test('actual fact arbitrarily weakened to a scenario is not equivalent',()=>{
 const s=source('verified');
 assert.equal(assay(pack([s],[render(s,{kind:'scenario'})])).findings[0].status,'changed-evidential-act');
});
test('forecast cannot lose its horizon',()=>{
 const s=source('market','forecast');
 const x=assay(pack([s],[render(s,{horizonRef:'2028'})]));
 assert.equal(x.findings[0].status,'changed-proposition-or-scope');
});
test('forecast cannot silently change conditions',()=>{
 const s=source('market','forecast');
 const x=assay(pack([s],[render(s,{conditionsRef:'if-another-condition'})]));
 assert.equal(x.status,'structural-mismatch');
});
test('a forecast without required horizon or conditions refuses admission',()=>{
 const s=source('market','forecast',{horizonRef:undefined});
 assert.throws(()=>assay(pack([s],[])),/temporal\/conditional scope required/);
 const c=source('market','commitment',{conditionsRef:undefined});
 assert.throws(()=>assay(pack([c],[])),/temporal\/conditional scope required/);
});
test('oversized commissioned source set refuses before allocating a worklist',()=>{
 const s=source('a');
 const input=pack([s],[render(s)],Array.from({length:10001},(_,i)=>'required-'+i));
 assert.throws(()=>assay(input),/invalid claim-lineage packet/);
});
test('source revision mismatch cannot silently pass',()=>{
 const s=source('a');
 assert.equal(assay(pack([s],[render(s,{sourceRevision:'v8'})])).status,'structural-mismatch');
});
test('fake generated source references are not accepted',()=>{
 const s=source('a');
 assert.equal(assay(pack([s],[render(s,{sourceClaimRef:'invented'})])).findings[0].status,'no-declared-source');
});
test('rendered proposition drift is not silently treated as same fact',()=>{
 const s=source('a');
 assert.equal(assay(pack([s],[render(s,{propositionRef:'other'})])).status,'structural-mismatch');
});
test('no authored required claims yields null coverage, not 100%',()=>{
 const s=source('a');
 const x=assay(pack([s],[render(s)],[]));
 assert.equal(x.taskCoverage,null); assert.equal(x.status,'task-unassessable');
});
test('same source and rendered claims in different orders yield same assay',()=>{
 const s=[source('a'),source('b')],r=s.map(x=>render(x));
 assert.deepEqual(assay(pack(s,r)),assay(pack([...s].reverse(),[...r].reverse())));
});
test('duplicate source identity is refused',()=>{
 const s=source('a');assert.throws(()=>assay(pack([s,s],[render(s)],['a'])),/duplicate source/);
});
test('duplicate rendered identity is refused',()=>{
 const s=source('a'),r=render(s);assert.throws(()=>assay(pack([s],[r,r])),/duplicate rendered/);
});
test('missing task source is refused, never called delivered',()=>{
 const s=source('a');assert.throws(()=>assay(pack([s],[render(s)],['nonexistent'])),/missing source/);
});
test('unsupported kinds fail closed rather than inventing an ordering',()=>{
 const s=source('a','unambiguous-hope');assert.throws(()=>assay(pack([s],[])),/invalid source/);
});
test('malformed claim without source identity fails',()=>{
 const s=source('a','fact',{sourceRef:undefined});
 assert.throws(()=>assay(pack([s],[])),/source provenance required/);
});


test('grant program eligibility rule does not establish a particular applicant is eligible',()=>{
 const s=source('grant-rule','attributed');
 const result=assay(pack([s],[render(s,{kind:'fact',propositionRef:'applicant-eligible'})]));
 assert.equal(result.status,'structural-mismatch');
 assert.equal(result.taskCoverage,0);
});
test("an AI-generated mention cannot stand in for a customer's completed conversion",()=>{
 const s=source('ai-mention','attributed');
 const result=assay(pack([s],[render(s,{propositionRef:'customer-conversion',kind:'fact'})]));
 assert.equal(result.status,'structural-mismatch');
});
test('a claim not required by the commission can be included with honest lineage',()=>{
 const s=[source('a'),source('b')];
 const result=assay(pack(s,s.map(render),['a']));
 assert.equal(result.status,'structurally-consistent');
 assert.equal(result.requiredCount,1);
});
