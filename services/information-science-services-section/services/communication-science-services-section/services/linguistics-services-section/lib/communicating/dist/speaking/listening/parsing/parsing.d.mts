import type { Span, ParseResult } from "./types.mjs";
import type { ArticulateResult, CompiledBundle } from "./types.mjs";
import type { CommunicatingCarrier } from "./carrier.mjs";
/** Parse a sentence span and return the full ParseResult. */
export declare function parse(sentenceSpan: Span, base: ArticulateResult, bundle: CompiledBundle): ParseResult;
/** Parse the first sentence of an admitted communicating document. */
export declare function parseCommunication(carrier: CommunicatingCarrier, bundle: CompiledBundle): ParseResult;
//# sourceMappingURL=parsing.d.mts.map