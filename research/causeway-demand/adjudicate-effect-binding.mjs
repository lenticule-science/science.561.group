/**
 * Candidate Lenticule field-effect validation instrument.
 * Input labels require an independent verifier supplied by the caller;
 * the callback is a trust boundary, not a cryptographic verifier.
 * Measures classifier agreement only, never authorizes or accepts a service effect.
 */
const TRUTH = new Set(['complete','incomplete','indeterminate']);
const PRED = new Set(['complete','incomplete','abstain']);
const valid = x => typeof x === 'string' && x.trim().length > 0;
const safeVerify = (callback,row) => {
  if (typeof callback !== 'function') return false;
  try { return callback(row) === true; } catch { return false; }
};

/** Nominal 95% Wilson interval, conditional on independent Bernoulli samples. */
export function wilson95(numer,denom) {
  if (!Number.isSafeInteger(numer) || !Number.isSafeInteger(denom) ||
      numer < 0 || denom < 0 || numer > denom) throw new TypeError('invalid count');
  if (!denom) return null;
  const z=1.959963984540054, z2=z*z, p=numer/denom, d=1+z2/denom;
  const center=(p+z2/(2*denom))/d;
  const half=(z/d)*Math.sqrt(p*(1-p)/denom+z2/(4*denom*denom));
  return {rate:p,lower:Math.max(0,center-half),upper:Math.min(1,center+half),
    numerator:numer,denominator:denom};
}

/**
 * Each observation is one unique (workRef,effectRef) pair, never one event.
 * Verify adjudications out of band before treating this as field measurement.
 */
export function adjudicateEffects(rows,{verifyAdjudication}={}) {
  if (!Array.isArray(rows) || rows.length > 100000) throw new TypeError('invalid rows');
  const seen=new Set(), slices=new Map();
  const tally={trueComplete:0,trueIncomplete:0,falseComplete:0,falseIncomplete:0,
    truthUnknown:0,abstained:0,untrusted:0,concordant:0,qualified:0};
  for (const row of rows) {
    if (!row || !valid(row.workRef) || !valid(row.effectRef) ||
        !valid(row.sourceRevision) || !valid(row.reviewerRef) ||
        !valid(row.publisherRef) || !valid(row.service) ||
        !valid(row.providerRef) || !TRUTH.has(row.truth) ||
        !PRED.has(row.prediction)) throw new TypeError('invalid adjudication');
    const key=JSON.stringify([row.workRef,row.effectRef]);
    if (seen.has(key)) throw new TypeError('duplicate effect identity');
    seen.add(key);
    const sliceKey=JSON.stringify([row.service,row.providerRef]);
    const b=slices.get(sliceKey)??{service:row.service,providerRef:row.providerRef,
      complete:0,incomplete:0,falseComplete:0,falseIncomplete:0,abstained:0,unknown:0};
    slices.set(sliceKey,b);
    if (row.truth==='indeterminate') { tally.truthUnknown++; b.unknown++; continue; }
    if (row.reviewerRef===row.publisherRef || !safeVerify(verifyAdjudication,row)) {
      tally.untrusted++; continue;
    }
    tally.qualified++;
    if (row.prediction==='abstain') { tally.abstained++; b.abstained++; continue; }
    if (row.truth==='complete') {
      b.complete++;
      if (row.prediction==='complete') { tally.trueComplete++; tally.concordant++; }
      else { tally.falseIncomplete++; b.falseIncomplete++; }
    } else {
      b.incomplete++;
      if (row.prediction==='incomplete') { tally.trueIncomplete++; tally.concordant++; }
      else { tally.falseComplete++; b.falseComplete++; }
    }
  }
  const resultSlices=Object.create(null);
  for (const [key,b] of [...slices].sort(([x],[y])=>x.localeCompare(y))) {
    resultSlices[key]={...b,falseCompleteRate:wilson95(b.falseComplete,b.incomplete),
      falseIncompleteRate:wilson95(b.falseIncomplete,b.complete)};
  }
  const nComplete=tally.trueComplete+tally.falseIncomplete;
  const nIncomplete=tally.trueIncomplete+tally.falseComplete;
  const nClassified=nComplete+nIncomplete;
  return {
    schema:'lenticule/field-effect-adjudication/v2', counts:tally,
    falseCompleteRate:wilson95(tally.falseComplete,nIncomplete),
    falseIncompleteRate:wilson95(tally.falseIncomplete,nComplete),
    accuracy:nClassified===0?null:tally.concordant/nClassified,
    classifiedCoverage:tally.qualified===0?null:nClassified/tally.qualified,
    byServiceProvider:resultSlices,
    limitations:'Conditional on independently authenticated outcome labels and sampling design. Untrusted, unknown and abstained effects are not classified as correct. Wilson intervals assume independent Bernoulli samples; clustered effects require another method. No customer acceptance inferred.'
  };
}
