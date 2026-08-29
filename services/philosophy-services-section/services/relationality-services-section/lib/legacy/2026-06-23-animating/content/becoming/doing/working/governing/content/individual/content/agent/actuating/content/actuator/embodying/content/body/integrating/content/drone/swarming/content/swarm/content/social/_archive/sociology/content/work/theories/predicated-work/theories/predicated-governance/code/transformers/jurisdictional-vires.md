---
type: morphism
status: sketch
depends-on: [jurisdiction, authority, jural-relation, operations-settling]
realizes: [jurisdictional-vires]
see-also: [jurisdictional-excess, jurisdictional-invocation, jurisdiction-as-base-change]
---

# Jurisdictional vires (intra vires)

An act is **intra vires** (within jurisdiction) iff the authority's nucleus is operative on it — the validity-condition cell is at $\mathbf{t}$ and the act propagates through the normative system.

## Definition

An act $\alpha$ by authority $A$ at $(t, a)$ is **intra vires** iff:

$$v(\langle (t, a), \texttt{within-jurisdiction-of}, A\rangle) = \mathbf{t}$$

at the time of the act.
Equivalently: $A$'s nucleus $\sigma^A_t$ is operative on acts at $(t, a)$; the act fires the normative closure rules that make it binding on subjects within $\mathcal{J}$'s scope.

## The vires morphism

The vires morphism is the composite that certifies an act's jurisdictional validity:

$$\mathrm{vires}(\alpha) : \alpha \;\to\; \langle \alpha, \texttt{intra-vires}\rangle = \mathbf{t}$$

This fires when the validity-condition antecedent is satisfied.
It is the complement of [jurisdictional-excess](jurisdictional-excess.md): the same closure rule fires in two branches — if the validity-condition is at $\mathbf{t}$, the intra-vires cell settles; if not, the ultra-vires cell settles.

## Propagation effect

An intra-vires act propagates through the normative closure rules: the authority's directions create duties within $\mathcal{J}$'s scope, because the closing rules with validity-condition antecedent fire and produce normative consequents.
The act lands in $H^{*A}_t$ — in the portion of the operations settling the normative system propagates.

## Vires certification as audit evidence

The intra-vires cell $\langle \alpha, \texttt{intra-vires}\rangle = \mathbf{t}$ is knowledge-order evidence that the act was taken within jurisdiction.
By [settling-monotonicity](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), this cell is not retracted; it remains as audit evidence.
An audit of $A$'s exercise of jurisdiction reads these cells: intra-vires cells accumulate for valid exercises; ultra-vires cells accumulate for exceeded jurisdiction.
The audit's completeness is the [audit-as-cech-resolution-of-operations-settling](../../../theorems/audit-as-cech-resolution-of-operations-settling.md) condition applied to the jurisdictional sub-settling.

## Relation to charter compliance

An officer's intra-vires acts are precisely those that the charter's authority-granting rules authorize.
[Charter-as-closure-system](../theorems/charter-as-closure-system.md) establishes that the charter's rules determine which operations are normatively valid.
Vires is the proposition-level certification that a specific act instance falls within the charter's authorization: the validity-condition cell being at $\mathbf{t}$ is the condition the charter's authority-granting closure rules enforce.
