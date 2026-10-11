// Lenticule Ecology: conservatively project source-bounded claims; never confer scientific, legal or editorial acceptance.

export function validateEvidence(d){
 const problems=[],statuses=new Set(["documented","source_report","reported","unresolved"]),kinds=new Set(["primary_study","agency_assessment","agency_guidance","public_report","official_specific_ruling","primary_native_host_diagnosis","primary_field_observation"]);
 const isString=x=>typeof x==="string"&&x.trim().length>0;
 const seenSources=new Map(),seenClaims=new Set();
 if(d?.schema_version!==1)problems.push("unsupported schema_version");
 if(!Array.isArray(d?.sources)||!Array.isArray(d?.claims))return [...problems,"sources and claims must be arrays"];
 for(const s of d.sources){
  if(!isString(s?.id)||seenSources.has(s.id))problems.push("missing or duplicate source id");
  if(!kinds.has(s?.kind))problems.push("unknown source kind: "+s?.id);
  if(!/^https:\/\//.test(s?.url||""))problems.push("missing HTTPS source: "+s?.id);
  if(s.date_precision==="year"&&!/^[0-9]{4}$/.test(s.date||""))problems.push("imprecise year recorded as exact date: "+s.id);
  if(s.date_precision==="webpage"&&s.date!=="undated")problems.push("undated webpage given false publication date: "+s.id);
  if(typeof s?.id==="string")seenSources.set(s.id,s);
 }
 for(const c of d.claims){
  if(!isString(c?.id)||seenClaims.has(c.id))problems.push("missing or duplicate claim id");
  seenClaims.add(c?.id);
  for(const field of ["track","statement","species","scope","independent_event","source_locator"])if(!isString(c?.[field]))problems.push("missing "+field+": "+c?.id);
  if(!statuses.has(c?.status))problems.push("invalid claim status: "+c?.id);
  if(!Array.isArray(c?.source_ids)||c.source_ids.length===0)problems.push("no sources: "+c?.id);
  if(!Array.isArray(c?.limits)||c.limits.length===0||c.limits.some(v=>!isString(v)))problems.push("no bounded limitations: "+c?.id);
  const sourceKinds=(c?.source_ids||[]).map(id=>{const s=seenSources.get(id);if(!s)problems.push("unresolved source ref "+id+": "+c?.id);return s?.kind;});
  if(c.status==="documented"&&sourceKinds.every(k=>k==="public_report"||k===undefined))problems.push("public repost promoted to documented evidence: "+c.id);
  if(c.status==="documented"&&sourceKinds.every(k=>k!=="primary_study"&&k!=="primary_native_host_diagnosis"&&k!=="agency_assessment"))problems.push("documented claim has no competent primary or official assessment source: "+c.id);
  if(c.track==="fungal_life_cycle"&&c.status!=="unresolved"&&!sourceKinds.includes("primary_study"))problems.push("strain pathogenicity claim requires experimental study: "+c.id);
  if(c.track==="plant_invasion"&&c.status!=="unresolved"&&!sourceKinds.some(k=>k==="primary_study"||k==="agency_assessment"))problems.push("invasive plant claim lacks plant-specific evidence: "+c.id);
  if(c.track==="current_us_import_status"&&c.status!=="unresolved"&&!sourceKinds.includes("official_specific_ruling"))problems.push("commodity status lacks official specific ruling: "+c.id);
  if(c.track==="native_host_infection"&&c.status!=="unresolved"&&!sourceKinds.includes("primary_native_host_diagnosis"))problems.push("native infection lacks direct diagnosis: "+c.id);
  if(c.track==="retail_observations"&&c.status==="documented"&&!sourceKinds.includes("primary_field_observation"))problems.push("reposted retail report promoted to direct observation: "+c.id);
 }
 if(d?.release_gates?.current_us_violation_confirmed===true)problems.push("dataset cannot independently certify a public violation");
 if(d?.release_gates?.current_us_violation_confirmed!==false&&!isString(d?.release_gates?.official_violation_determination_ref))problems.push("public violation allegation has no official determination");
 if(d?.release_gates?.native_infection_confirmed===true)problems.push("dataset cannot independently certify native infection");
 if(d?.release_gates?.native_infection_confirmed!==false&&!isString(d?.release_gates?.primary_native_diagnosis_ref))problems.push("native outbreak allegation has no direct diagnosis");
 if(d?.release_gates?.scholarly_accepted===true)problems.push("dataset cannot grant scientific acceptance");
 if(d?.release_gates?.scholarly_accepted!==false&&!isString(d?.release_gates?.independent_science_acceptance_ref))problems.push("scientific acceptance has no independent receipt");
 return problems;
}

export function countIndependentEvents(claims){
 return new Set((claims||[]).filter(c=>c.status==="documented"||c.status==="source_report").map(c=>c.independent_event).filter(Boolean)).size;
}

export function forEditorialReview(d){
 const failures=validateEvidence(d);
 if(failures.length)throw new Error(failures.join("; "));
 return d.claims.filter(c=>c.status==="documented"||c.status==="source_report").map(c=>({
  id:c.id,proposition:c.statement,source_refs:c.source_ids.map(id=>{const s=d.sources.find(x=>x.id===id);return {id:s.id,url:s.url,kind:s.kind}}),
  evidence_status:c.status,scope:c.scope,limitations:c.limits,independent_event:c.independent_event,
  eligible_for_publication:false
 }));
}

