---

name: propositional-presheaf
description: "The Propositional Presheaf"
defines: PropositionalPresheaf
---

### Construction — The Propositional Presheaf {#propositional-presheaf}

From the history axiom (§history), the fiber doctrine (§fiber-doctrine), reindexing (§reindexing), and history separation (§history-separation), we have a functor $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$.
We now assemble this into an underlying presheaf of sets, a fixed subpresheaf, and
global natural transformations.

**Underlying Presheaf of Sets.** Let $U : \mathbf{HA_{nucl}} \to \mathbf{Set}$ be the
forgetful functor. Define the *underlying propositional presheaf*
$$
\lvert H \rvert := U \circ H : T^{\mathrm{op}} \longrightarrow \mathbf{Set},
$$
with $\lvert H \rvert(t) = H_t$ and $\lvert H \rvert(f) = H(f) : H_{t'} \to H_t$.

**Fixed Subpresheaf.** From the Axiom of History Separation, each fiber $H_t$ has a fixed subalgebra $H_t^\ast
\subseteq H_t$, stable under all reindexing maps. Define a presheaf
$$
H_\ast : T^{\mathrm{op}} \longrightarrow \mathbf{HA}
$$
by $H_\ast(t) := H_t^\ast$ and $H_\ast(f) := H(f)\big\vert_{H_{t'}^\ast} : H_{t'}^\ast
\to H_t^\ast$. This is well-defined by the compatibility condition of the Axiom of Reindexing.

**Natural Modal Transformations.** The fiberwise modal operators assemble into natural
transformations
$$
\sigma, \Delta : H \Longrightarrow H
$$
in $\mathbf{HA_{nucl}}^{T^{\mathrm{op}}}$: at each $t$ the component is $\sigma_t$ or
$\Delta_t$, and naturality holds by the Axiom of Reindexing (preservation of structure). These will become
internal endomorphisms on a single object once we pass to the sheaf topos.
