/**
 * Candidate Lenticule Science assay for a source-annotated claim ledger.
 * Checks structural claim preservation, NOT natural-language semantics,
 * source authenticity, empirical truth or reader task success.
 */
const KINDS=new Set(['fact','attributed','commitment','forecast','scenario','unknown']);
const nonempty=x=>typeof x==='string'&&x.trim().length>0;
const isObject=x=>x!==null&&typeof x==='object'&&!Array.isArray(x);
const unique=arr=>arr.length===new Set(arr).size;
const sorted=arr=>[...arr].sort((a,b)=>a.localeCompare(b));
function parseClaim(c,role){
 if(!isObject(c)||!nonempty(c.claimRef)||!nonempty(c.propositionRef)||
    !nonempty(c.scopeRef)||!KINDS.has(c.kind)||!nonempty(c.sourceRevision))
   throw new TypeError('invalid '+role+' claim');
 if(role==='source'&&!nonempty(c.sourceRef))throw new TypeError('source provenance required');
 if(role==='rendered'&&!nonempty(c.sourceClaimRef))throw new TypeError('rendered claim must identify source claim');
 if(['forecast','commitment'].includes(c.kind)&&
    (!nonempty(c.horizonRef)||!nonempty(c.conditionsRef)))
   throw new TypeError('temporal/conditional scope required');
 return c;
}
const fields=['propositionRef','scopeRef','sourceRevision','horizonRef','conditionsRef'];
const isSame=(s,r)=>fields.every(k=>(s[k]??null)===(r[k]??null));
export function assayClaimLineage({workRef,sourceRevision,requiredClaimRefs,sourceClaims,renderedClaims}={}){
 if(!nonempty(workRef)||!nonempty(sourceRevision)||!Array.isArray(requiredClaimRefs)||
    !requiredClaimRefs.every(nonempty)||!unique(requiredClaimRefs)||
    !Array.isArray(sourceClaims)||!Array.isArray(renderedClaims)||
    sourceClaims.length>10000||renderedClaims.length>10000)
   throw new TypeError('invalid claim-lineage packet');
 const source=new Map();
 for(const c of sourceClaims){
  parseClaim(c,'source');
  if(source.has(c.claimRef)||c.sourceRevision!==sourceRevision)
   throw new TypeError('duplicate source claim or source revision mismatch');
  source.set(c.claimRef,c);
 }
 if(!requiredClaimRefs.every(x=>source.has(x)))
  throw new TypeError('reporting task references missing source claim');
 const seen=new Set(),matchedRequired=new Set(),findings=[];
 for(const r of renderedClaims){
  parseClaim(r,'rendered');
  if(seen.has(r.claimRef))throw new TypeError('duplicate rendered claim');
  seen.add(r.claimRef);
  const s=source.get(r.sourceClaimRef);
  let status;
  if(!s)status='no-declared-source';
  else if(!isSame(s,r))status='changed-proposition-or-scope';
  else if(s.kind!==r.kind)status='changed-evidential-act';
  else status='structurally-preserved';
  findings.push({renderedClaimRef:r.claimRef,sourceClaimRef:r.sourceClaimRef,status,
    sourceKind:s?.kind??null,renderedKind:r.kind});
  if(status==='structurally-preserved'&&requiredClaimRefs.includes(r.sourceClaimRef))
   matchedRequired.add(r.sourceClaimRef);
 }
 findings.sort((a,b)=>a.renderedClaimRef.localeCompare(b.renderedClaimRef));
 const missingRequired=sorted(requiredClaimRefs.filter(x=>!matchedRequired.has(x)));
 const violations=findings.filter(x=>x.status!=='structurally-preserved');
 return {schema:'lenticule/claim-lineage-structural/v0',workRef,sourceRevision,
  status:violations.length?'structural-mismatch':requiredClaimRefs.length===0?
    'task-unassessable':missingRequired.length?'task-incomplete':'structurally-consistent',
  findings,missingRequired,requiredCount:requiredClaimRefs.length,
  preservedRequiredCount:requiredClaimRefs.length-missingRequired.length,
  taskCoverage:requiredClaimRefs.length===0?null:
    (requiredClaimRefs.length-missingRequired.length)/requiredClaimRefs.length,
  limit:'Typed lineage only: annotations may be wrong; no source authentication, truth, reader success, or independent acceptance.'};
}
