---
type: morphism
class: claim-relinquishment
status: draft
symbol: "\\omega"
depends-on: [jural-relation, correlate-of]
realizes: [hohfeldian-waiver]
---

# Waiver

The Hohfeldian operation by which a claim-holder *relinquishes* a claim entirely, without transferring it to anyone.
Distinct from [assignment](assignment.md) (transfer) and [novation](novation.md) (extinguish-and-replace): waiver extinguishes the claim *and* its correlative duty without producing replacements.

## Definition

Given a claim $R^C$ held by $Q$ — $\langle R^C, \texttt{active-holder}, Q\rangle = \mathbf{t}$, with correlative duty $R^D$ — a waiver $\omega$ produces:

- $\langle R^C, \texttt{waived-by}, Q\rangle = \mathbf{t}$ — the explicit waiver-witness on the claim entity.
- $\langle R^C, \texttt{active}, \mathrm{op}\rangle$ moves from $\mathbf{t}$ toward retired-state (the claim is no longer operative).
- The correlative duty $R^D$ has its `active` cell moved similarly, by the [correlate-of](correlate-of.md) closure rule firing in reverse: when a claim retires, its correlative duty retires.

## Single-party operation

Unlike [novation](novation.md) (three-party consent) or [assignment](assignment.md) (assignor-act + obligor-notice), waiver is a unilateral operation by the claim-holder.
The substrate-algebraic condition is single: $\langle Q, \texttt{performs}, \omega\rangle = \mathbf{t}$.
No other party's consent is required because waiver only relieves the obligor — and obligors do not have the standing to refuse relief.

## Voluntariness as a felicity condition

Waiver requires that $Q$ act *voluntarily and knowingly*.
As a substrate condition: the closure rule that admits a waiver increment requires $\langle \omega, \texttt{voluntary-witness}, Q\rangle = \mathbf{t}$ (no coercion-evidence) and $\langle \omega, \texttt{informed-witness}, Q\rangle = \mathbf{t}$ (the waiver-holder knew what was being waived).
Failures produce a failure-witness rather than admitting the waiver.
The substrate's repair machinery handles the case where coercion or non-disclosure is later witnessed: the waiver is treated as voidable, with $\langle R^C, \texttt{active}, \mathrm{op}\rangle$ restorable to $\mathbf{t}$ via the repair-catalog operation.

## Distinguishing structural fact

The library's hohfeldian-position table:

| Operation | Claim | Duty | Replacement? |
|---|---|---|---|
| Assignment | Transferred | Preserved | No |
| Delegation | (operates on power, not claim) | (operates on liability) | No |
| Novation | Extinguished | Extinguished | Yes (new pair) |
| Waiver | Extinguished | Extinguished | No |

Novation and waiver both extinguish; novation creates replacements, waiver does not.
The substrate distinction is whether the closure rule that admits the operation also fires the entities-creation rules: novation does, waiver does not.

## What waiver does not affect

Waiver of $R^C$ does not affect: - *Other* claims held by $Q$ against $P$ on different scopes — only the specific waived claim retires. - The substrate's record of $R^C$ having existed — by [settling-monotonicity](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), the historical cells of $R^C$ remain at their settled values; only the `active` cell moves. - Future claims that $Q$ might acquire against $P$ — waiver of one claim does not waive future claims.

The audit log can reconstruct: $R^C$ existed, $Q$ waived it on date $\tau$, the relation retired.
Subsequent normative state proceeds as if $R^C$ had not been operative beyond $\tau$, but the historical record persists.
