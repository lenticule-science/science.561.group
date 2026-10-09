---
title: "Research on Charge-Settled Development: A Verification Paradigm for Agentic Programming"
description: "A named, falsifiable development paradigm derived from Obsmetrologia (“Infomaterial” at time of writing)'s settling mathematics (Valuation, Closure, no_periodic_orbits, closure_merge, lfp_reached_by_three, cosettling), specifying concrete practices for how agentic programming systems should accumulate, merge, and stop gathering verification evidence."
date-created: 2026-07-05
date-modified: 2026-07-31
keywords:
  - paradigm
  - settling
  - closure
  - charge
  - valuation
  - witness-journal
  - agentic-programming
  - falsifiable
status: proposal
---

# Charge-Settled Development: A Verification Paradigm for Agentic Programming

## Abstract

Every mainstream development paradigm — test-driven, documentation-driven,
proof-driven, behavior-driven — answers "what do you write first." None of them
answer three questions that matter more once verification is distributed across
multiple agents working in parallel: *when is a claim actually done*, *what do you
do when two verifiers disagree*, and *is it safe to merge independent agents'
verification work without redoing it*. This note derives falsifiable answers to
all three from Infomaterial's settling mathematics — not by analogy, by reusing
proven theorems about a closure operator on a four-valued evidence lattice — and
names the resulting protocol **Charge-Settled Development (CSD)**. CSD's
storage substrate is not new: it is the witness journal's persistence layer (cited below as
`lib/persistence`, this note's original citation — see the 2026-07-31 code-citation note in §2.1 for
where that engine actually lives today), reused as-is. Its
stage vocabulary is not new either: it matches `question-driven-development`,
already built in `@561/development.active.swarm`. What is new is the operational
layer between them — a stopping rule, a conflict rule, a parallel-merge safety
proviso, and a re-verification budget — each stated as a claim that could be
wrong, with the specific observation that would show it.

## 0. Prior art (searched, not invented against)

Before proposing anything, the existing named methodologies in this checkout and
the wider literature:

- **Test-driven, documentation-driven, proof-driven, behavior-driven,
  specification-driven development, domain-driven design, continuous
  delivery** — the `commensurateWith` list `@561/development.active.swarm`
  already tags its own cycle against
  (`.../apps/tools/swarm/README.md:309`).
- **`question-driven-development`** (same file, `:298-311`) — a built cycle,
  `question -> theorem -> proof -> examples -> spec artifact -> tests -> code ->
  result`, explicitly *not* specification-driven development ("spec and test
  phases are artifacts inside the question-driven cycle").
- **`praxis-driven development`**
  (`.../terms/praxis-driven-development/index.html`, 2026-04-04) — argues
  against predicting shape via any of documentation-first, specification-first,
  or test-first; the shape should emerge from cycles of action and reflection
  (Dewey, Schön, Lewin, Peirce).
- **Type-driven development** (Brady, *Type-Driven Development with Idris*) —
  the closest external analogue to proof-driven development: a dependent type
  is written first, and the implementation is discharged against it.

None of these specify a merge-safety law for parallel verifiers, a mechanical
stopping rule, or a conflict-handling rule. That is the actual gap; CSD fills it,
not a slot next to these that was standing empty for a different reason.

## 1. The formal object: a claim's evidence is a point in a four-valued lattice

`Charge := Articulating.Corner`
(`Infomaterial/Articulation/Articulating/FourCorner.lean:18`), four values —
`absurd` (⊥ₖ, told nothing), two incomparable one-bit values `potential`/`active`,
and `stable` (⊤ₖ, told both, held as a value, not resolved away) — ordered by
`≤ₖ` (`Infomaterial/Language/Settling.lean:31`), proven a bounded lattice with
`∨ₖ`/`∧ₖ` as lub/glb (`:44-60`). A `Valuation` is a total map from every claim to
its current `Charge`:

```
Valuation := Claim -> Charge                          (Positing/Valuation.lean:18)
knowledgeLeast : Valuation := fun _ => Charge.kBot      (Positing/Valuation.lean:31)
```

**A claim, for CSD's purposes, is anything an agent can point at and ask "is this
established": a function's postcondition, a type signature, a spec sentence, a
behavioral requirement.** `knowledgeLeast` is the state of every claim in a
codebase the instant it is named and nothing has verified it yet — before a test
has run, before a proof has been attempted, before an example has been checked.

Verification is a **closure operator** on this space — inflationary, monotone,
idempotent (`Language/Settling.lean:65-69`) — and settling is what happens when
you iterate it from a seed to a fixed point (Knaster–Tarski,
`Settling.lean:97-109`; lifted to `Valuation`, `Closure/Modal.lean:293-320`).
Everything below follows from this object, not from resemblance to it.

## 2. The protocol

### 2.1 Storage: reuse the witness log, do not build a new ledger

A CSD claim-ledger is an ordinary EAVT feed
(`lib/persistence/index.mts`), with no new schema:

- **E** — the claim's address (a term, per `src/stores/path-term.mts`'s
  discipline: a proof-checked path, not a free string).
- **A** — the evidence kind: a small finite vocabulary (`test`, `proof`,
  `example`, `spec-read`), witnessed at the boundary like any other witness action,
  never cast directly from a caller-supplied string
  (`witnessAttributes`, `persistence/index.mts:235-248`).
- **V** — the `Charge` this piece of evidence asserts for the claim.
- **T** — the witness time, as for any EAVT row.

`state` (`data/state`, rank 2, `sufficient-statistic`,
`persistence/index.mts:92-101`) is then, without any new code, exactly the
current `Valuation`: the latest-charge-per-claim projection the witness substrate already
computes for every other feed. **This is the first falsifiable design
constraint, not a suggestion**: if a team's verification tooling cannot be
expressed as append-only `(claim, evidence-kind, charge, time)` rows feeding a
witness-shaped state projection, CSD does not apply to it as stated here — the
gap would be a real, nameable one (see §4.1), not a reason to fudge the
substrate.

**2026-07-31 vocabulary note, not a correction of this note's argument.** The
Leader's settled law for the witness journal (2026-07-31) is that "the charge"
is a *reading* — a projection computed over witnesses, never a value stored
directly in a row. Read carefully, this note does not conflict with that: the
per-row `V` value above is the `Charge` **one piece of evidence asserts**
(an ordinary witnessed object value, no different in kind from any other EAVT
`V`), while the thing this note calls the current `Valuation` — the
latest-charge-per-claim `state` projection — is exactly the settled law's
"charge as a reading": a computed projection over witnesses, not a stored
field. The two uses of the word "charge" in this note (per-witness assertion
vs. per-claim projected `Valuation`) map cleanly onto "witnessed object value"
vs. "reading," respectively, and are flagged here only so a reader does not
conflate them. Likewise §2.3's `⊤ₖ` merge result is a property of the
projected `Valuation` in a given evidence state — situational, per the settled
law's "contradiction is situational" — not a field the ledger itself tracks
per row.

**2026-07-31 code-citation note.** This note's `persistence/index.mts` and
`src/stores/path-term.mts` citations (here and in the Provenance section below)
were written against a package this rewrite could not confirm at the cited
paths. `lib/metroplat`/`@emsenn/metroplat` is not in the live tree; a legacy
archive checkout survives (now `@red-cup-engineering/metroplat`, at
`javascript-engineering-services-section/lib/legacy/metroplat/`, hidden from normal search
by the repo's `**/legacy/**` ignore rule) which lacks the cited
`lib/persistence/index.mts` but does carry a `path-term.mts` at a different
path (`src/lib/addressing/path-term.mts`). The witness log's real current home is the
witness-journal-services-section at
`lib/emsenn/services/561-group/services/red-cup-engineering/services/software-services-section/services/semiotic-software-services-section/services/witness-journal-services-section/services/{witness-journal-log-service,witness-journal-state-service,witness-journal-record-service,witness-journal-entry-service}`.
The specific line-number citations below are preserved as this note's original
claims, not independently re-verified against that real location in this pass.

### 2.2 Rule 1 — the stopping rule (quiescence, not a feeling)

**Claim.** A claim is done when the next application of the *same* verification
closure does not change its charge:
`Quiescent(v) := (cl v = v)` (`Closure/SettlingMonotonicityQuiescence.lean:119`),
proven equivalent to the orbit going constant
(`settling_quiescent_is_algebra`, `:150`).

**Falsifiable prediction.** Under CSD, no claim should require re-verification
by the *same* evidence kind after being marked quiescent, absent a new evidence
kind entering the ledger. If re-running the identical test/proof/example against
an unchanged claim changes its recorded charge, one of two things is true, and
CSD says which:

- the claim was never actually quiescent (state was read stale), or
- the "closure" is not a closure — the verification method is non-deterministic
  (flaky), and CSD's guarantees do not hold for it as stated (§4.1).

This is checkable today: log re-verification charge-deltas on already-quiescent
claims; a non-zero rate under unchanged evidence is a direct refutation of the
rule for that verification method, not an ambiguous "flakiness happens" shrug.

### 2.3 Rule 2 — the conflict rule (hold ⊤, never silently pick a side)

**Claim.** When two evidence kinds disagree about one claim, the merged charge
is `stable` (⊤ₖ) — via `joinK` — and this must be *recorded and surfaced*, never
resolved by discarding one side. This is not new law invented for CSD: it is the
same rule the witness-substrate note already states for federation
(`2026-06-25-research-on-witness-journal-the-relation-witness-information-log.md:72-74`,
"pooling assert + Undo to ⊤ and keeping both witnesses is the
information-correct move") and the same CRDT the federation merge already
proves (`mergeActivities`, cross-camp ⊤-retention,
`organizing/test/rwil-merge.test.mjs` — filename unchanged by the 2026-07-31 rename, confirmed
real at `lib/emsenn/services/561-group/services/red-cup-engineering/services/software-services-section/services/semiotic-software-services-section/services/organizing/test/rwil-merge.test.mjs` —
3/3 green, cited in the same note).
CSD's contribution is applying it to verification evidence specifically, not
discovering it.

**Falsifiable prediction.** Teams whose tooling silently resolves a
test-vs-proof (or test-vs-test) disagreement by discarding the dissenting
result, rather than recording ⊤ and blocking on it, will show a higher rate of
the discarded disagreement resurfacing as a later defect than teams that
surface and investigate ⊤ before it ships. This is an empirical claim about
teams, not a theorem; it is stated so it can be checked against real defect
data, not asserted as settled.

### 2.4 Rule 3 — the parallel-merge safety proviso

**Claim.** Independent agents may verify disjoint or overlapping claims in
parallel and merge results by charge-join; the merged, re-closed valuation is
identical to what serial gathering-then-closing would have produced —
*provided every contribution is a monotone charge deposit, never a silent
overwrite*:

```
cl(joinK(cl X) Y) = cl(joinK X Y)          (closure_merge, Closure/Operator.lean:180)
```

This is proven, at the `Charge` level and lifted pointwise to `Valuation`
(`Charge_closure_merge`, `:161`; `closure_merge`, `:180`). It is the exact
justification for this session's own `Workflow` fan-out pattern (parallel
verification agents, findings unioned): the union is safe *because* the merge
is a monotone charge-join over one shared valuation, not safe merely because
nothing crashed.

**Falsifiable prediction, stated as a concrete test.** Run a verification suite
serially, order A-then-B; run it again with agents A and B in parallel merged
by charge-join; the two final valuations must be identical. If they differ, an
implementation has violated the proviso — almost certainly by letting one
agent's report *overwrite* another's instead of joining ("last write wins"
instead of `joinK`) — and this is the diagnostic for finding that bug, not a
failure of the theorem. A workflow whose fan-out agents report booleans instead
of charges cannot satisfy this proviso even in principle: a boolean has no
representable "both," so a genuine disagreement is silently resolved by
argument order rather than held. **This is the concrete reason FOUR-valued,
not boolean, verification output is a hard requirement for CSD, not a style
preference inherited from the rest of the corpus.**

### 2.5 Rule 4 — the re-verification budget, scoped honestly

**Claim.** For the specific four-element `Charge` lattice, a claim's fiber
reaches its fixed point within three applications of the closure:
`iter c.op 3 = iter c.op 4` (`lfp_reached_by_three`,
`Closure/Operator.lean:222-225`). Past three rounds of the *same* closure with
no new evidence kind, further iteration is provably redundant.

**Scope, stated against my own claim, not glossed over.** The bound `3` is not
a universal constant about verification in general — it is `(height of the
Charge lattice) - 1` for a chain that can strictly ascend at most three times
(`⊥ₖ → {t or f} → ⊤ₖ` is the longest strict chain in a four-element bilattice
with two incomparable middle elements). **If a team's evidence model uses a
richer lattice than Belnap's FOUR** — graded confidence levels, probabilistic
scores, a taller chain — the correct bound is that lattice's height minus one,
not literally 3. Stating "3" as a universal budget for arbitrary verification
processes would be exactly the overclaim this corpus's own house style forbids
(`infomaterial/CLAUDE.md`: "a statement claims exactly what the Lean proves — no
more"). The falsifiable, portable claim is: *the re-verification budget is
bounded by the evidence lattice's height, and is computable in advance from
that lattice, not discovered empirically per project.*

### 2.6 Rule 5 — no canonical minimum evidence set

**Claim.** For a settled claim `w`, the set of prior partial-evidence states
that would have settled to it, `T⁻¹(w)`, is a finite join-subsemilattice with
`w` as its top — but is proven to have **no unique minimum in general**
(`cosettling_join_subsemilattice`,
`Closure/SettlingMonotonicityQuiescence.lean:216-238`, explicitly noting the
corpus's own "no minimum in general" and "not closed under meet" facts as
regime-dependent, not provable from the closure laws alone). Two contributors
can independently gather different, smaller, mutually incomparable sufficient
evidence sets for the same claim; their union is still sufficient (closed
under join), but neither was uniquely minimal.

**Practical consequence, stated as a policy this licenses rather than a
theorem.** A review gate that requires "the" canonical minimal test suite for a
claim is asking for an object this structure says need not exist. The
falsifiable, checkable substitute: require *a* sufficient set (closes to the
required charge) and treat a merge of two different contributors' sufficient
sets as still sufficient — never require reduction to a single canonical
witness set as a precondition for shipping.

## 3. What CSD is not, said plainly

CSD is not test-driven, proof-driven, or documentation-driven development
under a new name — it does not tell you what to write first. It is the layer
underneath the stage vocabulary those paradigms (and
`question-driven-development`) already supply: what storage shape verification
evidence must have, when a claim is actually finished, what to do with
disagreement, when parallel work can be merged without redoing it, and how many
re-checks are provably enough. A team could run TDD, PDD, or QDD's eight stages
exactly as documented and layer CSD's five rules underneath any of them without
contradiction — CSD is a protocol constraint on the evidence substrate, not a
competing stage order.

## 4. Limitations — adversarial pass

**4.1 The closure assumption can fail, and CSD says exactly how it fails.** Every
guarantee above assumes the verification method is a real closure: inflationary
(evidence is never silently retracted), monotone (more input evidence gives at
least as much output charge), idempotent (repeating it changes nothing). A
flaky test violates idempotence directly — it can flip charge with no new
information — and CSD's stopping rule (§2.2), merge-safety proviso (§2.4), and
budget (§2.5) all fail for it *simultaneously*, because all three are proved
from the same three closure laws. This is not a minor caveat: it means CSD, as
stated, has nothing to say about flaky verification beyond diagnosing that it
is not a closure. A genuine extension would need a *fifth* charge value for
"unreliable witness," distinct from `absurd` (genuine held conflict) — that
value and its lattice position are not derived here and are named as an open
gap, not quietly patched over.

**4.2 The `Claim` type is doing unexamined work.** Everything above holds "for
each claim," but nothing here derives what counts as one claim versus two, or
how a large claim decomposes into the sub-claims a test actually exercises.
`Positing/Valuation.lean` takes `Claim` (via `PredicationCell`) as already
given from `Predicating`; CSD inherits that assumption unexamined. In practice,
this is the sharpest edge: badly-drawn claim boundaries (a test that silently
covers three unrelated behavioral claims at once) break the "claim" abstraction
before any of the five rules are even reachable, and nothing in this note
supplies a procedure for drawing claim boundaries correctly.

**4.3 The empirical predictions (§2.2, §2.3) are not validated here.** The
"discarded-conflict resurfaces as a defect more often" and "flaky rerun rate is
zero under quiescence" claims are stated as checkable against real telemetry;
none has been checked against real telemetry in this note. They are proposed
as falsifiable, not reported as confirmed.

**4.4 Rule 4's bound is easy to misquote, and the misquote is the likely
failure mode.** The single most likely way this note gets used wrong is by
someone citing "3 re-verification rounds is enough" as a general software
engineering rule, stripped of the four-element-lattice scoping in §2.5. That
misquote would be a direct instance of the overclaim this corpus's own style
guide names as the cardinal sin — flagged here explicitly so it is falsifiable
by inspection: if this note is later cited without the lattice-height
qualifier, that citation is wrong.

## 5. Relation to what already exists (identify before adding)

Nothing in this note is a new service, store, or registry. The stage vocabulary
is `question-driven-development`'s, already built and running in
`@561/development.active.swarm`. The conflict rule and the merge-safety CRDT
are already proven for witness-log federation
(`rwil-outbox-iso.test.mjs`, `rwil-merge.test.mjs`). The storage substrate is
`lib/persistence`, unmodified. What this note adds is the naming of the
operational layer connecting them, stated as five falsifiable rules with their
scope limits made explicit — a wiring diff across existing, proven mathematics,
not a new capability.

## Provenance

Read in full or in cited section this session (2026-07-05):
`Infomaterial/Articulation/Articulating/FourCorner.lean`;
`Infomaterial/Language/Settling.lean`;
`Infomaterial/Language/Positing/Valuation.lean`;
`Infomaterial/Closure/SettlingMonotonicityQuiescence.lean`;
`Infomaterial/Closure/Operator.lean`;
`Infomaterial/Closure/Modal.lean` (lines 290-325);
`lib/emsenn/src/apps/metroplat/lib/persistence/index.mts` and
`lib/emsenn/src/apps/metroplat/src/stores/path-term.mts` (2026-07-31: neither path could be
confirmed anywhere in the current tree — see the code-citation note in §2.1 for the witness
journal's real current home);
`.../apps/tools/swarm/README.md` (SWARM `question-driven-development`,
lines 298-311);
`.../terms/praxis-driven-development/index.html`;
`2026-06-25-research-on-witness-journal-the-relation-witness-information-log.md`.
The lean-lsp/`lean_run_code` census from earlier this session (6,314 theorems,
0 user axioms, 9 theorems transitively `sorryAx`-tainted, 7 depending on
`Classical.choice`) is not re-derived here; it grounds the claim that the
closure/Valuation math cited above is itself part of the corpus's
axiom-clean core, not part of the one open frontier gap.

No claim above rests on a source that was not itself opened and read this
session. §4 is written to be falsified, not defended.
