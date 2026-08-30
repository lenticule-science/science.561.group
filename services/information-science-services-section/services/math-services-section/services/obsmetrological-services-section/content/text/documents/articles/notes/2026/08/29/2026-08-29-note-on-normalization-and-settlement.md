---
title: "Normalization and Settlement: Stating the Open Conjecture"
description: >-
  An open question, stated but not answered. The glass-sponge note's §8.1 warns
  that term normalization (β and projection reduction on RMN/CHL terms, with
  Church–Rosser proved in Obsmetrologia and strong normalization not proved
  anywhere) and evidential settlement (a monotone closure to a Knaster–Tarski
  least fixed point on Charge) "must not be silently identified," and that no
  theorem shows they are the same relation or that they commute — while two other
  places in the corpus informally assert exactly that identification. This note
  states the conjecture at four strengths, argues that the strongest is false and
  says why, isolates the fragment where the question is live, and proposes the
  smallest worthwhile Lean statement: that Takahashi development is denotationally
  inert on evidence. The missing piece turns out to be an interpretation function
  that does not exist.
date-created: 2026-08-29
date: 2026-08-29
type: notes
name: 2026-08-29-note-on-normalization-and-settlement
authors:
  - claude-opus-5
keywords:
  - obsmetrologia
  - rmn
  - normalization
  - church-rosser
  - takahashi
  - settlement
  - knaster-tarski
  - closure-operator
  - curry-howard-lambek
  - open-question
tags:
  - draft
status: open-question
---

# Normalization and Settlement: Stating the Open Conjecture

**Abstract.** Two normalization relations are present in this corpus and the
relation between them is unproved. Term normalization reduces a typed RMN term
to computational normal form; evidential settlement iterates a monotone closure
to its least fixed point. The 2026-08-01 glass-sponge note filed the gap and
prescribed a safe order pending a proof; two other corpus locations informally
assert the identification the caveat forbids. This note states the conjecture at
four strengths (§4), argues the strongest is false with a specific disanalogy
(§5), isolates the fragment where the question is genuinely live (§6), and
proposes the smallest Lean statement worth attempting (§7) — which turns out to
require an interpretation function `Tm → Charge` that does not exist and whose
absence is the practical finding. Nothing here is a theorem, and the note claims
no new result of Obsmetrologia.

**Grading**, following this section's convention: **[theorem]** — proved in a
cited formal source; **[established]** — published external result;
**[in-corpus]** — present in this repository, cited by path; **[conjecture]** —
proposed and unproved; **[rhyme]** — a structural resonance proposed here, not
present in the source.

**Status.** Open question. Nothing here has operational status; per
`lib/emsenn/services/561-group/services/561-group-services-section/README.md`,
"Do not infer operational status from a Markdown file's existence or from its
non-legacy location."

## 1. The caveat that files this, verbatim

From
`.../engineering-services-section/content/documents/articles/notes/2026/08/01/2026-08-01-note-on-the-content-addressed-glass-sponge-semantic-compute-complex.md`,
§8.1, "Computational normalization is not evidential settlement" **[in-corpus]**:

> Two normalization relations are currently present and must not be silently
> identified:
>
> 1. **Term normalization** reduces a typed RMN/CHL term to computational normal
>    form using beta, projection, and declared domain reductions.
> 2. **Grounding or evidential settlement** applies a monotone closure law until
>    a least fixed point is reached.
>
> Church-Rosser and strong normalization for an appropriate term fragment can
> give a unique term normal form. Closure monotonicity and idempotence can give a
> least settled valuation. No existing theorem in the recovered corpus proves
> that these are the same relation or that their arbitrary implementations
> commute.
>
> The content-addressing profile must therefore either prove a commuting square
> or fix an explicit order. A safe initial law is:
>
> ```text
> admit
>   -> type
>   -> normalize the executable term under profile N
>   -> settle the resulting evidential object under closure profile C
>   -> construct a typed address envelope naming N and C
>   -> canonical encode
>   -> digest
> ```
>
> Hashing does not create the least fixed point. Settlement earns the object;
> canonicalization exposes unique bytes; hashing crystallizes those bytes.

That is the whole of the estate's position, and it is a *deferral with a
prescribed order*, not a result.

## 2. Term-land: what is actually proved

**The rewriting system.** RMN — Relation Model Notation — is "a small total typed
Lisp," per glass-sponge §8. Its evaluator
(`.../relation-model-notation-services-section/services/relation-model-notation-eval-service/src/index.mjs`)
exposes three maps over terms, described in its own header **[in-corpus]**:

> `step : Tm -> readonly Tm[]` … "is the ENTIRE one-step reduction relation made
> total and enumerable, every currently-present redex reduced individually, none
> reduced together." `dev : Tm -> Tm` is the Takahashi triangle map … "reduces
> every currently-present redex ONCE, simultaneously, in a single call — it does
> not chase redexes `dev` itself just created." `normalize : Tm -> Tm` … "recurses
> to full normal form … so it is the only one of the three whose codomain is
> guaranteed irreducible when it returns."

**The Lean side.**
`.../obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Language/Predicating/CurryHowardLambek.lean`
realizes a simply-typed λ-calculus with products and unit, de Bruijn variables,
an intrinsic typing relation `HasTy`, a reduction `step` with β and projection
rules, and its reflexive-transitive closure `Red`. Confluence is proved by the
Tait–Martin-Löf/Takahashi method **[theorem]**:

```lean
theorem par_diamond {t u v : Tm} (h1 : Par t u) (h2 : Par t v) :
    ∃ w, Par u w ∧ Par v w :=
  ⟨dev t, par_triangle h1, par_triangle h2⟩

theorem church_rosser {t u v : Tm} (h1 : Red t u) (h2 : Red t v) :
    ∃ w, Red u w ∧ Red v w
```

bundled with the cartesian-closed structure into `curry_howard_lambek`.

**And now the fact that governs everything below.** There is **no strong
normalization theorem anywhere in Obsmetrologia**. `rg 'normaliz'` over the whole
Lean library returns doc-comment prose, an `iring` tactic mention, and this
module. Confluence says *if* you reach a normal form it is unique; it does not
say you reach one. Glass-sponge §8 says the same thing about the running code:

> "The present TypeScript evaluator uses a fuel guard and the current extended
> grammar does not yet carry a single whole-language formal strong-normalization
> proof. The specification must state the exact total fragment rather than
> inheriting the old note's broadest claims."

A fuel guard is what one writes when one does not have SN. **[in-corpus]**

## 3. Evidence-land: what is actually proved

`.../lib/obsmetrologia/Obsmetrologia/Language/Settling.lean` derives the order
theory and then the closure **[theorem]**:

```lean
structure Closure where
  op : Charge → Charge
  infl : ∀ a, KLE a (op a)
  mono : ∀ a b, KLE a b → KLE (op a) (op b)
  idem : ∀ a, op (op a) = op a

theorem op_fixed (c : Closure) (a : Charge) : c.op (c.op a) = c.op a := c.idem a

theorem op_least (c : Closure) (a x : Charge)
    (hax : KLE a x) (hfx : c.op x = x) : KLE (c.op a) x

def settle (c : Closure) (seed : Charge) : Charge := c.op seed
```

with `settle_fixed` and `settle_least` following. Its docstring states the
termination argument: "Termination is **Knaster–Tarski**: each step is monotone
in the bounded knowledge lattice, so the orbit stabilizes."

`Closure/Operator.lean` lifts this fiberwise, proving `closure_merge`
(`cl (joinK (cl X) Y) = cl (joinK X Y)` — "the identity that lets the settling
step re-saturate without redoing earlier merges"), `no_periodic_orbits`, and
`lfp_is_settled`, with a `ClosureOrdinal` bound making the least fixed point
reachable by finite iteration.

So evidence-land has what term-land lacks: a **termination result**. And
term-land has what evidence-land does not need: **confluence under
non-determinism**.

## 4. The conjecture, at four strengths

Write `N` for term normalization and `S` for evidential settlement.

**(C0) Typing preservation.** `N` preserves `HasTy`. Subject reduction. Almost
certainly already available or trivial in the existing development; listed for
completeness. **[conjecture, weak]**

**(C1) Commutation.** On closed, well-typed terms carrying evidence,
`S ∘ N = N ∘ S`. This is the "commuting square" §8.1 asks for, and it is the
statement that would let the content-addressing profile stop prescribing an
order. **[conjecture]** — this is the note's central object.

**(C2) Identity of relations.** `Red` and the closure orbit are the same
relation, so that "β-reduction *is* a closure-rule application" in the strict
sense. **[conjecture, and §5 argues it is false]**

**(C3) Unique settled normal form.** Given Church–Rosser for `Red` and
idempotence for `cl`, the composite `S ∘ N` has a unique fixed point on each
input. This is weaker than C1 and is the thing content addressing actually needs
— a canonical object to digest. It follows from C1 but might also hold without
it. **[conjecture]**, and probably the one to want.

## 5. Why C2 is false, and why that matters

The corpus contains the identification C2 asserts, in two places, informally.

`.../semiotic-computer-system-services-section/content/text/glossary/concepts/settling-as-computation.md`
carries a direct table: β-reduction ↔ "a closure-rule application that fires when
a redex predication is matched"; normal form ↔ settling quiescence; strong
normalization ↔ "settlement reaches quiescence in finite layers"; confluence ↔
"the closure operator is well-defined." And
`.../561-group-services-section/content/text/documents/articles/notes/2026/04/06/2026-04-06-note-on-finite-relational-math-catalog.md`
entry 39 states: "R1-R23 IS CHL normalization; strong normalization =
termination." **[in-corpus]**

Both are flatly contradicted by §8.1. That contradiction is live in the corpus
today and this note is partly written to surface it.

**The disanalogy, stated.** Two reasons C2 should be disbelieved.

**(i) Reduction discards; closure does not.** The closure is *inflationary*:
`infl : ∀ a, KLE a (op a)` — it only ever climbs the knowledge order. β-reduction
does not have this property under any obvious knowledge order on terms. The
reduction `(λx. y) t ↦ y` throws `t` away. Whatever was in `t` is gone, and if
`t` carried evidence, the evidence is gone with it. There is no order on terms in
which that step is inflationary, and the metrologic bilattice's own commentary
about `joinKnowledge` — "every op ACCUMULATES witnesses, never discards" — is
precisely the property β-reduction lacks. **[rhyme, inverted: the sources agree
on the property and disagree on who has it]**

**(ii) Different types, and the corpus's own standard for rejecting a mapping.**
`step`/`Red` act on `Tm` — syntax, terms naming morphisms. `cl` acts on `Charge`
— a value on the bilattice. The 2026-08-26 note on the four phases of the
experiential turn rejects a Belnap mapping on exactly this ground: "A category
error, cleanly: the Belnap values are *states of cells*; the phases are
*operations of a turn*. No mapping; the resemblance is arity only." The same test
applied here says: a reduction relation on syntax and a closure operator on
values are not the same relation, and the resemblance is that both have fixed
points. **[in-corpus, applied]**

**Why C2's falsity is the useful part.** If C2 were true, C1 would be trivial and
uninteresting. C2 being false is what makes C1 a real question: the two
operations act on genuinely different things, so whether they commute depends on
*how the term-level and value-level connect* — which is §6.

## 6. Where the question is actually live

If `N` acted only on pure STLC syntax and `S` only on charges, they would
commute trivially, because they would act on disjoint parts of the state. The
conjecture would be a footnote.

They do not, and glass-sponge §8 says why:

> "The desired core includes base, unit, arrow, product, and bounded list types;
> de Bruijn variables and lambda/application; pairing and projections; unit;
> marks admitted at boundaries; structural coincidence and conditional
> operations; bounded fold; and **carefully typed domain extensions for FOUR and
> settlement**."

RMN has term constructors *for the four values and for settlement*. So there
exist RMN terms whose reduction touches evidence. Those terms — the
FOUR/settlement extension fragment — are the entire content of the conjecture.
Everything else commutes for uninteresting reasons.

> **The live question, restated.** For a term `t` in the FOUR/settlement
> extension fragment, does reducing `t` change what `t` denotes as evidence? If
> not, C1 holds by disjointness. If so, the counterexample is the object worth
> studying, and it will show exactly which extension constructor breaks the
> square.

The Lean side has a further complication worth recording: the corresponding
`HasTy` does not yet have an atom rule, and the conformance work notes
"TS-ahead-of-Lean: RelMath.CHL.HasTy has no atom rule yet — golden-vector this
against the Lean side before treating base-typed judgments as proven." So the
Lean STLC and the shipped RMN grammar are not the same language, and the
extension fragment — the fragment the conjecture is about — is precisely the part
present in TypeScript and absent from Lean. **[in-corpus]**

## 7. The smallest worthwhile Lean statement

Not the commuting square. The square needs `S`, `N`, and a translation between
their domains, and the translation is the piece that does not exist.

> **Proposal.** Introduce an interpretation `⟦·⟧ : Tm → Charge` sending a term to
> the evidence it denotes, and prove that **one Takahashi development step is
> denotationally inert**:
>
> ```lean
> theorem dev_preserves_denotation (Γ : List Ty) (A : Ty) (t : Tm)
>     (h : HasTy Γ t A) : ⟦dev t⟧ = ⟦t⟧
> ```
>
> From which `red_preserves_denotation` follows by induction over `ParStar`
> using the existing `par_triangle`, and C1 follows for the safe order
> immediately: if normalization does not move the denotation, then settling
> before or after normalizing gives the same charge.

Three reasons this is the right target.

1. **It is small.** `dev`, `Par`, `par_triangle`, `HasTy`, and `Charge` all
   exist. The single-step form avoids induction over `Red` entirely, and the
   existing triangle lemma is exactly the tool for lifting it.
2. **Its failure is informative.** If `dev_preserves_denotation` is false, the
   proof will fail at a specific constructor, and that constructor is the answer
   to §6's question. A failed proof here is a result.
3. **It names the actual missing piece.** `⟦·⟧` does not exist in the Lean
   development. That is the practical finding of this note: the corpus cannot
   even *state* the commuting square, because it has no map between term-land
   and evidence-land. Everything else is downstream of writing that map, and
   writing it will force decisions — chiefly, what a λ-abstraction denotes as
   evidence — that nobody has had to make.

**A caveat on the theorem's scope.** Even with `dev_preserves_denotation`, C1
holds only where `normalize` terminates. Without strong normalization it is a
partial function, and a commuting square with a partial function on one side is
a weaker statement than it looks: it says the square commutes *where both paths
are defined*. Until SN exists for a stated fragment, §1's prescribed order —
normalize, then settle — stands, and should stand.

## 8. What this note does not claim

- It claims no theorem, and nothing here is a result of Obsmetrologia.
- It does not assert C1 or C3. It states them so they can be attacked.
- Its argument that C2 is false (§5) is an argument, not a proof. A sufficiently
  clever knowledge order on terms could in principle make β inflationary; I do
  not believe one exists, and I have not shown that none does.
- It does not adjudicate the corpus's internal contradiction. §5 records that
  `settling-as-computation.md` and the finite-relational-math catalog assert what
  glass-sponge §8.1 forbids; which of them should change is an ownership
  decision, not a research finding. Both are `[in-corpus]` and both are cited.
- It has not run a Lean toolchain, and every Lean quotation above is read from
  source, not verified by checking. Per glass-sponge §1: "Presence of a file is
  not by itself a successful proof check."

## 9. Directions

1. **Write `⟦·⟧ : Tm → Charge`.** Nothing else on this list is possible first,
   and writing it forces the design question the corpus has been able to avoid.
2. **Attempt `dev_preserves_denotation`.** Success gives C1 for the safe order;
   failure names the breaking constructor.
3. **State the total fragment.** Glass-sponge §8 asks for exactly this — "state
   the exact total fragment rather than inheriting the old note's broadest
   claims" — and it has not been done. SN for a named fragment is worth more than
   SN for the whole grammar and is far more likely to be provable.
4. **Bring the Lean `HasTy` up to the shipped grammar**, or state precisely how
   far behind it is. The conformance test file already knows.
5. **Resolve or annotate the contradiction** between `settling-as-computation.md`
   and glass-sponge §8.1.

## 10. Bibliography

External references are working references from assistant knowledge; verify
before public use.

Church, Alonzo, and J. Barkley Rosser. "Some Properties of Conversion,"
*Transactions of the AMS* 39 (1936) — the confluence result.
Takahashi, Masako. "Parallel Reductions in λ-Calculus," *Information and
Computation* 118 (1995) — the complete-development method the Lean module uses.
Tait, W. W., and Per Martin-Löf — the parallel-reduction technique.
Barendregt, Henk. *The Lambda Calculus: Its Syntax and Semantics*, rev. ed.
(1984) — for confluence, normalization, and the standard counterexamples.
Tarski, Alfred. "A Lattice-Theoretical Fixpoint Theorem and Its Applications,"
*Pacific Journal of Mathematics* 5 (1955); Knaster (1928).
Lambek, Joachim, and Philip J. Scott. *Introduction to Higher Order Categorical
Logic* (1986) — for the Curry–Howard–Lambek correspondence.
Belnap, Nuel D. "A Useful Four-Valued Logic" (1977).

In-corpus:

- `lib/emsenn/.../engineering-services-section/content/documents/articles/notes/2026/08/01/2026-08-01-note-on-the-content-addressed-glass-sponge-semantic-compute-complex.md` (§8, §8.1 — the caveat this note answers)
- `lib/emsenn/.../obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Language/Predicating/CurryHowardLambek.lean`
- `lib/emsenn/.../obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Language/Settling.lean`
- `lib/emsenn/.../obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Closure/Operator.lean`
- `lib/emsenn/.../relation-model-notation-services-section/services/relation-model-notation-eval-service/src/index.mjs`
- `lib/emsenn/.../relation-model-notation-services-section/services/relation-model-notation-typing-service/src/index.mjs` (the TS-ahead-of-Lean note)
- `lib/emsenn/.../semiotic-computer-system-services-section/content/text/glossary/concepts/settling-as-computation.md` (the informal identification §8.1 forbids)
- `lib/emsenn/.../561-group-services-section/content/text/documents/articles/notes/2026/04/06/2026-04-06-note-on-finite-relational-math-catalog.md` (entry 39, the second such assertion)
- `lib/emsenn/.../critical-theory-services-section/content/documents/articles/notes/2026/08/26/2026-08-26-note-on-the-four-phases-of-the-experiential-turn.md` (the rejection standard applied in §5)
- `lib/emsenn/services/561-group/services/561-group-services-section/README.md`
