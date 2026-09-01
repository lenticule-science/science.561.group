import { type ChargeValueName } from "@red-cup-engineering/relating";
export declare const registerFiberAxes: readonly ["register", "style", "evidentiality", "politeness", "genre"];
export type RegisterFiberAxis = typeof registerFiberAxes[number];
export interface RegisterFiberData {
    readonly register: readonly string[];
    readonly style: readonly string[];
    readonly evidentiality: readonly string[];
    readonly politeness: readonly string[];
    readonly genre: readonly string[];
}
export interface LanguageRegisterFiber extends RegisterFiberData {
    readonly kind: "communicating.language-register-fiber";
    readonly language: string;
}
export type RegisterFiberSelection = Partial<Record<RegisterFiberAxis, string>>;
export interface RegisterAxisDegradationReceipt {
    readonly axis: RegisterFiberAxis;
    readonly sourceValue: string | null;
    readonly targetValue: string | null;
    readonly sourceSpecificity: ChargeValueName;
    readonly targetSpecificity: ChargeValueName;
    readonly settlesDown: boolean;
    readonly lost: boolean;
}
export interface RegisterFiberDegradationReceipt {
    readonly kind: "communicating.register-fiber.degradation";
    readonly sourceLanguage: string;
    readonly targetLanguage: string;
    readonly axes: readonly RegisterAxisDegradationReceipt[];
    readonly sourceSpecificity: ChargeValueName;
    readonly targetSpecificity: ChargeValueName;
    readonly settlesDown: boolean;
    readonly fabricatesAssertivity: false;
}
export declare const registerFiberDataSchema: {
    readonly type: "object";
    readonly additionalProperties: false;
    readonly properties: {
        readonly register: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
                readonly minLength: 1;
            };
        };
        readonly style: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
                readonly minLength: 1;
            };
        };
        readonly evidentiality: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
                readonly minLength: 1;
            };
        };
        readonly politeness: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
                readonly minLength: 1;
            };
        };
        readonly genre: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
                readonly minLength: 1;
            };
        };
    };
};
export declare const languageRegisterFiberSchema: {
    readonly $id: "communicating/language/register-fiber";
    readonly type: "object";
    readonly required: readonly ["kind", "language", "register", "style", "evidentiality", "politeness", "genre"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.language-register-fiber";
        };
        readonly language: {
            readonly type: "string";
            readonly minLength: 1;
        };
        readonly register: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
                readonly minLength: 1;
            };
        };
        readonly style: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
                readonly minLength: 1;
            };
        };
        readonly evidentiality: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
                readonly minLength: 1;
            };
        };
        readonly politeness: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
                readonly minLength: 1;
            };
        };
        readonly genre: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
                readonly minLength: 1;
            };
        };
    };
};
export declare const languageRegisterFiberCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.language-register-fiber";
    readonly register: readonly string[];
    readonly style: readonly string[];
    readonly evidentiality: readonly string[];
    readonly politeness: readonly string[];
    readonly genre: readonly string[];
    readonly language: string;
}>;
export declare function languageRegisterFiber(language: string, data?: Partial<RegisterFiberData>): LanguageRegisterFiber;
export declare function registerFiberDegradationReceipt(source: LanguageRegisterFiber, target: LanguageRegisterFiber, selection?: RegisterFiberSelection): RegisterFiberDegradationReceipt;
//# sourceMappingURL=register-fiber.d.mts.map