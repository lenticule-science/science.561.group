import type { ChuSpace, Four } from "@lenticule-science/metrologic/chu";
/** An exact EAVT row: subject, predicate (a gerund), object (any JSON), transaction/witness. */
export interface EavtRow {
    readonly e: string;
    readonly a: string;
    readonly v: unknown;
    readonly t: unknown;
}
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
export declare function jcs(value: unknown): string;
/** The canonical id of a row: identical content -> identical id. This IS the row's identity. */
export declare function rowId(row: EavtRow): string;
/** A reified row is a row ABOUT a base row: its subject `e` is the base row's content-id, prefixed. */
export declare const REIFIED_PREFIX = "row:";
/** reify(base) -> the content-address of a base row, prefixed (16-hex slice keeps it legible). */
export declare const reify: (base: EavtRow) => string;
/** isReified(e) -> is this entity-id an attribution about a row (not a subject)? */
export declare const isReified: (e: unknown) => e is string;
/** The witness kind tagging a row as one independent evidence-for/evidence-against observation. */
export declare const INDEPENDENT_EVIDENCE_WITNESS_KIND = "predication.independent-evidence";
/** One side of independent predication evidence. */
export type IndependentEvidenceSideName = "positive" | "negative";
/** The witness carried by an independent-evidence row's `t`. */
export interface IndependentEvidenceWitness {
    readonly kind: typeof INDEPENDENT_EVIDENCE_WITNESS_KIND;
    readonly version: 1;
    readonly side: IndependentEvidenceSideName;
    readonly by: string;
    readonly witness: unknown;
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
export declare function independentEvidenceRow({ subject, predicate, object, side, by, witness }: IndependentEvidenceRowInput): IndependentEvidenceRow;
/** The independent-evidence side an EAVT row witnesses, or null when the row carries no such witness. */
export declare function independentEvidenceSide(row: EavtRow): IndependentEvidenceSideName | null;
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
 * both sides settles to ⊤ (a HELD value, not an error) via `metrologic/bilattice`'s `joinKnowledge` —
 * nothing here re-derives the join.
 */
export declare function foldIndependentEvidence(subject: string, claims: readonly PredicationClaim[], rows: readonly EavtRow[], opts?: FoldIndependentEvidenceOptions & {
    readonly converse?: never;
}): FoldedSection;
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
 * folded cells (keyed `jcs([predicate,object])`), the STATES are the witnessing coordinate
 * `stateOf(row)` (e.g. the party in `t.by`), and the value at (cell, state) is the FOUR face that
 * state witnesses: t if it charged the positive face, f the converse, ⊤ both, ⊥ (open-world absent)
 * neither. This is exactly the Chu presentation `Obsmetrologia.predicationChu` names: predications as
 * points, valuations (here, witnessing parties) as states, evaluation as the matrix entry.
 */
export declare function sectionSpace(folded: FoldedSection, rows?: readonly EavtRow[], opts?: SectionSpaceOptions): SectionSpaceResult;
//# sourceMappingURL=independent-evidence.d.mts.map