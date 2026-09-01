---
type: concept
status: draft
depends-on:
  - wolakhota-closure-system
  - kin-relation-as-primitive
  - modal-necessity-operator
  - modal-possibility-operator
realizes: [deontic-modality]
---

# Deontic modality (Lakota form)

The Lakota polity's deontic structure runs on $\Box$/$\Diamond$ modal operators interpreted over a *kin-and-virtue accessibility relation*.
The substantive structure: *all* kin-of an agent are owed wówačhantognaka (the $\Box$ universal-over-kin-paths reading); *there exists* a coup-path through a zuya by which honor-cells fire (the $\Diamond$ existential reading on engagement-paths).
Where Western deontic-modality runs $\Box/\Diamond$ over deontic-state-spaces (obligation/permission), Lakota deontic-modality runs them over *kin-graph paths* and *engagement-paths*.

## The kin-graph as accessibility relation

The kin-relation cells in $\Pi^\mathrm{kin}$ form a graph on the populace $E^\mathrm{hum}_\mathrm{lak}$.
The graph's *transitive closure* (via (W1) of $\mathcal{S}_\mathrm{wolak}$) makes it the kin-accessibility-relation $R^\mathrm{kin}$:

$$R^\mathrm{kin}(a, b) \iff \mathrm{there\ exists\ a\ kin\text{-}path\ from\ } a \text{ to } b$$

In a stable Plains-era polity, the kin-accessibility-relation is *near-complete* on the populace within a several-generations radius: within an oyate, almost every pair of members is kin-connected via descent, marriage, or huŋkápi.
The kin-accessibility is dense.

## The $\Box$ operator: owes-to-all-kin

For a virtue $\nu$ and a payload "agent $a$ owes $\nu$ to $b$":

$$\Box_{R^\mathrm{kin}} (\texttt{owes-}\nu\texttt{-to})(a) = \mathbf{t}$$

iff for every $b$ accessible-from-$a$ in $R^\mathrm{kin}$, $\langle a, \texttt{owes-}\nu\texttt{-to}, b\rangle = \mathbf{t}$.

By (W3) of $\mathcal{S}_\mathrm{wolak}$, this is automatic: every kin-of-$a$ has the owes-cell installed.
The $\Box$-operator evaluates to $\mathbf{t}$ trivially on $\nu \in V_4$ for $a$ at any time.
This is the substrate-content of "you owe all your relatives the virtues."

## The $\Diamond$ operator: there-exists-an-engagement

For a coup-honor cell, an *engagement-accessibility-relation* $R^\mathrm{eng}$ connects times $\tau$ to coup-opportunities in current zuya:

$$R^\mathrm{eng}(\tau, c) \iff \mathrm{at\ time}\ \tau,\ \mathrm{coup\text{-}opportunity}\ c\ \mathrm{is\ available\ to\ } a$$

The possibility-operator:

$$\Diamond_{R^\mathrm{eng}} (\texttt{coup-on-grade-1})(a) = \mathbf{t}$$

iff there exists an accessible coup-opportunity.
The $\Diamond$ evaluates positively when the agent is in a zuya with a reachable enemy and the conditions for grade-1 coup (living enemy, witnesses available) hold.
The substrate-content: the *opportunity-existence* for honor-firing.

## The duality $\Diamond = \sim\Box\sim$ on $\mathbf{FOUR}$

By the bilattice modal-dual identity (cf. [correlative-pair-as-modal-dual](../../../theorems/correlative-pair-as-modal-dual.md) and the [modal-necessity-basic-properties theorem](../../../../../../../math/theories/categories/theories/predication-categories/theorems/modal-necessity-basic-properties.md)):

$$\Diamond_R u = \sim \Box_R \sim u$$

For the Lakota deontic substrate, this means: "there exists a kin-path on which a particular virtue is *not* owed" is the negation of "all kin-paths have the virtue owed."
Since (W3) makes the latter $\mathbf{t}$ trivially, the former is $\mathbf{f}$ — there are *no* kin-paths on which the virtues are not owed.
The substrate is *uniformly obligated* on the kin-class.

This is structurally distinct from Western deontic logic, where *some* obligations are conditional and *some* permissions exist that are not obligations.
The Lakota substrate's kin-virtue obligations are *unconditional and universal* over the kin-graph; the modal structure collapses to triviality on $V_4$.

The non-trivial modal structure operates on *which conduct-cells discharge which obligations* — the $\Box/\Diamond$ duality fires on *engagement-paths* rather than on obligation-existence.

## Permission as scope-bounded license

Western deontic-modality has a permission-operator $P$ that is the dual of obligation: $P u \iff \neg \Box \neg u$.
The Lakota substrate's permission-structure differs: permissions are *scope-bounded licenses* installed by specific morphisms — akicita-installation (per [akicita-band](../objects/akicita-band.md)) installs camp-discipline-permission within the akicita's scope; zuya-installation (per [zuya](../objects/zuya.md)) installs raid-permission within the zuya-scope.

Substrate-algebraically: permissions are *closure-rule-firings* on scope-cells, not modal-state-cells.
The permission-cell $\langle a, \texttt{permitted-to-X}\rangle$ fires under a specific rule whose antecedent includes the scope-potential cell.
When the scope-potential cell drops, the permission-cell drops with it (cf. [akicita-revocation-at-scope-completion](../theorems/akicita-revocation-at-scope-completion.md)).

This is structurally a *temporally-bounded modal frame* — the modal frame $R^\mathrm{perm}$ is non-empty only during specific scope-active periods.
The substrate-content: permissions are not perpetual; they are scope-conditioned.

## The non-normality of Lakota deontic-modality

Per [modal-non-normality](../../../../../../../math/theories/categories/theories/predication-categories/theorems/modal-non-normality.md), bilattice modal operators can fail the standard normality axioms (K, T, 4, 5) on specific bilattices and specific frames.
The Lakota deontic-modality fails K:

The K-axiom: $\Box(u \to v) \to (\Box u \to \Box v)$.

For the Lakota substrate: "$\Box$ all kin owe both $\nu_1$ AND $\nu_2$" *implies* "$\Box$ all kin owe $\nu_1$ AND $\Box$ all kin owe $\nu_2$" trivially when (W3) installs the owes-cells uniformly.
But the *converse direction* — that owing $\nu_1$ to all kin and owing $\nu_2$ to all kin implies owing $(\nu_1 \wedge \nu_2)$ to all kin — fails on the *discharge* side: an agent can discharge $\nu_1$-owes to a particular kin without discharging $\nu_2$-owes to the same kin.
The discharges are separately-cell-firing; the conjunction-on-discharges is *not* the conjunction-of-discharges.

This is a structural feature, not a bug: the polity's substrate allows partial-virtue-discharge.
An agent who is generous (wówačhantognaka-discharging) but failing-fortitude (wówačhiŋtȟaŋka-undischarging) has a substrate-state that the polity reads accurately — they are not uniformly-good-or-uniformly-bad in their kin-conduct.

## Sources

- [modal-necessity-basic-properties](../../../../../../../math/theories/categories/theories/predication-categories/theorems/modal-necessity-basic-properties.md) — the modal-operator foundation.
- [modal-non-normality](../../../../../../../math/theories/categories/theories/predication-categories/theorems/modal-non-normality.md) — the failure of normality axioms.
- Marshall, *The Lakota Way* (2002) — the four virtues and continuing obligation.
- Ella Deloria, *Speaking of Indians* (1944) — kin-obligation as substrate.
