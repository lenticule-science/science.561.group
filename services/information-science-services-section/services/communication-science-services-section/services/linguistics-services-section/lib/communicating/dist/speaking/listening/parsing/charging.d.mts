import type { Word, Arc, Entry, SpecializationEdge, Question } from "./types.mjs";
/** Result of charging a sentence: entries and specialization edges for descend(). */
export interface ChargingResult {
    readonly entries: readonly Entry[];
    readonly specialization: readonly SpecializationEdge[];
    readonly questions: readonly Question[];
}
/** Build kernel entries from words and arc proposals. */
export declare function charge(words: readonly Word[], arcs: readonly Arc[]): ChargingResult;
//# sourceMappingURL=charging.d.mts.map