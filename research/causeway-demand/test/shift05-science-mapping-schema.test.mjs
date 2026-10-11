import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
const schema = JSON.parse(readFileSync(new URL('../causeway-demand-science-mapping.schema.json', import.meta.url), 'utf8'));
const fields = ['origin','work_ref','science_question','evidence_class','falsifier','acceptance'];
test('source-preservation control: all original science mapping fields are admitted', () => {
  assert.equal(schema.$schema,'https://json-schema.org/draft/2020-12/schema');
  assert.equal(schema.type,'object');
  assert.equal(schema.additionalProperties,false);
  assert.deepEqual([...schema.required].sort(), [...fields].sort());
  assert.deepEqual(Object.keys(schema.properties).sort(), [...fields].sort());
});
test('origin and evidence classes preserve epistemic distinctions', () => {
  assert.equal(schema.properties.origin.const, 'Causeway Services');
  assert.deepEqual(schema.properties.evidence_class.enum, ['observed','reported','contested','modeled','normative']);
});
test('negative control: deletions of required evidence fields fail smoke contract', () => {
  for(const field of fields) {
    const mutated=structuredClone(schema);
    mutated.required=mutated.required.filter(x=>x!==field);
    assert.notDeepEqual([...mutated.required].sort(),[...fields].sort());
  }
});
test('schema remains provenance-only, not an authority or scientific acceptance oracle',()=>{
  assert.ok(!schema.required.includes('authenticated_board_disposition'));
  assert.ok(!schema.required.includes('independent_scientific_acceptance'));
});