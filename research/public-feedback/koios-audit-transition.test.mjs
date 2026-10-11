import test from 'node:test';
import assert from 'node:assert/strict';
import {compareKoiosProducerAudits} from './koios-audit-transition.mjs';
const sha='a'.repeat(40),sha2='b'.repeat(40),sha3='c'.repeat(40);
function frame(at){
 const issue={number:4,url:'https://github.com/causeway-services/koios-news/issues/4',
  body:'38 published articles lack the current minimum depth or contextual sections.'};
 return {pin:{websiteRepo:'causeway-services/koios-news',websiteCommit:sha,gitlinkPath:'data',
  gitlinkTarget:sha2,feedbackRepo:'causeway-services/koios-news-data',feedbackCommit:sha2,
  feedbackPath:'feedback/latest.json',feedbackBlob:sha3},feedback:{
   kind:'koios.news.observed-feedback/v1',observedAt:at,
   sensors:{publication:{articleRoutes:['posts/article-one/index.html','posts/article-two/index.html']},
    editorialFeedback:{issues:[issue]}},
   articles:[{slug:'article-one',ok:false,words:110,sections:0,failures:['insufficient-reporting-depth']},
    {slug:'article-two',ok:true,words:730,sections:3,failures:[]}]
 }};
}
const input=()=>({earlier:frame('2026-10-11T12:31:36.699Z'),later:frame('2026-10-11T16:51:53.702Z')});
const trust={verifyCarrier:()=>true};
const run=(fn,opts=trust)=>{const x=input();if(fn)fn(x);return compareKoiosProducerAudits(x,opts)};
test('freshened producer timestamp with identical per-article assays is not independent customer evidence',()=>{
 const r=run();assert.equal(r.identicalAssayRows,true);assert.equal(r.changedArticleAssayCount,0);
 assert.equal(r.independentFieldObservations,0);assert.equal(r.customerOutcomes,'unmeasured');
 assert.equal(r.sourceVersionMatch,'unknown-not-identified-by-producer-assay-records');
});
test('change to one article metric has precisely one producer-assay transition',()=>{
 const r=run(x=>x.later.feedback.articles[0].words=310);
 assert.deepEqual(r.changedArticleSlugs,['article-one']);assert.equal(r.identicalAssayRows,false);
});
test('retiring and adding different slugs are not conflated by equal aggregate count',()=>{
 const r=run(x=>{x.later.feedback.articles[0].slug='article-three';});
 assert.deepEqual(r.addedArticleAssays,['article-three']);assert.deepEqual(r.removedArticleAssays,['article-one']);
});
test('manifest route turnover is detected even when manifest count stays unchanged',()=>{
 const r=run(x=>x.later.feedback.sensors.publication.articleRoutes[0]='posts/article-three/index.html');
 assert.deepEqual(r.addedPublishedRoutes,['posts/article-three/index.html']);
 assert.deepEqual(r.removedPublishedRoutes,['posts/article-one/index.html']);
});
test('reports are not independent even when issue timestamp changes',()=>{
 const r=run(x=>x.later.feedback.sensors.editorialFeedback.issues[0].body='Observed 2026-10-11T16:00:00Z.\n\n38 published articles lack the current minimum depth or contextual sections.');
 assert.equal(r.identicalAssayRows,true);assert.equal(r.independentFieldObservations,0);
});
test('untrusted readback does not expose comparison as verified',()=>{
 const r=run(null,{verifyCarrier:()=>({verified:true})});
 assert.equal(r.sourceIntegrity,'unverified');assert.equal(r.producerComparison,'unavailable');
});
test('verifier exceptions fail closed',()=>assert.equal(run(null,{verifyCarrier:()=>{throw Error('provider down')}}).producerComparison,'unavailable'));
test('inconsistent Gitlink rejected even with friendly verifier',()=>assert.throws(()=>run(x=>x.earlier.pin.gitlinkTarget=sha3),/source provenance/));
test('reversed clock cannot represent a forward transition',()=>assert.throws(()=>run(x=>x.later.feedback.observedAt='2026-10-11T10:00:00Z'),/strictly follow/));
test('same timestamp is not a second observation',()=>assert.throws(()=>run(x=>x.later.feedback.observedAt=x.earlier.feedback.observedAt),/strictly follow/));
test('duplicate slug never counts as second audited item',()=>assert.throws(()=>run(x=>x.later.feedback.articles[1].slug='article-one'),/duplicate slug/));
test('duplicate manifest route rejected',()=>assert.throws(()=>run(x=>x.later.feedback.sensors.publication.articleRoutes[1]='posts/article-one/index.html'),/route set/));
test('contradictory ok / failures rejected',()=>assert.throws(()=>run(x=>x.later.feedback.articles[0].ok=true),/contradictory assay/));
test('source absolute paths are never emitted in the public comparison',()=>{
 const r=run(x=>x.later.feedback.articles[0].path='/sensitive/operational/file.md');
 assert.ok(!JSON.stringify(r).includes('/sensitive/'));
});
test('reported issue mismatch is distinguished from field receiving',()=>{
 const r=run();assert.equal(r.issueReportAgreesWithAssays,false);
 assert.equal(r.customerOutcomes,'unmeasured');
});
