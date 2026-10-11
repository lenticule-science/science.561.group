import test from 'node:test';
import assert from 'node:assert/strict';
import {assessCurrentEditorialTarget} from './evidence-assay.mjs';
const policy = {profiles:{
  'current-news-brief/v1':{evidenceBudget:{targetWords:{minimum:300},minimumSections:1}},
  'standard-news/v1':{evidenceBudget:{targetWords:{minimum:700},minimumSections:3}},
  'deep-report/v1':{evidenceBudget:{targetWords:{minimum:1200},minimumSections:4}}
}};
const record=()=>({articleUrl:'https://koios.news/posts/illustrative-article/',profile:'current-news-brief/v1',profileEvidence:'publisher-profile-receipt',articleVersionDigest:'a'.repeat(64),versionObservedAt:'2026-10-11T03:04:38Z',bodyWords:118,contextSections:0});
const trusted={verifyPolicy:()=>true,verifyArticle:()=>true};
test('observed short article can fail a current quality target without implying reader harm',()=>{const a=assessCurrentEditorialTarget(record(),policy,trusted);assert.equal(a.classification,'observed-current-target');assert.equal(a.currentTargetGap,true);assert.equal(a.historicalPolicyBreach,'unassessed');assert.equal(a.readerComprehensionImpact,'unmeasured');});
test('the identical observation remains reported without authenticated article readback',()=>{const a=assessCurrentEditorialTarget(record(),policy,{verifyPolicy:()=>true});assert.equal(a.classification,'reported-current-target');assert.equal(a.articleMetricsAuthenticated,false);});
test('cannot apply an unverified policy as the authoritative quality target',()=>{const a=assessCurrentEditorialTarget(record(),policy,{verifyArticle:()=>true});assert.equal(a.classification,'indeterminate');assert.equal(a.currentTargetGap,'unknown');});
test('guessing a profile from article title is insufficient',()=>{const r=record();r.profileEvidence='headline-guess';assert.equal(assessCurrentEditorialTarget(r,policy,trusted).classification,'indeterminate');});
test('profile-specific thresholds preserve category distinctions',()=>{const r=record();r.bodyWords=450;r.contextSections=2;assert.equal(assessCurrentEditorialTarget(r,policy,trusted).currentTargetGap,false);r.profile='standard-news/v1';assert.equal(assessCurrentEditorialTarget(r,policy,trusted).currentTargetGap,true);r.profile='deep-report/v1';assert.equal(assessCurrentEditorialTarget(r,policy,trusted).currentTargetGap,true);});
test('incomplete metrics cannot masquerade as no gap',()=>{const r=record();delete r.contextSections;assert.equal(assessCurrentEditorialTarget(r,policy,trusted).currentTargetGap,'unknown');});
test('false or thrown provider verifier cannot certify field measurement',()=>{assert.equal(assessCurrentEditorialTarget(record(),policy,{verifyPolicy:()=>true,verifyArticle:()=>({ok:true})}).classification,'reported-current-target');assert.equal(assessCurrentEditorialTarget(record(),policy,{verifyPolicy:()=>true,verifyArticle:()=>{throw Error('offline');}}).classification,'reported-current-target');});
test('fragments and query tokens cannot enter public article links',()=>{for(const u of ['https://koios.news/posts/a?token=secret','https://koios.news/posts/a#private']){const r=record();r.articleUrl=u;assert.throws(()=>assessCurrentEditorialTarget(r,policy,trusted),/safe article URL/);}});
test('missing immutable article version never authenticates a current observation',()=>{const r=record();delete r.articleVersionDigest;assert.equal(assessCurrentEditorialTarget(r,policy,trusted).classification,'indeterminate');});
test('malformed or undated article version cannot be certified',()=>{const r=record();r.articleVersionDigest='main';assert.equal(assessCurrentEditorialTarget(r,policy,trusted).classification,'indeterminate');r.articleVersionDigest='b'.repeat(64);r.versionObservedAt='tomorrow';assert.equal(assessCurrentEditorialTarget(r,policy,trusted).classification,'indeterminate');});
