---

name: arithmetic-history-system
description: "Example: the prime-factorization history system — the free commutative monoid on primes gives (Z_{>0}, ·) as history monoid with divisibility as prefix order; divisor lattices as fibers; FTA as History Separation."

defines: ArithmeticHistorySystem
---

### Construction — The Arithmetic History System {#arithmetic-history-system}

The positive integers $\mathbb{Z}_{>0}$ carry a canonical relational structure: the
**arithmetic history system**, in which natural numbers are histories, divisibility is the
prefix order, and prime factorization is the normal form.

#### The History Monoid {#arithmetic-history-monoid}

Set the step set $\Sigma = \mathsf{Primes} = \{2, 3, 5, 7, 11, \ldots\}$ with
the **full commutation relation** $I = \{(p, q) : p \neq q\}$ — every pair of distinct
primes commutes. Then the history monoid is
$$
\mathbb{M}(\mathsf{Primes},\, I_{\mathrm{full}})
\;\cong\;
(\mathbb{Z}_{>0},\, \cdot),
$$
with the identification: a history $p_1 \star p_2 \star \cdots \star p_k$ (primes with
repetition, order irrelevant by full commutation) corresponds to their product
$p_1 p_2 \cdots p_k$. The empty history $e$ corresponds to $1$.

The **Fundamental Theorem of Arithmetic** is, in history-monoid language, the statement
that $\mathbb{M}(\mathsf{Primes}, I_{\mathrm{full}})$ is a free commutative monoid:
every positive integer has a unique canonical normal form (prime factorization).

#### The Prefix Order: Divisibility {#arithmetic-prefix-order}

The prefix order $m \leq n$ is **divisibility**: $m \leq n$ iff $m \mid n$. The
integer $m$ is a prefix of $n$ because the prime multiset of $m$ is a sub-multiset
of the prime multiset of $n$. The history category $T$ is $(\mathbb{Z}_{>0}, \mid)$
— the poset of positive integers under divisibility.

The initial object is $1$ (the empty history); there is no terminal object. The history
$n$ has **more history** than $m$ whenever $m \mid n$: $n$ has accumulated additional
prime steps beyond those of $m$.

#### Commutation Covers: Prime-Power Factorization {#arithmetic-commutation-covers}

For $n = p_1^{a_1} \cdots p_k^{a_k}$ (distinct primes $p_i$, exponents $a_i \geq 1$),
the prime-power factors
$$
n^{(i)} \;=\; p_i^{a_i}, \quad i = 1, \ldots, k,
$$
are mutually independent: $\gcd(n^{(i)}, n^{(j)}) = 1$ for $i \neq j$, and
$n^{(1)} \star \cdots \star n^{(k)} = n$. The finest commutation cover of the history
$n$ is exactly this prime-power decomposition.

The **cover-width** $w(n) = k$ is the number of distinct prime factors of $n$
($= \omega(n)$ in standard arithmetic notation).

#### The Fiber Algebras: Divisor Lattices {#arithmetic-fiber}

The canonical fiber at $n$ is the **divisor lattice**
$$
H_n \;:=\; \mathcal{D}(n) \;=\; \{d \in \mathbb{Z}_{>0} : d \mid n\},
$$
ordered by divisibility. This is a finite distributive lattice — hence a Heyting
algebra — with:

| Operation | Formula |
|-----------|---------|
| Meet $d \wedge d'$ | $\gcd(d, d')$ |
| Join $d \vee d'$ | $\mathrm{lcm}(d, d')$ |
| Top $\top_n$ | $n$ |
| Bottom $\bot_n$ | $1$ |
| Implication $d \Rightarrow_n d'$ | $\frac{n}{\gcd(n, d)} \cdot \gcd\!\left(\frac{n}{d}, d'\right)$ |

The prime-power decomposition $n = p_1^{a_1} \cdots p_k^{a_k}$ gives
$$
\mathcal{D}(n) \;\cong\; [0, a_1] \times \cdots \times [0, a_k]
$$
as distributive lattices, where $[0, a_i]$ is the $a_i$-element chain. This is
precisely the fiber decomposition along commutation covers (§history-separation):
$$
H_n \;\cong\; H_{n^{(1)}} \otimes \cdots \otimes H_{n^{(k)}},
\quad
H_{p^a} \;=\; \mathcal{D}(p^a) \;=\; [0, a].
$$

**The restriction maps.** For $m \mid n$, the restriction $\rho_{m,n} : H_n \to H_m$
sends $d \mapsto \gcd(d, m)$: keep only the prime factors that $m$ can see.

#### FTA as History Separation {#arithmetic-history-separation}

The unique prime factorization theorem is the **History Separation axiom
(§history-separation) for the arithmetic history system**: no nontrivial permutation
of the histories (= positive integers) is invisible to the divisor-lattice structure.
Distinct positive integers have distinct prime multisets, hence genuinely distinct
modal characters.

At the fiber level, the saturation gap $d < \sigma_n(d)$ for $d \notin H_n^*$ is the
arithmetic content of the claim that there are propositions (divisors of $n$) that
agree on all proper divisor restrictions but differ at $n$ itself — a number-theoretic
formulation of local-to-global failure.

#### The Nuclear Structure: Computed {#arithmetic-nuclear-structure}

The arithmetic history system provides the substrate $(T, J, H, \rho)$. Applying the
standard definitions of $\sigma_t$ (§saturation-nucleus) and $\Delta_t$
(§transfer-nucleus) to divisor lattices yields explicit nuclei computed in
§arithmetic-nuclear-computation.

**Result.** The standard transfer nucleus $\Delta_n = \mathrm{id}$ for all $n$ (every
element of $\mathcal{D}(n)$ is transfer-stable). The standard saturation nucleus $\sigma_n$
is non-trivial only when $n$ has a repeated prime factor:

- For square-free $n$: $\sigma_n = \mathrm{id}$, $H_n^* = \mathcal{D}(n)$.
- For prime powers $p^a$: $\sigma_{p^a}$ inflates all intermediate divisors to the
  extremes, $H_{p^a}^* = \{1, p^a\}$.

**Consequence for Collatz.** The standard nuclei produce trivial intra-fiber dynamics
for square-free numbers. Since the Collatz function operates between fibers (sending
$n$ to $C(n)$, a different number), the Collatz dynamics cannot be identified with the
intra-fiber joint projection. The inter-fiber structure — how restriction maps interact
across the Collatz trajectory — is where the dynamics must live. See
§arithmetic-nuclear-computation for the full analysis and two candidate resolutions.
