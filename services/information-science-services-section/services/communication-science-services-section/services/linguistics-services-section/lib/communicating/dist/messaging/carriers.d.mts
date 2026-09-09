import { type FromSchema } from "@red-cup-engineering/relating";
import type { SemiosphereCarrier } from "../speaking/signifying/index.mjs";
export declare const speakerSchema: {
    readonly $id: "communicating/messaging/speaker";
    readonly title: "SpeakerCarrier";
    readonly description: "The extending endpoint of a channel, bound to a semiosphere.";
    readonly type: "object";
    readonly required: readonly ["kind", "name", "semiosphere"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.messaging.speaker";
        };
        readonly name: {
            readonly type: "string";
        };
        readonly semiosphere: {};
    };
};
export declare const speakerCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.messaging.speaker";
    readonly name: string;
    readonly semiosphere: unknown;
}>;
export type SpeakerCarrier = Omit<FromSchema<typeof speakerSchema>, "semiosphere"> & {
    readonly semiosphere: SemiosphereCarrier;
};
export declare const listenerSchema: {
    readonly $id: "communicating/messaging/listener";
    readonly title: "ListenerCarrier";
    readonly description: "The restricting endpoint of a channel, bound to a semiosphere.";
    readonly type: "object";
    readonly required: readonly ["kind", "name", "semiosphere"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.messaging.listener";
        };
        readonly name: {
            readonly type: "string";
        };
        readonly semiosphere: {};
    };
};
export declare const listenerCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.messaging.listener";
    readonly name: string;
    readonly semiosphere: unknown;
}>;
export type ListenerCarrier = Omit<FromSchema<typeof listenerSchema>, "semiosphere"> & {
    readonly semiosphere: SemiosphereCarrier;
};
export declare const channelSchema: {
    readonly $id: "communicating/messaging/channel";
    readonly title: "ChannelCarrier";
    readonly description: "A directed relation between semiospheres with an optional capacity.";
    readonly type: "object";
    readonly required: readonly ["kind", "medium", "from", "to", "capacity"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.messaging.channel";
        };
        readonly medium: {
            readonly type: "string";
        };
        readonly from: {};
        readonly to: {};
        readonly capacity: {
            readonly type: readonly ["integer", "null"];
        };
    };
};
export declare const channelCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.messaging.channel";
    readonly medium: string;
    readonly capacity: number | null;
    readonly to: unknown;
    readonly from: unknown;
}>;
export type ChannelCarrier = Omit<FromSchema<typeof channelSchema>, "from" | "to"> & {
    readonly from: SemiosphereCarrier;
    readonly to: SemiosphereCarrier;
};
export declare const MessageStatusSchema: {
    readonly enum: readonly ["sent", "received"];
};
export type MessageStatus = FromSchema<typeof MessageStatusSchema>;
export declare const messageSchema: {
    readonly $id: "communicating/messaging/message";
    readonly title: "MessageCarrier";
    readonly description: "A message placed in transit on a channel and tracked as a once-consumed linear resource.";
    readonly type: "object";
    readonly required: readonly ["kind", "text", "content", "speaker", "listener", "channel", "status", "charge"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.messaging.message";
        };
        readonly text: {
            readonly type: "string";
        };
        readonly content: {};
        readonly speaker: {};
        readonly listener: {};
        readonly channel: {};
        readonly status: {
            readonly enum: readonly ["sent", "received"];
        };
        readonly charge: {};
    };
};
export declare const messageCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.messaging.message";
    readonly text: string;
    readonly speaker: unknown;
    readonly listener: unknown;
    readonly charge: unknown;
    readonly content: unknown;
    readonly status: "sent" | "received";
    readonly channel: unknown;
}>;
export type MessageCarrier = Omit<FromSchema<typeof messageSchema>, "speaker" | "listener" | "channel"> & {
    readonly speaker: SpeakerCarrier;
    readonly listener: ListenerCarrier;
    readonly channel: ChannelCarrier;
};
export declare const uptakeSchema: {
    readonly $id: "communicating/messaging/uptake";
    readonly title: "UptakeCarrier";
    readonly description: "A listener's uptake: the settled record of restricting an in-transit message.";
    readonly type: "object";
    readonly required: readonly ["kind", "consumed", "reading", "charge"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.messaging.uptake";
        };
        readonly consumed: {};
        readonly reading: {};
        readonly charge: {};
    };
};
export declare const uptakeCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.messaging.uptake";
    readonly charge: unknown;
    readonly consumed: unknown;
    readonly reading: unknown;
}>;
export type UptakeCarrier = Omit<FromSchema<typeof uptakeSchema>, "consumed"> & {
    readonly consumed: MessageCarrier;
};
//# sourceMappingURL=carriers.d.mts.map