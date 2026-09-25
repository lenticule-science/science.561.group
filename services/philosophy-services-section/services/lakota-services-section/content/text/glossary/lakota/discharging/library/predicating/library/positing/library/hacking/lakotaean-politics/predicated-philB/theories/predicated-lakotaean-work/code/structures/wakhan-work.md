---
type: definition
class: work-class
status: draft
symbol: "\\Pi^{\\mathrm{wak\\check{h}\\acute{a}\\eta}\\text{-}\\mathrm{w}}"
depends-on:
  - work-cell-system
  - wicasa-wakhan-office
  - wakhan-as-cell-quality
  - seven-rites-as-witness-morphisms
realizes: [work-type-as-closure-structure]
title: Wakȟáŋ-work
description: Wakȟáŋ-work is the work-class whose cells fire on wakȟáŋ-bearing predicates — ceremonial labor, the labor of bundle-keeping, pipe-making, conducting rites, healing, vision-interpretation, name-giving.
---

# Wakȟáŋ-work

Wakȟáŋ-work is the work-class whose cells fire on wakȟáŋ-bearing predicates — ceremonial labor, the labor of bundle-keeping, pipe-making, conducting rites, healing, vision-interpretation, name-giving.
The class is *structurally distinguished* from other work-classes by:

1. All cells in the class are wakȟáŋ-marked by default ($w_\mathrm{lak}(\phi) = 1$).
2. The closure-rules firing on the class condition on $w_\mathrm{lak} = 1$ throughout — the wakȟáŋ-bearing-marking is load-bearing, not decorative.
3. Capability-cells for the class are installed only through apprenticeship under a wičháša wakȟáŋ (cf. [wicasa-wakhan-office](../../../../../../../settling/library/hacking/lakotaean-governance/philB/code/structures/wicasa-wakhan-office.md)) plus a wakȟáŋ-dream of the apprentice's own.

## Cells in the class

$\Pi^\mathrm{wakȟáŋ\text{-}w}$ contains the following predicates:

- *Conducts-rite-$R$* for each of the seven rites $R$ (see [seven-rites-as-witness-morphisms](../../../../../../../philosophy/theories/predicated-philosophy/theories/predicated-lakotaean-philosophy/morphisms/seven-rites-as-witness-morphisms.md)).
- *Makes-pipe*, *makes-bundle*, *makes-medicine* — ceremonial-artifact-making.
- *Keeps-bundle*, *keeps-pipe* — substrate-bearing.
- *Heals* — the healing-work of wičháša wakȟáŋ and wíŋyaŋ wakȟáŋ.
- *Interprets-vision* — vision-interpretation as work.
- *Names-child* — name-giving (often a wíŋkte-position role).
- *Witnesses-treaty*, *witnesses-marriage*, *witnesses-installation* — the witnessing-as-work.
- *Sings-sacred-song* — when conducted in ceremony, the singing is wakȟáŋ-work-cell-firing.

## Capability-installation

A capability-cell for wakȟáŋ-work fires only under specific conditions, parallel to (and a subset of) the [wičháša wakȟáŋ installation](../../../../../../../settling/library/hacking/lakotaean-governance/philB/code/structures/wicasa-wakhan-office.md) conditions:

$$\langle a, \texttt{apprenticed-to}, b\rangle \geq_k \mathbf{t} \;\wedge\; \langle b, \texttt{has-wakhan-w-capability-}p\rangle \geq_k \mathbf{t} \;\wedge\; \langle a, \texttt{received-wakhan-dream}, V\rangle \geq_k \mathbf{t} \;\wedge\; w_\mathrm{lak}(V) = 1 \;\Longrightarrow\; \langle a, \texttt{has-wakhan-w-capability-}p\rangle \geq_k \mathbf{t}$$

The capability is bound to specific wakȟáŋ-work predicates — not generic.
An agent can be capable for *makes-pipe* without being capable for *conducts-haŋbléčheyapi*; the dream and the apprenticeship-line constrain which specific predicates fire.

## Wakȟáŋ-work is non-CALM

Per the predicated-work [multi-agent-work-as-crdt](../../../../../../../../../../../../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/multi-agent-work-as-crdt.md) theorem, work-cells in the strict and Scott-continuous regimes are CRDT-mergeable: distributed replicas converge on the work-record without coordination.
Wakȟáŋ-work cells *do not* satisfy this: a wakȟáŋ-marked cell requires the wakȟáŋ-marking-witness to be present for the firing, and the witnessing is *not* freely replicable — the wakȟáŋ-witness must be physically and ceremonially present.

The substrate-content: wakȟáŋ-work is *coordination-required*.
The merging of distributed replicas where one replica claims wakȟáŋ-work-cell-firing without wakȟáŋ-witness produces $\bot$ at the relevant cells, not $\mathbf{t}$.
This is what protects the substrate's wakȟáŋ-marking discipline against unauthorized firing.

In multi-observer-system terms: wakȟáŋ-work cells in the merged settling require *all observers* to confirm wakȟáŋ-witness; the join becomes a meet on the wakȟáŋ-marking sub-condition.
This is the reverse of the standard $\leq_k$-join CRDT pattern — it is a *consensus-required* protocol on the wakȟáŋ-marking sub-class, even though the underlying cells are still $\leq_k$-monotone.

## Wakȟáŋ-work and the surveillance state

The reservation-period suppression of wakȟáŋ-work (the seven rites criminalized 1881–1934) operated by *removing the firing-condition* — making the wakȟáŋ-witness-present condition impossible by criminalizing the gathering.
The cells could not fire because the witnessing-cells could not fire.
The substrate's wakȟáŋ-work capability cells remained but the discharge-firing was blocked.

The substrate-restoration after 1978 (American Indian Religious Freedom Act) and especially after 1994 (Religious Freedom Restoration Act amendments) reopened the firing pathway.
The contemporary wakȟáŋ-work cells fire again at increasing scope.

## Sources

- Walker 1980, *Lakota Belief and Ritual* — wakȟáŋ-work and the wičháša wakȟáŋ apprenticeship.
- Brown, *The Sacred Pipe* (1953) — wakȟáŋ-work in each of the seven rites.
- Mark St. Pierre and Tilda Long Soldier, *Walking in the Sacred Manner* (1995) — contemporary wakȟáŋ-work, particularly women's wakȟáŋ-work practice.
- Powers, *Oglala Religion* (1977) — the structural role of wakȟáŋ-work in the polity.
- White Hat, *Life's Journey — Zuya* (2012) — contemporary Sicangu wakȟáŋ-work.
- Estes, *Our History is the Future* (2019) — wakȟáŋ-work suppression and restoration history.
