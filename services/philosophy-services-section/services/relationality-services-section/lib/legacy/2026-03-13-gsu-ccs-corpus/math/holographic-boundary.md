---
id: holographic-boundary
name: HolographicBoundary
description: "the subobject classifier Ω of the bulk topos R is isomorphic to the double-negation subtopos of the boundary Phase."
---

### Conjecture — Holographic Boundary {#holographic-boundary}

**Statement.** Let $R = \mathbf{Sh}(T, J)$ be a relational universe and $\mathsf{Phase}$ its Invariant Locale (§invariant-locale). The subobject classifier $\Omega_R$ of the bulk topos $R$ (§ambient-topos) is isomorphic to the object of opens of the double-negation subtopos $\mathbf{Sh}_{\neg\neg}(T, J)$:
$$
\Omega_R \;\cong\; \mathsf{Phase}_{\neg\neg}
$$
where $\mathbf{Sh}_{\neg\neg}(T, J)$ is the full subtopos of $R$ on which the double-negation topology $j = \neg\neg$ is trivial — i.e., the Boolean shadow of $R$.

**Motivation.** The stable sub-algebra $H^* = \mathrm{Fix}(\sigma) \cap \mathrm{Fix}(\Delta)$ at each fiber is the Boolean part of the fiber algebra. The Invariant Locale $\mathsf{Phase} = H^*_R$ is the global stable part. The double-negation topology on a Heyting algebra forces every proposition to Boolean: $\neg\neg a = a$. The subtopos fixed by $j = \neg\neg$ is the classical shadow of $R$.

The conjecture asserts that the logic of the bulk is fully encoded in the Boolean logic of the boundary: every sub-sheaf of $R$ is classified by the stable boundary, not by any purely internal Heyting structure that fails to stabilize. The boundary is not merely a place — it is the fixed point where the logic becomes classical, and that fixed point classifies everything in the bulk.

This is a topos-theoretic formulation of the holographic principle: bulk = boundary + entanglement structure; the subobject classifier is where the bulk and boundary meet.

**What a proof requires.**

1. Identify $\Omega_R$ explicitly in terms of the fiber algebras. In $\mathbf{Sh}(T,J)$, the subobject classifier $\Omega$ assigns to each history $t$ the set of $J$-sieves on $t$. Relate this to $H^*_t$.

2. Show that the double-negation topology $j = \neg\neg$ on $R$ has fixed-point sheaves exactly $\mathsf{Phase}$. This is a standard result for the double-negation subtopos; the content here is identifying $\mathsf{Phase}$ with the double-negation closure.

3. Construct the isomorphism $\Omega_R \cong \mathsf{Phase}_{\neg\neg}$ explicitly.

**Depends on:** §ambient-topos, §invariant-locale, §stable-doctrine.
