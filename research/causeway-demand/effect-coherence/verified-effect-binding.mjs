/**
 * Candidate metrology for binding multi-provider observations to one service effect.
 * The supplied verification callbacks are trust inputs, not proof that an
 * independent provider actually authenticated anything. No customer acceptance.
 */
const hasText = x => typeof x === 'string' && x.trim().length > 0;
const statuses = new Set(['observed', 'reported', 'contested']);
const verdicts = new Set(['pass', 'fail', 'unknown']);
function instant(s) {
  if (typeof s !== 'string' || !/^\d{4}-\d\d-\d\dT(?:[01]\d|2[0-3]):[0-5]\d:[0-5]\d(?:\.\d+)?Z$/u.test(s)) throw new TypeError('invalid UTC instant');
  const year=Number(s.slice(0,4)), month=Number(s.slice(5,7)), day=Number(s.slice(8,10));
  const leap=year%4===0 && (year%100!==0 || year%400===0);
  const days=[31,leap?29:28,31,30,31,30,31,31,30,31,30,31];
  if(year<1 || month<1 || month>12 || day<1 || day>days[month-1]) throw new TypeError('invalid Gregorian calendar date');
  const n=Date.parse(s);
  if(!Number.isFinite(n)) throw new TypeError('invalid UTC instant');
  return n;
}
function safelyVerify(fn, ...args) {
  if(typeof fn !== 'function') return false;
  try { return fn(...args) === true; } catch { return false; }
}
export function assayVerifiedEffectBindings({workRef, requiredStages, manifests, events, asOf},
  {verifyManifest, verifyEvidence}={}) {
  if(!hasText(workRef) || !Array.isArray(requiredStages) || requiredStages.length===0 ||
      !requiredStages.every(hasText) || new Set(requiredStages).size!==requiredStages.length ||
      !Array.isArray(manifests) || !Array.isArray(events) ||
      manifests.length>1000 || events.length>10000) throw new TypeError('invalid effect-binding input');
  const cutoff=instant(asOf);
  const required=new Set(requiredStages), registered=new Map(), effectRefs=new Set();
  for(const m of manifests) {
    if(!m || !hasText(m.manifestId) || !hasText(m.workRef) || !hasText(m.effectRef) ||
        !hasText(m.sourceRef) || !Array.isArray(m.components) || !m.components.length ||
        !m.components.every(c=>c && hasText(c.componentId) && hasText(c.revision)) ||
        new Set(m.components.map(c=>c.componentId)).size!==m.components.length ||
        registered.has(m.manifestId) || effectRefs.has(m.effectRef)) {
      throw new TypeError('invalid or duplicate effect manifest');
    }
    registered.set(m.manifestId,{manifest:m,authorized:m.workRef===workRef && safelyVerify(verifyManifest,m)});
    effectRefs.add(m.effectRef);
  }
  const observedIds=new Set(), perEffect=new Map(), rejected=[];
  for(const {manifest, authorized} of registered.values()) {
    perEffect.set(manifest.effectRef,{effectRef:manifest.effectRef,manifestId:manifest.manifestId,
      authorized, passed:new Set(), failed:new Set(), unknown:new Set()});
  }
  for(const e of events) {
    if(!e || !hasText(e.evidenceId) || !hasText(e.workRef) || !hasText(e.effectRef) ||
        !hasText(e.manifestId) || !hasText(e.componentId) || !hasText(e.revision) ||
        !hasText(e.sourceRef) || !required.has(e.stage) ||
        !statuses.has(e.status) || !verdicts.has(e.verdict)) throw new TypeError('invalid effect evidence event');
    if(observedIds.has(e.evidenceId)) throw new TypeError('duplicate evidence identity');
    observedIds.add(e.evidenceId);
    const observedAt=instant(e.observedAt);
    const candidate=registered.get(e.manifestId);
    let reason;
    if(!candidate) reason='missing-manifest';
    else if(!candidate.authorized) reason='unauthenticated-manifest';
    else if(e.workRef!==workRef || candidate.manifest.workRef!==workRef) reason='wrong-work';
    else if(e.effectRef!==candidate.manifest.effectRef) reason='effect-mismatch';
    else if(!candidate.manifest.components.some(c=>c.componentId===e.componentId && c.revision===e.revision)) reason='component-revision-mismatch';
    else if(observedAt>cutoff) reason='future-evidence';
    else if(e.status!=='observed') reason='not-observed';
    else if(!safelyVerify(verifyEvidence,e,candidate.manifest)) reason='unauthenticated-evidence';
    if(reason) {
      rejected.push({evidenceId:e.evidenceId,reason});
      if(candidate?.authorized && candidate.manifest.effectRef===e.effectRef &&
          e.workRef===workRef && reason==='not-observed') {
        perEffect.get(e.effectRef).unknown.add(e.stage);
      }
      continue;
    }
    const group=perEffect.get(e.effectRef);
    group[e.verdict==='pass'?'passed':e.verdict==='fail'?'failed':'unknown'].add(e.stage);
  }
  const effects=[...perEffect.values()].map(g=>{
    const contested=requiredStages.filter(s=>g.passed.has(s)&&(g.failed.has(s)||g.unknown.has(s)));
    const covered=requiredStages.filter(s=>g.authorized&&g.passed.has(s)&&!g.failed.has(s)&&!g.unknown.has(s));
    const missing=requiredStages.filter(s=>!covered.includes(s));
    return {effectRef:g.effectRef,manifestId:g.manifestId,manifestAuthenticated:g.authorized,
      covered,missing,contested,conditionallyComplete:g.authorized&&missing.length===0};
  }).sort((a,b)=>a.effectRef.localeCompare(b.effectRef));
  const qualified=effects.filter(e=>e.conditionallyComplete).map(e=>e.effectRef);
  return {
    schema:'lenticule/verified-effect-bindings/v1',workRef,asOf,
    effects,conditionallyCompleteEffects:qualified,rejected:rejected.sort((a,b)=>a.evidenceId.localeCompare(b.evidenceId)),
    limit:'Conditional structural result only. Callbacks may be self-assertions; verify manifest and receipts through an independently trusted provider. This is not delivery, customer acceptance, or payment settlement.'
  };
}
