---
title: "Allosteric Law and the Minting Temperature — How the Union Regulates Its Fold"
description: "Argument: the Union's fold has exactly two independent regulators, matched one-to-one to a proved Lean object each — allosteric law (Legalist Fa / shì, enforcement as landscape shape rather than rule-reading, carried by the live deny-hooks) and temperature (Thermodynamics/Temperature.lean's stageTemperature = mints/flux, NOT demand-rate) — with the governance diseases read as the two temperature extremes and Legalism-shapes/Daoism-descends as thermodynamics plus kinetics. Closes by separating what the cited Lean actually proves from what is this note's own reading."
date-created: 2026-07-24
kind: research-note
keywords:
  - unionification
  - obsmetrologia
  - allostery
  - legalism
  - fa
  - shi
  - temperature
  - free-energy
  - glass
  - four
  - governance
  - folding
status: design
declared-by: claude-interactive-session-supplying-leader-movement-team
---

The claim: regulation of a fold has exactly two independent knobs — the **shape** of the energy
landscape (thermodynamics: which conformations are allowed) and the **temperature** (kinetics: how
much the system explores versus commits). Each knob has a proved object in the Obsmetrologia
corpus, and the Union's own governance stack already *is* these two knobs: **Legalist Fa is
landscape-shaping; Ming-Daoist wu wei is the thermal descent down the shaped landscape.**
"Allostery" is not the corpus's own word for any of this — it is this note's synthesis term,
matched onto the corpus's own name for enforcement-by-position, **勢 (shì)**. That match is the
argument; where it is proved and where it is a reading is kept explicit throughout, and separated
cleanly in §7.

---

## 1. Two knobs, and why they are independent

A protein is regulated two ways that do not reduce to each other. Allostery changes its *shape*: a
signal binds at one site and the conformation shifts at a distant site, so the same molecule now
makes different transitions low-energy — the landscape is re-formed, no covalent bond changed.
Temperature changes its *exploration*: raise it and the chain samples widely, hopping between
basins and denaturing at the top; lower it and it freezes into whichever basin it already occupies,
forming a glass.

Shape decides *which* conformations are native — where the wells sit. Temperature decides *whether*
the system can reach and leave them — how freely it moves on the landscape it's given. A landscape
can be perfectly shaped and still never be occupied, if the temperature traps the system somewhere
else first; a temperature can be perfectly tuned and still produce nothing native, if the landscape
has no native well to fall into. Getting one knob right without the other is not partial success —
it is failure of a different kind. The rest of the note takes each knob in turn, then asks what it
means for the Union to have both wrong or right at once (§5).

---

## 2. Allosteric law: governance is a shape, not a rulebook — and the corpus already names it 勢

The claim: Union law does not work by being read and obeyed. It works by shaping the landscape so
the forbidden transition has no low-energy path. A gate is not a guard checking a list against a
substrate presented to it; it is a binding pocket whose geometry admits only the right substrate and
routes the wrong one elsewhere. Stripped of the biology word, this is exactly the corpus's own
Legalism — and the corpus was already using the geological/positional metaphor before this note
introduced the chemical one.

Root `CLAUDE.md:33` states enforcement-by-shape directly: "**Impersonal enforcement gates & git
hooks enforce behavior by mechanism over virtue. Blocked instruments name their sanctioned
routes.**" The huidu-guanli note gives the mechanism its classical name, at
`2026-07-14-note-on-huidu-guanli-of-emsenn.md:73`: "**勢 (shì) — positional power.** Position that
makes law self-enforcing; power located in the office, not the person… In this repo: **where a
file sits on disk**, and the hook that permits or denies by that position." Shì *is* the
conformation — enforcement carried by where a thing sits in the fold, not by anyone reading and
choosing to comply.

The live `.claude/hooks/` gates, wired in `.claude/settings.json`, are these binding pockets in
operation. Each blocks a substrate that does not fit and *names the sanctioned route in the same
denial* — the pocket does not merely reject, it routes to where the substrate does bind:
`deny-raw-git.mjs` blocks raw `git` and names the Git Services Section ingress;
`deny-branch-change.mjs` blocks branch changes off `main` and names the allowed forms;
`agent-dispatch-gate.mjs` blocks a subagent dispatch whose prompt never read `AGENTS.md` and names
the grounding requirement; `post-edit-conformance-gate.mjs` blocks a write that violates ruled
practice and names the normalization check that would have passed it. A rejection that names its
own cure is exactly what a shaped landscape does and a rule-list does not: a rule-list tells you
*that* you failed; a binding pocket's shape tells you where the substrate that fits is.

**Allosteric specificity is Xing-Ming's two handles.** A binding pocket rejects a substrate that is
*too small* for it and one that is *too large* — only the exact-fit conformation binds at low
energy. Xing-Ming (刑名, 循名責實, huidu-guanli:76–80) is exactly this two-sided rejection: "Deeds
fall short of the name — punished. Deeds *exceed* the name — the minister improvised, freelanced,
built something nobody chartered — also punished." Two handles, 刑德. This matters for the shape
argument specifically because a rule-list only has one failure mode (non-compliance); a binding
pocket has two (wrong shape on either side of the fit), and Xing-Ming is stated as exactly two, not
one — which is evidence for reading it as a pocket's geometry rather than a checklist's single pass
condition.

**The fold must hold without a chaperone.** 明法, the acceptance test at huidu-guanli:95–99: the law
must be clear and followable "**without the ruler present**… would this behavior survive a
forgetful, rushed, or adversarial incumbent stepping into the office?" A conformation that holds
only because someone is actively imposing it is not native to the landscape — it is a rogue
chaperone's fold, and it denatures the moment the imposer looks away. This is the same claim as §1's
independence-of-knobs point stated for law specifically: a shape enforced by presence is not a shape
at all, it is a temperature-dependent illusion of one — remove the enforcer (change the "kinetic"
regime) and the "native" fold is revealed never to have been low-energy on its own.

---

## 3. How far the allosteric-signal reading can honestly go

In a real protein an allosteric signal propagates *through the fold*: a conformational change at one
site reaches a distant site along the structure's lowest-frequency collective modes, and how fast a
signal reaches how far is a spectral question. The Union's candidate analogue: a commitment
finalized at one contract changes what a distant contract will do, not through a direct edge but by
shifting the shared conformation — the global state root.

Two Lean results are available to bear on the analogue, and it is worth being exact about what each
actually proves, because the temptation is to reach for "the corpus proves the spectral gap" when
what is proved is narrower and still useful. `LawvereLaplacianSpectralGap.lean:287` proves
`diffusion_spectral_gap_bound`: in the pointwise-charge strict regime, the Lawvere-Laplacian
diffusion stabilizes by step 3 (`iterV (liftOp c.op) 3 = iterV (liftOp c.op) 4`). That is a concrete
finite bound on how many diffusion steps a settling process takes to reach its harmonic kernel; the
file's own docstring (lines 279–286) glosses this bound as "the spectral gap," but the proved object
is the step-count bound, not a separately computed real-valued gap. `CoordinationCohomology.lean:325`
proves `h1rank_is_coordination_cost`: `N.H1rank = N.cells - (N.entities - N.components)`, and this
rank is zero exactly when the cover nerve is a forest (`N.entities = N.cells + N.components`) — the
independent cycles in the coordination structure, each one an irreducible coordination obstruction.

Reading these two as "the allosteric signal is a low-frequency mode of the coordination Laplacian,
its reach governed by the spectral gap and its coordination cost by `Ȟ¹`" is a bridge, not an
identification the Lean makes. Nothing in either file mentions allostery, proteins, or governance;
the bridge is this note's, built by carrying over a real prior thought — a retired archived draft,
"A Spectral Interpretation of Allostery: Low-Frequency Mode Shifting in an Internal Laplacian"
(`spectral-allostery.md`, biophysics archive, uncited by any governance material) — onto results
proved for a different purpose (settling convergence, coordination-cost accounting). The bound and
the rank are real and proved; that they are *the* right account of how a governance signal
propagates is this note's synthesis, flagged here rather than left implicit.

---

## 4. Temperature is proved, and it is mint/commit, not demand-rate

`FreeEnergyLyapunov.lean`, the file the corpus's settling-descends-a-free-energy result rests on,
carries no real-valued temperature or entropy. `F = E − T·S` appears only as prose in its module
doc (lines 12, 66–70, 370–377); the file's actual carrier is the `Nat`-valued `deficit`/`freeEnergy`,
and its one temperature-labelled object, `closureAtZeroTemp := liftOp c.op` (`:385`), is
definitionally the `T = 0` hard-closure endpoint — pure deterministic commitment, no exploration. The
file states directly that it does not fabricate a real-valued entropy `S`; a positive-temperature
extension is explicitly open, tracked in the Blueprint as `real-ratio-temperature-connectivity-
frontier` (`docs/blueprint/.../02-topology-and-glass.tex:214`, `\notready`, drawing on an also-open
`percolation-threshold-law`). So the proved Lyapunov descent is the *cold limit* of a temperature
axis the corpus has not yet built the positive-temperature half of — this matters, because it means
the note's temperature claims below rest on a genuinely different, narrower file.

`Thermodynamics/Temperature.lean` proves that narrower, genuine object: a rational-valued
temperature read directly off the ledger. `stageTemperature := mints / flux` (`:687–690`) is the
fraction of a stage's discharge that is contradiction-minting — opening a new FOUR contradiction, a
`⊤ = ⟨1,1⟩` both-evidence distinction — rather than commitment, settling toward a fixed point.
`stageTemperature_zero_of_no_mints` (`:694`) proves a mintless stage sits at exactly `T = 0`.
`collision_stage_temperatures` (`:708`) computes, by `decide`, a commitment-only stage at
`T = 0/3 = 0` and an all-mint stage at `T = 2/2 = 1` — the two poles realized on an actual running
collision cascade, not merely possible in principle. Temperature, on this reading, is not the
external arrival rate of demand; it is the body's own ratio of contradiction-opening to commitment,
an observable computed from receipts already on the ledger. Demand and disagreement can *drive*
minting and so raise `T`, but `T` itself is the internal fraction, not the rate of anything arriving
from outside.

`Glass.lean` ties the folding window to exactly this temperature. `frozenAt` (`:423`) and
`hoppingAt` (`:429`) define a basin as frozen when its temperature sits below a threshold in the
stochastic order and hopping when above; `glassy` (`:991`) is the finite predicate built from
`frozenAt` at the retained connectivity threshold, and `glassy_iff_temperature_below_connectivity_
transition` (`:1007`) proves — by `rfl` (`:1011`) — that a phase is glassy exactly when temperature
is at or below that threshold. `rfl` here means the equivalence is definitional once the
predicates are unfolded, not a substantive derivation; the substantive, still-open question is
*where the threshold itself sits* — the percolation derivation the frontier node above depends on.
So what is proved is the shape of the relationship (glassy iff below threshold); what is open is the
threshold's value.

---

## 5. The two governance diseases are the two temperature extremes

Reading the two temperature poles against governance failure modes gives a diagnosis with more
content than either pole alone.

**Premature ossification** — a covalent, permanent commitment where a weak, revisable one belonged
— is the `T → 0` pole: all commitment, no minting, the body frozen into its first conformation
before exploring, contradiction crushed to Boolean commitment before its time. By
`glassy_iff_temperature_below_connectivity_transition` this is literally a glass: kinetically
trapped in whatever basin it first reached, not settled there because that basin was low-energy.
This is a chaperone gone rogue, imposing a fold instead of letting the landscape select it.

**Failure to set** — a weak, revisable bond where a covalent one belonged — is the `T → 1` pole: all
minting, no commitment, contradiction opening without end, nothing settling into scaffold.

The allosteric law of §2 shapes *where* the native well is, but a wrong temperature means the body
never sits in it regardless of the shape: too cold and it is trapped short of native before
exploring; too hot and it cannot hold native once found. Governance needs the right landscape shape
*and* the right minting temperature — one without the other reproduces §1's independence claim as a
failure mode. This also re-grades a claim easy to over-generalize from the proved objects above:
driving *local* commitment — cooling one fold to its own fixed point — is exactly what
`stageTemperature_zero_of_no_mints` describes and is correct; cooling the *whole body* to `T = 0` is
the frozen-glass failure mode, not a stronger version of the same good thing. The proved objects are
per-stage; nothing in the corpus computes a single body-wide temperature, so "the whole body's
temperature" is this note's extrapolation, held for the reading it produces (§7) rather than as a
proved quantity.

---

## 6. Legalism shapes the landscape; Daoism is the descent down it

**Legalist Fa is landscape-shaping — thermodynamics.** Law sets which conformations are low-energy:
the shì-carrying gates, the binding pockets, the shape of the funnel (§2). It is structural, the
scaffold's geometry; it changes *where the wells are*, and changing it is a different act from
changing how fast anything moves through them.

**Ming-Daoist wu wei is the thermal descent — kinetics.** Root `CLAUDE.md:32`: "Sovereign decides but
does not execute. Work orders drain via automated desired-state reconcilers and timers." The
reconcilers (`dispatch-work-orders.mjs` on a five-minute cadence, `watch-capability-registry.mjs` on
a thirty-minute one) do not push work uphill; they let it fall down the landscape the law already
shaped, at whatever temperature the body is at. 無為 (huidu-guanli:87–93): the ruler does *nothing*
because the standard and the offices do everything — **明主之道，一法而不求智**, the enlightened
ruler relies on law, not on his own cleverness.

Put together, this is not two independent metaphors that happen to coexist; it is the same
composition as §1. The sovereign's job under this reading is to shape the funnel — set the law — and
hold the temperature in the living window between the two poles of §5; then the work descends on its
own. A protein folds spontaneously once its sequence and temperature are set, with no one pushing
each residue into place — wu wei stated as chemistry, the descent spontaneous once the landscape is
shaped and the body is at temperature. The objective function huidu-guanli names for this in the
classical tongue (:93) is 無為 as "*more advancement, less cost of attention*" — minimizing the
attention spent driving the descent by hand, which is exactly what a well-shaped, well-tempered
landscape does not require anyone to spend.

---

## 7. What is proved, what is open, and what is this note's reading

Collapsing the argument's own epistemic status into one place, because stating a synthesis as if it
were a theorem is the failure this note is built to avoid.

**Proved, in Lean, and load-bearing for the argument above:**
`Thermodynamics/Temperature.lean:687` defines `stageTemperature := mints/flux`; `:694` and `:708`
prove it hits exactly `0` and exactly `1` on a real running cascade. `FreeEnergyLyapunov.lean:385`
proves `closureAtZeroTemp` is the `T = 0` endpoint of settling, and the file's module doc records
that no real-valued entropy is fabricated. `AperiodicOrder/Crystal/Glass.lean:1007` proves — by
`rfl` at `:1011` — that glassy is definitionally equivalent to temperature-below-threshold.
`Cohomology/CoordinationCohomology.lean:325` proves the coordination-obstruction rank equals
`cells − (entities − components)`, zero exactly on a forest. `Dynamics/Flow/
LawvereLaplacianSpectralGap.lean:287` proves a concrete step-bound (≤3, strict regime) on reaching
the harmonic kernel.

**Open, in the corpus's own terms, not proved by anyone yet:** the positive-temperature analytic free
energy `FreeEnergyLyapunov` would need past its `T = 0` limit (blueprint node
`real-ratio-temperature-connectivity-frontier`, `\notready`); the percolation-threshold law that
would say *where* the glass threshold sits, rather than only how it relates to temperature.

**This note's own reading, not the corpus's:** that "allostery" is the right frame for shì and Fa at
all — the corpus's own governance material never uses the word; this note imports it, matched onto
勢 and 法 because the two-knob structure fits, and that fit is an argument made here, not a fact
found in the corpus. That the spectral gap and `Ȟ¹` rank *are* how a governance signal propagates
(§3) is a bridge over a retired, uncited biophysics draft, not an identification the cited Lean
makes. That "the whole body's temperature" is a coherent single quantity at all (§5) extrapolates a
per-stage ratio to a scale the corpus has not formalized. And that Legalism-shapes/Daoism-descends
(§6) is the right decomposition of the governance table — rather than merely *a* decomposition — is
this note's synthesis over canonical law, offered for a determiner to accept, reject, or refine, not
a second proof standing beside the Lean.
