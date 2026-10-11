/**
 * Lenticule Science: structural identifiability of newsroom throughput.
 * Counterfactual causation, independent receiving and provider authentication
 * cannot be established by this pure assay.
 */
const STAGES=Object.freeze(['source-admission','draft','assessment','editorial-authority','published-ledger','public-readback']);
const CLASS=Object.freeze(['causeway-reported','provider-receipt','independent-public']);
const text=x=>typeof x==='string'&&x.trim().length>0;
const object=x=>x!==null&&typeof x==='object'&&!Array.isArray(x);
const stamp=x=>typeof x==='string'&&/^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\.\d+)?Z$/u.test(x)&&
 Number.isFinite(Date.parse(x))&&new Date(x).toISOString().slice(0,19)===x.slice(0,19)&&(!x.includes('.')||/\.\d{1,9}Z$/u.test(x));
// Canonical nine-place UTC fractions make lexicographic comparisons temporal.
const instant=x=>x.replace(/(?:\.(\d+))?Z$/u,(_,digits='')=>'.'+digits.padEnd(9,'0')+'Z');
const sha=x=>typeof x==='string'&&/^[a-f0-9]{40}$/u.test(x);
const allowed=(v,values)=>values.includes(v);
export function assayNewsroomThroughput(packet={},verifyCoverage) {
 const {workRef,source,window,events=[],coverageClaims=[]}=packet;
 if(!text(workRef)||!/^causeway-services\/[a-z0-9-]+#\d+$/u.test(workRef)||
    !object(source)||!text(source.repository)||!sha(source.revision)||
    !stamp(source.observedAt)||!allowed(source.evidenceClass,['causeway-issue-claim','causeway-source-report'])||
    source.rightsClass!=='internal-aggregate-only'||!object(window)||!stamp(window.start)||
    !stamp(window.end)||instant(window.start)>=instant(window.end)||
    !Array.isArray(events)||events.length>10000||!Array.isArray(coverageClaims)||
    coverageClaims.length>STAGES.length)throw new TypeError('invalid provenance or window');
 const claimed=new Map();
 for(const c of coverageClaims){
  if(!object(c)||!allowed(c.stage,STAGES)||claimed.has(c.stage)||
     !text(c.coverageRef)||c.windowStart!==window.start||c.windowEnd!==window.end||
     !allowed(c.claimedBy,CLASS)||c.exhaustive!==true)
   throw new TypeError('invalid stage coverage claim');
  claimed.set(c.stage,c);
 }
 const seen=new Set(),byStage=new Map(STAGES.map(s=>[s,[]]));
 for(const e of events){
  if(!object(e)||!text(e.eventRef)||seen.has(e.eventRef)||
     !text(e.effectRef)||!allowed(e.stage,STAGES)||
     !allowed(e.outcome,['succeeded','failed','unknown'])||
     !allowed(e.evidenceClass,CLASS)||!text(e.evidenceRef)||
     !stamp(e.observedAt)||instant(e.observedAt)<instant(window.start)||instant(e.observedAt)>=instant(window.end))
   throw new TypeError('invalid or duplicated event');
  seen.add(e.eventRef);
  byStage.get(e.stage).push(e);
 }
 const states=STAGES.map(stage=>{
  const rows=byStage.get(stage), c=claimed.get(stage);
  let verified=false;
  if(c&&typeof verifyCoverage==='function'){
   try{verified=verifyCoverage(c,source)===true;}catch{verified=false;}
  }
  const successes=rows.filter(e=>e.outcome==='succeeded'),
   failures=rows.filter(e=>e.outcome==='failed'),
   unknowns=rows.filter(e=>e.outcome==='unknown');
  const uniqueSuccessRefs=new Set(successes.map(e=>e.effectRef));
  const zeroInterpretation=uniqueSuccessRefs.size>0?'nonzero-reported':
    !c?'not-observable-as-zero':verified?'zero-with-caller-verified-coverage':
    'owner-or-provider-claims-zero';
  return {stage,recordedEvents:rows.length,observedUniqueEffectSuccesses:uniqueSuccessRefs.size,
   failedAttempts:failures.length,unknownAttempts:unknowns.length,
   byEvidenceClass:Object.fromEntries(CLASS.map(kind=>[kind,successes.filter(e=>e.evidenceClass===kind).length])),
   claimedExhaustive:!!c,closureAcceptance:verified?'caller-verifier-accepted':'unverified',
   zeroInterpretation};
 });
 const row=stage=>states.find(x=>x.stage===stage);
 const writerFailures=row('draft').failedAttempts;
 return {schema:'lenticule/newsroom-throughput-identifiability/v1',workRef,
  source,window,stages:states,
  attribution:{writerFailureObserved:writerFailures>0,
   failedWriterCausedPublicationShortfall:'not-identifiable',
   reason:'A failed writing attempt cannot establish missing counterfactual successful release; admission, fallback, authority and public readback may also constrain output.'},
  publicReceiving:{observedPublicReadbackEffects:row('public-readback').observedUniqueEffectSuccesses,
   customerOutcomes:'not-observed-by-this-assay'},
  caveat:'Pure typed event assay. Caller-supplied provenance and verifier claims require external authentication; count is not an independently established customer/public result.'};
}
