---
id: restriction-profile
name: RestrictionProfile
description: "Object: the restriction profile of a proposition a ∈ H_t — the family (ρ_{t₀}(a))_{t₀ < t} of its images under restriction maps to all proper sub-histories; the datum preserved by the saturation nucleus."
---

### Definition — The Restriction Profile {#restriction-profile}

For a history $t$ and an element $a \in H_t$, the **restriction profile** of $a$ at $t$ is
the family
$$
\rho(a) \;:=\; \bigl(\rho_{t_0}(a)\bigr)_{t_0 < t},
$$
where for each proper sub-history $t_0 < t$ the notation $\rho_{t_0}$ abbreviates the
restriction map $H(i_{t_0,t}) : H_t \to H_{t_0}$, the image of the prefix-inclusion
$i_{t_0,t} : t_0 \to t$ under the presheaf $H$.

The restriction profile records how $a$ looks from every shorter history: $\rho_{t_0}(a)$
is the proposition at $t_0$ that $a$ induces by restriction. Two elements $a, b \in H_t$
are **restriction-profile-equivalent** when $\rho_{t_0}(a) = \rho_{t_0}(b)$ for all
$t_0 < t$.

#### What the Restriction Profile Is Not {#restriction-profile-not}

The restriction profile is not the value of $a$ at $t$ itself — that is $a$. It is
the past-facing data: the tuple of values that $a$ projects onto every proper sub-history.
The restriction profile does not determine $a$ uniquely in general; the saturation nucleus
$\sigma_t$ maps $a$ to the largest element with the same restriction profile
(§saturation-nucleus), so distinct elements may share a profile.

#### Key Property — Saturation Preserves Restriction Profile {#restriction-profile-saturation}

The saturation nucleus preserves the restriction profile:
$$
\rho_{t_0}(\sigma_t(a)) \;=\; \rho_{t_0}(a) \quad \text{for all } t_0 < t.
$$

This is proved in §saturation-nucleus (as part of the idempotence argument). It means that
$\sigma_t$ inflates $a$ while keeping every sub-history value fixed — the proposition
grows at $t$ but its past is unchanged. The fixed-point condition $a \in \mathrm{Fix}(\sigma_t)$
is equivalent to $a$ being the largest element with its restriction profile:
no $b > a$ in $H_t$ has the same profile.

#### Usage {#restriction-profile-usage}

The restriction profile appears:

- In the **definition** of the saturation nucleus (§saturation-nucleus): $\sigma_t(a)$ is
  the join of all elements whose restriction profile is componentwise $\leq$ that of $a$.
- In the characterization of the **saturation-stable fiber** (§saturation-stable-fiber):
  $\mathrm{Fix}(\sigma_t)$ consists of elements that are the unique maximum of their
  restriction-profile class.
- In the statement of **History Separation** (§history-separation): distinct histories
  $t \not\cong t'$ are witnessed by distinct restriction profiles of some proposition.
- In **reindexing** (§reindexing): restriction maps preserve the sub-history restriction
  profile because composites of restriction maps are restriction maps.
