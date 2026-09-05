---
id: hyperdoctrine
name: Hyperdoctrine
description: "A hyperdoctrine over C is a Heyting doctrine D : C^op → HA where every substitution map D(f) has both a left adjoint (existential) and a right adjoint (universal) satisfying Beck-Chevalley; derived from the canonical hyperdoctrine Sub_R of the topos R"
---

### Definition — Hyperdoctrine {#hyperdoctrine}

The topos $R = \mathbf{Sh}(T,J)$ (§ambient-topos) carries an internal logic. Every
object $F \in R$ has a Heyting algebra of **subobjects**:
$$
\mathrm{Sub}_R(F) \;:=\; \text{(isomorphism classes of monomorphisms into } F \text{ in } R),
$$
ordered by inclusion of subobjects. Every morphism $f : F \to G$ in $R$ induces a
**substitution map**
$$
f^* : \mathrm{Sub}_R(G) \longrightarrow \mathrm{Sub}_R(F)
$$
by pullback along $f$. This is a Heyting algebra homomorphism, giving a Heyting
doctrine (§doctrine) $\mathrm{Sub}_R : R^{\mathrm{op}} \to \mathbf{HA}$.

But $\mathrm{Sub}_R$ carries more structure than a doctrine: for each morphism $f : F \to G$
the substitution map $f^*$ has **both** a left adjoint and a right adjoint:
$$
\exists_f \dashv f^* \dashv \forall_f,
$$
where $\exists_f(S) = \mathrm{image}(f|_S)$ (existential quantification along $f$) and
$\forall_f(S) = \{x \in G \mid f^{-1}(x) \subseteq S\}$ (universal quantification along
$f$). Both satisfy the **Beck-Chevalley condition**: for every pullback square
$$
\begin{array}{ccc}
F' & \xrightarrow{f'} & G' \\
\downarrow{p} & & \downarrow{q} \\
F & \xrightarrow{f} & G
\end{array}
$$
in $R$, the canonical natural transformations $\exists_{f'} \circ p^* \cong q^* \circ \exists_f$
and $\forall_{f'} \circ p^* \cong q^* \circ \forall_f$ are isomorphisms. This holds because
$R$ is a topos (Grothendieck 1964; Johnstone, *Sketches of an Elephant* A1.3).

**Definition.** A **hyperdoctrine** over a category $C$ is a Heyting doctrine
$D : C^{\mathrm{op}} \to \mathbf{HA}$ (§doctrine) such that for each morphism
$f : c \to c'$ in $C$, the substitution map $D(f) : D(c') \to D(c)$ has both a left
adjoint $\exists_f$ and a right adjoint $\forall_f$ satisfying the Beck-Chevalley
condition.

The functor $\mathrm{Sub}_R : R^{\mathrm{op}} \to \mathbf{HA}$ is the **canonical
hyperdoctrine** of the relational universe $R$.

#### The Distinction from the Fiber Doctrine {#hyperdoctrine-vs-doctrine}

The fiber doctrine $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ (§fiber-doctrine) is a
doctrine but not a hyperdoctrine: the restriction maps $H(f) : H_{t'} \to H_t$ do not
have quantifier adjoints in general. The fiber doctrine is the input to the construction
of $R$; the canonical hyperdoctrine $\mathrm{Sub}_R$ is the internal logic of $R$ that
results from that construction.

Sheafification promotes the fiber doctrine to an internal object $H \in R$. The
quantifiers $\exists$ and $\forall$ are then provided by the topos structure of $R$ —
they are not present at the fiber level and cannot be recovered from the fiber doctrine
alone. This is why the doctrine/hyperdoctrine distinction is load-bearing in this paper:
the fiber doctrine governs what propositions exist; the canonical hyperdoctrine governs
how they are quantified over once the geometry is in place.
