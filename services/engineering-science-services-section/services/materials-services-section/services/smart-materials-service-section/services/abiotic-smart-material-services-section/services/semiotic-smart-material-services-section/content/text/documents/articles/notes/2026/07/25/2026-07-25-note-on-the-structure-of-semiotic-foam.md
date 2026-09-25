---
title: "The Structure of Semiotic Foam: Distinctions as Interfaces, Coarsening as Forgetting, and Ossification as Particle Pinning"
description: "Reads a corpus of utterances as a Plateau foam, proves lexical equilibrium is isostatic, and derives a degree-six coarsening survival threshold for terms independent of definitional quality."
date-created: 2026-07-25
kind: research-note
keywords:
  - foam-physics
  - plateau-equilibrium
  - coarsening
  - ossification
status: design
declared-by: claude-interactive-session-supplying-lenticule-science
---

### Distinctions as Interfaces, Coarsening as Forgetting, and Ossification as Particle Pinning

## Abstract

We develop a formal account of a corpus of typed utterances as a **foam**: a space-filling
partition whose cells are claims and whose walls are the tokens that distinguish them. The
identification is not decorative. Taking an utterance to be an ordered pair
$(\text{token}, \text{claim})$ makes the token a *boundary* and the claim a *region*, and
this dual reading imports the whole apparatus of foam physics — Plateau's equilibrium laws,
von Neumann coarsening, Kelvin's partition problem, and particle pinning — as statements
about vocabulary rather than about soap. We prove that a corpus at lexical equilibrium is
*isostatic* in the constraint-counting sense (Proposition 3.4), which places it exactly at
the rigidity threshold rather than near it, and we derive from von Neumann's law a degree
threshold below which a term is absorbed by its neighbours (Theorem 4.3). We then show that
the three permanence classes observed in dynamic-covalent networks — permanent and
compliant, exchangeable, and permanently rigid — are the three wall types of a
particle-stabilized foam, and that the germline/somatic distinction is precisely the
pinned/free distinction on walls (§5). Ossification is thereby identified with Pickering
stabilization: a foam whose interfaces carry jammed particles does not coarsen, and a corpus
whose distinctions are pinned does not forget. We close with four measurements that would
falsify the account, all runnable against an existing glossary.

**Keywords:** foam, Plateau's laws, von Neumann's law, coarsening, Pickering stabilization,
constraint counting, rigidity matroid, semiotics, glossary dynamics.

---

## 1. Introduction

### 1.1 The object

A corpus of formal records is usually modelled as a graph — terms as vertices, references as
edges — and the graph is then studied for connectivity, centrality, or community structure.
This is not wrong, but it discards the fact that a definition is not a point. A definition
*occupies* territory: it makes claims about a region of possibility, and its neighbours make
claims about the adjoining regions. What separates them is not distance but an *interface*,
and the interface has a name.

That name is the token. An utterance is an ordered pair

$$u = (t, c), \qquad t \text{ the token}, \quad c \text{ the claim},$$

with the ordering load-bearing: the token comes first because the token is what *does* the
separating, and the claim is what results from having separated. This is Spencer-Brown's
first instruction — *draw a distinction* — read materially. To draw a distinction is to
place a wall. What the wall bounds is a claim.

A structure of space-filling regions separated by walls is a **foam**, and foams are among
the best-understood objects in soft-matter physics. The purpose of this monograph is to take
the identification seriously enough to be wrong in checkable ways.

### 1.2 Why the identification is not decorative

We are wary of the failure mode in which a vivid physical word is imported at the level of an
observed phenomenon while the underlying mathematics is something else entirely. The test we
apply throughout is whether the physical concept's *commitments* transfer, not whether its
imagery is apt.

Four commitments transfer, and they are the four this monograph is built on.

1. **Space-filling.** Foam cells partition space with no gaps. A corpus's claims partition
   the possibility-space they govern; a region no term claims is not a hole in the foam but
   territory outside it.
2. **Interfaces carry tension.** A soap film has surface energy proportional to its area, so
   a foam evolves to reduce total interfacial area subject to its constraints. A distinction
   carries maintenance cost — it must be defined, defended, disambiguated against its
   neighbours — so a vocabulary is under an analogous pressure.
3. **Local equilibrium is over-determined.** Plateau's laws fix the angles at which walls
   may meet, and those angles are not free parameters but consequences of force balance.
4. **Coarsening is combinatorial.** Von Neumann's law makes a two-dimensional cell's growth
   rate depend *only* on its number of sides, not on its size or shape. This is the sharpest
   transfer, and §4 is devoted to it.

What does **not** transfer, and we say so before relying on anything: a soap foam's walls are
embedded in a metric space with a genuine area, whereas a corpus's "wall area" is a cost we
have not measured. Everything in §3 and §4 is therefore conditional on a cost functional
existing; §8 makes finding one the first experiment.

### 1.3 What is new here

The account unifies three things that arose separately: a materials-science reading of a
distributed system's state variable, a matroid-theoretic diagnostic for which invariant an
instrument is actually computing, and a semiotic primitive. The unification is the claim, and
its two load-bearing results are Proposition 3.4 (lexical equilibrium is isostatic) and
Theorem 4.3 (the degree threshold).

---

## 2. Definitions

**Definition 2.1 (utterance).** An *utterance* is an ordered pair $u = (t, c)$ of a token
$t$ and a claim $c$. Write $T(u) = t$ and $C(u) = c$.

**Definition 2.2 (semiotic foam).** A *semiotic foam* $\mathcal{F}$ on a possibility-space
$X$ is a triple $(\mathcal{C}, \mathcal{W}, \partial)$ where:

- $\mathcal{C}$ is a finite set of **cells**, one per claim, together with an assignment
  $\mathrm{vol} : \mathcal{C} \to \mathbb{R}_{>0}$ such that the cells partition $X$;
- $\mathcal{W}$ is a finite set of **walls**, one per token;
- $\partial : \mathcal{W} \to \binom{\mathcal{C}}{2}$ assigns to each wall the unordered pair
  of cells it separates.

We require $\partial$ to be well-defined: a token separates exactly two claims. A token
appearing to separate more is *underdetermined* and must be split before the foam is defined
— this is not a restriction we impose but the content of the requirement that a distinction
be a distinction between two things.

Whether this exactly-two requirement is a harmless normalization or a substantive restriction
is not settled. It is the point where a real vocabulary is most likely to refuse the model:
natural terms routinely bound more than two regions at once, and the splitting the definition
demands may not be canonical.

**Definition 2.3 (the wall graph).** The *wall graph* $G(\mathcal{F})$ has vertex set
$\mathcal{C}$ and edge set $\mathcal{W}$, with $w$ joining the two cells in $\partial w$.
The **degree** $n(c)$ of a cell is its number of walls, equivalently its number of
neighbouring claims.

Note that $G(\mathcal{F})$ is the *dual* of the geometric picture: cells become vertices and
walls become edges. This dual is where all the combinatorics lives, and it is the object on
which matroid statements are made.

**Definition 2.4 (interfacial cost).** An *interfacial cost* is a function
$\gamma : \mathcal{W} \to \mathbb{R}_{>0}$, with total cost
$\Gamma(\mathcal{F}) = \sum_{w \in \mathcal{W}} \gamma(w)$. We do not fix $\gamma$; §8.1
makes its measurement the first experiment. Read $\gamma(w)$ as what it costs to keep the
distinction $w$ sharp: the definitional text, the disambiguating clauses, the reviewer
attention spent on confusions it fails to prevent.

**Definition 2.5 (equilibrium).** $\mathcal{F}$ is at *equilibrium* if $\Gamma$ is stationary
under wall motions preserving the cell volumes.

The volume constraint is essential and is what makes this a foam problem rather than a
trivial one. Without it the minimizer is the empty vocabulary. With it, the question is the
one Kelvin asked: *given that these regions must be distinguished, what is the cheapest way
to distinguish them?*

---

## 3. Plateau equilibrium and isostaticity

### 3.1 Plateau's laws

For a dry foam — one whose liquid fraction tends to zero, so that walls are surfaces rather
than channels — equilibrium forces a rigid local geometry [Plateau 1873; Taylor 1976]:

**(P1)** Walls meet three at a time along lines, at $120°$.
**(P2)** Those lines meet four at a time at points, at the tetrahedral angle
$\arccos(-1/3) \approx 109.47°$.

These are not observations but consequences of surface-tension balance, and Taylor proved
that any area-minimizing surface satisfies them. Their combinatorial content is what we use:
**equilibrium fixes local coordination.** Three walls per line, four lines per vertex, no
exceptions and no free parameters.

### 3.2 The isostatic reading

Constraint counting compares a structure's degrees of freedom against the constraints acting
on them. A structure with more freedoms than constraints is **floppy**: it deforms at no
cost. One with more constraints than freedoms is **over-constrained**: it carries internal
stress and is brittle. The balance point is **isostatic** — zero floppy modes, zero redundant
stress.

**Lemma 3.3.** In a dry foam vertex, four Plateau borders meet at a point in $\mathbb{R}^3$.
The point carries $3$ translational freedoms. Each incident border exerts a tension of fixed
magnitude along its own direction, contributing one force-balance constraint per independent
direction; the four tensions must sum to zero, which is $3$ scalar equations.

*Proof.* Immediate from force balance: $\sum_{i=1}^{4} \gamma \hat{e}_i = 0$ in
$\mathbb{R}^3$ is three scalar conditions on three coordinates. $\square$

**Proposition 3.4 (equilibrium is isostatic).** *A dry foam at Plateau equilibrium is
isostatic at every vertex: constraints exactly balance freedoms, with no floppy mode and no
redundant stress.*

*Proof.* By Lemma 3.3 the count is $3$ against $3$. That the four unit vectors satisfying
$\sum \hat e_i = 0$ are exactly the tetrahedral configuration (P2) is the statement that the
solution is unique up to rotation, so the constraint set is independent — neither deficient
(which would leave a floppy mode) nor redundant (which would admit self-stress). $\square$

This is the monograph's first substantive result, and its force is in what it forbids.

**Corollary 3.5.** *A vocabulary at equilibrium sits exactly at its rigidity threshold, not
near it.* It has no slack — no distinction can be perturbed without cost — and no internal
stress — no two distinctions are fighting over the same boundary. Both departures are
pathologies, and they are opposite pathologies:

- **Floppy** ($\text{load-bearing}_{(k)}$ nullity zero with modes to spare): distinctions
  that could be moved freely without anyone noticing. Terms nobody would miss.
- **Over-constrained**: two definitions competing to bound the same region. Internal stress,
  and the characteristic symptom is brittleness — the corpus cannot absorb a new case without
  something cracking.

The second is worth naming carefully because it is the failure mode that looks like rigour.
Two independently authored definitions of the same concept, each internally consistent and
neither aware of the other, are a redundant constraint on one boundary. Constraint counting
predicts what happens next: not a contradiction, which would be visible, but *stress* — the
region between them becomes a place where work fails for reasons no local inspection
explains.

---

## 4. Coarsening, and the degree threshold

### 4.1 Von Neumann's law

The sharpest transferable fact about foams concerns how they age. In a two-dimensional dry
foam, cells exchange volume by diffusion through their shared walls, and the rate is
determined entirely by combinatorics [von Neumann 1952]:

$$\frac{dA_n}{dt} = \kappa\,(n - 6), \qquad \kappa > 0 \text{ a material constant}, \tag{4.1}$$

where $A_n$ is the area of a cell with $n$ sides. **The growth rate depends only on the
number of neighbours** — not on the cell's size, shape, or the identity of those neighbours.

The three-dimensional analogue is the MacPherson–Srolovitz formula [MacPherson & Srolovitz
2007], which replaces side-count by a mean-width expression but preserves the essential
structure: growth is set by a topological quantity, not a metric one.

The origin of the number $6$ is Euler's formula. In a 2D foam obeying (P1), three walls meet
at each vertex, and $V - E + F = 2$ forces the average cell to have exactly six sides in the
large-foam limit. Six is not a parameter; it is the average coordination a space-filling
partition with trivalent vertices is obliged to have.

### 4.2 Reading it lexically

Applying (4.1) to a semiotic foam requires the identification: $A_n$ is the extent of a
claim's territory — the range of cases it governs — and $n$ is the number of other terms it
is defined against.

**Theorem 4.3 (degree threshold).** *In a two-dimensional semiotic foam at Plateau
equilibrium and undergoing volume exchange according to (4.1), a claim with fewer than six
neighbouring claims loses territory monotonically and is absorbed in finite time; a claim
with more than six gains; a claim with exactly six is stationary.*

*Proof.* Immediate from (4.1): $\mathrm{sgn}(dA_n/dt) = \mathrm{sgn}(n-6)$, and $A_n > 0$
with $dA_n/dt \le -\kappa$ bounded away from zero for $n \le 5$ gives absorption in time at
most $A_n(0)/\kappa$. $\square$

The consequences are unintuitive and are the reason this is worth stating.

**A term is not protected by being well-defined.** Its survival is set by how many *other*
terms it borders. A precisely-specified term with three neighbours shrinks; a vague term with
nine grows. Definitional quality does not appear in (4.1) at all.

**Coarsening is not decay but consolidation.** As small-$n$ cells vanish, their neighbours
inherit territory and gain sides, so the foam becomes coarser and its average cell larger
while the *total* territory is conserved. A vocabulary that loses terms is not necessarily
losing coverage; it may be consolidating.

**The direction is irreversible without input.** Coarsening is driven by interfacial cost
reduction and runs one way. A corpus left alone forgets its low-degree terms, and this
requires no agent, no decision, and no failure of care.

### 4.4 What this predicts that is checkable

Theorem 4.3 is falsifiable against any glossary with a history. Build the term graph, compute
each term's degree, and ask whether the terms that were absorbed or deprecated were
disproportionately low-degree at the time of their disappearance. The prediction is sharp
enough to fail: it says degree at time $t$ predicts survival at $t + \Delta$ *better than
definitional quality does*, which is a comparison, not a correlation.

The 2D law is the clean case. Real corpora are not two-dimensional, and the correct
prediction in higher dimension is MacPherson–Srolovitz, whose threshold is a mean-width
condition rather than a bare count. §8.2 states the experiment in the form that does not
assume dimension.

---

## 5. The three wall types, and why a corpus need not coarsen

### 5.1 Pinning

Section 4 describes a foam that ages. Real foams often do not, and the reason is instructive:
if solid particles adsorb at the interfaces and jam, the walls cannot move, and coarsening
arrests. This is **Pickering stabilization** [Pickering 1907; Ramsden 1903], and
particle-stabilized foams are active for months where surfactant foams collapse in minutes.
The mechanism is mechanical rather than chemical — the jammed particle layer at the interface
resists the area change that coarsening requires.

This gives the third structural class, and with it a complete typology. A wall in a semiotic
foam is in exactly one of three states:

| wall type | permanence | mobility | function |
|---|---|---|---|
| compliant permanent | never removed | moves freely | holds the partition together |
| exchangeable | may be broken and reformed | moves under drive | the write mechanism |
| pinned | never removed | cannot move | the recorded state |

The middle class is what a dynamic-covalent network supplies chemically: linkages that
exchange associatively, so the network reorganizes without dissolving. The third is what a
jammed particle layer supplies. The first is the elastic backbone that keeps the structure a
structure while the other two do the work.

**Proposition 5.2 (why the exchangeable fraction is bounded below and above).** *A foam with
no exchangeable walls cannot be rewritten; a foam whose walls are all exchangeable cannot
hold a state against load. The usable regime is bounded on both sides, and the exchangeable
fraction should be the minimum that permits the pinned phase to reorganize.*

*Proof sketch.* Rewriting requires wall motion, which requires some wall to be mobile.
Holding state under load requires that some connected sub-network resist deformation
indefinitely, which an all-exchangeable network cannot, since every path through it relaxes
on the exchange timescale. The lower bound is set by the connectivity needed for the pinned
phase to rearrange; the upper by creep tolerance. $\square$

This inverts the intuition that more reconfigurability is better. Every exchangeable wall is
a creep path, and the correct design target is a floor, not a maximum.

### 5.3 Germline and soma are pinned and free

Weismann's distinction separates the heritable lineage from the body that carries it:
information flows germline to soma, and somatic modification does not write back.

Read on the foam, this is exactly the pinned/free wall distinction, and the reading discharges
a commitment that the biological name alone leaves vague — *what makes the barrier a
barrier*. It is not a rule enforced by an agent. Pinned walls cannot move because they are
jammed; free walls move because nothing stops them. The asymmetry is mechanical.

| Weismann | foam | corpus |
|---|---|---|
| germline | pinned walls | seated distinctions, no longer re-derived |
| soma | free walls | working vocabulary, still negotiable |
| barrier | jamming | the pinned layer's resistance to area change |
| somatic modification not inherited | free-wall motion does not unpin | working usage does not seat a term |

The last row is the one worth dwelling on, because it is a prediction rather than a
restatement. It says that *usage does not seat*. However heavily a term is used in working
prose, it does not thereby become part of the durable lineage; seating is a separate act with
a different mechanism. A corpus in which heavy usage silently promoted a term to permanence
would have no germline barrier, and would be subject to the error accumulation the barrier
exists to prevent.

Three things this account does not yet establish are worth naming. Whether §4's coarsening
actually governs vocabulary loss in a real corpus is untested. Whether §5's three-part
typology is exhaustive, rather than merely sufficient, is open. And whether the germline
reading of §5.3 predicts anything beyond what §5.3 already assumes has not been shown.

---

## 6. Which invariant is being counted

The foam supplies two graphs, and they are not the same object. Confusing them is the
principal technical hazard of this account.

**The wall graph** $G(\mathcal{F})$ of Definition 2.3 — cells as vertices, walls as edges —
carries the combinatorics of §4. Its cycle rank

$$b_1 = |\mathcal{W}| - |\mathcal{C}| + c$$

is the nullity of its **graphic matroid**: it counts redundant *connections*, walls that
could be removed without disconnecting the adjacency structure.

**The vertex framework** of §3 — Plateau vertices as points, borders as members — carries the
mechanics. Its relevant matroid is the **generic rigidity matroid**, of rank $2|V| - 3$ in
the plane, whose independence is tested by the pebble game rather than union–find, and whose
defining condition is hereditary: *every* subgraph on $n'$ vertices carries at most
$2n' - 3$ edges [Laman 1970; Jacobs & Hendrickson 1997].

These differ, and the difference is one parameter wide. Writing $k$ for a matroid's rank per
vertex in the large-structure limit, redundancy appears when $\bar z > 2k$, and $k = 1$ for
the graphic matroid against $k = d$ for central-force rigidity in $d$ dimensions. Hence the
notational discipline used throughout: $\text{load-bearing}_{(1)}$ is a redundant connection,
$\text{load-bearing}_{(2)}$ a redundant constraint in the plane, and an unsubscripted claim
is ambiguous in the direction of the stronger reading.

**Remark 6.1.** An account that computes $b_1$ of the wall graph and reports it as rigidity
is running a $k = 1$ instrument on a $k \ge 2$ question. The error is not detectable by
inspecting either the mathematics or the prose alone; it is detectable only by asking which
matroid the instrument counts. Proposition 3.4 is a statement about the *rigidity* matroid
and does not follow from any cycle-rank computation.

**Remark 6.2 (a quantifier that must be stated).** It is tempting to say a foam of cycle rank
$b_1$ survives the removal of any $b_1$ walls without disconnecting. This is false: a triangle
with a pendant edge has $b_1 = 1$, and removing the pendant disconnects. The true statement
is existential — the $b_1$ walls outside a spanning forest can all be removed harmlessly.
Cycle rank is not edge connectivity.

---

## 7. The clock

Sections 4 and 5 describe processes with rates, and comparing them requires a clock. The
natural one is not a temperature.

A control parameter formed as a ratio of counts or rates is sometimes called a temperature,
but thermodynamic temperature is a conjugate variable, $1/T = \partial S/\partial E$, and
the name promises an energy scale and a Boltzmann factor that a rate ratio does not have.
The correct dimensionless parameter for a structure that relaxes is the **Deborah number**

$$\mathrm{De} = \frac{\tau_{\text{relax}}}{\tau_{\text{observe}}} ,$$

the ratio of the material's characteristic relaxation time to the time over which it is
watched. Low $\mathrm{De}$: the structure relaxes faster than you look, and behaves as a
liquid. High $\mathrm{De}$: it relaxes slower, and behaves as a solid.

The three wall types of §5 are three relaxation times, and the foam's behaviour is set by
where the observation window falls among them:

$$\tau_{\text{pinned}} \gg \tau_{\text{exchangeable}} \gg \tau_{\text{compliant}} .$$

An observer at $\mathrm{De} \ll 1$ relative to all three sees a liquid: everything
renegotiable, nothing settled. At $\mathrm{De} \gg 1$ relative to all three, a glass:
nothing moves, including what should. The useful regime is the intermediate one — pinned
walls solid, exchangeable walls fluid, on the same timescale of observation — and it is not
a vague middle but the **viscoelastic** regime, with measurable signatures and a literature.

**Proposition 7.1.** *A structure can be simultaneously a record and a workspace only if its
wall relaxation times are separated by at least the ratio of its write interval to its
retention interval.* Otherwise either the record relaxes within the retention window, or the
workspace fails to relax within the write window.

*Proof sketch.* Retention requires $\tau_{\text{pinned}} > \tau_{\text{retain}}$; writability
requires $\tau_{\text{exchangeable}} < \tau_{\text{write}}$. Dividing gives the stated
separation as a necessary condition. $\square$

This is a design constraint with a number in it, and §8.4 measures it.

---

## 8. Experiments

Each is stated so that a negative result is informative, and each is runnable against an
existing corpus without new instrumentation.

**8.1 The cost functional.** Everything in §3 is conditional on $\gamma$ existing. Measure a
candidate — definitional length, disambiguating-clause count, or observed confusion incidents
per term-pair — and test whether the corpus's actual vocabulary is stationary for it under
volume-preserving perturbation. *A negative result kills the equilibrium reading entirely and
is the cheapest available refutation of the whole account.* This experiment should be run
first.

**8.2 The degree threshold.** Build the term graph with history. Test whether degree at time
$t$ predicts absorption by $t + \Delta$, and specifically whether it predicts *better than
definitional quality does*. Theorem 4.3 gives the 2D threshold at six neighbours; the
dimension-agnostic form tests only monotonicity of survival in degree, and should be preferred
since a corpus's effective dimension is unknown.

**8.3 Over-constraint as stress.** Corollary 3.5 predicts that two independent definitions of
one concept produce not a visible contradiction but localized brittleness. Identify pairs of
independently authored definitions covering the same region, and test whether work touching
that region fails at a higher rate than matched controls, without those failures citing the
duplication as a cause. A null result here would be strong evidence against the isostatic
reading.

**8.4 Timescale separation.** Measure the three relaxation times directly — how long a seated
term persists, how long a working term survives before revision, how long a formatting or
phrasing convention lasts — and test Proposition 7.1's separation condition. This is
descriptive rather than falsifying, but it produces the number the design constraint needs.

---

## References

Jacobs, D. J. & Hendrickson, B. (1997). An algorithm for two-dimensional rigidity
percolation: the pebble game. *Journal of Computational Physics* 137, 346.

Laman, G. (1970). On graphs and rigidity of plane skeletal structures. *Journal of
Engineering Mathematics* 4, 331.

MacPherson, R. D. & Srolovitz, D. J. (2007). The von Neumann relation generalized to
coarsening of three-dimensional microstructures. *Nature* 446, 1053.

Maxwell, J. C. (1864). On the calculation of the equilibrium and stiffness of frames.
*Philosophical Magazine* 27, 294.

Phillips, J. C. & Thorpe, M. F. (1985). Constraint theory, vector percolation and glass
formation. *Solid State Communications* 53, 699.

Pickering, S. U. (1907). Emulsions. *Journal of the Chemical Society, Transactions* 91, 2001.

Plateau, J. (1873). *Statique expérimentale et théorique des liquides soumis aux seules
forces moléculaires.* Gauthier-Villars.

Ramsden, W. (1903). Separation of solids in the surface-layers of solutions and suspensions.
*Proceedings of the Royal Society of London* 72, 156.

Spencer-Brown, G. (1969). *Laws of Form.* Allen & Unwin.

Taylor, J. E. (1976). The structure of singularities in soap-bubble-like and soap-film-like
minimal surfaces. *Annals of Mathematics* 103, 489.

Thomson, W. (Lord Kelvin) (1887). On the division of space with minimum partitional area.
*Philosophical Magazine* 24, 503.

von Neumann, J. (1952). Discussion remark concerning paper of C. S. Smith "Grain shapes and
other metallurgical applications of topology". In *Metal Interfaces*, American Society for
Metals, 108.

Weaire, D. & Phelan, R. (1994). A counter-example to Kelvin's conjecture on minimal surfaces.
*Philosophical Magazine Letters* 69, 107.

Weismann, A. (1893). *The Germ-Plasm: A Theory of Heredity.* Scribner.
