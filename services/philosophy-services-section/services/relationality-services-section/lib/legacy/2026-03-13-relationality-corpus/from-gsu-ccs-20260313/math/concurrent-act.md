---

name: concurrent-act
description: "Concurrent Act"
---

### Definition — Concurrent Act {#concurrent-act}

A **concurrent act** on a relational universe $R$ is a symmetric monoidal
structure $(\circledast, \mathbf{1}, \alpha, \lambda, \rho, \sigma)$ on the category $R$
such that:

1. **Extends $T$.** On representable sheaves, the monoidal product is:
   $$
   y(t) \circledast y(t') \;\cong\; y(t \star t')
   $$
   naturally in $t, t' \in \mathrm{Ob}(T)$. The monoidal unit is $\mathbf{1} \cong y(e)$,
   the terminal sheaf (representable at the empty history).

2. **Compatible with $H$.** The Heyting-modal sheaf $H$ is a commutative monoid
   object in $(R, \circledast, \mathbf{1})$: there is a diagonal
   $\mu : H \circledast H \to H$ compatible with the fiber-wise meet $\wedge_t$,
   and the nuclei $\sigma, \Delta$ are monoid-object endomorphisms.

3. **Cocomplete monoidal.** The monoidal product $\circledast$ preserves small
   colimits in each argument separately (i.e., $R$ is a closed symmetric monoidal
   category with respect to $\circledast$).

#### Interpretation {#concurrent-act-interpretation}

Two sheaves $F$ and $G$ represent propositions or data at different (possibly
overlapping) histories. Their concurrent combination $F \circledast G$
represents the joint data of both, indexed by all ways of **concatenating** their
histories: if $F$ lives on history $t$ and $G$ on history $t'$, then
$F \circledast G$ lives on histories of the form $t \star t'$. This is the
categorical expression of **parallel composition**: two independent relational
processes run side by side and their joint history is their concatenation.

The commutativity isomorphism $F \circledast G \cong G \circledast F$ expresses
that parallel composition is order-independent — the same relational phenomenon
as the commutativity of $\star$ on commuting steps.

#### Remark — Day Convolution as the Free Concurrent Act {#remark-concurrent-free}

The canonical concurrent act on $R = \mathbf{Sh}(T, J)$ is the sheafified
Day convolution (§history-convolution). The presheaf Day convolution
$\otimes_{\mathrm{Day}}$ on $[T^{\mathrm{op}}, \mathbf{Set}]$ is the
**free** symmetric monoidal cocomplete structure extending $\star$; the
sheafification to $R$ is the **quotient** imposing locality. See
§free-concurrent-act for the full free/quotient analysis.

#### Remark — Concurrent Act as Relational Tensor {#remark-concurrent-tensor}

In the fiber Heyting algebras, the concurrent act restricts to: two propositions
$a \in H_t$ and $b \in H_{t'}$ have a joint proposition
$a \otimes b \in H_{t \star t'}$ given by the tensor product of their fibers.
When $t = t'$ (same history), this collapses to $a \wedge b$ — the fiber meet.
The concurrent act is thus a global version of the local meet operation,
extended to arbitrary pairs of histories.
