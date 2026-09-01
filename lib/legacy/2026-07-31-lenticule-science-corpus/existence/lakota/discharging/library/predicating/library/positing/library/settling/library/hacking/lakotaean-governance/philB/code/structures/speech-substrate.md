---
type: object
status: draft
depends-on:
  - polity-cell-system
  - wolakhota-closure-system
realizes: []
---

# Speech-substrate

The structured firing-space of $\mathcal{S}_\mathrm{wolak}$-speech.
Every utterance in the polity is a substrate-firing on this space; the polity's continuous-mode operation is largely composed of speech-substrate firings.

## Structure

A well-formed speech-firing $u : a \to b$ populates the following components:

$$u = (a, b, \rho_{a,b}, \phi, w, \mathrm{recv})$$

- $a$: speaker-position (the firing-source agent)
- $b$: addressee-position (named or framework-positioned recipient)
- $\rho_{a,b} \in R$: relational-address component — the kin-relation under which the firing is routed
- $\phi$: content-cell — the substrate-claim being installed/updated
- $w \in \{0, 1\}$: wakȟáŋ-marking on $\phi$ (and on $u$ itself as an event-cell)
- $\mathrm{recv}$: receive-status — populated by listener-firing, not by speaker (cf. [listening-as-receive-firing](../morphisms/listening-as-receive-firing.md))

The speech-substrate is the pullback

$$\mathrm{Speech} = \mathrm{Agent} \times_{\mathcal{S}_\mathrm{wolak}} \mathrm{Agent} \times_{\mathcal{S}_\mathrm{wolak}} R \times_{\mathcal{S}_\mathrm{wolak}} \mathrm{Content}$$

with a section over the wakȟáŋ-marking-fibration.

## Malformed speech-firings

A speech-firing missing any component is *substrate-malformed*.
Substrate-malformed firings do not update polity-substrate-state correctly.
The most common malformation patterns:

- **Missing $\rho_{a,b}$**: addressing without relational-address.
  The kin-cell update (per closure-rule W3) does not fire.
  The substrate registers the firing but does not propagate it to kin-substrate.
  This is the form of speech-firing the colonial substrate routinely produces — and it produces routine substrate-malformations as a result.
- **Mis-marked $w$**: claiming wakȟáŋ-status on a non-wakȟáŋ cell, or denying wakȟáŋ-status on a wakȟáŋ-bearing cell.
  Per [wakȟáŋ-marking-conflict](teaching/explanations/norm-conflict.md), produces $\top$-cells.
- **Empty $\mathrm{recv}$**: speaking-into-vacuum.
  The firing remains incomplete; the polity-substrate-state does not update until listening-firing supplies $\mathrm{recv}$.

## Address-mode distinctions

The substrate distinguishes speech-firing modes by their factorization-pattern:

- **Direct first-second**: $a \to b$ unmediated.
  High-energy: fires hard on relational-cells.
  Used sparingly.
  Inappropriate for high wakȟáŋ-mark, high relational-tension, avoidance-relation pairs.
- **Third-person mediated**: $a$ speaks of $b$ in $b$'s presence to $c$.
  Standard mode for many speech-firings.
  Reduces direct-cell-energy expenditure; routes the substrate-update through $c$'s receive-firing and $b$'s overhearing-firing.
- **Through-intermediary**: $a$ speaks to $c$ who later carries the firing to $b$.
  Used in high-stakes / cross-tension situations.
  Allows substrate-time between firing and receive-completion.

These are not politeness gradations in a Western sense.
They are factorization-modes of the speech-firing morphism, each with distinct substrate-energy and substrate-pace profiles.

## Continuous-firing role

Speech-substrate firings are the polity's primary *recognition-maintenance* mechanism (cf. [daily-recognition-firing](../morphisms/daily-recognition-firing.md), [recognition-maintained-by-continuous-firing](../theorems/recognition-maintained-by-continuous-firing.md)).
Each utterance with proper relational-address performs ordinary substrate-renewal on kin-cells, office-cells, recognition-cells.
The substrate's *normal* state is one of continuous renewal through speech-firing density.

## Sources

- Ella Deloria, *Speaking of Indians* (1944) — speech-substrate as polity-substrate.
- Walker 1982, *Lakota Society* — recorded structure of speech-substrate.
- Powers, *Sacred Language* (1986) — wakȟáŋ-marking-conventions on speech.
