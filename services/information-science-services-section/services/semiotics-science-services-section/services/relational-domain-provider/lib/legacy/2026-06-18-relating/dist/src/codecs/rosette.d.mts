/**
 * codecs/rosette — the relational rosette codec: charged relational data ⇄ a
 * deterministic circular beadwork "rosette" SVG, after Lakota beading practice.
 *
 * A rosette is concentric rings of radial bead-segments. The corpus already
 * proves the structure this codec draws: the FOUR bilattice charges
 * (`absurd`/`potential`/`active`/`stable`) are the bead palette — one Lakota
 * direction-color each, the Tóbtób Kiŋ four-charge sign — and the
 * orbit-coloring-generator paints a relation `Sym(E)`-orbit by orbit "regardless
 * of the source valuation": diagonal (Δ, self-pair `(s,p,s)`) versus off-diagonal
 * (Δᶜ, cross-pair `(s,p,o)`). A carrier holds a FINITE element-set that varies
 * with the settling ordinal, so each concentric ring is one ordinal's element-set
 * and each segment one charged cell — colored by its charge, placed by its orbit.
 * The encoding is deterministic: the package is content-addressed, no randomness.
 *
 * Like ./svg this is a restriction of ./xml; it reuses the SVG root, the charge
 * helpers, and the holography projector. Layout IS here — a rosette has one
 * canonical polar layout — unlike the layout-agnostic ./svg diagram codec.
 */
import { type Projector } from "../holography/index.mjs";
import { affirmedCharge } from "./svg.mjs";
import { serialize, type XmlNode } from "./xml.mjs";
import type { ChargeCarrier } from "../articulating/predicating/positing/bilattice-charge.mjs";
import type { Valuation } from "../articulating/predicating/positing/fiber.mjs";
import type { Meme } from "../articulating/predicating/positing/meme.schema.types.mjs";
import type { PredicationValuationClosureStageCarrier } from "../articulating/predicating/positing/settling/valuation-closure.mjs";
/** The Sym(E)-orbit class of a cell: Δ (self-pair) or Δᶜ (cross-pair). */
export type Orbit = "diagonal" | "off-diagonal";
/**
 * A bead palette: one color per bilattice charge value, plus the center "ground"
 * (the void at the heart) and the bead outline stroke. The four charges paint the
 * four Lakota directions; this default is editable — assign your own beadwork.
 */
export interface DirectionPalette {
    readonly absurd: string;
    readonly potential: string;
    readonly active: string;
    readonly stable: string;
    readonly ground: string;
    readonly stroke: string;
}
/**
 * The four-directions bead palette. The FOUR charges carry the four directions,
 * in Morgan's beadwork: absurd⊥→West (black), potential t→North (white),
 * active f→East (yellow), stable⊤→South (red); the center ground is earth-green.
 * The direction colors are Morgan's (N white, E yellow, S red, W black); the
 * charge↔direction pairing is the carrier's and can be re-paired here.
 */
export declare const lakotaDirections: DirectionPalette;
/** One bead of a ring: a charged cell, its orbit, an optional label and weight. */
export interface RosetteSegment {
    readonly e: string;
    readonly a?: string;
    readonly v?: string;
    readonly label?: string;
    readonly title?: string;
    readonly orbit?: Orbit;
    readonly charge: ChargeCarrier;
    readonly weight?: number;
}
/** One concentric ring: the carrier's finite element-set at one settling ordinal. */
export interface RosetteRing {
    readonly ordinal: number;
    readonly label?: string;
    readonly segments: readonly RosetteSegment[];
}
/** The normalized rosette the projector renders. */
export interface RosetteDataform {
    readonly rings: readonly RosetteRing[];
    readonly title?: string;
    readonly desc?: string;
    readonly size?: number;
    readonly background?: string;
}
/** Where the foundation ring sits: at the center (apex) or at the rim (base). */
export type RosetteCenter = "apex" | "base";
export interface ProjectRosetteOptions {
    readonly palette?: DirectionPalette;
    readonly center?: RosetteCenter;
    readonly margin?: number;
    readonly holeRatio?: number;
    readonly declaration?: boolean;
}
/** Project a charged rosette dataform into a deterministic, self-describing SVG. */
export declare function projectRosette(dataform: RosetteDataform, options?: ProjectRosetteOptions): string;
export { serialize };
/** A charged cell (Meme) as a rosette segment: orbit from subject↔object identity. */
export declare function segmentOfMeme(meme: Meme): RosetteSegment;
/**
 * A rosette of one valuation: one concentric ring PER predicate fiber, each
 * ring's beads the fiber's charged `(subject, object)` cells. The reading is "a
 * carrier's finite element-set per relation," one snapshot ordinal.
 */
export declare function rosetteFromValuation(valuation: Valuation, dataform?: Partial<RosetteDataform>): RosetteDataform;
/**
 * A rosette of a valuation-closure: one concentric ring PER ordinal stage, each
 * ring's beads that stage's charged cells. This is the "finite element-set that
 * varies with the settling ordinal" reading — the headline rosette. The ring's
 * ordinal is its position in the closure sequence (stage 0 the seed).
 */
export declare function rosetteFromClosureStages(stages: readonly PredicationValuationClosureStageCarrier[], dataform?: Partial<RosetteDataform>): RosetteDataform;
/** The neutral fallback charge for a plainly-asserted bead: re-exported from ./svg. */
export { affirmedCharge };
/** The rosette vocabulary as a holography projector restricting the SVG codec. */
export declare const rosetteProjector: Projector<XmlNode>;
//# sourceMappingURL=rosette.d.mts.map