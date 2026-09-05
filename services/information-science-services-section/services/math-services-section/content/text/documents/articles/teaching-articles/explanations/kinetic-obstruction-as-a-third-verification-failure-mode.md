---
title: "Proof Pores"
description: "Identifies kinetic obstruction as a third failure mode in distributed verification alongside local disagreement and topological frustration, via open-cell foam percolation and kinetic proofreading."
date-created: 2026-07-25
kind: research-note
keywords:
  - verification
  - kinetic-proofreading
  - foam-percolation
  - cohomology
status: design
declared-by: claude-interactive-session-supplying-lenticule-science
type: explanation

---

*Kinetic proofing, and the third obstruction to verification*

---

## Abstract

A verification distributed over overlapping contexts can fail in three ways, and
only two of them are instrumented anywhere. It can fail *locally*, when two
contexts disagree where they overlap. It can fail *topologically*, when every
context is internally consistent and every overlap agrees, yet no global section
exists — the Abramsky–Brandenburger contextuality obstruction, which is a
$\mathbb{Z}/2$ frustration on the nerve of the cover and is exactly Toulouse's
criterion for a spin glass. We identify a third failure with no standard name:
the *kinetic* obstruction, in which a global section exists, is reachable, and is
not reached within the observation window. Both standard checks — local agreement
and cohomological vanishing — return healthy in this case, which is why it is
invisible.

We develop the third case. Reading a covering verification as an open-cell foam
whose cells are contexts and whose *pores* are agreeing overlaps, the three
failures become a closed pore, a non-percolating pore network, and a percolating
network of insufficient permeability. We then take up kinetic proofing proper.
Hopfield–Ninio proofreading buys error suppression by spending time and
throughput at a selective pore; we prove that a second stage earns the squared
error floor only under two conditions — irreversibility, so that the reject
branch cannot readmit, and statistical independence of the two passages — and
that the second condition is a condition on information channels rather than on
agents. A second pass of the same method over the same information is a
correlated draw and contributes no factor, whatever party performs it; a stage
that executes, tests, or recomputes what the first pass only read does. We give
the fidelity–throughput trade at a pore as a queue-stability condition and
identify Eigen's
error catastrophe, in this register, with utilization reaching unity. Finally we
show that repeated review passes have power-law rather than exponential returns
whenever defect detectability is heterogeneous near zero, so that $n$ passes by
one method are strictly dominated by one pass each by $n$ differently-selective
methods — the same fact at corpus scale as the independence condition at a single
pore — and that overlap-based estimates of a corpus's own defect load are
biased downward, so a system that measures its cleanliness this way will believe
itself cleaner than it is.

---

## 1. Three obstructions

### 1.1 The setting

Verification of anything large is verification in pieces. A claim is checked in
several contexts — several readers, several test suites, several proof
obligations, several measurement settings — each of which sees part of the
object. The pieces overlap. The question is always whether the local verdicts
assemble into a global one.

This is a sheaf question and it has been asked precisely, in a place that at
first looks unrelated. Abramsky and Brandenburger showed that quantum
contextuality is exactly the failure of local empirical data to extend to a
global assignment over a cover of measurement contexts. Their framework is not
about quantum mechanics specifically; it is about covers, local sections, and
gluing, and quantum mechanics supplies the examples that make it non-vacuous.

We take that framework as the definition of verification and ask what can go
wrong.

### 1.2 The trichotomy

**Local failure.** Two contexts overlap and disagree on the overlap. One of them
is wrong. This is the failure mode every review process is built to catch, and it
is repairable by local action: fix one context.

**Topological failure.** Every context is internally satisfiable and every
overlap agrees, and still no global section exists. The obstruction lives in the
first cohomology of the nerve: agreement is a cocycle condition, and a global
section exists exactly when the cocycle is a coboundary. When it is not, the
system is *frustrated* — locally satisfiable everywhere, globally unsatisfiable,
with the obstruction a nontrivial holonomy around a cycle in the cover. No local
repair helps, because every local datum is already correct.

**Kinetic failure.** Every context agrees, the cocycle is a coboundary, a global
section exists — and the process that would find it does not finish in time. The
system is not wrong. It is late.

The third case is the subject of this paper. Its distinguishing property is that
it is invisible to both standard instruments: the local check passes, and the
cohomological check passes. A system in kinetic failure reports clean and is not.

### 1.3 Why "pores"

A foam is *closed-cell* when its cells are sealed from one another and
*open-cell* when the cell walls carry windows — pores — through which the
interior of one cell communicates with the next. The distinction governs
everything transport-related: open-cell foam drains, conducts, and equilibrates;
closed-cell foam does not, however finely divided it is.

The three obstructions are exactly the three ways a pore network fails.

| obstruction | foam condition | repair |
|---|---|---|
| local | a pore is blocked | unblock it |
| topological | pores do not percolate | none by local action |
| kinetic | pores percolate, permeability too low | widen, or wait |

The word is load-bearing rather than decorative because permeability is a
*separate parameter from connectivity*, and the entire content of §4 is that the
verification literature has connectivity instruments and no permeability
instrument. A network can percolate and still transport arbitrarily slowly. That
gap between "connected" and "conducts fast enough" is where kinetic proofing
lives.

---

## 2. The two named layers

We first fix the classical and contextual layers precisely, because the third is
defined by contrast with them.

**Definition 2.1 (Scenario, model).** A *measurement scenario* over a set $M$ of
observables is a family $\mathcal{C}$ of subsets of $M$, the *contexts*. An
*empirical model* assigns to each context $C \in \mathcal{C}$ a set of admitted
local assignments $s : C \to O$, its *support*.

**Definition 2.2 (Global section).** A *global section* is an assignment
$g : M \to O$ whose restriction to every context lies in that context's support.
The model is *noncontextual* when a global section exists.

**Definition 2.3 (Strong contextuality).** The model is *strongly contextual*
when every context has nonempty support and no global section exists.

**Definition 2.4 (Hierarchy).** Between these lies *logical contextuality*: some
particular local section extends to no global section, while others do. The
inclusions are strong $\Rightarrow$ logical $\Rightarrow$ not noncontextual, and
both are strict.

**Proposition 2.5 (The classical pole).** A model whose supports are singletons —
each context admits exactly one assignment — is never strongly contextual.

*Proof.* Single-valued agreeing local sections glue: define $g$ pointwise by the
unique value each context assigns, which is well defined because agreement on
overlaps is assumed and each overlap forces a single value. $\square$

This is the flasque baseline, and it is what "classical proofing" means when the
term is used: a regime in which local certainty always assembles. It is not a
claim about two-valued logic. It is a claim about the *shape of the local data* —
determinate local sections glue, indeterminate ones need not.

### 2.1 Contextuality is frustration

**Definition 2.6 (Nerve, cocycle).** The *nerve* $N(\mathcal{C})$ has a vertex
per context and an edge per nonempty intersection. In the binary-outcome case,
each edge carries a value in $\mathbb{Z}/2$: $0$ if the two contexts' admitted
sections agree on the overlap under a chosen reference, $1$ if they are related
by a flip. This is a $\mathbb{Z}/2$-valued Čech $1$-cochain.

**Proposition 2.7.** A global section exists iff the cochain is a coboundary —
iff there is a vertex labelling whose differences reproduce the edge values.
Equivalently, iff the product of edge values around every cycle is trivial.

**Corollary 2.8 (Toulouse).** Strong contextuality is frustration in the
spin-glass sense: a $\mathbb{Z}/2$ gauge field on the nerve with nonzero flux
around some plaquette, so that no configuration satisfies all bonds while every
bond is individually satisfiable.

**Remark 2.9.** This identification is not new to us — the cohomological reading
of contextuality is standard, and a Čech-$H^1$-over-$\mathbb{Z}/2$ rendering with
worked PR-box, GHZ, and magic-square witnesses exists in machine-checked form.
What we want from it here is the *physical* consequence, which is stated in §4:
frustrated systems relax slowly, and that is the bridge from the second
obstruction to the third.

---

## 3. Pores

**Definition 3.1 (Verification cover).** Let a claim be verified over a cover
$\mathcal{C}$. A *cell* is a context. A *pore* is an edge of the nerve together
with its agreement status: the pore is **open** when the two contexts agree on
their overlap and **closed** when they do not.

**Definition 3.2 (Open-cell fraction, percolation).** The *open-cell fraction*
$\pi$ is the proportion of nerve edges that are open. The verification
*percolates* when the open-pore subgraph is connected and spans the cover.

**Proposition 3.3 (Restatement of the trichotomy).** For a covering verification:

1. $\pi < 1$: some pore is closed — **local failure**.
2. $\pi = 1$, cocycle not a coboundary — **topological failure**. Note this can
   occur with every pore open; agreement pairwise does not imply agreement
   globally, which is exactly the content of Prop 2.7.
3. $\pi = 1$, cocycle a coboundary, global section not reached in the observation
   window — **kinetic failure**.

*Proof.* Cases 1 and 2 are Definitions 3.1 and Prop 2.7. Case 3 is the residual,
and §4 shows it is non-empty. $\square$

**Remark 3.4.** Case 2 deserves emphasis because it is routinely conflated with
case 1. Pairwise agreement is a *local* condition and reviewers check it; global
consistency is a *cocycle* condition and nobody checks it. A review process in
which every pair of reviewers agrees and the whole is nevertheless inconsistent
is not a pathology of bad reviewing. It is the generic behaviour of a cover with
$H^1 \ne 0$, and it is why "all reviewers signed off" is not evidence of
consistency.

---

## 4. The third obstruction

### 4.1 Permeability

In a foam, connectivity and transport are different questions. Darcy's law gives
the volumetric flux through a porous medium as
$$ q = -\frac{k}{\mu}\,\nabla P ,$$
with $k$ the permeability, an intrinsic property of the pore geometry with
dimensions of area, and $\mu$ the viscosity. For foam, $k$ scales roughly as the
square of the characteristic pore dimension, so a network can percolate — $k > 0$
— and still transport at any rate one likes by making the pores small.

The verification analogue is direct. A cover may be fully open and the assembly
of local verdicts into a global one may nevertheless take arbitrarily long,
because the rate at which agreement propagates across a pore is a separate
parameter from whether the pore is open at all.

**Definition 4.1 (Proofing permeability).** For a verification cover, let
$\tau_{\mathrm{glue}}$ be the time for a settling process to reach the global
section from a given initial local assignment, and $\tau_{\mathrm{obs}}$ the
window within which the verdict must be delivered. Define
$$ \mathrm{De}_{\mathrm{proof}} = \tau_{\mathrm{glue}} / \tau_{\mathrm{obs}} .$$

We use the Deborah number deliberately and not a temperature. A ratio of two
times is a Deborah number; it has no conjugate variable, no energy scale, and no
Boltzmann factor, and naming it a temperature would promise all three.

**Definition 4.2 (Kinetic obstruction).** A verification is *kinetically
obstructed* when it satisfies Prop 3.3 case 3, i.e. when a global section exists
and $\mathrm{De}_{\mathrm{proof}} > 1$.

### 4.2 The bound that already exists

The kinetic layer is not without mathematics. For a settling process — a
monotone closure operator iterated to its least fixed point — the relevant
quantities are the *closure ordinal* $\kappa$, the number of steps to the fixed
point, and a free-energy functional $\Phi$ that the process strictly decreases.

The two are related by a bound of the form
$$ \kappa \;\le\; \Phi(0) + 1 ,$$
which says the orbit cannot fire more often than its initial free energy permits.
This is an H-theorem: $\Phi$ is a Lyapunov function, strictly decreasing at every
firing, minimized at equilibrium, and bounding the reachability horizon.

**Proposition 4.3.** Under such a bound, $\kappa$ is the *ordinal* invariant of a
verification and $\Phi(0)$ its *analytic* invariant, and the kinetic obstruction
is bounded above:
$$ \mathrm{De}_{\mathrm{proof}} \le \bigl(\Phi(0)+1\bigr)\,\delta t\,/\,\tau_{\mathrm{obs}} ,$$
where $\delta t$ is the mean duration of a settling step.

*Proof.* Immediate from the step bound and $\tau_{\mathrm{glue}} \le \kappa\,
\delta t$. $\square$

**Remark 4.4 (the missing quantity).** Proposition 4.3 is not usable as stated,
because $\delta t$ is a wall-clock quantity and the step bound is an ordinal one.
A system that records only *which* state a verification reached, and never *when*
it reached it, has $\kappa$ available and $\delta t$ unavailable, hence cannot
compute $\mathrm{De}_{\mathrm{proof}}$ at all.

This is a small and specific instrument gap: record a timestamp on every state
transition of a verification, not only on its creation. Without it the kinetic
obstruction is not merely uninstrumented but uncomputable, and a system in
kinetic failure is indistinguishable from a healthy one by every quantity the
system records.

### 4.3 Why the second obstruction causes the third

The two non-local obstructions are not independent, and this is the paper's main
structural claim.

**Proposition 4.5.** A frustrated cover admits no monotone settling path to a
global section.

*Proof.* Suppose the cocycle is not a coboundary (Cor 2.8). A monotone path is
one along which no already-satisfied constraint is broken. Since every bond is
individually satisfiable, a monotone process satisfies bonds one at a time
without backtracking; on reaching a frustrated cycle, the last bond of the cycle
is unsatisfiable given the others, and satisfying it requires breaking one
already satisfied. Hence no monotone path terminates in a global section, and in
fact none exists to terminate in. $\square$

**Corollary 4.6.** Frustration forces non-monotone search, and non-monotone
search leaves the regime in which settling terminates in finitely many steps.

This is why glasses are slow: not because their bonds are strong, but because the
path to the ground state is uphill somewhere. A verification whose cover carries
$H^1 \ne 0$ has the same problem in the same sense, and a verification whose
cover *nearly* carries $H^1 \ne 0$ — one that is unfrustrated but only just —
inherits the slowness without inheriting the impossibility. That near-frustrated
band is where kinetically obstructed verifications live.

**Remark 4.7 (a stratification, asserted not proved).** The settling regimes may
be stratified by closure ordinal: $\kappa < \omega$ (finite settling), $\kappa =
\omega$ (settling in the limit), $\omega < \kappa < \omega_1$, and $\kappa \ge
\omega_1$. The gluing obstruction is claimed to vanish exactly in the first two.
That claim is recorded in the source material as a table, not as a single
theorem, and we repeat it as such: the identification of the cohomological cut
with the ordinal cut is asserted by the stratification, not proved by it. If it
is proved, Prop 4.5 becomes a corollary rather than an independent argument.

---

## 5. Kinetic proofing proper

We now leave the geometry and take up the mechanism, which is older than any of
this and was worked out for the ribosome.

### 5.1 The Hopfield–Ninio scheme

Any discrimination made at equilibrium between a correct and an incorrect
substrate differing in binding free energy by $\Delta\Delta G$ has an error floor
$$ f_0 = \exp(-\Delta\Delta G / k_B T) ,$$
because at equilibrium the occupancy ratio is fixed by the free energy difference
and nothing else. This floor is far above the observed fidelity of protein
synthesis and DNA replication, which is the puzzle Hopfield and Ninio
independently solved in 1974–75.

The solution is to introduce an irreversible intermediate. The substrate binds,
is driven to a high-energy activated state at the cost of hydrolysing a
nucleotide, and is given a delay during which it may fall off. The discrimination
is then made *twice* against the same free-energy difference — but as two
statistically independent passages, which is what the hydrolysis is buying and
what §5.2 shows is the load-bearing part — and the error rate becomes
$$ f = f_0^{\,2} ,$$
or $f_0^{\,n+1}$ for $n$ proofreading stages. The scheme buys an exponential
improvement in fidelity and pays for it in three currencies: free energy
dissipated, correct substrate discarded along with incorrect, and throughput
reduced by the delay.

### 5.2 What a second stage has to be in order to count

The scheme's whole content is in two structural requirements. Both are easy to
state and easy to violate, and neither of them is a requirement about *who*
performs the second discrimination.

**Definition 5.1 (Proofreading step).** A two-stage discrimination consists of a
binding stage with outcome set $\{$accept, reject$\}$, an irreversible transition
to an intermediate, and a second discrimination on the intermediate. Write $A_i$
for the event that stage $i$ accepts. The step is *proper* when both

1. *(irreversibility)* the reject branch of the second discrimination does not
   re-enter the accepted pool; and
2. *(independence)* the second discrimination is a fresh passage: conditioned on
   the subject being incorrect, $A_2$ is independent of $A_1$.

**Theorem 5.2 (Two conditions for the squared floor).** A second discrimination
stage contributes a further factor of $f_0$ — giving $f = f_0^{\,2}$ — only if
the step is proper in the sense of Definition 5.1. If condition 1 fails, so that
the reject branch can return its subject to the accepted pool, then
$f = f_0$. If condition 2 fails maximally — the second stage evaluates the same
functional of the same free-energy difference, on the same state, by the same
means, with nothing redrawn between the two evaluations — then $f = f_0$ again.
The identity of the agent performing either stage occurs in neither condition.

*Proof.* Throughout, $f = \Pr(A_1 \cap A_2 \mid \text{incorrect}) =
\Pr(A_1 \mid \text{incorrect}) \cdot \Pr(A_2 \mid A_1, \text{incorrect})$, and
the first factor is $f_0$ by §5.1. The squared floor is therefore exactly the
claim that the second factor is also $f_0$.

*Condition 1.* Let $a$ denote the accepted pool and $r$ the rejected.
Irreversibility makes the transition $a \to r$ one-way, so the steady-state
occupancy of $a$ is set by the *product* of two passages, each discriminating by
$\exp(-\Delta\Delta G/k_BT)$. If instead $r \to a$ is permitted with any nonzero
rate, detailed balance applies across the pair: the two states are connected by a
reversible cycle, and the steady-state ratio between correct and incorrect in $a$
is determined by the total free-energy difference between $a$ and $r$, which is
$\Delta\Delta G$ — the same quantity as a single stage. The second
discrimination contributes no additional factor because a reversible step cannot;
only dissipation buys discrimination. Hence $f = f_0$.

*Condition 2.* Decompose each stage's acceptance as
$A_i = \{\Phi_i(X) + \xi_i > \theta_i\}$, with $X$ the subject, $\Phi_i$ the
systematic response of the means used at stage $i$, and $\xi_i$ the stochastic
part of that stage's draw. If $\Phi_2 = \Phi_1$, $\theta_2 = \theta_1$, and
$\xi$ is not redrawn — the second stage re-evaluates one functional on one
unchanged state — then $A_1 \subseteq A_2$, so
$\Pr(A_2 \mid A_1, \text{incorrect}) = 1$ and $f = f_0$. The two evaluations are
one evaluation counted twice.

Hopfield–Ninio escapes this because the hydrolysis does two things at once, not
one. It makes the transition one-way (condition 1) *and* it drives the complex
into a distinct high-energy intermediate whose subsequent escape is a fresh
kinetic draw, statistically independent of the first binding event (condition 2).
The dissipation is not merely a toll paid for irreversibility; it is what
purchases the independence, which is the operative sense in which only
dissipation buys discrimination. $\square$

**Corollary 5.3 (Two passes of one method are one pass).** A second pass that
applies the same method to the same information as the first fails condition 2
however scrupulously it satisfies condition 1, and returns error floor $f_0$. In
particular, a second language model of the same class, reading the same artefact
under the same instructions, is a correlated draw from one distribution and not a
second stage; it is a second opinion, and a second opinion is not a measurement.
What does earn the additional factor is a stage that reads a channel the first
could not: executing the artefact, running its tests, recomputing its arithmetic,
consulting a source the first pass did not have. Each of these conditions $A_2$
on information outside the $\sigma$-algebra generated by the first pass, which is
precisely what condition 2 asks for — and each must still satisfy condition 1, by
being able to reject without readmitting.

**Remark 5.4.** Three consequences, in decreasing order of how often they are got
wrong.

*The operative axis is the channel, not the agent.* Organisational rules about
verification are usually written as rules about personnel, and defended as
matters of bias or incentive. Those defences may be true and they are not this
argument. Theorem 5.2 is indifferent to personnel: two stages performed by
different parties over one channel buy $f_0$, and two stages performed by the
same party over two channels buy $f_0^2$. A rule that partitions agents while
leaving both stages on one channel purchases nothing, and reports that it has.

*Condition 1 is narrower than it is usually drawn.* It forbids the *readmission
path*, not the observation. A checker may read, may diagnose, may report in
unlimited detail; it may not return the subject to the accepted pool. Diagnosis
and repair must be separated by a boundary the subject cannot cross backwards.
Which party stands on which side of that boundary is irrelevant to the
mathematics.

*This is Theorem 7.3 at the scale of a single pore.* Between the two extremes of
condition 2 lies the realistic case: $\Phi_2 \ne \Phi_1$ but the two responses
share a systematic component, so $\Pr(A_2 \mid A_1, \text{incorrect})$ lies
strictly between $f_0$ and $1$, pinned above $f_0$ by the mass of defects in the
methods' shared blind spot. Theorem 7.3 is the same statement at the scale of a
corpus and many passes: repetition of one method converges at a power-law rate to
that method's blind spot, because the surviving population is exactly the mass on
which its draws are correlated. Corollary 5.3 and Corollary 7.5 are therefore one
result — diversity of channel dominates repetition of method — proved once
kinetically and once asymptotically.

An earlier draft of this section identified the irreversibility condition with a
rule excluding an artefact's author from checking it. That identification does
not follow from the detailed-balance argument, which is indifferent to who
occupies either stage, and it licenses the error Corollary 5.3 names: treating a
second reading of one artefact by one method as a second stage on the grounds
that a different party performed it. Condition 1 constrains the topology of the
reject branch and condition 2 constrains the channel; neither constrains
personnel.

### 5.3 Selectivity is a pore property

Theorem 5.2 also locates proofreading in the geometry of §3. A proofreading step
is a **selective pore**: an aperture that passes some things and not others, and
whose selectivity is bought with dissipation and paid for in throughput.

The physical archetype is a molecular sieve — a porous crystalline solid whose
apertures admit molecules below a threshold diameter and exclude the rest, with
selectivity set by aperture geometry rather than by chemistry. The point of the
comparison is the trade it makes explicit: a sieve's selectivity and its flux are
set by the same aperture, and improving one degrades the other. There is no
aperture that is both maximally discriminating and maximally permeable.

**Proposition 5.5 (Fidelity–throughput trade).** For a proofreading pore with
$n$ proper stages (Def 5.1), error rate $f_0^{\,n+1}$ and per-stage delay
$\delta$, the
verification throughput is $\lambda_v \le 1/(n\delta)$ and the error rate falls
exponentially in $n$ while throughput falls at least linearly.

*Proof.* Each stage imposes a delay $\delta$ before the subject may pass;
stages are sequential, so the service time is at least $n\delta$ and the service
rate at most its reciprocal. The error claim is §5.1. $\square$

---

## 6. Error catastrophe is queue instability

Fidelity is not the only thing that can fail. A verification apparatus can be
perfectly accurate and still lose control of a corpus, by falling behind it.

**Definition 6.1.** Let $\lambda_m$ be the rate at which claims enter a corpus
and $\lambda_v$ the rate at which they are verified. The *utilization* is
$\rho = \lambda_m / \lambda_v$.

**Proposition 6.2.** If $\rho \ge 1$, the population of unverified claims grows
without bound. If $\rho < 1$, it is stationary with mean proportional to
$\rho/(1-\rho)$, diverging as $\rho \to 1^-$.

*Proof.* Standard single-server queue stability. $\square$

**Proposition 6.3 (Eigen's threshold, in this register).** A corpus of $L$ claims
with per-claim error probability $\mu$ maintains its identity against a selective
advantage $\sigma$ only if $\mu L < \ln \sigma$. Above the threshold the
population delocalizes: no particular version is maintained and the corpus drifts
into the neighbourhood of the error cloud.

**Corollary 6.4.** The two thresholds are different failures and are routinely
confused. $\rho \ge 1$ is a *throughput* failure: verification is accurate and
too slow. $\mu L \ge \ln \sigma$ is a *fidelity* failure: verification is fast
enough and not accurate enough. Proposition 5.5 says these trade against each
other at a single pore, so a system driven away from one threshold by tuning $n$
is driven toward the other.

---

## 7. Repeated passes have power-law returns

The natural response to a low-detection gate is to run it more often. This
section shows that response is worse than it looks, and says what to do instead.

**Definition 7.1 (Detectability).** Assign each latent defect a *detectability*
$p \in [0,1]$: the probability that one pass of a given review method finds it.
Let $g$ be the density of $p$ over the defect population, and $N$ the initial
defect count.

**Proposition 7.2 (Homogeneous case).** If all defects share detectability $p_0$,
the expected number surviving $n$ independent passes is $R(n) = N(1-p_0)^n$ —
geometric decay, with a well-defined number of passes to any target.

**Theorem 7.3 (Heterogeneous case).** Suppose $g(p) \sim c\,p^{\alpha-1}$ as
$p \to 0^+$ for some $\alpha > 0$. Then
$$ R(n) = N\!\int_0^1 g(p)(1-p)^n\,dp \;\sim\; N\,c\,\Gamma(\alpha)\,n^{-\alpha}
   \qquad (n \to \infty). $$

*Proof.* Write $(1-p)^n = e^{n\ln(1-p)}$. For large $n$ the integral is dominated
by $p = O(1/n)$, where $\ln(1-p) = -p + O(p^2)$, so
$(1-p)^n = e^{-np}\bigl(1+O(np^2)\bigr)$ uniformly on that range. Substituting
the assumed behaviour of $g$ and applying Watson's lemma,
$$ \int_0^1 c\,p^{\alpha-1}e^{-np}\,dp = c\,n^{-\alpha}\!\int_0^n u^{\alpha-1}e^{-u}\,du
   \longrightarrow c\,\Gamma(\alpha)\,n^{-\alpha}. $$
Contributions from $p$ bounded away from $0$ are exponentially small and do not
affect the leading order. $\square$

**Corollary 7.4.** Heterogeneity converts exponential returns into power-law
returns. Reaching a target defect level costs $n \sim (N c \Gamma(\alpha)/R)^{1/\alpha}$
passes rather than $\log$-many, and for small $\alpha$ this is prohibitive.

**Corollary 7.5 (Diversity dominates repetition).** Let two review methods have
detectability densities $g_1, g_2$ whose small-$p$ tails are supported on
different defect classes. Then one pass of each strictly dominates two passes of
either, because the surviving population after a pass of method 1 is concentrated
exactly where $g_1$ is small, which is where method 2's detectability is not
constrained to be small.

*Proof sketch.* After one pass of method 1 the surviving density is
$g_1(p)(1-p)$ reweighted, mass-shifted toward $p \approx 0$ for method 1. A
second pass of method 1 integrates against that same near-zero region. A pass of
method 2 integrates against $g_2$ evaluated on the survivors, which by hypothesis
is not concentrated near zero there. $\square$

**Remark 7.6.** This is the formal content of the practice of assigning distinct
review lenses — correctness, security, performance, reproducibility — rather than
repeating one review. It is not a matter of thoroughness. Repetition of a single
method converges to that method's blind spot at a power-law rate and stops; a
different method has a different blind spot. Theorem 7.3 says the last defects
are not *hard*, they are *invisible to the instrument in use*, and no amount of
that instrument will do.

This is Theorem 5.2's condition 2 at corpus scale, and the two should be read
together (Remark 5.4). There, a second stage sharing the first's systematic
response contributes no factor because the two draws are correlated; here, the
$n$-th pass of one method contributes $n^{-\alpha}$ rather than a geometric
factor for the same reason, the surviving population being precisely the mass on
which that method's draws are correlated. A *lens* in this sense is an
information channel and not a role: two readers of one artefact applying one
method are one lens, and one reader who reads the artefact and then executes it
is two.

**Corollary 7.7 (Self-assessment is biased optimistic).** A corpus estimating its
own defect load from reviewer overlap — the Lincoln–Petersen estimator
$\hat N = m_1 m_2 / m_{12}$ from catches $m_1, m_2$ and overlap $m_{12}$ — is
biased downward under heterogeneity, because high-detectability defects are
over-represented in both catches and inflate the overlap. The system therefore
concludes it is cleaner than it is, and the bias grows with the heterogeneity
that Theorem 7.3 says is the operative regime.

---

## 8. Proof-predicting

A last register. Given a claim and a verification apparatus, what is forecastable?

**Proposition 8.1 (What is not forecastable).** Whether a *particular* claim
survives verification is not forecastable from the apparatus's parameters alone,
since it depends on the claim's own detectability $p$, which is by construction
unknown before the pass that reveals it.

**Proposition 8.2 (What is).** Three things are.

1. *The aggregate survival curve.* Under Theorem 7.3, $R(n) \sim Cn^{-\alpha}$
   with $\alpha$ estimable from two or more passes. This forecasts the residual
   defect population, not which defects compose it.
2. *Queue behaviour.* $\rho$ is directly measurable and Prop 6.2 forecasts
   backlog growth exactly.
3. *Time to settle.* $\kappa \le \Phi(0)+1$ bounds the settling horizon from the
   initial state, so $\mathrm{De}_{\mathrm{proof}}$ is forecastable *given*
   $\delta t$ — which returns to Remark 4.4's missing timestamp.

**Corollary 8.3.** Proof-prediction is a population statistic, not a per-claim
one. A system that reports confidence in individual claims from apparatus
parameters is reporting a quantity it does not have; a system that reports a
residual-defect estimate with its $\alpha$ and the bias direction of Cor 7.7 is
reporting one it does.

---

## 9. Instruments

Each is small, each is currently absent, and each makes one of the above
computable.

**9.1 Transition timestamps.** Record when each verification state change
occurred, not only when the subject was created. Makes $\delta t$ available and
hence $\mathrm{De}_{\mathrm{proof}}$ (Remark 4.4). Cost: one field.

**9.2 A utilization monitor.** Continuously compute $\rho = \lambda_m/\lambda_v$
over a trailing window, where $\lambda_v$ counts completions verified through a
channel the authoring pass did not use — execution, test, recomputation, an
external source — and not self-reported or re-read ones. By Cor 5.3 a re-reading
pass is not a verification and must not increment $\lambda_v$. Prop 6.2 makes
$\rho \ge 1$ an alarm condition with no tuning, and without it a system arbitrarily
far past the queue threshold is indistinguishable from a healthy one.

**9.3 A detectability estimator.** For any artefact passing through more than one
review, record which pass caught which defect *and which channel that pass read*.
Two passes suffice to estimate $\alpha$ (Thm 7.3) and to compute the
Lincoln–Petersen estimate together with its optimism bias (Cor 7.7); the channel
field is what makes the two passes' independence checkable rather than assumed
(Thm 5.2, condition 2). Nothing currently records catch attribution, so $\alpha$
is unknown and the residual population is unestimated.

**9.4 A frustration check.** Compute the $\mathbb{Z}/2$ holonomy around cycles in
the review nerve — whether pairwise-agreeing reviewers are globally consistent
(Prop 2.7). Currently only pairwise agreement is checked, which by Remark 3.4 is
not evidence of the thing it is taken as evidence for.

---

## 10. Relation to the foam papers

For readers holding the companion treatments of semiotic and game foam.

Those papers take a *structure* and read it as a foam: utterances with tokens as
walls, or ludic designs with charge $\top$ as the interface. This paper takes a
*process* and reads its obstructions as pore geometry. The objects are therefore
different — a pore is not a wall but a hole in one — and the shared apparatus is
narrower than it may appear: both use the Deborah number for the same reason
(a structure that relaxes needs a ratio of times), and both distinguish
connectivity from the stronger property one is usually trying to establish.

The genuinely shared result is negative and worth stating once for all three.
Each paper found a place where a count of *connections* is being used where a
count of *independent constraints* is meant, and in each case the two coincide
only under an independence assumption nobody checks. Here the instance is §9.4:
pairwise pore agreement is a connectivity statement, global consistency is a
cocycle statement, and the gap between them is exactly a first cohomology.

---

## References

Abramsky, S., & Brandenburger, A. (2011). The sheaf-theoretic structure of
non-locality and contextuality. *New Journal of Physics*, 13, 113036.

Adams, E. N. (1984). Optimizing preventive service of software products. *IBM
Journal of Research and Development*, 28(1), 2–14.

Chao, A. (1987). Estimating the population size for capture–recapture data with
unequal catchability. *Biometrics*, 43(4), 783–791.

Darcy, H. (1856). *Les fontaines publiques de la ville de Dijon*. Dalmont.

Eigen, M. (1971). Selforganization of matter and the evolution of biological
macromolecules. *Naturwissenschaften*, 58(10), 465–523.

Gibson, L. J., & Ashby, M. F. (1997). *Cellular Solids: Structure and
Properties* (2nd ed.). Cambridge University Press.

Hopfield, J. J. (1974). Kinetic proofreading: A new mechanism for reducing errors
in biosynthetic processes requiring high specificity. *PNAS*, 71(10), 4135–4139.

Kochen, S., & Specker, E. P. (1967). The problem of hidden variables in quantum
mechanics. *Journal of Mathematics and Mechanics*, 17(1), 59–87.

Ninio, J. (1975). Kinetic amplification of enzyme discrimination. *Biochimie*,
57(5), 587–595.

Reiner, M. (1964). The Deborah number. *Physics Today*, 17(1), 62.

Toulouse, G. (1977). Theory of the frustration effect in spin glasses: I.
*Communications on Physics*, 2, 115–119.

Verbist, G., Weaire, D., & Kraynik, A. M. (1996). The foam drainage equation.
*Journal of Physics: Condensed Matter*, 8(21), 3715–3731.

Watson, G. N. (1918). The harmonic functions associated with the parabolic
cylinder. *Proceedings of the London Mathematical Society*, s2-17(1), 116–148.

Weaire, D., & Hutzler, S. (1999). *The Physics of Foams*. Oxford University
Press.
