---

name: self-generation
description: "Least Fixed Point"
---

### Theorem — Least Fixed Point {#self-generation}

> **Axiom–Theorem boundary.** This is the point at which the axioms become provable properties of
> $R$ rather than conditions imposed from outside. From here forward, all claims are theorems about
> the constructed object $R$, not further axioms.

Up to isomorphism of objects,
$$
\mathrm{Obj}(R) \;=\; \mathrm{Obj}(R_{\mathrm{gen}}).
$$
Equivalently: $\mathrm{Obj}(R_{\mathrm{gen}})$ is the least $U_G$-closed subclass of
$\mathrm{Obj}(R)$ containing the atoms $A$, and it coincides with the full class of objects of $R$.

**Proof.**

*(1) $\mathrm{Obj}(R)$ is $U_G$-closed and contains $A$.* By construction, $R = \mathbf{Sh}(T,J)$ is
closed under all the conditions (2)–(7) of the $U_G$ definition — these are precisely the standard
closure conditions for Grothendieck toposes. It contains all representables and $H$, so $A \subseteq
\mathrm{Obj}(R)$.

*(2) Minimality of $\mathrm{Obj}(R_{\mathrm{gen}})$.* By definition, $\mathrm{Obj}(R_{\mathrm{gen}})$
is the intersection of all $U_G$-closed subclasses containing $A$. Since $\mathrm{Obj}(R)$ is such
a subclass, $\mathrm{Obj}(R_{\mathrm{gen}}) \subseteq \mathrm{Obj}(R)$.

*(3) Every object of $R$ is generated from atoms.* The density theorem for Grothendieck toposes states
that the representables $\{y(t)\}_{t \in T}$ form a small dense generating set of $R$: every object
is a small colimit of representables (Johnstone, *Sketches of an Elephant*, Theorem C2.2.7).
Representables lie in $A$, and $U_G$ is closed under arbitrary small colimits (condition 3). Since
every sheaf can be built from representables using the closure operations of $U_G$, we have
$\mathrm{Obj}(R) \subseteq \mathrm{Obj}(R_{\mathrm{gen}})$.

Combining both inclusions: $\mathrm{Obj}(R) = \mathrm{Obj}(R_{\mathrm{gen}})$. $\square$

**Interpretation.** Given the history site, the representables, $H$, and the allowed constructions,
you generate exactly the objects of $R$ and nothing more. There is no additional structure in $R$
outside the reach of $U_G$.

**Remark — The density theorem and the ground case.** The theorem above is the Grothendieck
density theorem restated in the language of this paper: the representables generate $R$ under
colimits, and $U_G$-closure under the standard topos constructions recovers the whole topos.
This is not a novel dynamical claim; it is the standard fact that a Grothendieck topos is the
least full reflective subcategory of its presheaf category containing the representables.

The notation $R = U_G(R)$ records that $R$ satisfies its own closure conditions. The same
pattern is expected to recur at the universe level: the Relational Hyperverse should satisfy
$\mathcal{H} = U_{\mathcal{H}}(\mathcal{H})$ (§hyperverse-fixed-point). That is a
separate and substantially harder claim, and the present theorem is only its ground case.
