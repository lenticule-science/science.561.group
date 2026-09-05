---
id: collatz-normalization-correspondence
name: CollatzNormalizationCorrespondence
description: "The Collatz shortcut map and the R7 reduction step share the same algebraic structure: one expansion move followed by iterated contraction moves until quiescent. This structural correspondence identifies the arithmetic weight-function problem as the obstruction to proving the Collatz conjecture."

---

### Definition — Collatz–Normalization Correspondence {#collatz-normalization-correspondence}

The strong normalization theorem (§strong-normalization) proves that every FiberNuclearLanguage term
reaches a unique normal form. The Collatz conjecture asserts that every positive integer
reaches $1$ under iteration of the Collatz function. These two claims have the same
algebraic skeleton. This section makes the correspondence precise and extracts
consequences.

---

#### The Structural Identification {#collatz-r7-identification}

**R7 step.** The reduction rule R7 rewrites
$$
\mathsf{Saturate}(\mathsf{Transfer}(M)) \;\longrightarrow\; \mathsf{Transfer}(\mathsf{Saturate}(M)).
$$
The backward-facing operator ($\mathsf{Saturate}$) crosses the forward-facing operator
($\mathsf{Transfer}$), moving the canonical order closer to "all Trans inside all Sat."
The weight
$\mathsf{fmlW}$ is preserved; the entanglement $\mathsf{ent}$ decreases by exactly $1$.

**Collatz shortcut step.** The shortcut Collatz map $\bar{C}$ rewrites
$$
n \;\longmapsto\; \frac{3n + 1}{2^{v_2(3n+1)}}
\quad\text{(for odd $n$).}
$$
One expansion move ($n \mapsto 3n+1$) is followed by $v_2(3n+1)$ contraction moves
($\div 2$) until the result is odd again. The total prime content changes; the
parity returns to odd.

**The correspondence.** Both operations have the form:

$$
\text{one expansion move} \;\to\; \text{iterated contraction moves until quiescent}.
$$

| Feature | FiberNuclearLanguage normalization | Collatz dynamics |
|---------|-------------------|------------------|
| Expansion move | $\mathsf{Transfer}(M)$ | $3n + 1$ |
| Contraction moves | $\mathsf{Saturate}$ (possibly iterated via R1) | $\div 2$ (iterated $v_2$ times) |
| Quiescence condition | No $\mathsf{Saturate}$-inside-$\mathsf{Transfer}$ inversions | $n$ is odd |
| Weight preserved | $\mathsf{fmlW}$ (R7 preserves it exactly) | ??? (unknown arithmetic invariant) |
| Measure decreased | $\mathsf{ent}$ (decreases by exactly 1 per R7) | ??? (unknown arithmetic measure) |
| Termination | Proved (lexicographic on $(\mathsf{fmlW}, \mathsf{ent})$) | Open (the Collatz conjecture) |

The gap between "proved" and "open" is exactly one thing: the arithmetic weight function.
In FiberNuclearLanguage, we have the pair $(\mathsf{fmlW}, \mathsf{ent})$, which is well-founded and
strictly decreasing under every reduction step. For the Collatz dynamics, no analogous
pair is known.

---

#### The Arithmetic Weight-Function Problem {#arithmetic-weight-problem}

The strong normalization proof works because two independent quantities cooperate:

1. $\mathsf{fmlW}(M)$ — the polynomial weight — decreases under all rules except R7.
2. $\mathsf{ent}(M)$ — the Trans-inside-Sat nesting degree — decreases under R7.

Together they form a lexicographic pair that is well-founded. The Collatz conjecture
would follow from constructing an arithmetic analog:

1. A quantity $\mathsf{W}(n)$ that is preserved (or decreased) by the expansion step
   $n \mapsto 3n + 1$ and strictly decreased by each contraction step $n \mapsto n/2$.
2. A quantity $\mathsf{E}(n)$ that strictly decreases under the expansion step when
   $\mathsf{W}$ is preserved.

The pair $(\mathsf{W}(n), \mathsf{E}(n))$, lexicographically ordered, would be the
Collatz termination measure. The structural correspondence says: *the reason no one has
found such a pair is that the arithmetic nuclei $\sigma_n$ and $\Delta_n$ have not been
determined* (§arithmetic-nuclear-structure). The weight function is a consequence of the
nuclear structure, not an independent object.

**Remark.** The obvious candidate $\mathsf{W}(n) = \log_2(n)$ fails because the
expansion step $n \mapsto 3n+1$ can increase $\log_2(n)$ by up to $\log_2(3) \approx
1.585$ bits, while each contraction step decreases it by exactly $1$ bit. On average, the
shortcut step decreases $\log_2(n)$ by about $\log_2(4/3) \approx 0.415$ bits, but
individual trajectories can increase for long stretches. The measure is not monotone —
it is only monotone in expectation.

The framework predicts that the correct $\mathsf{W}$ is not $\log_2(n)$ but something
derived from the fiber algebra $\mathcal{D}(n)$ — a lattice-theoretic quantity on the
divisor lattice, not a numerical quantity on $n$ itself.

---

#### The $v_2$–$\mathsf{kc}$ Correspondence {#v2-kc-correspondence}

When R7 fires on $\mathsf{Saturate}(\mathsf{Transfer}(M))$, the subsequent R1 idempotency
reductions depend on the subterm $M$. Specifically, the number of available R1
reductions is determined by $\mathsf{kc}(M)$ — the $\mathsf{Transfer}$-count of $M$,
because $\mathsf{ent}(\mathsf{Saturate}(M)) = \mathsf{ent}(M) + \mathsf{kc}(M)$.

In the Collatz dynamics, the number of contraction steps after an expansion step is
$v_2(3n+1)$ — the $2$-adic valuation of $3n+1$.

**Correspondence:**
$$
v_2(3n+1) \;\longleftrightarrow\; \mathsf{kc}(M).
$$

The $2$-adic valuation counts "how many times 2 divides the result" — how many
successive halvings are available. The Trans-count $\mathsf{kc}(M)$ counts "how many
Trans-operators are in scope" — how many reordering opportunities the subsequent
Sat-reduction has. Both quantify the *depth of available contraction* after one
expansion step.

**Tested prediction (partially confirmed).** For uniformly random odd $n$, the
distribution of $v_2(3n+1)$ is geometric: $P(v_2 = k) = 1/2^k$ for $k \geq 1$.
Computational testing (`src/math-exploration/collatz_predictions.py`) on odd numbers in
Collatz trajectories up to $50000$ confirms the $v_2 = 1, 2, 3$ frequencies
(observed $0.500, 0.236, 0.124$ vs predicted $0.500, 0.250, 0.125$) but finds a
$45\%$ excess at $v_2 = 4$ (observed $0.091$ vs predicted $0.063$).

The excess is a trajectory-autocorrelation effect: Collatz trajectories do not
sample odd residue classes uniformly. The shortcut map $\bar{C}$ sends $n$ to
$(3n+1)/2^{v_2(3n+1)}$, which biases subsequent residues. The framework predicts
that the $\mathsf{kc}$ distribution for FiberNuclearLanguage subterms should show analogous
autocorrelation — a non-trivial check that requires computing the enumeration of
normal forms at each depth.

---

#### The Prime-Escape Property as Zeno Gap {#prime-escape}

The Collatz map does not preserve any finite sub-alphabet of primes. The expansion
step $n \mapsto 3n+1$ generically introduces prime factors outside the factorization
of $n$:

$$
\begin{aligned}
3 \cdot 5 + 1 &= 16 = 2^4 &\text{(stays in $\{2, 3, 5\}$)} \\
3 \cdot 7 + 1 &= 22 = 2 \cdot 11 &\text{(introduces 11)} \\
3 \cdot 11 + 1 &= 34 = 2 \cdot 17 &\text{(introduces 17)} \\
3 \cdot 37 + 1 &= 112 = 2^4 \cdot 7 &\text{(introduces 7)}
\end{aligned}
$$

In the framework's language: the expansion step produces histories outside the
current depth truncation $T^{(n)}$. This is the arithmetic instance of the
Zeno settling gap (§zeno-settling): each finite truncation of the arithmetic
history system normalizes (trivially — any finite set of positive integers
has finite Collatz trajectories), but the normalization does not lift to
the colimit because the expansion step can always escape to a new depth level.

**Corollary.** No proof of the Collatz conjecture can work by induction on the
prime content of $n$ alone, because the prime content is not monotone under
the expansion step. This is a negative structural result: it rules out a class
of proof strategies. The framework identifies the correct induction structure
as the depth tower — but the depth tower's termination at the colimit is
precisely the open problem.

---

#### The Local Settledness Criterion {#collatz-local-settledness}

The Local Settledness theorem states (see §universal-quiescence, proved in
the corpus): if $\{t_i \to t\}$ is a covering family in $J$ and
$\rho_i(a) \in H_{t_i}^*$ for every $i$, then $a \in H_t^*$.

In the arithmetic history system, covering families for $n = p_1^{a_1}
\cdots p_k^{a_k}$ are the prime-power decompositions
$\{p_i^{a_i} \hookrightarrow n\}$. The restriction maps are
$\rho_i(d) = \gcd(d, p_i^{a_i})$.

**Arithmetic restatement.** If the Collatz dynamics settle independently at
every prime-power component of $n$, then the Collatz dynamics settle globally
at $n$.

More precisely: suppose the nuclei $\sigma_n$ and $\Delta_n$ of the arithmetic
history system decompose along the commutation cover as
$$
\sigma_n \cong \sigma_{p_1^{a_1}} \otimes \cdots \otimes \sigma_{p_k^{a_k}},
\qquad
\Delta_n \cong \Delta_{p_1^{a_1}} \otimes \cdots \otimes \Delta_{p_k^{a_k}}.
$$
Then the Collatz conjecture reduces to the **prime-power case**: prove that
$\bar{C}$ terminates on every prime power $p^a$.

**Status.** This reduction depends on the nuclear decomposition hypothesis —
that the arithmetic nuclei factor along commutation covers. The hypothesis is
natural (it holds for the abstract framework by the fiber product structure
of §commutation-covers) but not yet verified for the specific arithmetic case.
If true, it would reduce the Collatz conjecture from "all positive integers"
to "all prime powers" — a significant reduction though not a resolution, since
the expansion step does not preserve prime powers.

---

#### Fibonacci Growth of Trajectory Shapes {#collatz-fibonacci-prediction}

The framework predicts (Idea 11 in IDEAS.md, §nuclear-fibonacci-recurrence) that
the number of distinct FiberNuclearLanguage normal forms at depth $k$ grows like $F_{k+1}$, the
$(k+1)$-th Fibonacci number.

**Tested prediction (falsified).** The naive translation — that the number of
distinct shortcut shapes (sequences of $v_2$ values at each odd step) realized by
Collatz trajectories of numbers with $\Omega(n) \leq k$ grows like $F_{k+1}$ — does
not hold. Computational testing (`src/math-exploration/collatz_predictions.py`) shows that
primes alone ($k = 1$) produce over a thousand distinct shortcut shapes for odd
$n \leq 10000$. Each prime generically has a unique trajectory, so the shape count
is unbounded at every fixed $k \geq 1$.

**Diagnosis.** The Fibonacci recurrence governs the *carrier dimension* $d_n$ of
the tower — the rank of the free fiber algebra at level $n$. The map from tower
level to $\Omega(n)$ (number of prime factors) is not the right translation.
The tower level controls the *depth of modal nesting* in FiberNuclearLanguage, not the number
of prime factors of the index. The Fibonacci growth may hold for a different
arithmetic quantity — perhaps the depth of the divisor lattice, or the number of
distinct prime factors $\omega(n)$ (without multiplicity) — but the naive
prediction fails.

**Salvageable direction — also falsified.** Three alternative translations were
tested (`src/math-exploration/collatz_truncated_shapes.py`): (a) distinct $k$-prefixes
of shortcut shapes, (b) distinct shapes of length exactly $k$, and (c) distinct
shapes over a reduced binary alphabet ($v_2 = 1$ vs $v_2 \geq 2$). None show
Fibonacci growth. The reduced alphabet matches $F_{k+1}$ at $k = 1, 2$ but
diverges from $k = 3$ onward (growing faster than Fibonacci, closer to doubling).

**Conclusion.** The structural correspondence is qualitative, not quantitative
at this level. The Fibonacci recurrence governs the carrier dimension of the
abstract tower (§nuclear-fibonacci-recurrence); it does not directly constrain
the combinatorial diversity of Collatz trajectories under any tested translation.

---

#### What This Correspondence Does Not Do {#collatz-correspondence-limits}

The correspondence is **structural**, not **computational**. It identifies the
algebraic skeleton shared by FiberNuclearLanguage normalization and Collatz dynamics but does not
provide:

1. The arithmetic nuclei $\sigma_n$ and $\Delta_n$. These remain undetermined
   (§arithmetic-nuclear-structure).

2. The arithmetic weight function $(\mathsf{W}(n), \mathsf{E}(n))$. The correspondence
   says such a pair should exist and should be derivable from the nuclear structure,
   but does not construct it.

3. A proof of the Collatz conjecture. The correspondence translates the conjecture
   from "every positive integer reaches 1" to "the arithmetic relational universe
   is universally quiescent" — a restatement, not a resolution.

The value of the correspondence is threefold:

- It identifies **where the difficulty lives**: in the nuclear structure, not in the
  dynamics. Once the arithmetic nuclei are found, the weight function follows. But
  the standard nuclei are trivial for square-free numbers (§arithmetic-nuclear-computation),
  so the relevant nuclear structure may live at the hull level (§hyperversal-hull-topos)
  rather than the fiber level.

- It provides a **proof strategy** via local settledness: decompose along prime-power
  components.

- It makes **testable predictions**, some confirmed and some falsified. The $v_2$
  distribution is approximately geometric (confirmed) with trajectory-autocorrelation
  (a new prediction). The Fibonacci growth prediction for trajectory shapes is
  falsified in its naive form (§collatz-fibonacci-prediction) but may survive in a
  modified form using truncated local shapes rather than full trajectories.
