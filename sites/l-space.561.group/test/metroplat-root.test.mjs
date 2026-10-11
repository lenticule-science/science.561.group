import test from 'node:test';
import assert from 'node:assert/strict';
import {selectMetroplatCorpusRoot,assertMetroplatCorpusRoot} from '../src/metroplat-root.mjs';
test('legacy relative root remains deterministic until explicitly overridden',()=>{
 assert.equal(selectMetroplatCorpusRoot('/gnu/store/test-release','lib/emsenn/services/561-group/services',{}),'/gnu/store/test-release/lib/emsenn/services/561-group/services');
});
test('explicit absolute runtime corpus root overrides packaged path without guessing',()=>{
 assert.equal(selectMetroplatCorpusRoot('/gnu/store/test-release','old',{METROPLAT_LSPACE_CORPUS_ROOT:'/srv/561/science'}),'/srv/561/science');
 assert.throws(()=>selectMetroplatCorpusRoot('/gnu/store/test-release','old',{METROPLAT_LSPACE_CORPUS_ROOT:'../temp'}),/absolute/);
});
test('missing corpus reports a specific operational blocker, not a fake empty index',()=>{
 assert.throws(()=>assertMetroplatCorpusRoot('/gnu/store/missing',()=>{throw Object.assign(new Error('ENOENT'),{code:'ENOENT'});}),err=>err.code==='LSPACE_CORPUS_ROOT_UNAVAILABLE'&&err.root==='/gnu/store/missing');
 assert.throws(()=>assertMetroplatCorpusRoot('/tmp/not-directory',()=>({isDirectory:()=>false})),/unavailable/);
});
test('a real directory permits read-only archive initialization',()=>{
 assert.equal(assertMetroplatCorpusRoot('/srv/561/science',()=>({isDirectory:()=>true})),'/srv/561/science');
});
