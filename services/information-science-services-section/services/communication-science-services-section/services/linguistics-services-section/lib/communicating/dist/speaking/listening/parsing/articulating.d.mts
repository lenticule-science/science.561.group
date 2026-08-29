import type { Span, Tier, ArticulateResult } from "./types.mjs";
import type { CompiledBundle } from "./types.mjs";
import { type CommunicatingCarrier } from "./carrier.mjs";
/** Build a frozen span. */
export declare function span(tier: Tier, text: string, start: number | null, end: number | null): Span;
/** A rule-span (synthesized — no offsets, carries a rule id as text). */
export declare function ruleSpan(ruleId: string): Span;
/** Unicode-aware tokenizer: extracts words as spans, preserving absolute offsets.
 * A word token is one or more Unicode letter/mark/number runs, connected by
 * word-internal joiners (apostrophes, hyphens). This is the pipeline's DEFAULT
 * behavior — branch (c) of `tokenizeWithBundle` — unchanged from before the
 * segmentation hook. */
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
/** Segment text into the full span hierarchy and build containment + sequence edges. */
export declare function articulate(text: string, bundle: CompiledBundle): ArticulateResult;
export declare function articulateCommunication(carrier: CommunicatingCarrier, bundle: CompiledBundle): ArticulateResult;
//# sourceMappingURL=articulating.d.mts.map