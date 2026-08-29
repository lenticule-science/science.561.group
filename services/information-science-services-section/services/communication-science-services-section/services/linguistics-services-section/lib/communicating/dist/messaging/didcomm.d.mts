import { type ChargeValueName, type FromSchema, type UtteranceCarrier } from "@red-cup-engineering/relating";
import type { IllocutionaryForce } from "../speaking/illocuting/index.mjs";
/** DIDComm v2 JSON-LD context, embedded literally so this codec adds no deps. */
export declare const DIDCOMM_CONTEXT: "https://didcomm.org/messaging/2.0";
/** DID Core context used by the DID endpoints the sealed message names. */
export declare const DID_CONTEXT: "https://www.w3.org/ns/did/v1";
/** JWM/JWE protected-header media type for encrypted DIDComm messages. */
export declare const DIDCOMM_ENCRYPTED_TYP: "application/didcomm-encrypted+json";
/** The JWM algorithms this dependency-free value layer realizes. */
export declare const DIDCOMM_JWM_ALG: "dir";
export declare const DIDCOMM_JWM_ENC: "A256GCM";
/** FOUR bottom on the knowledge/reach order: direct/private visibility. */
export declare const DIDCOMM_PRIVATE_VISIBILITY: ChargeValueName;
export declare const didcommPlaintextMessageSchema: {
    readonly $id: "communicating/messaging/didcomm/plaintext-message";
    readonly title: "DIDCommPlaintextMessage";
    readonly description: "A DIDComm v2 plaintext message: one communicating membrane utterance before sealing. `from` is the sender DID token, `body` is the plaintext claim, and `type` is the illocutionary force.";
    readonly type: "object";
    readonly required: readonly ["@context", "id", "type", "from", "to", "body"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly "@context": {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
            };
            readonly minItems: 2;
        };
        readonly id: {
            readonly type: "string";
        };
        readonly type: {
            readonly enum: readonly ["assertive", "directive", "commissive", "expressive", "declaration"];
        };
        readonly from: {
            readonly type: "string";
            readonly pattern: "^did:";
        };
        readonly to: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
                readonly pattern: "^did:";
            };
            readonly minItems: 1;
        };
        readonly body: {
            readonly type: "string";
        };
        readonly created_time: {
            readonly type: "integer";
        };
        readonly truth_charge: {
            readonly enum: readonly ["absurd", "potential", "active", "stable"];
        };
    };
};
export type DIDCommPlaintextMessage = FromSchema<typeof didcommPlaintextMessageSchema>;
export declare const didcommPlaintextMessageCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly type: "assertive" | "directive" | "commissive" | "expressive" | "declaration";
    readonly id: string;
    readonly to: readonly string[];
    readonly from: string;
    readonly "@context": readonly string[];
    readonly body: string;
    readonly created_time?: number;
    readonly truth_charge?: "potential" | "active" | "stable" | "absurd";
}>;
export declare const didcommSealedMessageSchema: {
    readonly $id: "communicating/messaging/didcomm/sealed-message";
    readonly title: "DIDCommSealedMessage";
    readonly description: "A DIDComm v2 encrypted JWM envelope. The ciphertext carries one plaintext DIDComm utterance and reads at private visibility (`absurd`, FOUR bottom) until decrypted.";
    readonly type: "object";
    readonly required: readonly ["protected", "recipients", "iv", "ciphertext", "tag"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly protected: {
            readonly type: "string";
        };
        readonly recipients: {
            readonly type: "array";
            readonly items: {
                readonly type: "object";
                readonly required: readonly ["header", "encrypted_key"];
                readonly additionalProperties: false;
                readonly properties: {
                    readonly header: {
                        readonly type: "object";
                        readonly required: readonly ["kid"];
                        readonly additionalProperties: false;
                        readonly properties: {
                            readonly kid: {
                                readonly type: "string";
                            };
                        };
                    };
                    readonly encrypted_key: {
                        readonly type: "string";
                    };
                };
            };
            readonly minItems: 1;
        };
        readonly iv: {
            readonly type: "string";
        };
        readonly ciphertext: {
            readonly type: "string";
        };
        readonly tag: {
            readonly type: "string";
        };
    };
};
export type DIDCommSealedMessage = FromSchema<typeof didcommSealedMessageSchema>;
export declare const didcommSealedMessageCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly tag: string;
    readonly protected: string;
    readonly recipients: readonly {
        readonly header: {
            readonly kid: string;
        };
        readonly encrypted_key: string;
    }[];
    readonly iv: string;
    readonly ciphertext: string;
}>;
export interface SealDIDCommOptions {
    readonly id?: string;
    readonly createdTime?: number;
    readonly truthCharge?: ChargeValueName;
    readonly keyId?: string;
    readonly iv?: Uint8Array;
}
/** Read a membrane utterance as a DIDComm plaintext message before encryption. */
export declare function didcommMessageFromUtterance(carrier: UtteranceCarrier, recipientDid: string, force: IllocutionaryForce, options?: Pick<SealDIDCommOptions, "id" | "createdTime" | "truthCharge">): DIDCommPlaintextMessage;
/** Read a DIDComm plaintext message back as its communicating membrane utterance. */
export declare function utteranceFromDIDCommMessage(message: DIDCommPlaintextMessage): UtteranceCarrier;
/**
 * sealDIDCommMessage — encrypt one plaintext DIDComm message as a JWM JSON
 * serialization. The message type is preserved exactly as the illocutionary force.
 */
export declare function sealDIDCommMessage(message: DIDCommPlaintextMessage, channelKey: string | Uint8Array, options?: SealDIDCommOptions): DIDCommSealedMessage;
/** Convenience bridge: utterance -> plaintext DIDComm -> sealed JWM. */
export declare function sealDIDCommUtterance(carrier: UtteranceCarrier, recipientDid: string, force: IllocutionaryForce, channelKey: string | Uint8Array, options?: SealDIDCommOptions): DIDCommSealedMessage;
/** Decrypt a sealed DIDComm JWM back to the plaintext message carrier. */
export declare function openDIDCommMessage(sealed: DIDCommSealedMessage, channelKey: string | Uint8Array): DIDCommPlaintextMessage;
/** Decrypt a sealed DIDComm JWM directly to its membrane utterance view. */
export declare function openDIDCommUtterance(sealed: DIDCommSealedMessage, channelKey: string | Uint8Array): UtteranceCarrier;
/** A sealed DIDComm message reads at private visibility: FOUR bottom on reach. */
export declare function didcommVisibility(_sealed: DIDCommSealedMessage): ChargeValueName;
//# sourceMappingURL=didcomm.d.mts.map