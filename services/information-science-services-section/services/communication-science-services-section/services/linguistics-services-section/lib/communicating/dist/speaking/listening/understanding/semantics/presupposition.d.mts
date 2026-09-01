import type { ParseResult } from "../../parsing/index.mjs";
import type { ChargeValue } from "../../parsing/index.mjs";
export type TriggerKind = "definite-description" | "factive" | "aspectual" | "cleft";
export interface PresuppositionTrigger {
    readonly kind: TriggerKind;
    readonly text: string;
}
export interface Presupposition {
    readonly trigger: PresuppositionTrigger;
    readonly presupposed: string;
    readonly projectsUnderNegation: true;
    readonly status: ChargeValue;
}
/** Detect presupposition triggers in a parse result. */
export declare function presuppositions(result: ParseResult): readonly Presupposition[];
//# sourceMappingURL=presupposition.d.mts.map