---
id: raw-new-modes-presheaf
name: RawNewModesPresheaf
description: "N_{[k]}^{raw} — the pointwise (presheaf) cokernel of E_0^{[k]} → E_0^{[k+1]}; constant fiber K^{d_{k-1}} at every history with all restriction maps zero; not a sheaf in general; sheafifies to the depth-new-modes sheaf N_{[k]}."
defines: RawNewModesPresheaf
---

### Construction — The Raw New-Modes Presheaf {#raw-new-modes-presheaf}

The **raw new-modes presheaf** at depth step $k$ is the pointwise cokernel of the
inclusion $E_0^{[k]} \hookrightarrow E_0^{[k+1]}$, computed fiberwise without
imposing any covering compatibility:
$$
N_{[k]}^{\mathrm{raw}}(t) \;:=\; K^{H_t^{[k+1]*} \setminus H_t^{[k]*}},
$$
with all restriction maps defined to be zero.

$N_{[k]}^{\mathrm{raw}}$ is a presheaf of $K$-modules on $T$. It is not in general a
sheaf on $(T,J)$.

#### Why the Restriction Maps Are Zero {#rnmp-zero-restrictions}

Let $x \in H_{t'}^{[k+1]*} \setminus H_{t'}^{[k]*}$ be a new stable element at $t'$.
Its restriction $\rho_{t \leq t'}(x) \in H_t^{[k+1]*}$ is a stable element at any
sub-history $t \leq t'$. The claim (§depth-new-modes) is that this restriction
lands in the old stable layer: $\rho_{t \leq t'}(x) \in H_t^{[k]*}$.

The mechanism: at sub-histories $t$ where the saturation nucleus $\sigma_t = \top$
(for instance $t = \epsilon$, where no sub-histories impose relational context),
the element $\mathrm{Trans}(\mathrm{False})$ — the archetype of a newly stable
element at depth $k+1$ — collapses to $\top \in H_t^{[k]*}$. The restriction is old.

In the fiberwise cokernel, $\rho_{t \leq t'}(x)$ therefore maps to zero in
$N_{[k]}^{\mathrm{raw}}(t) = K^{H_t^{[k+1]*} \setminus H_t^{[k]*}}$. Every
restriction map of $N_{[k]}^{\mathrm{raw}}$ is zero.

This zero-restriction claim is a property of the presheaf cokernel; whether it survives
sheafification (i.e., whether the restriction maps of the sheaf $N_{[k]}$ are also zero)
is a separate question. See §raw-new-modes-presheaf.

#### Relation to $N_{[k]}$ {#rnmp-sheafification}

The depth-new-modes sheaf (§depth-new-modes) is the sheafification of
$N_{[k]}^{\mathrm{raw}}$:
$$
N_{[k]} \;=\; \bigl(N_{[k]}^{\mathrm{raw}}\bigr)^+.
$$

The fiberwise sections $N_{[k]}(t)$ may differ from
$N_{[k]}^{\mathrm{raw}}(t) = K^{d_{k-1}}$ after sheafification. Two open questions
determine whether the presheaf and sheaf can be used interchangeably for cohomological
computations:

**Open question — Sheafification Fiber Preservation.** Is
$$
N_{[k]}(t) \;\cong\; K^{d_{k-1}}
$$
for all $t$? The sheaf condition at a covered object $t$ requires the restriction maps
into the covering family to be jointly injective. If the restriction maps of
$N_{[k]}^{\mathrm{raw}}$ are zero and the covering objects have nonzero fibers, the
sheaf condition forces the fiber at $t$ to zero after sheafification.

**Open question — Restriction Maps of $N_{[k]}$.** Are the restriction maps of the
sheaf $N_{[k]}$ also zero? The sheaf $N_{[k]}$ is defined as the sheafification of
$N_{[k]}^{\mathrm{raw}}$, not by the zero-restriction property. After sheafification,
the restriction maps are determined by the covering structure, not by the presheaf
restriction maps of $N_{[k]}^{\mathrm{raw}}$.

If both questions are answered affirmatively, then the Čech computation using zero
restriction maps on $N_{[k]}^{\mathrm{raw}}$ gives $H^1(T,J;\,N_{[k]})$. Otherwise,
computing $H^1(T,J;\,N_{[k]}^{\mathrm{raw}})$ and $H^1(T,J;\,N_{[k]})$ are separate
problems, and the Tier~1 computation (§PLANS_MATH) addresses only the former unless
the fiber-preservation question is resolved.

#### Fiberwise Dimension {#rnmp-fiber-dim}

By the Nuclear Fibonacci Recurrence (§nuclear-fibonacci-recurrence):
$$
\dim_K N_{[k]}^{\mathrm{raw}}(t) \;=\; d_{k+1} - d_k \;=\; d_{k-1}
$$
for all $t$. This is a **local** (per-fiber) datum; it quantifies what is new at each
individual history. It does not by itself determine
$\dim_K H^1(T,J;\,N_{[k]})$, which is a **global** quantity depending on the topology
of $(T,J)$, the covering structure, and whether the fiber-preservation question above
has an affirmative answer.
