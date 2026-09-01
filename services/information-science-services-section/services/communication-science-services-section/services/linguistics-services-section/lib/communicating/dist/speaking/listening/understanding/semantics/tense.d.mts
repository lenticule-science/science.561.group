import type { ParseResult } from "../../parsing/index.mjs";
import type { ChargeValue } from "../../parsing/index.mjs";
export type TenseValue = "past" | "present" | "future";
export type AspectValue = "simple" | "progressive" | "perfect";
export type EvidentialValue = "firsthand" | "reported" | null;
export interface TemporalFrame {
    readonly verb: string;
    readonly tense: TenseValue;
    readonly aspect: AspectValue;
    readonly evidential: EvidentialValue;
    readonly epistemicStatus: ChargeValue;
}
/** Extract temporal information from a parse result. */
export declare function temporal(result: ParseResult): readonly TemporalFrame[];
//# sourceMappingURL=tense.d.mts.map