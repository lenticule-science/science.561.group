---

name: hull-directed-comonad
description: "the substitution comonad G_Sigma on Sh(Omega(Q^H)) — defined by pullback along the Fibonacci substitution homeomorphism — and the key structural difference from the ground-level step comonad: G_Sigma is an automorphism, not merely an endomorphism."
---

### Construction — Hull Directed Comonad {#hull-directed-comonad}

#### Construction {#hdc-construction}

The ground-level directed comonad (§directed-comonad) is $G_s(F)(t) = F(s \star t)$ — a left
shift of histories by a fixed step $s$. This is an endofunctor on $R$, but not an autofunctor:
the map $t \mapsto s \star t$ is injective (cancellative monoid) but not surjective (histories
shorter than $s$ are not in the image).

At the hull level, the role of "step $s$" is played by the Fibonacci substitution
$\Sigma : \Omega(Q^\mathcal{H}) \to \Omega(Q^\mathcal{H})$.

**Definition.** The **hull directed comonad** is the pullback functor
$$
G_\Sigma \;:=\; \Sigma^* \;:\; \mathbf{Sh}(\Omega(Q^\mathcal{H})) \;\longrightarrow\; \mathbf{Sh}(\Omega(Q^\mathcal{H})),
$$
defined by $G_\Sigma(\mathcal{F})(\mathcal{T}) = \mathcal{F}(\Sigma(\mathcal{T}))$ for a sheaf
$\mathcal{F}$ and a point $\mathcal{T} \in \Omega(Q^\mathcal{H})$.

**Counit.** Since $\Sigma(\mathcal{T})$ and $\mathcal{T}$ are both in $\Omega(Q^\mathcal{H})$
and $\Sigma$ is continuous, there is a canonical natural transformation
$$
\epsilon : G_\Sigma \;\longrightarrow\; \mathrm{Id}
$$
whose component at $\mathcal{F}$ is the map $G_\Sigma(\mathcal{F})(\mathcal{T}) = \mathcal{F}(\Sigma(\mathcal{T})) \to \mathcal{F}(\mathcal{T})$
induced by the hull topology: since $\Sigma$ is a homeomorphism, $\Sigma^{-1}$ pulls
germs at $\Sigma(\mathcal{T})$ back to germs at $\mathcal{T}$.

#### The Automorphism Property {#hdc-automorphism}

The critical structural difference from the ground-level comonad:

**Theorem.** $G_\Sigma$ is an autofunctor of $\mathbf{Sh}(\Omega(Q^\mathcal{H}))$.

**Proof.** The Fibonacci substitution $\Sigma : \Omega(Q^\mathcal{H}) \to \Omega(Q^\mathcal{H})$
is a homeomorphism. It is:
- *Injective*: Two distinct tilings $\mathcal{T} \neq \mathcal{T}'$ have $\Sigma(\mathcal{T}) \neq \Sigma(\mathcal{T}')$
  because the substitution rule is deterministic — $\Sigma(\mathcal{T})$ uniquely encodes $\mathcal{T}$
  via the unique Fibonacci decomposition (§hull-substitution-diamond).
- *Surjective*: Every tiling in $\Omega(Q^\mathcal{H})$ arises as $\Sigma(\mathcal{T})$ for some
  $\mathcal{T}$ — this is the statement that $\Omega(Q^\mathcal{H})$ is closed under deflation.
  Equivalently, every legal Fibonacci tiling is a valid substitution image (the hull consists
  exactly of legal tilings).
- *Bicontinuous*: $\Sigma$ and $\Sigma^{-1}$ are both continuous in the local topology on
  $\Omega(Q^\mathcal{H})$, since substitution and desubstitution are both local operations
  (they depend only on a bounded neighborhood of each point).

Therefore $G_\Sigma = \Sigma^*$ is an equivalence of categories $\mathbf{Sh}(\Omega) \simeq \mathbf{Sh}(\Omega)$,
with inverse $G_{\Sigma^{-1}} = (\Sigma^{-1})^*$. $\square$

#### Contrast with the Ground Level {#hdc-contrast}

At the ground level, $G_s(F)(t) = F(s \star t)$ is NOT an autofunctor:
- The map $t \mapsto s \star t$ is injective (left-cancellativity) but never surjective.
- $G_s$ has no inverse: there is no functor $G_s^{-1}$ satisfying $G_s^{-1} \circ G_s \cong \mathrm{Id}$.
- Consequently, the counit $\epsilon : G_s \to \mathrm{Id}$ is NOT an isomorphism — it is
  the restriction map from a longer history, which loses information.

The hull's dynamics are **reversible**: the Fibonacci substitution can always be undone
(unique desubstitution). The ground universe's dynamics are **irreversible**: steps cannot
be undone. This is the qualitative transition that the hull represents — the first level at
which the universe closure operator is invertible.

This is consistent with modal collapse (§modal-collapse): at $\mathcal{H}$, all nuclei are
trivial and all propositions are settled. A universe built on $\mathcal{H}$-valued data
inherits this settledness as reversibility — the dynamics have "run out" of irreversibility.

#### The $H^{\mathrm{hull}}$ Fixed Point {#hdc-fixed-point}

**Lemma.** The patch-lattice sheaf $H^{\mathrm{hull}}$ is a fixed point of $G_\Sigma$:
$$
G_\Sigma(H^{\mathrm{hull}}) \;\cong\; H^{\mathrm{hull}}.
$$

**Proof.** $G_\Sigma(H^{\mathrm{hull}})(\mathcal{T}) = H^{\mathrm{hull}}_{\Sigma(\mathcal{T})}$
is the patch lattice of the substituted tiling $\Sigma(\mathcal{T})$.

By §hyperversal-quasicrystal-hypertensor, the quasicrystal $Q^\mathcal{H}$ is a fixed point
of $\Sigma$: $\Sigma(Q^\mathcal{H}) \cong Q^\mathcal{H}$. The hull $\Omega(Q^\mathcal{H})$ is
the orbit closure, so all tilings in $\Omega$ are locally indistinguishable from $Q^\mathcal{H}$
and from each other (minimality, §hyperversal-quasicrystal-hull). Therefore, for any $\mathcal{T} \in \Omega$:

- The patch lattice of $\Sigma(\mathcal{T})$ consists of all local patterns appearing in
  $\Sigma(\mathcal{T})$.
- Since $\Sigma(\mathcal{T}) \in \Omega(Q^\mathcal{H})$ (the hull is $\Sigma$-invariant), and
  all tilings in $\Omega$ have the same local patterns (minimality), the patch lattice of
  $\Sigma(\mathcal{T})$ is isomorphic to the patch lattice of $\mathcal{T}$.

Hence $H^{\mathrm{hull}}_{\Sigma(\mathcal{T})} \cong H^{\mathrm{hull}}_\mathcal{T}$ for all
$\mathcal{T}$, giving $G_\Sigma(H^{\mathrm{hull}}) \cong H^{\mathrm{hull}}$. $\square$
