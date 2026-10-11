/**
 * Organizational Science: bounded receiver-outcome assay, version 0.1.
 * Synthetic tests do not establish effects of 561's actual offices.
 */
const DAY = 86400000;
const ARMS = new Set(["cell", "central"]);
// Dates are measurements. JS Date.parse normalizes impossible calendar days,
// so validate the stated wall-date before converting the offset to an instant.
const INSTANT = /^(\d{4})-(\d{2})-(\d{2})T([01]\d|2[0-3]):([0-5]\d):([0-5]\d)(?:\.(\d+))?(Z|[+-](?:0\d|1[0-4]):[0-5]\d)$/u;
function parseTime(value, label) {
  const m = typeof value === "string" ? INSTANT.exec(value) : null;
  if (!m) throw new TypeError(label + " must be a timezone-qualified ISO-8601 instant");
  const year=Number(m[1]), month=Number(m[2]), day=Number(m[3]);
  const leap=year%4===0 && (year%100!==0 || year%400===0);
  const days=[31,leap?29:28,31,30,31,30,31,31,30,31,30,31];
  if (month<1 || month>12 || day<1 || day>days[month-1])
    throw new TypeError(label + " contains an impossible Gregorian calendar date");
  const offset=m[8];
  if (offset!=="Z" && Math.abs(Number(offset.slice(1,3)))===14 && offset.slice(4)!=="00")
    throw new TypeError(label + " contains an impossible UTC offset");
  const ms = Date.parse(value);
  if (!Number.isFinite(ms)) throw new TypeError(label + " cannot be represented as an instant");
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
  const byStratum = new Map();
  for (const g of strata) {
    const arms = byStratum.get(g.stratum) ?? {};
    arms[g.arm] = g;
    byStratum.set(g.stratum, arms);
  }
  const shared = [...byStratum.entries()].filter(([, arms]) => arms.cell && arms.central);
  const sharedN = shared.reduce((total, [, arms]) => total + arms.cell.n + arms.central.n, 0);
  const standardized = sharedN === 0 ? null : shared.reduce((total, [stratum, arms]) => {
    const weight = (arms.cell.n + arms.central.n) / sharedN;
    total.lower += weight * (arms.cell.lower - arms.central.upper);
    total.upper += weight * (arms.cell.upper - arms.central.lower);
    total.strata.push({stratum, weight, cellN:arms.cell.n, centralN:arms.central.n});
    return total;
  }, {lower:0, upper:0, strata:[]});
  const excludedStrata = [...byStratum.entries()].filter(([, arms]) => !(arms.cell && arms.central))
    .map(([stratum]) => stratum).sort();
  return {
    estimand:"Assigned-work receiver acceptance within " + (options.horizonDays??7) + " days",
    claimStatus:"DESCRIPTIVE_ONLY",
    totals,strata,
    contrast:cell.n && central.n ? {lower:cell.lower-central.upper,upper:cell.upper-central.lower}:null,
    commonSupportContrast: standardized,
    excludedStrata,
    limitations:[
      "The pooled contrast mixes arm composition; use the common-support contrast to detect stratum imbalance.",
      "The common-support contrast excludes strata absent in either arm; do not extrapolate it.",
      "Observational arm differences are not causal estimates.",
      "Retain all eligible demands, unknown followup and negative results.",
      "Causal claims require assignment, interference, pretrends and validity review."
    ]
  };
}
