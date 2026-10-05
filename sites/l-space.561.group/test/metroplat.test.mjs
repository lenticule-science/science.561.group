import assert from 'node:assert/strict';
import {request} from 'node:http';
import {createRequire} from 'node:module';
import {mkdtemp,writeFile,mkdir,rm} from 'node:fs/promises';
import {tmpdir} from 'node:os';
import {join} from 'node:path';
const group=new URL('../../../../../', import.meta.url).pathname;
const host='services/engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/services/multi-agent-computer-system-engineering-services-section/services/multi-agent-computer-platform-engineering-services-section/apps/feltos-enterprise-host/';
const {createEnterpriseEntrance}=await import(group+host+'src/entrance.mjs');
const {startNativeApplication}=await import(createRequire(group+host+'package.json').resolve('@red-cup-engineering/computer-web-server/native-application'));
const {lSpaceMetroplat}=await import('../src/metroplat.mjs');
// A private Unix socket exercises native HTTP without WSL loopback forwarding.
let socketPath;
const fetch = (url, options = {}) => new Promise((resolve, reject) => {
  const form = options.body instanceof URLSearchParams;
  const req = request(url, {socketPath, method:options.method ?? 'GET', headers:{connection:'close', ...(form ? {'content-type':'application/x-www-form-urlencoded'} : {}), ...options.headers}}, res => {
    let body='';res.setEncoding('utf8');res.on('data', chunk => {body+=chunk;});
    res.on('end', () => resolve({status:res.statusCode, headers:{get:name => res.headers[name.toLowerCase()] ?? null}, text:async()=>body, json:async()=>JSON.parse(body)}));
  });
  req.on('error',reject);req.setTimeout(10000,()=>req.destroy(new Error('loopback response timeout')));
  req.end(form ? options.body.toString() : options.body);
});
import test from 'node:test';
test('the FeltOS entrance serves one admitted corpus to HTTP and MCP', async () => {
const scratch=await mkdtemp(join(tmpdir(),'rowan-corpus-proof-'));
let server;
try {
 const root=join(scratch,'corpus');await mkdir(root);const markdown='---\ntitle: Hearth evidence\ndescription: Carrier proof\n---\n# Hearth\nSHRIMP composition preserves <meaning> & evidence.\n\n[[Shared name]]\n';await writeFile(join(root,'hearth.md'),markdown);
 const config={repositoryRoot:scratch,stateDir:join(scratch,'state'),publicBaseUrl:'http://corpus.test',sessionSecret:'fixture-secret-must-be-long-enough-123456',instance:{name:'corpus-test',title:'Corpus test'}};
 await writeFile(join(root,'public.md'),'---\ntitle: Shared hearth\nvisibility: public\n---\nKnowledge shared deliberately.\n');
 await writeFile(join(root,'reading-one.md'),'---\ntitle: Shared name\n---\nOne distinct reading.\n');await writeFile(join(root,'reading-two.md'),'---\ntitle: Shared name\n---\nAnother distinct reading.\n');
 await mkdir(join(scratch,'reviews'),{recursive:true});await writeFile(join(scratch,'reviews','author.json'),JSON.stringify({email:'author@fixture.invalid',subjects:[]}));
 let selected;
 const entrance=createEnterpriseEntrance(config,{federation:{clients:new Map(),tools:[],unavailable:[]},applications:[{factory:context => (selected=lSpaceMetroplat({...context,configuration:{root,reviewRoot:join(scratch,'reviews'),authoringRoot:root}}))}]});
 socketPath=join(scratch,'entrance.sock');server=await startNativeApplication(entrance.app,{path:socketPath});const origin='http://corpus.test';
 const anonymous=await fetch(origin+'/knowledge',{headers:{accept:'text/html'},redirect:'manual'});assert.equal(anonymous.status,302);assert.match(anonymous.headers.get('location'),/sign-in/);
 const publicRead=await fetch(origin+'/knowledge/public?document=public.md',{headers:{accept:'text/html'}});assert.equal(publicRead.status,200);assert.match(await publicRead.text(),/Knowledge shared deliberately/);
 const privateRead=await fetch(origin+'/knowledge/public?document=hearth.md',{headers:{accept:'text/html'}});assert.equal(privateRead.status,404);assert.doesNotMatch(await privateRead.text(),/Carrier proof|SHRIMP/);
 await writeFile(join(root,'public.md'),'---\ntitle: Shared hearth\nvisibility: authenticated\n---\nSharing was withdrawn.\n');
 const withdrawn=await fetch(origin+'/knowledge/public?document=public.md',{headers:{accept:'text/html'}});assert.equal(withdrawn.status,404);assert.doesNotMatch(await withdrawn.text(),/Sharing was withdrawn/);
 const machine=await entrance.authorization.registerMachineClient({subject:'fixture-reader',name:'fixture'});
 const issued=await fetch(origin+'/oauth/token',{method:'POST',body:new URLSearchParams({grant_type:'client_credentials',client_id:machine.client_id,client_secret:machine.client_secret,resource:'http://corpus.test/mcp'})});assert.equal(issued.status,200);const token=(await issued.json()).access_token;
 const auth={authorization:`Bearer ${token}`};
 const authorDenied=await fetch(origin+'/geode/',{headers:auth});assert.equal(authorDenied.status,403);
 const machineReviews=await fetch(origin+'/api/v1/reviews',{headers:auth});assert.equal(machineReviews.status,401);
 const human='a'.repeat(64);
 const reviewer=lSpaceMetroplat({config,configuration:{root,reviewRoot:join(scratch,'reviews')},admission:{identifyContext:async context=>context.principal ?? null}});
 const review=reviewer.applications.find(app=>app.resources[0].id==='vaultmaze-reviews').resources[0];
 const record={cardId:'hearth-card',reviewedAt:1234,rating:3,stability:1,difficulty:2};
 const put=await review.handler({principal:{provider:'google',subjectHash:human},request:new Request(origin+'/api/v1/reviews',{method:'PUT',headers:{'content-type':'application/json'},body:JSON.stringify(record)})});assert.equal(put.status,201);
 const reloaded=lSpaceMetroplat({config,configuration:{root,reviewRoot:join(scratch,'reviews')},admission:{identifyContext:async context=>context.principal}}).applications.find(app=>app.resources[0].id==='vaultmaze-reviews').resources[0];
 const history=await reloaded.handler({principal:{provider:'bearer',subjectHash:`google:${human}`},request:new Request(origin+'/api/v1/reviews')});assert.deepEqual(JSON.parse(history.body).reviews,[record]);
 const other=await reloaded.handler({principal:{provider:'google',subjectHash:'b'.repeat(64)},request:new Request(origin+'/api/v1/reviews')});assert.deepEqual(JSON.parse(other.body).reviews,[]);
 const result=await selected.tools.find(t=>t.name==='lspace_search').handler({query:'SHRIMP'});assert.equal(result.results[0].id,'hearth.md');assert.equal(result.results[0].url,'http://corpus.test/knowledge?document=hearth.md');
 const search=await fetch(origin+'/knowledge?query=SHRIMP',{headers:{...auth,accept:'text/html'}});assert.equal(search.status,200);assert.match(await search.text(),/\/knowledge\?document=hearth.md/);
 const read=await fetch(origin+'/knowledge?document=hearth.md',{headers:{...auth,accept:'text/html'}});assert.equal(read.status,200);const html=await read.text();assert.match(html,/&lt;meaning&gt; &amp; evidence/);assert.match(html,/\/knowledge\?name=Shared%20name/);
 const readings=await fetch(origin+'/knowledge?name=Shared%20name',{headers:{...auth,accept:'text/html'}});assert.equal(readings.status,200);const readingChoices=await readings.text();assert.match(readingChoices,/document=reading-one.md/);assert.match(readingChoices,/document=reading-two.md/);
 const fetched=await selected.tools.find(t=>t.name==='lspace_fetch').handler({id:'hearth.md'});assert.equal(fetched.text,markdown);assert.ok(fetched.metadata.revision);
 const response=await fetch(origin+'/mcp',{method:'POST',headers:{...auth,'content-type':'application/json',accept:'application/json, text/event-stream'},body:JSON.stringify({jsonrpc:'2.0',id:1,method:'tools/call',params:{name:'lspace_fetch',arguments:{id:'hearth.md'}}})});assert.equal(response.status,200);const text=await response.text();assert.match(text,/Hearth evidence/);
 const names=await selected.tools.find(t=>t.name==='lspace_vault_names').handler({name:'Hearth evidence'});assert.equal(names.results[0].path,'hearth.md');
 assert.equal(selected.tools.some(t=>/vault_(write|edit|properties|move|merge)$/.test(t.name)),false);
 const namesResponse=await fetch(origin+'/mcp',{method:'POST',headers:{...auth,'content-type':'application/json',accept:'application/json, text/event-stream'},body:JSON.stringify({jsonrpc:'2.0',id:2,method:'tools/call',params:{name:'lspace_vault_names',arguments:{name:'Hearth evidence'}}})});assert.equal(namesResponse.status,200);assert.match(await namesResponse.text(),/hearth.md/);
 const {createGeodeWorkspace}=await import('@red-cup-engineering/graphical-knowledge-system-server/workspace');
 const {createGeodeFetchHandler}=await import('@red-cup-engineering/graphical-knowledge-system-server/server');
 const {openArchive}=await import('@red-cup-engineering/knowledge-system-server/archive');
 const domainArchive=await openArchive({root});const workbench=createGeodeFetchHandler({workspace:await createGeodeWorkspace({archive:domainArchive}),basePath:'/geode'});
 const workbenchPage=await workbench(new Request(origin+'/geode/'));assert.equal(workbenchPage.status,200);assert.match(await workbenchPage.text(),/data-api-prefix="\/geode"/);
 const authorRead=await workbench(new Request(origin+'/geode/api/note?path=hearth.md'));assert.equal(authorRead.status,200);const authorDocument=await authorRead.json();
 const revision=authorDocument.revision;assert.ok(revision);
 const replacement=markdown+'\nA coherent edit.\n';const authored=await workbench(new Request(origin+'/geode/api/action',{method:'POST',headers:{'content-type':'application/json'},body:JSON.stringify({action:'geode.note.replace',revision,value:{path:'hearth.md',markdown:replacement}})}));assert.equal(authored.status,200);
 const stale=await workbench(new Request(origin+'/geode/api/action',{method:'POST',headers:{'content-type':'application/json'},body:JSON.stringify({action:'geode.note.replace',revision,value:{path:'hearth.md',markdown}})}));assert.equal(stale.status,409);
 const seen=await selected.tools.find(t=>t.name==='lspace_fetch').handler({id:'hearth.md'});assert.equal(seen.text,replacement);
 const traversal=await selected.tools.find(t=>t.name==='lspace_fetch').handler({id:'../outside.md'}).then(()=>false,()=>true);assert.equal(traversal,true);
 console.log('PROVED: one archive, same document/revision in admitted HTTP and MCP, same-world discovery URL, anonymous refusal, traversal refusal, full Markdown preservation.');
} finally {await server?.close();await rm(scratch,{recursive:true,force:true});}

});
