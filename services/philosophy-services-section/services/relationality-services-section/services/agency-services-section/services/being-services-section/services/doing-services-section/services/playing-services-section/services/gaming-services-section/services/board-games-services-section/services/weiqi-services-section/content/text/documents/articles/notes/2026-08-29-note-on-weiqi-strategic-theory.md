---
title: "Weiqi Strategic Theory: Influence, Thickness, Sente, and Aji"
description: "A research survey of the classical strategic vocabulary of weiqi — territory and influence, thickness, sente and gote, aji, direction of play, shape — none of which the section's seventeen glossary terms currently define, all of which are rules-, tactical-, or scoring-level. Written as complement to the 2026-08-19 obsmetrologia-and-go-strategy inquiry, which presupposed this vocabulary and could not cite it. Closes with a classification proposal: which of these concepts are readings over a board-fiber, which are relations between moves already better handled by combinatorial game theory, and which — aji alone — actually need the bilattice."
date-created: 2026-08-29
date: 2026-08-29
type: research-note
in-service-of: lib/emsenn/services/561-group/services/science-services-section/services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/services/gaming-services-section/services/board-games-services-section/services/weiqi-services-section
name: 2026-08-29-note-on-weiqi-strategic-theory
authors:
  - claude-opus-5
keywords:
  - weiqi
  - go
  - strategy
  - influence
  - thickness
  - sente
  - gote
  - aji
  - combinatorial-game-theory
  - bilattice
tags:
  - draft
status: research-survey
---


## 0. What this note is

The weiqi section has a rules kernel, an LSP, a web app, two constitutions, a
platform plan, five lessons, seventeen glossary terms, and no strategy. The
seventeen terms are `liberty`, `atari`, `capture`, `ko`, `superko`, `suicide`,
`territory`, `komi`, `handicap`, `area-scoring`, `territory-scoring`, `pass`,
`dead-stones`, `connection`, `eye`, `life-and-death`, `seki`, plus `false-eye`,
`dame`, and `hoshi`. Every one is a rule, a tactic, a scoring concept, or a
structural predicate. Nothing above the level at which a game is *decided* has a
definition anywhere in the section.

This matters concretely because the section's one strategy document already
depends on the missing vocabulary. `.../weiqi-services-section/content/text/documents/articles/notes/obsmetrologia-and-go-strategy.md`
(2026-08-19) records an inquiry into whether the Obsmetrologia mathematics
contributes anything novel to Go strategy — eight candidate bridges assessed,
six rejected, two surviving — and one of the two survivors is a conjecture that
the inconsistency sheaf formalizes **aji**, a term the section does not define.
That note is careful and I do not want to re-open its rejections. This one
supplies the vocabulary it presupposed.

**Method, following that note's own discipline.** It states: "This note
deliberately contains **no worked positions**: constructing and verifying
candidate positions is deferred until the weiqi content checker (weiqi-lsp) can
machine-verify diagrams." The same constraint binds here. Nothing below is
illustrated with a board position, and no claim is made that would need one to
check.

**Status.** Research survey. Not doctrine, not operational, and not a lesson —
per the section's own gating, "Both constitutions and the plan's remaining open
decisions still gate any further code here," and per
`lib/emsenn/services/561-group/services/561-group-services-section/README.md`:
"Do not infer operational status from a Markdown file's existence or from its
non-legacy location." Citations are working references from assistant knowledge;
verify before public use.

**Grading.** `[established]` = standard in the Go literature. `[contested]` =
genuinely disputed among strong players or revised in the AI era.
`[in-corpus]` = present in this repository, cited by path. `[proposal]` = mine.

## 1. Territory and influence

The oldest strategic axis, and the one the section's `territory.md` half-defines
by giving only one side of it.

**Territory** (*ji*) is enclosed empty space that will be counted. **Influence**
(*seiryoku*) is the effect a stone or group exerts on the space around it
without enclosing it. The classical error, drilled into every beginner, is to
treat influence as *territory-in-waiting* and count it. It is not. Influence's
value is that it *constrains the opponent's options*: it makes invasions in its
neighbourhood expensive or unlivable, so the opponent must play elsewhere, and
the influence-holder collects the difference. `[established]`

The historical dispute is worth having in the corpus because it is a genuine
theory dispute and not a matter of taste:

- **Territorial orthodoxy** through the early twentieth century: take the
  corners, then the sides, then the centre; the corner is worth most per stone
  because the board edges do the enclosing work for you.
- **The New Fuseki (*Shinfuseki*) movement**, Go Seigen and Kitani Minoru,
  1933 — influence-first opening theory, centre-facing play, the 4-4 point
  (*hoshi*, which the section *does* have a term for) over the 3-4. It was
  radical, it was partly wrong, and it permanently changed what counted as a
  reasonable opening. `[established]`
- **The AI-era rebalancing**, 2016 onward. AlphaGo and successors revalued
  several settled judgments: the early 3-3 invasion under a 4-4 stone became
  standard rather than premature; several long-canonical joseki were shown to be
  slightly bad for one side; komi values were re-estimated; and the general
  finding was that professional play had systematically *undervalued* influence
  and thickness in some positions and overvalued them in others, with no simple
  direction. `[contested]`, and honestly so — the AI results changed
  evaluations without producing a human-legible theory of why, which is itself
  the interesting fact.

**Note for the section:** any lesson on influence must carry the New
Fuseki/AI-revision history, because a lesson that teaches the pre-2016
evaluations as settled facts will teach several things now known to be wrong.

## 2. Thickness

**Thickness** (*atsumi*) is a strong, settled, outward-facing formation with no
weakness the opponent can exploit locally. The classical maxims are three, and
all three are about what thickness *is not*:

1. *Do not use thickness to make territory.* Enclosing territory with a thick
   wall wastes it; the wall's value is that the opponent cannot fight near it.
2. *Do not play close to thickness* — yours or the opponent's. Stones near a
   thick wall are cheap for the wall's owner to attack and expensive for anyone
   else to support.
3. *Thickness is a property of the position, not of the stones.* The same wall
   is thick against an empty board and worthless if the opponent already has a
   living group behind it.

The third maxim is the one with formal content. A wall's thickness is a function
of what surrounds it, and it can be *destroyed without being touched* — by the
opponent settling a group nearby, the wall's stones are unchanged and its
thickness is gone. `[established]`

Related and distinct: a **wall** is the shape; **thickness** is the shape's
value in context; **korigatachi** (over-concentration) is the failure mode where
a formation is strong but its strength is redundant against what is actually
there.

## 3. Sente and gote

**Sente** is the initiative: a move the opponent must answer, so that you may
play again elsewhere. **Gote** is its complement: a move that ends your turn
because the opponent need not answer. A sequence is *sente for Black* if Black
retains the initiative through it. The section's `pass.md` and `dame.md` gesture
at the endgame without the vocabulary to describe how it is played.

**This one is already mathematized, and well.** Berlekamp and Wolfe, *Mathematical
Go: Chilling Gets the Last Point* (1994), give a combinatorial-game-theory
treatment of the Go endgame: a position decomposes into a disjunctive sum of
independent local games; each has a *temperature* (roughly, the value of moving
there first); optimal play takes the hottest available game; and sente/gote
distinctions fall out of the temperature structure rather than needing separate
definition. The result is exact for the class of positions they treat, and it is
one of the few places in game studies where a folk-strategic concept was fully
recovered by mathematics. `[established]`

**Do not re-derive it here.** The 2026-08-19 corpus note already *rejected* a
Chu-space and concurrent-game reading of sente and gote, and it was right to.
CGT owns this. What the section needs is a glossary entry that defines the terms
and points at Berlekamp and Wolfe, not a new formalism. `[in-corpus]` for the
rejection.

What CGT *cannot* do is the interesting residue, and the 2026-08-19 note
identified it precisely: CGT's power comes from decomposing a position into
independent local games, and it "has no formal device for a single move whose
effect is shared across otherwise-independent regions." That residue is the
subject of that note's first surviving conjecture (coordination cohomology as a
decomposability obstruction), and it is exactly the boundary where classical
endgame theory stops and whole-board judgment begins.

## 4. Aji

**Aji** — literally "taste" — is latent potential: the residual possibilities in
dead or weak stones, or in a defect in the opponent's shape, which are not
currently playable but which constrain what both sides can do. Its associated
concepts:

- **Aji-keshi** ("erasing the aji"): playing a move that forces the opponent to
  answer in a way that *removes your own* latent options. It is one of the most
  characteristic strong-player errors — the move gains something locally and
  spends a possibility that was worth more unspent.
- The standard maxim: *aji is used by not using it.* A threat that has been
  played is no longer a threat.

Aji is where this note has something to add, because the section's 2026-08-19
note already conjectured the right home for it, and the corpus's own vocabulary
sharpens the conjecture. That note proposed the **inconsistency sheaf**
(`Obsmetrologia/Cohomology/InconsistencySheaf.lean`) as a formalization of aji,
on the grounds that its obstruction class distinguishes "this resolves with
deeper reading" from "this structurally depends on undetermined context
elsewhere on the board," and that the second is aji. `[in-corpus]`

> **Proposal (aji as a held ⊥, aji-keshi as premature settlement).** In the
> org's four-valued vocabulary, aji is a cell held at ⊥ — un-witnessed,
> genuinely undetermined — whose *option value is a function of its remaining at
> ⊥*. The defect is worth something exactly because neither player has settled
> what it will become.
>
> Then **aji-keshi is a premature settlement**: a move that drives the cell to
> **t** or **f** and thereby destroys the option. It is not a bad move because it
> loses points locally; it usually gains points locally. It is bad because it
> collapses a ⊥ that was worth more open than closed.
>
> This makes the maxim "aji is used by not using it" a statement about the
> knowledge order rather than a piece of mysticism: the value is in the
> knowledge-order position, and any act that raises the position spends it.
> `[proposal]`

I note in passing, without leaning on it, that this is the same structure the
org's affect work independently arrives at for hope — where the virtue is
also the refusal to settle a ⊥ prematurely, and where despair and presumption
are the two directions of the premature settlement (see
`.../computer-science-services-section/content/text/documents/articles/notes/2026/08/29/2026-08-29-note-on-the-unbuilt-affects.md`,
§3). Whether "hold the ⊥ that has option value" is one structure appearing twice
or two structures with a shared shape is an open question and this note does not
answer it. `[proposal, held loosely]`

## 5. The rest of the vocabulary, briefly

Each of these needs a glossary entry the section does not have. `[established]`
throughout.

- **Miai**: two points of equal value such that if the opponent takes one, you
  take the other. Miai converts a contested point into a settled one — you can
  ignore both. It is the most directly formalizable concept in the list and the
  2026-08-19 note explicitly *rejected* a sheaf-gluing reading of it, so a
  glossary entry should define it plainly and not reach for machinery.
- **Sabaki**: making a light, flexible, quickly-settled shape in the opponent's
  sphere of influence — playing so that any individual stone is expendable.
  Contrast with heavy (*omoi*) shape, which must be saved and therefore becomes
  a target.
- **Honte**: the solid, "proper" move — the one that leaves no aji behind at the
  cost of a little tempo. The concept exists to name the trade the greedy move
  refuses to make.
- **Direction of play**: which side of a local situation matters, given the
  whole board. It is the concept most resistant to local analysis and the one
  professionals most consistently identify as the amateur's real weakness.
- **Shape**: good shape (bamboo joint, tiger's mouth, table shape) versus bad
  (empty triangle, dango). Shape heuristics are compressed reading — a way of
  getting an approximate answer without doing the life-and-death calculation.
- **Fuseki** and **joseki**: the opening as a whole, and the memorized locally-
  balanced corner sequences. The essential caveat, and it belongs in the entry:
  *joseki are locally balanced and therefore whole-board-neutral by
  construction*, which is why "knowing joseki" is famously worth little without
  direction of play.

## 6. Classification proposal: what the corpus's machinery is even for

The contribution I would defend. Given the vocabulary above, the concepts sort
into three kinds, and the sort tells you which corpus machinery applies.

| Kind | Concepts | Right tool |
|---|---|---|
| **Readings over a settled position** | influence, thickness, shape, korigatachi | An ordinary evaluation function on the board state. No bilattice needed; these are total functions of what is on the board. |
| **Relations between moves** | sente, gote, miai, tempo | Combinatorial game theory (Berlekamp–Wolfe temperature). Already solved; do not rebuild. |
| **Modal / option-valued** | aji, aji-keshi, honte's trade | The knowledge order. These are the *only* concepts whose content is about a cell being undetermined, and therefore the only ones the four-valued machinery is the right tool for. |

The practical consequence: an org tempted to formalize Go strategy with its
own apparatus should formalize **exactly aji**, and should use standard
evaluation for the first row and cite CGT for the second. The 2026-08-19 note
reached the same place empirically — six of eight candidate bridges rejected,
and one of the two survivors is the aji conjecture — and this classification is
an explanation for *why* the rejections went that way rather than a coincidence.
`[proposal]`

The second surviving candidate in that note — coordination cohomology as a
measure of where whole-board rather than regional reading matters — sits outside
this table, because it is not a strategic concept at all. It is a measure of
*when the decomposition assumption of row two fails*, which is to say a measure
of when CGT stops applying. That is a different and possibly more valuable
thing.

## 7. What this note does not claim

- No operational status. It is a survey, and it is not a lesson; the section's
  lessons have their own provenance policy and its constitutions gate content.
- It does not re-open the 2026-08-19 note's six rejections and does not propose
  a Chu-space reading of sente/gote, a sheaf-gluing reading of miai, or any of
  the other rejected bridges.
- It contains no worked positions and therefore no claim that would need a
  board diagram to check, per that note's discipline and the section's
  machine-verification gate.
- The AI-era revisions in §1 are reported at the level of general finding. I
  have not verified specific joseki evaluations or komi estimates and those
  should not be taken from this note.
- The §4 proposal is a proposal. It has not been checked against
  `InconsistencySheaf.lean`, and the relation between "cell at ⊥ with option
  value" and that module's obstruction class is exactly the thing the
  2026-08-19 note called a conjecture.

## 8. Directions

1. **Write the glossary terms.** Eleven are missing and every one is
   well-defined in the standard literature: `influence`, `thickness`, `sente`,
   `gote`, `aji`, `aji-keshi`, `miai`, `sabaki`, `honte`, `joseki`, `fuseki`.
   None needs new mathematics.
2. **Check §4 against the Lean module.** Does the inconsistency sheaf's
   obstruction class actually distinguish held-⊥-with-option-value from
   merely-unread? That is the 2026-08-19 conjecture and this note's proposal
   standing or falling together.
3. **Decide whether the ⊥-with-option-value structure is one thing.** It appears
   here as aji and in the affect note as hope. Either that is a real shared
   object or it is a rhyme, and someone should say which.
4. **Do not build an evaluation function.** Row one of §6's table is a solved
   engineering problem with better tools than this org has, and the section's
   own plan gates code behind decisions that have not been made.
5. **Add the AI-revision caveat to any influence lesson** before it is taught.

## 9. Sources

Working references from assistant knowledge; verify before public use.

- Berlekamp, Elwyn, and David Wolfe. *Mathematical Go: Chilling Gets the Last
  Point* (A K Peters, 1994).
- Ishida, Yoshio. *Dictionary of Basic Joseki*, 3 vols. (Ishi Press, 1977).
- Kageyama, Toshiro. *Lessons in the Fundamentals of Go* (1978) — the standard
  source on shape, direction of play, and honte.
- Takagawa, Kaku. *How to Play Go* / the classical territorial statement.
- Otake, Hideo. *Opening Theory Made Easy* (1992).
- Ishigure, Ikuro. *In the Beginning: The Opening in the Game of Go* (1973).
- Go Seigen and Kitani Minoru, the *Shinfuseki* movement (1933) — for the
  influence-first revision; see Go Seigen, *A Way of Play for the 21st Century*.
- Silver, D. et al. "Mastering the Game of Go with Deep Neural Networks and Tree
  Search," *Nature* 529 (2016); "Mastering the Game of Go without Human
  Knowledge," *Nature* 550 (2017) — for the AI-era revisions.

### In-corpus references

- `lib/emsenn/.../weiqi-services-section/content/text/documents/articles/notes/obsmetrologia-and-go-strategy.md` (the note this one complements)
- `lib/emsenn/.../weiqi-services-section/content/text/glossary/terms/` (the seventeen rules-level terms)
- `lib/emsenn/.../weiqi-services-section/content/text/documents/articles/notes/provenance-policy.md`
- `lib/emsenn/.../math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Cohomology/InconsistencySheaf.lean`
- `lib/emsenn/.../math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Cohomology/CoordinationCohomology.lean`
- `lib/emsenn/.../computer-science-services-section/content/text/documents/articles/notes/2026/08/29/2026-08-29-note-on-the-unbuilt-affects.md` (§3, the held-⊥ structure)
- `lib/emsenn/services/561-group/services/561-group-services-section/README.md` (the operational-status caveat)
