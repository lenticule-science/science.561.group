import type { Span, ConstrainedResult } from "./types.mjs";
import type { CompiledBundle } from "./types.mjs";
/** Construe a sentence span (and its word-spans from the articulation base) into a
 * ConstrainedResult: words with POS tags + features, arc proposals, and kernel entries. */
export declare function construe(sentenceSpan: Span, wordSpans: readonly Span[], bundle: CompiledBundle): ConstrainedResult;
/** Helper: extract word-tier spans for a sentence from the articulate base. */
export declare function wordsInSentence(sentenceSpan: Span, allSpans: readonly Span[]): readonly Span[];
/**
 * Extract spans of a given tier fully contained in a sentence, from the
 * articulate base. Generalizes `wordsInSentence` to any tier (e.g. "quote").
 * @param sentenceSpan the sentence whose range spans must fall within
 * @param allSpans the full `ArticulateResult.spans` array to filter
 * @param tier the tier to select
 * @returns spans of `tier` with `start >= sentenceSpan.start` and `end <= sentenceSpan.end`
 */
export declare function spansInSentenceOfTier(sentenceSpan: Span, allSpans: readonly Span[], tier: Span["tier"]): readonly Span[];
//# sourceMappingURL=construing.d.mts.map