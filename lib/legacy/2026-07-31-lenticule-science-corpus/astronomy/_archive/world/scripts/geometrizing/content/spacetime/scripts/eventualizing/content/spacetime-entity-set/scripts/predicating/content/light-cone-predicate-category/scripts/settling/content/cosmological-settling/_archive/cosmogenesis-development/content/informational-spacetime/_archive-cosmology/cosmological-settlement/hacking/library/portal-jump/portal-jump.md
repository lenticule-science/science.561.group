---
type: morphism
class: traveller-transport
symbol: "J_i"
status: draft
depends-on: [portal-morphism, traveller-fibration]
see-also: [boundary-primacy-of-traveller-identity]
---

# Portal jump

Fix a [Wood](../objects/wood-between-worlds.md) $(\mathrm{Wd}, \{P_i\}, \{\phi_i\})$ for worlds $\{W_i\}$ and a [traveller fibration](../objects/traveller-fibration.md) $\mathrm{Trav}$ over the ambient category.
For any traveller-state $\tau \in \mathrm{Trav}(\mathrm{Wd})$ whose support is contained in pool $P_i$, the **portal jump** is

$$J_i(\tau) := (\phi_i)_*\bigl(\tau \restriction P_i\bigr) \in \mathrm{Trav}(W_i).$$

The construction has two stages: first restrict the traveller-state to the pool $P_i$ (its support is already there by assumption); then push the restriction forward along the [portal morphism](portal-morphism.md) $\phi_i : P_i \to W_i$ via the transport functor $(\phi_i)_*$ supplied by the traveller fibration.

## Coherent arrival axiom

If $\tau$ is connected and meets exactly one pool $P_i$, then $J_i(\tau)$ is connected and non-degenerate in $\mathrm{Trav}(W_i)$.

This is axiom 4.3 of the source draft.
It is the structural guarantee that *a coherent traveller arriving at exactly one portal arrives coherent and non-degenerate in the destination world* — it does not fragment into a degenerate or scattered destination state.

## What is and is not claimed

The portal jump is well-typed for any traveller fibration; the coherent-arrival axiom is what makes it useful.
The construction does **not** claim:

- that portal jumps actually occur in any physical multiverse (this is a structural definition, not a physical mechanism);
- that the destination world's state is *changed* by the jump (the jump produces a traveller-state in $\mathrm{Trav}(W_i)$, not a transformation of $W_i$ itself);
- that travellers can return — the formalism is one-directional via the chosen $\phi_i$, with no inverse postulated.

The [boundary primacy of traveller identity](../theorems/boundary-primacy-of-traveller-identity.md) theorem is what lifts the portal-morphism boundary condition to a statement about the identity of jumped travellers.

## Provenance

Translated from §4.2 ("Portal Jump") and §4.3 ("Coherent Arrival") of [`wood-between-worlds.md`](../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relating/triage/provenance/math-from-relationality-bucket/wood-between-worlds.md).
