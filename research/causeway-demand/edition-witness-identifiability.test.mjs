import test from 'node:test';
import assert from 'node:assert/strict';
import {assayEditionWitness as assay} from './edition-witness-identifiability.mjs';
const a={editionRef:'a',slug:'news',sourceDigest:'digest-1',consumptionReceiptDigest:'receipt-1'};
const b={editionRef:'b',slug:'news',sourceDigest:'digest-1',consumptionReceiptDigest:'receipt-2'};
const c={editionRef:'c',slug:'news',sourceDigest:'digest-2',consumptionReceiptDigest:'receipt-3'};
const w=(sourceDigest,more={})=>({slug:'news',sourceDigest,manifestObserved:true,...more});
test('different public bytes select only matching content',()=>{
 const r=assay({editions:[a,c],witness:w('digest-2')});
 assert.deepEqual(r.eligibleEditionRefs,['c']);
 assert.equal(r.editionIdentifiable,false);
});
test('same public bytes from separately authorized editions are ambiguous',()=>{
 const r=assay({editions:[a,b],witness:w('digest-1')});
 assert.equal(r.status,'content-observed-edition-ambiguous');
 assert.deepEqual(r.eligibleEditionRefs,['a','b']);
});
test('even single content match does not establish release-event identity',()=>{
 assert.equal(assay({editions:[a],witness:w('digest-1')}).status,'content-observed-edition-unproven');
});
test('matching edition receipt creates a structural discriminator',()=>{
 const r=assay({editions:[a,b],witness:w('digest-1',{receiptDigest:'receipt-2'})});
 assert.equal(r.status,'structurally-edition-specific');
 assert.deepEqual(r.eligibleEditionRefs,['b']);
});
test('wrong receipt does not create evidence',()=>{
 assert.equal(assay({editions:[a],witness:w('digest-1',{receiptDigest:'wrong'})}).status,'receipt-mismatch');
});
test('unobserved manifest blocks receiving',()=>{
 assert.equal(assay({editions:[a],witness:w('digest-1',{manifestObserved:false})}).status,'observation-incomplete');
});
test('missing public content is not a release',()=>{
 assert.equal(assay({editions:[a],witness:w('other')}).status,'no-content-match');
});
test('duplicate local receipt identifiers fail closed',()=>{
 assert.throws(()=>assay({editions:[a,{...b,consumptionReceiptDigest:'receipt-1'}],witness:w('digest-1')}),/duplicate consumption/);
});
