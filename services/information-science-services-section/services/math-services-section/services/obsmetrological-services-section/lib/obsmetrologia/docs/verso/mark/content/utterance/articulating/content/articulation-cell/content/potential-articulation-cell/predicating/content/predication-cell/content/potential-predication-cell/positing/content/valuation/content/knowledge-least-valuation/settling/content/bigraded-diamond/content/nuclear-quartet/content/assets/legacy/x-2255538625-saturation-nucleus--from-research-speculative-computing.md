---

name: SaturationNucleus
description: "The Saturation Nucleus"
defines: SaturationNucleus
---

### Definition — The Saturation Nucleus $\sigma_t$ {#saturation-nucleus}

For each proper sub-history $t_0 < t$, write $\rho_{t_0} := H(i_{t_0,t}) : H_t \to H_{t_0}$
for the restriction to $t_0$. The **saturation nucleus** at $t$ is
$$
\sigma_t(a) \;:=\; \bigvee\bigl\{\, b \in H_t \;\big|\; \rho_{t_0}(b) \leq \rho_{t_0}(a)
\text{ for all } t_0 < t \,\bigr\}.
$$
This is the **largest element of $H_t$ whose restriction profile is componentwise $\leq$
that of $a$**. Since $a$ itself satisfies the condition, $\sigma_t(a) \geq a$.

When $t = \epsilon$ (the empty history), no proper sub-histories exist, the condition is
vacuous, and $\sigma_\epsilon(a) = \top_\epsilon$ for all $a$.

#### Nucleus Properties {#saturation-nucleus-nucleus}

$\sigma_t$ is a nucleus on $H_t$ (§nucleus). The three properties:

- **Extensive**: $a$ is in the defining set, so $\sigma_t(a) \geq a$. ✓
- **Idempotent**: Since $H_t$ is finite, the defining join is finite. Restriction maps
  $\rho_{t_0}$ preserve all finite joins (they are Heyting algebra homomorphisms):
  $$\rho_{t_0}(\sigma_t(a)) = \bigvee\bigl\{\rho_{t_0}(b) \;\big|\; \rho_{t_0'}(b) \leq \rho_{t_0'}(a)\;\forall t_0'\bigr\} \leq \rho_{t_0}(a).$$
  Combined with $\sigma_t(a) \geq a$ and monotonicity, $\rho_{t_0}(\sigma_t(a)) = \rho_{t_0}(a)$.
  Hence $\sigma_t(\sigma_t(a)) = \bigvee\{b \mid \rho_{t_0}(b) \leq \rho_{t_0}(\sigma_t(a)) = \rho_{t_0}(a)\} = \sigma_t(a)$. ✓
- **Meet-preserving**: $\rho_{t_0}(\sigma_t(a) \wedge \sigma_t(b)) = \rho_{t_0}(a) \wedge \rho_{t_0}(b) = \rho_{t_0}(a \wedge b)$,
  so $\sigma_t(a) \wedge \sigma_t(b) \leq \sigma_t(a \wedge b)$. Conversely any $c$
  with $\rho_{t_0}(c) \leq \rho_{t_0}(a \wedge b)$ satisfies both bounds, so
  $c \leq \sigma_t(a) \wedge \sigma_t(b)$. ✓

#### Profile Preservation {#saturation-nucleus-profile-preservation}

The idempotence proof establishes a key property used throughout: **$\rho_{t_0}(\sigma_t(a)) = \rho_{t_0}(a)$
for all $t_0 < t$.** Applying $\sigma_t$ does not change how $a$ looks from any shorter
history — it expands $a$ within $H_t$ while holding its sub-history projections fixed.

#### Fixed Points {#saturation-nucleus-fixed-points}

An element is **saturation-stable** — $a \in \mathrm{Fix}(\sigma_t)$ — exactly when it
is already the largest element with its restriction profile:
$$
a \in \mathrm{Fix}(\sigma_t)
\;\Longleftrightarrow\;
\nexists\, b > a \;\text{with}\; \rho_{t_0}(b) = \rho_{t_0}(a) \;\text{for all } t_0 < t.
$$
The sub-algebra $\mathrm{Fix}(\sigma_t)$ is the **sub-history-determined layer** of $H_t$;
its internal structure is developed in §saturation-stable-fiber.

The **Saturate** operator of FiberNuclearLanguage ([fiber-nuclear-language](fiber-nuclear-language.md)) is the internal-language name for $\sigma_t$:
$\mathsf{Saturate}(a)$ denotes $\sigma_t(a)$.

In the saturation–transfer dyad (§saturation-transfer-dyad), $\sigma_t$ is the
backward-facing nucleus — oriented toward the accumulated past (sub-histories).
