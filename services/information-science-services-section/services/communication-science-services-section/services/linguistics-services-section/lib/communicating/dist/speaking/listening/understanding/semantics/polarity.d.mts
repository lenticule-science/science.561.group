import type { ParseResult } from "../../parsing/index.mjs";
import type { ChargeValue } from "../../parsing/index.mjs";
export interface PolarityFrame {
    readonly verb: string;
    readonly negated: boolean;
    readonly modal: string | null;
    readonly asserted: ChargeValue;
}
/** Extract polarity and modality from a parse result. */
export declare function polarity(result: ParseResult): readonly PolarityFrame[];
//# sourceMappingURL=polarity.d.mts.map