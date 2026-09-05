import { type SemiosphereCarrier } from "../speaking/signifying/index.mjs";
import type { CompiledBundle } from "../speaking/listening/algebra/index.mjs";
import type { ChannelCarrier, ListenerCarrier, MessageCarrier, SpeakerCarrier, UptakeCarrier } from "./carriers.mjs";
export { MessageStatusSchema, channelCarrier, listenerCarrier, messageCarrier, speakerCarrier, uptakeCarrier, } from "./carriers.mjs";
export type { ChannelCarrier, ListenerCarrier, MessageCarrier, MessageStatus, SpeakerCarrier, UptakeCarrier, } from "./carriers.mjs";
export { CLOUDEVENTS_DATA_CONTENT_TYPE, CLOUDEVENTS_JSON_CONTENT_TYPE, CLOUDEVENTS_SPECVERSION, cloudEventCarrier, cloudEventFromUtterance, cloudEventIllocutionaryForce, cloudEventSchema, utteranceFromCloudEvent, } from "./cloudevents.mjs";
export type { CloudEvent, CloudEventOptions, } from "./cloudevents.mjs";
export { DIDCOMM_CONTEXT, DIDCOMM_ENCRYPTED_TYP, DIDCOMM_JWM_ALG, DIDCOMM_JWM_ENC, DIDCOMM_PRIVATE_VISIBILITY, DID_CONTEXT, didcommMessageFromUtterance, didcommPlaintextMessageCarrier, didcommPlaintextMessageSchema, didcommSealedMessageCarrier, didcommSealedMessageSchema, didcommVisibility, openDIDCommMessage, openDIDCommUtterance, sealDIDCommMessage, sealDIDCommUtterance, utteranceFromDIDCommMessage, } from "./didcomm.mjs";
export type { DIDCommPlaintextMessage, DIDCommSealedMessage, SealDIDCommOptions, } from "./didcomm.mjs";
export { ACTIVITYPUB_C2S_CONTENT_TYPE, ACTIVITYSTREAMS_CONTEXT, DIDCOMM_PLAINTEXT_CONTENT_TYPE, acrossFaceProtocolMediaTypes, acrossFaceProtocolProjectors, activityPubC2sActivityCarrier, activityPubC2sActivitySchema, activityPubC2sProjector, cloudEventsProjector, didcommProjector, negateProtocolUtterance, protocolProjector, protocolTranslate, protocolWireProjector, readProtocolUtterances, socializingAcrossFaceLift, writeProtocolUtterances, } from "./protocol-translate.mjs";
export type { AcrossFaceProtocol, ActivityPubC2sActivity, ProtocolTranslateOptions, ProtocolUtteranceCarrier, SocializingAcrossFaceLift, } from "./protocol-translate.mjs";
/** Construct a speaker bound to a semiosphere. */
export declare const speaker: (name: string, within?: SemiosphereCarrier) => SpeakerCarrier;
/** Construct a listener bound to a semiosphere. */
export declare const listener: (name: string, within?: SemiosphereCarrier) => ListenerCarrier;
/** Open a channel: a directed relation between two semiospheres. */
export declare function openChannel(medium: string, from: SemiosphereCarrier, to: SemiosphereCarrier, capacity?: number | null): ChannelCarrier;
/** A channel for a speaker-to-listener pair, named for its medium. */
export declare const channelBetween: (medium: string, from: SpeakerCarrier, to: ListenerCarrier, capacity?: number | null) => ChannelCarrier;
/** Whether a channel admits a text without exceeding its capacity. */
export declare const withinCapacity: (channel: ChannelCarrier, text: string) => boolean;
/** Send a message: the speaker extends a content into a linear resource in transit. */
export declare function sendMessage(speakerOf: SpeakerCarrier, listenerOf: ListenerCarrier, channel: ChannelCarrier, text: string, bundle: CompiledBundle): MessageCarrier;
/** Receive a message: the listener restricts and consumes the in-transit resource. */
export declare function receiveMessage(message: MessageCarrier, bundle: CompiledBundle): UptakeCarrier;
/** The bilattice value name of a message's charge. */
export declare const messageChargeName: (message: MessageCarrier) => string;
//# sourceMappingURL=index.d.mts.map