/**
 * Lenticule Science — public remedy path metrology, candidate v0.1.
 * Deterministic evidence classification only, not a live service actuator.
 * Synthetic passing evidence cannot establish public service delivery.
 */
const STAGES = Object.freeze({
  discovery: 'public-readback',
  noAccount: 'task-test',
  keyboard: 'task-test',
  screenReader: 'task-test',
  authority: 'authority-record',
  delivery: 'provider-receipt',
  acknowledgement: 'independent-receipt',
  editorialDecision: 'editorial-record',
  publishedCorrection: 'public-readback',
});
const SHA = /^[a-f0-9]{64}$/u;
const ISO = /^(\d{4})-(\d\d)-(\d\d)T([01]\d|2[0-3]):([0-5]\d):([0-5]\d)(?:\.\d+)?(Z|[+-](?:0\d|1[0-4]):[0-5]\d)$/u;
const KINDS = new Set(['observed', 'reported']);
const VERDICTS = new Set(['pass', 'fail']);
const FACETS = Object.keys(STAGES);
const fail = message => { throw new TypeError(message); };
function instant(value) {
  const m = typeof value === 'string' ? ISO.exec(value) : null;
  if (!m) fail('invalid timestamp');
  const y=+m[1], mo=+m[2], d=+m[3], z=m[7];
  const leap=y%4===0&&(y%100!==0||y%400===0);
  const days=[31,leap?29:28,31,30,31,30,31,31,30,31,30,31];
  if(y<1 || mo<1 || mo>12 || d<1 || d>days[mo-1] || (z!=='Z' && z.slice(1,3)==='14' && z.slice(4)!=='00')) fail('impossible calendar date or UTC offset');
  const at=Date.parse(value);
  if(!Number.isFinite(at)) fail('unrepresentable timestamp');
  return at;
}
function safeUrl(s) {
  try { const u=new URL(s); return u.protocol==='https:' && !u.username && !u.password && !u.hash && !u.search && !/^(localhost|127\.|10\.|192\.168\.|172\.(1[6-9]|2\d|3[01])\.)/u.test(u.hostname); }
  catch { return false; }
}
function hasText(s) { return typeof s==='string' && s.trim().length>0; }
function classify(events) {
  if(!events.length) return 'unknown';
  const verified=events.filter(e=>e.trust==='verified');
  const verdicts=new Set(verified.map(e=>e.verdict));
  if(verdicts.size===2) return 'contested';
  if(verdicts.size===1) return verdicts.has('pass')?'observed-pass':'observed-fail';
  const claimed=new Set(events.map(e=>e.verdict));
  return claimed.size===2?'reported-conflict':claimed.has('pass')?'reported-pass':'reported-fail';
}
function attested(row, verifyEvidence, asOf) {
  const events=[];
  for (const e of row.events) {
    if(!e || !hasText(e.id) || !FACETS.includes(e.stage) || e.method!==STAGES[e.stage] || !KINDS.has(e.status) || !VERDICTS.has(e.verdict)) fail('invalid event type');
    if(!hasText(e.observationContext) || !hasText(e.actorId) || !safeUrl(e.sourceUrl) || !SHA.test(e.sourceDigest) || instant(e.at)>asOf) fail('invalid event provenance');
    if(e.stage==='delivery' || e.stage==='acknowledgement') {
      if(!hasText(e.submissionId) || !hasText(e.receiverId)) fail('delivery correlation missing');
    }
    if(e.stage==='authority' && (!hasText(e.receiverId) || !hasText(e.authorityRef))) fail('authority binding missing');
    if(e.stage==='editorialDecision' && e.verdict==='pass' && e.decision!=='corrected') fail('no verified correction decision');
    let verified=false;
    if(e.status==='observed' && typeof verifyEvidence==='function') {
      try { verified=verifyEvidence(e,row)===true; } catch { verified=false; }
    }
    events.push({...e,trust:verified?'verified':'unverified'});
  }
  if(new Set(events.map(e=>e.id)).size!==events.length) fail('duplicate evidence id');
  return events;
}
export function assayRemedyPath(record, {verifyEvidence, asOf=new Date().toISOString()}={}) {
  if(!record || record.schema!=='lenticule/public-remedy-assay/v1' || !hasText(record.workRef) ||
     !['synthetic','live'].includes(record.mode) || !Array.isArray(record.events)) fail('invalid assay record');
  const now=instant(asOf);
  const events=attested(record,verifyEvidence,now);
  const stage={};
  for(const name of FACETS) stage[name]=classify(events.filter(e=>e.stage===name));
  const intake=['discovery','noAccount','keyboard','screenReader','authority','delivery','acknowledgement'];
  // A work reference is an umbrella, NOT one witnessed service effect. Only
  // observations bound to the same precise context can complete that effect.
  const groups=new Map();
  for(const e of events) {
    const group=groups.get(e.observationContext)??[];
    group.push(e);groups.set(e.observationContext,group);
  }
  const outcomes=[];
  const corrections=[];
  for(const [effectRef,items] of groups){
    const perStage=Object.fromEntries(intake.map(n=>[n,classify(items.filter(e=>e.stage===n))]));
    const failing=intake.some(n=>perStage[n]==='observed-fail');
    const conflicted=intake.some(n=>perStage[n]==='contested');
    const full=intake.every(n=>perStage[n]==='observed-pass');
    const deliveries=items.filter(e=>e.stage==='delivery'&&e.trust==='verified'&&e.verdict==='pass');
    const acks=items.filter(e=>e.stage==='acknowledgement'&&e.trust==='verified'&&e.verdict==='pass');
    const authorities=items.filter(e=>e.stage==='authority'&&e.trust==='verified'&&e.verdict==='pass');
    const correlated=deliveries.some(d=>acks.some(a=>a.submissionId===d.submissionId &&
      a.receiverId===d.receiverId && a.actorId!==d.actorId &&
      authorities.some(auth=>auth.receiverId===d.receiverId)));
    const outcome=conflicted?'contested':failing?'observed-failure':full&&correlated?'verified':'unverified';
    outcomes.push({effectRef,outcome});
    const decisions=items.filter(e=>e.stage==='editorialDecision'&&e.trust==='verified'&&e.verdict==='pass');
    const publications=items.filter(e=>e.stage==='publishedCorrection'&&e.trust==='verified'&&e.verdict==='pass');
    corrections.push(decisions.some(d=>publications.some(p=>p.actorId!==d.actorId &&
      hasText(d.correctionId) && p.correctionId===d.correctionId)));
  }
  const structural=outcomes.some(e=>e.outcome==='contested')?'contested':
    outcomes.some(e=>e.outcome==='observed-failure')?'observed-failure':
    outcomes.some(e=>e.outcome==='verified')?'verified':'unverified';
  const correction=corrections.some(Boolean);
  return Object.freeze({
    schema:'lenticule/public-remedy-assay-result/v1',workRef:record.workRef,mode:record.mode,
    stages:Object.freeze(stage),
    effects:Object.freeze(outcomes.map(x=>Object.freeze(x))),
    intakeEvidence:structural,
    correctionEvidence:correction?'verified':'unverified',
    // A synthetic fixture exercises the assay, never certifies the service.
    liveIntake:record.mode==='live'?structural:'unverified',
    liveCorrection:record.mode==='live'&&correction?'verified':'unverified',
    humanTaskSuccess:'unmeasured',
    methodologicalLimit:'Authenticated structural traces are not a human usability study or legal adjudication.'
  });
}
