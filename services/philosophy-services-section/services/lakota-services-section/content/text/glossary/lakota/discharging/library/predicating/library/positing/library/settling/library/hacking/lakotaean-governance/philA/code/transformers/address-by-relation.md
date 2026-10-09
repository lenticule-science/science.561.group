---
type: morphism
status: draft
depends-on:
  - speech-substrate
  - wolakhota-closure-system
  - tiyospaye
realizes: []
title: Address-by-relation
description: The substrate-mechanism by which speech-firings carry kin-cell updates.
---

# Address-by-relation

The substrate-mechanism by which speech-firings carry kin-cell updates.
Every well-formed speech-firing in $\mathcal{S}_\mathrm{wolak}$ includes a relational-address component $\rho_{a,b} \in R$ that fires the kin-cell substrate, not optionally but as a precondition of well-formedness.

## Substrate-content

For speech-firing $u : a \to b$, the address-component $\rho_{a,b}$ specifies the kin-relation under which the firing is routed.
The firing updates:

- $\langle a, b, \rho_{a,b}\rangle = \mathbf{t}$, at the wakȟáŋ-marking-level of the relation
- $\langle b, a, \rho_{b,a}^*\rangle = \mathbf{t}$, the reciprocal-relation cell

The reciprocal $\rho^*$ is generally distinct from $\rho$ — kin-relations are not symmetric in $\mathcal{S}_\mathrm{wolak}$.
Each pair $(\rho, \rho^*)$ is fixed by the substrate-specification (per closure-rule W3).

## Closure-rule W3 firing

Closure-rule W3 (kin-firing) fires whenever a speech-firing's $\rho$-component touches the kin-graph.
Per-utterance W3-firings are the substrate's primary kin-maintenance mechanism (parallel to [daily-recognition-firing](../../../philB/code/transformers/daily-recognition-firing.md) for office-maintenance).

The kin-graph is held intact by the cumulative W3-firings.
Absent W3-firings on a particular kin-pair $(a, b, \rho)$, the cell decays toward $\bot$ per the same natural-decay-2-cell governing recognition (cf. [recognition-maintained-by-continuous-firing](../theorems/recognition-maintained-by-continuous-firing.md)).

## Address-without-relation as substrate-malformation

A speech-firing missing $\rho_{a,b}$ is substrate-malformed (cf. [speech-substrate](../../../philB/code/structures/speech-substrate.md)).
Substantively: the colonial-substrate's address-modes (using personal names without relation, using titles like "Mr.", "sir", "tribal-member"), when fired into $\mathcal{S}_\mathrm{wolak}$, do not update kin-cells.
The substrate registers the firing but the W3-rule does not fire.

The structural consequence: extended colonial-substrate interaction without proper relational-address produces kin-graph decay, not as a moral failing but as substrate-arithmetic.
The kin-cells the firings would have renewed are not renewed.

## Choice of relation as substrate-firing

The substrate also permits $a$ to *choose* $\rho_{a,b}$ within a permissible-set, when more than one kin-route between $a$ and $b$ exists.
The choice fires:

- The chosen relation's cell at strengthened state
- Other-routes' cells at unchanged (not weakened)

This is the substrate-mechanism by which kin-relations are *cultivated* through speech-firing — the choice to address-by-grandfather rather than by-uncle (when both are routes) strengthens the grandfather-cell.
The substrate is not a static graph; it is a continuously-updated firing-state.

## Sources

- Ella Deloria, *Speaking of Indians* (1944) — address-by-relation as substrate.
- Walker 1982, *Lakota Society* — the relation-set $R$ recorded.
- DeMallie, "Kinship and Biology in Sioux Culture" (1994) — substrate-content of relational-address.
