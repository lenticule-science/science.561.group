---

name: invariant-locale
description: "Object: Invariant Locale"
defines: InvariantLocale
---

### Definition — The Limit Structure {#invariant-locale}

*What crystallizes only when the full tower is in place.*

Some structures require the full colimit. No finite $R_n$ has them — they appear only when the entire
tower is assembled. The invariant locale is the internal phase space. The spectral decomposition
measures how configurations deviate from invariance. Sheaf cohomology measures global obstructions
that no finite region of $T$ can detect. Observation duality identifies a symmetry between
construction and observation that is perfect only at the fixed point.

#### The Invariant Locale {#invariant-locale}

##### Definition — Invariant Locale {#def-invariant-locale}

The **phase space** of the Relational Universe is the internal locale
$$
\mathsf{Phase}
$$
whose internal frame of opens is identified with the fixed subsheaf $H^\ast$. This identification
is justified: each fiber $H_t^\ast$ is a finite Heyting algebra (the fiber doctrine), hence a
complete lattice (every finite lattice is trivially complete). A frame requires arbitrary joins
distributing over finite meets — but in a finite lattice all joins are finite, so the distributivity
condition $a \wedge \bigvee_i b_i = \bigvee_i (a \wedge b_i)$ reduces to finite distributivity,
which holds in any Heyting algebra. Thus each $H_t^\ast$ is automatically a frame, and no
external completion is needed. We write
$$
\mathcal{O}(\mathsf{Phase}) \;:=\; H^\ast
$$
and identify opens of $\mathsf{Phase}$ with invariant propositions.

##### Theorem — The Invariant Locale {#thm-invariant-locale}

The fixed subsheaf $H^\ast \hookrightarrow H$ is a sheaf of **complete** Heyting algebras in $R$ with
no further completion required, and hence determines an internal locale $\mathsf{Phase}$ with
$\mathcal{O}(\mathsf{Phase}) = H^\ast$. Moreover:

1. For each history $t$, the fiber $H_t^\ast$ is finite, hence complete and a frame.

2. The assignment $t \mapsto H_t^\ast$ is compatible with reindexing and gluing (Axioms of Reindexing and History Separation).

3. The restriction maps $H^\ast(f) : H_{t'}^\ast \to H_t^\ast$ are Heyting algebra morphisms between
   finite algebras and therefore automatically frame maps.

$\mathsf{Phase}$ is well-defined and stable under all relational universe symmetries.

**Proof.** Finite Heyting algebras are complete (the fiber doctrine). The Axiom of History Separation gives the sheaf of Heyting
algebras. Since restriction maps preserve all joins (as all joins are finite), they are frame maps.
By internal frame–locale duality (Johnstone, *Stone Spaces* §C1.6), $H^\ast$ determines the locale
$\mathsf{Phase}$. Stability under relational universe symmetries follows from the fact that $H^\ast \hookrightarrow
H$ is preserved by all restriction functors and invariant sections glue along covers. ∎

The stabilization map $\mathsf{Stab} : H \to H^*$ (§joint-projection) gives a canonical
projection from the full propositional object to the invariant layer: the least element
of $H^*$ above any given proposition. It is a definable internal map in $R$, requiring
no new axiom.

##### Theorem — Dynamical Stability {#thm-dynamical-stability}

The nuclei $\sigma, \Delta$ induce an internal locale endomorphism $T : \mathsf{Phase} \to
\mathsf{Phase}$ defined on opens by $T^\sharp(U) = \sigma(\Delta(U))$ for $U \in H^\ast$. This
endomorphism satisfies:

1. **Monotonicity.** $U \subseteq V \Rightarrow T^\sharp(U) \subseteq T^\sharp(V)$.

2. **Idempotence on invariant opens.** $T^\sharp(U) = U$ for all $U \in H^\ast$.

3. **Compatibility with frame structure.** $T^\sharp$ preserves finite meets and arbitrary joins.

**Proof.** Since $U \in H^\ast$ satisfies $\Delta(U) = U$ and $\sigma(U) = U$, we have
$T^\sharp(U) = \sigma(\Delta(U)) = \sigma(U) = U$, giving idempotence. Monotonicity follows from
the fiber doctrine (both nuclei are order-preserving). Frame compatibility follows from meet- and
join-preservation of $\sigma$ and $\Delta$. ∎

**Interpretation.** $\mathsf{Phase}$ is the internal space of stable states: invariant propositions
are its opens; the propositional structure gives unions, intersections, and implications; and the
induced dynamics on $\mathsf{Phase}$ fixes all invariant opens. Everything is internal to $R$.
