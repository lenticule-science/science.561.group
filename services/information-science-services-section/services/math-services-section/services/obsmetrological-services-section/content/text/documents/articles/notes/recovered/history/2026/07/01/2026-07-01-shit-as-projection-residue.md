---
title: "\"shit\" as projection residue, not graded gap"
subtitle: "What a partial byte-read loses at a trace step"
date: "2026-07-01"
status: "frontier note with checked Lean examples"
claim: "\"shit\" is not currently the graded gap or closure invariant; the checked Collatz trace case points to projection residue: what a partial read of a byte-like carrier fails to preserve"
local-anchors:
  - "Infomaterial/Closure/Collatz/AffineTrace.lean"
  - "Infomaterial/Articulation/Articulating/Trace.lean"
  - "Infomaterial/Cohomology/BigradedSettlingCohomology.lean"
  - "Infomaterial/Cohomology/AntiLandauerEntropy.lean"
  - "../infography.emsenn.net/lib/closure/gap.mts"
  - "../infography.emsenn.net/lib/closure/invariant.mts"
  - "../infography.emsenn.net/lib/closure/object.mts"
---

## Prompt actually checked

The source prompt is the operator's proposal in
`~/.claude/projects/-home-emsenn-info/0f4df4e4-6ddd-4ca8-b8f7-e7d56d1d6968.jsonl`:

```text
all our stuff has residue

I wanna conjecture shit, literally, "shit" as what bits don't go into bytes,
at a given step into a trace
```

The same transcript immediately corrected the first guess after calculating the
Collatz affine trace table: the residue was not in the full trace triple, but in
the partial `(A,B)` read of that triple.

## Independently verified

The local `it -> bit -> byte` note says not to add a new vocabulary layer. It
names byte-like carriers only when the carrier preserves the record: `Trace`,
`Format.bytes`, format coverage, and the anti-Landauer index ledger are listed
as existing byte-like roles, and the stated discipline is "Call something
byte-like only when the carrier preserves the record."

The trace-name note reserves bare `Trace` for a finite fold carrier: an initial
carrier, finite step word, and one-step advance. It explicitly calls the
Articulating instance the byte-like carrier answer for a sequence of moves, and
it marks the stronger claim that every runtime byte row realizes this carrier as
open.

In Lean, `Infomaterial.Closure.Collatz.AffineTrace` defines:

- `Branch`, the two-letter parity alphabet.
- `AffineTrace`, the triple `A B C`.
- `traceStep`, with `E` sending `(A,B,C)` to `(A,2B,C)` and `O` sending it to
  `(3A,2B,3C+B)`.
- `traceOfWord`, the left fold from `(1,1,0)`.
- `trace_A_eq_three_pow_oddCount` and `trace_B_eq_two_pow_length`.
- `traceOfWord_eq_trace_carrier`, identifying this fold as a specialization of
  the general `Trace` carrier.

Lean scratch verification, run through the Infomaterial LSP, checked the six
length-4 words with two odd letters:

```text
EEOO -> { A := 9, B := 16, C := 20 }
EOEO -> { A := 9, B := 16, C := 14 }
EOOE -> { A := 9, B := 16, C := 10 }
OEEO -> { A := 9, B := 16, C := 11 }
OEOE -> { A := 9, B := 16, C := 7 }
OOEE -> { A := 9, B := 16, C := 5 }
```

The same LSP run checked concrete examples proving that `EEOO` and `OOEE` have
equal `A`, equal `B`, unequal `C`, and unequal full `AffineTrace` values.
`#print axioms` reported:

- `trace_A_eq_three_pow_oddCount`: `[propext]`
- `trace_B_eq_two_pow_length`: `[propext]`
- `traceOfWord_eq_trace_carrier`: no axioms
- `affine_trace_parityWord`: `[propext, Quot.sound]`

For the candidate "same as graded gap" comparison, the current Infography
runtime definitions say:

- graded gap is "the cells lost at non-Scott firings"; implementation reads
  `readNonScottFiringsOfSettlementFiltration`, flattens added cells, and returns
  `predication.settling.gradedGap`.
- closure invariant is "one step per non-Scott firing with its deduped
  additions"; implementation returns `predication.settling.closureInvariant`.
- non-Scott firings are cell-adding firings whose source stage is a limit stage.
- the settlement carrier is an ordinal-indexed filtration of designated cells,
  not a trace word or affine-trace fold.

For the cohomology comparison, active Lean says:

- `BigradedSettlingCohomology` has exactly two designation rows,
  `truth` and `inconsistency`.
- its vertical differential `dv = pi . iota` is zero because the truth and
  inconsistency masks are disjoint.
- the proved theorem is cochain-level mapping-cone input; the cohomology-level
  truth-knowledge LES remains a frontier node.
- `AntiLandauer.ClosureIndexStep` is a before/after cover-nerve step carrying a
  proof that Euler index is preserved, with theorems preserving net charge and
  balancing the `H0`/`H1` delta.

The checked axiom reports for these cited Lean declarations were clean in the
house sense: either no axioms or only `[propext, Quot.sound]`.

## Derivation

Let a byte-like carrier mean a faithful trace carrier, not an octet. In the
Collatz specialization, the byte-like carrier for a branch word is the full
`AffineTrace` triple produced by `traceOfWord`.

The existing theorems force a lossy partial read:

```text
read_AB(w) := ((traceOfWord w).A, (traceOfWord w).B)
```

Because `A = 3^(oddCount w)` and `B = 2^(w.length)`, `read_AB` cannot see the
positions of the odd letters. It sees only word length and odd count. Therefore
all words of the same length and odd count collide under this read. The
length-4/two-odd table above is the checked witness family from the source
thread: six distinct words, one `(A,B)` value, six distinct `C` values.

So the corrected object is:

```text
shit_read(t) = the residue of t under a chosen read
             = the other trace-step carriers indistinguishable from t by read
```

More formally, for a trace carrier type `B`, a read `rho : B -> R`, and a step
carrier `b : B`, the nontrivial residue is the kernel-pair fiber:

```text
Shit(rho,b) := { b' : B | rho b' = rho b }
```

with the base point removed or quotiented away when one wants "what was lost"
rather than the whole indistinguishability class. At a trace step, apply this to
the prefix carrier at that step.

This is why the original wording "what bits don't go into bytes" needs a
correction. If "byte" means the faithful carrier, then the bit does go into the
byte by definition. The residue appears when the byte is read through a smaller
projection. In this example, `(A,B)` is a partial read of the byte; `C` is the
part of the byte that still distinguishes the collided words.

## Relation to graded gap and closure invariant

This is not the same object as the current graded gap.

The graded gap is a settlement-filtration read: it is indexed by non-Scott
limit-stage firings and returns cells added at those firings, with rank equal to
the first-cohomology rank in the runtime carrier. Its domain is a
`SettlementFiltration`; its elements are `Cell`s and stages; its regime content
is non-Scott limit behavior.

The trace projection residue above has none of that structure. Its checked
domain is a finite branch-word trace. Its residue is an indistinguishability
fiber of a chosen read, and the exhibited loss is positional order under the
`(A,B)` projection. No non-Scott limit stage, `Cell`, or `H1` generator is
involved in the checked example.

This is also not the same object as the closure invariant. The closure invariant
records non-Scott additions stage by stage, deduped up to cell representatives.
It is a retained invariant, not the fiber of a projection. A separate projection
could forget data down to the closure invariant, and that projection would have
its own `shit`; but the invariant itself is not that residue.

The relation is therefore genus/species only at a higher level: all three are
about what a read preserves or fails to preserve. Current graded gap and closure
invariant are settlement/cohomology reads over non-Scott firings. The proposed
`shit` operator is the general projection-residue of a read, and the Collatz
case is a strict-finite trace-read example.

## Precise conjectures

### Conjecture 1: projection residue

For any byte-like trace carrier `B` and read `rho : B -> R`, `Shit(rho,b)` is
the kernel-pair fiber of `rho` at `b`. It is nontrivial exactly when `rho` is not
injective on the reachable trace carriers at that step.

This is not yet a Lean definition. It should not be added as a primitive; it
should be derived once the local carrier/read vocabulary is chosen.

### Conjecture 2: Collatz `(A,B)` residue

For Collatz branch words, the `(A,B)` read has exactly the residue predicted by
length and odd-count collision:

```text
read_AB(w) = read_AB(w')
  iff w.length = w'.length and oddCount w = oddCount w'
```

The forward direction from equal length and equal odd count to equal `(A,B)` is
already supported by the proved closed forms for `A` and `B`. The converse needs
the relevant power-injectivity facts for `2^n` and `3^n` in this dependency-free
setting; I did not prove it in this pass.

### Conjecture 3: full affine trace may be faithful

The checked six-word table supports the stronger conjecture:

```lean
traceOfWord w = traceOfWord w' -> w = w'
```

for all finite Collatz branch words `w` and `w'`.

This is not proved. The candidate route is to find a recursive decoder for the
last or first branch from `(A,B,C)`, using the recurrence for `traceStep`. I did
not verify that the decoder exists in all cases, so the honest alternative
remains a counterexample.

## Genuinely open

I do not yet know whether `shit` should be formalized as:

- a pointed fiber of a read;
- a kernel-pair relation;
- a quotient obstruction;
- a ranked finite loss carrier;
- or a cohomology class when the read is specifically a settlement/cohomology
  projection.

I also do not know whether the word should become an exported formal name. The
current result only earns the mathematical role: projection residue at a trace
step. Naming it in Lean should wait until the carrier/read abstraction is strong
enough that the word names a theorem-bearing object rather than a slogan.
