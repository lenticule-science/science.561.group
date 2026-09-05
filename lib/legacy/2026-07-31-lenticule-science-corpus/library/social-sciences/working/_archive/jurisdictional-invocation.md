---
type: morphism
status: sketch
depends-on: [jurisdiction, authority, jural-relation, operations-settling]
realizes: [jurisdictional-invocation]
see-also: [jurisdiction-as-base-change, jurisdictional-declination, jurisdictional-submission]
---

# Jurisdictional invocation

The morphism by which an authority $A$ asserts operative jurisdiction over a history-fiber pair $(t, a)$ — settling the validity-condition cell that marks the pair as falling within $A$'s sub-topos.

## Definition

Given a [jurisdiction](../objects/jurisdiction.md) $\mathcal{J} = (A, T_J, H_J, V)$ and a history-fiber pair $(t, a) \in T \times H_t$, **jurisdictional invocation** is the increment

$$\mathrm{inv}_{\mathcal{J}}(t, a) \;=\; \langle (t, a), \texttt{within-jurisdiction-of}, A\rangle \;\mapsto\; \mathbf{t}$$

settling the validity-condition cell from $\bot$ to $\mathbf{t}$, activating the jurisdiction's nucleus $\sigma^A_t$ on acts at $(t, a)$.

## Preconditions

Invocation is *intra vires* (valid) iff:
1. $t \in T_J$ — the history falls within the jurisdiction's history sub-site.
2. $a \in H_J$ — the fiber falls within the jurisdiction's fiber sub-bundle.
3. The validity condition $V(t, a)$ is satisfied by the act's type.

An invocation that fails any precondition is *ultra vires* — the authority's nucleus $\sigma^A_t$ is not operative on acts at $(t, a)$ regardless of the invocation increment. Ultra-vires invocations produce a cell that settles but generates no downstream closure-rule firings (the nucleus is not activated).

## Effect

After successful invocation: acts by $A$ at $(t, a)$ propagate toward $H^{*A}_t$ — they create valid duties within the jurisdiction. The invocation activates the authority's second-quartet [jural-relation](../objects/jural-relation.md) powers (power cells) for the scope $(t, a)$.

## Relation to jurisdiction-as-base-change

By [jurisdiction-as-base-change](../theorems/jurisdiction-as-base-change.md), a jurisdiction is a base change of the authority's capability fiber to the sub-topos $T_J$. Jurisdictional invocation is the assertion that a given $(t, a)$ is in the support of this base change — that the base-change pullback is operative at this point. It does not change the base-change structure; it applies it to a specific $(t, a)$.
