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
 * Row admission, identity, and grouping use the operational EAVT owner.
 * The independent evidence fold remains scientific; knowledge join is not
 * reimplemented: `foldIndependentEvidence` joins per-cell evidence with
 * `metrologic/bilattice`'s `joinKnowledge`; `sectionSpace` presents the folded
 * fiber as an explicit Chu space over FOUR via `metrologic/chu` and
 * `metrologic/chu/four`, exactly as the original did.
 */
import { assertRow, rowId, canonicalKey, type EavtRow } from "@red-cup-engineering/eavt";
export { rowId } from "@red-cup-engineering/eavt";
import { mark, type Mark } from "../utterance.mjs";
import { bottom, chargeSideName, joinKnowledge, negate, witnessedPotential, type ChargeCarrier } from "./positing/bilattice-charge.mjs";
import { chuSpace } from "@lenticule-science/metrologic/chu";
import { FOUR, fromCharge } from "@lenticule-science/metrologic/chu/four";
import type { ChuSpace, Four } from "@lenticule-science/metrologic/chu";

export type { EavtRow } from "@red-cup-engineering/eavt";

// === reified-row identity ===================================================================
/** A reified row is a row ABOUT a base row: its subject `e` is the base row's content-id, prefixed. */
export const REIFIED_PREFIX = "row:";
/** reify(base) -> the content-address of a base row, prefixed with the full canonical EAVT identity. */
export const reify = (base: EavtRow): string => `${REIFIED_PREFIX}${rowId(base)}`;
/** isReified(e) -> is this entity-id an attribution about a row (not a subject)? */
export const isReified = (e: unknown): e is string => typeof e === "string" && e.startsWith(REIFIED_PREFIX);

// === independent predication evidence ==========================================================
/** The witness kind tagging a row as one independent evidence-for/evidence-against observation. */
export const INDEPENDENT_EVIDENCE_WITNESS_KIND = "predication.independent-evidence";

/** One side of independent predication evidence. */
export type IndependentEvidenceSideName = "positive" | "negative";

/** The witness carried by an independent-evidence row's `t`. */
export type IndependentEvidenceWitness = {
  readonly kind: typeof INDEPENDENT_EVIDENCE_WITNESS_KIND;
  readonly version: 1;
  readonly side: IndependentEvidenceSideName;
  readonly by: string;
  readonly witness: EavtRow["t"];
}

/** Input to `independentEvidenceRow`. */
export interface IndependentEvidenceRowInput {
  readonly subject: string;
  readonly predicate: string;
  readonly object: unknown;
  readonly side: IndependentEvidenceSideName;
  readonly by: string;
  readonly witness: unknown;
}

/** An independent-evidence row: `t` carries which side this observation charges and who observed it. */
export interface IndependentEvidenceRow extends EavtRow {
  readonly t: IndependentEvidenceWitness;
}

/** Build one independent-evidence row: an exact EAVT row whose `t` names the side and the observer. */
export function independentEvidenceRow({ subject, predicate, object, side, by, witness }: IndependentEvidenceRowInput): IndependentEvidenceRow {
  if (typeof subject !== "string" || subject === "") throw new TypeError("independentEvidenceRow: subject must be a non-empty string");
  if (typeof predicate !== "string" || predicate === "") throw new TypeError("independentEvidenceRow: predicate must be a non-empty string");
  if (side !== "positive" && side !== "negative") throw new TypeError("independentEvidenceRow: side must be positive or negative");
  if (typeof by !== "string" || by === "") throw new TypeError("independentEvidenceRow: by must be a non-empty string");
  if (witness === undefined) throw new TypeError("independentEvidenceRow: witness is required");
  const row = {
    e: subject,
    a: predicate,
    v: object,
    t: { kind: INDEPENDENT_EVIDENCE_WITNESS_KIND, version: 1 as const, side, by, witness },
  };
  assertRow(row);
  return deepFreeze(row) as IndependentEvidenceRow;
}

/** The independent-evidence side an EAVT row witnesses, or null when the row carries no such witness. */
export function independentEvidenceSide(row: EavtRow): IndependentEvidenceSideName | null {
  const t = row?.t as Partial<IndependentEvidenceWitness> | undefined;
  if (t?.kind !== INDEPENDENT_EVIDENCE_WITNESS_KIND) return null;
  if (t.version !== 1) throw new TypeError("independent evidence witness must be version 1");
  if (t.side !== "positive" && t.side !== "negative") {
    throw new TypeError("independent evidence witness side must be positive or negative");
  }
  return t.side;
}

/** One claim seeding a predication point: a subject/predicate/object triple to fold evidence onto. */
export interface PredicationClaim {
  readonly subject: string;
  readonly predicate: string;
  readonly object: unknown;
}

/** One folded cell: the charge at a (predicate, object) point on the folded subject. */
export interface FoldedCell {
  readonly predicate: string;
  readonly object: unknown;
  readonly value: {
    readonly pos: 0 | 1;
    readonly neg: 0 | 1;
    readonly evidence: readonly [readonly string[], readonly string[]];
  };
}

/** A subject's settled section: a fiber of cells, one per distinct (predicate, object). */
export interface FoldedSection {
  readonly entity: string;
  readonly fiber: readonly FoldedCell[];
}

/** Options accepted by `foldIndependentEvidence`. `converse` is refused (see the module doc). */
export interface FoldIndependentEvidenceOptions {
  readonly retract?: boolean;
}

/**
 * foldIndependentEvidence — fold one subject's claims and evidence rows into its settled section.
 *
 * Claims seed the points, so a point with no evidence remains present at ⊥. Every evidence row is
 * exact EAVT; `independentEvidenceSide` names which independent coordinate it observed. A cell told
 * both sides settles to ⊤ (a HELD value, not an error) via the shared charge `joinKnowledge` —
 * nothing here re-derives the join.
 */
export function foldIndependentEvidence(
  subject: string,
  claims: readonly PredicationClaim[],
  rows: readonly EavtRow[],
  opts: FoldIndependentEvidenceOptions & { readonly converse?: never } = {},
): FoldedSection {
  if (typeof subject !== "string" || !subject) throw new TypeError("foldIndependentEvidence: subject must be a non-empty string");
  if (!Array.isArray(claims)) throw new TypeError("foldIndependentEvidence: claims must be an array");
  if (!Array.isArray(rows)) throw new TypeError("foldIndependentEvidence: rows must be an {e,a,v,t} array");
  if (Object.hasOwn(opts, "converse")) throw new TypeError("foldIndependentEvidence: converse is not denial; use independent negative witnesses");
  for (const row of rows) assertRow(row);

  const retractedAfter = new Map<string, unknown>();
  if (opts.retract !== false) {
    for (const r of rows) {
      if (r.e === subject && r.v === null) {
        const cur = retractedAfter.get(r.a);
        if (cur === undefined || (r.t as unknown as number) > (cur as unknown as number)) retractedAfter.set(r.a, r.t);
      }
    }
  }

  const cells = new Map<string, { predicate: string; object: unknown; charge: ChargeCarrier }>();
  for (const [index, claim] of claims.entries()) {
    if (!claim || typeof claim !== "object" || Array.isArray(claim)) throw new TypeError(`foldIndependentEvidence: claims[${index}] must be an object`);
    if (claim.subject !== subject) throw new TypeError(`foldIndependentEvidence: claims[${index}].subject must equal the folded subject`);
    if (typeof claim.predicate !== "string" || claim.predicate === "") throw new TypeError(`foldIndependentEvidence: claims[${index}].predicate must be a non-empty string`);
    const key = canonicalKey([claim.predicate, claim.object]);
    cells.set(key, { predicate: claim.predicate, object: claim.object, charge: bottom });
  }

  for (const r of rows) {
    if (r.e !== subject) continue;
    if (isReified(r.e)) continue;
    if (r.v === null) continue; // a retraction row carries no positive evidence
    const tombstone = retractedAfter.get(r.a);
    if (tombstone !== undefined && (r.t as unknown as number) < (tombstone as unknown as number)) continue;
    const side = independentEvidenceSide(r);
    if (side === null) continue; // not an independent-evidence witness: no path to charge a cell
    const id = rowId(r);
    const positive = witnessedPotential(mark(id));
    const contribution = side === "negative" ? negate(positive) : positive;
    const key = canonicalKey([r.a, r.v]);
    const prior = cells.get(key)?.charge ?? bottom;
    cells.set(key, { predicate: r.a, object: r.v, charge: joinKnowledge(prior, contribution) });
  }

  const fiber = [...cells.values()]
    .sort((a, b) => canonicalKey([a.predicate, a.object]).localeCompare(canonicalKey([b.predicate, b.object])))
    .map(({ predicate, object, charge }): FoldedCell => ({
      predicate,
      object,
      value: {
        pos: chargeSideName(charge.value[0]) === "present" ? 1 : 0,
        neg: chargeSideName(charge.value[1]) === "present" ? 1 : 0,
        evidence: [charge.evidence[0].map(rowIdentity), charge.evidence[1].map(rowIdentity)],
      },
    }));

  return deepFreeze({ entity: subject, fiber });
}

// The operational projection exposes row IDs; semantic evidence remains Marks.
function rowIdentity(witness: Mark): string {
  if (typeof witness.value !== "string") throw new TypeError("independent evidence must carry a row identity");
  return witness.value;
}

/** Options accepted by `sectionSpace`. */
export interface SectionSpaceOptions {
  /** The column coordinate a row witnesses (default `r.t?.by ?? r.t`). */
  readonly stateOf?: (row: EavtRow) => unknown;
  /** Keep only cells on this predicate (optional filter). */
  readonly predicate?: string;
  /** The FOUR a non-witnessing (cell,state) reads (default `FOUR.BOT`, open-world EAVT). */
  readonly absent?: Four;
}

/** One resolved cell of a `sectionSpace`. `charge` is the folded cell's own `value` (pos/neg/evidence) —
 * the exact carrier a consumer needs to read which row ids witnessed each face, not a flattened pair. */
export interface SectionSpaceCell {
  readonly predicate: string;
  readonly object: unknown;
  readonly charge: FoldedCell["value"];
}

/** The result of lifting a folded fiber into an explicit Chu space over FOUR. */
export interface SectionSpaceResult {
  readonly space: ChuSpace;
  readonly cellFor: (pointKey: string) => SectionSpaceCell | undefined;
  readonly stateOfId: ReadonlyMap<string, string>;
}

/**
 * sectionSpace(folded, rows, opts?) — lift a folded fiber-algebra into an explicit Chu space over
 * FOUR (`@lenticule-science/metrologic/chu`): the rich sibling of `section()`. The POINTS are the
 * folded cells (keyed `canonicalKey([predicate,object])`), the STATES are the witnessing coordinate
 * `stateOf(row)` (e.g. the party in `t.by`), and the value at (cell, state) is the FOUR face that
 * state witnesses: t if it charged the positive face, f the converse, ⊤ both, ⊥ (open-world absent)
 * neither. This is exactly the Chu presentation `Obsmetrologia.predicationChu` names: predications as
 * points, valuations (here, witnessing parties) as states, evaluation as the matrix entry.
 */
export function sectionSpace(folded: FoldedSection, rows: readonly EavtRow[] = [], opts: SectionSpaceOptions = {}): SectionSpaceResult {
  const stateOf = opts.stateOf ?? ((r: EavtRow) => (r && r.t && typeof r.t === "object" ? (r.t as { by?: unknown }).by : r?.t));
  const absent: Four = opts.absent ?? FOUR.BOT;
  const stateOfId = new Map<string, string>();
  for (const r of rows) {
    const s = stateOf(r);
    if (s != null) stateOfId.set(rowId(r), String(s));
  }
  const partiesOf = (ids: readonly string[]): Set<string> => {
    const out = new Set<string>();
    for (const id of ids) {
      const s = stateOfId.get(id);
      if (s != null) out.add(s);
    }
    return out;
  };

  const cells = new Map<string, SectionSpaceCell>();
  const posParties = new Map<string, Set<string>>();
  const negParties = new Map<string, Set<string>>();
  const stateSet = new Set<string>();
  for (const c of folded.fiber) {
    if (opts.predicate !== undefined && c.predicate !== opts.predicate) continue;
    const key = canonicalKey([c.predicate, c.object]);
    cells.set(key, { predicate: c.predicate, object: c.object, charge: c.value });
    const [posIds, negIds] = c.value.evidence;
    const pos = partiesOf(posIds);
    const neg = partiesOf(negIds);
    posParties.set(key, pos);
    negParties.set(key, neg);
    for (const s of pos) stateSet.add(s);
    for (const s of neg) stateSet.add(s);
  }
  const points = [...cells.keys()].sort();
  const states = [...stateSet].sort();
  const valueAt = (point: string, state: string): Four => {
    const pos = posParties.get(point)?.has(state) ?? false;
    const neg = negParties.get(point)?.has(state) ?? false;
    if (!pos && !neg) return absent;
    return fromCharge({ value: [pos, neg], evidence: [[], []] });
  };
  return {
    space: chuSpace(points, states, valueAt, { absent }),
    cellFor: (key: string) => cells.get(key),
    stateOfId,
  };
}

function deepFreeze<T>(v: T): T {
  if (v && typeof v === "object" && !Object.isFrozen(v)) {
    for (const c of Object.values(v as object)) deepFreeze(c);
    Object.freeze(v);
  }
  return v;
}
