import test from 'node:test';
import assert from 'node:assert/strict';
import { classifyReceiving } from './service-cell-assay.mjs';
const row=(acceptedAt,eligibleAt='2026-02-27T00:00:00Z',auditedThrough='2026-03-05T00:00:00Z')=>({
  workRef:'synthetic-1',arm:'cell',stratum:'synthetic',consumer:'synthetic receiver',
  eligibleAt,auditedThrough,acceptedAt,receiverWitness:'fixture-only'
});
for (const time of ['2026-02-29T00:00:00Z','2026-02-30T00:00:00Z']) {
  test('rejects impossible February acceptedAt '+time,()=>
    assert.throws(()=>classifyReceiving(row(time)),/impossible Gregorian/));
}
test('rejects impossible April acceptedAt',()=>assert.throws(()=>
  classifyReceiving(row('2026-04-31T00:00:00Z','2026-04-29T00:00:00Z','2026-05-06T00:00:00Z')), /impossible Gregorian/));
test('valid leap-day acceptance stays accepted',()=>assert.equal(
  classifyReceiving(row('2024-02-29T00:00:00Z','2024-02-27T00:00:00Z','2024-03-06T00:00:00Z')),'accepted'));
test('UTC and offset observation agree',()=>assert.equal(
  classifyReceiving(row('2026-02-28T00:00:00Z')),
  classifyReceiving(row('2026-02-28T02:00:00+02:00'))));
test('rejects timezone-less acceptedAt',()=>assert.throws(()=>
  classifyReceiving(row('2026-02-28T00:00:00')), /timezone-qualified/));
test('rejects impossible offset',()=>assert.throws(()=>
  classifyReceiving(row('2026-02-28T00:00:00+14:30')), /impossible UTC offset/));
test('invalid audit cannot certify observation horizon',()=>{
  const item=row(null);item.auditedThrough='2026-02-30T00:00:00Z';
  assert.throws(()=>classifyReceiving(item), /impossible Gregorian/);
});
test('high precision fractional seconds preserve allowed source data',()=>assert.equal(
  classifyReceiving(row('2026-02-28T00:00:00.123456789Z')),'accepted'));
test('Gregorian century leap rule',()=>{
  assert.throws(()=>classifyReceiving(row('2100-02-29T00:00:00Z','2100-02-27T00:00:00Z','2100-03-06T00:00:00Z')),/impossible Gregorian/);
  assert.equal(classifyReceiving(row('2000-02-29T00:00:00Z','2000-02-27T00:00:00Z','2000-03-06T00:00:00Z')),'accepted');
});
test('edge offset 14:00 accepted when representing an actual instant',()=>{
  assert.equal(classifyReceiving(row('2026-02-28T14:00:00+14:00')), 'accepted');
});
