---
title: "Catalysis, Conservation, Regeneration, and Growth as Distinct Fixed Points in Chemical Reaction Networks"
description: "Separates catalysis, autocatalysis, and depletion into distinct fixed-point regimes of projectivized reaction-network dynamics, correcting an earlier claim that autocatalysis has no fixed point."
date-created: 2026-07-25
kind: research-note
keywords:
  - chemical-reaction-networks
  - fixed-points
  - autocatalysis
  - dynamics
status: design
declared-by: claude-interactive-session-supplying-lenticule-science
---

## Abstract

"The enzyme is not consumed" is not one claim. It is four claims on four different carriers,
each with its own fixed-point theorem, and they are not interderivable. A first version of
this note asserted that autocatalysis "has no fixed point," which is false and is corrected
here: autocatalysis has a fixed point in the projectivized dynamics, and catalysis,
autocatalysis, and depletion are the $\lambda = 1$, $\lambda > 1$, and $\lambda < 1$ cases of
one spectrum rather than three kinds of thing.

The reaction-network setting supplies the right separation, and it is standard. Let $N$ be
the stoichiometric matrix. **Catalysis** is a zero *entry* of $N$ — per-reaction, local,
trivially true. **Conservation** is a nonnegative vector in the **left** kernel: a
P-invariant, structural, holding under every firing, free. **Regeneration** is a nonnegative
vector in the **right** kernel: a T-invariant, a firing multiset that returns the marking, a
*cycle*. **Growth** is a Perron–Frobenius eigenvector of the positive part: fixed in
composition, not in magnitude.

Two results follow. First, conservation and regeneration are the left and right kernels of
one matrix, hence dual — *what is conserved* and *how it is restored* are two faces of a
single object, and only the first is free. Second, and this is the load-bearing one:
**a T-invariant on a projection of the state space need not be a T-invariant on the whole
space**, so every "not consumed" claim is relative to a projection and silently names a
complement where the cost lands. That complement is the reducing currency, and a reductase is
exactly a transition that completes a T-invariant on a projection at the price of breaking
it off the projection.

The same machinery types irreversibility in three levels, which turns out to be the sulfur
oxidation ladder: free (a T-invariant with zero net everywhere), priced (a T-invariant with
nonzero net on a carrier), and terminal (in the support of no T-invariant at all).

---

## 1. Definitions and notation

Species $S$, reactions $R$, stoichiometric matrix $N \in \mathbb{Z}^{S \times R}$ with

$$N[x, r] \;=\; \text{product}_r(x) - \text{reactant}_r(x).$$

A state is $s \in \mathbb{N}^S$; firing $r$ when enabled sends $s \mapsto s + N[\cdot, r]$.
This is a Petri net read chemically — places are species, transitions are reactions, and the
nondeterministic step relation has no privileged control thread.

Everything below is a fixed-point statement, and the differences between them are differences
of *carrier*: which object the map acts on, and which map.

## 2. Catalysis as a zero entry of the stoichiometric matrix

$x$ is a catalyst of $r$ exactly when

$$N[x, r] = 0,$$

and then firing $r$ leaves coordinate $x$ unchanged. This is the whole content of the
available formalization's catalysis result, and it is correct.

Note what it is: a statement about **one entry** of $N$. Not a row, not a column, not a
kernel. It quantifies over nothing. It is the observation that adding zero changes nothing,
dressed as a fixed point — which it genuinely is, of the map $\text{fire}\,r$ restricted to
coordinate $x$, and which is why it is trivially provable and correspondingly weak.

The carrier is $\mathbb{N}^S$, the counts. The map is a single transition. Nothing about
time, sequences, or networks is in scope.

## 3. Conservation as the left kernel: P-invariants

A **P-invariant** is $y \in \mathbb{Q}_{\ge 0}^S$ with

$$y^{\mathsf T} N = 0.$$

Then $y^{\mathsf T} s$ is invariant under every firing, hence at every reachable marking, for
every sequence, forever. This is what a conservation law is.

Three things about it that catalysis does not have:

- It quantifies over all reactions and all sequences.
- It is generally a *weighted combination*: no individual species need be fixed, while a
  particular sum of them is. Mass conservation is this, not the previous section.
- **It is free.** It holds structurally, with nothing driving it. A P-invariant is a property
  of the network's shape, and no expenditure maintains it.

The degenerate case $y = e_x$ says $x$ is a catalyst of *every* reaction — the row $N[x,
\cdot]$ is zero. That is the honest network-scale strengthening of §2, and it is almost never
what holds, because any species interesting enough to catalyse something is usually consumed
by something else.

## 4. Regeneration as the right kernel: T-invariants

A **T-invariant** is $\sigma \in \mathbb{N}^R$ with

$$N\sigma = 0.$$

Firing that multiset of transitions, in any admissible order, returns the marking exactly
where it started. This is a **cycle**, and it is what a metabolic pathway is.

This is the correct home for "the enzyme is not consumed *over time*." The species is not
fixed by any single transition and is not conserved structurally; it is *depleted and
restored*, and the restoration is a firing sequence. Glutathione is not conserved — it is
oxidised, and glutathione reductase reduces it back, and the pair is a T-invariant on the
glutathione species.

**Conservation and regeneration are dual.** P-invariants are the left kernel of $N$;
T-invariants are the right kernel of the same $N$. One lives on places, the other on
transitions. *What is preserved* and *how it is restored* are the two kernels of a single
object, and confusing them is confusing a row space with a column space.

### 4.1 Projection-relativity of regeneration

Here is the structural fact that does the work.

Let $P$ be a projection of the state space onto a subset of species. A vector $\sigma$ can
satisfy

$$(N\sigma)\big|_P = 0 \quad\text{while}\quad N\sigma \ne 0$$

off $P$. The cycle closes on the projection and does not close on the whole space.

That is exactly the reductase. Project onto the sulfur species: oxidation plus reduction sums
to zero, the free-thiol pool returns to where it was, and the thiol is "not consumed."
Include the reducing carrier — NADPH, or ATP — and $N\sigma \ne 0$: the carrier is net
consumed, monotonically, every cycle.

So:

> **Every "not consumed" claim is relative to a projection, and names a complement it does
> not mention.** The complement is where the cost lands. A reductase is a transition that
> completes a T-invariant on a projection at the price of breaking it off the projection.

This is why "the catalyst is regenerated" is never free and always sounds free. The
regeneration is genuine — the cycle really does close — on the coordinates you were looking
at. The driver is exactly the coordinate you projected away.

A P-invariant, by contrast, has no complement and no driver. That is the real difference
between the two kernels, and it is why they must not be called by one name: **left-kernel
conservation is free; right-kernel regeneration is paid, and the payment is off-projection.**

## 5. Growth as a fixed point of the projectivized dynamics

Take the positive part of the dynamics as $s' = As$ with $A \ge 0$ irreducible. In
$\mathbb{R}^S$ this has no nonzero fixed point unless the leading eigenvalue is exactly $1$.
That is the observation the first version of this note mistook for "no fixed point."

The projectivized map

$$s \;\longmapsto\; \frac{As}{\lVert As\rVert}$$

does have a fixed point: the Perron–Frobenius eigenvector $v$, with $A^t s \sim \lambda^t v$.
An autocatalytic system therefore has a fixed point **in composition** while growing without
bound in magnitude. What is invariant is the direction, the mixture, the shape — not the
size.

This unifies the three cases that were being treated as different kinds of thing:

| | eigenvalue | fixed in | reading |
|---|---|---|---|
| depletion | $\lambda < 1$ | magnitude, at $0$ — attracting | the pool drains |
| catalysis | $\lambda = 1$ | magnitude, anywhere | the count is untouched |
| autocatalysis | $\lambda > 1$ | direction only | the deposit grows, shape held |

One spectrum, one operator, three regimes. Catalysis is not a different phenomenon from
autocatalysis; it is the same phenomenon at $\lambda = 1$, which is a measure-zero coincidence
and correspondingly rare in anything that is actually running.

And the intended reading of an accumulating record lands here rather than in §2. A growing
deposit is not fixed in count — its count is the thing that increases, by construction. What
is fixed is its composition. **Growth is the eigenvalue; identity is the eigenvector.** A
corpus that doubles while holding its mixture is at a fixed point of exactly the map that
matters, and at no fixed point of the counting map at all.

## 6. Typing irreversibility by T-invariant membership

The same machinery gives a three-level typing of irreversibility, and it is structural — a
property of $N$, decidable from the network rather than argued.

A species $x$ is:

1. **Freely reversible** if $x$ lies in the support of a T-invariant $\sigma$ with $N\sigma = 0$
   on the *whole* space. The cycle closes everywhere; nothing is spent; the only cost is
   time.
2. **Priced** if $x$ lies in the support of a $\sigma$ with $(N\sigma)|_P = 0$ on the
   projection containing $x$, but $N\sigma \ne 0$ off it. Reversal exists and costs the
   off-projection carrier, in quantity $\lVert(N\sigma)|_{P^\complement}\rVert$ — a definite
   number, not a hand wave.
3. **Terminal** if $x$ is in the support of no T-invariant at all. Then $x$ is a sink: some
   reaction produces it and none removes it, no firing sequence returns the marking, and the
   accumulation is permanent.

These are exactly the three regimes of the cysteine oxidation ladder, which is why that ladder
was worth developing. Thiol–disulfide exchange is level 1 — the third-party thiolate leaves as
a thiolate and the cycle closes on the sulfur species with no carrier consumed. Sulfinic
reduction is level 2 — reversal exists, requires a dedicated producer-identity-neutral transition, and burns
a quantified unit off-projection. Sulfonic is level 3 — no transition removes it, so it lies
in no T-invariant, and no expenditure recovers the distinction it destroyed.

This is the shape a cost-semantics for a collapsing axiom wants: not "each collapse costs one
unit," but a *typing* — free, priced-at-a-computable-amount, or terminal — read off the
network's structure. And the level-3 case is the one that matters most, because it is the only
one where the answer is that there is no price.

### 6.1 Chain reactions: propagation, branching, and termination as composite typing

A radical chain mechanism — initiation, propagation, branching, termination — is not a fifth
regime. It is three of the above regimes, all held by one carrier species, running
concurrently, and the mechanism's overall behaviour is which one dominates.

**Propagation is a tight T-invariant.** In a two-step propagation cycle (carrier adds to
substrate, becomes an intermediate; intermediate abstracts from fresh substrate, regenerates
carrier), the carrier's count returns to its starting value every single firing of the pair —
a T-invariant of support size two, closing on a timescale of one elementary step rather than
once at the end of a long sequence. Substrate is what the cycle actually spends, off to the
side, exactly as §4.1 describes: the carrier reads as unconsumed because the cost was never on
the carrier's coordinate to begin with.

**Branching is the same carrier entering the growth regime of §5.** A branching step is one
in which a single firing produces more than one copy of the carrier — the transition no longer
closes any T-invariant, because the carrier count strictly increases per firing rather than
returning. That is the $\lambda > 1$ case, restated on the chain-carrier population instead of
on a corpus: fixed in composition, growing in magnitude, and unbounded growth against a finite
substrate pool is exactly what a chain-branching explosion is. Whether the growth stays
controlled or runs away is set by the same inequality shape as Eigen's threshold in §6 of the
sibling germline note — a branching probability in place of a mutation rate, a mean chain
length before termination in place of a genome length — because both are asking whether a
self-amplifying process outpaces whatever removes its own product.

**Termination is the level-3 case.** Two carriers combine and the product lies in the support
of no T-invariant: not priced, absorbing. The propagation cycle that fed both of them stops
having anywhere to return to.

**The reclassification this makes visible.** A single elementary step can move between these
three typings without any change to its own rate constant, if the network around it changes.
The oxidative-exhaustion pathology named in the companion organosulfur note (§6.1 there) is
exactly this: while a free-thiol reservoir holds, an oxygen-interruption step sits inside a
propagation T-invariant — diverted, cyclic, priced at one molecule from the reservoir, and
recoverable. Once the reservoir is exhausted, the identical step has no fresh thiol left to
close back into the cycle, and it is now terminal — not because the interruption reaction
changed, but because the edge that used to make it a T-invariant member was deleted from the
graph by the depletion of a *different* species. A network can fail not by any of its rate
constants moving, but by losing the reservoir that let a costly step read as free.

## 7. Summary of the four carriers

Stated compactly, since the point is that these are different objects and the same word has
been covering all of them:

| claim | carrier | map | fixed point | free? |
|---|---|---|---|---|
| this reaction doesn't touch $x$ | $\mathbb{N}^S$, one entry | one transition | $N[x,r] = 0$ | trivial |
| this quantity is conserved | $\mathbb{Q}^S$, left kernel | all firings | $y^{\mathsf T} N = 0$ | yes, structural |
| this species is regenerated | $\mathbb{N}^R$, right kernel | firing multisets | $N\sigma = 0$ | no — off-projection |
| this deposit keeps its identity | projective ray space | $s \mapsto As/\lVert As\rVert$ | PF eigenvector | n/a — it grows |

A fifth, order-theoretic rather than linear, sits alongside: settling as the least fixed point
of a monotone closure on a valuation lattice, by Knaster–Tarski. That one is a different
mathematics entirely — no stoichiometry, no counts — and it is the one place the corpus's
fixed-point vocabulary is already load-bearing and correct.

The confusion this note exists to remove is between rows one and three. A per-entry zero was
being cited for a claim that lives in the right kernel, and the right kernel is where the bill
is.

## 8. Status of claims

**Standard mathematics, not original here.** P- and T-invariants as the left and right kernels
of the stoichiometric matrix, and their interpretation as conservation laws and cycles, is
ordinary Petri-net and chemical-reaction-network theory. Perron–Frobenius. Knaster–Tarski.

**Argued here.** The projection result of §4.1 — that regeneration is projection-relative and
the driver is the complement — is a direct consequence of the definitions rather than a new
theorem, but it does not appear to be stated anywhere in this corpus, and it is the statement
that makes "not consumed" honest. The three-level irreversibility typing of §6 is likewise an
application rather than a result, and it is the first structural criterion this corpus has for
the difference between a reversal that is free, one that has a computable price, and one that
does not exist.

**Corrected.** The previous version of this note claimed autocatalysis has no fixed point.
It has one in the projectivization, and §5 replaces the claim with the eigenvalue spectrum that
subsumes it. The error came from testing a growth claim against a counting carrier — the same
mistake, one level up, as the one the note was written to identify.

**Open.** Whether the reducing currency of a given network is unique. Nothing above forces it:
a species can be regenerated by several T-invariants with different off-projection complements,
which is to say a depleted resource may have more than one thing that can be burned to restore
it, at different prices. Choosing among them is an economic question the structure does not
settle, and it is the interesting one.

---

## Prior work in this corpus

- *Dual Organosulfur Crosslink Populations in a Two-Phase Siloxane–Zeolite Network* (2026-07-25) — the oxidation ladder of §6 and the
  depleting-witness case of §5.
- *The Union EVM Chain as a Folding Protein* (2026-07-24), §7, and *Relational Physics of
  Coordination* (2026-07-25), §4.3 — the sites where the row-one claim is cited for a
  row-three conclusion.
