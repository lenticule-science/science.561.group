import { type FromSchema } from "@red-cup-engineering/relating";
export declare const signRelationSchema: {
    readonly $id: "communicating/speaking/signifying/sign-relation";
    readonly title: "SignRelationCarrier";
    readonly description: "A triadic sign relation: vehicle, object, interpretant.";
    readonly type: "object";
    readonly required: readonly ["kind", "vehicle", "object", "interpretant"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.speaking.signifying.signRelation";
        };
        readonly vehicle: {};
        readonly object: {};
        readonly interpretant: {};
    };
};
export declare const signRelationCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly object: unknown;
    readonly kind: "communicating.speaking.signifying.signRelation";
    readonly vehicle: unknown;
    readonly interpretant: unknown;
}>;
export type SignRelationCarrier<Vehicle = unknown, Object = unknown, Interpretant = unknown> = Omit<FromSchema<typeof signRelationSchema>, "vehicle" | "object" | "interpretant"> & {
    readonly vehicle: Vehicle;
    readonly object: Object;
    readonly interpretant: Interpretant;
};
export declare const semiosisStepSchema: {
    readonly $id: "communicating/speaking/signifying/semiosis-step";
    readonly title: "SemiosisStepCarrier";
    readonly description: "One semiosis step: the prior interpretant becomes the next sign vehicle.";
    readonly type: "object";
    readonly required: readonly ["kind", "prior", "next"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.speaking.signifying.semiosisStep";
        };
        readonly prior: {};
        readonly next: {};
    };
};
export declare const semiosisStepCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.speaking.signifying.semiosisStep";
    readonly prior: unknown;
    readonly next: unknown;
}>;
export type SemiosisStepCarrier<Prior extends SignRelationCarrier = SignRelationCarrier, Next extends SignRelationCarrier = SignRelationCarrier> = Omit<FromSchema<typeof semiosisStepSchema>, "prior" | "next"> & {
    readonly prior: Prior;
    readonly next: Next;
};
export declare const semiosphereSchema: {
    readonly $id: "communicating/speaking/signifying/semiosphere";
    readonly title: "SemiosphereCarrier";
    readonly description: "A named semiotic domain within which sign relations are interpreted.";
    readonly type: "object";
    readonly required: readonly ["kind", "name"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.speaking.signifying.semiosphere";
        };
        readonly name: {
            readonly type: "string";
        };
    };
};
export declare const semiosphereCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.speaking.signifying.semiosphere";
    readonly name: string;
}>;
export type SemiosphereCarrier = FromSchema<typeof semiosphereSchema>;
export declare const semiosphereBoundaryTranslationSchema: {
    readonly $id: "communicating/speaking/signifying/semiosphere-boundary-translation";
    readonly title: "SemiosphereBoundaryTranslation";
    readonly description: "A semantic boundary translation into a semiosphere.";
    readonly type: "object";
    readonly required: readonly ["kind", "semiosphere", "external", "internal"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.speaking.signifying.semiosphereBoundaryTranslation";
        };
        readonly semiosphere: {};
        readonly external: {};
        readonly internal: {};
    };
};
export declare const semiosphereBoundaryTranslationCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.speaking.signifying.semiosphereBoundaryTranslation";
    readonly semiosphere: unknown;
    readonly external: unknown;
    readonly internal: unknown;
}>;
export type SemiosphereBoundaryTranslation<External = unknown, Internal extends SignRelationCarrier = SignRelationCarrier> = Omit<FromSchema<typeof semiosphereBoundaryTranslationSchema>, "semiosphere" | "external" | "internal"> & {
    readonly semiosphere: SemiosphereCarrier;
    readonly external: External;
    readonly internal: Internal;
};
//# sourceMappingURL=carriers.d.mts.map