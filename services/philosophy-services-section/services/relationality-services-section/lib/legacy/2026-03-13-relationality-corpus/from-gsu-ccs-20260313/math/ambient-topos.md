---

name: ambient-topos
description: "The Ambient Topos"
---

### Construction — The Ambient Topos {#ambient-topos}

Let $R := \mathbf{Sh}(T,J)$ denote the category of set-valued sheaves on the site $(T,J)$,
where $J$ is the commutation topology of §commutation-topology. This is an elementary topos
in the usual sense (Grothendieck topos on a small site).

The Axiom of Locality is precisely the assertion that the underlying presheaf $\lvert H \rvert$
satisfies the sheaf condition for $J$; hence:
- $\lvert H \rvert$ is a sheaf on $(T,J)$, giving an object $H \in R$.
- By the Axiom of Stability, $\lvert H^\ast \rvert$ is also a sheaf on $(T,J)$, and the fiberwise
  inclusions $H_t^\ast \hookrightarrow H_t$ assemble into a monomorphism of sheaves
  $H^\ast \hookrightarrow H$ in $R$.

**Internal Propositional Structure on $H$.** The fiberwise propositional operations
$(\wedge_t, \vee_t, \Rightarrow_t, \bot_t, \top_t)$ are natural in $t$ by the Axiom of Reindexing. They
therefore assemble to internal morphisms in $R$:
$$
\wedge, \vee : H \times H \to H,\quad
\Rightarrow : H \times H \to H,\quad
\bot, \top : 1 \to H,
$$
giving $H$ the structure of an **internal finite Heyting algebra object** in $R$.

**Internal Modal Operators and Fixed Subobject.** The natural transformations
$\sigma, \Delta : H \Rightarrow H$ induce internal endomorphisms
$$
\sigma, \Delta : H \longrightarrow H
$$
satisfying internally the same algebraic laws as in the fiber doctrine (monotonicity, idempotence,
commutation, compatibility with the propositional structure). The fixed fibers $H_t^\ast$
assemble into a subsheaf $H^\ast \hookrightarrow H$ of internal Heyting algebras, stable
under reindexing and under all sheaf gluing operations.
