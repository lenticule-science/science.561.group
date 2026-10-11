/**
 * Structural identifiability of public evidence for versioned service effects.
 * This does NOT authenticate evidence, verify URLs, or grant publication authority.
 * A public content fingerprint identifies bytes, not necessarily a distinct release.
 */
const string=x=>typeof x==='string'&&x.trim().length>0;
const obj=x=>x!==null&&typeof x==='object'&&!Array.isArray(x);
function checkEdition(e){
 if(!obj(e)||!['editionRef','slug','sourceDigest','consumptionReceiptDigest'].every(k=>string(e[k])))
  throw new TypeError('invalid edition');
}
function checkWitness(w){
 if(!obj(w)||!['slug','sourceDigest'].every(k=>string(w[k]))||
   (w.receiptDigest!==undefined&&!string(w.receiptDigest))||
   ![true,false].includes(w.manifestObserved))
  throw new TypeError('invalid witness');
}
export function assayEditionWitness({editions,witness}={}){
 if(!Array.isArray(editions)||editions.length===0||editions.length>10000)throw new TypeError('invalid editions');
 editions.forEach(checkEdition);checkWitness(witness);
 if(new Set(editions.map(e=>e.editionRef)).size!==editions.length)throw new TypeError('duplicate edition identity');
 if(new Set(editions.map(e=>e.consumptionReceiptDigest)).size!==editions.length)
  throw new TypeError('duplicate consumption receipt identity');
 const matches=editions.filter(e=>e.slug===witness.slug&&e.sourceDigest===witness.sourceDigest);
 const sorted=xs=>xs.map(e=>e.editionRef).sort((a,b)=>a.localeCompare(b));
 if(!witness.manifestObserved)
  return {status:'observation-incomplete',eligibleEditionRefs:sorted(matches),editionIdentifiable:false};
 if(matches.length===0)
  return {status:'no-content-match',eligibleEditionRefs:[],editionIdentifiable:false};
 const exact=witness.receiptDigest===undefined?[]:matches.filter(e=>e.consumptionReceiptDigest===witness.receiptDigest);
 if(witness.receiptDigest!==undefined&&exact.length===0)
  return {status:'receipt-mismatch',eligibleEditionRefs:sorted(matches),editionIdentifiable:false};
 if(exact.length===1)
  return {status:'structurally-edition-specific',eligibleEditionRefs:sorted(exact),editionIdentifiable:true,
   limit:'A declared public receipt match is not independently authenticated by this assay.'};
 return {status:matches.length>1?'content-observed-edition-ambiguous':'content-observed-edition-unproven',
   eligibleEditionRefs:sorted(matches),editionIdentifiable:false,
   limit:'Public content bytes do not establish a distinct release event or customer acceptance.'};
}
