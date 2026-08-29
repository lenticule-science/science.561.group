---
title: "Discworld MUD Messaging Systems"
description: "Survey of Discworld MUD's layered communication architecture: say and tell commands as room-scoped and direct messaging; shout for distance communication; the talker system for out-of-character channels; and soul commands for social broadcasting. Maps Discworld's message-routing patterns onto the 561 messaging-foundations spec."
text-type: survey
date-created: 2026-04-06
domain: computing
see-also:
  - "../texts/lpmud-architecture-for-agentic-systems.md"
  - "../../../../texts/tech-messaging-systems-for-agentic-systems.md"
  - "../../../../science/theories/information/texts/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md"
  - "../../../../operations/engineering/fars/docs/specs/messaging-foundations.md"
---

The Discworld MUD implements a layered communication architecture running atop the FluffOS LPC driver. All messaging — whether room-scoped speech, distance communication, direct player-to-player tells, or out-of-character channels — routes through the same underlying object system. The architecture reflects four distinct message scopes, each implemented as a broadcast/delivery primitive in the Discworld mudlib, with the FluffOS driver providing the raw efuns: `say()`, `tell_object()`, `tell_room()`, and `message()`.

## Local Say: Room-Scoped Broadcasting

The **say** command broadcasts a message to all objects in the speaker's current room. In LPC terms, this is implemented via the `say()` efun:

```
say("Hello room");
```

The driver routes this to every object in the current room's inventory tree. The speaker does not need to specify who hears — the room IS the audience. Reception is automatic for anything contained in the same object.

This implements **M1** (every message belongs to a named channel with a declared schema) through implicit channel binding — the channel is the room itself. It satisfies **M4** (every message names its receivers) by naming the room's contents as receivers. The receiver set is spatial: determined by the environment tree at message-send time, not by explicit subscription lists.

**Key feature:** say is unreliable in one direction — the speaker chooses the message, but objects receiving it decide how to process it. A player's client receives say messages and displays them. An NPC object receives say messages via `catch_tell()` and can react (triggering combat, starting dialogue). The routing is symmetric — both players and NPCs hear the same say broadcast — but the decision to *act* on it is asymmetric.

## Distance Broadcasting: Shout

The **shout** command broadcasts to a larger area — multiple rooms at once. The exact distance varies by room placement and is typically configurable per-area. A shout in one room reaches adjacent rooms, sometimes rooms two or three steps away.

Shout implements **M1** and **M4** with a larger but still spatially-bounded receiver set. The channel is not a single room but a region. Reception is automatic for all objects within the broadcast radius, and like say, the message text is fixed while receiving objects decide independently how to handle it.

In Discworld's implementation, shout costs a resource (social points, which regenerate over time). This cost enforces **M6**-like semantics (delivery lifecycle tracking). A player who shouts too frequently is rate-limited. The resource constraint is the delivery policy — not all players can broadcast at all times.

## Direct Player-to-Player Messaging: Tell

The **tell** command sends a private message to a specific player, regardless of distance or location. It is out-of-character communication — tells do not appear in the room; only the sender and receiver see the exchange.

Implemented via `tell_object()`, a tell is:

```
tell_object(player_ob, "message text");
```

The key difference from say: the receiver is explicitly named. The message does NOT broadcast to the room; it routes to a specific player object across any distance. This satisfies **M4** (every message names its receivers) explicitly — the receiver is a parameter to the function.

Tell implements **M0** (every message has a traceable sender) — the message carries the sender's identity in the UI ("Sender tells you: ..."). In Discworld, tell has a social-point cost, implementing **M6** delivery-lifecycle accounting: the player can send at most N tells per time unit.

## The Talker System: Named Channels with Subscriptions

The **talker** is an in-game object that gives players access to multiple out-of-character channels. Rather than hard-coding channel support in the driver, Discworld implements channels as LPC objects. A player physically approaches a talker object and uses commands like:

```
talker channel one
talker channel two
talker channel wizards
talker talk message text
```

The talker system implements explicit channel subscription and named channels. The main channels are:

- **Channel One**: general chatter, available to all players
- **Channel Two**: singing and storytelling, available to all
- **Guild Channels**: named per guild (wizards, warriors, assassins), restricted to guild members
- **Club Channels**: player-created channels for clubs, with optional electoral governance
- **Newbie Channel**: restricted to players under 18 hours old, staffed by liaisons and helpers

Each channel is accessed through a talker object. The talker object maintains subscriber lists, message history, and routing rules. When a player posts to a channel, the talker broadcasts the message to all subscribers.

Talkers implement **M1** (named channels with declared schema) as explicit records. Each channel has a name, access rules, and subscriber list. They implement **M4** (receivers are named) through subscription — messages are delivered to all subscribers to the channel.

Talkers also implement **M2** (monotonic send-time and partial ordering) — messages within a channel are ordered by send-time. The talker maintains a log of messages per channel and can replay them on demand.

Critically, talkers satisfy **M3** (content-addressable payloads with duplicates distinguished by (time, sender)) implicitly — the same message text from the same sender posted twice at different times to the same channel are different messages, distinguished by their timestamps.

## Soul Commands: Emotes and Social Broadcasting

Beyond pure message-passing, Discworld implements **soul commands** — emotes and social actions that broadcast action descriptions to a room:

```
emote bows deeply
grin <target>
wave
```

Soul commands are semantically different from say: they are not spoken dialogue but observable actions. The mud broadcasts them via the same underlying `say()` or room-broadcast mechanism, but they carry different message classes (type: "emote" vs type: "say" in the FluffOS message-classification system).

This satisfies **M1** — emotes belong to a "soul" or "emote" channel, semantically distinct from speech. Message class routing allows receivers (players, NPCs) to filter: some players mute emotes, others display them prominently.

## Message Delivery at the FluffOS Level

Underneath all these higher-level systems, FluffOS provides the primitive `message()` efun, which routes messages through a class system:

```
message("say", "sender says: " + text);
message("tell", "sender tells you: " + text);
message("emote", "sender " + action);
```

The message class parameter (**M1** channel binding) allows flexible filtering. Player clients can subscribe to specific message classes. NPCs can implement `receive_message()` to handle different class-specific behavior.

## NPC Hearing: `catch_tell()` and Event Subscriptions

When an NPC receives a message (via say, tell, or emote), it does not receive a playable "tell" output. Instead, the NPC object's `catch_tell()` function is invoked with the message text. This allows NPCs to parse and react to speech.

For more sophisticated NPC behavior, Discworld implements an event system: NPCs can subscribe to event classes (`event_listen_say()`, `event_person_tell()`). When a say happens in a room, the NPC's event handler is called with the speaker and text. The NPC can then decide whether to respond, start combat, or ignore the message.

This implements **M4** (every message names its receivers) with asymmetry: a player's say is broadcast to all objects in the room, but which objects *care* is determined by their subscriptions. NPCs are not forced to hear everything — they can filter by listener pattern (e.g., a shopkeeper hears only customers, a guard hears only unauthorized intruders).

## Mapping to the Messaging-Foundations Spec

The Discworld messaging systems satisfy the core messaging invariants defined in the 561 system's `messaging-foundations.md` spec:

- **M0** (traceable sender): implemented throughout. Every message carries sender identity (players and NPCs know who said/told them).
- **M1** (named channels with schema): implemented. Rooms are implicit channels; talkers are explicit named channels; message classes (say, tell, emote, combat) provide schema.
- **M2** (monotonic send-time, partial ordering): implemented. Messages within a room are ordered by driver tick; talker messages are ordered by send-time.
- **M3** (content-addressable payload, distinguished by (time, sender)): implemented implicitly. The same text from the same speaker at different times are separate messages.
- **M4** (receivers are named): implemented. Rooms name their contents as receivers; tells name explicit recipients; talker subscriptions name subscribers; event subscriptions name interested NPCs.
- **M5** (witnesses are messages referencing certified message): not implemented in base Discworld. The system has no audit trail or witness system.
- **M6** (per-(message, receiver) delivery lifecycle): partially implemented. Talkers track who has read messages. Social-point costs implement delivery rate-limiting (a form of lifecycle state).
- **M7** (immutable messages; corrections are new messages): not explicitly implemented. Talker messages and room speech cannot be edited; a speaker who misspeaks must send a new message to correct.
- **M8** (messages reference other messages): not implemented. Discworld has no reply-to, refutes, or extends relations on messages.
- **M9** (message-log closed under channel schemas, all references resolve): not fully implemented. Talker channels have message history but no persistent cross-reference resolution.

## The Architectural Pattern: Objects as Channels

Discworld's messaging architecture exemplifies a deeper pattern: **all communication is object-to-object messaging using the same underlying mechanism, with scope and audience determined by the object structure and FluffOS driver support.**

- Say is `tell_room(environment)` — broadcast to all objects in a container.
- Tell is `tell_object(target)` — direct object invocation.
- Shout is `tell_room(environment + adjacent_rooms)` — broadcast to a larger set determined by spatial proximity.
- Talker posting is `tell_object(talker)` → talker broadcasts to `tell_object(subscriber)` for each subscriber — message routing delegated to an intermediary object.

This is not a coincidence. The LPC object model IS a message-passing architecture. Every efun call is a message; every object is an actor. The mudlib (Discworld) builds higher-level abstractions on top — channels, subscriptions, access control — but the substrate is unified messaging via object references.

## Connection to the 561 System

The captain's note in `operations/command/ideas/mud-chat-as-messaging.md` observes: "if you look at my mud code you can see how I use chat services to facilitate what other systems might do with a more internal messaging system, I don't see a need to unnecessarily internalize messaging, if we can treat it like standard knowledge being passed around."

Discworld's architecture supports this view. Talker channels are not magic — they are LPC objects with message lists. A channel is a query: "show me all messages to this channel ordered by time." A subscriber is a subscription record. The implementation is not a specialized message broker; it is the same object system used for rooms, items, and NPCs.

For the 561 system, this suggests:

1. **Channels are queries over the event log.** A channel like "bridge" is not a special system but a filtered view: "all events with audience: bridge ordered by timestamp."

2. **Subscribers are record types.** A subscription is a record: (subscriber: office, channel: pattern, filter: predicate). The TUI can display a channel by filtering events against all active subscriptions.

3. **Message scopes correspond to object containment.** A message's audience is determined by structural relations: parts of the same domain, members of the same office, subscribers to the same channel.

4. **The same broadcast mechanism handles all scopes.** Whether routing to a room's contents, a spatial radius, or all subscribers to a named channel, the operation is: apply message-delivery function to a computed receiver set.

## What Discworld Does Well

1. **Layered abstraction.** Say, tell, shout, and talkers are all built on the same primitives (`say()`, `tell_object()`, `tell_room()`). Each layer adds scope and delivery semantics without reinventing message-passing.

2. **Resource accounting.** Social points implement rate-limiting and delivery-state tracking. Players who talk too much are rate-limited; the system makes communication a metered resource.

3. **NPC integration.** Messages are not just for players. NPCs receive messages via `catch_tell()` and can subscribe to event classes. The same broadcasting mechanism works for NPC-to-player, player-to-NPC, and NPC-to-NPC communication.

4. **Spatial scoping.** Say and shout use room containment to determine audience. This is simple and natural — where you are determines what you hear (absent magical communication).

## Where the 561 System Can Improve

1. **Bilattice-valued messages.** Discworld's messages are strings. In the 561 system, following the adjoint paper, messages are fibers over a bilattice. A message itself carries confidence and certainty values. "The task is complete" vs "The task is probably complete" vs "The task may or may not be complete" are different messages in the type system, not post-hoc qualifiers.

2. **Explicit witness records.** Every message should carry references to witnesses — agents who saw, verified, or acted on the message. This traces accountability through delegation chains.

3. **Message references and causation.** Messages should carry relations: reply-to, refutes, extends, supersedes. This makes causation explicit in the event log and enables time-travel debugging.

4. **Immutability with correction chains.** Discworld messages cannot be edited. The 561 system should formalize this: messages are immutable; corrections are new messages. This produces an audit trail.

5. **Content-addressed message identity.** Discworld message IDs (if they exist) are probably sequential. The 561 system should use content-addressed IDs (CIDs, following IPFS): the same message content always has the same identity, enabling federation and deduplication across instances.

## Conclusion

Discworld MUD's messaging systems are not a metaphor for the 561 system — they are a production architecture solving the same problems. The mudlib implements multiple communication scopes (say, tell, shout, talker, emote) using a unified object-to-object messaging substrate. Every message is routed through the object system; every object can be a sender, receiver, or intermediary.

The pattern generalizes: make channels first-class query objects, make subscriptions first-class records, and route all communication through the event log. This is what Discworld does implicitly; the 561 system should do it explicitly, grounded in the bilattice-valued fiber algebra that distinguishes our approach from earlier MUD architectures.
