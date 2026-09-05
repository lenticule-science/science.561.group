---
type: theorem
status: proved
depends-on: [gauge-connection, predication-fibration, predication-hyperdoctrine, predicate-category, klein-four-gauge-bundle, internal-z2-gauge]
see-also: [gauge-connection, gauge-twisted-reindexing, twisted-beck-chevalley, equivariant-cohomology-decomposition, curvature-from-pseudo-functorial-connections]
---

# Flat gauge connections classified by $H^1(N\mathcal{C}, K_4)$

The moduli of [gauge connections](../objects/gauge-connection.md) on a [predication hyperdoctrine](../objects/predication-hyperdoctrine.md) modulo gauge equivalence is canonically isomorphic to the first Čech cohomology of the nerve of the predicate category with constant coefficients $K_4$.

## Statement

**Theorem.** *Let $p : \mathcal{E} \twoheadrightarrow \mathcal{C}$ be a predication hyperdoctrine over $(\mathbf{L}, \mathcal{C}, E)$ with $\mathbf{L} = \mathbf{2}$, and let $K_4 = \mathrm{Aut}(\mathbf{FOUR})$ be the gauge group. There is a canonical bijection*

$$\mathcal{M}_{\mathcal{G}}(p) \;:=\; \mathrm{Fun}(\mathcal{C}, BK_4) \,/\, \mathrm{nat.\ iso.} \;\;\xrightarrow{\;\;\cong\;\;}\;\; H^1(N\mathcal{C}, \underline{K_4})$$

*where the right side is the first cohomology of the nerve $N\mathcal{C}$ (a simplicial set) with constant local-coefficient sheaf $\underline{K_4}$.*

*Equivalently, $\mathcal{M}_{\mathcal{G}}(p)$ is the set of group homomorphisms $\pi_1(\mathcal{C}, q_0) \to K_4$ modulo conjugation by $K_4$ — and since $K_4$ is abelian, modulo nothing — for any chosen base object $q_0 \in \mathcal{C}$ in each connected component of $\mathcal{C}$ (taken disjointly across components).*

## Proof

The argument is the standard classification of $G$-bundles on a category for $G$ abelian, applied to $G = K_4$ and the category $\mathcal{C}$.

**Step 1: connections as functors.** A [gauge connection](../objects/gauge-connection.md) is by definition a functor $A : \mathcal{C} \to BK_4$. The set of such functors is $\mathrm{Fun}(\mathcal{C}, BK_4)$.

**Step 2: gauge equivalence is natural isomorphism.** A natural transformation $\eta : A \Rightarrow A'$ between two functors $A, A' : \mathcal{C} \to BK_4$ consists of, for each $q \in \mathrm{Ob}(\mathcal{C})$, a $K_4$-element $\eta_q$ (the component at the unique object of $BK_4$), making the naturality square commute:

$$\eta_p \cdot A(f) \;=\; A'(f) \cdot \eta_q \qquad \text{for all } f : q \to p.$$

Solving for $A'(f)$: $A'(f) = \eta_p \cdot A(f) \cdot \eta_q^{-1}$. This is exactly the gauge-equivalence relation in [gauge-connection](../objects/gauge-connection.md). Every $\eta$ is automatically invertible since $K_4$ is a group, so natural transformations are natural isomorphisms.

Hence $\mathrm{Fun}(\mathcal{C}, BK_4)/\mathrm{nat.\ iso.} = \mathcal{M}_{\mathcal{G}}(p)$.

**Step 3: identification with $H^1$.** For any small category $\mathcal{C}$ and any abelian group $G$, the standard categorical-cohomology computation gives

$$\mathrm{Fun}(\mathcal{C}, BG) \,/\, \mathrm{nat.\ iso.} \;\cong\; H^1(N\mathcal{C}, \underline{G}).$$

Specifically: a functor $\mathcal{C} \to BG$ is a normalized $G$-valued 1-cocycle on the simplicial nerve $N\mathcal{C}$ (the cocycle condition $\delta A = 0$ on a 2-simplex $f, g$ — i.e. on a composable pair — is $A(g)A(f)A(g \circ f)^{-1} = e$, which is exactly (C2)). A natural transformation between two functors is a 0-cochain $\eta$ with $A' = A \cdot \delta\eta$, i.e., $A$ and $A'$ differ by a coboundary. The quotient is $Z^1/B^1 = H^1$.

The local coefficients are constant because $A$ takes values in $BG$ (one object), so the fiber over every $q \in \mathcal{C}$ is the same group $G$. For non-constant local systems one would replace $BG$ by a more general fibered category; here we stay in the constant-coefficient setting.

For abelian $G$, $H^1(N\mathcal{C}, \underline{G})$ further identifies with $\mathrm{Hom}(H_1(N\mathcal{C}), G)$ by the universal-coefficient theorem, and $H_1(N\mathcal{C})$ is the abelianization of the fundamental groupoid of $\mathcal{C}$. Choosing a basepoint $q_0$ in each component, this becomes $\bigoplus_i \mathrm{Hom}(\pi_1(\mathcal{C}_i, q_0)^{\mathrm{ab}}, K_4) = \bigoplus_i \mathrm{Hom}(\pi_1(\mathcal{C}_i, q_0), K_4)$ (the abelianization is automatic since $K_4$ is abelian). $\square$

## Specializations

**Tree-shaped predicate categories.** When $\mathcal{C}$ is a tree (no nontrivial loops) — e.g., a finite predicate category built from a single chain of [specializations](../morphisms/predicate-specialization.md) — $\pi_1(\mathcal{C}, q_0) = 1$ for every component, so $H^1(N\mathcal{C}, \underline{K_4}) = 0$. Every connection is gauge-equivalent to the trivial one. No non-trivial gauge content exists at this level of $\mathcal{C}$; the only gauge structure is the fiberwise $K_4$ already present in the [Klein-four gauge bundle](../objects/klein-four-gauge-bundle.md).

**Predicate categories with non-trivial loops.** Whenever $\mathcal{C}$ admits a non-trivial loop — for instance a [converse](../morphisms/predicate-converse.md) followed by a converse, or a specialization-converse-projection cycle — the holonomy around that loop is a non-trivial $K_4$-invariant of the connection. Such loops exist in any predicate category over an entity set $E$ with $|E| \geq 2$ that includes both subject- and object-projections together with converse: the round-trip through the four generators on a binary predicate produces a non-trivial automorphism of the source predicate.

**Single-predicate fundamental group.** For $\mathcal{C}$ generated by the four [predicate-category](../objects/predicate-category.md) generators on a single binary predicate $p$ with $\mathrm{dom}(p) \subseteq E \times E$, the loops at $p$ are generated by $\mathrm{converse} \circ \mathrm{converse} = \mathrm{id}$ and by closed paths through subject/object projections. The fundamental group is computed in [predicate-generator-composition-table](predicate-generator-composition-table.md) and turns out to be a finite group for finite $E$; the gauge moduli is then $\mathrm{Hom}(\pi_1, K_4)$, a finite set.

## Discussion

The result is the kinematical classification: it tells us *what flat connections exist* up to gauge equivalence, on any predication hyperdoctrine. Computing $\pi_1(\mathcal{C})$ for the predicate categories that arise in concrete corpus constructions (e.g., for the [bitopological settling site](../objects/bitopological-settling-site.md)'s underlying $\mathcal{C}$) is the next step toward identifying which gauge sectors are realizable.

Two consequences worth marking:

- *Triviality is generic at small scales but not at large.* Local pieces of $\mathcal{C}$ are tree-shaped, so locally only the trivial connection exists. Non-trivial gauge structure is genuinely a global feature of the predicate category — it lives in $\pi_1(\mathcal{C})$, not in any local fiber.
- *Klein-four is small but non-trivial.* $K_4 \cong \mathbb{Z}/2 \times \mathbb{Z}/2$ has 16 elements in its second cohomology with itself, and $H^1(\pi_1, K_4)$ can be substantial whenever $\pi_1$ has non-trivial $\mathbb{Z}/2$-quotients. The classification is thus rich enough to be interesting but small enough to compute exactly.

The $H^1$ classification is the gauge-theoretic kinematics; the dynamics — how the connection interacts with the [closure 2-monad](../morphisms/closure-2-monad.md) and the [settling cohomology](../objects/settling-cohomology.md) — is the subject of [twisted Beck–Chevalley](twisted-beck-chevalley.md) and the open question on twisted equivariant cohomology.
