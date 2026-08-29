---
type: definition
class: polity-unit
status: draft
symbol: "T"
depends-on:
  - polity-cell-system
  - kin-relation-as-primitive
  - wolakhota-closure-system
realizes: [populace]
---

# Tiyóšpaye

A *tiyóšpaye* — extended family-group — is the smallest polity-unit of the Lakota nation.
As a substrate entity $T \in E^\mathrm{pol}_\mathrm{lak}$ it carries the cells that record its composition, its leadership, its kin-structure, and its standing in the wider polity.

## Constituent predications

A tiyóšpaye entity $T$ carries:

- $\langle T, \texttt{member}, a\rangle$ for each person $a$ who is in the group.
  Members are typically connected by kinship — descent, marriage, huŋkápi adoption — but the membership cell is the *primary* fact; the kin-connections are how membership is *typically established*, not what membership *is*.
- $\langle T, \texttt{head}, a\rangle$ for the head of the tiyóšpaye, typically a senior man with strong virtue-standing; the cell settles at $\mathbf{t}$ when the group's recognition has converged.
- $\langle T, \texttt{camps\text{-}with}, T'\rangle$ for tiyóšpaye that share annual camp-circles.
  The relation is symmetric and reflexive on identity.
- $\langle T, \texttt{member\text{-}of\text{-}oyate}, O\rangle$ for the oyate (band) the tiyóšpaye sits within.
  See [oyate](oyate.md).

The tiyóšpaye's membership ranges from a few households to several dozen; the upper bound is the practical limit at which kinship-conduct can be sustained without requiring the more-formal oyate-level structure.

## Closure rules over the tiyóšpaye

Three rules in $\mathcal{S}_\mathrm{wolak}$ are tiyóšpaye-scoped specializations of (W1)–(W3) (cf. [wolakhota-closure-system](wolakhota-closure-system.md)):

**(T1) Membership-propagation.** $\langle T, \texttt{member}, a\rangle \geq_k \mathbf{t} \;\wedge\; v(\texttt{kin-of})(a, b) \geq_k \mathbf{t} \;\wedge\; \langle T, \texttt{member}, b\rangle \geq_k \bot \;\Longrightarrow\; \langle T, \texttt{member-possible}, b\rangle \geq_k \mathbf{t}$.
Kin of members are *eligible* members but not automatically members — membership requires the kinship-conduct of co-camping, co-feeding, and mutual recognition.
The rule installs eligibility, not membership.

**(T2) Member-obligation.** $\langle T, \texttt{member}, a\rangle \geq_k \mathbf{t} \;\wedge\; \langle T, \texttt{member}, b\rangle \geq_k \mathbf{t} \;\Longrightarrow\; v(\texttt{owes-wówačhantognaka-to})(a, b) \geq_k \mathbf{t}$.
Co-members owe each other the four virtues.
The owes-cells settle as a consequence of the membership-cells.

**(T3) Head-recognition.** $\bigwedge_{a \in \mathrm{members}(T)} v(\texttt{recognizes-as-head})(a, h) \geq_k \mathbf{t} \;\Longrightarrow\; \langle T, \texttt{head}, h\rangle \geq_k \mathbf{t}$.
The head's standing in the tiyóšpaye is the conjunction of member-recognition cells.
Withdrawal of recognition by enough members collapses the conjunction; the head-cell falls.

(T1) is non-Scott-continuous if the membership-set is infinite (it is not, for any actual tiyóšpaye).
(T2), (T3) are Scott-continuous.

## Identity, withdrawal, and continuity

A tiyóšpaye persists when its membership and head cells persist.
The standard transitions:

- **Member admission**: a $\texttt{member-possible}$ cell escalates to $\texttt{member}$ when the new person is accepted by co-camping conduct.
- **Member departure**: an existing member exercises [iyúhá-šni](../morphisms/iyuha-sni-withdrawal.md) from the tiyóšpaye-membership engagement.
  The membership cell drops to $\bot$ (under-determined for that engagement); the underlying kin-cells persist.
- **Head transition**: when the head dies, becomes incapacitated, or loses recognition, (T3) ceases firing positively.
  The successor is identified by (T3) firing on a new head-candidate as recognition aggregates.
- **Tiyóšpaye fission**: when a tiyóšpaye grows past sustainable size, a subset of members withdraws together and forms a new tiyóšpaye.
  The new entity's $\texttt{camps-with}$ relation typically connects to the parent tiyóšpaye for at least one generation.

The substrate distinguishes departure (iyúhá-šni, relation preserved) from severance (banishment, relation cut); the second is rare and is handled by a separate morphism (cf. [banishment-as-relation-severance](../morphisms/banishment-as-relation-severance.md)).

## Position relative to predicated-governance

The tiyóšpaye instantiates the [polity object](../../../objects/polity.md) of predicated-governance at the smallest polity-scale: it has a populace ($\mathrm{Pop}_T = \mathrm{members}(T)$), self-recognition (the populace's recognition cells are what installs the head), and constituent power (the founding act, typically descent from a founding ancestor or fission from a parent tiyóšpaye).
The autarkeia at tiyóšpaye-scale is restricted: a tiyóšpaye does *not* settle inter-tiyóšpaye questions internally — those rise to the [oyate](oyate.md) or to the [oceti-sakowin](oceti-sakowin.md) above.
The autarkeia is *complete on internal questions* — feeding arrangements, internal disputes, head-succession — and *complete only by escalation* on questions involving outside parties.

This nested-autarkeia structure is what makes the Lakota polity *confederal*: each scale's autarkeia is conditional on the next scale's, and the founding founding constituent-power is the always-present cosmogonic substrate (see [oceti-sakowin](oceti-sakowin.md) §"Constituent power").

## Sources

- Ella Deloria, *Speaking of Indians* (1944) — the tiyóšpaye as the basic kinship-political unit, with extensive sociological description.
- Walker 1982, *Lakota Society* (ed. DeMallie) — recorded social structure including tiyóšpaye composition and inter-tiyóšpaye relations.
- Marshall, *The Lakota Way* (2002) — contemporary tiyóšpaye dynamics.
- Estes, *Our History is the Future* (2019) — twentieth- and twenty-first-century tiyóšpaye reconstitution after settler disruption.
