---
type: morphism
class: power-retraction
status: draft
symbol: "\\rho^{-1}"
depends-on: [jural-relation, delegation]
realizes: [hohfeldian-revocation]
---

# Revocation

The Hohfeldian operation by which a power-holder *retracts* a power they previously granted to a beneficiary.
The dual of [delegation](delegation.md): where delegation transfers a power downward (with accountability retained), revocation pulls that transferred power back.

## Definition

Given a delegation $R^B$ — $\langle R^B, \texttt{kind}, \texttt{power}\rangle = \mathbf{t}$, $\langle R^B, \texttt{active-holder}, B\rangle = \mathbf{t}$, $\langle R^B, \texttt{derived-from}, R^P\rangle = \mathbf{t}$ — and the principal $Q$'s revocation power $R^{\mathrm{revoke}}$ on the action of revoking $R^B$, the revocation $\rho^{-1}$ produces:

- $\langle R^B, \texttt{revoked-by}, Q\rangle = \mathbf{t}$ — explicit revocation-witness.
- $\langle R^B, \texttt{active}, \mathrm{op}\rangle$ moves from $\mathbf{t}$ toward retired-state.
- The correlative liability that arose with $R^B$ (the affected agent's susceptibility to $B$'s exercise of the delegated power) retires symmetrically via [correlate-of](correlate-of.md).

## Felicity condition: revocation power exists

The closure rule that admits a revocation increment requires the principal $Q$ to hold the revocation power: $R^{\mathrm{revoke}}$ exists with $\langle R^{\mathrm{revoke}}, \texttt{active-holder}, Q\rangle = \mathbf{t}$.
The library's [delegation term](../../../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/terms/delegation.md) names *revocability* as one of the four delegation invariants — the principal "may revoke the grant at will unless constrained by an external obligation."
This corresponds to: the revocation power exists by default unless explicitly disabled by a stronger constraint.

When revocation is *constrained* — by contract, by a power-coupled-with-an-interest, by statutory protection — the revocation power's `active` cell is at $\mathbf{f}$, and the closure rule blocks the revocation.
Constrained-irrevocable delegations are substrate-detectable as `revocation-blocked` cells.

## Notice to the delegate

Like [assignment](assignment.md), revocation has a two-stage structure: stage 1 is the principal's revocation act; stage 2 is the delegate's notice.
Until $\langle B, \texttt{notified-of}, \rho^{-1}\rangle = \mathbf{t}$, the delegate may continue to exercise the power (and third parties relying on $B$'s authority are protected).
After notice, $B$'s exercise of $R^B$ produces a charter-violation witness because $R^B$'s `active` cell is at $\mathbf{f}$.

## Effect on sub-delegations

If $B$ has sub-delegated to $C$ (producing $R^C$ derived-from $R^B$), revocation of $R^B$ cascades: by presheaf functoriality of delegation chains (per the library's [formal-structure-of-delegation](../../../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/texts/formal-structure-of-delegation.md) Proposition 5), $R^C$'s authority is bounded by $R^B$'s; when $R^B$ retires, $R^C$'s authority chain is broken.

As a substrate condition: a closure rule fires when $R^B$ retires, retiring all $R^X$ with $\langle R^X, \texttt{derived-from-chain-includes}, R^B\rangle = \mathbf{t}$.
The cascade reaches all sub-delegations transitively.

## Distinguishing from waiver and assignment

| Operation | Operates on | Creates new? | Single party? |
|---|---|---|---|
| Waiver | Claim | No | Yes (claim-holder) |
| Assignment | Claim | New holder, same claim-content | No (assignor + obligor notice) |
| Revocation | Power (delegation) | No (sub-delegations cascade-retire) | No (principal + delegate notice) |
| Novation | Claim + duty pair | Yes (replacement pair) | No (three-party consent) |

Revocation is to *delegation* what waiver is to *first-quartet claims*: a unilateral retraction by the holder.
The asymmetry is that delegation is structurally about second-quartet (powers), so revocation operates on sub-chains and accountability flows differently than waiver's claim-extinguishment.

## Connection to lifecycle of an office

When an officer is *removed* from an office (the inverse of [installation](installation.md)), the operation is closer to revocation than to waiver: the installer's power to install carries an implicit revocation power for the same action.
Removing an officer drives $\langle \iota, \texttt{recognized-as-incumbent-of}, O\rangle$ from $\mathbf{t}$ toward $\mathbf{f}$ (revocation of recognition), with corresponding cascade-retirement of all delegated powers the officer held by virtue of the office.
