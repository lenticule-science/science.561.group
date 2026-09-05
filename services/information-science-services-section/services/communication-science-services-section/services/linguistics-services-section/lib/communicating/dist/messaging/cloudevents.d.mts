import { type ChargeValueName, type FromSchema, type JsonValue, type UtteranceCarrier } from "@red-cup-engineering/relating";
import type { IllocutionaryForce } from "../speaking/illocuting/index.mjs";
/** CloudEvents JSON Event Format media type for structured mode. */
export declare const CLOUDEVENTS_JSON_CONTENT_TYPE: "application/cloudevents+json";
/** CloudEvents core spec version carried in `specversion`. */
export declare const CLOUDEVENTS_SPECVERSION: "1.0";
/** The JSON content type used for direct structured `data` claims. */
export declare const CLOUDEVENTS_DATA_CONTENT_TYPE: "application/json";
export declare const cloudEventSchema: {
    readonly $id: "communicating/messaging/cloudevents/event";
    readonly title: "CloudEvent";
    readonly description: "A CloudEvents structured JSON envelope for one communicating membrane utterance: source=token, type=illocutionary force, time=T, data=claim.";
    readonly type: "object";
    readonly required: readonly ["specversion", "id", "source", "type", "time", "datacontenttype", "data"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly specversion: {
            readonly const: "1.0";
        };
        readonly id: {
            readonly type: "string";
            readonly minLength: 1;
        };
        readonly source: {
            readonly type: "string";
            readonly minLength: 1;
        };
        readonly type: {
            readonly enum: readonly ["assertive", "directive", "commissive", "expressive", "declaration"];
        };
        readonly time: {
            readonly type: "string";
            readonly minLength: 1;
        };
        readonly datacontenttype: {
            readonly const: "application/json";
        };
        readonly data: {};
        readonly emsenntruthcharge: {
            readonly enum: readonly ["absurd", "potential", "active", "stable"];
        };
    };
};
export type CloudEvent = Omit<FromSchema<typeof cloudEventSchema>, "type" | "data"> & {
    readonly type: IllocutionaryForce;
    readonly data: JsonValue;
    readonly emsenntruthcharge?: ChargeValueName;
};
export declare const cloudEventCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly type: "assertive" | "directive" | "commissive" | "expressive" | "declaration";
    readonly source: string;
    readonly id: string;
    readonly specversion: "1.0";
    readonly time: string;
    readonly datacontenttype: "application/json";
    readonly data: unknown;
    readonly emsenntruthcharge?: "potential" | "active" | "stable" | "absurd";
}>;
export interface CloudEventOptions {
    /** CloudEvents id; defaults to a deterministic urn over source/type/time/data. */
    readonly id?: string;
    /** Optional Belnap truth charge carried as a CloudEvents extension attribute. */
    readonly truthCharge?: ChargeValueName;
}
/** Read a membrane utterance as a CloudEvents structured JSON envelope. */
export declare function cloudEventFromUtterance(carrier: UtteranceCarrier, type: IllocutionaryForce, time: string, options?: CloudEventOptions): CloudEvent;
/** Read a CloudEvents structured JSON envelope back as its membrane utterance. */
export declare function utteranceFromCloudEvent(event: CloudEvent): UtteranceCarrier;
/** The CloudEvents `type` attribute is the same Searle force read by ActivityPub. */
export declare function cloudEventIllocutionaryForce(event: CloudEvent): IllocutionaryForce;
//# sourceMappingURL=cloudevents.d.mts.map