---
type: morphism
class: extinguish-and-recreate
status: draft
symbol: "\\nu"
depends-on: [jural-relation, correlate-of]
realizes: [hohfeldian-novation]
---

# Novation

The Hohfeldian operation that *extinguishes* both a claim and its correlative duty and *replaces* them with a new pair, typically with a new obligor or new performance.
Distinct from [assignment](assignment.md) (which transfers the claim while preserving the duty) and from [delegation](delegation.md) (which creates a new power while preserving the source).

## Definition

Given a paired jural relation $(R^C, R^D)$ — claim $R^C$ held by $Q$ against obligor $P$, and its correlative duty $R^D$ held by $P$ toward $Q$, on scope $X$ — a novation $\nu$ to a new triple $(Q', P', X')$ produces:

- An increment driving $\langle R^C, \texttt{potential}, \mathrm{op}\rangle$ from $\mathbf{t}$ toward retired-state (the claim is extinguished).
- An increment driving $\langle R^D, \texttt{potential}, \mathrm{op}\rangle$ from $\mathbf{t}$ toward retired-state (the duty is extinguished).
- A new claim $R^{C'}$ with $\langle R^{C'}, \texttt{potential-holder}, Q'\rangle = \mathbf{t}$, $\langle R^{C'}, \texttt{passive-party}, P'\rangle = \mathbf{t}$, $\langle R^{C'}, \texttt{scope-action}, X'\rangle = \mathbf{t}$.
- A new duty $R^{D'}$ produced by [correlate-of](correlate-of.md) on $R^{C'}$.
- $\langle R^{C'}, \texttt{novates}, R^C\rangle = \mathbf{t}$ — explicit linkage recording the novation.

## Three-party consent

Unlike assignment (which requires only the assignor's act + the obligor's notice), novation requires all three parties to consent: the original obligor (who is being released), the new obligor (who is taking on the new duty), and the obligee (who is releasing the original claim and accepting the new one).
As a substrate condition, the closure rule that admits a novation increment requires three witnesses settled at $\mathbf{t}$:

- $\langle Q, \texttt{consents-to}, \nu\rangle = \mathbf{t}$
- $\langle P, \texttt{consents-to}, \nu\rangle = \mathbf{t}$
- $\langle P', \texttt{consents-to}, \nu\rangle = \mathbf{t}$ (when $P' \neq P$; if novation only changes $X$, this reduces to two-party consent)

Without all three, the closure rule emits a failure-witness instead.

## Effect on the substrate

By [settling-monotonicity](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), the original claim and duty cells cannot revert from $\mathbf{t}$ to $\bot$.
The "extinguishment" is realized by an `active` cell on the jural-relation entity moving to $\mathbf{f}$ (the relation is no longer active), with the underlying constituent cells (kind, active-holder, passive-party, scope-action) remaining at their settled values as a *historical record*.
The audit log can reconstruct the past relation's existence; the operative relation has been replaced.

The replacement claim $R^{C'}$ and its correlative duty $R^{D'}$ are fresh substrate entities.
They inherit no structural cells from the originals beyond the `novates` linkage.
This is what distinguishes novation from amendment: an amendment modifies the existing relation in place; novation creates new relations.

## Composition with assignment

Novation can be reached by composition: assignment of the claim from $Q$ to $Q'$, followed by assignment of the duty from $P$ to $P'$, followed by amendment of the scope to $X'$.
But this composition leaves the original relation entities in place; novation produces fresh entities.
The library's distinction (novation extinguishes and creates; assignment transfers) is reflected in the substrate entities: novation produces new $R^{C'}, R^{D'}$ with no ancestral cells beyond the `novates` linkage, while assignment-then-amendment produces $R^{C'}$ that inherits structural cells via `derived-from`.

## Connection to contract formation

The library's hohfeldian-position text identifies contract formation as a second-quartet phenomenon: an offer is the exercise of a power creating a power-and-liability in the offeree.
A novation is structurally a contract that *replaces* an existing contract — the consent of all three parties is the joint exercise of their respective powers (to release / to undertake / to receive) producing the new claim-duty pair while extinguishing the old.
