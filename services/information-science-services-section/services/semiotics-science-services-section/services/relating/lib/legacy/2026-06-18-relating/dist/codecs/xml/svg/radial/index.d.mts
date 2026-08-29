/**
 * codecs/xml/svg/radial — the radial codec: charged relational data ⇄ a
 * deterministic concentric-ring SVG.
 *
 * A carrier holds a FINITE element-set that varies with the settling ordinal, so
 * each concentric ring is one ordinal's element-set and each radial segment one
 * charged cell — filled by its charge value and seated by its orbit. The
 * orbit-coloring distinction is diagonal (Δ, a self-pair `(s,p,s)`) versus
 * off-diagonal (Δᶜ, a cross-pair `(s,p,o)`), read directly off the cell. The
 * encoding is deterministic: segments are key-sorted and there is no randomness,
 * so equal input yields equal bytes.
 *
 * A restriction of ./.. (svg), which itself restricts ../../ (xml); it reuses the
 * SVG root, the charge helpers, and the holography projector. Layout IS here — a
 * radial diagram has one canonical polar layout — unlike the layout-agnostic svg
 * codec.
 */
import { type Projector } from "../../../../holography/index.mjs";
import { affirmedCharge } from "../index.mjs";
import { serialize, type XmlNode } from "../../index.mjs";
import type { ChargeCarrier } from "../../../../articulating/predicating/positing/bilattice-charge.mjs";
import type { Valuation } from "../../../../articulating/predicating/positing/fiber.mjs";
import type { Meme } from "../../../../articulating/predicating/positing/meme.schema.types.mjs";
import type { PredicationValuationClosureStageCarrier } from "../../../../articulating/predicating/positing/settling/valuation-closure.mjs";
/** The orbit class of a cell: Δ (self-pair) or Δᶜ (cross-pair). */
export type Orbit = "diagonal" | "off-diagonal";
/**
 * A fill color per bilattice charge value, plus the center disc and the segment
 * outline stroke. The default is neutral and editable.
 */
export interface ChargePalette {
    readonly absurd: string;
    readonly potential: string;
    readonly active: string;
    readonly stable: string;
    readonly center: string;
    readonly stroke: string;
}
/** A neutral default palette: one distinct fill per FOUR-valued charge. */
export declare const chargePalette: ChargePalette;
/** One segment of a ring: a charged cell, its orbit, an optional label and weight. */
export interface RadialSegment {
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
export interface RadialRing {
    readonly ordinal: number;
    readonly label?: string;
    readonly segments: readonly RadialSegment[];
}
/** The normalized form the projector renders. */
export interface RadialDataform {
    readonly rings: readonly RadialRing[];
    readonly title?: string;
    readonly desc?: string;
    readonly size?: number;
    readonly background?: string;
}
/** Where ordinal 0 sits: at the center (apex) or at the rim (base). */
export type RadialCenter = "apex" | "base";
export interface ProjectRadialOptions {
    readonly palette?: ChargePalette;
    readonly center?: RadialCenter;
    readonly margin?: number;
    readonly holeRatio?: number;
    readonly declaration?: boolean;
}
/** Project a charged radial dataform into a deterministic, self-describing SVG. */
export declare function projectRadial(dataform: RadialDataform, options?: ProjectRadialOptions): string;
export { serialize };
/** A charged cell (Meme) as a segment: orbit from subject↔object identity. */
export declare function segmentOfMeme(meme: Meme): RadialSegment;
/**
 * A radial diagram of one valuation: one concentric ring PER predicate fiber,
 * each ring's segments the fiber's charged `(subject, object)` cells.
 */
export declare function radialFromValuation(valuation: Valuation, dataform?: Partial<RadialDataform>): RadialDataform;
/**
 * A radial diagram of a valuation-closure: one concentric ring PER ordinal stage,
 * each ring's segments that stage's charged cells. The "finite element-set that
 * varies with the settling ordinal" reading. The ring's ordinal is its position
 * in the closure sequence (stage 0 first).
 */
export declare function radialFromClosureStages(stages: readonly PredicationValuationClosureStageCarrier[], dataform?: Partial<RadialDataform>): RadialDataform;
/** The neutral fallback charge for a plainly-asserted segment: re-exported from svg. */
export { affirmedCharge };
/** The radial vocabulary as a holography projector restricting the SVG codec. */
export declare const radialProjector: Projector<XmlNode>;
//# sourceMappingURL=index.d.mts.map