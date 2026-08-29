---
title: "Communication"
component-of: science
description: "The study of how meaning is encoded, transmitted, received, and acted on between agents — encompassing the Shannon/Wiener mathematical tradition, the linguistic and pragmatic tradition, and the social and rhetorical tradition."
see-also:
  - ../../humanities/theories/communication/_index.md
  - ../linguistics/theories/semiotics/_index.md
  - ./concepts/audience.md
  - ./concepts/channel.md
  - ./concepts/register.md
  - ./concepts/genre.md
  - ./concepts/pragmatics.md
---

# Communication

Communication theory studies how meaning moves between agents — what makes a transmission legible, what conventions a channel imposes on what can be said over it, what happens when sender and receiver hold different priors, what the *form* of a message contributes beyond its content.

Three live traditions sit under this heading:

1. **Mathematical / cybernetic.** Shannon's source-channel-receiver model, information-theoretic limits, error correction, feedback. Closely related to [information theory](../information/theories/information-theory/) and [cybernetics](../information/theories/cybernetics/); this corpus treats communication theory and information theory as cousins, not parent-child.
2. **Linguistic / pragmatic.** Speech acts, Gricean maxims, deixis, register, genre. Closely related to [linguistics](../linguistics/) and [semiotics](../linguistics/theories/semiotics/).
3. **Social / rhetorical.** Audience, ethos/pathos/logos, situated address, the rhetorical situation. Closely related to [rhetoric and composition](../../humanities/theories/writing/theories/rhetoric-and-composition/) under humanities.

## Relation to humanities/communication

The corpus also carries a sibling theory at [humanities/theories/communication/](../../humanities/theories/communication/_index.md) which develops a different axis: the McCloud / Andersen / Avigad / Macbeth closure-discipline framework — units, gaps, [accountable-closure](../../humanities/theories/communication/concepts/accountable-closure.md), [medium-specific-rigor](../../humanities/theories/communication/concepts/medium-specific-rigor.md), [transport](../../humanities/theories/communication/concepts/transport.md) across registers. That theory explicitly distinguishes itself from Shannon (see [communication-is-not-shannon](../../humanities/theories/communication/texts/communication-is-not-shannon.md)).

The two theories are not rivals; they cover different questions. The science-side theory carries the source-channel-receiver tradition (where this corpus's [audience](concepts/audience.md), [channel](concepts/channel.md), [register](concepts/register.md), [genre](concepts/genre.md), [pragmatics](concepts/pragmatics.md) anchors live). The humanities-side theory carries the closure-discipline anchors. Whether they should be unified into one theory, federated under a shared parent, or remain as parallel registers is an open captain-decisions question — see the [predicated-markdown-vault-knowledge-system curation-conformance audit](../information/theories/knowledge-systems/theories/markdown-vault-knowledge-system/theories/predicated-markdown-vault-knowledge-system/audits/curation-conformance-audit.md), section "Captain decisions required", row C-1.

## What this theory currently carries

- [`concepts/`](concepts/) — the load-bearing anchors the [predicated knowledge systems](../information/theories/knowledge-systems/theories/predicated-knowledge-systems/) and [markdown-vault knowledge system](../information/theories/knowledge-systems/theories/markdown-vault-knowledge-system/) families load on: [audience](concepts/audience.md), [channel](concepts/channel.md), [register](concepts/register.md), [genre](concepts/genre.md), [pragmatics](concepts/pragmatics.md).
- [`objects/`](objects/) — four formal models, one per tradition plus the pragmatic-substrate: [shannon-channel](objects/shannon-channel.md) (mathematical/cybernetic), [speech-act](objects/speech-act.md) (linguistic-pragmatic — the locutionary/illocutionary/perlocutionary triple of Austin and Searle), [rhetorical-situation](objects/rhetorical-situation.md) (social-rhetorical — Bitzer's exigence/audience/constraints triple), and [common-ground](objects/common-ground.md) (pragmatic substrate — Stalnaker's update model with Clark's elaboration). The three pragmatic/rhetorical objects are *complementary*: speech-act is the unit of action, common-ground is the substrate it operates against, rhetorical-situation is the external conditions that determine appropriateness.
- [`references/`](references/) — seven load-bearing references organised by tradition: [Shannon & Weaver 1949](references/shannon-weaver1949.md), [Grice 1975](references/grice1975.md), [Halliday 1985](references/halliday1985.md), [Austin 1962](references/austin1962.md), [Searle 1969](references/searle1969.md), [Clark 1996](references/clark1996.md), [Bitzer 1968](references/bitzer1968.md). Further references are listed in [`references/_index.md`](references/_index.md), gated on downstream load.
- [`questions/`](questions/) — the captain-decisions question [unify-or-federate-with-humanities-communication](questions/unify-or-federate-with-humanities-communication.md), lifted from the predicated-mvks audit's row C-1.

## Status

The science-side theory has lifted past minimum-viable: it now carries its load-bearing concepts (audience, channel, register, genre, pragmatics), four formal objects (one per tradition plus the pragmatic substrate), seven references, and one captain-tagged question. Downstream theories' `depends-on:` edges resolve to real content rather than to a stub.

The substantive *development* of each tradition (deeper theorems, more morphisms, the conversation-as-game and dialogue-act extensions) is still open. The theory does not pretend to settle the linguistic-pragmatic / social-rhetorical / mathematical-cybernetic split; instead it carries one canonical formal model from each and lets downstream theories pick which one they load on.

## Open work

- A `morphisms/` for the operations that move between the three traditions (the channel-as-discourse-context translation; the rhetorical-situation-to-channel reduction; the genre-as-register-bundle composition; the speech-act-on-common-ground update operation).
- A `theorems/` of any structural results the theory commits to (Shannon's coding theorems live in [information-theory](../information/theories/information-theory/), not here; this theory cites them transitively).
- Further objects: a *conversation-as-game* object from the dialogue-systems tradition (Lewis on signalling games), a *dialogue-act* object generalising [speech-act](objects/speech-act.md) to multi-turn structure, and a *topos-of-discourse* object from the argumentation-theory tradition. Listed at [`objects/_index.md`](objects/_index.md).
- Further references gated on downstream load: Bell 1984, Sperber & Wilson 1986, Stalnaker 1978, Vatz 1973, Lewis 1969. Listed at [`references/_index.md`](references/_index.md).
- Resolution of the [unify-or-federate question](questions/unify-or-federate-with-humanities-communication.md) (captain decision C-1).
