---
id: local-settledness
name: LocalSettledness
description: "if a proposition is settled at every member of a covering family, it is settled globally — the sheaf condition for stability."

---

### Theorem — Local Settledness Implies Global Settledness {#local-settledness}

Let $\{t_i \to t\}$ be a covering family in $J$. If $a \in H_t$ satisfies
$\rho_i(a) \in H_{t_i}^*$ for every $i$, then $a \in H_t^*$.

**Proof.** For each $i$:
$$
\rho_i(\sigma_t(a)) = \sigma_{t_i}(\rho_i(a)) = \rho_i(a)
$$
where the first equality is commutation of restriction with $\sigma$
(§reindexing), and the second is the assumption $\rho_i(a) \in H_{t_i}^*
\subseteq \mathrm{Fix}(\sigma_{t_i})$. Since this holds for all $i$, the
Axiom of Locality (joint injectivity of covering families) gives
$\sigma_t(a) = a$.

The identical argument with $\Delta$ gives $\Delta_t(a) = a$. Therefore
$a \in \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t) = H_t^*$.
$\square$

#### Significance {#local-settledness-significance}

This theorem says that the fixed fiber $H_t^*$ is a **sheaf-local** property:
stability can be checked on covers. A proposition that is settled at every
local piece of a history is settled at the history itself.

In the arithmetic history system (§arithmetic-history-system), covering
families for $n = p_1^{a_1} \cdots p_k^{a_k}$ are the prime-power
decompositions. The theorem then says: a divisor of $n$ that is stable at
every prime-power component is globally stable. This is the basis for the
local settledness criterion for the Collatz conjecture
(§collatz-normalization-correspondence).
