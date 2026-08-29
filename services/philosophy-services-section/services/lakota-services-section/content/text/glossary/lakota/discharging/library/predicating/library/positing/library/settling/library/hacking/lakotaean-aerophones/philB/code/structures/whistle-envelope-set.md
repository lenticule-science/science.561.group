# whistle-envelope-set

The named set of timbral envelope archetypes used by the [eagle-wing-bone-whistle](../prose/teaching/explanations/eagle-wing-bone-whistle.md) and related single-pitch Lakotaean aerophones.

## Definition

A **whistle-envelope-set** is a named indexed set

Env = { (name, attack, sustain, decay) | name ∈ Names }

where each envelope archetype is identified by a name, has a definite attack specification (sharp or rolled), a definite sustain specification (short, long, or pulsed), and a definite decay specification (clean cutoff, fade, or [warble](../prose/teaching/explanations/warble.md)-decay).

The standard whistle-envelope-set Env_std:

| Name | Attack | Sustain | Decay | Typical duration | Principal use |
|---|---|---|---|---|---|
| sharp-attack-short-sustain | sharp | short (< 0.5 s) | clean cutoff | 0.2–0.5 s | alert call, accent |
| sharp-attack-long-sustain-warble-decay | sharp | long (1–3+ s) | [warble](../prose/teaching/explanations/warble.md) decay | 1.5–4 s | signal, structural highlight |
| rolled-attack-long-sustain | rolled (gradual onset) | long (1–3+ s) | clean fade | 1.5–4 s | ceremonial entry |
| pulsed-sustain | sharp (typically) | long, articulated by [breath-pulses](../prose/teaching/explanations/breath-pulse.md) | clean cutoff or fade | 1–4 s | rhythmic-textural, [heterophonic](../prose/teaching/explanations/heterophony.md) interaction with [drum](../prose/teaching/explanations/drum.md) |

Each envelope archetype is applied to the whistle's fixed [fundamental](../prose/teaching/explanations/fundamental.md), giving a complete whistle articulation event.
A *whistle event* is thus an instantiation of an envelope-archetype at a specific time, with the envelope's parameters (duration, attack/decay shape) potentially adjusted within the archetype's range.

## Properties

- **Finite**: The conventional whistle-envelope-set has exactly four entries.
- **Attack-Sustain-Decay decomposition**: Each envelope decomposes into three time-segments (attack, sustain, decay), each of which has limited parameter variation within the archetype.
- **Mutually distinguishable**: The four envelopes are perceptually distinct — a knowledgeable listener can identify which envelope a given whistle event instantiates.
- **Composable with rhythmic figures**: Whistle envelopes combine with [whistle-rhythm-figure-set](./whistle-rhythm-figure-set.md) entries to form whistle "tunes" — sequences of envelope-instantiations arranged in rhythmic figures.
- **Single-pitch invariance**: All envelopes apply to the whistle's single [fundamental](../prose/teaching/explanations/fundamental.md); the envelope-set captures the timbral-temporal music-theoretic content of a single-pitch instrument.

## Source claim

[whistle-envelope-grammar](../prose/learning/claims/whistle-envelope-grammar.md).

## Specification

[whistle-envelope-set.spec](../work/governance/rules/specifications/whistle-envelope-set.spec.md).
