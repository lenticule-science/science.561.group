import { carrierFrom } from "@red-cup-engineering/relating";
export const speakerSchema = {
    $id: "communicating/messaging/speaker",
    title: "SpeakerCarrier",
    description: "The extending endpoint of a channel, bound to a semiosphere.",
    type: "object",
    required: ["kind", "name", "semiosphere"],
    additionalProperties: false,
    properties: {
        kind: { const: "communicating.messaging.speaker" },
        name: { type: "string" },
        semiosphere: {},
    },
};
export const speakerCarrier = carrierFrom(speakerSchema);
export const listenerSchema = {
    $id: "communicating/messaging/listener",
    title: "ListenerCarrier",
    description: "The restricting endpoint of a channel, bound to a semiosphere.",
    type: "object",
    required: ["kind", "name", "semiosphere"],
    additionalProperties: false,
    properties: {
        kind: { const: "communicating.messaging.listener" },
        name: { type: "string" },
        semiosphere: {},
    },
};
export const listenerCarrier = carrierFrom(listenerSchema);
export const channelSchema = {
    $id: "communicating/messaging/channel",
    title: "ChannelCarrier",
    description: "A directed relation between semiospheres with an optional capacity.",
    type: "object",
    required: ["kind", "medium", "from", "to", "capacity"],
    additionalProperties: false,
    properties: {
        kind: { const: "communicating.messaging.channel" },
        medium: { type: "string" },
        from: {},
        to: {},
        capacity: { type: ["integer", "null"] },
    },
};
export const channelCarrier = carrierFrom(channelSchema);
export const MessageStatusSchema = { enum: ["sent", "received"] };
export const messageSchema = {
    $id: "communicating/messaging/message",
    title: "MessageCarrier",
    description: "A message placed in transit on a channel and tracked as a once-consumed linear resource.",
    type: "object",
    required: ["kind", "text", "content", "speaker", "listener", "channel", "status", "charge"],
    additionalProperties: false,
    properties: {
        kind: { const: "communicating.messaging.message" },
        text: { type: "string" },
        content: {},
        speaker: {},
        listener: {},
        channel: {},
        status: MessageStatusSchema,
        charge: {},
    },
};
export const messageCarrier = carrierFrom(messageSchema);
export const uptakeSchema = {
    $id: "communicating/messaging/uptake",
    title: "UptakeCarrier",
    description: "A listener's uptake: the settled record of restricting an in-transit message.",
    type: "object",
    required: ["kind", "consumed", "reading", "charge"],
    additionalProperties: false,
    properties: {
        kind: { const: "communicating.messaging.uptake" },
        consumed: {},
        reading: {},
        charge: {},
    },
};
export const uptakeCarrier = carrierFrom(uptakeSchema);
//# sourceMappingURL=carriers.mjs.map