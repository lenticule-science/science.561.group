---
type: morphism
status: draft
depends-on:
  - speech-substrate
  - naca-office
  - wakichunza-office
  - office-as-double-settlement
realizes: []
title: Daily-recognition-firing
description: Every ordinary substrate-firing that addresses, references, or routes-through an office-holder qua office-holder is a daily-recognition-firing on the office.
---

# Daily-recognition-firing

Every ordinary substrate-firing that addresses, references, or routes-through an office-holder *qua* office-holder is a daily-recognition-firing on the office.
The bigraded common-knowledge structure on offices (cf. [recognition-as-bigraded-common-knowledge](../theorems/recognition-as-bigraded-common-knowledge.md)) is *not* installed-once-and-stable; it is renewed continuously through these firings.

## Substrate-content

For office-holder $a$ in office $O$, a daily-recognition-firing by agent $b$ takes the form of an ordinary speech-firing $u : b \to c$ (often with $c \ne a$, third-person-mediated; cf. [indirect-address](indirect-address.md)) whose content-cell references $a$-as-$O$.
The firing updates:

- $\langle b, \texttt{recognizes-as-}O, a\rangle = \mathbf{t}$ (truth-axis renewal)
- $\langle b, \texttt{knows-that-others-recognize-}a\texttt{-as-}O\rangle$ at full knowledge-axis value (knowledge-axis renewal)
- The reciprocal cells on $c$'s side when $c$ receives the firing

The cumulative effect across many such firings per day, distributed across the populace, is *both* $C^t \langle a\text{-as-}O\rangle$ and $C^k \langle a\text{-as-}O\rangle$ being held at their fixed-point values.

## Decay-without-firing

In absence of recognition-firings, the bigraded structure decays.
Substrate-form: $C^t$ and $C^k$ have a half-life.
Per-agent recognition-cells drift toward $\bot$ under the substrate's natural-decay-2-cell unless renewed.
The half-life is part of the substrate-specification — it is neither zero (recognition is not instantaneous) nor infinite (recognition is not permanent storage).

Operationally: an office-holder who goes un-addressed, un-referenced, un-routed-through for a long-enough substrate-window approaches a substrate-state where the office-cell is no longer at common-knowledge-$\mathbf{t}$.
The substrate has effectively withdrawn recognition without any explicit withdrawal-firing.

This is the substrate-mechanism behind quiet office-decay: an office can lapse without anyone deciding to lapse it, simply by the firing-density falling below the renewal-threshold.

## Contrast with certificate-substrate

The Western office-substrate uses certificate-storage: the office is held-recognized by a stored record (certificate, register, employment-roll).
Office-recognition decay-rate is zero in absence of explicit revocation-firings.
The substrate-mechanism is *event-driven*: between certificate-issuance and certificate-revocation, the office is held-recognized regardless of firing-activity.

In $\mathcal{S}_\mathrm{wolak}$, no certificate-substrate exists.
Recognition is *the firing-density itself*.
The two substrate-mechanisms produce structurally different decay-profiles and structurally different vulnerabilities.
The Lakota substrate is robust against certificate-attacks (forged certificates don't update firing-density) but vulnerable to firing-suppression (broad cultural suppression of speech-substrate degrades office-recognition substrate-wide).

## Sources

- [recognition-as-bigraded-common-knowledge](../theorems/recognition-as-bigraded-common-knowledge.md) — the underlying bigraded structure.
- [recognition-maintained-by-continuous-firing](../theorems/recognition-maintained-by-continuous-firing.md) — the decay result.
- Walker 1982, *Lakota Society* — recorded recognition-firing patterns.
