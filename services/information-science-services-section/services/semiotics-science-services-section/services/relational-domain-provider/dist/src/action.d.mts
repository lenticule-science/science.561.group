import type { Tm } from "@red-cup-engineering/relation-model-notation/types";
import type { Carrier } from "./carrier.mjs";
export interface ActionSpec {
    readonly verb: string;
    readonly inputFormat?: string;
    readonly outputFormat?: string;
    readonly summary?: string;
    readonly description?: string;
    readonly options?: readonly string[];
    readonly domain?: Carrier;
    readonly codomain?: Carrier;
    readonly runTerm?: Tm;
    readonly run?: (input: unknown, args: Record<string, unknown>) => unknown | Promise<unknown>;
}
export interface Action extends Readonly<Omit<ActionSpec, "run">> {
    readonly kind: "relating.action";
    readonly inputFormat: string;
    readonly outputFormat: string;
    readonly options: readonly string[];
    readonly run: (input: unknown, args: Record<string, unknown>) => unknown | Promise<unknown>;
}
export declare function action(spec: ActionSpec): Action;
//# sourceMappingURL=action.d.mts.map