/**
 * Lenticule Science #69. Executable counterexample model for public-program
 * source provenance (#14). Documentary evidence only: neither authority nor
 * client eligibility can be established by this function.
 *
 * Instants must be canonical UTC seconds. Valid-time intervals are [from,to).
 * Retrieval/knowledge time and rule-effective time are distinct axes.
 */
const ISO = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z$/;
const statuses = new Set(['open', 'closed', 'suspended', 'revoked', 'unknown']);
const fields = new Set([
  'record_id', 'program_id', 'authority_id', 'source_url', 'revision',
  'published_at', 'retrieved_at', 'effective_from', 'effective_to',
  'status', 'snapshot_sha256', 'supersedes'
]);
const slug = /^[A-Za-z0-9][A-Za-z0-9._:-]*$/;
function utc(value, field) {
  if (typeof value !== 'string' || !ISO.test(value) ||
      !Number.isFinite(Date.parse(value)) || new Date(value).toISOString() !== value.replace('Z', '.000Z')) {
    throw new TypeError(`${field}: canonical UTC timestamp required`);
  }
  return Date.parse(value);
}
function validateRecord(record) {
  if (!record || typeof record !== 'object' || Array.isArray(record)) throw new TypeError('record must be a plain object');
  for (const key of Object.keys(record)) if (!fields.has(key)) throw new TypeError(`unadmitted field ${key}; client-specific attributes prohibited`);
  for (const key of ['record_id', 'program_id', 'authority_id', 'revision']) {
    if (typeof record[key] !== 'string' || !slug.test(record[key])) throw new TypeError(`invalid ${key}`);
  }
  if (typeof record.source_url !== 'string' || !/^https:\/\/[^\s/?#]+\.[^\s/?#]+/.test(record.source_url)) throw new TypeError('source_url must be HTTPS');
  if (!statuses.has(record.status)) throw new TypeError('unrecognized status');
  if (typeof record.snapshot_sha256 !== 'string' || !/^[0-9a-f]{64}$/.test(record.snapshot_sha256)) throw new TypeError('invalid snapshot_sha256');
  if (!Array.isArray(record.supersedes) || new Set(record.supersedes).size !== record.supersedes.length || record.supersedes.some(id => typeof id !== 'string' || !slug.test(id))) throw new TypeError('invalid supersedes list');
  const published = utc(record.published_at, 'published_at');
  const retrieved = utc(record.retrieved_at, 'retrieved_at');
  const from = utc(record.effective_from, 'effective_from');
  const to = record.effective_to === null ? Infinity : utc(record.effective_to, 'effective_to');
  if (retrieved < published) throw new RangeError('retrieval predates publication');
  if (to <= from) throw new RangeError('invalid half-open validity interval');
  return { published, retrieved, from, to };
}

export function auditProgramEvidence(records, {program_id, valid_at, known_at, max_age_days = null} = {}) {
  if (!Array.isArray(records)) throw new TypeError('records must be an array');
  if (typeof program_id !== 'string' || !slug.test(program_id)) throw new TypeError('invalid program_id');
  const validAt = utc(valid_at, 'valid_at');
  const knownAt = utc(known_at, 'known_at');
  if (max_age_days !== null && (!Number.isInteger(max_age_days) || max_age_days < 0)) throw new TypeError('invalid max_age_days');

  const byId = new Map();
  const dated = new Map();
  for (const item of records) {
    const date = validateRecord(item);
    if (byId.has(item.record_id)) throw new TypeError(`duplicate record_id: ${item.record_id}`);
    byId.set(item.record_id, item);
    dated.set(item.record_id, date);
  }
  for (const row of records) {
    for (const oldId of row.supersedes) {
      const old = byId.get(oldId);
      if (!old) throw new ReferenceError(`unresolved supersession reference ${oldId}`);
      if (row.record_id === oldId || old.program_id !== row.program_id || old.authority_id !== row.authority_id) throw new Error('cross-authority, cross-program, or self-supersession prohibited');
    }
  }
  const visited = new Set(), visiting = new Set();
  function cycleCheck(id) {
    if (visiting.has(id)) throw new Error('cyclic supersession');
    if (visited.has(id)) return;
    visiting.add(id);
    for (const ref of byId.get(id).supersedes) cycleCheck(ref);
    visiting.delete(id); visited.add(id);
  }
  for (const id of byId.keys()) cycleCheck(id);

  const eligible = records.filter(r => {
    const d = dated.get(r.record_id);
    return r.program_id === program_id && d.retrieved <= knownAt && d.published <= knownAt && d.from <= validAt && validAt < d.to;
  });
  const suppressed = new Set();
  // Explicit supersession has effect only once its claimant is knowable and effective.
  // Merely retrieving an apparent newer document does NOT supersede another.
  for (const newer of records) {
    const d = dated.get(newer.record_id);
    if (newer.program_id !== program_id || d.retrieved > knownAt || d.published > knownAt || d.from > validAt) continue;
    for (const oldId of newer.supersedes) suppressed.add(oldId);
  }
  const active = eligible.filter(r => !suppressed.has(r.record_id));
  const distinct = [...new Set(active.map(r => r.status))].sort();
  const newestAge = active.length ? Math.min(...active.map(r => (knownAt - dated.get(r.record_id).retrieved)/86400000)) : null;
  const stale = max_age_days !== null && (newestAge === null || newestAge > max_age_days);
  const disputed = distinct.length > 1 || distinct.includes('unknown');
  const disposition = active.length === 0 ? 'NO_CURRENT_SOURCE' : stale ? 'STALE_SOURCE_UNRESOLVED' : disputed ? 'CONTESTED_SOURCE_UNRESOLVED' : 'CONSISTENT_REPORTED_SOURCE';
  return Object.freeze({
    science_ref: 'lenticule-science/science-services-section#69',
    service_ref: 'causeway-services/public-services-section#14',
    program_id, valid_at, known_at, max_age_days,
    disposition,
    reported_status: disposition === 'CONSISTENT_REPORTED_SOURCE' ? distinct[0] : null,
    active_source_ids: active.map(r => r.record_id).sort(),
    superseded_source_ids: [...suppressed].sort(),
    statuses_considered: distinct,
    requires_independent_authority_verification: true,
    client_eligibility_established: false,
    note: 'Source observations are not authenticated by parsing; no grant/benefit filing or eligibility decision is authorized.'
  });
}