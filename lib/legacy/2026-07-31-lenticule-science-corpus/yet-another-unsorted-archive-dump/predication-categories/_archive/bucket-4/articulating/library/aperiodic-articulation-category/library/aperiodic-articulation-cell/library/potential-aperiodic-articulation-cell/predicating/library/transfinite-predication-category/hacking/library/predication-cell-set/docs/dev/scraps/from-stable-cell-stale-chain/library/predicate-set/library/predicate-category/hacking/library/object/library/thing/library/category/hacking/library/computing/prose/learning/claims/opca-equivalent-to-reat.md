---
type: claim
status: proved
depends-on:
  - ../code/structures/opca.md
  - ../code/structures/eff.md
  - ../code/transformers/applicative-morphism.md
see-also:
  - ../questions/what-is-the-theory-of-computing.md
references:
  - Hofstra-van Oosten 2003
  - van Oosten 2008
---

# oPCA is equivalent to ReaT

## Statement

The 2-category $\mathbf{oPCA}$ of ordered partial combinatory algebras and ordered applicative morphisms is equivalent (on morphisms) to the 2-category $\mathbf{ReaT}$ of realizability toposes and geometric morphisms: every geometric morphism $RT(A) \to RT(B)$ between realizability toposes arises from an ordered applicative morphism $A \to B$ in $\mathbf{oPCA}$, and two ordered applicative morphisms induce the same geometric morphism if and only if they are equivalent in the preorder enrichment of $\mathbf{oPCA}$.

The functor $RT: \mathbf{oPCA} \to \mathbf{TOP}$ is fully faithful on morphism-sets.

## Proof

Hofstra and van Oosten (2003). An *ordered PCA* $(A, \cdot, \leq)$ is a PCA with a preorder $\leq$ on $A$ such that application is monotone: $a \leq a',\; b \leq b' \Rightarrow a \cdot b \leq a' \cdot b'$ (wherever defined), and the combinators $k$ and $s$ serve as realizers for the monotonicity and substitution conditions.

An *ordered applicative morphism* $\gamma: (A, \leq_A) \to (B, \leq_B)$ is a monotone function from $A$ to $B$ tracked by a realizer $r \in B$ satisfying $r \cdot \gamma(a) \cdot \gamma(b) \leq_B \gamma(a \cdot b)$ wherever $a \cdot b$ is defined. This says: the image of a $\mathcal{K}_1$-application is bounded below by $\gamma$ applied to the result.

The key direction: given a geometric morphism $f: RT(A) \to RT(B)$, its inverse image functor $f^*$ must map $B$-assemblies to $A$-assemblies compatibly with the realizability structure. The compatibility condition forces $f^*$ to be induced by a monotone function $\gamma: A \to B$ that is tracked in the required sense — an ordered applicative morphism. Conversely, every ordered applicative morphism induces a geometric morphism in the standard way (van Oosten 2008, Chapter 3).

The plain functor $RT: \mathbf{PCA} \to \mathbf{TOP}$ (using unordered applicative morphisms) is not full on morphisms: there exist geometric morphisms between realizability toposes not induced by any plain applicative morphism. The order structure on the PCA is precisely what captures the additional geometric morphisms.

## Significance

The meta-level structure for realizability-based computational paradigms is $\mathbf{oPCA}$, not plain $\mathbf{PCA}$. Different computational paradigms (discrete computation, continuous computation, oracle computation) are ordered PCAs connected by ordered applicative morphisms; the corresponding realizability toposes are connected by geometric morphisms. The framework is complete for realizability: every morphism between realizability toposes is an $\mathbf{oPCA}$-morphism.

What this framework does not reach: interactive and nominal computing. The nominal-sets topos $\mathbf{Sets}^{\mathbf{I}}$ and game-semantic categories have no realizability structure and do not arise as $RT(A)$ for any PCA $A$. The $\mathbf{oPCA} \simeq \mathbf{ReaT}$ equivalence is complete within the realizability world but does not extend to those external structures.
