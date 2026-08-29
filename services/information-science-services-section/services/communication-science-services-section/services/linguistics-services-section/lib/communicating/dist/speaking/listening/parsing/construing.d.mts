import type { Span, ConstrainedResult } from "./types.mjs";
import type { CompiledBundle } from "./types.mjs";
/** Construe a sentence span (and its word-spans from the articulation base) into a
 * ConstrainedResult: words with POS tags + features, arc proposals, and kernel entries. */
export declare function construe(sentenceSpan: Span, wordSpans: readonly Span[], bundle: CompiledBundle): ConstrainedResult;
/** Helper: extract word-tier spans for a sentence from the articulate base. */
export declare function wordsInSentence(sentenceSpan: Span, allSpans: readonly Span[]): readonly Span[];
//# sourceMappingURL=construing.d.mts.map