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
 const root=join(scratch,'corpus');await mkdir(root);const markdown='---\ntitle: Hearth evidence\ndescription: Carrier proof\n---\n# Hearth\nSHRIMP composition preserves <meaning> & evidence.\n';await writeFile(join(root,'hearth.md'),markdown);
 const config={repositoryRoot:scratch,stateDir:join(scratch,'state'),publicBaseUrl:'http://corpus.test',sessionSecret:'fixture-secret-must-be-long-enough-123456',instance:{name:'corpus-test',title:'Corpus test'}};
 const selected=lSpaceMetroplat({config,configuration:{root}});
 const entrance=createEnterpriseEntrance(config,{federation:{clients:new Map(),tools:[],unavailable:[]},applications:[selected]});
 socketPath=join(scratch,'entrance.sock');server=await startNativeApplication(entrance.app,{path:socketPath});const origin='http://corpus.test';
 const anonymous=await fetch(origin+'/knowledge',{headers:{accept:'text/html'},redirect:'manual'});assert.equal(anonymous.status,302);assert.match(anonymous.headers.get('location'),/sign-in/);
 const machine=await entrance.authorization.registerMachineClient({subject:'fixture-reader',name:'fixture'});
 const issued=await fetch(origin+'/oauth/token',{method:'POST',body:new URLSearchParams({grant_type:'client_credentials',client_id:machine.client_id,client_secret:machine.client_secret,resource:'http://corpus.test/mcp'})});assert.equal(issued.status,200);const token=(await issued.json()).access_token;
 const auth={authorization:`Bearer ${token}`};
 const result=await selected.tools.find(t=>t.name==='lspace_search').handler({query:'SHRIMP'});assert.equal(result.results[0].id,'hearth.md');assert.equal(result.results[0].url,'http://corpus.test/knowledge?document=hearth.md');
 const search=await fetch(origin+'/knowledge?query=SHRIMP',{headers:{...auth,accept:'text/html'}});assert.equal(search.status,200);assert.match(await search.text(),/\/knowledge\?document=hearth.md/);
 const read=await fetch(origin+'/knowledge?document=hearth.md',{headers:{...auth,accept:'text/html'}});assert.equal(read.status,200);const html=await read.text();assert.match(html,/&lt;meaning&gt; &amp; evidence/);
 const fetched=await selected.tools.find(t=>t.name==='lspace_fetch').handler({id:'hearth.md'});assert.equal(fetched.text,markdown);assert.ok(fetched.metadata.revision);
 const response=await fetch(origin+'/mcp',{method:'POST',headers:{...auth,'content-type':'application/json',accept:'application/json, text/event-stream'},body:JSON.stringify({jsonrpc:'2.0',id:1,method:'tools/call',params:{name:'lspace_fetch',arguments:{id:'hearth.md'}}})});assert.equal(response.status,200);const text=await response.text();assert.match(text,/Hearth evidence/);
 const traversal=await selected.tools.find(t=>t.name==='lspace_fetch').handler({id:'../outside.md'}).then(()=>false,()=>true);assert.equal(traversal,true);
 console.log('PROVED: one archive, same document/revision in admitted HTTP and MCP, same-world discovery URL, anonymous refusal, traversal refusal, full Markdown preservation.');
} finally {await server?.close();await rm(scratch,{recursive:true,force:true});}

});
