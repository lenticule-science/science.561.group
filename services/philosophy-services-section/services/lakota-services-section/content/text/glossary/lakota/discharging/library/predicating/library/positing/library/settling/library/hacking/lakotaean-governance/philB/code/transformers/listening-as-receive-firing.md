---
type: morphism
status: draft
depends-on:
  - speech-substrate
  - silence-as-firing
realizes: []
---

# Listening-as-receive-firing

Listening is the receive-side of speech-firing.
In $\mathcal{S}_\mathrm{wolak}$, speech-cells fire *bilaterally*: speaker-firing produces an outgoing cell-update, and listener-firing produces the corresponding receive-side update.
The firing is *incomplete* until both sides have fired.

## Bilateral firing structure

For speech-firing $u : a \to b$:

- Speaker-side firing: $\langle a, \texttt{has-said}, \phi\rangle = \mathbf{t}$
- Receive-side firing: $\langle b, \texttt{has-received}, \phi\rangle = \mathbf{t}$

The bilateral completion is *not automatic*.
The receive-side requires $b$'s active listening-firing.
If $b$ does not perform the listening-firing, the receive-side cell remains at $\bot$; the speech-firing is incomplete; the polity-substrate-state does not register the update.

This is structurally distinct from the colonial-substrate's broadcast model, where speech is taken complete-on-utterance and "the message was sent" is sufficient for the cell to register.
In $\mathcal{S}_\mathrm{wolak}$, speech-into-vacuum doesn't update substrate.

## Receive-firing as substrate-work

Listening is a substrate-firing — a positive expenditure of receive-side capacity.
The polity's substrate-state at any moment depends on the *listening-density* across the populace, not only the speech-density.

Operationally: a polity where speech-firings are high but listening-firings are low has *low substrate-update-rate* despite high apparent communication.
The substrate fires speech-side cells; the receive-side cells remain $\bot$; the polity-substrate doesn't update.
This is the substrate-content of "talking past each other" — a real substrate-state, not a metaphor.

Conversely, a polity with high listening-density supports rich substrate-update from modest speech-density.
The substrate's update-rate is bounded below by the listening-density.

## Listening across silence-firings

Per [silence-as-firing](silence-as-firing.md), silence is itself a firing.
Listening on a silence-firing means *receiving* the silent-on-cell:

- Speaker-side: $\langle a, \texttt{silent-on}, \phi\rangle = \mathbf{t}$
- Receive-side: $\langle b, \texttt{has-received-silence-on}, \phi\rangle = \mathbf{t}$

This is what makes silence-propagation work substrate-arithmetically.
The silence-firing produces a propagating-cell; the receive-side listening-firing completes the propagation.

## Receive-side responsibility distribution

The substrate distributes responsibility for completion *bilaterally*.
Speaker-failures (mis-marking, missing relational-address) and listener-failures (not receiving, mis-receiving) are both substrate-failures of the speech-firing.

The structural consequence: in dispute-substrate (cf. [norm-conflict](teaching/explanations/norm-conflict.md)), "I told them but they didn't hear" is not a complete-firing report; the firing is incomplete; the substrate-state was not updated.
The speaker-side cannot offload completion-responsibility onto the listener-side without the substrate registering the incompleteness.

## Sources

- Ella Deloria, *Speaking of Indians* (1944) — listening as substrate.
- Tedlock, *The Spoken Word and the Work of Interpretation* (1983) — bilateral structure of speech-firing in oral substrates.
- Hymes, "Ethnography of Speaking" (1962) — substrate-context dependency of speech-firing completion.
