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


test('every claim carries an exact reader-checkable source locator',()=>{
 assert.ok(source.claims.every(c=>typeof c.source_locator==='string'&&c.source_locator.length>25));
 const broken=copy();byId(broken,'culturable-at-harvest').source_locator='';
 assert.match(validateEvidence(broken).join(' '),/missing source_locator/);
});

test('strain experiments cannot be replaced by a reddit post or generic advice',()=>{
 const broken=copy(),claim=byId(broken,'cultivated-strain-pathogenicity-diff');
 claim.source_ids=['reddit-2026'];
 assert.match(validateEvidence(broken).join(' '),/strain pathogenicity claim requires experimental study/);
});

test('a federal high-risk screen establishes neither native infection nor a retail prohibition',()=>{
 const claim=byId(source,'fws-introduced-plant-high-risk');
 assert.equal(claim.status,'source_report');
 assert.equal(claim.track,'plant_invasion');
 assert.match(claim.limits.join(' '),/not a documented local/);
 const broken=copy();byId(broken,'fws-introduced-plant-high-risk').source_ids=['reddit-2026'];
 assert.match(validateEvidence(broken).join(' '),/invasive plant claim lacks plant-specific evidence/);
});

test('imprecise publication dates cannot quietly become specific invented dates',()=>{
 const broken=copy();broken.sources.find(s=>s.id==='eppo-2024').date='2024-11-09';
 assert.match(validateEvidence(broken).join(' '),/imprecise year recorded as exact date/);
 const other=copy();other.sources.find(s=>s.id==='datcp-2025').date='2025-01-01';
 assert.match(validateEvidence(other).join(' '),/undated webpage given false publication date/);
});

test('the organism life-cycle question and food survival question are separate',()=>{
 assert.equal(byId(source,'cultivated-strain-pathogenicity-diff').status,'documented');
 assert.equal(byId(source,'retail-strain-and-shipping-risk').status,'unresolved');
 assert.equal(forEditorialReview(source).some(c=>c.id==='retail-strain-and-shipping-risk'),false);
});

test('mixed evidence tracks cannot masquerade as independent biological events',()=>{
 assert.throws(()=>countIndependentEvents(source.claims),/specify a single evidence track/);
 assert.ok(countIndependentEvents(source.claims,'plant_invasion')>=2);
 const cases=[
  {track:'historical_specimen',independent_event:'same-1911-exchange',status:'source_report'},
  {track:'historical_specimen',independent_event:'same-1911-exchange',status:'source_report'},
  {track:'historical_specimen',independent_event:'same-1911-exchange',status:'source_report'}
 ];
 assert.equal(countIndependentEvents(cases,'historical_specimen'),1);
});

test('mixed strain experiments refute a blanket sterile edible gall conclusion',()=>{
 const mixed=byId(source,'mixed-strain-pairs-infect-asian-host');
 assert.equal(mixed.status,'documented');
 assert.equal(mixed.track,'fungal_life_cycle');
 assert.ok(mixed.source_ids.includes('zhang-2017'));
 assert.match(mixed.statement,/MT-type.*T-type|T-type.*MT-type/);
 assert.match(mixed.limits.join(' '),/not establish host compatibility|not measured/);
});

test('contemporary market evidence remains separate from historic US research plantings',()=>{
 const historical=byId(source,'historic-us-living-plantings');
 assert.equal(historical.status,'source_report');
 assert.match(historical.limits.join(' '),/historical plantings/);
 assert.equal(byId(source,'current-import-eligibility').status,'unresolved');
});

test('published tribal stewardship agendas cannot become completed work by implication',()=>{
 const agenda=byId(source,'wrsc-2026-oct7-agenda');
 const restoration=byId(source,'mn-fdl-restoration-proposal-2026');
 assert.equal(agenda.status,'source_report');
 assert.equal(restoration.status,'source_report');
 assert.match(agenda.limits.join(' '),/does not verify/);
 assert.match(restoration.limits.join(' '),/not proof/);
});

test('noxious-weed enumeration absence is never U.S. import authorization',()=>{
 const enumeration=byId(source,'not-designated-federal-noxious-weed-in-list');
 assert.equal(enumeration.track,'regulatory_classification');
 assert.equal(enumeration.status,'source_report');
 assert.match(enumeration.limits.join(' '),/not an import approval/);
 assert.equal(byId(source,'current-import-eligibility').status,'unresolved');
});

test('primary studies require a real experimental extraction',()=>{
 const primaries=source.sources.filter(s=>s.kind==='primary_study');
 assert.equal(primaries.length,4);
 for(const row of primaries){
  assert.ok(row.study_extraction?.sampling_unit);
  assert.ok(row.study_extraction?.method);
  assert.ok(row.study_extraction?.directly_observed);
  assert.ok(row.study_extraction?.not_measured);
 }
 const broken=copy();
 delete broken.sources.find(s=>s.id==='zhang-2017').study_extraction.sampling_unit;
 assert.match(validateEvidence(broken).join(' '),/primary study missing sampling_unit: zhang-2017/);
});

test('downstream evidence projection carries primary study methods and missing tests',()=>{
 const facts=forEditorialReview(source);
 const finding=facts.find(c=>c.id==='cultivated-strain-pathogenicity-diff');
 const zhang=finding.source_refs.find(s=>s.id==='zhang-2017');
 assert.match(zhang.sampling_unit,/Four selected|Four/);
 assert.match(zhang.not_measured,/North American|native American/);
 assert.match(zhang.directly_observed,/MT\/MT/);
 assert.equal(finding.eligible_for_publication,false);
});

test('experimental observations cannot be promoted into retail viability prevalence',()=>{
 const tu=source.sources.find(s=>s.id==='tu-2019').study_extraction;
 assert.match(tu.sampling_unit,/Five harvested/);
 assert.match(tu.not_measured,/retail consignment survey/);
 const cross=source.sources.find(s=>s.id==='zhang-2017').study_extraction;
 assert.match(cross.directly_observed,/T\/MT/);
 assert.match(cross.not_measured,/commercial shipment/);
});

test('Climate 6 score is not an invasion probability',()=>{
 const claim=byId(source,'great-lakes-high-climate-match');
 assert.equal(claim.status,'source_report');
 assert.equal(claim.measurement.quantity,0.814);
 assert.equal(claim.measurement.forecast_probability,false);
 assert.match(claim.measurement.denominator,/target points/);
 assert.match(claim.limits.join(' '),/not an 81.4% invasion probability/);
 const broken=copy();byId(broken,'great-lakes-high-climate-match').measurement.forecast_probability=true;
 assert.match(validateEvidence(broken).join(' '),/must not be relabeled invasion probability/);
});

test('wrong denominator or impossible climate ratio fails scientific admission',()=>{
 const broken=copy();byId(broken,'great-lakes-high-climate-match').measurement.denominator='';
 assert.match(validateEvidence(broken).join(' '),/measurement lacks valid quantity unit or denominator/);
 const badFraction=copy();byId(badFraction,'great-lakes-high-climate-match').measurement.quantity=1.12;
 assert.match(validateEvidence(badFraction).join(' '),/fraction outside unit interval/);
});

test('herbarium, planted records and wild established populations remain distinct',()=>{
 const claim=byId(source,'contiguous-us-mapped-records-not-wild');
 assert.equal(claim.track,'us_introductions');
 assert.match(claim.statement,/do not represent established wild populations/);
 assert.match(claim.source_locator,/Figure 2/);
 const old=byId(source,'historic-us-living-plantings');
 assert.match(old.limits.join(' '),/non-established wild populations/);
});

test('Guo and Chigira primary samples have actual accession and country provenance',()=>{
 const guo=source.sources.find(s=>s.id==='guo-2015').study_extraction;
 assert.match(guo.sampling_unit,/HSD2/);
 assert.match(guo.sampling_unit,/Zhejiao2/);
 assert.match(guo.sampling_unit,/Jiayou1/);
 assert.match(guo.evidence_access,/Table 1/);
 const chigira=source.sources.find(s=>s.id==='chigira-2023').study_extraction;
 assert.match(chigira.sampling_unit,/nine sourced from Japan/);
 assert.match(chigira.sampling_unit,/MAFF 305616/);
 assert.match(chigira.evidence_access,/Table 4/);
});
