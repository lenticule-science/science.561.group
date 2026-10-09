---
type: morphism
status: draft
depends-on:
  - speech-substrate
  - wolakhota-closure-system
  - iyuha-sni-withdrawal
realizes: []
title: Silence-as-firing
description: Silence in $\mathcal{S}\mathrm{wolak}$ is a positive firing-state, not absence.
---

# Silence-as-firing

Silence in $\mathcal{S}_\mathrm{wolak}$ is a positive firing-state, not absence.
The substrate carries an explicit cell $\langle a, \texttt{silent-on}, \phi\rangle = \mathbf{t}$ that propagates through the substrate's listening-firing mechanism (cf. [listening-as-receive-firing](listening-as-receive-firing.md)).
Silence-firings update polity-substrate-state.

## Distinction from $\bot$

Silence is *not* $\langle a, \phi\rangle = \bot$ (unsettled / no-information).
The bottom-state $\bot$ records *no firing has occurred*.
The silent-on-cell records *firing of not-speaking*.
Substrate-arithmetic distinguishes them:

- $\bot$-cells decay normally under natural-decay; they do not propagate.
- Silent-on-cells *propagate* through receive-firings, updating other agents' substrate-state.

The colonial-substrate's "absence-of-speech = no-information" reading conflates these.
When $\mathcal{S}_\mathrm{wolak}$-silence-firings are read under colonial-substrate's interpretation, the propagation-component is lost; the silence-substrate-content is misread as absence.

## Silence-firing classes

The substrate distinguishes silence-firings by their wakȟáŋ-marking and intent-class:

**Deliberative silence** — $\langle a, \texttt{not-yet-ready-to-fire}, \phi\rangle = \mathbf{t}$.
The substrate is processing; no premature output.
Common in omníčiye-deliberation: the silence between contributions is itself substrate-content, signaling the per-participant substrate is still computing toward an output-firing.

**Refusal-silence** — $\langle a, \texttt{withdrawing-from-firing}, \phi\rangle = \mathbf{t}$.
Substrate-allied with [iyúhá-šni](../../../philA/code/transformers/iyuha-sni-withdrawal.md) at utterance scope.
Distinct from broader iyúhá-šni in that refusal-silence is scope-bounded to a single firing-occasion.

**Wakȟáŋ-respecting silence** — $\langle a, \texttt{not-to-be-spoken}, \phi\rangle = \mathbf{t}$ when $w(\phi)$ requires silence on the cell-content.
Some cells are wakȟáŋ-marked in a way that requires the substrate-firing of silence rather than speech.
Speaking the cell-content would fire malformed; the proper firing is the silence.

**Bearing-witness silence** — $\langle a, \texttt{present-and-receiving}, \phi\rangle = \mathbf{t}$, present and attentive without speaking.
Fires receive-side cells supporting the speaker's firing.
The polity's listening-density (per [listening-as-receive-firing](listening-as-receive-firing.md)) is largely composed of bearing-witness-silence-firings.

The four classes are not interchangeable.
A receiver who reads deliberative-silence as refusal-silence misreads the substrate; a receiver who reads bearing-witness-silence as deliberative-silence likewise misreads.
The substrate carries enough context to distinguish them (wakȟáŋ-marking, prior-firing-history, body-substrate cues), but the distinguishing data is not in the linguistic-channel alone.

## Sources

- Basso, "To Give Up On Words: Silence in Western Apache Culture" (1970) — though Apache, the substrate-content of silence-as-firing parallels.
- Ella Deloria, *Speaking of Indians* (1944) — silence as substrate-content in $\mathcal{S}_\mathrm{wolak}$.
- Walker 1982, *Lakota Belief and Ritual* — wakȟáŋ-respecting silence.
