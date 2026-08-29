---
type: definition
class: office-with-bounded-scope
status: draft
symbol: "B"
depends-on:
  - polity-cell-system
  - office-as-double-settlement
  - wakichunza-office
  - wolakhota-closure-system
realizes: [office, akicita]
---

# Akicita band

An *akicita* band is a body of camp-marshals with bounded-scope authority over specific scope-actions: the buffalo hunt, the migration, the war party, the camp's order at major convocations.
The band is constituted as a substrate entity with explicit-scope and explicit-term, and its authority is *automatically revoked at scope-completion*.
The Lakota polity uses akicita-authority as its primary mechanism for time- and scope-bounded coercive coordination, distinguishing it sharply from the open-ended consultative authority of the naca and wakíčhuŋza.

## Constituent predications

An akicita band entity $B \in E^\mathrm{off}_\mathrm{lak}$ carries:

- $\langle B, \texttt{polity-scope}, P\rangle$ for the oyate or confederacy the band serves.
- $\langle B, \texttt{members}, a_i\rangle$ for each member of the band, typically warriors of established virtue-standing.
- $\langle B, \texttt{scope-action}, X\rangle$ — the action $B$ is authorized over (a specific hunt, a specific migration, a specific war party).
- $\langle B, \texttt{scope-active}\rangle$ — the cell that fires while $X$ is in progress; falls at $X$'s completion.
- $\langle B, \texttt{appointed-by}, K\rangle$ for the omniciye or wakíčhuŋza that constituted the band.
- $\langle B, \texttt{enforcement-authority}\rangle$ — the substrate-flag enabling akicita-coercive-operations during scope-active.

## Installation morphism

The akicita-installation closure rule:

$$\forall B, P, X, K.\quad \langle K, \texttt{appoints-akicita-for}, X\rangle \geq_k \mathbf{t} \;\wedge\; \bigwedge_i \langle a_i, \texttt{accepts-akicita-membership}\rangle \geq_k \mathbf{t} \;\Longrightarrow\; \langle B, \texttt{scope-active}\rangle \geq_k \mathbf{t} \;\wedge\; \langle B, \texttt{enforcement-authority}\rangle \geq_k \mathbf{t}$$

The appointment by the council or wakíčhuŋza, plus acceptance by the members, installs the band and activates the enforcement-flag.

## Revocation at scope-completion

The defining structural feature of akicita-authority: the cell $\langle B, \texttt{scope-active}\rangle$ has a *completion-condition* tied to $X$.
When $X$ completes — the hunt is over, the migration arrives, the war party returns — the cell automatically drops to $\bot$, and the enforcement-authority cell follows.

The closure rule:

$$\langle B, \texttt{scope-action}, X\rangle \geq_k \mathbf{t} \;\wedge\; \langle X, \texttt{completed}\rangle \geq_k \mathbf{t} \;\Longrightarrow\; \langle B, \texttt{scope-active}\rangle = \bot \;\wedge\; \langle B, \texttt{enforcement-authority}\rangle = \bot$$

This is a *retraction* in the substrate: a $\leq_k$-decreasing transition (cells fall from $\mathbf{t}$ to $\bot$).
It is admissible because the cells in question are *scoped*-cells — their values are interpreted as in-force-during-scope, and scope-completion is not retraction-of-information but completion-of-the-interpretive-window.
Formally: the substrate's $\leq_k$-monotone family-of-valuations is on the *raw* cells; the scoped reading is a higher-level interpretation that completes-and-archives the scoped-substrate-fragment when the scope closes.

The Beck–Chevalley behavior of this scope-completion is the substance of the theorem [akicita-revocation-at-scope-completion](../theorems/akicita-revocation-at-scope-completion.md): the scope-completion morphism commutes with base-change in $\mathcal{C}_\mathrm{lak}$, so akicita-authority-cells completed in one oyate transport correctly to the inter-oyate level when the same scope-action is being concluded.

## During scope-active: enforcement operations

While $\langle B, \texttt{scope-active}\rangle$ is at $\mathbf{t}$, the akicita has substrate-authority for *specific* enforcement operations.
These are typically:

- **Hunt-discipline**: during a buffalo hunt, the akicita prevents premature individual hunters from spooking the herd.
  Sanctions against premature hunters include destroying their tipi, breaking their bow, or in extreme cases physical chastisement.
  The sanctions are themselves *scoped*: they apply *during the hunt*, do not carry over after the hunt is over.
- **Migration-discipline**: during a major migration, the akicita keeps the column orderly, scouts ahead, guards stragglers.
- **Camp-circle enforcement at sun dance**: during the annual sun dance gathering of all seven oyate, the akicita maintains the camp-circle order and prevents inter-oyate conflict during the gathering.
  Outside the gathering, the akicita-authority has no carry-over.
- **War-party coordination**: during a war expedition, the akicita maintains the order of march, post sentries, regulates the engagement.

The substrate-content of "scoped sanction": the sanction-cell $\langle a, \texttt{akicita-sanctioned}, X\rangle$ is itself scoped to $X$, and its cell follows the same scope-completion automatic-retraction as the band's authority.
A person sanctioned by akicita during the hunt has the sanction-cell *only* over the hunt-scope; once the hunt completes, the cell drops.

## Why this is not police

The akicita is not a standing police force.
The structural distinctions from police-in-the-modern-sense:

- **Scope-bounded**: akicita-authority is over a specific named action with a clear completion-condition.
  There is no open-ended-jurisdiction.
  By contrast, modern police authority is open-ended over the polity's territory.
- **Term-bounded**: the band exists for the duration of the scope.
  There is no standing-akicita that exists between scopes; the band is reconstituted for each scope (often with overlapping membership but with explicit reappointment).
- **Sanction-scoped**: akicita-sanctions are scoped to the action, not carried into general life.
  There is no criminal-record-cell that propagates outside the scope.
- **Council-appointed**: the band exists only by council appointment, and is recallable by the council mid-scope.

The substrate-algebraic content: $\mathcal{S}_\mathrm{wolak}$ contains a closure-rule-class for akicita-authority but *no* closure-rule-class for standing-police-authority.
The absence is constitutive.

## Multiple akicita bands

A polity can have multiple akicita bands operating simultaneously, each over a different scope.
Common configuration during summer convocation:

- A hunt-akicita over the day's hunt.
- A camp-circle-akicita over the encampment's order.
- A war-akicita over an active war party.

These are *distinct* band-entities, with disjoint scope-cells.
Their authorities do not interfere because the cells they settle are scope-specific.

## Sources

- Walker 1980, *Lakota Belief and Ritual* — akicita and the camp's order during the sun dance.
- Walker 1982, *Lakota Society* — akicita appointment, scope, and revocation in the nineteenth-century oyate.
- Powers, *Oglala Religion* (1977) — the hunt-akicita's structural role.
- DeMallie 2001 in *Handbook of North American Indians* vol.
  13 — akicita's place in Lakota political structure.
- Estes, *Our History is the Future* (2019) — twentieth- and twenty-first-century continuations and adaptations (the Pine Ridge spiritual society, the AIM patrols of the 1970s, the NoDAPL security at Standing Rock).
