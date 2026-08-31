/**
 * predicating/independent-evidence — the predication-charge machinery, reseated.
 *
 * A Fregean predication fixes ONE oriented (subject, predicate, object) point;
 * evidence FOR it and evidence AGAINST it are independent `Bool × Bool`
 * coordinates — relational converse and subject/object reversal are never
 * denial. This is the executable form of
 * `Obsmetrologia.Language.Predicating.FregeanFourChu`
 * (obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Language/Predicating/FregeanFourChu.lean):
 * `independentEvidenceCharge : Bool × Bool -> Charge` is exactly
 * `independentEvidenceRow`/`independentEvidenceSide` feeding `foldIndependentEvidence`'s
 * per-cell join, and `predicationChu` is exactly what `sectionSpace` presents —
 * predications as points, witnessing parties as states, the FOUR-valued read as
 * the matrix entry. See `teaching-articles/explanations/independent-evidence.md`
 * for the full grounding (also the CHL/nuclear-quartet reading and glass-sponge
 * §16.4's "independence is evidential, not organizational").
 *
 * Ported from `@red-cup-engineering/computer`'s `posix-holography/src/substrate.mjs`
 * (a read-only deprecation inventory as of this port — write nothing there).
 * That module built this on top of the general `fold`/`settle`/`supersede`/
 * `relate` OS substrate (any predicate, any trace, functional or relational).
 * This port carries ONLY the independent-evidence family: `foldIndependentEvidence`
 * below is a self-contained fold restricted to claims seeded at ⊥ plus rows whose
 * side is resolved by `independentEvidenceSide` — it does not open the legacy
 * `opts.converse` remap (refused, as in the original) and, unlike the original's
 * shared `fold`, does not scan the trace for incidental `has-converse`
 * declarations either — a predication-charge fold has no path by which converse
 * can define denial. Both real consumers of the original (workspace-content-graph,
 * fae) only ever called it without that legacy path live, so this narrowing
 * changes no observed behavior; it just closes a door the function's own
 * doc comment already said should not exist.
 *
 * jcs/rowId form ONE identity space with these functions (rowId = sha256(jcs(row))
 * hex). jcs here is a local, byte-verified copy of
 * `@red-cup-engineering/json-codec-service`'s `canonical` — not imported at
 * runtime, because that package's root export transitively imports
 * `@lenticule-science/articulating/utterance` and
 * `@lenticule-science/articulating/predicating/positing/bilattice-charge` (see
 * its `src/json/jsonl/eavt/index.mts`), so a runtime import here would close a
 * package-dependency cycle (articulating -> json-codec-service -> articulating).
 * The byte-equality is exercised as a devDependency-only test
 * (`test/jcs-byte-equality.test.mts`), never at runtime.
 *
 * The charge algebra composes through `@lenticule-science/metrologic` — never
 * reimplemented: `foldIndependentEvidence` joins per-cell evidence with
 * `metrologic/bilattice`'s `joinKnowledge`; `sectionSpace` presents the folded
 * fiber as an explicit Chu space over FOUR via `metrologic/chu` and
 * `metrologic/chu/four`, exactly as the original did.
 */
import { createHash } from "node:crypto";
import { joinKnowledge } from "@lenticule-science/metrologic/bilattice";
import { chuSpace } from "@lenticule-science/metrologic/chu";
import { FOUR, fromCharge } from "@lenticule-science/metrologic/chu/four";
/**
 * The canonical serialization of a JSON-shaped value: object keys sorted, stable bytes.
 *
 * A local copy of `@red-cup-engineering/json-codec-service`'s `canonical()`
 * (`src/json/core.mts`), kept local per the circular-dependency note above.
 * Verified byte-identical to that function on a shared test vector by
 * `test/jcs-byte-equality.test.mts`. Typed over `unknown` (not a strict JSON
 * union) so it composes over EAVT rows without a second admission boundary;
 * the identity space it backs is content-addressed EAVT rows, not a free-form
 * JSON gate — that gate is json-codec-service's, upstream of these rows.
 */
export function jcs(value) {
    if (value === null || typeof value === "boolean" || typeof value === "number")
        return JSON.stringify(value);
    if (typeof value === "string")
        return JSON.stringify(value);
    if (Array.isArray(value))
        return `[${value.map((item) => jcs(item)).join(",")}]`;
    const record = value;
    const keys = Object.keys(record).sort();
    return `{${keys.map((key) => `${JSON.stringify(key)}:${jcs(record[key])}`).join(",")}}`;
}
/** The canonical id of a row: identical content -> identical id. This IS the row's identity. */
export function rowId(row) {
    return createHash("sha256").update(jcs(row), "utf8").digest("hex");
}
/** A row is exactly {e,a,v,t}. Lenient on values; throws otherwise. */
function assertRow(row) {
    if (!row || typeof row !== "object" || Array.isArray(row)) {
        throw new TypeError("independent-evidence: row must be a JSON object");
    }
    for (const key of ["e", "a", "v", "t"]) {
        if (!(key in row))
            throw new TypeError(`independent-evidence: row missing "${key}"`);
    }
    if (Object.keys(row).length !== 4) {
        throw new TypeError(`independent-evidence: row must be exactly {e,a,v,t}, got ${Object.keys(row).join(",")}`);
    }
    return row;
}
// === reified-row identity ===================================================================
/** A reified row is a row ABOUT a base row: its subject `e` is the base row's content-id, prefixed. */
export const REIFIED_PREFIX = "row:";
/** reify(base) -> the content-address of a base row, prefixed (16-hex slice keeps it legible). */
export const reify = (base) => `${REIFIED_PREFIX}${rowId(base).slice(0, 16)}`;
/** isReified(e) -> is this entity-id an attribution about a row (not a subject)? */
export const isReified = (e) => typeof e === "string" && e.startsWith(REIFIED_PREFIX);
// === independent predication evidence ==========================================================
/** The witness kind tagging a row as one independent evidence-for/evidence-against observation. */
export const INDEPENDENT_EVIDENCE_WITNESS_KIND = "predication.independent-evidence";
/** Build one independent-evidence row: an exact EAVT row whose `t` names the side and the observer. */
export function independentEvidenceRow({ subject, predicate, object, side, by, witness }) {
    if (typeof subject !== "string" || subject === "")
        throw new TypeError("independentEvidenceRow: subject must be a non-empty string");
    if (typeof predicate !== "string" || predicate === "")
        throw new TypeError("independentEvidenceRow: predicate must be a non-empty string");
    if (side !== "positive" && side !== "negative")
        throw new TypeError("independentEvidenceRow: side must be positive or negative");
    if (typeof by !== "string" || by === "")
        throw new TypeError("independentEvidenceRow: by must be a non-empty string");
    if (witness === undefined)
        throw new TypeError("independentEvidenceRow: witness is required");
    const row = {
        e: subject,
        a: predicate,
        v: object,
        t: { kind: INDEPENDENT_EVIDENCE_WITNESS_KIND, version: 1, side, by, witness },
    };
    assertRow(row);
    return deepFreeze(row);
}
/** The independent-evidence side an EAVT row witnesses, or null when the row carries no such witness. */
export function independentEvidenceSide(row) {
    const t = row?.t;
    if (t?.kind !== INDEPENDENT_EVIDENCE_WITNESS_KIND)
        return null;
    if (t.version !== 1)
        throw new TypeError("independent evidence witness must be version 1");
    if (t.side !== "positive" && t.side !== "negative") {
        throw new TypeError("independent evidence witness side must be positive or negative");
    }
    return t.side;
}
/**
 * foldIndependentEvidence — fold one subject's claims and evidence rows into its settled section.
 *
 * Claims seed the points, so a point with no evidence remains present at ⊥. Every evidence row is
 * exact EAVT; `independentEvidenceSide` names which independent coordinate it observed. A cell told
 * both sides settles to ⊤ (a HELD value, not an error) via `metrologic/bilattice`'s `joinKnowledge` —
 * nothing here re-derives the join.
 */
export function foldIndependentEvidence(subject, claims, rows, opts = {}) {
    if (typeof subject !== "string" || !subject)
        throw new TypeError("foldIndependentEvidence: subject must be a non-empty string");
    if (!Array.isArray(claims))
        throw new TypeError("foldIndependentEvidence: claims must be an array");
    if (!Array.isArray(rows))
        throw new TypeError("foldIndependentEvidence: rows must be an {e,a,v,t} array");
    if (Object.hasOwn(opts, "converse"))
        throw new TypeError("foldIndependentEvidence: converse is not denial; use independent negative witnesses");
    for (const row of rows)
        assertRow(row);
    const retractedAfter = new Map();
    if (opts.retract !== false) {
        for (const r of rows) {
            if (r.e === subject && r.v === null) {
                const cur = retractedAfter.get(r.a);
                if (cur === undefined || r.t > cur)
                    retractedAfter.set(r.a, r.t);
            }
        }
    }
    const cells = new Map();
    for (const [index, claim] of claims.entries()) {
        if (!claim || typeof claim !== "object" || Array.isArray(claim))
            throw new TypeError(`foldIndependentEvidence: claims[${index}] must be an object`);
        if (claim.subject !== subject)
            throw new TypeError(`foldIndependentEvidence: claims[${index}].subject must equal the folded subject`);
        if (typeof claim.predicate !== "string" || claim.predicate === "")
            throw new TypeError(`foldIndependentEvidence: claims[${index}].predicate must be a non-empty string`);
        const key = jcs([claim.predicate, claim.object]);
        cells.set(key, { predicate: claim.predicate, object: claim.object, charge: { value: [false, false], evidence: [[], []] } });
    }
    for (const r of rows) {
        if (r.e !== subject)
            continue;
        if (isReified(r.e))
            continue;
        if (r.v === null)
            continue; // a retraction row carries no positive evidence
        const tombstone = retractedAfter.get(r.a);
        if (tombstone !== undefined && r.t < tombstone)
            continue;
        const side = independentEvidenceSide(r);
        if (side === null)
            continue; // not an independent-evidence witness: no path to charge a cell
        const id = rowId(r);
        const contribution = side === "negative"
            ? { value: [false, true], evidence: [[], [id]] }
            : { value: [true, false], evidence: [[id], []] };
        const key = jcs([r.a, r.v]);
        const prior = cells.get(key)?.charge ?? { value: [false, false], evidence: [[], []] };
        cells.set(key, { predicate: r.a, object: r.v, charge: joinKnowledge({ left: prior, right: contribution }) });
    }
    const fiber = [...cells.values()]
        .sort((a, b) => jcs([a.predicate, a.object]).localeCompare(jcs([b.predicate, b.object])))
        .map(({ predicate, object, charge }) => ({
        predicate,
        object,
        value: {
            pos: charge.value[0] ? 1 : 0,
            neg: charge.value[1] ? 1 : 0,
            evidence: charge.evidence,
        },
    }));
    return deepFreeze({ entity: subject, fiber });
}
/**
 * sectionSpace(folded, rows, opts?) — lift a folded fiber-algebra into an explicit Chu space over
 * FOUR (`@lenticule-science/metrologic/chu`): the rich sibling of `section()`. The POINTS are the
 * folded cells (keyed `jcs([predicate,object])`), the STATES are the witnessing coordinate
 * `stateOf(row)` (e.g. the party in `t.by`), and the value at (cell, state) is the FOUR face that
 * state witnesses: t if it charged the positive face, f the converse, ⊤ both, ⊥ (open-world absent)
 * neither. This is exactly the Chu presentation `Obsmetrologia.predicationChu` names: predications as
 * points, valuations (here, witnessing parties) as states, evaluation as the matrix entry.
 */
export function sectionSpace(folded, rows = [], opts = {}) {
    const stateOf = opts.stateOf ?? ((r) => (r && r.t && typeof r.t === "object" ? r.t.by : r?.t));
    const absent = opts.absent ?? FOUR.BOT;
    const stateOfId = new Map();
    for (const r of rows) {
        const s = stateOf(r);
        if (s != null)
            stateOfId.set(rowId(r), String(s));
    }
    const partiesOf = (ids) => {
        const out = new Set();
        for (const id of ids) {
            const s = stateOfId.get(id);
            if (s != null)
                out.add(s);
        }
        return out;
    };
    const cells = new Map();
    const posParties = new Map();
    const negParties = new Map();
    const stateSet = new Set();
    for (const c of folded.fiber) {
        if (opts.predicate !== undefined && c.predicate !== opts.predicate)
            continue;
        const key = jcs([c.predicate, c.object]);
        cells.set(key, { predicate: c.predicate, object: c.object, charge: c.value });
        const [posIds, negIds] = c.value.evidence;
        const pos = partiesOf(posIds);
        const neg = partiesOf(negIds);
        posParties.set(key, pos);
        negParties.set(key, neg);
        for (const s of pos)
            stateSet.add(s);
        for (const s of neg)
            stateSet.add(s);
    }
    const points = [...cells.keys()].sort();
    const states = [...stateSet].sort();
    const valueAt = (point, state) => {
        const pos = posParties.get(point)?.has(state) ?? false;
        const neg = negParties.get(point)?.has(state) ?? false;
        if (!pos && !neg)
            return absent;
        return fromCharge({ value: [pos, neg], evidence: [[], []] });
    };
    return {
        space: chuSpace(points, states, valueAt, { absent }),
        cellFor: (key) => cells.get(key),
        stateOfId,
    };
}
function deepFreeze(v) {
    if (v && typeof v === "object" && !Object.isFrozen(v)) {
        for (const c of Object.values(v))
            deepFreeze(c);
        Object.freeze(v);
    }
    return v;
}
//# sourceMappingURL=independent-evidence.mjs.map