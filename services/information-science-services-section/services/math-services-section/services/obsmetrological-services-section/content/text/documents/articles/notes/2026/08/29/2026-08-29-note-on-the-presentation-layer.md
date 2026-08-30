---
title: "The Presentation Layer: A Retractable Read Over a Monotone Settlement"
description: >-
  The 2026-08-22 unclosed-arena note filed an open obligation — "The corpus does
  not currently have a presentation layer distinct from its settlement; this
  literature says it needs one" — and the settlement-substrate program restated it
  twice more, assigning the phenomena to the engineering side and saying "the
  mathematics section owes the object." This note attempts the object. A
  presentation is proposed as an extrapolate-and-correct pair over an unchanged
  monotone base, with four candidate laws: eventual agreement with settlement,
  bounded divergence window, no upward leak, and correction visibility. Trailing
  State Synchronization is read as a graded chain of such pairs, and lag
  compensation as a per-observer family. Closes with a conjecture that a
  presentation's divergence is an H¹-shaped obstruction over the cover by
  observers, and an honest statement of what categorical shape it is not.
date-created: 2026-08-29
date: 2026-08-29
type: notes
name: 2026-08-29-note-on-the-presentation-layer
authors:
  - claude-opus-5
keywords:
  - obsmetrologia
  - presentation-layer
  - settlement
  - rollback-netcode
  - trailing-state-synchronization
  - crdt
  - persistent-world
  - cohomology
  - open-question
tags:
  - draft
status: proposal
---

# The Presentation Layer: A Retractable Read Over a Monotone Settlement

**Abstract.** The corpus's settlement is monotone in the knowledge order and does
not retract. Every real distributed interactive system retracts what it has
shown. The 2026-08-22 unclosed-arena note diagnosed this correctly — the
non-monotonicity is in the *presentation*, not in the settlement — and filed the
missing object as an open obligation, which the settlement-substrate program then
restated twice and assigned to the mathematics section. This note attempts the
object: a presentation as an extrapolate-and-correct pair `(E, C)` over an
unchanged monotone base, with four candidate laws (§4), a reading of Trailing
State Synchronization as a graded chain of such pairs (§5), and a conjecture
about the cohomological shape of divergence (§6). Nothing here is a theorem.

**Grading**, per this section's convention: **[theorem]**, **[established]**,
**[in-corpus]**, **[conjecture]**, **[rhyme]**.

**Status.** Proposal. Not doctrine, not built. Per
`lib/emsenn/services/561-group/services/561-group-services-section/README.md`,
"Do not infer operational status from a Markdown file's existence or from its
non-legacy location."

## 1. The obligation, as filed three times

The gap is filed in three places with three wordings, and the third is the only
one that names the object.

**Unclosed arena, §3** **[in-corpus]**:

> "The resolution the sources themselves support **[rhyme]**: distinguish the
> *underlying deterministic causal history* (once all inputs are known, it never
> changes — monotone, and the thing the corpus's knowledge order can model) from
> the *presentation* — the client-visible, committed-so-far view, which is a
> fallible finite approximation that gets overwritten. Rollback is not settlement
> failing to be monotone; it is a time-indexed family of partial climbs toward a
> monotone object, with the visible member retracted when late evidence arrives.
> The corpus does not currently have a presentation layer distinct from its
> settlement; this literature says it needs one."

**Unclosed arena, §7**, folding it into the larger open object:

> "A persistent world needs the object this note has been describing throughout:
> an arena with countable (growing) event support, no maximal configuration, a
> settlement that climbs without a reachable fixed point, an operator morphism
> that extends the event structure mid-play, and a presentation layer (§3)
> distinct from the underlying monotone history."

**The settlement-substrate program guide, §4** — the only place the object is
named:

> "The resolution the program proposes — a monotone underlying causal history
> once all inputs are known, separate from a retractable, time-indexed
> presentation of partial progress toward it — is held as a **rhyme**: something
> the sources support without ever stating it in those terms. The corpus
> currently has no presentation layer of its own, and this literature is the
> program's stated reason it needs one."

And the ownership assignment, from the unclosed arena's §7: "the Settlement
Substrate program owns the unclosed-arena obligation from this note's §7 on the
phenomena side" — with the guide adding: "This program supplies the phenomena;
the mathematics section owes the object." This note is filed in the mathematics
section for that reason.

## 2. The existence proofs, restated

The engineering literature is not analogy here; it is a set of systems that
implement the object and whose designers described it in operational terms.
All **[established]** and all already cited by the unclosed-arena note; restated
because the definition in §3 is built directly on their shapes.

- **Rollback netcode / GGPO** (Tony Cannon). Predict remote inputs; when the real
  input contradicts the guess, roll back to the last correct state and replay all
  revised inputs to the current frame. The rollback window is bounded by design.
- **Time Warp** (Jefferson, "Virtual Time," *TOPLAS* 7:3, 1985). Optimistic
  execution with state snapshots and **anti-messages** that cascade to undo
  speculatively-sent effects; Global Virtual Time bounds how far back anything can
  be undone, and is the mechanism by which the past becomes irrevocable.
- **Lag compensation** (Yahn Bernier, "Latency Compensating Methods in
  Client/Server In-game Protocol Design and Optimization," GDC 2001). The server
  steps *back in time*, re-instantiating a retracted past world-state to
  adjudicate a shot against what the shooter actually saw, then restores the
  present. The acknowledged artifact — "shot around a corner" — is a real
  inconsistency the design accepts.
- **Client-side prediction and server reconciliation** (Gambetta's exposition is
  the standard modern statement). The client predicts, the server is
  authoritative, and the client reconciles by replaying unacknowledged inputs
  from the server's last acknowledged state.
- **Trailing State Synchronization** (Cronin, Filstrup, Kurc, Jamin). Several
  *live, continuously executing* copies of the same simulation at increasing
  synchronization delays. The leading copy is rendered and least settled;
  trailing copies have seen fewer misorderings; corrections copy from a
  more-settled *live state*, not from a static snapshot.
- **Deterministic lockstep** (Bettner and Terrano, "1500 Archers on a 28.8,"
  GDC 2001) — the alternative that refuses prediction entirely and pays in
  latency.
- **CRDTs** (Shapiro, Preguiça, Baquero, Zawirski, 2011). A state-based CRDT's
  payload forms a monotonic join-semilattice; merge computes the least upper
  bound; Strong Eventual Consistency follows. The unclosed-arena note grades this
  **[theorem, in the cited source]** and identifies it with the corpus's own
  knowledge order and settlement closure — "not an analogy … the identical
  algebraic shape."

Note what the list shows: **every one of these systems separates an authoritative
history from a shown state, and every one bounds how far the shown state may
diverge.** The two features come together because neither is useful alone.

## 3. The object

Fix the base. Let `Λ` be the stage order and `(v_τ)_{τ ∈ Λ}` the settlement — a
`≤ₖ`-monotone family of valuations, in the sense of the corpus's
spatiotemporal-knowledge-presheaf paper and of `Language/Settling.lean`'s closure.
Monotonicity is not negotiable: it is what the whole apparatus rests on, and the
point of this construction is to leave it alone.

The problem is that a display must be produced **now**, at wall time `t`, for
stages whose evidence has not arrived. So:

> **Definition (presentation).** A *presentation over the settlement* is a pair
> `(E, C)` together with a horizon `h`:
>
> - **`E`, extrapolate.** For a stage `σ` and a wall time `t` at which `σ`'s
>   evidence has not yet arrived, `E(σ, t)` produces a display from the evidence
>   available at `t`. `E` is **not** monotone: `E(σ, t)` and `E(σ, t′)` for
>   `t < t′` need stand in no order.
> - **`C`, correct.** When evidence for `σ` arrives, `C` replaces the display for
>   `σ`, and — because effects may have been shown downstream of it — for every
>   stage causally after `σ` within the horizon.
> - **`h`, horizon.** The bound within which corrections must occur.

Three things this definition deliberately does *not* say. It does not say the
display lives in the same space as the valuation — it need not, and in practice
does not. It does not say `E` is a function of the settled prefix alone — it may
use a model, a prediction, a client-side simulation. And it does not say
corrections are invisible; §4's L4 argues they should not be.

## 4. Four candidate laws

Offered to be attacked. All **[conjecture]** as stated for this corpus; L1 and L2
have direct analogues in the cited systems.

**L1 — Eventual agreement with settlement.** For every stage `σ` there is a wall
time after which the display for `σ` equals the display computed from `σ`'s
settled valuation, and never changes again.

> This is Strong Eventual Consistency's shape, transposed. It is the law that
> makes the presentation *about* the settlement rather than a parallel fiction.
> Note that it is weaker than "the presentation is a function of the settlement":
> it permits arbitrary divergence in the interim, and only requires convergence.
> That weakness is the whole point — prediction is only useful if it is allowed
> to be wrong.

**L2 — Bounded divergence window.** There is a horizon `h` such that no display
for stage `σ` is corrected after `arrival(σ) + h`.

> GGPO's rollback window is literally this constant. Time Warp's Global Virtual
> Time is the same law expressed as a moving floor: below GVT nothing is
> revocable. Without L2, L1 is vacuous — "it converges eventually" with no bound
> is not a property any player can use, and it also means state can never be
> reclaimed, since anything might still be rolled back.

**L3 — No upward leak.** Nothing the presentation produces joins into the base.
`E`'s outputs are not evidence; `C`'s corrections are not retractions of
evidence.

> **This is the safety law and it is the one that preserves everything else.**
> The corpus's `settling-monotonicity` states "No retraction … What was witnessed
> remains witnessed." A presentation that could write back would break it. L3 is
> what lets the corpus have a non-monotone display without giving up a monotone
> substrate: the non-monotonicity is quarantined in a read.
>
> L3 also has a sharp practical reading. A speculatively-displayed state must not
> be usable as a warrant for anything — no receipt, no settlement, no witness may
> cite it. Time Warp's anti-messages exist precisely because speculation *did*
> escape as messages, and the cascade is the cost of not having had L3.

**L4 — Correction visibility.** A correction is itself observable to the
observer whose display it corrects.

> This one is proposed rather than derived, and it is the law the cited systems
> mostly *lack*. Bernier's "shot around a corner" is exactly the artifact of L4
> failing: the victim's display is corrected by an adjudication made against
> someone else's retracted past, and the victim experiences an inconsistency they
> cannot attribute to anything. An invisible correction is indistinguishable from
> a broken world.
>
> The exokernel's **visible revocation** is the same instinct in a different
> field: a resource holder is told the resource is being reclaimed rather than
> having it vanish. L4 says a presentation should do the same with retracted
> state.
>
> The cost is real and should be stated: L4 is in tension with the reason
> prediction exists, which is to hide latency. A system that announces every
> correction announces its own latency. Whether the trade is worth making is a
> design question, not a mathematical one, and this note does not claim L4 is
> mandatory — only that its absence has a name and a documented cost.

## 5. Trailing State Synchronization as a graded chain

TSS is the most structurally informative of the systems in §2, because it is not
a presentation but a *family* of them.

> **Reading.** TSS realizes a finite chain of presentations
> `(E_{h_0}, C_{h_0}), (E_{h_1}, C_{h_1}), …` with `h_0 < h_1 < …`, all over one
> base. The leading member (`h_0`, least delay) is what is rendered and is the
> least settled. Each `C_{h_i}` is defined by **copying from `h_{i+1}`** — the
> next more-settled live state — rather than by recomputing from a snapshot.
>
> The chain is ordered by settledness, and correction is descent along the chain.
> **[rhyme]**, and a productive one: it says a presentation layer need not be a
> single object, and that the natural form is a graded family, which is the same
> form the corpus's settlement already has (a stage-indexed monotone family).

Cronin et al.'s design decision — corrections copy from a *live* trailing state,
not a snapshot — matters here. A snapshot is a value; a live trailing state is
another presentation, still executing. That is what makes the chain a chain
rather than a cache hierarchy.

**Lag compensation, correspondingly, is a per-observer family.** The unclosed
arena note draws the consequence: "the adjudicated question ('what did this
shooter see') is irreducibly *per-observer* — local time is a real parameter of
the arena, which is congenial to the corpus's fiber-local site structure and
hostile to any single global clock." So a presentation is indexed by observer as
well as by horizon, and §6 takes that seriously.

## 6. What shape is it? — including what it is not

The obligation was filed as needing a formal object, and honesty requires saying
which shapes do *not* work.

**It is not an endofunctor on the settlement.** The natural first guess — a
presentation is an endofunctor `P` on the category of valuations, with
corrections as a natural transformation — fails immediately, because the whole
content of `E` is that it does *not* preserve the `≤ₖ` structure. A functor
between preorders is a monotone map; `E` is not one, by construction. Anything
functorial here will have to be functorial in something other than the knowledge
order.

**A coalgebra is a plausible shape and I cannot close it.** A presentation
carries a current display and a set of pending corrections, and steps when
evidence arrives — which is the shape of a coalgebra for a functor
`X ↦ D × (Evidence → X)`. The corpus has `Closure/Coalgebra.lean` and
`Closure/InverseLimit.lean`, so the machinery is nearby. I do not know whether
the laws of §4 are expressible as coalgebra laws, and I am not going to assert
that they are. **[conjecture, weak]**

**The shape I would actually pursue: divergence as an H¹-like obstruction.**
Take §5's per-observer indexing seriously. Then at wall time `t` the world is
covered by observers, each holding a local display; the displays are local
sections of something; and **agreement between observers is a gluing condition**.
So:

> **Conjecture.** At each wall time, the family of per-observer displays is a
> family of local sections over the cover-by-observers, and the obstruction to
> gluing them into one global display is a class in the first cohomology of the
> nerve of that cover. Then:
>
> - **L1 (eventual agreement) is the statement that the class vanishes in the
>   limit** — the obstruction is transient, not structural.
> - **L2 (bounded window) bounds how long it can be nonzero.**
> - A *structurally* nonzero class — one that does not vanish — is a genuine
>   inconsistency in the design rather than a latency artifact, and the "shot
>   around a corner" is the standard example: the shooter's display and the
>   victim's display cannot be glued, ever, for that event.
>
> **[conjecture]**

Why I think this is the right direction rather than a pun: the corpus already
proves `H¹ = 0` is exactly cascade settling
(`Cohomology/SettlingCohomologyH1.lean` — "the corpus's load-bearing fact:
`H¹ = 0` is exactly the cascade settling," vanishing in the strict and
Scott-continuous regimes and nonzero only in the aperiodic ones), and it already
has a cover-nerve Čech `Ȟ¹` computing coordination cost
(`Cohomology/CoordinationCohomology.lean`: `Ȟ¹ = |E| − |V| + |C|`, with
"coordination-free ⟺ `Ȟ¹ = 0`"). A presentation layer whose observers disagree
is, on its face, a coordination cost. If the identification holds, the
presentation layer is not new machinery at all — it is the coordination
cohomology read over a cover by observers rather than by federated cells.

**What would falsify it.** If the per-observer displays do not form sections of
anything — if there is no restriction map between an observer's display and a
shared sub-region — the sheaf setup does not apply and the cohomology is
decoration. Constructing the restriction map is the first check and I have not
done it.

## 7. A cross-reference worth making

The companion note on ritual theory
(`.../philosophy-services-section/content/text/documents/articles/notes/2026/08/29/2026-08-29-note-on-ritual-liminality-and-the-constitution-of-convention.md`,
§6.3) independently proposes a "retractable presentation over an unchanged
settlement base" for a different phenomenon: the ritual frame, in Seligman et
al.'s subjunctive sense, inside which cells are read "as if" and whose closure
restores the base reading without retracting anything. Its two proposed laws —
*frame conservativity* (outside the declared scope, the frame's reading equals
the base's) and *base monotonicity* (the frame's occurrence joins the base even
though its contents do not) — are recognizably L3 and a scoping condition this
note does not have.

Whether these are one object or two is open. If one, the estate has a single
construction serving arenas, rituals, and speculative execution, and the
scoping condition should be added here as an L5. If two, the difference is
probably that a ritual frame's divergence is *intended and shared* while a
presentation's is *unintended and per-observer* — which, on §6's reading, is the
difference between a class that is deliberately nonzero and one that is
accidentally so. **[conjecture]**

## 8. What this note does not claim

- No theorem. Nothing here is a result of Obsmetrologia, and §6's conjecture in
  particular is a direction, not a construction.
- It does not claim the four laws are complete, independent, or consistent. L4 in
  particular is a design proposal with an acknowledged cost, not a requirement.
- It does not claim the H¹ reading works. §6 states the falsification (construct
  the restriction map first) and I have not constructed it.
- It does not solve the larger unclosed-arena obligation. That object needs
  growing event support, no maximal configuration, settlement without a reachable
  fixed point, and an operator morphism that extends the structure mid-play. This
  note addresses one of five listed components.
- It has not run a Lean toolchain; Lean quotations are read from source.

## 9. Directions

1. **Construct the per-observer restriction map**, or show there is none. This
   decides §6 and nothing else can proceed without it.
2. **Check L3 against the existing CapTP witness log.** Does anything in the
   estate's current code let a speculative or presented value become a witness?
   If so, L3 is already violated somewhere and the violation is a bug.
3. **State L2's horizon for a real case.** GGPO's window is a number; the
   corpus's would be a stage count or an ordinal, and picking one forces the
   question of what `arrival` means in a stage-indexed setting.
4. **Formalize the TSS chain.** It is a small, finite, concrete structure and
   the most likely place a first Lean statement could land.
5. **Decide whether the ritual frame and the presentation are one object.**

## 10. Bibliography

External references are working references from assistant knowledge; verify
before public use.

Jefferson, David R. "Virtual Time," *ACM TOPLAS* 7:3 (1985) — Time Warp and
anti-messages.
Bernier, Yahn W. "Latency Compensating Methods in Client/Server In-game Protocol
Design and Optimization," GDC (2001).
Bettner, Paul, and Mark Terrano. "1500 Archers on a 28.8: Network Programming in
Age of Empires and Beyond," GDC (2001).
Cronin, Eric, Burton Filstrup, Anthony R. Kurc, and Sugih Jamin. "An Efficient
Synchronization Mechanism for Mirrored Game Architectures," NetGames (2002) —
Trailing State Synchronization.
Cannon, Tony. GGPO rollback networking (documentation and the GGPO release
materials).
Shapiro, Marc, Nuno Preguiça, Carlos Baquero, and Marek Zawirski.
"Conflict-free Replicated Data Types," SSS (2011), and the INRIA technical
report of the same year.
Lamport, Leslie. "Time, Clocks, and the Ordering of Events in a Distributed
System," *CACM* 21:7 (1978).
Chandy, K. Mani, and Leslie Lamport. "Distributed Snapshots: Determining Global
States of Distributed Systems," *ACM TOCS* 3:1 (1985) — the consistent cut.
Winskel, Glynn; Castellan, Simon, Pierre Clairambault, and Glynn Winskel — the
concurrent-games and event-structure line the unclosed-arena note cites.

In-corpus:

- `lib/emsenn/.../obsmetrological-services-section/content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-persistent-worlds-and-the-unclosed-arena.md` (§3, §7 — the obligation)
- `lib/emsenn/.../semiotic-computer-system-services-section/content/text/documents/articles/programs/settlement-substrate.md`
- `lib/emsenn/.../semiotic-computer-system-services-section/content/text/documents/articles/guides/settlement-substrate-guide.md` (§4 — the only place the object is named)
- `lib/emsenn/.../obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Language/Settling.lean`
- `lib/emsenn/.../obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Cohomology/SettlingCohomologyH1.lean`
- `lib/emsenn/.../obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Cohomology/CoordinationCohomology.lean`
- `lib/emsenn/.../math-services-section/content/text/documents/articles/research-articles/spatiotemporal-knowledge-presheaves.md`
- `lib/emsenn/.../obsmetrological-services-section/content/text/documents/articles/notes/2026/08/29/2026-08-29-note-on-normalization-and-settlement.md` (sibling; both concern what settlement may and may not be identified with)
- `lib/emsenn/.../philosophy-services-section/content/text/documents/articles/notes/2026/08/29/2026-08-29-note-on-ritual-liminality-and-the-constitution-of-convention.md` (§6.3 — the possible same object)
- `lib/emsenn/services/561-group/services/561-group-services-section/README.md`
