import type { Span, Tier, ArticulateResult } from "./types.mjs";
import type { CompiledBundle } from "./types.mjs";
import { type CommunicatingCarrier } from "./carrier.mjs";
/** Build a frozen span. `numeric` (word-tier only) marks a recognized numeric token. */
export declare function span(tier: Tier, text: string, start: number | null, end: number | null, numeric?: boolean): Span;
/** A rule-span (synthesized — no offsets, carries a rule id as text). */
export declare function ruleSpan(ruleId: string): Span;
/** Unicode-aware tokenizer: extracts words as spans, preserving absolute offsets.
 * A word token is one or more Unicode letter/mark/number runs, connected by
 * word-internal joiners (apostrophes, hyphens) — OR a numeric token: a
 * comma-grouped or decimal number, with an optional leading currency symbol and
 * trailing percent sign, kept as ONE token (`"1,195"`, `"3.2%"`, `"€5"`,
 * `"$40.5bn"`). Numeric tokens carry `numeric: true`. This is the pipeline's
 * DEFAULT behavior — branch (c) of `tokenizeWithBundle`. */
export declare function tokenize(text: string, baseOffset: number): readonly Span[];
/** Bundle-aware word tokenization, threading the compiled bundle through to
 * `tokenize`'s three branches:
 *   (a) `bundle.segment` supplied — call it and locate each returned word
 *       sequentially in `text` to recover absolute offsets (`spansFromSegments`).
 *   (b) no `segment` but `grammar.segmentation.wordBoundary === "script"` —
 *       per-character tokenization (`tokenizeByScript`).
 *   (c) else — today's regex `tokenize`, unchanged.
 * The single call site for word tokenization in the pipeline (`splitWords`) goes
 * through here so every caller picks up bundle-supplied segmentation. */
export declare function tokenizeWithBundle(text: string, baseOffset: number, bundle: CompiledBundle): readonly Span[];
/** Scan `text` for quotation-mark pairs — straight (`"`, `'`) and curly
 * (“”, ‘’), single and double — yielding "quote" tier spans that include the
 * delimiting marks (so `text.slice(start, end) === span.text`, matching every
 * other span in this module). The curly open marks (“, ‘) are unambiguous and
 * always open; the curly right-single mark (’) and both straight marks double as
 * apostrophes, so those close only where `isWordBoundaryAfter` holds — a straight
 * or curly apostrophe inside a word ("Fry's", "OpenAI’s") is never mistaken for a
 * closing quote. Unmatched opens at end of text are simply dropped. */
export declare function findQuoteSpans(text: string, baseOffset: number): readonly Span[];
/** Segment text into the full span hierarchy and build containment + sequence edges.
 * Quote spans (tier "quote") are computed once over the whole text and added to
 * `spans` alongside the block/sentence/clause/word tiers; sentence articulation
 * consults them so a terminator inside a quote never ends the sentence. */
export declare function articulate(text: string, bundle: CompiledBundle): ArticulateResult;
export declare function articulateCommunication(carrier: CommunicatingCarrier, bundle: CompiledBundle): ArticulateResult;
//# sourceMappingURL=articulating.d.mts.map