import { type FromSchema } from "@red-cup-engineering/relating";
export declare const CommonGroundBasisSchema: {
    readonly enum: readonly ["perceptual-co-presence", "prior-discourse", "community-membership", "cultural-knowledge", "accommodation"];
};
export type CommonGroundBasis = FromSchema<typeof CommonGroundBasisSchema>;
export declare const commonGroundPropositionSchema: {
    readonly $id: "communicating/speaking/listening/grounding/proposition";
    readonly title: "CommonGroundProposition";
    readonly description: "A proposition treated as shared in common ground, with its warrant.";
    readonly type: "object";
    readonly required: readonly ["kind", "proposition", "basis"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.speaking.listening.grounding.proposition";
        };
        readonly proposition: {};
        readonly basis: {
            readonly enum: readonly ["perceptual-co-presence", "prior-discourse", "community-membership", "cultural-knowledge", "accommodation"];
        };
    };
};
export declare const commonGroundPropositionCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.speaking.listening.grounding.proposition";
    readonly basis: "prior-discourse" | "accommodation" | "perceptual-co-presence" | "community-membership" | "cultural-knowledge";
    readonly proposition: unknown;
}>;
export type CommonGroundProposition<Proposition = unknown> = Omit<FromSchema<typeof commonGroundPropositionSchema>, "proposition"> & {
    readonly proposition: Proposition;
};
export declare const commonGroundSchema: {
    readonly $id: "communicating/speaking/listening/grounding/common-ground";
    readonly title: "CommonGroundCarrier";
    readonly description: "A finite common-ground state: propositions participants treat as shared.";
    readonly type: "object";
    readonly required: readonly ["kind", "propositions"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.speaking.listening.grounding.commonGround";
        };
        readonly propositions: {
            readonly type: "array";
            readonly items: {};
        };
    };
};
export declare const commonGroundCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.speaking.listening.grounding.commonGround";
    readonly propositions: readonly unknown[];
}>;
export type CommonGroundCarrier<Proposition = unknown> = Omit<FromSchema<typeof commonGroundSchema>, "propositions"> & {
    readonly propositions: readonly CommonGroundProposition<Proposition>[];
};
export declare const commonGroundUpdateSchema: {
    readonly $id: "communicating/speaking/listening/grounding/update";
    readonly title: "CommonGroundUpdate";
    readonly description: "A before/after common-ground morphism.";
    readonly type: "object";
    readonly required: readonly ["kind", "before", "after", "proposition", "mode"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.speaking.listening.grounding.update";
        };
        readonly before: {};
        readonly after: {};
        readonly proposition: {};
        readonly mode: {
            readonly enum: readonly ["assertion", "accommodation", "challenge"];
        };
    };
};
export declare const commonGroundUpdateCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.speaking.listening.grounding.update";
    readonly before: unknown;
    readonly after: unknown;
    readonly mode: "challenge" | "accommodation" | "assertion";
    readonly proposition: unknown;
}>;
export type CommonGroundUpdate<Proposition = unknown> = Omit<FromSchema<typeof commonGroundUpdateSchema>, "before" | "after" | "proposition"> & {
    readonly before: CommonGroundCarrier<Proposition>;
    readonly after: CommonGroundCarrier<Proposition>;
    readonly proposition: CommonGroundProposition<Proposition>;
};
//# sourceMappingURL=carriers.d.mts.map