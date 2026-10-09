import test from 'node:test';
import assert from 'node:assert/strict';
import {EXCLUDED_SEGMENTS, lSpaceReaderPolicy} from '../src/archive-policy.mjs';

test('the shared reader policy preserves the exact existing default exclusions',()=>{
  const policy=lSpaceReaderPolicy({sciencePrefix:'science-services-section'});
  assert.deepEqual(EXCLUDED_SEGMENTS,['legacy','triage','private','dev','test','fixtures','dist','sites','lib']);
  assert.equal(policy.excludes,EXCLUDED_SEGMENTS);
  assert.ok(Object.isFrozen(policy));
});

test('Science-prefix and Group content-text selection retain their existing literal boundaries',()=>{
  const {admitPath}=lSpaceReaderPolicy({sciencePrefix:'science-services-section'});
  for(const path of ['science-services-section/services/l-space/README.md','science-services-section/content/a.md',
    'another-section/content/text/a.md'])assert.equal(admitPath(path),true,path);
  for(const path of ['science-services-section','science-services-section-other/a.md','another-section/content/a.md',
    'content/text/a.md','README.md'])assert.equal(admitPath(path),false,path);
  // Exclusion is a distinct archive operation, never smuggled into this predicate.
  assert.equal(admitPath('science-services-section/private/a.md'),true);
});

test('absent prefix and configured exclusions preserve the existing archive call semantics',()=>{
  for(const sciencePrefix of [undefined,null,''])assert.equal(lSpaceReaderPolicy({sciencePrefix}).admitPath('other/a.md'),true);
  const excludes=['private'];
  assert.equal(lSpaceReaderPolicy({excludes}).excludes,excludes);
  assert.equal(lSpaceReaderPolicy({excludes:null}).excludes,EXCLUDED_SEGMENTS);
  assert.equal(lSpaceReaderPolicy({excludes:[]}).excludes.length,0);
});
