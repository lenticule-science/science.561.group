---
id: spectral-decomposition
name: SpectralDecomposition
description: "Spectral Decomposition"
---

### Theorem — Spectral Decomposition {#spectral-decomposition}

#### Definition — Sheaf of Propositional Modes {#def-invariant-modes}

Fix a commutative ring $K$ (e.g. $K = \mathbb{R}$). For each history $t$, the finite set $H_t$
gives a basis for the free $K$-module $\widetilde{V}_t := K^{H_t}$. These assemble into a sheaf:
$$
\widetilde{V} : T^{\mathrm{op}} \longrightarrow \mathbf{Mod}_K,
\qquad \widetilde{V}(t) := K^{H_t},
$$
with reindexing maps $\widetilde{V}(f)(e_a) = e_{H(f)(a)}$ for $f : t \to t'$ and $a \in H_{t'}$
(pullback along the HA-morphism $H(f) : H_{t'} \to H_t$). Since $H$ is a sheaf and each fiber is
finite, $\widetilde{V}$ satisfies the sheaf condition. We call $\widetilde{V}$ the **sheaf of
propositional modes**.

The fiberwise fixed subalgebras define an invariant submodule: $V_t := K^{H_t^\ast} \subseteq
\widetilde{V}_t$, with complementary module $C_t := K^{H_t \setminus H_t^\ast}$ (the **unsettled
modes**), giving $\widetilde{V}_t = V_t \oplus C_t$. The subsheaf $V \subseteq \widetilde{V}$
(the **sheaf of invariant modes**) is a sheaf because $H^\ast$ is a sheaf (§stability).

#### Definition — Defect Operator {#def-defect}

For each history $t$, a $K$-linear map $\delta_t : \widetilde{V}_t \to \widetilde{V}_t$ is a
**defect operator** if:

1. **Naturality in $t$.** For every $f : t \to t'$ in $T$,
   $\widetilde{V}(f) \circ \delta_{t'} = \delta_t \circ \widetilde{V}(f)$.

2. **Vanishing on invariant directions.** For every $a \in H_t^\ast$, $\delta_t(e_a) = 0$.
   Equivalently, $V_t = K^{H_t^\ast} \subseteq \ker(\delta_t)$.

3. **Dependence on $\sigma_t$ and $\Delta_t$.** Each $\delta_t$ is determined functorially by the
   action of $\sigma_t$ and $\Delta_t$ on $H_t$ (via the joint projection $\pi_t = \sigma_t \circ \Delta_t$).

**Diagonalizability — discharged.** The explicit construction of §defect-construction defines
$\delta_t$ to be diagonal on the basis $\{e_a : a \in H_t\}$, so diagonalizability holds
by construction. The zero-eigenspace $\ker(\delta_t) = V_t = K^{H_t^\ast}$ exactly: every
non-fixed element $a \in H_t \setminus H_t^\ast$ has $\lambda_a = |[a, \pi_t(a)]| - 1 \geq 1$.

#### Theorem — Fiberwise Mode Decomposition {#thm-mode-decomposition}

By §defect-construction, $\delta_t$ is diagonal on $\{e_a\}$ and hence diagonalizable.
For each history $t$:

1. $\widetilde{V}_t$ has a basis of eigenvectors of $\delta_t$.

2. There is a direct-sum decomposition
   $\widetilde{V}_t \cong \bigoplus_{\lambda \in \Lambda_t} E_{t,\lambda}$,
   where $\Lambda_t$ is the finite spectrum of $\delta_t$ and $E_{t,\lambda}$ is the corresponding
   eigenspace.

3. The zero-eigenspace $E_{t,0} \supseteq V_t = K^{H_t^\ast}$ contains all invariant modes.
   Under the explicit construction of §defect-construction, $E_{t,0} = V_t$ exactly: the
   zero-eigenspace is spanned by $H_t^\ast$, and every $a \in H_t \setminus H_t^\ast$ has
   eigenvalue $\lambda_a \geq 1$.

**Proof.** $\widetilde{V}_t = K^{H_t}$ is finite-dimensional with $\dim_K \widetilde{V}_t = |H_t| < \infty$.
By the diagonalizability assumption, eigenvector decomposition applies. The inclusion $V_t \subseteq E_{t,0}$
follows from condition (2) in the definition of the defect operator. ∎

#### Theorem — The Mode Sheaf {#thm-mode-sheaf}

The fiberwise decompositions assemble into an internal decomposition of $\widetilde{V}$, conditionally
on the naturality of $\delta$ (the naturality condition, which holds under the Interval-Faithfulness Condition of
§defect-construction):

1. For each eigenvalue $\lambda \in K$, the assignment $t \mapsto E_{t,\lambda}$ with reindexing
   maps induced from $\widetilde{V}$ defines a subsheaf $E_\lambda \subseteq \widetilde{V}$.

2. There is an internal direct-sum decomposition
   $\widetilde{V} \cong \bigoplus_{\lambda \in \Lambda} E_\lambda$ in $R$.

3. The zero-eigenvalue subsheaf $E_0 = V$ is the **stable mode sheaf** (the sheaf of invariant modes);
   the other $E_\lambda$ for $\lambda > 0$ encode the unsettled dynamics.

**Proof.** Assuming naturality of $\delta$ (the naturality condition), $\widetilde{V}(f)$ maps $E_{t',\lambda}$ into
$E_{t,\lambda}$: if $\delta_{t'}(v) = \lambda v$ then $\delta_t(\widetilde{V}(f)(v)) =
\widetilde{V}(f)(\delta_{t'}(v)) = \lambda \widetilde{V}(f)(v)$. So $E_\lambda$ is a well-defined
subpresheaf of $\widetilde{V}$. The gluing condition for $\widetilde{V}$ and naturality of $\delta$
give the subsheaf condition. The direct sum is assembled globally from the eigenspace inclusions. ∎

*Conditional note.* The mode sheaf theorem depends on the naturality condition (naturality of $\delta$), which
holds under the Interval-Faithfulness Condition of §defect-construction. Without IFC, the
eigenspaces $E_{t,\lambda}$ need not be preserved under reindexing and the assembly into a
sheaf fails.

#### Proposition — Graded Mode Algebra {#prop-graded-algebra}

**Open condition (Derivation Condition).** For each $t$ and all $f, g \in \widetilde{V}_t$ —
not yet derived from the eight axioms; conditional on interval-additivity (§defect-construction):
$$
\delta_t(f \cdot g) \;=\; \delta_t(f) \cdot g + f \cdot \delta_t(g),
$$
where multiplication is the pointwise $K$-algebra structure on $\widetilde{V}_t = K^{H_t}$ induced by the
meet operation of $H_t$ (the Heyting algebra product $e_a \cdot e_b = e_{a \wedge b}$).

Under this condition:

1. **Eigenspaces are multiplicatively closed:** $E_\lambda \cdot E_\mu \subseteq E_{\lambda+\mu}$.
   The spectral decomposition $V \cong \bigoplus_\lambda E_\lambda$ is a $\Lambda$-graded
   $K$-algebra.

2. **$V$ is an internal differential graded $K$-algebra:** $(V, \cdot, \delta)$ is an internal DG
   $K$-algebra in $R$, with $\delta$ as differential.

3. **Cohomological grading:** $E_0$ is a sub-$K$-algebra of $V$, and each $E_\lambda$ is an
   $E_0$-module. The Künneth formula applies to tensor products under the flatness assumption of the
   following section.

**Proof.** (1): Let $f \in (E_\lambda)_t$ and $g \in (E_\mu)_t$. By the Derivation Condition,
$\delta_t(f \cdot g) = \lambda f \cdot g + f \cdot \mu g = (\lambda + \mu)(f \cdot g)$, so
$f \cdot g \in (E_{\lambda+\mu})_t$. Naturality of $\delta$ and multiplication give the global
statement. (2) is immediate from the Leibniz rule. (3) follows from $E_0 \cdot E_0 \subseteq E_0$
and $E_\lambda \cdot E_0 \subseteq E_\lambda$. $\square$

**Interpretation.** Stable modes compose to stable modes; oscillatory modes compose with additive
frequency: the entire decomposition is an internal DG algebra providing a bridge between
sheaf-cohomological structure and the dynamical picture of the invariant locale.
