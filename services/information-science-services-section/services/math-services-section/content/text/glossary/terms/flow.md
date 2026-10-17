---
name: Flow
description: "The directed motion of settling: a valuation carried forward as evidence arrives, saturated under closure and merged with each increment. Flowing twice goes no further than flowing once; flow resolves back to its origin, propagates into further flow, and preserves the boundaries of necessity and possibility."
aliases: [flows, flow counit, flow comultiplication, meta-flow, directed dynamics]
---
**Flow** is the directed motion of [settling](settling.md): a valuation carried forward as evidence arrives. In Obsmetrologia it is the settling endofunctor driven by an increment sequence, $F_U(v) = \mathrm{Cl}(v) \vee_k u_\tau$: saturate under consequences, then merge the new evidence ([`Dynamics/Flow/ClosureFlowDynamics.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Dynamics/Flow/ClosureFlowDynamics.lean)). The driven orbit is monotone in the knowledge order and continuous at limits when the value there is the directed join of what came before.

**Self-limiting.** Flowing twice goes no further than flowing once. The acts derivation states this as Kock–Zöberlein laxity of flow as a comonad; Obsmetrologia places the lax-idempotent structure on the closure, whose 2-monad is KZ and which on the knowledge order is strictly idempotent (`kz_iff_strict`, [`Closure/Monad.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Closure/Monad.lean)). Either way directed evolution converges instead of compounding.

**Resolution and propagation.** Read as a comonad, flow has a counit, **resolution**, projecting a directed process back to its origin, and a comultiplication, **propagation**, viewing a directed process as containing further directed processes within it. Its coalgebras are the configurations stable under flow; a settling-equipped predication hyperdoctrine is a coalgebra for the settling endofunctor ([`Closure/Coalgebra.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Closure/Coalgebra.lean)). **Meta-flow** is the same structure one level up: the directed motion of a whole system, with system-level resolution and propagation.

**Preserving the modal core.** Flow respects the boundaries of necessity and possibility: what must be stays stable under flow, and what may be stays reachable. Evolution that broke this [balance](closure-operator.md) would break coherence.

## Flow-indexed implication

Implication moves with flow: $F(a \wedge b) \le c \iff a \le F(b \Rightarrow c)$, "if this now, then that later". Logical reasoning stays valid under process application, which is lax monoidal preservation of implication; the static case is ordinary [residuation](heyting-implication.md), and the same shape through a closure is the [nucleus](nucleus.md)'s residuation.

## Stable envelope under flow

The envelope of a state under flow is the overlap of what must hold after flowing and what can hold after flowing, $\mathrm{Env}_F(a) = \Box F(a) \wedge \Diamond F(a)$: the bandwidth within which a state can vary under flow and stay coherent under both closing and opening. Every conserved observable factors through it, and transport under flow carries a state's envelope into the envelope of its image; the relational action accumulates coherence measured on the envelope of the evolving state, and the actual evolution is the one that extremizes it. (The nucleus-level envelope is in [nucleus](nucleus.md).)

## Flow and nucleus

Flow commutes with the [nucleus](nucleus.md): transforming then consolidating equals consolidating then transforming. In the acts derivation flow is where observation's flow meets judgement's flow, fixing flow along a stabilized trace gives its fixed sets and fixed point, and the commutation of flow with nucleus is geometry.

## Related

- [Settling](settling.md)
- [Nucleus](nucleus.md)
- [Closure operator](closure-operator.md)
- [Modal logic](modal-logic.md)
