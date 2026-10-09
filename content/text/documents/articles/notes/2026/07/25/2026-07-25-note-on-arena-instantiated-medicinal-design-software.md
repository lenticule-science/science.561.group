---
title: "Plan for Arena-Instantiated Medicinal Design Software"
description: "What the software actually does: score a candidate's selectivity against a real target and its near-miss with an independently-checkable verdict, or state precisely which piece of math is missing instead of guessing; leave candidate generation to existing tools; make the independent check itself the public-health argument."
date-created: 2026-07-25
kind: research-note
keywords:
  - unionification
  - drug-design
  - kinetic-proofreading
  - conformance
  - independent-recomputation
status: design
declared-by: claude-interactive-session-supplying-leader-movement-team
---

**What we are building.** A piece of open-source software that takes a real medical target — a
specific cancer mechanism, a specific virus's replication machinery — and does one of exactly two
things with it: computes a verdict backed by a chain of reasoning that a second, independent process
can re-run and check, or states precisely which piece of the underlying math is missing to compute
that verdict at all. It never does a third thing — produce a number that looks like an answer but is
really one model's opinion, unchecked. The datastructure underneath is secondary and shouldn't be
over-designed up front. The target is what matters, and cancer and viral targets are the right ones
to build against precisely because they are complicated and idiosyncratic — a clean, easy target
would let the software work without ever finding out where it's still weak.

## 1. How to score whether a candidate is selective

Say a molecule is meant to bind one thing (a cancer cell's surface marker, a virus's replication
enzyme) and not another (a normal cell's version of something similar, a human enzyme that resembles
the viral one). The way a real cell often tells these apart is a multi-step checkpoint race: binding
happens, then a first change, then a second, and at each step there are two ways out — commit to the
next step, or fall back off. A loosely-bound molecule tends to fall off before clearing every step; a
tightly-bound one tends to make it through. Doing this in several steps rather than one is what turns
a small difference in binding strength into a much larger difference in the final outcome — the core
trick real biology already uses (T-cells and CAR-T cells discriminating tumor antigen from normal
tissue work exactly this way).

The right object for this isn't "a formula for the final probability" — that only exists for the
simplest, straight-line version of the cascade. Real discriminating systems often have feedback: a
signal downstream, once strong enough, resets earlier steps. A step's outcome can then depend on a
fact that isn't local to that step at all. What's actually needed is: a set of events in causal
order (step two can't clear before step one), a rule for which pairs of outcomes are mutually
exclusive (a checkpoint can't both fall off and commit), a mark on each event for how confident the
evidence makes us that it happened a particular way — real measured rates, with real uncertainty, not
exact numbers — and a way of combining partial evidence into a final verdict that only ever gets more
confident, never walks anything back, and stops the moment there's enough evidence to be sure. It
does not need to wait for every measurement if it already has enough to know the answer.

Selectivity then has a clean definition: build the same checkpoint structure twice, once against the
real target and once against the thing that must not be hit, and ask how different the two settled
verdicts are. If they come out nearly the same, the design cannot actually tell the two apart, no
matter how good either verdict looks in isolation.

### Worked example

Three receptor chains on one cell, two checkpoints each. Checkpoint one: bind or fall off.
Checkpoint two: commit, fall off, or — only if a shared, cell-wide "too much activity" signal is
already high — get reset back a step. That shared signal isn't local to any one chain; it becomes
known only once at least two of the three chains' first-checkpoint outcomes are known, and,
importantly, becomes known at exactly that point — it doesn't need the third chain's result at all
once two agree.

Numbers standing in for a strong vs. a weak binder (checkpoint-one success 0.9 vs. 0.3;
checkpoint-two success without any feedback reset, same 0.9 vs. 0.3): full activation lands at 0.81
for the strong binder and 0.09 for the weak one — a factor of 9, exactly the "square the per-step
ratio" result two straight-line checkpoints should give. Turn on the feedback reset (it heavily
suppresses the weak binder's second checkpoint, barely touches the strong one): the strong binder
still activates at 0.81, but the weak binder's activation probability drops to about 0.059 — a factor
of about 13.6, not 9. Feedback made the system more selective than the straight-line formula could
ever produce, using exactly the object above — events, mutual exclusion, a shared signal known only
once enough evidence is in — with nothing extra bolted on.

## 2. How to get a candidate without searching for one

Separately from scoring a candidate, there's the problem of proposing one in the first place. The
naive way is search: try shapes, measure how good each is, keep looking. That's slow because most
shapes are bad and most of the search is wasted — the same reason a chain of amino acids can't try
every possible fold at random and still finish in microseconds; done that way, folding would outlast
the age of the universe.

There's a general escape from searching at all: describe "how good a shape is" as a single number
that a proposed change either lowers or leaves alone, and only ever make changes that don't raise it.
Wherever that process ends up is automatically the best shape reachable by it — not because every
alternative was checked, but because there's nowhere left to go that's better, by construction.
Reaching that point isn't a search; it's running a number-only-goes-down process until it stops
moving. The same three-line argument works whether the number is a protein settling into its
functional shape, a chemical reaction network running down to completion, or — the case that matters
here — a molecule's electron density settling into its lowest-energy configuration.

The honest gap, stated more precisely than "open question" — because it isn't quite that. The
argument as written only says the process settles *if* a lowest point exists at all; it does not by
itself say a lowest point exists when the state space is real molecular electron densities. But that
existence question was substantially answered in 1983, by Lieb, for exactly this functional: instead
of trying to show directly that a minimizer exists over ordinary densities in `L^1` (which runs into
a real obstruction — bounded sets in `L^1` are not weakly compact, so the usual "take a minimizing
sequence, pass to a convergent subsequence" argument does not go through as stated), Lieb redefined
`F` by a constrained search over many-particle wavefunctions and then took its convex envelope,
allowing mixed states rather than only pure ones. That convexified `F` turns out to be exactly the
Legendre transform of the ground-state energy as a functional of the external potential — and once a
functional is a Legendre transform, convex duality hands you existence of a minimizer directly,
without ever needing a compactness argument on the space of densities at all.

So the actual open task here is narrower and more concrete than "prove a minimizer exists": it is
"redo Lieb's constrained-search-plus-convexification construction inside this framework's own
carrier, and show that the resulting functional is the Legendre dual of *this* framework's own
settled-energy notion." That is a translation task with a known target shape, not open mathematics —
which also means it's the kind of gap that can actually be closed, not merely stated and left. Until
it is closed, the descent argument here is a real, working shortcut for state spaces where a minimum
is already known to exist by direct construction — not yet a working shortcut for an actual molecule's
electron density, where the minimum is known to exist, but only via a construction this framework
hasn't yet redone in its own terms.

## 3. Failing precisely is real output, not a stall

Most software either gives an answer or crashes. This one needs a third, deliberate mode: when a
real target hits a point where the reasoning simply doesn't go through — like the density gap in
\S2 — it stops and states exactly what's missing, precisely enough that someone could go prove it or
go find a counterexample. That is not a failure to be smoothed over. A vague "this is hard" helps no
one; "a minimizer of this exact energy over this exact space of densities is not known to exist" is
something a mathematician can pick up and finish. Recording gaps this precisely, every time the
software hits one, is as much the point of building it as producing verdicts is.

## 4. Where candidate structures come from

Proposing new molecular shapes from scratch is already a fast-moving, well-resourced field —
structure-prediction and generative-design tools exist, are public, and improve monthly. Building a
competitor to that from a standing start would waste effort on a problem other people already solve
well. This software should sit downstream of whatever proposes a candidate — one of those existing
tools, or a chemist typing one in by hand — and do what §§1-3 describe: score it against a target and
its near-miss, honestly, and either produce a checkable verdict or a precisely named gap.

## 5. Why the check has to be a recomputation, and why that's a public-health argument

A verdict that the same process both produces and vouches for isn't worth much. But the thing that
makes a second check worth anything is not that a different party performs it — it is that the second
check *recomputes*: it re-runs the scoring on the stated inputs and compares numbers, rather than
re-reading the first process's reasoning and forming an opinion about it. A second opinion over the
same information is a correlated draw, and two correlated draws catch what one draw catches. A
recomputation is a measurement, and that is a different thing. This settlement already runs on a
version of that principle: nothing counts as done because the maker says so; it counts as done when
the conditions are re-run and they hold. That principle was recently tested here and found wanting in
practice — a real audit found that
nearly all of a large batch of supposedly-finished work had gone out through a shortcut that skipped
the independent check entirely, and roughly a third of what went out that way was later confirmed
bad. That's a concrete demonstration of what happens when the second-check step gets bypassed: bad
output gets treated as settled fact until someone goes back and looks.

That is exactly the failure mode to design out of medical-compute software, because the stakes are so
much higher than a bad code commit. A tool that reports "this candidate is selective" as one model's
own confidence score, with nothing independent behind it, has the same shape as that bypass — and the
cost of believing a wrong verdict isn't a bad commit, it's money and time chasing a candidate that was
never going to work, or a flawed one reaching a person before the flaw is found. Building the
independent-check step into the software itself, and open-sourcing the check along with everything
else, is what turns "this is more trustworthy than the alternatives" into a claim anyone can verify
instead of one asserted about its own work.

## 6. What to actually do next

Two candidate next moves, and only one should be started before the other is resolved — starting both
at once is the kind of half-finished parallel work that produces nothing checkable:

- Build the worked example in §1 as an actual running instance of the checkpoint machinery, not
  hand arithmetic — a real first output from a real target.
- Write down the exact gap in §2 (redo Lieb's constrained-search-plus-convexification construction
  inside this framework's own carrier, and identify the result as the Legendre dual of its own
  settled-energy notion) as precisely as a mathematician would need to pick it up, with everything it
  depends on spelled out, and place it where this settlement's other open math questions already
  live.

Pick one, finish it, and only then decide whether the other is still the right next step — finishing
the first may well change what the second needs to say.
