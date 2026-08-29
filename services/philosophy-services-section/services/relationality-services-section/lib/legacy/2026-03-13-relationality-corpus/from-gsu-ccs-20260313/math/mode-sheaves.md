---

name: mode-sheaves
description: "Object: the mode spaces at each fiber — the full mode space Ṽ_t = K^{H_t}, the invariant subspace V_t = K^{H_t*}, the eigenspaces E_{t,λ}, and the defect operator δ_t acting on Ṽ_t."
defines: ModeSheaves
---

### Definition — Mode Sheaves {#mode-sheaves}

At each history $t$, the propositional fiber $H_t$ generates two $K$-modules of **modes** —
linear functionals on the fiber's Boolean-valued structure — and a linear operator that
measures deviation from invariance.

#### The Full Mode Space $\widetilde{V}_t$ {#def-full-mode-space}

$$
\widetilde{V}_t \;:=\; K^{H_t},
$$
the free $K$-module with basis $\{e_a\}_{a \in H_t}$ indexed by all elements of the fiber.
Here $K$ is the coefficient ring (e.g., $K = \mathbb{R}$ or $K = \mathbb{C}$).

#### The Invariant Subspace $V_t$ {#def-invariant-mode-space}

$$
V_t \;:=\; K^{H_t^*},
$$
the free $K$-module spanned by the doubly stable elements $H_t^* = \mathrm{Fix}(\sigma_t) \cap
\mathrm{Fix}(\Delta_t)$ (§fixed-fiber). The inclusion $H_t^* \hookrightarrow H_t$ induces the
natural restriction $V_t \hookrightarrow \widetilde{V}_t$.

#### The Defect Operator $\delta_t$ {#def-defect-operator}

The **defect operator** $\delta_t : \widetilde{V}_t \to \widetilde{V}_t$ is the diagonal
linear map defined on basis vectors by
$$
\delta_t(e_a) \;:=\; \lambda_a \cdot e_a,
\qquad
\lambda_a \;:=\; \bigl|\{a' \in H_t \mid a \leq a' \leq \pi_t(a)\}\bigr| - 1,
$$
where $\pi_t = \sigma_t \circ \Delta_t$ is the joint projection (§joint-projection) and
$\lambda_a$ is the number of elements strictly between $a$ and its doubly-stable closure
$\pi_t(a)$ in the Heyting order. The defect construction is detailed in §defect-construction.

**Key property.** $\delta_t(e_a) = 0$ if and only if $a \in H_t^*$ (i.e., $a = \pi_t(a)$),
so the kernel of $\delta_t$ is exactly $V_t$.

#### Eigenspaces $E_{t,\lambda}$ {#def-eigenspaces}

Since $\delta_t$ is diagonal, $\widetilde{V}_t$ decomposes as
$$
\widetilde{V}_t \;\cong\; \bigoplus_{\lambda \in \Lambda_t} E_{t,\lambda},
$$
where $\Lambda_t \subset K$ is the finite **spectrum** of $\delta_t$ and
$$
E_{t,\lambda} \;:=\; \ker(\delta_t - \lambda \cdot \mathrm{id}) \;=\; \mathrm{span}\{e_a \mid \lambda_a = \lambda\}.
$$
In particular $E_{t,0} = V_t$ is the zero eigenspace (§stable-mode-sheaf).
The spectral decomposition is studied in §spectral-decomposition.
