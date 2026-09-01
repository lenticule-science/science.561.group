/**
 * messaging/protocol-translate - across-face wires as one utterance factor.
 *
 * ActivityPub C2S, CloudEvents, and DIDComm plaintext are projections of one
 * communicating boundary item: utterer token, illocutionary force, witness time,
 * truth charge, and claim. Protocol translation is therefore a projector
 * transcode through that carried item, not a mesh of per-pair adapters.
 */
import { type ChargeValueName, type FromSchema, type UtteranceCarrier } from "@red-cup-engineering/relating";
import { type Projector } from "@red-cup-engineering/relating/writing";
import type { IllocutionaryForce } from "../speaking/illocuting/index.mjs";
export declare const ACTIVITYSTREAMS_CONTEXT: "https://www.w3.org/ns/activitystreams";
export declare const ACTIVITYPUB_C2S_CONTENT_TYPE: "application/activity+json";
export declare const DIDCOMM_PLAINTEXT_CONTENT_TYPE: "application/didcomm-plain+json";
export type AcrossFaceProtocol = "activitypub-c2s" | "cloudevents" | "didcomm";
export interface ProtocolUtteranceCarrier {
    readonly kind: "communicating.messaging.protocol-utterance";
    readonly protocol: AcrossFaceProtocol;
    readonly utterance: UtteranceCarrier;
    readonly force: IllocutionaryForce | null;
    readonly time: string | null;
    readonly truthCharge: ChargeValueName;
    readonly recipient: string | null;
}
export interface ProtocolTranslateOptions {
    readonly path?: string;
}
export interface SocializingAcrossFaceLift {
    readonly package: "@red-cup-engineering/socializing";
    readonly scale: "scale-2";
    readonly wires: readonly ["Matrix state-resolution", "ActivityPub S2S"];
    readonly law: "same-projector-transcode-factor";
    readonly status: "Roadmap";
}
export declare const socializingAcrossFaceLift: SocializingAcrossFaceLift;
export declare const activityPubC2sActivitySchema: {
    readonly $id: "communicating/messaging/activitypub-c2s/activity";
    readonly title: "ActivityPubC2SActivity";
    readonly description: "ActivityStreams C2S activity as one communicating across-face utterance wire projection.";
    readonly type: "object";
    readonly additionalProperties: false;
    readonly required: readonly ["@context", "type", "actor", "object"];
    readonly properties: {
        readonly "@context": {
            readonly const: "https://www.w3.org/ns/activitystreams";
        };
        readonly id: {
            readonly type: "string";
        };
        readonly type: {
            readonly type: "string";
        };
        readonly actor: {
            readonly type: "string";
        };
        readonly object: {
            readonly anyOf: readonly [{
                readonly type: "string";
            }, {
                readonly type: "object";
                readonly additionalProperties: true;
                readonly properties: {
                    readonly type: {
                        readonly type: "string";
                    };
                    readonly content: {
                        readonly type: "string";
                    };
                    readonly id: {
                        readonly type: "string";
                    };
                };
            }];
        };
        readonly target: {
            readonly type: "string";
        };
        readonly to: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
            };
        };
        readonly cc: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
            };
        };
        readonly published: {
            readonly type: "string";
        };
    };
};
export type ActivityPubC2sActivity = FromSchema<typeof activityPubC2sActivitySchema>;
export declare const activityPubC2sActivityCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly object: string | {
        readonly type?: string;
        readonly content?: string;
        readonly id?: string;
    };
    readonly type: string;
    readonly "@context": "https://www.w3.org/ns/activitystreams";
    readonly actor: string;
    readonly target?: string;
    readonly id?: string;
    readonly to?: readonly string[];
    readonly cc?: readonly string[];
    readonly published?: string;
}>;
export declare function negateProtocolUtterance(item: ProtocolUtteranceCarrier): ProtocolUtteranceCarrier;
export declare const protocolWireProjector: Projector<ProtocolUtteranceCarrier>;
export declare const activityPubC2sProjector: Projector<ProtocolUtteranceCarrier>;
export declare const cloudEventsProjector: Projector<ProtocolUtteranceCarrier>;
export declare const didcommProjector: Projector<ProtocolUtteranceCarrier>;
export declare const acrossFaceProtocolProjectors: Readonly<Record<AcrossFaceProtocol, Projector<ProtocolUtteranceCarrier>>>;
export declare const acrossFaceProtocolMediaTypes: Readonly<Record<AcrossFaceProtocol, string>>;
export declare function protocolProjector(protocol: AcrossFaceProtocol): Projector<ProtocolUtteranceCarrier>;
export declare function readProtocolUtterances(protocol: AcrossFaceProtocol, content: string, path?: string): ProtocolUtteranceCarrier[];
export declare function writeProtocolUtterances(protocol: AcrossFaceProtocol, items: readonly ProtocolUtteranceCarrier[]): string;
export declare function protocolTranslate(from: AcrossFaceProtocol, to: AcrossFaceProtocol, content: string, options?: ProtocolTranslateOptions): string;
//# sourceMappingURL=protocol-translate.d.mts.map