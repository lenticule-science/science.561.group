---
type: concept
class: communication
status: sketch
depends-on: [inbox, witness, fipa-acl2002, finin-et-al1994]
see-also: [outpost, dispatch, federation]
title: Speech-act as witnessed predication
description: "The platform's reformulation of the agent communication language tradition (KQML, FIPA-ACL): each speech-act becomes a substrate witness predication that records the act's having been performed, with the performative type carried as a…"
---

# Speech-act as witnessed predication

The platform's reformulation of the *agent communication language* tradition (KQML, FIPA-ACL): each speech-act becomes a substrate witness predication that records the act's having been performed, with the performative type carried as a typed predicate on the message entity.

The classical view (per [fipa-acl2002](../../agent/federation/fipa-acl2002/fipa-acl2002.md), [finin-et-al1994](../../agent/federation/finin-et-al1994/finin-et-al1994.md)): a communicative act between agents has a *performative* (`inform`, `request`, `propose`, ...) whose semantics is grounded in the sender's *mental state* — a `request` performative implies the sender intends the receiver to perform the requested action.
The semantics is mentalistic; a recipient that wants to verify the speech act's force has to reason about the sender's mental state from extra-message evidence.

The platform's reformulation: the substrate cannot inspect any agent's mental state, so it grounds speech-act semantics in *substrate content*.
Each performed speech-act produces a [witness](../../teaching/explanations/witness.md) predication on the message entity recording: the agent that performed the act, the act's type (the performative as a typed predicate), the message's content, the scope and conversation context, and the substrate state at the time of the act.
The witness is signable per [signature-binds-witness-to-identity](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/signature-binds-witness-to-identity.md), so cross-substrate federation can authenticate the speech-act's performer.

Three structural identifications:

- **Performative as typed predicate.** A FIPA `inform` becomes the substrate predicate `inform-act` with a typed range (subject: the performing agent; object: the message entity; the message's content as a separate predication).
  A FIPA `request` becomes `request-act`.
  The performative library becomes the substrate's vocabulary of speech-act predicates, with new performatives admittable through standard substrate-edit operations.
- **Speech-act semantics by substrate witness.** The semantics of "agent $A$ performed `request` of agent $B$ for action $\phi$" is: the substrate's event log contains a witness signed by $A$ with `request-act` predications relating $A$, $B$, and the message entity carrying $\phi$.
  Verification is a substrate traversal, not an appeal to mental states.
  Per [federation-trust-bilattice-graded](../../../theorems/federation-trust-bilattice-graded.md), trust in the speech-act's content is then a separate substrate composition between the speech-act witness and the trust fiber on the performing agent.
- **Speech-act effect as substrate predications.** The downstream effect of a speech-act — a `request` is expected to motivate the recipient to consider performing the action; an `inform` is expected to motivate the recipient to consider the asserted content — becomes substrate-content as well.
  The recipient's consideration is dispatch's reading the speech-act predications and ranking candidate response runbooks against them.
  There is no "internal recipient mental state" the substrate has to model; the consideration is the substrate's normal operator running over speech-act predications the same way it runs over any other predications.

The concept is *sketch* status: it names the relationship between the classical-MAS speech-act tradition and the substrate's witness discipline so the [upstream-classical-mas](../../upstream-classical-mas/upstream-classical-mas.md) narrative has an atomized referent.
The platform inherits the FIPA performative library (inform, request, propose, accept-proposal, refuse, query-if, query-ref, subscribe, ...) as a starting vocabulary; specialization to the platform's specific runbook catalog is left for the platform's downstream design.

The substrate-content reformulation gains over the classical view in two ways: (i) speech-act semantics is substrate-checkable rather than requiring extra-substrate mental-state attribution; (ii) speech-act provenance is built into the witness, with cross-substrate federation inheriting authentication directly from substrate signing rather than requiring a separate ACL transport-layer authentication protocol.
