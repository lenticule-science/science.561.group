---
type: morphism
class: path-blocking
status: draft
symbol: "\\mathcal{E}"
depends-on: [jural-relation, jurisdiction, waiver]
realizes: [hohfeldian-estoppel]
---

# Estoppel

The Hohfeldian operation by which a forum *blocks* a party from asserting a position inconsistent with their prior representation. Distinct from [waiver](./waiver.md) (which extinguishes the claim) and [revocation](./revocation.md) (which retracts a power): estoppel leaves the underlying jural relation intact but prevents it from settling within the forum.

Per the library's [hohfeldian-estoppel term](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/work/theories/governance/theories/kyriarchial-governance/theories/hohfeldian/terms/hohfeldian-estoppel.md), an estoppel is a quadruple $\mathcal{E} = (Q, R, \rho, \delta)$ — an estopped party, a relying party, a representation, and a detriment.

## Definition

Given:

- An estopped party $Q$ with a [jural-relation](../objects/jural-relation.md) $R^C$ of `kind: claim` (or other position) that $Q$ might assert.
- A relying party $R$ — agent who acted on $Q$'s prior representation.
- A representation $\rho$ — a substrate cell $\langle Q, \texttt{represented}, \rho\rangle = \mathbf{t}$ asserted at stage $\tau_\rho$.
- A detriment $\delta$ — a substrate cell pattern recording that $R$ would suffer harm if $Q$ now asserts a position inconsistent with $\rho$.

The estoppel produces an increment at stage $\tau^*$ asserting:

- $\langle Q, \texttt{estopped-from-asserting}, R^C\rangle = \mathbf{t}$ — the estoppel cell on $Q$'s position.
- $\langle \mathcal{E}, \texttt{rely-party}, R\rangle = \mathbf{t}$
- $\langle \mathcal{E}, \texttt{representation}, \rho\rangle = \mathbf{t}$
- $\langle \mathcal{E}, \texttt{detriment}, \delta\rangle = \mathbf{t}$

## Path-blocking, not extinguishment

Per the library's table, the structural distinction:

| Operation | Effect on $R^C$ |
|---|---|
| [Waiver](./waiver.md) | $R^C$ retires; cells move to $\mathbf{f}$. |
| [Estoppel](./estoppel.md) | $R^C$ remains at $\mathbf{t}$; the *path* from $R^C$ to settled state in this forum is blocked. |

In substrate terms: the estoppel cell does not retire $R^C$ — its constituent cells (kind, active-holder, scope-action) remain at $\mathbf{t}$. What estoppel adds is a *forum-relative* closure-rule gate: when $Q$ attempts to invoke $R^C$ to drive cells toward settled state, the gate detects the estoppel cell and produces a failure-witness instead.

The same $R^C$ may be invokable in a different forum that doesn't recognize the estoppel — estoppel is forum-local, encoded in a closure rule in the relevant [jurisdiction](../objects/jurisdiction.md) $\mathcal{J}$'s rule subsystem $\mathcal{S}_{\mathcal{J}}$, not globally in $\mathcal{S}_{\mathrm{op}}$.

## Four substrate invariants

Per the library's four invariants for a valid estoppel:

**Representation.** $Q$'s prior representation $\rho$ is a settled cell. The closure rule that admits an estoppel increment requires $\langle Q, \texttt{represented}, \rho\rangle = \mathbf{t}$ at stage $\tau_\rho < \tau^*$.

**Reliance.** $R$ acted on $\rho$. As substrate condition: $\langle R, \texttt{relied-on}, \rho\rangle = \mathbf{t}$ at some stage between $\tau_\rho$ and $\tau^*$. The reliance must be reasonable — the closure rule additionally checks that $R$ did not have countervailing knowledge (no cell asserting $R$ knew $\rho$ to be incorrect).

**Detriment.** The detriment cell $\delta \neq \emptyset$ — a substrate cell pattern recording the harm $R$ would suffer absent estoppel. Closure rule check: $\delta$ has at least one cell at $\mathbf{t}$ representing harm.

**Inequity.** The forum $\mathcal{J}$ recognizes this combination as inequitable — i.e., the closure-rule subsystem $\mathcal{S}_\mathcal{J}$ contains a rule that fires the estoppel under the prior three conditions. Different forums may have different equity standards; the inequity invariant is *jurisdiction-relative*.

## Composition with jurisdiction

The estoppel cell is meaningful only within a specific jurisdiction $\mathcal{J}$:

$$\langle Q, \texttt{estopped-from-asserting}, R^C\rangle\, \texttt{within}\, \mathcal{J} = \mathbf{t}$$

The closure rule that gates $R^C$'s settlement in $\mathcal{J}$ checks the estoppel cell. Outside $\mathcal{J}$, the estoppel does not apply. This makes estoppel structurally distinct from waiver: waiver retires the claim across all forums; estoppel blocks only within the relying forum.

## Lifting estoppel

If circumstances change such that the inequity no longer holds — e.g., $R$ is made whole by another mechanism, or the detriment is otherwise resolved — the estoppel may be lifted. Substrate-algebraically: a closure rule fires on the resolution-witness, retracting the estoppel cell (moving it from $\mathbf{t}$ toward $\mathbf{f}$ via $\top$ + repair). After lifting, $Q$ may assert $R^C$ in $\mathcal{J}$ again.

This is why estoppel is *path-blocking* rather than retraction: the underlying claim was never extinguished; the path was merely gated. When the gate condition is removed, the path reopens.

## Connection to the Hohfeldian eightfold

Estoppel's substrate-algebraic structure differs from the other Hohfeldian operations:

- [Assignment](./assignment.md), [novation](./novation.md), [waiver](./waiver.md), [revocation](./revocation.md): operate *on* jural relations directly (transfer, extinguish, retract).
- [Ratification](./ratification.md): operates on authorization status (retrospective settling).
- [Succession](./succession.md): operates on incumbency (priority-list activation).
- [Estoppel](./estoppel.md): operates on *the path from a jural relation to settled state in a forum* — not on the relation itself.

This is the substrate-algebraic content of the equity vs. law distinction the library names: equitable estoppel is *forum-relative path-blocking*, distinct from the law-relative claim-modification that the other operations effect.
