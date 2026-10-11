/** Causeway owner-metric identifiability: aggregate-only Science, not reader adjudication. */
const count=x=>Number.isSafeInteger(x)&&x>=0;
const keys=(x,ks)=>x&&typeof x==='object'&&!Array.isArray(x)&&Object.keys(x).sort().join('|')===[...ks].sort().join('|');
const cells=['passContext','passNoContext','failContext','failNoContext'];
function validDate(s) {
 const m=typeof s==='string'?/^([1-9]\d{3})-(\d{2})-(\d{2})T([01]\d|2[0-3]):[0-5]\d:[0-5]\d(?:\.\d+)?Z$/u.exec(s):null;
 if(!m)return false;
 const y=+m[1],mo=+m[2],d=+m[3],leap=y%4===0&&(y%100!==0||y%400===0);
 return mo>=1&&mo<=12&&d>=1&&d<=[31,leap?29:28,31,30,31,30,31,31,30,31,30,31][mo-1];
}
export function assayOwnerMetricIdentifiability(p) {
 if(!p||typeof p.workRef!=='string'||!p.workRef.startsWith('causeway-services/')||
 !keys(p.source,['repository','commit','gitBlobSha','path','observedAt','evidenceClass','rightsClass'])||
 !/^causeway-services\/[a-z0-9-]+$/u.test(p.source.repository)||
 !/^[a-f0-9]{40}$/u.test(p.source.commit)||!/^[a-f0-9]{40}$/u.test(p.source.gitBlobSha)||
 p.source.path!=='feedback/latest.json'||!validDate(p.source.observedAt)||
 p.source.evidenceClass!=='causeway-service-owner-reported'||p.source.rightsClass!=='internal-aggregate-only'||
 !count(p.cohort)||p.cohort===0||!keys(p.strata,cells)||!keys(p.sampleTargets,cells)||
 !keys(p.independentLabels,['readerTaskArticles','sourceAdjudicatedArticles'])||
 !cells.every(k=>count(p.strata[k])&&count(p.sampleTargets[k])&&p.sampleTargets[k]<=p.strata[k])||
 !Object.values(p.independentLabels).every(x=>count(x)&&x<=p.cohort)||
 Object.values(p.strata).reduce((a,b)=>a+b,0)!==p.cohort)
 throw new TypeError('invalid pinned aggregate study packet');
 const n=p.cohort,pass=p.strata.passContext+p.strata.passNoContext,
 sampleSize=Object.values(p.sampleTargets).reduce((a,b)=>a+b,0);
 if(!sampleSize)throw new TypeError('no pilot sample admitted');
 const sample=Object.fromEntries(cells.map(k=>{
 const a=p.strata[k],s=p.sampleTargets[k];
 return [k,{available:a,selected:s,inclusionProbability:a?s/a:null,
 inverseProbabilityWeight:s?a/s:null,structuralZero:a===0}];
 }));
 const readerUnmeasured=p.independentLabels.readerTaskArticles===0;
 const sourceUnmeasured=p.independentLabels.sourceAdjudicatedArticles===0;
 return {schema:'lenticule/owner-metric-identifiability/v1',
 workRef:p.workRef,source:p.source,design:'retrospective-aggregate/pilot-before-labels',
 counts:{cohort:n,ownerPass:pass,ownerFail:n-pass,ownerPassRate:pass/n,
 contextAbsent:p.strata.passNoContext+p.strata.failNoContext},
 independentOutcomeState:{readerTask:readerUnmeasured?'unmeasured':'partial-labels-await-adjudication',
 sourceGrounding:sourceUnmeasured?'unmeasured':'partial-labels-await-adjudication',
 customerAcceptance:'not-adjudicated',verifiedReaderSuccesses:null,verifiedReaderFailures:null},
 inference:{positivePredictiveValue:readerUnmeasured?null:'not-estimated',
 noReaderLabelBounds:readerUnmeasured?[0,1]:null,
 contextEffectWithinPassingStratumIdentifiable:false,
 reason:p.strata.passContext===0||p.strata.passNoContext===0?
 'No observational contrast within structurally passing articles':
 'Contrasts exist, but confounding and independent outcome labels remain unresolved',
 evidenceClass:'Causeway owner-reported only'},
 pilot:{size:sampleSize,strata:sample,selection:'Coesite pins source revision and precommits deterministic selection seed before labels; no row identities are published here.'},
 receiving:'Blinded source adjudication and reader-task outcomes, independent of Causeway service-owner metrics, must precede claims of validity.'};
}
