---
type: theorem
status: conjecture
depends-on: [consensus-closure, authority-gate, normative-system, charter-as-closure-system]
proves: []
---

# Consensus settlement as authority-gate update

When a polity's consensus-closure rule settles a decision cell $\phi$, the settlement does not itself confer implementation authority.
A separate charter closure rule must fire to update the authority-gate for whoever is to act on $\phi$'s content.
This theorem identifies the two-stage structure — consensus settlement, then authority-gate update — and shows it follows from the substrate's separation of normative-settling from authorization.

## Statement

Let $\mathcal{P}$ be a polity with consensus-closure rule:

$$\bigwedge_{a \in \mathrm{Pop}_\mathcal{P}} \langle a, \texttt{aligns-with}, \phi\rangle = \mathbf{t} \;\Longrightarrow\; \langle \phi, \texttt{settled-by-consensus}, \mathcal{P}\rangle = \mathbf{t}$$

Suppose the consensus fires: $\langle \phi, \texttt{settled-by-consensus}, \mathcal{P}\rangle = \mathbf{t}$.

For any agent or office $I_\phi$ to implement $\phi$'s content — to take actions authorized by the decision — the authority-gate rule $\langle I_\phi, \texttt{authorized-to-implement}, \phi\rangle = \mathbf{t}$ must hold.
This cell is not produced by consensus-closure; it is produced by a distinct charter rule:

$$\langle \phi, \texttt{settled-by-consensus}, \mathcal{P}\rangle = \mathbf{t} \;\Longrightarrow\; \langle I_\phi, \texttt{authorized-to-implement}, \phi\rangle = \mathbf{t}$$

where $I_\phi$ is the implementation-authority designated in $\mathcal{P}$'s charter for decisions of $\phi$'s type.

## Proof sketch

The consensus-closure rule fires on alignment cells and settles $\phi$'s consensus-settlement cell.
The authority-gate for any act $\alpha$ associated with implementing $\phi$ requires a cell of the form $\langle A, \texttt{authorized-to}, \alpha\rangle = \mathbf{t}$.
No authority-gate rule fires from alignment cells directly; authorization flows through the charter's authority-gate rules, not through the deliberative record.
The consensus-settlement cell is the input to the authority-gate rule, not the authority grant itself. $\square$

## Why the two-stage structure matters

The separation prevents deliberative authority from automatically becoming implementation authority.
In a polity where the deliberating body and the implementing body are distinct — where the council decides and an office implements — the charter encodes this as two separate closure rules.
The council's consensus closes the deliberation; the office's authority-gate update opens the implementation pathway.

This is not a bureaucratic separation for its own sake.
It is the substrate-algebraic content of the constitutional principle that decision and execution are different kinds of authority.
In a Hohfeldian-pattern polity, the deliberative body holds a collective power to modify the normative system; the implementing body holds a privilege to act on the resulting authorization.
These are different jural relations and fire on different cells.

## The implementation-authority parameter

The implementation-authority $I_\phi$ is a charter parameter that varies by polity and decision type.
Three canonical structures:

1. **Office-holder implementation**: The charter designates a specific office as the implementation authority for decisions of $\phi$'s type.
  Consensus fires; the office-holder's authority-gate updates.
  Example: a council decides; an executive office implements.

2. **Distributed implementation**: Each member of the polity has standing to implement within their sphere.
  Consensus fires; each member's authority-gate updates proportionally.
  This is characteristic of consensus-governance polities without central executive offices.

3. **Council-as-body implementation**: The deliberating body is also the implementing body; the same agents whose alignment cells settled the consensus now hold implementation authority.
  Consensus fires; the collective body's authority-gate updates.
  The two-stage structure collapses — deliberately — because the polity's design commits the deliberating body to follow-through.

## The Haudenosaunee question

In Haudenosaunee Grand Council governance, after consensus is reached, which role — clan mothers, chiefs, the council as body — holds implementation standing?
The answer bears directly on what the implementation-authority charter rule looks like in that governance pattern.
This is a question for the traditions, not derivable from substrate algebra.
See the library question [haudenosaunee-implementation-authority-after-consensus](../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/questions/haudenosaunee-implementation-authority-after-consensus.md).

The general theorem holds regardless: consensus-settlement produces a settlement cell; a separate charter rule must fire to produce the implementation-authority cell.
The specific charter rule instantiates the general pattern according to the governance tradition.
