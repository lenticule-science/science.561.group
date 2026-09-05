---

name: history-convolution
description: "History Convolution — the symmetric monoidal structure on R extending the monoidal product of T via sheafified Day convolution."
---

### Theorem — History Convolution {#history-convolution}

The relational universe $R$ admits a symmetric monoidal structure
$$
\circledast : R \times R \longrightarrow R,
$$
with unit object $\mathbf{1} \in R$, such that:

1. On representables, $y(t) \circledast y(t') \simeq y(t \star t')$.

2. On the distinguished object $H$, history convolution restricts fiberwise to the
   propositional-lattice product, compatibly with $\sigma$ and $\Delta$.

3. The unit $\mathbf{1}$ identifies with the terminal sheaf (constant singleton), corresponding to the
   empty history.

In particular $(R, \circledast, \mathbf{1})$ is a symmetric monoidal universe and $(R, H)$ carries a
canonical history convolution structure.

**Standing hypotheses (not derived from the main axioms).** Two conditions on the history site $(T,J)$
are required for history convolution to descend to sheaves, but are *not* consequences of the
Axioms of Histories through Locality as stated in §history-and-fiber-algebra: *(Subcanonicity)* The commutation topology $J$
is subcanonical: every representable $y(t)$ is already a $J$-sheaf. *(Monoidal compatibility)*
For each $s \in \mathrm{Ob}(T)$, the functors $s \star (-)$ and $(-) \star s$ send
$J$-covering sieves to $J$-covering sieves. These are extra hypotheses on the specific history
site used; they must be verified case-by-case for each concrete relational universe.

**Proof.**

*(1) Monoidal structure on $T$.* History concatenation $\star$ (the Axiom of Generative Basis) together with the
normalization relations of the Axiom of Histories endows $T$ with the structure of a small symmetric monoidal
category $(T, \star, e)$, with unit the empty history $e$.

*(2) Day convolution on presheaves.* On the presheaf category $[T^{\mathrm{op}}, \mathbf{Set}]$,
define
$$
(F \otimes_{\mathrm{Day}} G)(t)
\;\coloneqq\;
\int^{u,v \in T} F(u) \times G(v) \times T(t,\, u \star v),
$$
the coend over all factorizations of $t$ by $\star$. This equips $[T^{\mathrm{op}}, \mathbf{Set}]$
with a symmetric monoidal structure whose unit is $y(e)$.

*(3) Restriction to sheaves.* By the monoidal compatibility hypothesis, sheafification
$a : [T^{\mathrm{op}}, \mathbf{Set}] \to \mathbf{Sh}(T,J)$ is strong symmetric monoidal with
respect to Day convolution. Define $F \circledast G \coloneqq a(iF \otimes_{\mathrm{Day}} iG)$ and
$\mathbf{1} \coloneqq a(y(e))$. This yields a symmetric monoidal structure on $R = \mathbf{Sh}(T,J)$.

*(4) Behaviour on representables.* Since $y(t) \otimes_{\mathrm{Day}} y(t') \cong y(t \star t')$
by the Yoneda calculation, and representables are already sheaves by subcanonicity, item (1) holds.

*(5) Behaviour on $H$.* There is a canonical diagonal $\theta : H \times H \to H \circledast H$
arising from the trivial factorization $t = t \star e$. The fiberwise algebra operations factor
through $\theta$, making $H$ an internal algebra object in $(R, \circledast, \mathbf{1})$.

*(6) Unit and symmetry.* The terminal sheaf is the unit; symmetry and coherence are inherited from
Day convolution. $\square$
