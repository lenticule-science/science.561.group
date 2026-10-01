---
type: definition
class: formal-model
status: settled
depends-on:
  - teaching/explanations/pragmatics.md
realizes:
  - teaching/explanations/pragmatics.md
see-also:
  - teaching/explanations/audience.md
  - teaching/explanations/register.md
  - speech-act.md
  - rhetorical-situation.md
name: Common ground
description: The common ground of a conversation is the accumulating set of propositions, presuppositions, and mutual beliefs that the participants take to be shared, and take each other to take to be shared, and so on.
---

# Common ground

The **common ground** of a conversation is the accumulating set of propositions, presuppositions, and mutual beliefs that the participants take to be shared, and take each other to take to be shared, and so on. The model is due to Robert Stalnaker (1978, "Assertion") in its semantic form and elaborated by Herbert Clark (1996, *Using Language*) into the canonical pragmatic-substrate model used across discourse pragmatics today.

## Definition

A **common ground** at conversation-state $t$ is a structure $\mathit{CG}_t = (P_t, B_t, M_t)$ where:

- $P_t$ is the **set of propositions** mutually believed by the participants at $t$ — the *information state* of the conversation.
- $B_t$ is the **basis structure**: each proposition $p \in P_t$ is annotated with the basis on which it entered the common ground (perceptual co-presence, prior shared discourse, community membership, joint cultural knowledge). Different bases license different inferences about reliability and revisability.
- $M_t$ is the **mutuality structure**: each $p \in P_t$ is mutually believed in the iterative sense — *all participants believe $p$, and all participants believe that all participants believe $p$, and so on indefinitely*. Mutuality is what distinguishes common ground from mere shared belief.

The common ground evolves over the conversation. An assertion that is not challenged increments $P_t$ by adding the asserted proposition (Stalnaker's update rule). A presupposition that is not challenged operates the same way. A challenge or denial removes a proposition (or refuses to add it). The conversation's *information history* is the trajectory $\mathit{CG}_0 \to \mathit{CG}_1 \to \ldots \to \mathit{CG}_n$.

## Stalnaker's update rule

Stalnaker's central technical contribution is the **assertion-as-update** rule: an assertion that $p$ is felicitous iff (i) $p$ is consistent with $\mathit{CG}_t$ (it does not contradict already-shared belief), (ii) $p$ is informative relative to $\mathit{CG}_t$ ($p$ is not already in $P_t$), and (iii) the speaker takes the hearer to be in a position to add $p$. If felicitous and unchallenged, the assertion's effect is $\mathit{CG}_{t+1} = \mathit{CG}_t \cup \{p\}$ — the assertion *grows* the common ground by one proposition.

Presupposition operates similarly but with a different felicity condition: a presupposed proposition is one the speaker takes to be *already in* $\mathit{CG}_t$. When a presupposition is *not* in $\mathit{CG}_t$ but the hearer accommodates (Lewis 1979), the proposition is *added* to $\mathit{CG}_t$ as if it had been there — accommodation is a repair mechanism that maintains the common ground's coherence under ordinary discourse.

## Clark's elaboration

Clark (1996) extends the Stalnakerian model with three additions critical for the model's empirical adequacy:

1. **Communal common ground vs. personal common ground.** Communal common ground is what members of a community share by virtue of community membership (linguists know what *deixis* means; American adults know who Lincoln was). Personal common ground is what specific interlocutors share by virtue of their joint history. The model tracks both layers.
2. **Grounding processes.** The mechanism by which propositions enter $P_t$ is itself a sub-conversation: speakers offer information, hearers acknowledge (verbally or nonverbally), speakers proceed only when grounding is achieved. Backchannel, repair, and confirmation requests are grounding moves.
3. **The principle of least collaborative effort.** Conversation is a joint activity in which both speaker and hearer minimise the *combined* work of grounding, not the speaker's effort alone. This explains many otherwise-mysterious patterns (referring expressions get shorter as common ground grows; speakers simplify when hearers struggle).

## Why this object load-bears

Common ground is the foundational formal model the [pragmatics](../concepts/pragmatics.md) concept's central machinery — implicature, presupposition, indirect speech acts, deixis, anaphora — runs on top of. Without it, [pragmatics](../concepts/pragmatics.md) describes its phenomena but has no co-located substrate-structure they operate against. With it, downstream theories can cite the structured update process when they need to formalise how communicative action *changes* what is shared.

The model also load-bears on [audience](../concepts/audience.md) (an audience's common ground with the speaker is constitutive of which discourses are intelligible) and on [register](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/communicating/content/communication/archive/code/structures/teaching/explanations/register.md) (registers are partly conventional defaults about what common ground to assume — formal registers assume a thinner shared base than casual registers).
