/**
 * holography — projections from a communicating whole into readable layers.
 *
 * Holography is the representation boundary, not a codec. It does not encode a
 * carrier for transport; it reads the communicative whole through layer
 * projections whose parts remain accountable to the whole parse.
 */
import type { LambekForestProof, ParseForest, ParseResult, CohomologyResult } from "../speaking/listening/parsing/index.mjs";
import type { CompiledBundle } from "../speaking/listening/algebra/index.mjs";
import type { GrammaticalityResult } from "../speaking/listening/judging/grammaticality/index.mjs";
import type { DiscourseInformation, DiscourseState, SemanticFrame, ReferenceResult } from "../speaking/listening/understanding/index.mjs";
/** A full report over one sentence: the settled parse and every layer's reading. */
export interface Reading {
    readonly text: string;
    readonly forest: ParseForest;
    readonly lambek: LambekForestProof;
    readonly discourse: DiscourseState;
    readonly discourseInformation: DiscourseInformation;
    readonly parse: ParseResult;
    readonly roles: readonly SemanticFrame[];
    readonly grammaticality: GrammaticalityResult;
    readonly cohomology: CohomologyResult;
    readonly reference: ReferenceResult;
}
/** Articulate text, take its first sentence, and settle it through the engine. */
export declare function settle(text: string, bundle: CompiledBundle): ParseForest;
/** Read a sentence at every layer at once — the headline endomorphism. */
export declare function read(text: string, bundle: CompiledBundle): Reading;
/** A holographic projection of a reading: layer views accountable to the whole. */
export declare function projectReading(reading: Reading): Record<string, unknown>;
//# sourceMappingURL=index.d.mts.map