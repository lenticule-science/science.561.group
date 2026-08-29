import { type ChargeValueName } from "@red-cup-engineering/relating";
import { type LanguageManifest } from "./manifest.mjs";
import { type RegisterFiberDegradationReceipt, type RegisterFiberSelection } from "./register-fiber.mjs";
export interface TranslationRegisterDegradationOptions {
    readonly sourceRegister?: string;
    readonly targetRegisters?: readonly string[];
    readonly registerSelection?: RegisterFiberSelection;
}
export interface TranslationFactorReceipt {
    readonly kind: "communicating.translation-factor.receipt";
    readonly sourceLanguage: string;
    readonly targetLanguage: string;
    readonly law: "RelMath.Aperiodic.SoficShift.SoficImage.factor";
    readonly maturity: "Built+green";
    readonly sofic: {
        readonly source: unknown;
        readonly target: unknown;
        readonly sourceWitness: boolean;
        readonly targetWitness: boolean;
    };
    readonly truth: {
        readonly order: "truth";
        readonly factorMap: readonly TranslationChargeMapEntry[];
        readonly preservesTruthOrder: boolean;
        readonly commutesWithNegate: boolean;
        readonly fixedPoints: {
            readonly absurd: boolean;
            readonly stable: boolean;
        };
    };
    readonly degradation: TranslationDegradationReceipt;
}
export interface TranslationFactorChainOptions extends TranslationRegisterDegradationOptions {
    readonly closeCycle?: boolean;
}
export interface TranslationFactorChainReceipt {
    readonly kind: "communicating.translation-factor.chain-receipt";
    readonly languages: readonly string[];
    readonly law: "RelMath.Aperiodic.SoficShift.SoficImage.factor";
    readonly maturity: "Built+green";
    readonly legs: readonly TranslationFactorReceipt[];
    readonly oneTruthFactorMap: boolean;
    readonly allSoficWitnesses: boolean;
    readonly roundTrip: {
        readonly preservesTruthOrder: boolean;
        readonly commutesWithNegate: boolean;
        readonly fixedPoints: {
            readonly absurd: boolean;
            readonly stable: boolean;
        };
        readonly neverFabricatesAssertivity: boolean;
    };
}
export interface TranslationChargeMapEntry {
    readonly source: ChargeValueName;
    readonly target: ChargeValueName;
    readonly negateSourceThenTranslate: ChargeValueName;
    readonly translateThenNegate: ChargeValueName;
    readonly negateCommutes: boolean;
}
export interface TranslationDegradationReceipt {
    readonly kind: "communicating.translation.degradation";
    readonly sourceRegister: string | null;
    readonly targetRegisters: readonly string[];
    readonly sourceSpecificity: ChargeValueName;
    readonly targetSpecificity: ChargeValueName;
    readonly settlesDown: boolean;
    readonly fabricatesAssertivity: false;
    readonly fiber: RegisterFiberDegradationReceipt;
}
export declare function translationFactorReceipt(source: LanguageManifest, target: LanguageManifest, options?: TranslationRegisterDegradationOptions): TranslationFactorReceipt;
export declare function translationFactorChainReceipt(manifests: readonly LanguageManifest[], options?: TranslationFactorChainOptions): TranslationFactorChainReceipt;
//# sourceMappingURL=translation.d.mts.map