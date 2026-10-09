---
type: example
status: verified
depends-on: [gauge-connection, flat-connections-classified-by-h1, twisted-beck-chevalley, predicate-category, predicate-converse, predicate-generator-composition-table, four-bilattice, klein-four-gauge-bundle, internal-z2-gauge, negation, conflation]
instantiates: [gauge-connection, flat-connections-classified-by-h1, twisted-beck-chevalley]
lineage: 2
---

# Converse-loop predicate category — exact gauge moduli $\mathcal{M}_\mathcal{G} = K_4$

The smallest predicate category exhibiting non-trivial gauge content. Computes the moduli of [gauge connections](../objects/gauge-connection.md) end-to-end, identifies the four classes explicitly, and locates each one with respect to the [$\leq_k$-axis twisted Beck–Chevalley](../theorems/twisted-beck-chevalley.md) theorem (which covers two classes) versus the open question (which contains the other two).

## What is being instantiated

- [gauge connection](../objects/gauge-connection.md) — full enumeration of the four gauge-equivalence classes on the smallest non-trivial $\mathcal{C}$.
- [flat connections classified by $H^1$](../theorems/flat-connections-classified-by-h1.md) — the bijection $\mathcal{M}_\mathcal{G}(p) \cong \mathrm{Hom}(\pi_1(\mathcal{C}), K_4)$ specialized to $\pi_1 = \mathbb{Z}/2$.
- [$\leq_k$-axis twisted Beck–Chevalley](../theorems/twisted-beck-chevalley.md) — concrete demonstration that two of the four classes are inside its scope, two are outside.

## The construction

**Entity set.** $E = \{a, b\}$.

**Predicate set.** $\Pi = \{p\}$ with $p$ a single binary predicate, $\mathrm{dom}(p) = E \times E = \{(a,a), (a,b), (b,a), (b,b)\}$. The full-domain choice ensures $p^c = p$: the converse-index map $(s, o) \mapsto (o, s)$ stabilizes $\mathrm{dom}(p)$, so converse is an *endomorphism* of $p$ in the [predicate category](../objects/predicate-category.md), not a morphism between distinct predicates.

**Predicate category.** $\mathrm{Ob}(\mathcal{C}) = \Pi = \{p\}$. The morphism set is computed from the four-generator inventory restricted to a single full-domain predicate:

- *Specialization* $f : p \to p$ requires $\mathrm{dom}(p) \subseteq \mathrm{dom}(p)$, contributing only $\mathrm{id}_p$.
- *Converse* $c : p^c \to p = p \to p$ contributes the non-trivial endomorphism $c$.
- *Subject-projection* $f : q \to p$ requires a source predicate $q$ with $\mathrm{dom}(q) \subseteq \Delta_E$; no such $q$ exists in $\Pi$, so this generator class is empty.
- *Object-projection* — symmetric, also empty.

(Projection generators are morphisms in $\mathcal{C}$ between distinct named predicates: each one constructs a *new* predicate object whose values broadcast from a source predicate's diagonal. With only one predicate in $\Pi$, no such target exists, so the generators contribute no morphisms — not because the index-maps fail, but because the predicate-set is too sparse to host them.)

The composition $c \circ c$ acts on indices by $(s,o) \mapsto (o,s) \mapsto (s,o)$, the identity on $E \times E$, so $c \circ c = \mathrm{id}_p$ directly — no appeal to the [generator composition table](../theorems/predicate-generator-composition-table.md) is needed (that theorem is stated for $|E| \geq 3$, but the converse-converse identity is a two-line index-map computation valid for any $|E|$). Hence

$$\mathrm{Mor}(\mathcal{C}) \;=\; \{\mathrm{id}_p,\, c\}, \qquad c^2 = \mathrm{id}_p,$$

and $\mathcal{C}$ is exactly the one-object category $B(\mathbb{Z}/2)$ with $c$ as the non-identity generator. The geometric realization $|N\mathcal{C}|$ is $B(\mathbb{Z}/2) \simeq \mathbb{RP}^\infty$, so

$$\pi_1(\mathcal{C}, p) \;=\; \mathbb{Z}/2 \;=\; \langle [c] \rangle.$$

**Predication fiber.** The fiber algebra at $p$ is $A_p = \mathbf{FOUR}^{E \times E} = \mathbf{FOUR}^4$. The [Klein-four gauge bundle](../objects/klein-four-gauge-bundle.md) trivializes as $K_4 \times A_p$.

## The computation

**Step 1: gauge moduli as homomorphisms.** By [flat connections classified by $H^1$](../theorems/flat-connections-classified-by-h1.md),

$$\mathcal{M}_\mathcal{G}(\mathcal{C}) \;=\; \mathrm{Fun}(\mathcal{C}, BK_4) \,/\, \mathrm{nat.\ iso.} \;\cong\; \mathrm{Hom}(\pi_1(\mathcal{C}), K_4) \,/\, \mathrm{conj}_{K_4}.$$

Since $K_4$ is abelian, conjugation is trivial. So $\mathcal{M}_\mathcal{G}(\mathcal{C}) = \mathrm{Hom}(\mathbb{Z}/2, K_4)$.

**Step 2: enumerate $\mathrm{Hom}(\mathbb{Z}/2, K_4)$.** A homomorphism $\phi : \mathbb{Z}/2 \to K_4$ is determined by $\phi(c) \in K_4$ subject to $\phi(c)^2 = e$. Since every element of $K_4 = \{e, \sim, -, \sim\circ-\}$ satisfies $g^2 = e$ (it is the Klein four-group, an elementary abelian 2-group), every $\phi$ is admissible. Hence

$$|\mathcal{M}_\mathcal{G}(\mathcal{C})| \;=\; |K_4| \;=\; 4.$$

**Step 3: identify the four classes.** The four gauge-equivalence classes correspond bijectively to the four elements of $K_4$ via "holonomy of the converse loop":

| class | $A(c) \in K_4$ | name | scope of [$\leq_k$-axis twisted BC](../theorems/twisted-beck-chevalley.md) |
|---|---|---|---|
| $[A_0]$ | $e$ | trivial | covered (vacuously: $A(c) = e$ commutes with everything) |
| $[A_{\sim}]$ | $\sim$ | internal-$\mathbb{Z}/2$ holonomy | **covered**: $A$ is $K_4^{\,k}$-valued |
| $[A_{-}]$ | $-$ | conflation holonomy | open: $A$ is $K_4^{\,t}$-valued (extension-by-$\bot$ obstruction) |
| $[A_{\sim\circ-}]$ | $\sim\circ-$ | combined holonomy | open: $A$ involves both order-reversal and extension-value migration |

**Step 4: verify the cocycle condition.** For each class, check $A(c \circ c) = A(c) \cdot A(c)$:

$$A_g(c)^2 \;=\; g^2 \;=\; e \;=\; A_g(\mathrm{id}_p) \quad \text{for all } g \in K_4.$$

The 1-cocycle condition (C2) holds for every $A_g$. By [flat connections classified by $H^1$](../theorems/flat-connections-classified-by-h1.md) Step 3, this is the only non-trivial cocycle relation in $\mathcal{C}$.

**Step 5: verify gauge-equivalence classes are singletons.** A natural isomorphism $\eta : A_g \Rightarrow A_{g'}$ consists of one element $\eta_p \in K_4$ with $\eta_p \cdot A_g(c) = A_{g'}(c) \cdot \eta_p$. Since $K_4$ is abelian, this reduces to $A_g(c) = A_{g'}(c)$, i.e. $g = g'$. Hence each gauge-equivalence class contains exactly one $A_g$. The moduli has exactly 4 isolated points, no continuous deformation.

**Step 6: classify by twisted-BC scope.** By the [$\leq_k$-axis twisted Beck–Chevalley](../theorems/twisted-beck-chevalley.md) theorem, the twisted reindexing $f^*_A$ extends $\leq_k$-Beck–Chevalley iff $A$ is $K_4^{\,k}$-valued, i.e. $A(c) \in \{e, \sim\}$. So the moduli partitions as

$$\mathcal{M}_\mathcal{G}(\mathcal{C}) \;=\; \underbrace{\{[A_0], [A_\sim]\}}_{\text{covered by $\leq_k$-axis BC}} \;\sqcup\; \underbrace{\{[A_-], [A_{\sim\circ-}]\}}_{\text{open: see [curvature question](questions/curvature-from-pseudo-functorial-connections.md)}}.$$

The two open classes are not pathologies but explicit instances of the obstructions catalogued in the open question:

- $[A_-]$: the converse loop carries holonomy $- \in K_4^{\,t}$. The cellwise conflation acts on values; on the four cells of $A_p = \mathbf{FOUR}^4$ this is $v \mapsto -v$ pointwise. The twisted reindexing $c^*_{A_-}(v)(s, o) = -v(o, s)$ is $\leq_t$-monotone but $\leq_k$-antitone, so it does not have a $\leq_k$-adjoint in the standard sense. The $\leq_t$-adjoint exists in principle but the BC reduction breaks because converse has full domain — *this* example escapes the extension-by-$\bot$ obstruction (no outside-support cells), but the next non-trivial one (with non-trivial specialization) will not.
- $[A_{\sim\circ-}]$: holonomy reverses both orders simultaneously and involves $-$, so the same obstructions stack.

## What this example illustrates

Three things at once:

1. **The classification is non-vacuous.** The $H^1$-bijection of [flat connections classified by $H^1$](../theorems/flat-connections-classified-by-h1.md) is not an empty existence statement — for the smallest predicate category that admits any non-trivial gauge content at all, the moduli is computed exactly and equals $K_4$.

2. **Half the moduli is on solid ground, half is open territory.** Two of the four classes ($[A_0]$ and $[A_\sim]$) sit inside the $K_4^{\,k}$-axis where [twisted Beck–Chevalley](../theorems/twisted-beck-chevalley.md) is proved. The other two ($[A_-]$ and $[A_{\sim\circ-}]$) sit in the open territory of the [curvature question](questions/curvature-from-pseudo-functorial-connections.md). The example concretizes both regions.

3. **Even the trivial-looking smallest case has structural content.** A single predicate over two entities, with no closure rules, no specialization morphisms, no projections — just the converse generator — already produces a $\mathbb{Z}/2$ fundamental group and a $K_4$-valued moduli. Gauge content is generic in $\mathcal{C}$; it appears the moment any predicate has its converse equal to itself, which happens whenever the predicate has a symmetric domain.

The next examples in this lineage will scale up: $|E| \geq 2$ with multiple predicates produces predicate categories with longer fundamental loops (specialization–converse–projection cycles), and the moduli grows accordingly. The converse-loop case here is the "atom" of the gauge story.

## Position in Lineage 2

L2 instance, exhibits the gauge-classification machinery on the simplest non-trivial $\mathcal{C}$. Foundation for the planned twisted equivariant cohomology decomposition example, which will need a concrete connection class to twist a settling-associated sheaf by; $[A_\sim]$ is the natural test input.
