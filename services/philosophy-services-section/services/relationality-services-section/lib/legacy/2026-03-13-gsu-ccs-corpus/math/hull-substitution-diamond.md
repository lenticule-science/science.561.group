---
id: hull-substitution-diamond
name: HullSubstitutionDiamond
description: "the Fibonacci substitution has the diamond property on the patch lattice — any two one-step desubstitution paths from the same patch reach a common ancestor. Commutativity of sigma^Sigma and Delta^Sigma follows as a corollary."
---

### Theorem — Hull Substitution Diamond {#hull-substitution-diamond}

#### Unique Fibonacci Decomposition {#hsd-decomposition}

The Fibonacci substitution $\Sigma : S \mapsto L,\; L \mapsto LS$ is **uniquely
decodable**: every legal Fibonacci word $w$ of length $\geq 2$ has a unique decomposition
into $\Sigma$-blocks.

**Decoding rule.** Reading left to right: an $L$ at position $i$ with no $S$ at position
$i+1$ (or $i$ is the final position) decodes as $\Sigma(S) = L$; an $LS$ at positions
$i, i+1$ decodes as $\Sigma(L) = LS$. This is unambiguous at each step because:
- An isolated $L$ (not followed by $S$) can only be $\Sigma(S)$.
- An $LS$ pair can only be $\Sigma(L)$: $\Sigma(S) = L$ has no $S$ following it in the
  next block, and $\Sigma(S)\Sigma(S) = LL$ has two $L$s without an intervening $S$.

This deterministic left-to-right scan gives a unique factorization of every legal
Fibonacci word into $\Sigma$-blocks. $\square$

The same argument applies to finite patches in $\mathbb{N}^d$: a $d$-dimensional patch
$P$ decomposes uniquely into $\Sigma$-blocks in each coordinate direction simultaneously,
because the $d$ coordinate decompositions are independent (they depend on different
coordinates).

#### The Diamond Property {#hsd-diamond}

**Theorem (Substitution Diamond).** The Fibonacci substitution $\Sigma$ has the diamond
property on the patch lattice: any two one-step desubstitution operations from the same
patch $P$ reach a common patch $Q$.

More precisely: if $P \to_{\Sigma^{-1}} P_1$ and $P \to_{\Sigma^{-1}} P_2$ are two ways
of reading a $\Sigma$-block decomposition of a sub-region of $P$, then there exists $Q$
with $P_1 \to_{\Sigma^{-1}}^* Q$ and $P_2 \to_{\Sigma^{-1}}^* Q$.

**Proof.** By unique Fibonacci decomposition, any patch $P$ has a unique maximal
$\Sigma$-block decomposition — the unique reading of $P$ as a $\Sigma$-image. There is
therefore exactly one "full desubstitution" $Q$ of $P$. Any partial desubstitution $P_i$
(desubstituting only some blocks of $P$) must be completed to the same full desubstitution
$Q$. $\square$

The uniqueness of the full desubstitution makes the diamond trivial in one direction: there
is only one common descendant — it is the unique Fibonacci preimage of $P$.

#### Commutativity of $\sigma^\Sigma$ and $\Delta^\Sigma$ {#hsd-commutativity}

**Corollary (Hull Nucleus Commutativity).**
$\sigma^\Sigma_\mathcal{T} \circ \Delta^\Sigma_\mathcal{T} = \Delta^\Sigma_\mathcal{T} \circ \sigma^\Sigma_\mathcal{T}$.

**Proof.** By §hull-nucleus-pair, $\Delta^\Sigma_\mathcal{T}(P) = \Sigma^{-1}(P)$ (the unique
Fibonacci preimage of $P$, well-defined by the decomposition theorem). And $\sigma^\Sigma_\mathcal{T}$
satisfies the naturality condition with respect to $\Sigma$:

**Naturality of forcing.** $\sigma^\Sigma(\Sigma^{-1}(P)) = \Sigma^{-1}(\sigma^\Sigma(P))$.

*Proof of naturality.* The forcing relation "$P$ forces $P'$" depends only on the local
statistics of the quasicrystal: $P$ forces $P'$ iff $P'$ appears in a fixed radius around
every occurrence of $P$ in $Q^\mathcal{H}$. Applying $\Sigma^{-1}$ scales the patch by a
factor of $\varphi^{-1}$ (since $\Sigma$ inflates by $\varphi$). The local statistics of
$Q^\mathcal{H}$ are invariant under $\Sigma$ (the quasicrystal is a fixed point:
$\Sigma(Q^\mathcal{H}) \cong Q^\mathcal{H}$). Therefore: the forcing neighborhoods at scale
$r$ are the $\Sigma^{-1}$-images of the forcing neighborhoods at scale $\varphi r$.
Smallest-patch forcing is preserved:
$\sigma^\Sigma(\Sigma^{-1}(P)) = \Sigma^{-1}(\sigma^\Sigma(P))$. $\square$

Using naturality:
$$
\sigma^\Sigma(\Delta^\Sigma(P))
= \sigma^\Sigma(\Sigma^{-1}(P))
= \Sigma^{-1}(\sigma^\Sigma(P))
= \Delta^\Sigma(\sigma^\Sigma(P)).
$$
$\square$

#### The Diamond Structure at the Hull Level {#hsd-structure}

The substitution diamond (hull level) is the analog of the history-monoid diamond (ground
level). The parallel:

| Level | Diamond source | Commutativity status |
|-------|---------------|--------------------------|
| History monoid | Independent steps in $\mathbb{M}(\Sigma, I)$ commute | $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ — axiom of the fiber doctrine ([fiber-nucleus-commutation-axiom](fiber-nucleus-commutation-axiom.md)) |
| Hull | Unique Fibonacci decomposition | $\sigma^\Sigma \circ \Delta^\Sigma = \Delta^\Sigma \circ \sigma^\Sigma$ — proved above |

The ground-level diamond motivates but does not derive fiber nucleus commutativity, which
is imposed as a primitive axiom. The hull-level diamond, by contrast, directly proves
commutativity of the substitution nuclei via limit-interchange.

This establishes that the hull nucleus pair $(\sigma^\Sigma, \Delta^\Sigma)$ satisfies the
commutativity condition of the fiber doctrine (§fiber-doctrine). Combined with §hull-fiber-structure
(the fiber Heyting algebras) and §trivial-saturation-theorem (the full-commutativity degeneracy),
the hull topos satisfies the nuclear square condition at each fiber.
