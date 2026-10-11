/**
 * Organizational Science: bounded receiver-outcome assay, version 0.1.
 * Synthetic tests do not establish effects of 561's actual offices.
 */
const DAY = 86400000;
const ARMS = new Set(["cell", "central"]);
function parseTime(value, label) {
  if (typeof value !== "string" || !/^\d{4}-\d{2}-\d{2}T/.test(value))
    throw new TypeError(label + " must be ISO-8601 timestamp");
  const ms = Date.parse(value);
  if (!Number.isFinite(ms) || !/(Z|[+-]\d\d:\d\d)$/.test(value))
    throw new TypeError(label + " must carry a timezone");
  return ms;
}
function validate(row) {
  if (!row || typeof row !== "object" || Array.isArray(row)) throw new TypeError("invalid row");
  if (typeof row.workRef !== "string" || !row.workRef.trim()) throw new TypeError("missing canonical workRef");
  if (!ARMS.has(row.arm)) throw new TypeError("invalid arm");
  if (typeof row.stratum !== "string" || !row.stratum.trim()) throw new TypeError("missing pre-treatment stratum");
  if (typeof row.consumer !== "string" || !row.consumer.trim()) throw new TypeError("missing consumer");
  const start = parseTime(row.eligibleAt, "eligibleAt");
  const audit = row.auditedThrough == null ? null : parseTime(row.auditedThrough, "auditedThrough");
  const accepted = row.acceptedAt == null ? null : parseTime(row.acceptedAt, "acceptedAt");
  if (audit != null && audit < start) throw new RangeError("audit predates eligibility");
  if (accepted != null && accepted < start) throw new RangeError("acceptance predates eligibility");
  if (accepted != null && (typeof row.receiverWitness !== "string" || !row.receiverWitness))
    throw new TypeError("acceptance requires independent receiver witness");
  if (accepted != null && audit != null && accepted > audit)
    throw new RangeError("acceptance after observation cutoff");
  return {start, audit, accepted};
}
export function classifyReceiving(row, {horizonDays=7}={}) {
  if (!Number.isSafeInteger(horizonDays) || horizonDays < 1 || horizonDays > 365)
    throw new RangeError("bad horizon");
  const {start, audit, accepted} = validate(row);
  const cutoff = start + horizonDays * DAY;
  if (accepted != null && accepted <= cutoff) return "accepted";
  if (audit == null || audit < cutoff) return "unresolved";
  return "not_accepted_by_horizon";
}
export function assessWorkCohorts(rows, options={}) {
  if (!Array.isArray(rows) || rows.length === 0) throw new TypeError("nonempty cohort required");
  const ids = new Set(), groups = new Map();
  for (const row of rows) {
    if (ids.has(row.workRef)) throw new Error("duplicate workRef: " + row.workRef);
    ids.add(row.workRef);
    const state = classifyReceiving(row,options);
    const key = row.arm + "\u0000" + row.stratum;
    const g = groups.get(key) ?? {arm:row.arm,stratum:row.stratum,n:0,accepted:0,unresolved:0,notAccepted:0};
    g.n++;
    if (state === "accepted") g.accepted++;
    if (state === "unresolved") g.unresolved++;
    if (state === "not_accepted_by_horizon") g.notAccepted++;
    groups.set(key,g);
  }
  const bounded = g => ({...g,lower:g.accepted/g.n,upper:(g.accepted+g.unresolved)/g.n});
  const strata=[...groups.values()].map(bounded).sort((a,b)=>a.stratum.localeCompare(b.stratum)||a.arm.localeCompare(b.arm));
  const totals=["cell","central"].map(arm=>{
    const s=strata.filter(g=>g.arm===arm), n=s.reduce((x,g)=>x+g.n,0);
    if (!n) return {arm,n:0,lower:null,upper:null};
    return bounded({arm,n,accepted:s.reduce((x,g)=>x+g.accepted,0),unresolved:s.reduce((x,g)=>x+g.unresolved,0),notAccepted:s.reduce((x,g)=>x+g.notAccepted,0)});
  });
  const [cell,central]=totals;
  return {
    estimand:"Assigned-work receiver acceptance within " + (options.horizonDays??7) + " days",
    claimStatus:"DESCRIPTIVE_ONLY",
    totals,strata,
    contrast:cell.n && central.n ? {lower:cell.lower-central.upper,upper:cell.upper-central.lower}:null,
    limitations:[
      "Observational arm differences are not causal estimates.",
      "Retain all eligible demands, unknown followup and negative results.",
      "Causal claims require assignment, interference, pretrends and validity review."
    ]
  };
}