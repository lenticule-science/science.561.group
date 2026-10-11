import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {validateEvidence, countIndependentEvents, forEditorialReview} from '../services/natural-science-services-section/services/biological-science-services-section/services/ecology-services-section/data/manoomin-evidence.mjs';

const file=new URL('../services/natural-science-services-section/services/biological-science-services-section/services/ecology-services-section/data/manoomin-evidence.json',import.meta.url);
const source=JSON.parse(readFileSync(file,'utf8'));
const copy=()=>structuredClone(source);
const byId=(d,id)=>d.claims.find(c=>c.id===id);

test('the source-owned evidence table validates with known questions still unresolved',()=>{
 assert.deepEqual(validateEvidence(source),[]);
 assert.equal(byId(source,'current-import-eligibility').status,'unresolved');
 assert.equal(byId(source,'american-native-host-infection').status,'unresolved');
 assert.equal(source.release_gates.current_us_violation_confirmed,false);
 assert.equal(source.release_gates.scholarly_accepted,false);
});

test('unknown commodity legality cannot become fact without an exact official ruling',()=>{
 const d=copy();byId(d,'current-import-eligibility').status='documented';
 assert.match(validateEvidence(d).join(' '),/commodity status lacks official specific ruling/);
});

test('native infection cannot be declared from a secondary agency host list',()=>{
 const d=copy();byId(d,'american-native-host-infection').status='documented';
 assert.match(validateEvidence(d).join(' '),/native infection lacks direct diagnosis/);
});

test('a Reddit report cannot become an independently observed retail violation',()=>{
 const d=copy();byId(d,'retail-jiaobai-reports').status='documented';
 assert.match(validateEvidence(d).join(' '),/reposted retail report promoted/);
});

test('public allegation and scientific acceptance require distinct independent receipts',()=>{
 const d=copy();d.release_gates.current_us_violation_confirmed=true;d.release_gates.scholarly_accepted=true;
 assert.match(validateEvidence(d).join(' '),/public violation allegation has no official determination/);
 assert.match(validateEvidence(d).join(' '),/scientific acceptance has no independent receipt/);
});

test('duplicate references and unbounded claims cannot silently pass',()=>{
 const d=copy();d.claims.push(structuredClone(d.claims[0]));
 assert.match(validateEvidence(d).join(' '),/duplicate claim id/);
 const e=copy();byId(e,'riverside-2017-introduced-host').limits=[];
 assert.match(validateEvidence(e).join(' '),/no bounded limitations/);
 const f=copy();byId(f,'culturable-at-harvest').source_ids=['not-a-source'];
 assert.match(validateEvidence(f).join(' '),/unresolved source ref/);
});

test('one specimen event copied across herbaria still counts once',()=>{
 const examples=[
  {independent_event:'1911-scofield-exchange-no-58',status:'source_report'},
  {independent_event:'1911-scofield-exchange-no-58',status:'source_report'},
  {independent_event:'1911-scofield-exchange-no-58',status:'source_report'},
  {independent_event:'second-observation',status:'documented'},
  {independent_event:'third-party-repost',status:'reported'}
 ];
 assert.equal(countIndependentEvents(examples),2);
});

test('newsroom projection carries only bounded assertions, never automatic publication',()=>{
 const claims=forEditorialReview(source);
 assert.ok(claims.length>0);
 assert.ok(claims.every(c=>c.eligible_for_publication===false&&c.source_refs.length>0&&c.limitations.length>0));
 assert.equal(claims.some(c=>c.id==='current-import-eligibility'),false);
 assert.equal(claims.some(c=>c.id==='american-native-host-infection'),false);
 assert.equal(claims.some(c=>c.id==='retail-jiaobai-reports'),false);
 assert.equal(claims.some(c=>c.id==='culturable-at-harvest'),true);
});
