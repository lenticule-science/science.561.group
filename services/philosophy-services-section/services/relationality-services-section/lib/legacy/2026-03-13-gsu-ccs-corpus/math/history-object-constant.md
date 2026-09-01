---
id: history-object-constant
name: HistoryObjectConstant
description: "the constant presheaf underline{T} is already a sheaf on (T,J) — the internal history object in Sh(T,J) has sections T at every stage, and the internal prefix order is the external one."
---

### Theorem — The History Object Is Constant {#history-object-constant}

**Theorem.** The constant presheaf $\underline{T}$ — assigning the history monoid $T$ to
every object of $T$ and the identity map to every morphism — is a sheaf on $(T, J)$.
Consequently, the internal history object in $R = \mathbf{Sh}(T, J)$ satisfies
$$
\mathbf{T}(t) \;=\; T \quad \text{for all } t \in T,
$$
and the internal prefix order $\leq_{\mathrm{int}}$ on $\mathbf{T}$ is, at every stage $t$,
the external prefix order on $T$.

#### Proof {#history-object-constant-proof}

**Step 1 — Fiber products in covering families are trivial.** Let $\{f_i : t^{(i)} \to t\}$
be a covering family in $J(t)$ — a commutation partition of $t$ into pairwise-commuting
pieces. For $i \neq j$, the fiber product $t^{(i)} \times_t t^{(j)}$ in $T$ is the largest
$u$ with $u \leq t^{(i)}$ and $u \leq t^{(j)}$: the meet $t^{(i)} \wedge t^{(j)}$ in the
prefix order. Since $t^{(i)} \perp t^{(j)}$ (disjoint step-sets), $t^{(i)} \wedge t^{(j)} = e$
(the empty history, which is initial in $T$). Thus $t^{(i)} \times_t t^{(j)} = e$.

**Step 2 — Compatibility forces equality.** A compatible family of sections
$(s_i \in \underline{T}(t^{(i)}) = T)_i$ must satisfy: for each pair $i \neq j$ and for
the canonical maps $g_1 : e \to t^{(i)},\ g_2 : e \to t^{(j)}$ (the unique morphisms from
$e$), the compatibility condition at the fiber product $e$ requires
$$
\underline{T}(g_1)(s_i) \;=\; \underline{T}(g_2)(s_j),
$$
i.e., $s_i = s_j$ (since $\underline{T}$ maps every morphism to $\mathrm{id}_T$). So every
compatible family is a constant family: $s_i = s$ for all $i$, for some $s \in T$.

**Step 3 — Unique amalgamation.** The section $s \in \underline{T}(t) = T$ restricts to
$s$ at each $t^{(i)}$ (identity restriction maps). This is the unique amalgamation of the
compatible family. The two sheaf axioms — separation and gluing — are both satisfied.
Hence $\underline{T}$ is a sheaf on $(T, J)$.

**Step 4 — Internal prefix order.** The sub-presheaf
$\underline{\leq} \hookrightarrow \underline{T} \times \underline{T}$ defined by
$\underline{\leq}(t) = \{(s,s') \in T \times T : s \leq s'\}$ is also constant, hence also
a sheaf by the same argument (fiber products of covering pieces are $e$, compatibility
forces equal constant families). So the internal prefix order on $\mathbf{T}$ at every
stage $t$ is the external prefix order on $T$.  $\square$

#### Consequence for the Internal Saturation Nucleus {#history-object-constant-saturation}

By the theorem, the internal saturation nucleus at stage $t$:
$$
\mathbf{\sigma}^{\mathrm{int}}_t(a)
\;:=\;
\bigvee\Bigl\{\, b \in H_t \;:\;
\forall s \in \mathbf{T},\;
s \leq_{\mathrm{int}} t \;\Rightarrow\; \rho_{s,t}(b) = \rho_{s,t}(a) \Bigr\}
$$
has its quantifier ranging over $s \in T$ with $s \leq t$ in the EXTERNAL order — the same
quantification as the external saturation nucleus $\sigma_t$ (§saturation-nucleus). Therefore:
$$
\mathbf{\sigma}^{\mathrm{int}}_t \;=\; \sigma_t.
$$

**Corollary.** The internal saturation nucleus is the external saturation nucleus. Its
fixed-point set is $\mathrm{Fix}(\sigma_t)$, which properly contains $H_t^*$ in general:
$$
H_t^* \;\subsetneq\; \mathrm{Fix}(\sigma_t) \;=\; \mathrm{Fix}(\mathbf{\sigma}^{\mathrm{int}}_t).
$$
The intermediate layer $\mathrm{Fix}(\sigma_t) \setminus H_t^*$ — the partially-settled
propositions that are backward-stable but not forward-stable — is visible in the internal
language.

#### Consequence for Internal Collapse {#history-object-constant-ic}

The Internal Collapse conjecture (§internal-collapse) proposed that the internal saturation
nucleus $\mathbf{\sigma}^{\mathrm{int}}_t$ lands on $H_t^*$ — equivalently, that it equals
the canonical retraction $\pi_t = \sigma_t \circ \Delta_t$ (§canonical-retraction). The
theorem above refutes this: $\mathbf{\sigma}^{\mathrm{int}}_t = \sigma_t \neq \pi_t$.

The proposed mechanism — that sheafification of $\underline{T}$ would identify one-step
extensions $s \star t$ as "generalized sub-histories of $t$" — is incorrect. The covering
families of $t$ in $J(t)$ partition $t$ into sub-histories $t^{(i)} \leq t$; they do NOT
involve extensions $s \star t \geq t$. The commutation topology $J$ goes in the sub-history direction,
and the constant presheaf is already a sheaf before sheafification — no new identification
is introduced.

The separation between $\sigma_t$ (backward, using sub-histories) and $\Delta_t$ (forward,
using extensions) is NOT an artifact of the external perspective. It is present in the
internal language: the internal transfer condition would require quantifying over
$s \in \mathbf{T}$ with $s \perp_{\mathrm{int}} t$ (one-step commuting extensions), which
is a DIFFERENT quantifier from $s \leq_{\mathrm{int}} t$. The two nuclei are genuinely
distinct internally.

**What IS true internally**: The internal language of $R$ can express both $\sigma_t$ and
$\Delta_t$ separately — the first via the internal prefix order, the second via the
internal commutation relation on $\mathbf{T}$ and the extension maps. Their joint fixed
point $H_t^*$ requires both conditions simultaneously. The two-stage structure is
faithfully present in the internal language.
