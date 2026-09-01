/**
 * messaging/protocol-translate - across-face wires as one utterance factor.
 *
 * ActivityPub C2S, CloudEvents, and DIDComm plaintext are projections of one
 * communicating boundary item: utterer token, illocutionary force, witness time,
 * truth charge, and claim. Protocol translation is therefore a projector
 * transcode through that carried item, not a mesh of per-pair adapters.
 */
import { canonical, carrierFrom, chargeValue, jsonResource, mark, negateValue, parseJson, utterance, valueOf, } from "@red-cup-engineering/relating";
import { define, restrict, transcode } from "@red-cup-engineering/relating/writing";
import { membraneMeme } from "../communicate/face.mjs";
import { CLOUDEVENTS_JSON_CONTENT_TYPE, cloudEventCarrier, cloudEventFromUtterance, utteranceFromCloudEvent, } from "./cloudevents.mjs";
import { didcommMessageFromUtterance, didcommPlaintextMessageCarrier, utteranceFromDIDCommMessage, } from "./didcomm.mjs";
export const ACTIVITYSTREAMS_CONTEXT = "https://www.w3.org/ns/activitystreams";
export const ACTIVITYPUB_C2S_CONTENT_TYPE = "application/activity+json";
export const DIDCOMM_PLAINTEXT_CONTENT_TYPE = "application/didcomm-plain+json";
export const socializingAcrossFaceLift = Object.freeze({
    package: "@red-cup-engineering/socializing",
    scale: "scale-2",
    wires: ["Matrix state-resolution", "ActivityPub S2S"],
    law: "same-projector-transcode-factor",
    status: "Roadmap",
});
const activityObjectSchema = {
    anyOf: [
        { type: "string" },
        {
            type: "object",
            additionalProperties: true,
            properties: {
                type: { type: "string" },
                content: { type: "string" },
                id: { type: "string" },
            },
        },
    ],
};
export const activityPubC2sActivitySchema = {
    $id: "communicating/messaging/activitypub-c2s/activity",
    title: "ActivityPubC2SActivity",
    description: "ActivityStreams C2S activity as one communicating across-face utterance wire projection.",
    type: "object",
    additionalProperties: false,
    required: ["@context", "type", "actor", "object"],
    properties: {
        "@context": { const: ACTIVITYSTREAMS_CONTEXT },
        id: { type: "string" },
        type: { type: "string" },
        actor: { type: "string" },
        object: activityObjectSchema,
        target: { type: "string" },
        to: { type: "array", items: { type: "string" } },
        cc: { type: "array", items: { type: "string" } },
        published: { type: "string" },
    },
};
export const activityPubC2sActivityCarrier = carrierFrom(activityPubC2sActivitySchema);
const NEGATING_ACTIVITY_TYPES = new Set(["Undo", "Delete", "Tombstone"]);
const NEGATION_MARK = "not ";
const NEGATION = /^\s*(?:not|no|never)\s+|^\s*[!-]\s*/i;
const AS2_PUBLIC = "https://www.w3.org/ns/activitystreams#Public";
const ILLOCUTION = Object.freeze({
    Create: "assertive",
    Note: "assertive",
    Article: "assertive",
    Update: "assertive",
    Announce: "assertive",
    Follow: "directive",
    Question: "directive",
    Offer: "directive",
    Invite: "directive",
    Invoke: "directive",
    Accept: "commissive",
    TentativeAccept: "commissive",
    Reject: "commissive",
    TentativeReject: "commissive",
    Like: "expressive",
    Dislike: "expressive",
    View: "expressive",
    Listen: "expressive",
    Read: "expressive",
    Undo: "declaration",
    Delete: "declaration",
    Tombstone: "declaration",
    Block: "declaration",
    Add: "declaration",
    Remove: "declaration",
    Move: "declaration",
    Flag: "declaration",
});
function parseRecord(content, context) {
    const parsed = parseJson(content);
    if (parsed === null || typeof parsed !== "object" || Array.isArray(parsed)) {
        throw new TypeError(`${context}: expected a JSON object`);
    }
    return parsed;
}
function recognizes(resource, assert) {
    try {
        assert(parseRecord(resource.content, "protocol projector recognize"));
        return true;
    }
    catch {
        return false;
    }
}
function claimOf(object) {
    if (typeof object === "string")
        return object;
    return String(object.content ?? object.id ?? "");
}
function bareClaim(claim) {
    const text = typeof claim === "string" ? claim.trim() : String(claim);
    return text.replace(NEGATION, "").trim() || text;
}
function isDeniedClaim(claim) {
    const text = typeof claim === "string" ? claim.trim() : String(claim);
    return text === "false" || NEGATION.test(text);
}
function defaultFollowers(actor) {
    return actor.endsWith("/") ? `${actor}followers` : `${actor}/followers`;
}
function activityAudience(charge, actor) {
    const followers = defaultFollowers(actor);
    switch (charge) {
        case "stable":
            return { to: [AS2_PUBLIC], cc: [followers] };
        case "potential":
            return { to: [followers] };
        case "active":
            return { cc: [followers] };
        case "absurd":
        default:
            return { to: [] };
    }
}
function activityTruthCharge(activity, fallback) {
    const followers = defaultFollowers(activity.actor);
    const to = activity.to ?? [];
    const cc = activity.cc ?? [];
    if (to.includes(AS2_PUBLIC))
        return "stable";
    if (to.includes(followers))
        return "potential";
    if (cc.includes(followers))
        return "active";
    if ("to" in activity || "cc" in activity)
        return "absurd";
    return valueOf(membraneMeme(fallback).charge).name;
}
function utteranceFromActivityPubC2s(activity) {
    const base = bareClaim(claimOf(activity.object));
    const claim = NEGATING_ACTIVITY_TYPES.has(activity.type) ? `${NEGATION_MARK}${base}` : base;
    return utterance(mark(activity.actor), mark(claim));
}
function activityForce(activity) {
    return ILLOCUTION[activity.type] ?? null;
}
function protocolCarrier(protocol, utteranceCarrier, force, time, truthCharge, recipient = null) {
    return Object.freeze({
        kind: "communicating.messaging.protocol-utterance",
        protocol,
        utterance: utteranceCarrier,
        force,
        time,
        truthCharge,
        recipient,
    });
}
function writeOne(items, target) {
    if (items.length !== 1)
        throw new TypeError(`${target}: expected exactly one protocol utterance`);
    return items[0];
}
function serialize(value, context) {
    return `${canonical(jsonResource(value, context))}\n`;
}
function requireForce(item, target) {
    if (item.force === null) {
        throw new TypeError(`${target}: cannot fabricate illocutionary force missing from the source wire`);
    }
    return item.force;
}
function requireTime(item, target) {
    if (item.time === null) {
        throw new TypeError(`${target}: cannot fabricate witness time missing from the source wire`);
    }
    return item.time;
}
function negateClaim(claim) {
    const text = typeof claim === "string" ? claim.trim() : String(claim);
    return isDeniedClaim(text) ? bareClaim(text) : `${NEGATION_MARK}${bareClaim(text)}`;
}
export function negateProtocolUtterance(item) {
    const nextClaim = negateClaim(item.utterance.claim.mark.value);
    const nextDenied = isDeniedClaim(nextClaim);
    const nextForce = nextDenied ? "declaration" : item.force === "declaration" ? "assertive" : item.force;
    return protocolCarrier(item.protocol, utterance(mark(item.utterance.token.mark.value), mark(nextClaim)), nextForce, item.time, negateValue(chargeValue(item.truthCharge)).name, item.recipient);
}
export const protocolWireProjector = define({
    type: "communicating.protocol-wire",
    corner: "assertion",
    rung: "identity",
    recognize: (resource) => {
        try {
            parseRecord(resource.content, "communicating.protocol-wire");
            return true;
        }
        catch {
            return false;
        }
    },
});
export const activityPubC2sProjector = restrict(protocolWireProjector, {
    type: "activitypub-c2s",
    corner: "assertion",
    rung: "identity",
    recognize: (resource) => recognizes(resource, (value) => activityPubC2sActivityCarrier.assert(value)),
    read: (resource) => {
        const activity = activityPubC2sActivityCarrier.assert(parseRecord(resource.content, "activitypub-c2s read"));
        const readUtterance = utteranceFromActivityPubC2s(activity);
        return [protocolCarrier("activitypub-c2s", readUtterance, activityForce(activity), activity.published ?? null, activityTruthCharge(activity, readUtterance))];
    },
    write: (items) => {
        const item = writeOne(items, "activitypub-c2s write");
        const actor = String(item.utterance.token.mark.value);
        const rawClaim = String(item.utterance.claim.mark.value);
        const denied = isDeniedClaim(rawClaim);
        const activity = {
            "@context": ACTIVITYSTREAMS_CONTEXT,
            type: denied ? "Undo" : "Create",
            actor,
            object: { type: denied ? "Tombstone" : "Note", content: bareClaim(rawClaim) },
            ...(item.time === null ? {} : { published: item.time }),
            ...activityAudience(item.truthCharge, actor),
        };
        return serialize(activity, "activitypub-c2s write");
    },
});
export const cloudEventsProjector = restrict(protocolWireProjector, {
    type: "cloudevents",
    corner: "assertion",
    rung: "identity",
    recognize: (resource) => recognizes(resource, (value) => cloudEventCarrier.assert(value)),
    read: (resource) => {
        const event = cloudEventCarrier.assert(parseRecord(resource.content, "cloudevents read"));
        const readUtterance = utteranceFromCloudEvent(event);
        return [protocolCarrier("cloudevents", readUtterance, event.type, event.time, event.emsenntruthcharge ?? valueOf(membraneMeme(readUtterance).charge).name)];
    },
    write: (items) => {
        const item = writeOne(items, "cloudevents write");
        const event = cloudEventFromUtterance(item.utterance, requireForce(item, "cloudevents write"), requireTime(item, "cloudevents write"), {
            truthCharge: item.truthCharge,
        });
        return serialize(event, "cloudevents write");
    },
});
export const didcommProjector = restrict(protocolWireProjector, {
    type: "didcomm",
    corner: "assertion",
    rung: "identity",
    recognize: (resource) => recognizes(resource, (value) => didcommPlaintextMessageCarrier.assert(value)),
    read: (resource) => {
        const message = didcommPlaintextMessageCarrier.assert(parseRecord(resource.content, "didcomm read"));
        const readUtterance = utteranceFromDIDCommMessage(message);
        return [protocolCarrier("didcomm", readUtterance, message.type, message.created_time === undefined ? null : new Date(message.created_time * 1000).toISOString(), message.truth_charge ?? valueOf(membraneMeme(readUtterance).charge).name, message.to[0] ?? null)];
    },
    write: (items) => {
        const item = writeOne(items, "didcomm write");
        if (item.recipient === null)
            throw new TypeError("didcomm write: cannot fabricate recipient DID missing from the source wire");
        const time = item.time === null ? undefined : Date.parse(item.time);
        const message = didcommMessageFromUtterance(item.utterance, item.recipient, requireForce(item, "didcomm write"), {
            truthCharge: item.truthCharge,
            ...(time === undefined || Number.isNaN(time) ? {} : { createdTime: Math.floor(time / 1000) }),
        });
        return serialize(message, "didcomm write");
    },
});
export const acrossFaceProtocolProjectors = Object.freeze({
    "activitypub-c2s": activityPubC2sProjector,
    cloudevents: cloudEventsProjector,
    didcomm: didcommProjector,
});
export const acrossFaceProtocolMediaTypes = Object.freeze({
    "activitypub-c2s": ACTIVITYPUB_C2S_CONTENT_TYPE,
    cloudevents: CLOUDEVENTS_JSON_CONTENT_TYPE,
    didcomm: DIDCOMM_PLAINTEXT_CONTENT_TYPE,
});
export function protocolProjector(protocol) {
    return acrossFaceProtocolProjectors[protocol];
}
export function readProtocolUtterances(protocol, content, path = `${protocol}.json`) {
    return protocolProjector(protocol).read({ path, content });
}
export function writeProtocolUtterances(protocol, items) {
    return protocolProjector(protocol).write(items);
}
export function protocolTranslate(from, to, content, options = {}) {
    return transcode(protocolProjector(from), protocolProjector(to), {
        path: options.path ?? `${from}.json`,
        content,
    });
}
//# sourceMappingURL=protocol-translate.mjs.map