---
title: "The learning cycle is a closure: a fixed-point model of learning and a four-regime hierarchy of depth"
date: 2026-06-25
abstract: We model a learning episode as iteration of a monotone, inflationary operator on a complete lattice of learner states. Two elementary facts of fixed-point theory then become statements about learning. First, such iteration ascends and admits no nontrivial periodic orbits, so the "learning cycle" is properly a spiral converging to a fixed point — a theorem, not a metaphor. Second, the closure ordinal of the operator — the stage at which iteration stabilizes — partitions learning into exactly four regimes at the ordinal boundaries ω and ω₁: finite, ω-continuous, bounded-transfinite, and uncountable. We argue these four regimes are four qualitatively distinct depths of learning already described in the literature — rote acquisition, automatization (the power law of practice), conceptual change, and adaptive expertise — and we give falsifiable predictions. This is the dynamic companion to a previous result identifying the four Diátaxis documentation types with the four-element Belnap–Ginsberg bilattice; here the same bilattice carries the closure operators whose iteration is learning.
keywords: [learning cycle, closure operator, fixed point, closure ordinal, Scott continuity, power law of practice, conceptual change, adaptive expertise, bilattice]
---

# The learning cycle is a closure
## Abstract

We model a learning episode as iteration of a monotone, inflationary operator on a
complete lattice of learner states. Two elementary facts of fixed-point theory then
become statements about learning. First, such iteration ascends and admits no
nontrivial periodic orbits, so the "learning cycle" is properly a *spiral* converging
to a fixed point — a theorem, not a metaphor. Second, the *closure ordinal* of the
operator — the stage at which iteration stabilizes — partitions learning into exactly
four regimes at the ordinal boundaries $\omega$ and $\omega_1$: finite, $\omega$-
continuous, bounded-transfinite, and uncountable. We argue these four regimes are four
qualitatively distinct *depths* of learning already described in the literature — rote
acquisition, automatization (the power law of practice), conceptual change, and
adaptive expertise — and we give falsifiable predictions. This is the dynamic companion
to a previous result [companion] identifying the four Diátaxis documentation types with
the four-element Belnap–Ginsberg bilattice; here the same bilattice carries the closure
operators whose iteration is learning.

## 1. Introduction

The most influential picture of a learning episode is a *cycle*: Kolb's experiential
learning cycle [1] runs concrete experience → reflective observation → abstract
conceptualization → active experimentation, and back. The word "cycle" is usually taken
as metaphor. We show that under a minimal formalization it is a theorem with a
correction: a learning episode is a monotone ascent that never returns to a previous
state — a *spiral*, as Kolb himself later put it — and the only states it can revisit
are fixed points, where nothing remains to be learned.

The formalization is deliberately weak: a complete lattice $L$ of learner states and a
single *learning operator* $f\colon L\to L$ that is monotone (more known going in yields
more known coming out) and inflationary (a step never forgets). These are exactly the
hypotheses of the classical fixed-point theorems of Tarski [2], Markowsky [3], and
Cousot–Cousot [4]. The transfinite iteration of $f$ from a seed stabilizes at an
ordinal $\kappa$, the operator's *closure ordinal* — a notion studied in its own right,
e.g. for the modal $\mu$-calculus [5, 6]. Our second observation is that the position of
$\kappa$ relative to the two boundaries $\omega$ and $\omega_1$ sorts learning into four
qualitatively different regimes, and that these four regimes match four kinds of
learning that the cognitive and educational literature already distinguishes on
independent grounds.

The state lattice we have in mind is the one identified in the companion paper
[companion]: learner states are valuations into the four-element Belnap–Ginsberg
bilattice $\mathbf{4}$, and the learning operator is built from the bilattice's two
closure operators. Section 3 makes this precise, but Sections 2 and 4 — the
mathematics — need only a complete lattice and a monotone inflationary map, and are
self-contained.

## 2. Learning operators and the spiral

Let $(L,\le)$ be a poset. A map $f\colon L\to L$ is **inflationary** if $x\le f(x)$ for
all $x$, **monotone** if $x\le y$ implies $f(x)\le f(y)$, and **idempotent** if
$f(f(x))=f(x)$. A **closure operator** is an inflationary, monotone, idempotent map
[7, 8]. Write $f^0=\mathrm{id}$ and $f^{n+1}=f\circ f^{n}$.

**Definition 1 (learning operator).** A *learning operator* on a complete lattice $L$ is
a monotone, inflationary map $f\colon L\to L$. Elements of $L$ are *learner states*,
ordered by $x\le y$ meaning "$y$ knows at least what $x$ knows"; $f$ is "one learning
step".

**Lemma 1 (ascent and no nontrivial cycles).** Let $f$ be a learning operator and
$x\in L$.

1. The orbit is non-decreasing: $x\le f(x)\le f^2(x)\le\cdots$.
2. The orbit has no nontrivial periodic point: if $f^k(x)=x$ for some $k\ge 1$, then
   $f(x)=x$.

*Proof.* (1) $x\le f(x)$ by inflationariness; applying monotone $f$ repeatedly,
$f^n(x)\le f^{n+1}(x)$ for all $n$, so the chain is non-decreasing. (2) From (1),
$x\le f(x)\le f^k(x)=x$, and antisymmetry of $\le$ gives $f(x)=x$. $\qquad\blacksquare$

Lemma 1 is the precise content of "the learning cycle is a spiral." A learner who
returns to an earlier total state has, by part 2, learned nothing in between — the
state was already a fixed point. Genuine learning is strictly ascending and therefore
acyclic; the apparent cyclicity of Kolb's diagram is the *re-traversal of the same four
phase-types at a higher state*, not return to the same state.

**Definition 2 (settled state).** A *settled state* (relative to $f$) is a fixed point
$f(x)=x$: a state on which the learning step has no further effect.

On a complete lattice every learning operator has settled states above any seed, reached
by transfinite iteration (Section 4). The fixed points of a closure operator are exactly
its *closed* elements [7]; Definition 2 generalizes this to operators that need not be
idempotent in one step.

## 3. Two closures, one cycle

We recall just enough of the companion result [companion] to exhibit the intended
learning operator. The four-element bilattice $\mathbf{4}=\{N,T,F,B\}$ carries two
lattice orders: a **knowledge order** $\le_k$ (information increasing, from $N$ = no
information to $B$ = overdetermined) and a **truth order** $\le_t$ (from $F$ = false to
$T$ = true) [9, 10, 11]. For a set $X$ of atomic claims a learner might hold, the
*valuations* $v\colon X\to\mathbf{4}$ form a complete lattice under the pointwise
knowledge order, with another complete-lattice structure under the pointwise truth
order.

A learning environment determines two closure operators on valuations:

- **consolidation** $c_k$ — a closure operator for $\le_k$: close a state under the
  information it already forces (integrate, infer, connect). Its fixed points are the
  knowledge-coherent states.
- **commitment** $c_t$ — a closure operator for $\le_t$: raise a state toward
  actionable truth (decide, generalize, commit). Its fixed points are the
  truth-coherent states.

One turn of the learning cycle composes them, $f = c_t\circ c_k$ (integrate what
experience provided, then commit to what it warrants); a four-phase reading splits each
closure into two of Kolb's phases. The bilattice $\mathbf{4}$ is **interlaced**: the
lattice operations of each order are monotone for the other [10, 12]. Interlacing is
exactly the condition that makes the composite a learning operator:

**Proposition 1.** If the bilattice is interlaced, then $c_t$ is monotone for $\le_k$,
and hence $f=c_t\circ c_k$ is a learning operator on the valuation lattice $(L,\le_k)$.

*Proof sketch.* $c_t$ is built from $\le_t$-joins; in an interlaced bilattice these are
$\le_k$-monotone [10], so $c_t$ is $\le_k$-monotone; $c_k$ is $\le_k$-monotone and
inflationary by construction. The composite of $\le_k$-monotone maps is $\le_k$-monotone,
and $f(v)\ge_k c_k(v)\ge_k v$ shows it is $\le_k$-inflationary. $\qquad\blacksquare$

So Lemma 1 applies to $f$: the bilattice learning cycle spirals up the knowledge order
to a state that is both consolidated and committed. Everything below holds for any
learning operator; the bilattice supplies the canonical one.

## 4. The closure ordinal and the four regimes

On a complete lattice the fixed point above a seed is reached by transfinite iteration
[2, 3, 4]. Define
$$f^{0}(x)=x,\qquad f^{\alpha+1}(x)=f\bigl(f^{\alpha}(x)\bigr),\qquad
  f^{\lambda}(x)=\bigvee_{\beta<\lambda} f^{\beta}(x)\ \ (\lambda\text{ a limit}).$$
By Lemma 1 (extended transfinitely) this is non-decreasing, so by cardinality it
stabilizes: there is a least ordinal $\kappa = \kappa(f,x)$ with
$f^{\kappa+1}(x)=f^{\kappa}(x)$, and $f^{\kappa}(x)$ is the least settled state above
$x$. We call $\kappa(f,x)$ the **closure ordinal** of $f$ at $x$ [5, 6].

Two classical facts locate $\kappa$ analytically. (a) $f$ is **Scott-continuous**
(preserves suprema of ascending $\omega$-chains) iff the fixed point is already the
$\omega$-supremum $\bigvee_{n<\omega} f^{n}(x)$ for every seed, i.e. $\kappa\le\omega$
(Kleene's theorem; Scott [13], Cousot–Cousot [4]). (b) $\kappa<\omega_1$ iff the
stabilization has countable cofinality. These two boundaries cut the ordinals into four
classes.

**Theorem 1 (four-regime hierarchy).** For a learning operator $f$ and seed $x$, the
closure ordinal $\kappa(f,x)$ lies in exactly one of four regimes:

| regime | condition on $\kappa$ | analytic characterization |
|---|---|---|
| **D1 finite** | $\kappa<\omega$ | settles in finitely many steps |
| **D2 continuous** | $\kappa=\omega$ | $f$ Scott-continuous, infinite orbit |
| **D3 bounded-transfinite** | $\omega<\kappa<\omega_1$ | not Scott-continuous, countable cofinality |
| **D4 uncountable** | $\kappa\ge\omega_1$ | not Scott-continuous, uncountable cofinality |

These four conditions are mutually exclusive and jointly exhaustive.

*Proof.* The four ordinal conditions partition the ordinals: every $\kappa$ satisfies
exactly one of $\kappa<\omega$, $\kappa=\omega$, $\omega<\kappa<\omega_1$,
$\kappa\ge\omega_1$, because $\omega$ and $\omega_1$ are fixed ordinals with
$\omega<\omega_1$. The analytic characterizations follow from (a) and (b): $\kappa\le
\omega$ (regimes D1, D2) is Scott-continuity; among these $\kappa<\omega$ (D1) is finite
stabilization and $\kappa=\omega$ (D2) is stabilization exactly at the first limit;
$\kappa<\omega_1$ (D1–D3) is countable cofinality, leaving D4 as uncountable
cofinality. $\qquad\blacksquare$

Unlike the four documentation types of the companion paper — which form a bilattice,
with two incomparable middles — the four *depths* D1–D4 form a **chain**: a filtration
of learning operators by how far their iteration must run,
$$\text{D1} \subsetneq \text{D2} \subsetneq \text{D3} \subsetneq \text{D4}$$
(each regime contains the operators that stabilize no later than its bound). The two
fourfold structures are bijective as sets but carry different order-types; this is a
feature, not a coincidence to be smoothed over.

## 5. Interpretation: four depths of learning

Theorem 1 is mathematics. The identification of its four regimes with four kinds of
learning is an interpretive thesis, grounded in but not entailed by the cited
literature. The organizing idea is that *depth of learning is how far the closure must
iterate* — a fixed-point reading of the long-standing depth-of-processing and
surface/deep distinctions [14, 15, 16].

**D1 — finite: rote and associative learning.** When the material to be closed is a
finite set of independent facts, consolidation halts in finitely many steps:
$\kappa<\omega$. This is paired-associate and rote learning — drill to a criterion, no
restructuring. Its signature is that a finite, bounded amount of practice exhausts it.

**D2 — continuous: automatization and the power law of practice.** Skill acquisition
does not halt at a finite step; it *converges to an asymptote*. Newell and Rosenbloom's
power law of practice [17] and Anderson's account of proceduralization [18] describe
performance approaching a limit it never exactly reaches in finite time. This is
precisely a Scott-continuous closure with $\kappa=\omega$: the settled state is the
supremum of all finite practice, $\bigvee_{n}f^{n}(x)$, and no finite amount attains it
but every finite amount approximates it. Scott-continuity *is* the statement "the limit
of practice is the least upper bound of finite practice."

**D3 — bounded-transfinite: conceptual change.** Some learning cannot be reached by
accumulating increments at all: the learner must take the *limit* of one course of
accumulation and then continue past it, reorganizing. This is conceptual change /
restructuring [19, 20, 21] — the replacement of a naive theory by one not expressible as
more of the old. In the iteration, the naive regime stabilizes at its own $\omega$-limit;
genuine conceptual change is a further step taken *after* that limit, i.e. iteration into
the countable transfinite, $\omega<\kappa<\omega_1$. The prediction is that no schedule
of incremental drill within the old framework reaches the new concept (Section 6).

**D4 — uncountable: adaptive, generative expertise.** At the top is learning that never
settles because the domain itself keeps generating new structure to master: adaptive
expertise [22], expertise as progressive problem-solving [23], the asymptote-breaking
that deliberate practice is designed to sustain [24]. Here no countable schedule of
steps reaches a fixed point ($\kappa\ge\omega_1$): the learner re-opens the problem
faster than any fixed practice regime closes it. This is the formal projection of "expertise
has no ceiling."

These four are the chain D1 ⊂ D2 ⊂ D3 ⊂ D4 of Section 4: rote is contained in skill,
skill in conceptual mastery, conceptual mastery in open-ended adaptive expertise — each
a strictly deeper closure than the last. The SOLO taxonomy's progression from
unistructural to extended-abstract [16] is a coarse human-readable image of the same
filtration.

## 6. Predictions

**Conjecture 1 (the spiral, not the loop).** Longitudinal measurement of a learner's
total competence across repetitions of a learning cycle is monotone non-decreasing;
apparent "return to start" coincides with a measurable plateau (a fixed point), never
with regression. (Lemma 1, operationalized.)

**Conjecture 2 (power-law signature of D2).** Tasks whose optimal documentation/practice
is automatization show power-law-to-asymptote learning curves [17]; the asymptote is
unreachable in finite trials but approached by every finite block — the empirical mark
of $\kappa=\omega$, distinguishing D2 from the bounded curves of D1.

**Conjecture 3 (the transfinite gap of D3).** Conceptual change cannot be produced by
any amount of incremental practice *within* the prior framework: there is a fixed point
of the naive operator (the over-trained misconception) strictly below the target, so
crossing requires a qualitatively different, post-limit intervention. Empirically:
drill-only interventions plateau below conceptual-change targets regardless of dose,
while restructuring interventions succeed — a dose–response dissociation predicted by
$\omega<\kappa$ but not by D1/D2.

**Conjecture 4 (no ceiling in D4).** In adaptive-expertise domains, group performance
shows no stable asymptote under continued deliberate practice; the more the domain is
mastered, the more structure it presents — the behavioral signature of uncountable
cofinality.

## 7. Relation to the companion result and other models

The companion paper [companion] showed the four Diátaxis documentation *types* are the
four-element bilattice $\mathbf{4}$: a static $2\times2$ object with two orders and a
Klein four-group of symmetries. The present four *depths* are a different fourfold: a
**chain** $\text{D1}\subset\text{D2}\subset\text{D3}\subset\text{D4}$ filtered by the
closure ordinal. The two are bijective as four-element sets but not as ordered
structures — the documentation tetrad has incomparable middles, the depth hierarchy is
linear — and that is the honest statement; we do not force them onto one another. What
they share is the carrier: the same bilattice whose four values index documentation
types is the lattice on whose valuations the learning operators of this paper iterate.

Against Kolb [1], we supply what the cycle diagram omits: a direction (Lemma 1: strictly
up, never back) and a notion of completion (Definition 2: the fixed point). Against the
depth-of-processing tradition [14, 15, 16], we supply a mechanism for "depth" — iteration
distance to a fixed point — and a principled reason there are exactly the boundaries
$\omega$ (finite vs. limit) and $\omega_1$ (countable vs. not) where qualitative breaks
occur. The closure-ordinal apparatus is standard: closure ordinals are studied for
monotone operators generally [4] and for the modal $\mu$-calculus specifically [5, 6],
where the same $\omega$/transfinite distinctions classify how fast least fixed points
are reached.

**Formalization.** The spiral (Lemma 1) and the four-regime classification (Theorem 1)
have been formalized and machine-checked in the Lean 4 proof assistant (Lean core only),
with the four regimes realized as a finite decidable classification; the proofs use no
axioms beyond Lean's logical core. The script accompanies this paper
(`../../lean/LearningClosure.lean`).

## References

[companion] M. Sennhauser. *Diátaxis is a bilattice: the documentation quartet as the
Belnap–Ginsberg four-valued structure.* 561 Group, 2026.

1. D. A. Kolb. *Experiential Learning: Experience as the Source of Learning and
   Development.* Prentice Hall, 1984.
2. A. Tarski. A lattice-theoretical fixpoint theorem and its applications. *Pacific
   Journal of Mathematics* 5 (1955), 285–309.
3. G. Markowsky. Chain-complete posets and directed sets with applications. *Algebra
   Universalis* 6 (1976), 53–68.
4. P. Cousot and R. Cousot. Constructive versions of Tarski's fixed point theorems.
   *Pacific Journal of Mathematics* 82 (1979), 43–57.
5. B. Afshari and G. E. Leigh. On closure ordinals for the modal μ-calculus. *Computer
   Science Logic (CSL)* 2013, 30–44.
6. M. Czarnecki. How fast can the fixpoints in modal μ-calculus be reached? In *Fixed
   Points in Computer Science (FICS)* 2010.
7. G. Birkhoff. *Lattice Theory*, 3rd ed. American Mathematical Society, 1967.
8. M. Ward. The closure operators of a lattice. *Annals of Mathematics* 43 (1942),
   191–196.
9. N. D. Belnap. A useful four-valued logic. In *Modern Uses of Multiple-Valued Logic*,
   Reidel, 1977, pp. 5–37.
10. M. L. Ginsberg. Multivalued logics: a uniform approach to reasoning in artificial
    intelligence. *Computational Intelligence* 4 (1988), 265–316.
11. M. Fitting. Bilattices and the semantics of logic programming. *Journal of Logic
    Programming* 11 (1991), 91–116.
12. O. Arieli and A. Avron. Reasoning with logical bilattices. *Journal of Logic,
    Language and Information* 5 (1996), 25–63.
13. D. S. Scott. Continuous lattices. In *Toposes, Algebraic Geometry and Logic*,
    Lecture Notes in Mathematics 274, Springer, 1972, pp. 97–136.
14. F. I. M. Craik and R. S. Lockhart. Levels of processing: a framework for memory
    research. *Journal of Verbal Learning and Verbal Behavior* 11 (1972), 671–684.
15. F. Marton and R. Säljö. On qualitative differences in learning: I. Outcome and
    process. *British Journal of Educational Psychology* 46 (1976), 4–11.
16. J. B. Biggs and K. F. Collis. *Evaluating the Quality of Learning: The SOLO
    Taxonomy.* Academic Press, 1982.
17. A. Newell and P. S. Rosenbloom. Mechanisms of skill acquisition and the law of
    practice. In J. R. Anderson (ed.), *Cognitive Skills and Their Acquisition*,
    Erlbaum, 1981, pp. 1–55.
18. J. R. Anderson. Acquisition of cognitive skill. *Psychological Review* 89 (1982),
    369–406.
19. S. Carey. *Conceptual Change in Childhood.* MIT Press, 1985.
20. S. Vosniadou. Capturing and modeling the process of conceptual change. *Learning and
    Instruction* 4 (1994), 45–69.
21. M. T. H. Chi. Three types of conceptual change: belief revision, mental model
    transformation, and categorical shift. In *International Handbook of Research on
    Conceptual Change*, Routledge, 2008.
22. G. Hatano and K. Inagaki. Two courses of expertise. In H. Stevenson et al. (eds.),
    *Child Development and Education in Japan*, Freeman, 1986, pp. 262–272.
23. C. Bereiter and M. Scardamalia. *Surpassing Ourselves: An Inquiry into the Nature
    and Implications of Expertise.* Open Court, 1993.
24. K. A. Ericsson, R. T. Krampe, and C. Tesch-Römer. The role of deliberate practice in
    the acquisition of expert performance. *Psychological Review* 100 (1993), 363–406.
