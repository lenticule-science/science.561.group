---
id: cohomology
name: Cohomology
description: "Cohomology and Obstruction"
---

### Theorem — Cohomology and Obstruction {#cohomology}

#### Setup {#cohomology-setup}

Since $R = \mathbf{Sh}(T,J)$ is a Grothendieck topos, it has enough injectives. For any sheaf
$\mathcal{V}$ of $K$-modules on $(T,J)$, **sheaf cohomology** is:
$$
H^n(T,J;\,\mathcal{V}) \;\coloneqq\; R^n\Gamma(\mathcal{V}),
\qquad n \geq 0,
$$
where $\Gamma(\mathcal{V}) = \varprojlim_{t \in T} \mathcal{V}(t)$ is the global sections functor.
Since the commutation topology $J$ has finite covering families (the Axiom of Locality) and each $H_t$ is finite (the fiber doctrine),
Čech cohomology agrees with derived functor cohomology:
$$
\check{H}^n(T,J;\,\mathcal{V}) \;\cong\; H^n(T,J;\,\mathcal{V})
$$
for all locally free sheaves of finite-rank $K$-modules.

#### Theorem — Global Invariant Modes {#thm-global-modes}

$$
H^0(T,J;\,V) \;\cong\; \Gamma(V),
$$
the $K$-module of global invariant mode sections: elements $v \in \prod_t V_t$ compatible with all
reindexing maps. The inclusion $E_0 \hookrightarrow V$ identifies the globally stable modes (zero-eigenvalue
sections) as a $K$-submodule; the quotient $\Gamma(V)/\Gamma(E_0)$ parameterizes globally coherent
oscillatory patterns not killed by any power of $\delta$.

**Proof.** By definition of derived functors, $R^0\Gamma = \Gamma$. $\square$

#### Theorem — Cohomology Sequence {#thm-cohomology-sequence}

The short exact sequence $0 \to E_0 \to V \to V/E_0 \to 0$ induces a long exact sequence:
$$
0 \to \Gamma(E_0) \to \Gamma(V) \to \Gamma(V/E_0)
\xrightarrow{\;\partial\;} H^1(T,J;\,E_0)
\to H^1(T,J;\,V) \to \cdots
$$
The **connecting homomorphism** $\partial : \Gamma(V/E_0) \to H^1(T,J;\,E_0)$ measures the
obstruction to lifting a global section of the oscillatory quotient $V/E_0$ to a global section of
$V$.

**Proof.** Apply $\Gamma$ to the short exact sequence and invoke the long exact sequence of right
derived functors. $\square$

#### Corollary — Aperiodicity and Nontrivial Cohomology {#cor-aperiodicity-cohomology}

Under the global aperiodicity of the Theorem of Aperiodicity:

1. $H^0(T,J;\,E_0) \cong K$ — the stable modes are globally one-dimensional.

2. The class $[\partial] \in H^1(T,J;\,E_0)$ is nontrivial whenever $V/E_0$ has a global section
   that does not lift: oscillatory global modes are obstructed.

3. Aperiodicity is necessary for nontrivial $H^1(T,J;\,E_0)$: if the site had a nontrivial periodic
   symmetry, Shapiro's lemma would force $H^1$ to vanish.

#### Corollary — Mayer–Vietoris for Profile Sites {#cor-mayer-vietoris}

Let $U_1, U_2 \subseteq T$ be two profile sites with $U_1 \cup U_2 = T$ and
$U_{12} = U_1 \cap U_2$. There is a long exact Mayer–Vietoris sequence:
$$
\cdots \to H^{n-1}(U_{12},\,V)
\xrightarrow{\;\delta_{MV}\;}
H^n(U_1,\,V) \oplus H^n(U_2,\,V)
\to H^n(T,\,V)
\to H^n(U_{12},\,V) \to \cdots
$$
Local mode data on each profile can be combined into global data precisely when the Mayer–Vietoris
obstruction $\delta_{MV}$ vanishes on the overlap — the cohomological content of "local patterns glue
to global ones."

**Remark — Connection to the Depth Tower.** The depth filtration gives a filtration of $V$ by
$V^{(n)} = V|_{T^{(n)}}$, with associated spectral sequence converging to $H^{p+q}(T,J;\,V)$. Under
Beck-Chevalley stability (Theorem — Level Stability), the higher-pushforward sheaves vanish,
recovering a direct comparison $H^\ast(T^{(n)}, V) \to H^\ast(T, V)$ at each depth.
