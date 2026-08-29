---

name: directed-comonad
description: "The Directed Comonad"
defines: DirectedComonad
---

### Construction — The Directed Comonad {#directed-comonad}

The history convolution $\circledast$ encodes concurrent composition. What is missing is sequential
composition — the process of extending a proposition forward along one more history step and then
forgetting the step. Fix a single step $s \in \mathrm{Ob}(T)$. Define:
$$
G_s : R \longrightarrow R,
\qquad
G_s(F)(t) \;:=\; F(s \star t).
$$

**Counit.** The prefix order gives a unique morphism $i_t : t \to s \star t$ in $T$ (since
$t \leq s \star t$). Because $F$ is contravariant, this induces
$$
\epsilon_F(t) \;:=\; F(i_t) \;:\; F(s \star t) \to F(t)
$$
— restriction to the shorter prefix. This defines a natural transformation $\epsilon : G_s \to
\mathrm{Id}_R$.

**Comultiplication.** The comultiplication $\nu : G_s \to G_s \circ G_s$ — a natural
transformation $\nu_F(t) : F(s \star t) \to F(s \star s \star t)$ — does *not* arise from a
single T-morphism applied to F. (The contravariant restriction along $i_{s \star t} : s \star t \to
s \star s \star t$ goes in the opposite direction: $F(s \star s \star t) \to F(s \star t)$.) The
comonad laws for $(G_s, \epsilon, \nu)$ are established in §modal-adjoint-chain from the adjoint-pair
structure of $R$ as a locally connected sheaf topos: $G_s$ is the comonad $\Box \Diamond$ arising
from the middle adjunction $\Box \dashv \Diamond$ of the modal adjoint chain. The **lax idempotence
(KZ property)** $G_s \epsilon \cong \nu$ holds because $T$ is a thin category — all 2-cells are
unique, so the KZ coherence condition is trivially satisfied. The present construction takes the
comonad structure as established and records its counit; the full verification is in §modal-adjoint-chain.

**Process carriers.** A **process carrier** is a $G_s$-coalgebra: a sheaf $X \in R$ with a
natural transformation $\gamma : X \Rightarrow G_s X$, i.e., a family of maps
$\gamma_t : X(t) \to X(s \star t)$, natural in $t$, satisfying two laws:

1. **Counit law**: $\epsilon_X \circ \gamma = \mathrm{id}_X$. Explicitly:
   $X(t) \xrightarrow{\gamma_t} X(s \star t) \xrightarrow{\epsilon_X(t)} X(t) = \mathrm{id}_{X(t)}$.
   Stepping forward then restricting back is the identity — $\gamma$ is a section of $\epsilon_X$.

2. **Coassociativity law**: $G_s(\gamma) \circ \gamma = \nu_X \circ \gamma$. Explicitly:
   stepping forward via $\gamma$ and then stepping forward again via $\gamma_{s \star t}$
   (i.e., $(G_s \gamma)_t \circ \gamma_t : X(t) \to X(s \star t) \to X(s \star s \star t)$)
   equals the comonad comultiplication $\nu_X(t) : X(s \star t) \to X(s \star s \star t)$
   composed after $\gamma_t$. For a coalgebra, $\nu_X$ can therefore be computed explicitly:
   $\nu_X(t) = \gamma_{s \star t} : X(s \star t) \to X(s \star s \star t)$.

**CoKleisli category.** The **CoKleisli category** $\mathrm{coKl}(G_s)$ has hom-sets
$\mathrm{coKl}(G_s)(X,Y) := \mathrm{Hom}_R(G_s X, Y)$. Composition of $f : G_s X \to Y$ and
$g : G_s Y \to Z$ uses the comonad comultiplication $\nu_X : G_s X \to G_s G_s X$
(which exists for all $X \in R$ by §modal-adjoint-chain, not just for coalgebras):
$$
g \circledast f \;:=\; g \circ G_s(f) \circ \nu_X
\;:\;
G_s X \xrightarrow{\nu_X} G_s G_s X \xrightarrow{G_s f} G_s Y \xrightarrow{g} Z.
$$
When $X$ is a process carrier $(X, \gamma)$, the concrete formula $\nu_X(t) = \gamma_{s \star t}$
gives an explicit description of coKleisli composition in terms of the stepping maps $\gamma$.

**Compatibility with relational universe structure.** The comonad $G_s$ shifts the history
argument: $(G_s F)(t) = F(s \star t)$. Applied to the fiber algebra sheaf $H$, the shifted
fiber is $G_s(H)(t) = H_{s \star t}$. The nuclei $\sigma_{s \star t}$ and $\Delta_{s \star t}$
at the shifted fiber are not in general equal to $\sigma_t$ and $\Delta_t$ — they may differ
because nuclei are defined fiber-by-fiber. What does hold is that the reindexing maps
$H(i_t) : H_{s \star t} \to H_t$ (induced by $i_t : t \to s \star t$) are nucleus-preserving
homomorphisms (§reindexing). This means $G_s$ carries the nucleus structure forward
compatibly with restriction, but does not commute with $\sigma$ and $\Delta$ as isomorphisms
unless the nuclei happen to be reindexing-invariant (which they are on $H^\ast$, by
§fixed-fiber).

On $H^\ast$ (the invariant sub-sheaf, §fixed-fiber), the restriction maps are isomorphisms
of fixed-point algebras. Hence $G_s$ restricts to a comonad on $H^\ast$, and the observation
sheaf satisfies $G_s(H^\vee) \cong (G_s H)^\vee$ — the construction–observation duality is
preserved under one step of CoKleisli dynamics.

At the close of one complete pass, three interlocking layers are in place:

| Layer | Object | Direction | Operation |
|---|---|---|---|
| Static | $H^\ast \subseteq H$ | none | $\sigma, \Delta$ nuclei |
| Dual | $(H^\vee)^\ast \subseteq H^\vee$ | contravariant | $\sigma^\vee, \Delta^\vee$ dual nuclei |
| Dynamic | $G_s$-coalgebras | forward along $s$ | CoKleisli composition |

> **End of one turn.** The structures above constitute a complete pass through all four phases.
> $R_0 = \mathbf{Sh}(T^{(0)}, J|_{T^{(0)}})$ is in place: it has algebra ($H_t$, nuclei, presheaf),
> language (FiberNuclearLanguage, the syntactic relational universe, initiality), geometry (the sheaf $R$, its
> characteristic morphism, its profile structure), and dynamics (convolution $\circledast$, comonad
> $G_s$). It is a complete small relational universe. The operators $U_G$ and $G_s$ are now
> armed to produce $R_1$, and from $R_1$ to produce $R_2$, and so on without limit.
