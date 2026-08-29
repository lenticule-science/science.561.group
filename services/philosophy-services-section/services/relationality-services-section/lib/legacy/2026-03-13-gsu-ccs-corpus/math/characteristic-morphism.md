---
id: characteristic-morphism
name: CharacteristicMorphism
description: "Characteristic Morphism of H*"
defines: CharacteristicMorphism
---

### Construction — Characteristic Morphism of $H^\ast$ {#characteristic-morphism}

In $R = \mathbf{Sh}(T,J)$, every subobject is classified by a unique morphism into the
subobject classifier $\Omega$. The subobject $H^\ast \hookrightarrow H$ carries precise
information about how invariance functions as an internal truth value.

Recall that in $R$, the subobject classifier is
$$
\Omega(t) \;=\; \{ S \mid S \text{ is a } J\text{-closed sieve on } t \},
$$
with restriction along $f : s \to t$ given by pullback of sieves. The morphism
$\top : 1 \to \Omega$ sends the unique global section to the maximal sieve at each $t$.

**Definition — Characteristic Morphism.** For $a \in H_t$, define
$$
\chi_{H^\ast,t}(a)
\;\coloneqq\;
\bigl\{\, f : s \to t \;\bigm|\; H(f)(a) \in H^\ast_s \,\bigr\}.
$$

**Proposition — Characteristic Morphism of $H^\ast$.** The assignment
$t \mapsto \chi_{H^\ast,t}$ defines a morphism of sheaves $\chi_{H^\ast} : H \to \Omega$
such that the square
$$
\begin{array}{ccc}
H^\ast & \longrightarrow & 1 \\
\downarrow & & \downarrow\scriptstyle{\top} \\
H & \xrightarrow{\;\chi_{H^\ast}\;} & \Omega
\end{array}
$$
is a pullback in $R$. In particular, $\chi_{H^\ast}$ is the unique morphism with this
property.

*Proof sketch.* Well-definedness (each $\chi_{H^\ast,t}(a)$ is a $J$-closed sieve)
follows from: (1) sieve property — composing with any $g : r \to s$ and using
functoriality of $H$ and the reindexing-compatibility of $H^\ast$; (2) $J$-closedness —
if $\{u_i : t_i \to t\}$ covers $t$ and each $u_i \in S$, the compatible family
$(H(u_i)(a)) \subseteq H^\ast$ glues uniquely by the Axiom of Stability to an element of $H^\ast_t$, forcing
$a$ itself into $H^\ast_t$. Naturality of $\chi_{H^\ast}$ is direct computation.
The pullback property follows from the universal property of $\Omega$ (Johnstone,
*Sketches of an Elephant*, Lemma A1.6.2). $\square$

The morphism $\chi_{H^\ast}$ makes invariance an internal truth value of the topos:
$a \in H_t$ is invariant if and only if $\chi_{H^\ast,t}(a)$ is the maximal sieve on $t$.
Internally, $a \in H^\ast \Leftrightarrow \chi_{H^\ast}(a) = \top$.

**Remark — Factorization through the Double-Negation Subtopos.** The morphism
$\chi_{H^\ast}$ factors through $\Omega_{\neg\neg} \hookrightarrow \Omega$ — invariance
is a $\neg\neg$-dense condition — if and only if $H^\ast$ is $\neg\neg$-dense in $H$:
every proposition can be locally forced into the invariant layer by some cover. In the
quasicrystalline case (§aperiodicity), local repetitiveness ensures this density
holds, and $\chi_{H^\ast}$ factors through the Boolean part of $\Omega$.
