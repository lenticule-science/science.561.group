---
type: theorem
status: proved
depends-on: [causal-set-substitution-settling, lorentzian-causal-settling, step-n-cohomological-rank-theorem, aperiodic-regime-cohomology-via-direct-limit, anderson-putnam-direct-limit, lorentzian-apex-void-as-timelike-spacelike, four-regime-dichotomy]
see-also: [causal-set-substitution-settling, horizon-area-bound, settling-gauss-bonnet]
---

# Causal-set substitution cohomology theorem

**Theorem (causal-set substitution cohomology).** *Let $\mathcal{S}$ be a primitive causal-set substitution rule over event types $A = \{a_1, \ldots, a_n\}$ with substitution matrix $M \in \mathrm{Mat}_{n \times n}(\mathbb{N})$ and $\det M \neq 0$. Let $v^\mathrm{CS}_\mathcal{S}$ be the causal-set substitution settling on $E_\infty = \bigcup_k E_k$. Then:*

1. *(Apex-cohomology rank.) The post-quotient classifying invariant satisfies:*
   $$\mathrm{cl\text{-}inv}^{(n)}(v^\mathrm{CS}_\mathcal{S}) \;\cong\; \varinjlim_k \,(\mathbb{Z}^n \xrightarrow{M^T} \mathbb{Z}^n \to \cdots)$$
   *with $\mathbb{Z}$-rank exactly $n$. For unimodular $M$ ($\det M = \pm 1$): $\mathrm{cl\text{-}inv}^{(n)} \cong \mathbb{Z}^n$.*

2. *(Lorentzian interpretation of $H^1$ generators.) Each $\mathbb{Z}$-generator of $\mathrm{cl\text{-}inv}^{(n)}$ corresponds to one event type $a_i \in A$. The generator $e_{a_i}$ records the causal-connection-acquisition events of type $a_i$ — transitivity firings producing timelike pairs whose "root" event is of type $a_i$.*

3. *(Void-cone dual.) By [void-cone cohomology](../../../../../../lorentzian-causal-settling/references/void-cone-cohomology.md) and Verdier duality, the post-quotient void cosheaf homology is:*
   $$H_{1}^{(n)}(\check{\mathcal{F}}_{v^\mathrm{CS}_\mathcal{S}}) \;\cong\; \mathbb{Z}^n$$
   *with generators recording the spacetime-pair-separation events: spacelike-pair-creation events indexed by event type.*

4. *(Growth-rate invariant.) The Perron eigenvalue $\lambda_\mathrm{PF}(M)$ is the spacetime volume growth rate: $|E_k| \sim C \cdot \lambda_\mathrm{PF}^k$ as $k \to \infty$. It appears as a canonical numerical invariant of the causal-set substitution settling, independent of the cohomological rank.*

## Proof

### Part 1: rank computation — direct reduction to step-$n$

The causal-set substitution $\mathcal{S}$ with event types $A = \{a_1, \ldots, a_n\}$ defines, by forgetting the causal structure within each $\mathcal{S}(a_i)$, an underlying symbolic substitution rule $\bar{\mathcal{S}}$ on the alphabet $A$: replace each $a_i$ by the word $w_i \in A^*$ given by the event-type labels of $\mathcal{S}(a_i)$ in their causal order.

The substitution matrix $M$ of $\mathcal{S}$ (as defined in [causal-set-substitution-settling](../objects/causal-set-substitution-settling.md)) equals the substitution matrix of $\bar{\mathcal{S}}$ (counting letter-types in substitution words).

**Claim:** $\mathrm{cl\text{-}inv}^{(n)}(v^\mathrm{CS}_\mathcal{S}) \cong \mathrm{cl\text{-}inv}^{(n)}(v_{\bar{\mathcal{S}}})$.

*Proof of claim:* The non-Scott-continuous firing ordinals of $v^\mathrm{CS}_\mathcal{S}$ correspond exactly to the causal-transitivity-closure firings that arise from substitution-level transitions: a new causal connection $(e_1, e_2)$ is established at an NSC firing $\mu$ exactly when it arises from a chain $e_1 \prec_{k_1} e_3 \prec_{k_2} e_2$ crossing substitution-level boundaries. These are the "substitution-induced transitivity firings," one per causal-connection-acquisition event that spans substitution levels.

The settling-shift quotient on NSC firings identifies firings of the same event type, by the same primitivity argument as in [step-$n$ cohomological rank theorem](../../../../../../aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-cohomological-rank-theorem.md) Part 2. Since the event-type structure is governed entirely by the matrix $M$ (the causal structure within each $\mathcal{S}(a_i)$ only affects the internal-to-one-level firings, which are Scott-continuous), the settling-shift orbits are indexed by $A$, giving $n$ orbits.

By the same Part 3 reduction as in [step-$n$ cohomological rank theorem](../../../../../../aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-cohomological-rank-theorem.md):
$$\mathrm{cl\text{-}inv}^{(n)}(v^\mathrm{CS}_\mathcal{S}) \;\cong\; \varinjlim_k \,(\mathbb{Z}^n \xrightarrow{M^T} \mathbb{Z}^n).$$

For non-singular $M$, this has $\mathbb{Z}$-rank $n$. For unimodular $M$, it is $\mathbb{Z}^n$ exactly. $\square$ (Part 1)

### Part 2: Lorentzian interpretation of generators

Each generator $e_{a_i}$ of $\mathrm{cl\text{-}inv}^{(n)}$ corresponds to the settling-shift orbit class of $a_i$-type NSC firings. In the causal-set settling context, an NSC firing at ordinal $\mu$ for event type $a_i$ is:

- A pair $(e_1, e_2)$ acquiring causal-connection value $\mathbf{t}$ at $\mu$.
- Via the [Lorentzian apex/void as timelike/spacelike theorem](lorentzian-apex-void-as-timelike-spacelike.md), this is: $e_1$ enters the causal past of $e_2$ at stage $\mu$.
- The "type" of this firing is the event type of the originating event in the substitution chain.

So $e_{a_i}$ records "a causal-connection-acquisition event whose root is of type $a_i$" — the event that a new timelike connection is established originating from an $a_i$-typed event. $\square$ (Part 2)

### Part 3: void-cone dual

By [void-cone cohomology](../../../../../../lorentzian-causal-settling/references/void-cone-cohomology.md), $H_1(\check{\mathcal{F}}_v) \cong H^1(\mathcal{F}_v)$ via Verdier duality. Applying the post-quotient:
$$H_1^{(n)}(\check{\mathcal{F}}_{v^\mathrm{CS}_\mathcal{S}}) \;\cong\; \mathrm{cl\text{-}inv}^{(n)}(v^\mathrm{CS}_\mathcal{S}) \;\cong\; \mathbb{Z}^n.$$

The void generator $\bar{e}_{a_i}$ records "a pair leaving the void — becoming non-spacelike — at a firing of type $a_i$." This is the same event as the apex generator, from the void side: each causal-connection acquisition simultaneously removes a spacelike-pair from the void. $\square$ (Part 3)

### Part 4: growth-rate invariant

The Perron–Frobenius theorem (for a primitive non-negative integer matrix $M$) gives a unique positive real eigenvalue $\lambda_\mathrm{PF} > 0$ with $\lambda_\mathrm{PF} \geq |\lambda|$ for all other eigenvalues $\lambda$. The $k$-step event count:
$$|E_k| = \mathbf{1}^T M^k \mathbf{e}_0 \;\sim\; C_0 \cdot \lambda_\mathrm{PF}^k$$
where $\mathbf{e}_0$ is the initial type-count vector and $C_0$ depends on the right Perron eigenvector. This is immediate from the Perron–Frobenius theorem. $\square$ (Part 4)

## The Anderson–Putnam template in the causal-set context

The proof structure mirrors [Anderson–Putnam direct-limit](../objects/anderson-putnam-direct-limit.md) exactly:

| Anderson–Putnam (tiling) | Causal-set version |
|---|---|
| Substitution word over alphabet $A$ | Causal-set substitution over event types $A$ |
| Tile positions in $\Omega_\sigma$ | Causal-connection pairs in $E_\infty \times E_\infty$ |
| Letter type = $a_i$ | Event type = $a_i$ |
| $\check{H}^1(\Omega_\sigma) \cong \mathbb{Z}^n$ | $\mathrm{cl\text{-}inv}^{(n)}(v^\mathrm{CS}_\mathcal{S}) \cong \mathbb{Z}^n$ |
| Perron eigenvalue = tiling expansion rate | Perron eigenvalue = spacetime volume growth rate |

The causal-set substitution cohomology theorem is the Lorentzian analog of the Anderson–Putnam theorem. What changes is the *nature of the cells*: instead of tile positions in a 1D tiling space, the "cells" are causal-connection pairs $(e_1, e_2)$ in a Lorentzian causal set, with the apex/void structure giving the timelike/spacelike decomposition.

## Concrete instance: the diamond substitution

For the diamond-substitution causal set (see [causal-set-substitution-settling](../objects/causal-set-substitution-settling.md) §"Example"), with $n = 1$ event type and $M = (4)$:

$$\mathrm{cl\text{-}inv}^{(1)}(v^\mathrm{CS}_{\mathcal{S}_\diamond}) \;\cong\; \varinjlim (\mathbb{Z} \xrightarrow{4} \mathbb{Z} \xrightarrow{4} \cdots) \;\cong\; \mathbb{Z}[1/4].$$

The classifying invariant is $\mathbb{Z}[1/4]$ (the $4$-adic rationals) — rank 1, with denominators allowed. Gauss–Bonnet (post-quotient): $\chi^{(1)} = 1 - 1 = 0$.

Growth rate: $\lambda_\mathrm{PF} = 4$ — each event spawns 4 daughter events per substitution step.

## What this gives

**The corpus recovers the causal-set analog of Anderson–Putnam.** The post-quotient classifying invariant $\mathrm{cl\text{-}inv}^{(n)} \cong \mathbb{Z}^n$ (or its $\mathbb{Z}[1/d]$-localization) is the correct cohomological invariant for primitive causal-set substitutions, matching the structure of the tiling-space result in the Lorentzian context.

**Lorentzian geometry generates cohomology.** The causal structure — specifically, the distinction between timelike and spacelike pairs — is what produces the $H^1$ generators. The $n$ generators correspond to $n$ types of causal-connection-acquisition events. This is the first instance in the corpus where Lorentzian geometry (not just abstract substitution dynamics) drives a specific cohomological computation.

**The Perron eigenvalue as a geometric invariant.** $\lambda_\mathrm{PF}$ is not a cohomological invariant (it is not an MLD invariant of the settling) but it is a *growth-rate invariant* — it classifies the causal set's spacetime-expansion rate. Two causal-set substitution settlings with the same $\mathrm{cl\text{-}inv}^{(n)}$ may have different $\lambda_\mathrm{PF}$: the Perron eigenvalue is an additional geometric datum beyond the cohomological rank.
