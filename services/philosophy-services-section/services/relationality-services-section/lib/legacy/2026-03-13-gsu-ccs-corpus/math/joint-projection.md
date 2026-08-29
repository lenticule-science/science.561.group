---
id: joint-projection
name: JointProjection
description: "The Joint Projection"
defines: JointProjection
---

### Definition — The Joint Projection $\pi_t$ {#joint-projection}

Given the commuting nuclei $\sigma_t$ and $\Delta_t$ on $H_t$ (§nucleus-commutation), define
$$
\pi_t \;:=\; \sigma_t \circ \Delta_t \;=\; \Delta_t \circ \sigma_t \;:\; H_t \longrightarrow H_t.
$$
The equality of the two composites is exactly the commutativity condition; the definition
is well-posed because they agree.

By the Nuclear Quartet Theorem (§nuclear-quartet-theorem), $\pi_t$ is a **nucleus** on
$H_t$, and its fixed-point set is
$$
\mathrm{Fix}(\pi_t) \;=\; \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t) \;=\; H_t^*.
$$
So $\pi_t$ is the canonical reflection of $H_t$ onto the fixed fiber $H_t^*$ (§fixed-fiber):
$$
\pi_t(a) \;=\; \min\!\bigl\{\, b \in H_t^* \;\big|\; b \geq a \,\bigr\}.
$$
The inclusion $\iota : H_t^* \hookrightarrow H_t$ has $\pi_t$ as its left adjoint:
$$
\pi_t(a) \leq_{H_t^*} c \;\Longleftrightarrow\; a \leq_{H_t} \iota(c)
\quad\text{for all } a \in H_t,\; c \in H_t^*.
$$

#### The Five Roles of $\pi_t$ {#joint-projection-roles}

The same map appears under different names depending on the context in which it is used:

| Name | Context | File |
|---|---|---|
| **Joint projection** $\pi_t$ | Nuclear square / quartet theory | [CommutativeNuclearSquare](commutative-nuclear-square.md), [NuclearQuartetSubalgebra](nuclear-quartet-subalgebra.md) |
| **Canonical retraction** | Proof that $\pi_t$ is a nucleus without commutativity axiom | §canonical-retraction |
| **Semantic normalizer** $\mathsf{NF}_t$ | FiberNuclearLanguage normalization / universe level | §universe-normalization |
| **Stabilization map** $\mathsf{Stab}$ | Invariant locale construction | §invariant-locale, §stabilization |

These are not distinct maps — they are one map seen from four vantage points. The authoritative
definition is the one here. All four contexts should cite §joint-projection as the primary
reference and use the name $\pi_t$ (or a subscript-free $\pi$ when $t$ is clear) when naming
the map itself.

#### The Unit and Counit {#joint-projection-adjunction}

As a nucleus, $\pi_t$ is a KZ-lax-idempotent monad on $H_t$ ([CommutativeNuclearSquare](commutative-nuclear-square.md)):

- **Unit**: $\eta_a : a \leq \pi_t(a)$ — the extensivity of $\pi_t$ as a nucleus.
- **Idempotence**: $\pi_t(\pi_t(a)) = \pi_t(a)$ — the fixed-point layer is already quiescent.
- **Strict gap**: for $a \notin H_t^*$, the inequality is strict: $a < \pi_t(a)$.

The strict gap is what makes $H_t^*$ genuinely smaller than $H_t$: elements outside the
fixed fiber are identified (collapsed upward) by $\pi_t$, not merely renamed. This is
the fiber-level instance of the self-generation property of $R$ (§self-generation).

#### Fiber-Level Instance {#joint-projection-fiber-instance}

In the Relational Universe, the joint projection at each fiber is
$$
\pi_t \;=\; \sigma_t \circ \Delta_t \;:\; H_t \longrightarrow H_t^*.
$$
The family $(\pi_t)_{t \in \mathrm{Ob}(T)}$ is natural: for every morphism $f : t \to t'$,
$$
\pi_t \circ H(f) \;=\; H(f) \circ \pi_{t'}
$$
by nucleus preservation (§reindexing). The naturality means $\pi$ assembles into a
natural transformation $H \Rightarrow H^*$ of presheaves, which is the internal map
$\mathsf{NF} : H \to H^*$ of §universe-normalization.
