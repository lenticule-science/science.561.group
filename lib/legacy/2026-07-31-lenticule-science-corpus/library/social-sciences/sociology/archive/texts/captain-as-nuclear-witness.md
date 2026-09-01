---
id: captain-as-nuclear-witness
description: "Formal treatment of scope singularity, anti-override, and non-delegability as three faces of the captain's position as the unique doubly-stable witness in the relational universe."
type: text
addresses: captain
date-created: 2026-03-29
---

This text gives the formal mathematical treatment of the [captain](../../militarism/terms/captain.md) concept. The three defining properties — scope singularity, anti-override authority, and non-delegable duties — are all answered by the same underlying structure: the captain's position in the fiber as the unique doubly-stable witness.

## Non-delegable duties as unique H* witnesses

A duty $d$ is non-delegable when its discharge requires the captain $c$ specifically:

$$\mathrm{discharged}(d) \iff \sigma_t(\varphi_d(c)) = \varphi_d(c) \;\wedge\; \Delta_t(\varphi_d(c)) = \varphi_d(c)$$

and substituting another agent $c'$ for $c$ does not produce $\varphi_d(c') \in H^*_t$ under the governing normative system.

Delegation does not transfer accountability because delegating to $c'$ gives $\varphi_d(c')$, which is outside RelationalHistoryFixedFiber: it may be σ-settled (recognized as having occurred) but not Δ-settled (forward-active as having been discharged by the right party). Future extensions of the history can always revisit whether $c'$ was the correct party, whereas $c$'s performance is Δ-fixed — no future extension can re-open that question.

## Scope singularity as history separation

Scope singularity (no two captains share the same scope simultaneously) is history separation at the command level: no two command positions within the same institutional history have constitutionally identical fibers.

At the ground level this is an imposed condition — the RelationalHistoryFixedPresheafAutomorphismRigidityAxiom requires it as an axiom. At the automorphic directed comonad level (a mature institution at hull level), scope singularity becomes a theorem: the aperiodicity of the quasicrystalline constitutional fiber guarantees that for any two command positions $v_1 \neq v_2$, their fiber algebras at $v_1$ and $v_2$ are non-isomorphic. No permutation of command histories maps one command scope to another. The scope $S$ is uniquely the captain's not by stipulation but because the institution's constitutional structure is aperiodic.

## Anti-override authority as infrastructure dependency direction

The infrastructure spec (Invariant 7): "The only morphisms between P and S are those of π (going from P toward S). There are no morphisms from S into P."

Applied to the captain's scope: $S$ (the captain's domain) is the substrate; external normative claims from superiors, commercial principals, and other parties constitute the practice $P$ that the scope enables. The anti-override domain $\Pi \subseteq \mathrm{Dom}(S)$ is the sub-domain from which no morphisms flow inward from $P$ — external parties cannot override decisions within $\Pi$ because the dependency direction is outward only.

A superior wishing to exercise authority within $S$ must perform a new installation act $I'$ and assume command — converting themselves from $P$-level into $S$-level. The anti-override protection is the structural consequence of the infrastructure dependency direction: authority flows from the command scope outward, never from outside the scope inward.

| Infrastructure role | Captain reading | Direction |
|---|---|---|
| Substrate $S$ | Captain's operational scope | Defines enabling conditions |
| Practice $P$ | External normative claims | Must project onto $S$ via $\pi$; cannot morphism into $S$ |
| Enabling projection $\pi$ | Installation act $I$ | The morphism $P \to S$ that constitutes command |
| Dependency direction | Anti-override protection | No morphisms from $P$ into $S$ within $\Pi$ |
| Installed-base order $\preceq$ | Voyage history order $T$ | Past command decisions restrict forward fiber coherence |

## Proposition

All three invariants are instances of the same formal condition: the captain's command section $K \in$ RelationalHistoryFixedFiber at the focal history $t^*$ is:

1. **Aperiodically unique** — no permutation of the institutional history maps $K$ to an isomorphic copy at another command position (scope singularity = history separation)
2. **An infrastructure substrate** — external parties are in the practice layer and must project onto $S$ via installation to gain authority (anti-override = infrastructure dependency direction)
3. **The unique H*-witness** for each non-delegable duty — the doubly-stable proposition $\varphi_d(K)$ that only $K$'s occupancy produces (non-delegability = uniqueness of the doubly-stable section)

*Source.* History separation at automorphic directed comonad level from Relational Universe Automorphic Directed Comonad History Separation §Theorem for $d \geq 1$. Infrastructure dependency direction from Infrastructure §Seven Invariants, Invariant 7. Non-delegability characterization formalized from existing nuclear machinery. $\square$
