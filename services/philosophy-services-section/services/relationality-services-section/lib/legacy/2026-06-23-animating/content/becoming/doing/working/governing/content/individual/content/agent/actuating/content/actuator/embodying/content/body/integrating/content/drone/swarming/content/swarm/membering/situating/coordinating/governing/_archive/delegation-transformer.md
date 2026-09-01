---
type: morphism
class: restriction
status: draft
symbol: "\\rho"
depends-on: [jural-relation, office-as-double-settlement, predicate-specialization]
realizes: [delegation]
---

# Delegation

The morphism by which a [jural relation](../objects/jural-relation.md) of `power` held by a principal $Q$ is *restricted* to a beneficiary $B$ — transferring authority to act within a bounded grant while accountability remains with $Q$.
Following the work vocabulary's [formal-structure-of-delegation](../../../../../../../../../../../humanities/theories/sociology/theories/work/texts/formal-structure-of-delegation.md), delegation is a restriction map in a presheaf structure; here we render the same structure on the bilattice substrate.

## Definition

Let $R^P$ be a power jural relation held by principal $Q$: $\langle R^P, \texttt{kind}, \texttt{power}\rangle = \mathbf{t}$, $\langle R^P, \texttt{active-holder}, Q\rangle = \mathbf{t}$, $\langle R^P, \texttt{scope-action}, X\rangle = \mathbf{t}$.
A *delegation of grant $G \subseteq X$ to beneficiary $B$* is an increment that creates a new jural relation $R^B$ with:

- $\langle R^B, \texttt{kind}, \texttt{power}\rangle = \mathbf{t}$.
- $\langle R^B, \texttt{active-holder}, B\rangle = \mathbf{t}$.
- $\langle R^B, \texttt{scope-action}, G\rangle = \mathbf{t}$ — note the restricted scope.
- $\langle R^B, \texttt{derived-from}, R^P\rangle = \mathbf{t}$ — explicit linkage to the source grant.
- $\langle R^B, \texttt{accountability-resides-in}, Q\rangle = \mathbf{t}$ — accountability stays with the principal.

## The four delegation invariants as substrate properties

The [delegation term](../../../../../../../../../../../humanities/theories/sociology/theories/work/terms/delegation.md) names four invariants.
Each renders as a substrate-algebraic property:

**Derivativity (*nemo dat quod non habet*).** The grant $G$ must be a sub-scope of the principal's $X$.
As a substrate condition: the [predicate-specialization morphism](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-specialization.md) on the scope-action structure requires $\mathrm{dom}(G) \hookrightarrow \mathrm{dom}(X)$.
The closure rule that admits a delegation increment checks this inclusion before settling $R^B$.
An attempt with $G \not\subseteq X$ produces a failure-witness, not a delegation.

**Accountability non-transfer.** $\langle R^B, \texttt{accountability-resides-in}, Q\rangle = \mathbf{t}$ — accountability is encoded as a cell on $R^B$ pointing back to $Q$, never transferred to $B$.
As a substrate property: the closure rule generating $R^B$ never produces an `accountability-resides-in` cell on $B$; the delegate cannot take on the principal's accountability through any operation on $R^B$ alone.

**Boundedness.** The grant $G$ is required to be a *proper* sub-scope: an increment with $G = X$ is treated by the closure rule as an *abdication-witness*, not a delegation.
The closure rule that admits delegations checks $G \subsetneq X$.

**Revocability.** The principal $Q$ retains the power to retract $R^B$.
This is itself a power jural relation: $\langle R^{\mathrm{revoke}}, \texttt{kind}, \texttt{power}\rangle = \mathbf{t}$, $\langle R^{\mathrm{revoke}}, \texttt{active-holder}, Q\rangle = \mathbf{t}$, $\langle R^{\mathrm{revoke}}, \texttt{scope-action}, \texttt{revoke-}R^B\rangle = \mathbf{t}$.
Exercising the revocation power emits an increment driving $\langle R^B, \texttt{kind}, \texttt{power}\rangle$ from $\mathbf{t}$ to $\top$ (contradictory state), which the substrate's repair machinery resolves by retiring $R^B$.

## Sub-delegation bound (*delegatus non potest delegare*)

If $B$ further delegates from $R^B$ to $C$ producing $R^C$, the predicate-specialization composition forces $\mathrm{dom}(R^C) \subseteq \mathrm{dom}(R^B) \subseteq \mathrm{dom}(R^P)$.
As a substrate property: the closure rule that admits the second delegation checks the inclusion against the *accumulated* derived-from chain; sub-delegation cannot exceed the original principal's grant.
This is exactly presheaf functoriality applied to the delegation chain — see [Proposition 5 in the formal-structure-of-delegation text](../../../../../../../../../../../humanities/theories/sociology/theories/work/texts/formal-structure-of-delegation.md).

## Correlative liability

By the [correlate-of morphism](correlate-of.md), the delegation $R^B$ generates a correlative liability $R^B_{\mathrm{corr}}$ in the agents within the grant's scope.
If $G$ regards actions affecting agent $D$, then $R^B_{\mathrm{corr}}$ has $\langle R^B_{\mathrm{corr}}, \texttt{kind}, \texttt{liability}\rangle = \mathbf{t}$, $\langle R^B_{\mathrm{corr}}, \texttt{active-holder}, D\rangle = \mathbf{t}$, $\langle R^B_{\mathrm{corr}}, \texttt{passive-party}, B\rangle = \mathbf{t}$.
The delegate's exercise of $R^B$ creates a liability in the affected party; the correlative-pairing closure rule maintains this throughout the delegation's lifetime.

## Trust as the residual exposure

By accountability non-transfer, the principal $Q$ retains accountability while $B$ exercises the grant.
This is the structural source of *trust* in delegation: $Q$ becomes substrate-algebraically exposed to $B$'s operations within $G$, since $Q$'s accountability cells will register the consequences of $B$'s acts.
The trust triple $\mathcal{T} = (Q, B, G)$ from the work vocabulary corresponds to the joint cell pattern $\langle R^B, \texttt{active-holder}, B\rangle = \mathbf{t}$, $\langle R^B, \texttt{accountability-resides-in}, Q\rangle = \mathbf{t}$, $\langle R^B, \texttt{scope-action}, G\rangle = \mathbf{t}$.

## Composition with installation

When an office $O$'s capability section is *delegated* rather than transferred — e.g., an officer authorizing a deputy to act on the office's behalf during an absence — the delegation produces $R^B$ with $Q = $ the officer (not the office itself), $G$ a sub-scope of the office's action domain, and the temporal scope bounded.
Sub-delegation from $B$ further restricts; the principal-line traces back to the office's incumbent at every step.

## Transport under base-change

A delegation $R^B$ does not live only at its instant of creation; the underlying scope can be re-based by later operations — [jurisdictional restriction](../theorems/jurisdiction-as-base-change.md), [succession](succession.md) of the principal incumbent, [novation](novation.md) of the source claim, or charter amendment of the principal's scope.
By [delegation-transport-via-beck-chevalley](../theorems/delegation-transport-via-beck-chevalley.md), each such re-basing presents a pullback square in $\mathcal{C}_{\mathrm{op}}$ along which the delegation transports canonically: the in-image component of the grant survives the base-change with the four invariants intact, and the out-of-image component is blocked by the adjunction-counit failure (with the substrate optionally emitting a `transport-failure-of` witness).
The doctrines that office-scope delegations survive succession while personal-scope delegations lapse, and that novation of the source extinguishes derivative grants, are the in-image / out-of-image partition under the appropriate base-change.
