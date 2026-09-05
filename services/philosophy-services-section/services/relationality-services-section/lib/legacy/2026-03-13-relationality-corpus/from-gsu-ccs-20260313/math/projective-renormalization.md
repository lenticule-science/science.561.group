---

name: projective-renormalization
description: "the nuclear transfer matrix M acts on slopes by r ↦ 1 + 1/r, whose unique positive fixed point is φ — the worst-approximable irrational; the depth tower is the renormalization orbit and the BC tower theorem is orbit convergence."
---

### Theorem — Projective Renormalization {#projective-renormalization}

The nuclear transfer matrix $M = \begin{pmatrix} 1 & 1 \\ 1 & 0 \end{pmatrix}$
(§nuclear-fibonacci-recurrence) acts on three spaces at once: words, slopes, and
depth-tower levels. The projective action on slopes is the renormalization map
$R(r) = 1 + 1/r$. Its unique positive fixed point is $\varphi$ — and $\varphi$ is
the worst-approximable irrational. The golden ambidexterity program
(§golden-ambidexterity) is, beneath the surface, a projective renormalization theory.

#### The Projective Action {#proj-action}

$M$ acts on column vectors $[p, q]^\top$ by:
$$
M \begin{bmatrix} p \\ q \end{bmatrix} = \begin{bmatrix} p + q \\ p \end{bmatrix}.
$$

The **slope** (projective coordinate) is $r = p/q$. Under $M$:
$$
r \;=\; \frac{p}{q} \;\longmapsto\; \frac{p+q}{p} \;=\; 1 + \frac{q}{p} \;=\; 1 + \frac{1}{r}.
$$

The **projective renormalization map** is:
$$
R : \mathbb{R}_{>0} \to \mathbb{R}_{>0}, \qquad R(r) \;:=\; 1 + \frac{1}{r}.
$$

This is a theorem, not a definition: it is the exact projective action of $M$ on
$\mathbb{RP}^1$ restricted to the positive axis.

#### The Fixed Point {#proj-fixed-point}

The fixed-point equation $R(r) = r$ is $r = 1 + 1/r$, i.e., $r^2 = r + 1$. The unique
positive solution is $\varphi = \frac{1+\sqrt{5}}{2}$. This is the same equation as the
forward–backward balance (§golden-ambidexterity):
$$
\varphi^2 = \varphi + 1 \;\iff\; \varphi = 1 + \frac{1}{\varphi} \;\iff\; R(\varphi) = \varphi.
$$

The balance equation already in §golden-ambidexterity is the projective fixed-point
equation of $M$. "Two steps forward equals one step forward plus standing still" is a
restatement of "$R$ fixes $\varphi$."

#### Three Spaces, One Action {#proj-three-spaces}

$M$ acts projectively on three spaces in the framework:

**Words (substitution dynamics).** The Fibonacci substitution $a \mapsto ab$,
$b \mapsto a$ has substitution matrix $M$. Applying $M$ to the letter-count vector
$(n_a, n_b)^\top$ iterates the substitution. The Perron–Frobenius eigenvector is
$(\varphi, 1)^\top$: the asymptotic ratio of $a$-letters to $b$-letters converges
to $\varphi$.

**Slopes (continued fractions).** $M$ acts on the ratio $r = n_a / n_b$ by $r \mapsto
1 + 1/r$. Starting from $r_0 = 1$, the iterates are the Fibonacci convergents to
$\varphi$:
$$
1,\quad 2,\quad \tfrac{3}{2},\quad \tfrac{5}{3},\quad \tfrac{8}{5},\quad \tfrac{13}{8},\quad \ldots
$$
These are the ratios $F_{n+1}/F_n$. They approach $\varphi$ from alternating sides:
even iterates from below ($1, 3/2, 8/5, 21/13, \ldots < \varphi$) and odd iterates
from above ($2, 5/3, 13/8, 34/21, \ldots > \varphi$). The continued fraction of
$\varphi$ is $[1;1,1,1,\ldots]$ — the orbit of $R$ starting from $1$.

**Depth-tower levels (renormalization orbit).** The depth filtration
$R_0 \hookrightarrow R_1 \hookrightarrow \cdots \hookrightarrow R = \mathbf{Sh}(T,J)$
is the renormalization orbit: each level $R_n$ is the $n$-th rational approximant
to the $\varphi$-fixed structure. The BC tower theorem (§beck-chevalley-tower) —
$\Delta$-BC fails at frontier histories at every finite level but holds in the colimit —
is the statement that the renormalization orbit converges to its fixed point $\varphi$.
The $\Delta$-BC defect at level $n$ is the deviation of the $n$-th iterate $R^n(r_0)$
from $\varphi$.

The three spaces are not analogous descriptions of three separate phenomena. They are
three representations of a single projective action: $M$ acts on the same mathematical
object (a slope in $\mathbb{RP}^1$) whether that slope is realized as a ratio of letter
counts, a Fibonacci ratio, or a depth-tower filtration ratio.

#### The Forward–Backward Alternation {#proj-alternation}

The even/odd alternation of the Fibonacci convergents is the continued-fraction
statement of the σ/Δ structure:

- **Even iterates from below** correspond to $\sigma$ (the saturation nucleus, which
  closes upward from existing content — a join approximation). At even depth levels,
  the tower undershoots $\varphi$: the saturation direction has not yet absorbed all
  transfer constraints.

- **Odd iterates from above** correspond to $\Delta$ (the transfer nucleus, which closes
  downward from future extensions — a meet approximation). At odd depth levels, the
  tower overshoots $\varphi$: the transfer direction has overcorrected.

At the fixed point $\varphi$, the two sequences coincide: $\sigma$ and $\Delta$ agree,
forward generation and backward determination converge. This is the ambidexterity
conjecture (§ambidexterity) stated as the convergence of a projective orbit.

#### φ is the Worst-Approximable Irrational {#proj-worst-approx}

The continued fraction $\varphi = [1;1,1,1,\ldots]$ has all partial quotients equal to
(1) — the minimum value a partial quotient can take. This is the defining property of
**worst approximability**.

**Hurwitz's theorem.** For any irrational $\alpha$:
$$
\left|\alpha - \frac{p}{q}\right| \;<\; \frac{1}{\sqrt{5}\,q^2}
$$
has infinitely many rational solutions $p/q$. The constant $\sqrt{5}$ is optimal: it
cannot be replaced by $\sqrt{5} + \varepsilon$ for any $\varepsilon > 0$ while retaining
infinitely many solutions — unless $\alpha$ is $\mathrm{GL}(2,\mathbb{Z})$-equivalent to
$\varphi$. The Fibonacci convergents $F_{n+1}/F_n$ achieve the Hurwitz bound with
equality up to lower-order terms:
$$
\left|\varphi - \frac{F_{n+1}}{F_n}\right| \;=\; \frac{1}{\sqrt{5}\,F_n^2} + O(F_n^{-4}).
$$

Among all irrationals, $\varphi$ has the worst rational approximations: its approximation
error decreases as slowly as the Hurwitz theorem permits. Equivalently, no finite-level
Fibonacci rational is "close enough" to $\varphi$ to eliminate the approximation error at
that level. The approximation never closes.

**Why this matters for the Zeno gap.** The Zeno settling gap (§zeno-settling) says the
spectral residual $M_t(\delta^{(n)}) \propto \varphi^{-n}$ never vanishes at finite $n$:
the approximation at every finite tower level leaves a positive residual. The worst-
approximability of $\varphi$ provides the Diophantine reason: the Fibonacci convergent
$F_{n+1}/F_n$ at level $n$ misses $\varphi$ by exactly the Hurwitz minimum, and this
minimum is nonzero for all finite $n$. The gap is not a failure of the construction — it
is the signature of the worst-approximable fixed point, present at every finite stage by
necessity.

> **Remark — Hurwitz–Zeno correspondence.** The exact identity
> $F_k|\varphi - F_{k+1}/F_k| = \varphi^{-k}$ (§hurwitz-zeno-conjecture) rewrites
> the step cohomology decay $\dim H^1_\mathrm{tower}(k) \sim C\varphi^{-k}$ as
> $C$ times the normalized Hurwitz residual, and predicts
> $\lim_k F_k \cdot \dim H^1_\mathrm{tower}(k) = C/\sqrt{5}$ — a falsifiable
> numerical statement.

#### The Three Regimes as One Projective Theory {#proj-unification}

The three mathematical regimes named in the literature as connected to $\varphi$:

| Regime | Object | $M$'s role | Fixed point |
|---|---|---|---|
| Substitution dynamics | Letter-count vector $(n_a, n_b)^\top$ | Substitution step | PF eigenvector $(\varphi, 1)^\top$ |
| Continued fractions | Slope $r = n_a/n_b$ | Renormalization step $r \mapsto 1+1/r$ | Fixed slope $\varphi$ |
| Quasicrystal slope selection | Cut-and-project slope | Approximant generation | Worst-approximable $\varphi$ |

All three are representations of the same projective action of $M$. The substitution
selects $\varphi$ as the PF eigenvalue; the continued fraction selects $\varphi$ as the
renormalization fixed point; the quasicrystal selects $\varphi$ as the slope that delays
rational resonance (and hence periodic locking — §periodic-orbit) as long as possible. In
the framework, the aperiodicity material (§aperiodicity, §periodic-orbit,
§aperiodic-patch-completeness) is the quasicrystal-regime statement; the Zeno gap material
(§zeno-settling, §zeno-gap-equivalence) is the continued-fraction-regime statement; and the
nuclear Fibonacci recurrence (§nuclear-fibonacci-recurrence) is the substitution-regime
statement.

They are not three independent arguments for $\varphi$. They are the substitution,
continued-fraction, and tiling representations of a single projective renormalization
theory with fixed slope $\varphi$.
