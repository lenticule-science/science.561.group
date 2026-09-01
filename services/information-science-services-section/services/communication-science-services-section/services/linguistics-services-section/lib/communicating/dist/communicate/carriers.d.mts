import { type FromSchema, type Meme } from "@red-cup-engineering/relating";
export declare const speakInputSchema: {
    readonly $id: "communicating/communicate/speak-input";
    readonly type: "object";
    readonly required: readonly ["meme", "speaker"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly speaker: {
            readonly type: "string";
        };
        readonly listener: {
            readonly type: "string";
        };
        readonly medium: {
            readonly type: "string";
        };
        readonly capacity: {
            readonly type: "number";
        };
        readonly meme: {
            readonly $ref: "relating/articulating/predicating/positing/meme";
            readonly description: "A relating meme carrier.";
        };
    };
};
export declare const speakInputCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly speaker: string;
    readonly meme: unknown;
    readonly listener?: string;
    readonly medium?: string;
    readonly capacity?: number;
}>;
export declare const listenInputSchema: {
    readonly $id: "communicating/communicate/listen-input";
    readonly type: "object";
    readonly required: readonly ["meme", "listener"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly listener: {
            readonly type: "string";
        };
        readonly meme: {
            readonly $ref: "relating/articulating/predicating/positing/meme";
            readonly description: "A relating meme carrier.";
        };
    };
};
export declare const listenInputCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly listener: string;
    readonly meme: unknown;
}>;
export declare const groundInputSchema: {
    readonly $id: "communicating/communicate/ground-input";
    readonly type: "object";
    readonly required: readonly ["meme", "partner", "mode"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly partner: {
            readonly type: "string";
        };
        readonly mode: {
            readonly enum: readonly ["assertion", "accommodation", "challenge"];
        };
        readonly meme: {
            readonly $ref: "relating/articulating/predicating/positing/meme";
            readonly description: "A relating meme carrier.";
        };
    };
};
export declare const groundInputCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly meme: unknown;
    readonly mode: "challenge" | "accommodation" | "assertion";
    readonly partner: string;
}>;
export declare const composeInputSchema: {
    readonly $id: "communicating/communicate/compose-input";
    readonly type: "object";
    readonly required: readonly ["meme", "with"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly with: {
            readonly $ref: "relating/articulating/predicating/positing/meme";
            readonly description: "A relating meme carrier.";
        };
        readonly meme: {
            readonly $ref: "relating/articulating/predicating/positing/meme";
            readonly description: "A relating meme carrier.";
        };
    };
};
export declare const composeInputCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly with: unknown;
    readonly meme: unknown;
}>;
export declare const illocuteInputSchema: {
    readonly $id: "communicating/communicate/illocute-input";
    readonly type: "object";
    readonly required: readonly ["meme", "force"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly force: {
            readonly enum: readonly ["assertive", "directive", "commissive", "expressive", "declaration"];
        };
        readonly goal: {
            readonly type: "string";
        };
        readonly perlocution: {
            readonly type: "string";
        };
        readonly meme: {
            readonly $ref: "relating/articulating/predicating/positing/meme";
            readonly description: "A relating meme carrier.";
        };
    };
};
export declare const illocuteInputCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly meme: unknown;
    readonly force: "assertive" | "directive" | "commissive" | "expressive" | "declaration";
    readonly goal?: string;
    readonly perlocution?: string;
}>;
export declare const modalizeInputSchema: {
    readonly $id: "communicating/communicate/modalize-input";
    readonly type: "object";
    readonly required: readonly ["meme", "mode", "witness"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly mode: {
            readonly type: "string";
        };
        readonly witness: {
            readonly type: "string";
        };
        readonly meme: {
            readonly $ref: "relating/articulating/predicating/positing/meme";
            readonly description: "A relating meme carrier.";
        };
    };
};
export declare const modalizeInputCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly meme: unknown;
    readonly mode: string;
    readonly witness: string;
}>;
export declare const presupposeInputSchema: {
    readonly $id: "communicating/communicate/presuppose-input";
    readonly type: "object";
    readonly required: readonly ["meme", "trigger"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly trigger: {
            readonly type: "string";
        };
        readonly meme: {
            readonly $ref: "relating/articulating/predicating/positing/meme";
            readonly description: "A relating meme carrier.";
        };
    };
};
export declare const presupposeInputCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly meme: unknown;
    readonly trigger: string;
}>;
export declare const quoteInputSchema: {
    readonly $id: "communicating/communicate/quote-input";
    readonly type: "object";
    readonly required: readonly ["meme", "position"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly position: {
            readonly enum: readonly ["subject", "object"];
        };
        readonly meme: {
            readonly $ref: "relating/articulating/predicating/positing/meme";
            readonly description: "A relating meme carrier.";
        };
    };
};
export declare const quoteInputCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly position: "object" | "subject";
    readonly meme: unknown;
}>;
export declare const referInputSchema: {
    readonly $id: "communicating/communicate/refer-input";
    readonly type: "object";
    readonly required: readonly ["meme", "position", "entity"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly position: {
            readonly enum: readonly ["subject", "object"];
        };
        readonly entity: {};
        readonly meme: {
            readonly $ref: "relating/articulating/predicating/positing/meme";
            readonly description: "A relating meme carrier.";
        };
    };
};
export declare const referInputCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly position: "object" | "subject";
    readonly entity: unknown;
    readonly meme: unknown;
}>;
export declare const translateInputSchema: {
    readonly $id: "communicating/communicate/translate-input";
    readonly type: "object";
    readonly required: readonly ["meme", "target"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly target: {
            readonly type: "string";
            readonly minLength: 1;
        };
        readonly meme: {
            readonly $ref: "relating/articulating/predicating/positing/meme";
            readonly description: "A relating meme carrier.";
        };
    };
};
export declare const translateInputCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly target: string;
    readonly meme: unknown;
}>;
type WithMeme<T> = Omit<T, "meme"> & {
    readonly meme: Meme;
};
export type SpeakInput = WithMeme<FromSchema<typeof speakInputSchema>>;
export type ListenInput = WithMeme<FromSchema<typeof listenInputSchema>>;
export type GroundInput = WithMeme<FromSchema<typeof groundInputSchema>>;
export type ComposeInput = WithMeme<Omit<FromSchema<typeof composeInputSchema>, "with">> & {
    readonly with: Meme;
};
export type IllocuteInput = WithMeme<FromSchema<typeof illocuteInputSchema>>;
export type ModalizeInput = WithMeme<FromSchema<typeof modalizeInputSchema>>;
export type PresupposeInput = WithMeme<FromSchema<typeof presupposeInputSchema>>;
export type QuoteInput = WithMeme<FromSchema<typeof quoteInputSchema>>;
export type ReferInput = WithMeme<FromSchema<typeof referInputSchema>>;
export type TranslateInput = WithMeme<FromSchema<typeof translateInputSchema>>;
export {};
//# sourceMappingURL=carriers.d.mts.map