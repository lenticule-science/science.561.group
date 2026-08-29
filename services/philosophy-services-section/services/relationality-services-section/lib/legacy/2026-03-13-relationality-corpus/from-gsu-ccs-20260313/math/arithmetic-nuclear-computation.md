---

name: arithmetic-nuclear-computation
description: "Concrete computation of the standard saturation and transfer nuclei on divisor lattices for small cases, revealing that the Collatz dynamics arise from inter-fiber structure, not intra-fiber projection."

defines: ArithmeticNuclearComputation
---

### Construction — Arithmetic Nuclei for Small Cases {#arithmetic-nuclear-computation}

The arithmetic history system (§arithmetic-history-system) provides the substrate:
fibers $\mathcal{D}(n)$ with restriction maps $\rho_{m,n}(d) = \gcd(d, m)$. Applying
the standard definitions of $\sigma_t$ (§saturation-nucleus) and $\Delta_t$
(§transfer-nucleus) to this substrate produces specific, computable nuclei. This
section works them out for small $n$ and draws consequences for the Collatz
connection.

---

#### Case $n = p$ (prime) {#anc-prime}

The fiber is $\mathcal{D}(p) = \{1, p\}$. The only proper sub-history is $1$.

**Saturation.** $\sigma_p(a) = \bigvee\{b \in \mathcal{D}(p) \mid \gcd(b, 1) \leq
\gcd(a, 1)\}$. Since $\gcd(b, 1) = 1$ for all $b$, the condition is vacuous. So
$\sigma_p(a) = p$ for all $a$: the saturation nucleus maps everything to the top.

$$
\sigma_p : 1 \mapsto p, \quad p \mapsto p.
\qquad \mathrm{Fix}(\sigma_p) = \{p\}.
$$

**Transfer.** Every prime $q \neq p$ is independent of $p$ (full commutation).
For $\mathcal{D}(pq) = \{1, p, q, pq\}$, the restriction
$\rho_{p,pq}(d) = \gcd(d, p)$ has image $\{1, p\} = \mathcal{D}(p)$. This holds
for every $q$, so $\mathrm{Fix}(\Delta_p) = \mathcal{D}(p)$ and $\Delta_p = \mathrm{id}$.

**Joint projection.** $\pi_p = \sigma_p$: maps everything to $p$.
$H_p^* = \{p\}$.

---

#### Case $n = p^2$ (prime square) {#anc-prime-square}

The fiber is $\mathcal{D}(p^2) = \{1, p, p^2\}$, the three-element chain.
Sub-histories: $1$ and $p$.

**Saturation.** The restriction $\rho_{1,p^2}$ is trivial. The restriction
$\rho_{p,p^2}(d) = \gcd(d, p)$: $1 \mapsto 1$, $p \mapsto p$, $p^2 \mapsto p$.

- $\sigma_{p^2}(1)$: need $\gcd(b, p) \leq 1$, so $b = 1$. $\sigma_{p^2}(1) = 1$.
- $\sigma_{p^2}(p)$: need $\gcd(b, p) \leq p$, which is all $b$. $\sigma_{p^2}(p) = p^2$.
- $\sigma_{p^2}(p^2)$: same condition. $\sigma_{p^2}(p^2) = p^2$.

$$
\sigma_{p^2} : 1 \mapsto 1, \quad p \mapsto p^2, \quad p^2 \mapsto p^2.
\qquad \mathrm{Fix}(\sigma_{p^2}) = \{1, p^2\}.
$$

**Transfer.** Same argument as the prime case: $\Delta_{p^2} = \mathrm{id}$.

**Joint projection.** $\pi_{p^2} = \sigma_{p^2}$: $1 \mapsto 1$, $p \mapsto p^2$,
$p^2 \mapsto p^2$. $H_{p^2}^* = \{1, p^2\}$.

**Observation.** The intermediate divisor $p$ is not stable — it is inflated to
$p^2$. The stable elements are the extremes: the bottom $1$ and the top $p^2$.
This pattern extends: for $\mathcal{D}(p^a)$, the fixed fiber is
$\{1, p^a\} = \{\bot, \top\}$.

---

#### Case $n = pq$ (two distinct primes) {#anc-two-primes}

The fiber is $\mathcal{D}(pq) = \{1, p, q, pq\}$, a four-element Boolean lattice.
Sub-histories: $1$, $p$, and $q$.

**Saturation.** $\rho_{p,pq}(d) = \gcd(d, p)$ and $\rho_{q,pq}(d) = \gcd(d, q)$:

| $d$ | $\gcd(d,p)$ | $\gcd(d,q)$ |
|-----|-------------|-------------|
| $1$ | $1$ | $1$ |
| $p$ | $p$ | $1$ |
| $q$ | $1$ | $q$ |
| $pq$ | $p$ | $q$ |

- $\sigma_{pq}(1)$: need $\gcd(b,p) \leq 1$ AND $\gcd(b,q) \leq 1$. Only $b = 1$.
  $\sigma_{pq}(1) = 1$.
- $\sigma_{pq}(p)$: need $\gcd(b,p) \leq p$ AND $\gcd(b,q) \leq 1$. So $b \in \{1, p\}$.
  $\sigma_{pq}(p) = p$.
- $\sigma_{pq}(q)$: symmetrically, $\sigma_{pq}(q) = q$.
- $\sigma_{pq}(pq)$: all conditions satisfied by all $b$. $\sigma_{pq}(pq) = pq$.

$$
\sigma_{pq} = \mathrm{id}.
\qquad \mathrm{Fix}(\sigma_{pq}) = \mathcal{D}(pq).
$$

**Transfer.** $\Delta_{pq} = \mathrm{id}$ (same argument as before).

**Joint projection.** $\pi_{pq} = \mathrm{id}$. $H_{pq}^* = \mathcal{D}(pq)$.
Everything is already stable.

---

#### The Square-Free Pattern {#anc-square-free}

The computation for $n = pq$ generalizes: **for any square-free $n$, the saturation
nucleus $\sigma_n$ is the identity.**

**Proof sketch.** If $n = p_1 \cdots p_k$ is square-free, each divisor $d$ of $n$
is uniquely determined by its restriction profile $(\gcd(d, p_1), \ldots, \gcd(d, p_k))$.
Each $\gcd(d, p_i)$ is either $1$ or $p_i$. The profile is a binary vector in
$\{1, p_1\} \times \cdots \times \{1, p_k\}$. Different divisors have different profiles.
So no $b \neq d$ satisfies $\gcd(b, p_i) \leq \gcd(d, p_i)$ for all $i$ while being
strictly larger than $d$. Hence $\sigma_n(d) = d$.

In the framework's language: the commutation covers for a square-free $n$ are so rich
that every element is already determined by its local data. The sheaf condition makes
saturation trivial.

---

#### What This Means for Collatz {#anc-collatz-gap}

The standard nuclei produce trivial dynamics for a large class of numbers. This
reveals a structural gap in the current Collatz formulation (§arithmetic-quiescence):

**The Collatz function operates between fibers, not within a single fiber.** The
shortcut map $\bar{C}(n)$ sends $n$ to a different positive integer — a different
fiber in the arithmetic history system. The joint projection $\pi_n$ acts within
$\mathcal{D}(n)$. These are categorically different operations.

In FiberNuclearLanguage normalization, the R7 step also changes the term — it moves between
different syntactic forms. But the denotation stays within the same fiber: R7
changes the syntax, not the semantics. The Collatz function changes the actual
number — the index of the fiber.

**The correct formulation must involve the sheaf-level normalization** — the natural
transformation $\mathsf{NF} : H \to H^*$ (§universe-normalization), which assembles
all fiber-level projections into a single map of presheaves. The Collatz dynamics
should emerge from how the restriction maps interact across fibers as the trajectory
$n \to C(n) \to C^2(n) \to \cdots$ threads through the divisibility poset.

Concretely, consider the Collatz trajectory of $n = 7$:
$$
7 \xrightarrow{3\cdot7+1} 22 \xrightarrow{\div 2} 11 \xrightarrow{3\cdot11+1} 34
\xrightarrow{\div 2} 17 \xrightarrow{\cdots} \cdots \to 1.
$$
Each step moves to a new fiber: $\mathcal{D}(7)$, $\mathcal{D}(22)$,
$\mathcal{D}(11)$, $\mathcal{D}(34)$, etc. The halving steps are genuine restrictions
(they go DOWN in the divisibility order: $11 \mid 22$), but the tripling steps go to
unrelated numbers ($22 \nmid 7$ in either direction).

The halving steps $n \mapsto n/2$ correspond to the restriction map
$\rho_{n/2, n} : H_n \to H_{n/2}$. These are the sheaf-theoretic arrows. The tripling
steps $n \mapsto 3n+1$ do not correspond to any arrow in the history category — they
jump to a new location in the divisibility poset. This jump is precisely what makes the
Collatz problem hard: it leaves the sheaf-theoretic framework.

---

#### Two Possible Resolutions {#anc-resolutions}

**Resolution A: Enlarge the history category.** Instead of using $(\mathbb{Z}_{>0}, \mid)$
with only divisibility arrows, add the Collatz edges as additional morphisms. Define a
category $T_C$ whose objects are positive integers and whose morphisms include both
divisibility and Collatz steps. The Collatz conjecture would then be a connectivity
statement about $T_C$: every object has a path to $1$.

This loses the monoidal structure of the history category (the Collatz edges are not
concatenations of prime steps), but it might gain a well-defined site structure from
which sheaf-theoretic tools can be applied.

**Resolution B: Use the Collatz dynamics to define the nuclei.** Rather than deriving the
Collatz map FROM the nuclear structure, reverse the direction: USE the Collatz map to
DEFINE the nuclei. At each $n$, define:
$$
\sigma_n^C(d) := \gcd\bigl(\bar{C}(n),\, d\bigr), \qquad
\Delta_n^C(d) := \mathrm{lcm}\bigl(d,\, \gcd(n, \bar{C}(n))\bigr).
$$
These are ad hoc, but they illustrate the idea: let the Collatz dynamics determine
the nuclear structure, then check whether the resulting nuclei satisfy the framework's
axioms (extensivity, idempotence, meet-preservation, commutativity). If they do, the
Collatz conjecture becomes a consequence of universal quiescence.

**Resolution C: The hull level (§hull-arithmetic-implication).** The standard nuclei are
trivial at the fiber level because the commutation topology of $(\mathbb{Z}_{>0}, \mid)$ is
too rich — square-free numbers decompose completely along their prime factors, and each
factor's two-element Boolean algebra is too small for non-trivial nuclei.

The hull topos (§hyperversal-hull-topos) resolves this by replacing finite divisor lattices
with infinite stalk Heyting algebras. The axiom-by-axiom analysis in §hull-topos-universe-conjecture
identifies:

- **$\sigma^\Omega = \mathrm{int} \circ \mathrm{cl}$** (regularization): the hull-level
  saturation preserves the sub-patch restriction profile by regularity of the hull space,
  exactly as the fiber-level $\sigma_t$ preserves the sub-history restriction profile.

- **$\Delta^\Omega =$ pattern-equivariant projection**: the hull-level transfer reflects
  germs onto those witnessed by every possible extension, exactly as the fiber-level
  $\Delta_t$ reflects onto the intersection of extension images.

The critical difference: at the hull level, $\Delta^\Omega \neq \mathrm{id}$ even for
single-site fibers, because the infinite stalk has room for germs that are locally
well-defined but fail to appear at every translate of the same local pattern. The
arithmetic triviality ($\Delta_n = \mathrm{id}$) is a **finiteness artifact** — the
two-element algebra $\{1, p\}$ has no room for non-equivariant elements.

**The circularity.** Defining the arithmetic hull requires the arithmetic quasicrystal
$Q^{R_\mathbb{Z}}$, which requires $R_\mathbb{Z}$ to be universally quiescent — i.e.,
requires the Collatz conjecture. So the hull-level resolution is not a proof strategy;
it is a structural prediction: IF the Collatz conjecture is true, THEN the non-trivial
dynamics live at the hull level, and the fiber-level triviality is expected rather than
paradoxical.

The depth tower (§hull-truncation-tower) resolves this circularity in the general case:
build level by level, prove normalization at each finite level, take the colimit. For
the arithmetic case, this is the Zeno settling gap (§zeno-settling) — the same obstacle
identified in §arithmetic-quiescence-zeno.

**Status.** Resolutions A and B are concrete problems at the fiber level. Resolution C
reframes the question at the hull level but inherits the circularity of the general
construction. All three warrant further development.

---

#### Summary of Findings {#anc-summary}

| Number $n$ | $\sigma_n$ | $\Delta_n$ | $H_n^*$ | Remark |
|-----------|-----------|-----------|---------|--------|
| $p$ (prime) | $\mathrm{const}(\top)$ | $\mathrm{id}$ | $\{p\}$ | Maximally unsaturated |
| $p^2$ | $1 \mapsto 1, p \mapsto p^2$ | $\mathrm{id}$ | $\{1, p^2\}$ | Intermediate $p$ inflated |
| $p^a$ ($a \geq 2$) | $\bot, \top$ survive | $\mathrm{id}$ | $\{1, p^a\}$ | Only extremes stable |
| $pq$ (distinct primes) | $\mathrm{id}$ | $\mathrm{id}$ | $\mathcal{D}(pq)$ | Trivially stable |
| square-free $n$ | $\mathrm{id}$ | $\mathrm{id}$ | $\mathcal{D}(n)$ | Trivially stable |

The standard nuclei partition positive integers into two regimes:
- **Prime powers**: non-trivial saturation, fixed fiber = $\{\bot, \top\}$.
- **Square-free numbers**: trivial dynamics, everything already stable.

The Collatz dynamics are non-trivial for ALL positive integers. The gap between the
framework's intra-fiber stability and the Collatz inter-fiber dynamics is the central
obstacle to the arithmetic quiescence conjecture.
