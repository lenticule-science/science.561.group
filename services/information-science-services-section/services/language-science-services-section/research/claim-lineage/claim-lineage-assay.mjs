/**
 * Candidate Lenticule Science assay for a source-annotated claim ledger.
 * It checks traceable *structural* claim preservation, not English semantics,
 * source authenticity, empirical truth, or user task success.
 */
const KINDS = new Set(['fact', 'attributed', 'commitment', 'forecast', 'scenario', 'unknown']);
const nonempty = x => typeof x === 'string' && x.trim().length > 0;
const isObject = x => x !== null && typeof x === 'object' && !Array.isArray(x);
const unique = arr => arr.length === new Set(arr).size;
const sorted = arr => [...arr].sort((a,b)=>a.localeCompare(b));
function parseClaim(claim, role) {
  if (!isObject(claim) || !nonempty(claim.claimRef) ||
      !nonempty(claim.propositionRef) || !nonempty(claim.scopeRef) ||
      !KINDS.has(claim.kind) || !nonempty(claim.sourceRevision))
    throw new TypeError(`invalid ${role} claim`);
  if (role === 'source' && !nonempty(claim.sourceRef))
    throw new TypeError('source provenance required');
  if (role === 'rendered' && !nonempty(claim.sourceClaimRef))
    throw new TypeError('rendered claim must identify source claim');
  // A forecast/commitment is about a time and applicable conditions, not just
  // the same words or an opaque proposition ID. These are pinned externally.
  if (['forecast','commitment'].includes(claim.kind) &&
      (!nonempty(claim.horizonRef) || !nonempty(claim.conditionsRef)))
    throw new TypeError('temporal/conditional scope required');
  return claim;
}
const fields = ['propositionRef','scopeRef','sourceRevision','horizonRef','conditionsRef'];
const isSame = (source, rendered) => fields.every(k =>
  (source[k]??null) === (rendered[k]??null));

/**
 * `requiredClaimRefs` are authored from the commissioned reporting task,
 * not derived from article word count. A format can require zero or many.
 * `sourceRevision` is the contract's pinned source-set revision.
 * Truth and independent source authentication are always out of scope.
 */
export function assayClaimLineage({workRef,sourceRevision,requiredClaimRefs,
                                  sourceClaims,renderedClaims}={}) {
  if (!nonempty(workRef) || !nonempty(sourceRevision) ||
      !Array.isArray(requiredClaimRefs) || !requiredClaimRefs.every(nonempty) ||
      !unique(requiredClaimRefs) || requiredClaimRefs.length>10000 ||
      !Array.isArray(sourceClaims) ||
      !Array.isArray(renderedClaims) || sourceClaims.length>10000 ||
      renderedClaims.length>10000)
    throw new TypeError('invalid claim-lineage packet');
  const source = new Map();
  for (const c of sourceClaims) {
    parseClaim(c,'source');
    if (source.has(c.claimRef) || c.sourceRevision!==sourceRevision)
      throw new TypeError('duplicate source claim or source revision mismatch');
    source.set(c.claimRef,c);
  }
  if (!requiredClaimRefs.every(x=>source.has(x)))
    throw new TypeError('reporting task references missing source claim');
  const seen = new Set(), matchedRequired=new Set(), findings=[];
  for (const r of renderedClaims) {
    parseClaim(r,'rendered');
    if (seen.has(r.claimRef)) throw new TypeError('duplicate rendered claim');
    seen.add(r.claimRef);
    const s=source.get(r.sourceClaimRef);
    let status;
    if (!s) status='no-declared-source';
    else if (!isSame(s,r)) status='changed-proposition-or-scope';
    else if (s.kind!==r.kind) status='changed-evidential-act';
    else status='structurally-preserved';
    findings.push({renderedClaimRef:r.claimRef,sourceClaimRef:r.sourceClaimRef,
      status,sourceKind:s?.kind??null,renderedKind:r.kind});
    if (status==='structurally-preserved' && requiredClaimRefs.includes(r.sourceClaimRef))
      matchedRequired.add(r.sourceClaimRef);
  }
  findings.sort((a,b)=>a.renderedClaimRef.localeCompare(b.renderedClaimRef));
  const missingRequired=sorted(requiredClaimRefs.filter(x=>!matchedRequired.has(x)));
  const violations=findings.filter(x=>x.status!=='structurally-preserved');
  return {
    schema:'lenticule/claim-lineage-structural/v0', workRef,sourceRevision,
    status:violations.length?'structural-mismatch':requiredClaimRefs.length===0?'task-unassessable':missingRequired.length?'task-incomplete':'structurally-consistent',
    findings, missingRequired,requiredCount:requiredClaimRefs.length,
    preservedRequiredCount:requiredClaimRefs.length-missingRequired.length,
    taskCoverage:requiredClaimRefs.length===0?null:
      (requiredClaimRefs.length-missingRequired.length)/requiredClaimRefs.length,
    limit:'Only typed source-to-rendered ledger identity. Caller-authored annotations may be wrong; no natural-language understanding, source authentication, truth, task success or independent receiver acceptance is implied.'
  };
}
