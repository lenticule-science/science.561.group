import assert from 'node:assert/strict';
import {mkdtemp,mkdir,writeFile,rm} from 'node:fs/promises';
import {join} from 'node:path';import {tmpdir} from 'node:os';import {createRequire} from 'node:module';import {createHash} from 'node:crypto';import {request} from 'node:http';
const g=new URL('../../../../../',import.meta.url).pathname;const l=new URL('../',import.meta.url).pathname;const require=createRequire(l+'package.json');
const {lSpaceMetroplat}=await import(l+'src/metroplat.mjs');
const {startNativeApplication}=await import(require.resolve('@red-cup-engineering/computer-web-server/native-application'));
const {createSessionCookie}=await import(require.resolve('@red-cup-engineering/computer-web-server/admission/session'));
const host='services/engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/services/multi-agent-computer-system-engineering-services-section/services/multi-agent-computer-platform-engineering-services-section/apps/feltos-enterprise-host/';
const {createEnterpriseEntrance}=await import(g+host+'src/entrance.mjs');
import test from 'node:test';
test('Group knowledge composes with science reading without expanding author authority',async()=>{
const scratch=await mkdtemp(join(tmpdir(),'rowan-group-boundary-'));let server;const socket=join(scratch,'entrance.sock');
const fetch=(path,headers={},method='GET',body)=>new Promise((resolve,reject)=>{const req=request('http://corpus.test'+path,{socketPath:socket,method,headers:{connection:'close',...headers}},res=>{let text='';res.setEncoding('utf8');res.on('data',s=>text+=s);res.on('end',()=>resolve({status:res.statusCode,text,location:res.headers.location}));});req.on('error',reject);req.end(body);});
try {
const root=join(scratch,'services'),science=join(root,'science-services-section'),group=join(root,'561-group-services-section/content/text');await mkdir(science,{recursive:true});await mkdir(join(group,'private'),{recursive:true});await mkdir(join(root,'operations/runtime'),{recursive:true});await mkdir(join(scratch,'reviews'));
await writeFile(join(science,'claim.md'),'---\ntitle: Scientific claim\n---\n[Purpose](../561-group-services-section/content/text/purpose.md#purpose)\n');await writeFile(join(group,'purpose.md'),'---\ntitle: Living purpose\n---\n# Purpose\nKnowledge supports actual human purposes.');await writeFile(join(group,'private/hidden.md'),'Forbidden private material');await writeFile(join(root,'operations/runtime/receipt.md'),'Forbidden runtime material');await writeFile(join(scratch,'reviews/author.json'),JSON.stringify({email:'author@fixture.invalid'}));
const config={allowedEmail:'author@fixture.invalid',repositoryRoot:scratch,stateDir:join(scratch,'state'),publicBaseUrl:'http://corpus.test',sessionSecret:'fixture-secret-must-be-long-enough-123456',google:{clientId:'fixture',clientSecret:'fixture'},instance:{name:'corpus',title:'Corpus'}};let selected;
const entrance=createEnterpriseEntrance(config,{federation:{clients:new Map(),tools:[],unavailable:[]},applications:[{factory:context=>(selected=lSpaceMetroplat({...context,configuration:{root,sciencePrefix:'science-services-section',reviewRoot:join(scratch,'reviews'),authoringRoot:science,readerEmails:'reader@fixture.invalid,author@fixture.invalid'}}))}]});server=await startNativeApplication(entrance.app,{path:socket});
const cookie=email=>createSessionCookie({name:'metroplat_session',subject:email,subjectHash:createHash('sha256').update(email).digest('hex'),email,secret:config.sessionSecret,now:Date.now}).split(';')[0];const reader={cookie:cookie('reader@fixture.invalid')};
const search=await selected.tools.find(t=>t.name==='lspace_search').handler({query:'"Living purpose"'});assert.ok(search.results.some(r=>r.id==='561-group-services-section/content/text/purpose.md'));
const old=await fetch('/knowledge?document=claim.md',reader);assert.equal(old.status,200);assert.match(old.text,/href="http:\/\/corpus.test\/knowledge\?document=561-group-services-section%2Fcontent%2Ftext%2Fpurpose.md#purpose"/);
assert.equal((await fetch('/knowledge?document=561-group-services-section%2Fcontent%2Ftext%2Fpurpose.md',reader)).status,200);
const oldRoom=createHash('sha256').update('claim.md').digest('hex');const room=await fetch('/knowledge?room='+oldRoom,reader);assert.equal(room.status,303);assert.equal(room.location,'/knowledge?document=science-services-section%2Fclaim.md');
for(const id of ['561-group-services-section/content/text/private/hidden.md','operations/runtime/receipt.md']) await assert.rejects(selected.tools.find(t=>t.name==='lspace_fetch').handler({id}));
assert.equal((await fetch('/knowledge/public?document=561-group-services-section%2Fcontent%2Ftext%2Fpurpose.md')).status,404);
const author={cookie:cookie('author@fixture.invalid')};const authorRead=await fetch('/geode/api/note?path=claim.md',author);assert.equal(authorRead.status,200);
const revision=JSON.parse(authorRead.text).revision;const replacement='---\ntitle: Scientific claim\n---\nAuthor change stays in science.\n';
assert.equal((await fetch('/geode/api/action',{...author,'content-type':'application/json'},'POST',JSON.stringify({action:'geode.note.replace',revision,value:{path:'claim.md',markdown:replacement}}))).status,200);
assert.match((await selected.tools.find(t=>t.name==='lspace_fetch').handler({id:'claim.md'})).text,/Author change stays in science/);
assert.equal((await fetch('/knowledge?document=science-services-section%2Fclaim.md',reader)).status,200);assert.notEqual((await fetch('/geode/api/note?path=../561-group-services-section/content/text/purpose.md',author)).status,200);
assert.equal((await fetch('/geode/api/note?path=claim.md',reader)).status,403);
console.log('PROVED: canonical Group discovery and cross-boundary navigation; old science read ids and room bookmarks; private/runtime refusal; unchanged science-only authoring and reader write refusal.');
} finally {await server?.close();await rm(scratch,{recursive:true,force:true});}

});

test('non-knowledge Markdown cannot consume the admitted scan bound',async()=>{
  const {observeMarkdownVaultDirectory}=await import(g+'services/engineering-services-section/services/computer-engineering-services-section/services/computer-data-engineering-services-section/services/computer-content-engineering-services-section/services/typed-computer-content-engineering-services-section/services/computer-text-data-services-section/services/markdown-engineering-services-section/src/observe-markdown-vault-directory.mjs');
  const root=await mkdtemp(join(tmpdir(),'rowan-admitted-scan-'));
  try {
    await mkdir(join(root,'content/text'),{recursive:true});
    await writeFile(join(root,'a-runtime.md'),'runtime');
    await writeFile(join(root,'content/text/knowledge.md'),'knowledge');
    const result=await observeMarkdownVaultDirectory({root,maxScan:1,limit:1,admitPath:path=>path.startsWith('content/text/')});
    assert.deepEqual(result.paths,['content/text/knowledge.md']);assert.equal(result.truncated,false);
  } finally {await rm(root,{recursive:true,force:true});}
});


test('an exact admitted source-relative link needs no whole-corpus observation',async()=>{
  const {resolveReadingLinks}=await import('../src/reading-links.mjs');
  const tree={blocks:[{kind:'link',href:'../purpose.md#purpose',label:'Purpose'}]};
  await resolveReadingLinks(tree,{document:'science/claim.md',archive:{
    admit:path=>assert.equal(path,'purpose.md'),
    resolveLink:()=>{throw new Error('Whole-corpus observation is unnecessary');},
  },documentUrl:id=>'https://corpus.test/knowledge?document='+encodeURIComponent(id)});
  assert.equal(tree.blocks[0].href,'https://corpus.test/knowledge?document=purpose.md#purpose');
});
