---
title: "Coordination Obstruction as Mirror Descent: Acyclicity by Admission and by Relaxation"
description: "Unifies greedy admission control and the Physarum adaptive-network solver as two points on one mirror-descent family over the cover nerve's cycle rank, differing only in Bregman potential."
date-created: 2026-07-25
kind: research-note
keywords:
  - mirror-descent
  - graphic-matroid
  - physarum
  - scheduling
  - cohomology
status: design
declared-by: claude-interactive-session-supplying-lenticule-science
---

## Abstract

A distributed system whose tasks touch overlapping regions of a shared resource can be
described by a cover, and the irreducible coordination it requires can be measured by the
first Betti number $b_1$ of that cover's nerve. We observe that $b_1$ is exactly the
nullity of the graphic matroid on the nerve, which places two apparently unrelated
engineering strategies inside a single optimization problem. The first refuses any task
that would close a cycle, maintaining acyclicity as an admission invariant; this is the
matroid greedy algorithm. The second admits everything and lets a flow dynamics
extinguish redundant edges, reaching acyclicity as an attractor; this is the Physarum
solver of Tero, Kobayashi and Nakagaki. Following the identification of Physarum dynamics
with mirror descent on a network linear program, we note that the choice of Bregman
potential is a free parameter which the biological model fixes to the quadratic
(electrical) case, and that the entropic potential yields a second, equally natural member
of the family: a scheduler that assigns each unit of work to the least-occupied resource
is performing greedy descent on the multinomial log-multiplicity, whose Hessian is the
Fisher–Rao metric. We argue that load-spreading and load-concentration are therefore not
opposed dynamics but the low- and high-exponent regimes of one adaptation law, and we
identify precisely what is lost when no inner product on 1-cochains is available: the rank
$b_1$ survives, but the Hodge decomposition of a given flow into gradient and cyclic parts
does not. We close with the thermodynamic reading of $b_1$ as an erasure cost and with
four open problems.

**Keywords:** Čech nerve, graphic matroid, Physarum solver, mirror descent, Bregman
divergence, Hodge decomposition, Landauer's principle.

---

## 1. Introduction

Consider any system in which concurrent units of work claim overlapping regions of a shared
resource: transactions over database rows, agents editing a filesystem, processes holding
locks, foragers exploiting a patchy environment. The engineering question is always the
same. Two units whose regions overlap must be reconciled; a set of units whose overlaps
form a cycle may be pairwise reconcilable and still admit no globally consistent
resolution. The cost of coordination is not the number of overlaps. It is the number of
*independent cycles* among them.

This quantity has a name. If we form the cover whose elements are the claimed regions and
take the nerve of that cover, the independent cycles are counted by the first Betti number
$b_1$. Everything in this note follows from taking that identification seriously and asking
what an engineer is allowed to do about it.

There are exactly two things one can do. One can refuse to create cycles, admitting a new
unit of work only when it does not close a loop with the work already in flight. Or one can
admit everything and run a dynamics that starves the redundant paths until they vanish. The
first is a combinatorial gate. The second is a continuous flow. They look nothing alike,
they are implemented by disjoint literatures, and — this is the observation the note is
built around — they are the discrete and continuous faces of one optimization problem over
one polytope.

The bridge is the graphic matroid, and the language in which both become visible at once is
mirror descent.

Sections 2 and 3 set up the nerve, $b_1$, and the matroid. Section 4 recalls the Physarum
solver and its variational reading. Section 5 makes the central observation about Bregman
potentials. Section 6 addresses the apparent contradiction between spreading and
concentrating dynamics. Section 7 states precisely what an inner product buys and what it
does not. Section 8 gives the thermodynamic reading. Section 9 lists what is open.

Sections 2 through 4 and 7 are exposition of known results, given in the form the later
argument needs. Sections 5, 6 and 8 contain the note's own claims, and each is labelled
with its status: **proposition** where a short proof is given, **observation** where the
content is a restatement or an immediate consequence, and **conjecture** where the claim is
stated for attack and not established.

---

## 2. Covers, nerves, and the obstruction they carry

Let $X$ be a set of resources and let $\mathcal{U} = \{U_1, \dots, U_n\}$ be a finite
family of subsets, each $U_i$ the region claimed by one unit of work. We do not require the
$U_i$ to cover $X$; only their mutual overlaps matter.

**Definition 2.1 (nerve).** The *nerve* $N(\mathcal{U})$ is the abstract simplicial complex
with vertex set $\{1, \dots, n\}$, in which a finite subset $S$ spans a simplex whenever
$\bigcap_{i \in S} U_i \neq \emptyset$.

In practice one rarely computes past dimension one, because detecting $k$-fold overlaps
costs $O(n^{k+1})$ intersection tests. We therefore work throughout with the 1-skeleton,
which is an ordinary graph.

**Definition 2.2 (overlap graph).** $G = (V, E)$ with $V = \{1, \dots, n\}$ and
$\{i,j\} \in E$ iff $U_i \cap U_j \neq \emptyset$.

Fix a field $k$ and orient each edge arbitrarily. The simplicial cochain complex of $G$ is
two terms,
$$0 \longrightarrow C^0 \xrightarrow{\ \delta\ } C^1 \longrightarrow 0,
\qquad C^0 = k^V, \quad C^1 = k^E,$$
with $(\delta f)(i \to j) = f(j) - f(i)$. Then $H^0 = \ker \delta$ and
$H^1 = C^1 / \operatorname{im} \delta$.

**Fact 2.3.** For a graph $G$ with $c$ connected components,
$$\dim H^0 = c, \qquad b_1 := \dim H^1 = |E| - |V| + c .$$

*Proof.* $\ker\delta$ consists of the functions constant on each component, so
$\dim\ker\delta = c$ and $\operatorname{rank}\delta = |V| - c$. Hence
$\dim H^1 = |E| - (|V| - c)$. $\square$

The quantity $|E| - |V| + c$ is the *cycle rank* or *circuit rank* of $G$. It is
independent of the field and of the chosen orientation, and it vanishes precisely when $G$
is a forest.

**Interpretation.** A 1-cochain assigns a value to each overlap — read it as the
discrepancy observed between the two units sharing that region. A cochain is a *coboundary*
if it arises from a global assignment $f \in C^0$, i.e. if all the pairwise discrepancies
are explained by one consistent global state. $H^1$ measures the failure of that
explanation. On a tree every discrepancy pattern is a coboundary: propagate outward from a
root and every edge is satisfied, because there is exactly one path to each vertex and
therefore no consistency condition to violate. On a graph with cycles there are $b_1$
independent conditions that a discrepancy pattern must satisfy before a global state exists.

This is why $b_1$ and not $|E|$ is the right cost. Overlaps are cheap; *loops* of overlaps
are what force negotiation.

**Remark 2.4 (a genuine limitation, stated here rather than buried).** Everything above uses
constant coefficients. The richer and more useful setting assigns to each region a space of
possible local states and to each overlap a comparison map — a *cellular sheaf* on $G$ — and
then $H^1$ measures obstruction to gluing actual data rather than counting loops in a graph
[Curry 2014; Hansen & Ghrist 2019]. Sheaf $H^1$ can be nonzero on a tree and can vanish on a
graph with cycles, so the constant-coefficient $b_1$ is a proxy, not the target. It is a
good proxy when the local state spaces are uniform and the comparison maps are isomorphisms,
which is the regime of most scheduling applications. Where they are not, $b_1$ is a lower
bound on structure and nothing more. We use $b_1$ throughout because it is what admits the
matroid theory of §3; the sheaf-theoretic version of §5 is open (§9, P3).

---

## 3. $b_1$ is a matroid nullity, and acyclicity is a greedy invariant

Recall that a *matroid* $M = (E, \mathcal{I})$ is a finite ground set with a family
$\mathcal{I}$ of independent subsets closed under inclusion and satisfying the exchange
axiom: if $A, B \in \mathcal{I}$ with $|A| < |B|$, there is $e \in B \setminus A$ with
$A \cup \{e\} \in \mathcal{I}$.

**Definition 3.1 (graphic matroid).** For a graph $G = (V,E)$, let $M(G)$ have ground set
$E$ and let $\mathcal{I}$ be the acyclic edge subsets (the forests). This is a matroid; its
rank function is $r(A) = |V| - c(A)$, where $c(A)$ is the number of components of the
subgraph $(V, A)$.

**Observation 3.2.** $b_1 = |E| - r(E)$. That is, *the first Betti number of the overlap
graph is the nullity (corank) of its graphic matroid.*

This is immediate from Fact 2.3 and Definition 3.1, but it is the hinge of the whole note,
because it converts a topological quantity into an optimization-theoretic one and thereby
makes two literatures commensurable.

Three consequences follow at once.

**(a) Acyclicity is an independence oracle.** A system that maintains $b_1 = 0$ over its
in-flight work is maintaining an independent set of $M(G)$. The test "would admitting this
unit close a cycle?" is exactly the matroid independence test, and it is implemented in
near-linear time by union–find: admit an edge iff its endpoints lie in different components,
then union them.

**(b) Greedy is optimal.** By the Rado–Edmonds theorem, the greedy algorithm computes a
maximum-weight independent set on a matroid and only on a matroid [Edmonds 1971; Oxley
2011]. Kruskal's minimum spanning tree algorithm is the special case $M = M(G)$. So an
admission gate that refuses cycle-closing work is not an ad hoc heuristic; it is the optimal
combinatorial strategy, and its optimality is a theorem about the structure it happens to be
running on.

**(c) Bases are spanning forests.** The bases of $M(G)$ are the maximal forests. A system
driving $b_1 \to 0$ while retaining as much work as possible is searching for a basis.

The last point is what §5 needs, so we record it separately.

**Fact 3.3.** The vertices of the *spanning tree polytope* — the convex hull of indicator
vectors of spanning trees of $G$ — are precisely the bases of $M(G)$. Optimizing a linear
functional over this polytope therefore has an optimal solution at a spanning tree, and
network linear programs of this type have spanning-tree optimal bases.

---

## 4. The Physarum solver and its variational reading

The plasmodium of *Physarum polycephalum* is an acellular slime mold: a single multinucleate
cell that forms a network of protoplasmic tubes. Placed in a maze with food at two points,
it retracts its tubes everywhere except along the shortest connecting path [Nakagaki, Yamada
& Tóth 2000]. Tero, Kobayashi and Nakagaki gave a model of this behaviour that has since
been studied as an algorithm in its own right [Tero, Kobayashi & Nakagaki 2007; Tero et al.
2010].

**The model.** On a graph with edge lengths $L_e > 0$, each edge carries a time-varying
conductivity $D_e(t) > 0$. Given a unit flux injected at a source and withdrawn at a sink,
pressures $p$ are determined by Kirchhoff's laws — that is, by the weighted Laplacian system
$$L(D)\, p = q, \qquad L(D) = \delta^{\mathsf T} \operatorname{diag}(D_e / L_e)\, \delta ,$$
where $q$ is the demand vector — and the flux on each edge is
$Q_e = (D_e / L_e)(p_u - p_v)$. Conductivities then adapt:
$$\frac{dD_e}{dt} = f(|Q_e|) - \gamma D_e , \qquad f(|Q|) = |Q|^{\mu} . \tag{4.1}$$
Carrying flux thickens a tube; disuse thins it.

**The variational content.** Two classical facts make (4.1) more than a plausible feedback
rule.

*Thomson's principle.* Among all flows satisfying the conservation constraint, the one
realized by Kirchhoff's laws is the unique minimizer of the dissipation
$$\mathcal{D}(Q) \;=\; \sum_{e \in E} \frac{L_e\, Q_e^2}{D_e} . \tag{4.2}$$
So the fast variable (the flow) solves a quadratic minimization at every instant, and the
slow variable (the conductivity) reshapes the quadratic form being minimized.

*Convergence.* For $\mu = 1$, Bonifaci, Mehlhorn and Varma proved that the dynamics converges
to the shortest source–sink path, so the model genuinely computes [Bonifaci, Mehlhorn & Varma
2012]. Straszak and Vishnoi then showed that the Physarum dynamics is not merely
convergent but is a recognizable member of the optimization canon: it is a continuous-time
interior-point / iteratively-reweighted-least-squares method, and suitable generalizations
solve linear programs, with the undirected transshipment problem as the base case
[Straszak & Vishnoi 2016].

That last identification is the one we build on. Stated in the form we need:

**Fact 4.1 (Straszak–Vishnoi, informally).** The Tero–Kobayashi–Nakagaki dynamics is a
mirror-descent-type flow on a network linear program whose optimal bases are spanning trees
of the underlying graph — that is, bases of $M(G)$.

Compare §3(c). The greedy admission gate searches for a basis of $M(G)$ by combinatorial
refusal. The Physarum dynamics searches for a basis of $M(G)$ by continuous relaxation.
They are two algorithms for one problem, and the fact that one runs on a slime mold and the
other in a lock manager is a fact about implementation, not about mathematics.

---

## 5. One solver, two potentials

Mirror descent [Nemirovski & Yudin 1983; Beck & Teboulle 2003] minimizes a function over a
convex set by the iteration
$$x_{t+1} \;=\; \arg\min_{x \in \mathcal{K}} \Big\{ \langle g_t, x\rangle
+ \tfrac{1}{\eta}\, D_\Phi(x, x_t) \Big\},$$
where $\Phi$ is a strictly convex *potential* on $\mathcal{K}$ and
$$D_\Phi(x,y) \;=\; \Phi(x) - \Phi(y) - \langle \nabla\Phi(y),\, x - y\rangle$$
is its Bregman divergence. The potential is a free parameter. Two choices are canonical:

| potential $\Phi$ | divergence $D_\Phi$ | Hessian metric $\nabla^2\Phi$ | resulting method |
|---|---|---|---|
| $\tfrac12\|x\|_2^2$ | squared Euclidean | $I$ | gradient descent |
| $\sum_i x_i \log x_i$ | Kullback–Leibler | $\operatorname{diag}(1/x_i)$ | multiplicative weights |

The Hessian of a strictly convex potential defines a Riemannian metric on the interior of
$\mathcal{K}$; mirror descent is steepest descent in that metric. For the negative-entropy
potential on the simplex, $\nabla^2\Phi = \operatorname{diag}(1/x_i)$ is the Fisher–Rao
metric, known in evolutionary dynamics as the Shahshahani metric [Amari & Nagaoka 2000].

**Observation 5.1.** *The Physarum solver fixes the potential to the quadratic case.* This
is visible in (4.2): dissipation is a quadratic form, and $1/D_e$ are its weights. The
conductivity vector is not an auxiliary bookkeeping device — it *is* the inner product on
1-cochains, and adaptation (4.1) is a flow on the space of inner products. A tube
conductance and a metric coefficient are the same datum under two names.

Nothing in Fact 4.1 requires the quadratic choice. This is the note's central point.

**Observation 5.2 (the entropic member).** Consider a scheduler that must assign $N$ units
of work across $m$ resources and that tracks the occupancy vector $n = (n_1, \dots, n_m)$
with $\sum_i n_i = N$. Define
$$\Phi(n) \;=\; \sum_{i=1}^m \log_2 (n_i!) , \tag{5.1}$$
so that the multinomial log-multiplicity — the Boltzmann configurational entropy of the
assignment — is $S(n) = \log_2 N! - \Phi(n)$. Then:

**Proposition 5.3.** $\Phi$ is strictly convex on the nonnegative integers, its discrete
increment is $\Phi(n+1) - \Phi(n) = \log_2(n+1)$, and greedy descent on $\Phi$ assigns each
arriving unit to a least-occupied resource. Moreover, minimizing $\Phi$ and maximizing $S$
are the same act.

*Proof.* The increment is immediate from $\log_2((n+1)!) = \log_2(n!) + \log_2(n+1)$.
Strict convexity: the second difference is $\log_2(n+2) - \log_2(n+1) > 0$. (On the reals
this is the log-convexity of $\Gamma$, Bohr–Mollerup.) Greedy descent places the next unit
where the increment is least; since $\log_2(\cdot)$ is increasing, $\arg\min_i \log_2(n_i+1)
= \arg\min_i n_i$. Finally $S = \log_2 N! - \Phi$ with $N$ fixed, so the two objectives
differ by a constant and a sign. $\square$

**Proposition 5.4.** By Stirling, $\log_2(n!) = n\log_2 n - n/\ln 2 + O(\log n)$, so on the
constraint surface $\sum_i n_i = N$,
$$\Phi(n) \;=\; \sum_i n_i \log_2 n_i \;+\; \text{const} \;+\; O(m \log N).$$
Hence $\Phi$ agrees with the unnormalized negative-entropy potential up to affine terms, and
$\nabla^2 \Phi = \operatorname{diag}(1/n_i)$ to leading order: *the Fisher–Rao metric.*

Propositions 5.3 and 5.4 together give the observation the note exists to make.

> **A scheduler that assigns each unit of work to the least-occupied resource is running
> mirror descent with the entropic potential. It is the same solver as the Physarum
> dynamics, with the quadratic potential replaced by the entropic one — the second canonical
> member of the same family, over the same matroid polytope.**

The two systems are not analogues. They differ by a choice that the mirror-descent framework
exposes as a parameter.

**Caveat 5.5 (what is not claimed).** Fact 4.1 carries convergence guarantees for the
quadratic potential. Those guarantees are *not* inherited by the entropic member: mirror
descent's convergence rate depends on the strong convexity of $\Phi$ relative to the norm in
which the gradients are bounded, and the constants differ between the Euclidean and entropic
geometries. Establishing convergence for the entropic case on the transshipment polytope is
open (§9, P1). The claim here is structural — same solver family, same polytope — and
structural claims do not transfer rate theorems.

---

## 6. The exponent, not the sign

There is an obvious objection. The Physarum dynamics *concentrates*: flux thickens a tube,
which carries more flux, which thickens it further, until one path survives. The entropic
scheduler *spreads*: it sends the next unit wherever there is least. These look like
opposite feedback signs, and if they are, §5 is an equivocation.

They are not opposite signs. Both are descent; they descend different potentials, and the
minimizers of those potentials sit in different places. The quadratic potential rewards
concentration because dissipation $\sum L_e Q_e^2 / D_e$ is reduced by routing flow where
conductance is already high. The entropic potential rewards spreading because
$\sum_i n_i \log n_i$ is minimized at the uniform vector. Descent is the same operation in
both; the geometry differs.

The biological literature makes the same point within the Physarum model itself, through the
exponent $\mu$ in (4.1).

**Observation 6.1.** In the Tero model, $\mu$ controls whether the network degenerates.
For $\mu \geq 1$ the feedback is super-linear or linear in flux, positive feedback dominates,
and the network collapses toward a single path or a tree. For $0 < \mu < 1$ the feedback is
sub-linear, redundant routes are not fully extinguished, and the steady-state network retains
loops. Tero et al. (2010) exploit precisely this in designing networks that trade transport
efficiency against fault tolerance: the same equation, tuned by one exponent, produces either
a minimal tree or a robust reticulated network.

Consequently:

**Conjecture 6.2.** A load-spreading scheduler is not the opposite of the Physarum dynamics
but its low-$\mu$ regime. Spreading and concentrating are the two ends of a one-parameter
family, not two mechanisms.

We label this a conjecture deliberately. Observation 6.1 is about $\mu$ *within* the
quadratic-potential model, whereas §5 relocated the scheduler to the entropic potential.
Making 6.2 a proposition requires exhibiting a two-parameter family — potential and exponent
— in which both systems are points, and showing that the spreading behaviour of the entropic
member coincides with the $\mu < 1$ behaviour of the quadratic member rather than merely
resembling it. No such family is constructed here. Nor has any $\mu$ been *fitted* to
scheduler data; doing so is the cheapest available empirical test (§9, P2).

What can be said without conjecture is that the naive reading — "one reinforces, the other
anti-reinforces, therefore they are opposed" — is unsound, because it compares a feedback
sign in one geometry to a feedback sign in another. Sign is not a geometry-independent
property of a descent.

---

## 7. What an inner product buys, and what survives without one

The nerve gives a cochain complex. Hodge theory needs more: it needs *adjoints*, and
adjoints need inner products.

Equip $C^0$ and $C^1$ with inner products. Then $\delta: C^0 \to C^1$ has an adjoint
$\delta^*: C^1 \to C^0$, and one forms the Hodge Laplacians $\Delta_0 = \delta^*\delta$ and
$\Delta_1 = \delta\delta^*$. For a graph — a 1-dimensional complex, with no 2-cells and
hence no second coboundary — the decomposition is two-term:
$$C^1 \;=\; \operatorname{im}\delta \;\oplus\; \ker \delta^* ,
\qquad \ker\delta^* \;\cong\; H^1 . \tag{7.1}$$
Any 1-cochain splits orthogonally into a *gradient* part, explained by a global potential,
and a *cyclic* part, which is not [Eckmann 1944; Lim 2020]. On a graph the harmonic space
*is* the cycle space.

An inner product on $C^1$ is a positive weight per edge:
$\langle \varphi, \psi \rangle = \sum_e w_e\, \varphi_e \psi_e$. In the electrical reading
$w_e$ is a conductance, which is Observation 5.1 again.

The precise accounting is then:

**Available without any inner product.** The *dimension* $b_1 = |E| - |V| + c$, by pure
counting (Fact 2.3). Whether the cover is coordination-free ($b_1 = 0$). The same number read
as fault tolerance: the $b_1$ overlaps outside a spanning forest can all be lost without
disconnecting any pair the cover previously connected, so what redundant paths buy is
survival under cuts and not throughput. The matroid $M(G)$, its independence oracle, its
bases, and the optimality of greedy — all of §3. Combinatorics does not need a metric.

**Requiring an inner product.** The orthogonal projection of a given cochain onto its
gradient and cyclic parts, i.e. (7.1) as a decomposition rather than a dimension count. The
identification of a canonical harmonic representative in each cohomology class. Effective
resistance and all spectral quantities: eigenvalues of $\Delta_0$, the spectral gap, mixing
and diffusion rates. The dissipation functional (4.2) and hence Thomson's principle. Sheaf
Laplacians and their spectra [Hansen & Ghrist 2019].

The distinction is sharp and worth stating plainly, because it is easy to conflate the two
sides: **knowing how many independent cycles there are is free; knowing how much of a given
discrepancy pattern is due to them is not.** A system that computes $b_1$ and no more has a
cost counter, not a diagnostic. It can tell you that coordination is required and how much;
it cannot tell you which part of an observed inconsistency is irreducible and which is an
artifact of a bad global guess. That capability is exactly what the inner product purchases,
and it is why §5's relocation of the metric to the occupancy simplex, while real, does not
supply a metric on $C^1$. They are different spaces. A Fisher–Rao metric on assignments says
nothing about flows on the nerve.

---

## 8. The thermodynamic reading

Landauer's principle states that erasing one bit of information in a system at temperature
$T$ dissipates at least $k_B T \ln 2$ of heat [Landauer 1961]. This invites an identification
of coordination obstruction with erasure cost, which we state carefully because the careless
version is common.

**Definition 8.1.** For an overlap graph $G$, define the *coordination erasure cost* as
$b_1(G)$ bits.

**Observation 8.2 (this is a definition, not a theorem).** Definition 8.1 is a modelling
choice, and it is justified exactly when each independent cycle carries one bit of
irreducible disagreement — for instance when local states take values in $\mathbb{Z}/2$ and
the sheaf is locally constant, so that the obstruction group is $H^1(G; \mathbb{Z}/2)
\cong (\mathbb{Z}/2)^{b_1}$. Under those hypotheses, reaching a globally consistent state
requires resolving $b_1$ independent binary choices, and by Landauer this costs at least
$b_1 k_B T \ln 2$. Outside them, the obstruction group need not be an elementary abelian
2-group and the bit count is not $b_1$.

It is worth being explicit that no derivation of $b_1$ *from* thermodynamics is offered here
or, to our knowledge, elsewhere. What is available is an inequality in one direction under
stated hypotheses. Presenting the identification as a discovered physical law rather than a
scoped definition is a category error, and the fact that both quantities are measured in
bits is not evidence.

**Observation 8.3 (the index relation).** With $\chi = |V| - |E|$ the Euler characteristic
of $G$,
$$\dim H^0 - \dim H^1 \;=\; c - (|E| - |V| + c) \;=\; \chi .$$
This is the discrete index theorem for a graph. It is worth recording because it constrains
what any admission policy can achieve: since $\chi$ changes by exactly $+1$ when a vertex is
added and $-1$ when an edge is added, a policy that admits work (vertices) and overlaps
(edges) is moving along a line in $(\dim H^0, \dim H^1)$ space whose slope is fixed. One
cannot reduce obstruction without either reducing overlaps or fragmenting the system into
more components. Acyclicity by admission (§3) buys $b_1 = 0$ by paying in $c$: it keeps the
work fragmented.

---

## 9. Open problems

**P1. Convergence for the entropic member.** Fact 4.1 supplies convergence for the quadratic
potential. Does mirror descent with the entropic potential converge on the undirected
transshipment polytope, and at what rate? Caveat 5.5 explains why this does not follow.

**P2. Fit the exponent.** Conjecture 6.2 predicts that a load-spreading scheduler's
behaviour is reproduced by (4.1) at some $\mu < 1$. Given assignment traces, estimate $\mu$.
A good fit is evidence; a poor one refutes the conjecture cheaply. This is the least
expensive experiment available and should be done before any further theory is built on §6.

**P3. Sheaf coefficients.** Remark 2.4 notes that constant-coefficient $b_1$ is a proxy.
Does §5's identification survive when the nerve carries a cellular sheaf and $H^1$ is sheaf
cohomology? The matroid structure of §3 is defined on the underlying graph and does not
obviously see the sheaf, so the bridge may not extend.

**P4. The cost of refusal.** Observation 8.3 shows that admission-time acyclicity keeps a
system fragmented. Quantify the trade: for a given arrival process, what is the throughput
cost of maintaining $b_1 = 0$ by refusal, relative to admitting cycles and paying to resolve
them? This is the question that decides which of the two strategies in §1 an engineer should
actually choose, and this note does not answer it.

---

## 10. Summary

The first Betti number of a cover's nerve measures irreducible coordination, and it is the
nullity of the associated graphic matroid. That identification puts combinatorial admission
control and continuous flow relaxation inside one optimization problem over one polytope,
whose bases are spanning forests. The Physarum solver is a mirror-descent method on that
problem which happens to fix the Bregman potential to the quadratic case, where the
conductance vector is literally the inner product on 1-cochains. Choosing the entropic
potential instead yields a second member of the family whose greedy step is "assign to the
least-occupied resource" and whose Hessian metric is Fisher–Rao. Spreading and concentrating
are consequently not opposed mechanisms but different geometries for the same descent, and
plausibly — though not yet demonstrably — different regimes of one exponent.

What is not obtained by relocating the metric to the occupancy simplex is Hodge theory on
the nerve. The rank $b_1$ is free; the decomposition of a flow into gradient and cyclic parts
requires an inner product on 1-cochains and nothing in the entropic construction supplies
one. A system built this way knows the price of coordination without being able to diagnose
it.

---

## References

Amari, S. & Nagaoka, H. (2000). *Methods of Information Geometry.* AMS/Oxford.

Beck, A. & Teboulle, M. (2003). Mirror descent and nonlinear projected subgradient methods
for convex optimization. *Operations Research Letters* 31(3), 167–175.

Bonifaci, V., Mehlhorn, K. & Varma, G. (2012). Physarum can compute shortest paths.
*Journal of Theoretical Biology* 309, 121–133.

Curry, J. (2014). *Sheaves, Cosheaves and Applications.* PhD thesis, University of
Pennsylvania.

Eckmann, B. (1944). Harmonische Funktionen und Randwertaufgaben in einem Komplex.
*Commentarii Mathematici Helvetici* 17, 240–255.

Edmonds, J. (1971). Matroids and the greedy algorithm. *Mathematical Programming* 1, 127–136.

Hansen, J. & Ghrist, R. (2019). Toward a spectral theory of cellular sheaves. *Journal of
Applied and Computational Topology* 3, 315–358.

Landauer, R. (1961). Irreversibility and heat generation in the computing process. *IBM
Journal of Research and Development* 5(3), 183–191.

Lim, L.-H. (2020). Hodge Laplacians on graphs. *SIAM Review* 62(3), 685–715.

Nakagaki, T., Yamada, H. & Tóth, Á. (2000). Maze-solving by an amoeboid organism. *Nature*
407, 470.

Nemirovski, A. & Yudin, D. (1983). *Problem Complexity and Method Efficiency in
Optimization.* Wiley.

Oxley, J. (2011). *Matroid Theory*, 2nd ed. Oxford University Press.

Straszak, D. & Vishnoi, N. K. (2016). Natural algorithms for flow problems. *Proceedings of
SODA 2016*, 1868–1883.

Tero, A., Kobayashi, R. & Nakagaki, T. (2007). A mathematical model for adaptive transport
network in path finding by true slime mold. *Journal of Theoretical Biology* 244, 553–564.

Tero, A., Takagi, S., Saigusa, T., Ito, K., Bebber, D. P., Fricker, M. D., Yumiki, K.,
Kobayashi, R. & Nakagaki, T. (2010). Rules for biologically inspired adaptive network design.
*Science* 327, 439–442.
