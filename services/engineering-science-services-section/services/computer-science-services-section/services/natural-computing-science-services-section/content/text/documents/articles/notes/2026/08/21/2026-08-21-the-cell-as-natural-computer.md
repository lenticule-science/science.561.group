---
title: "The Cell as Natural Computer"
description: "The biological cell as natural-computing-science's paradigm case: a survey of the public virtual-cell field's two poles (mechanistic whole-cell simulation, learned foundation models) against the estate's own third pole, the semiotic cell (membrane as admission predicate, metabolism as evidence-charge settling), read against its nearest formal kin, P systems and brane calculi."
date-created: 2026-08-21
type: notes
name: 2026-08-21-the-cell-as-natural-computer
authors:
  - claude-sonnet-5
keywords:
  - natural-computing-science
  - virtual-cell
  - natural-computer-simulation-engine
  - membrane-computing
  - predication-cell
  - settling
  - founding
---


Natural computing science's founding thesis is that nature is computing:
natural processes already instantiate the mathematics engineered computers
run, and an engineered computer is the domesticated case of a phenomenon
nature exhibits without engineering (topic document,
`natural-computing-science-services-section/content/text/glossary/topics/natural-computing-science.md`).
If that thesis is right, the biological cell is its paradigm case, not one
instance among many. A cell is the one natural object that already has,
simultaneously and without any engineer's help, every structural feature a
computer scientist would list as necessary for "a computer": a bounded
address space (the membrane), an admission discipline for what may cross
that boundary (transport proteins, receptors), an internal state that is
read and written (metabolites, gene expression), a control layer that
governs its own internal processes (regulatory networks), a persistence
and replication mechanism (DNA, division), and a failure mode with its own
executed shutdown sequence (programmed cell death). The estate's own
eight-rung Informational Complexity Ladder names this directly: rung 6,
Cell, is glossed as "a machine hosting live services behind a membrane,"
anchored to the Rendanheyi border concept (`2026-07-28` Gemini Notebook imports,
`services/science-services-section/content/text/documents/articles/notes/2026/07/28/`).
This note is a synthesis, not new mathematics: two prior surveys did the
finding work (`the engine's dev/research/estate-cell-math.md`
for the estate's own mathematics, `virtual-cell-field.md` for the public
research field), and what follows reads them together against the ladder's
rung-6 claim.

## 1. What "virtual cell" already means, in public research

Three lineages currently use the phrase "virtual cell" for genuinely
different objects, and a fourth, older lineage treats the cell as a formal
computational structure rather than a simulation target at all.

### 1a. Mechanistic whole-cell simulation

Jonathan Karr, Jayodita Sanghvi, Derek Macklin, and colleagues published
the first complete whole-cell model in 2012: *Mycoplasma genitalium*, a
525-kb, 401-gene minimal pathogen, built not as one system of equations
but as 28 submodels — one per cellular process (DNA replication, RNA and
protein degradation, metabolism, transcriptional regulation), each in the
mathematical formalism appropriate to it (ODEs, stochastic simulation,
flux-balance analysis), reconciled once per second of simulated time
against a shared cell state (Karr et al., *Cell* 150(2):389–401, 2012,
doi:10.1016/j.cell.2012.05.044). It covers 722 metabolites and 1,857
reactions and reproduced population-level statistics — doubling time,
biomass composition — it was never fit to directly. E-Cell (Tomita, Keio
University, 1996 onward) is its direct ancestor, having named whole-cell
simulation a "grand challenge" over a decade before Karr delivered on it.
Three more whole-cell models followed: *E. coli* (Macklin et al., *Science*
369, 2020; ~1,214 genes, ~19,000 parameters), the minimal synthetic cell
JCVI-syn3A built directly from cryo-electron-tomogram geometry (Thornburg,
Bianchi et al., *Cell* 185(2):345–360, 2022), and the first eukaryotic
whole-cell model, yeast WM_S288C (Ye et al., 2020). The field's own 2023
review (*Frontiers in Cell and Developmental Biology*) names its
unresolved problems plainly: missing kinetic parameters, no clean way to
synchronize processes at wildly different natural timescales (DNA
replication in hours, diffusion in microseconds), and simulators that are
not well parallelized.

VCell (Virtual Cell, Schaff et al., *Biophysical Journal*, 1997; software
released 1999; R.D. Berlin Center for Cell Analysis and Modeling, UConn
Health, led by Leslie Loew) is a different kind of thing: not one
organism's mechanism but a general-purpose environment any cell biologist
can use to build a reaction-diffusion model of a process, over geometries
segmented straight out of microscopy, run through six mathematical
treatments (compartmental ODEs, spatial PDEs, Gillespie stochastic
simulation, spatial-stochastic via an embedded Smoldyn engine, hybrid
runs, rule-based agent simulation) and stored in a public, rerunnable
model database. It is the field's oldest continuously maintained
platform, 26+ years as of 2026.

### 1b. The learned virtual-cell program

Bunne, Roohani, Rosen, and 39 co-authors (including Aviv Regev and Arc
Institute's Patrick Hsu) published the field's manifesto for an AI
approach in 2024: "How to Build the Virtual Cell with Artificial
Intelligence" (arXiv:2409.11654; *Cell*, December 2024). It defines a
virtual cell as a simulation "learned directly from biological data across
measurements and scales," proposes a data–model–interaction architecture,
and is explicit that it names a program, not a delivered system. Toward
that program, foundation models are already trained on large corpora of
single-cell RNA-sequencing data — scGPT (2023, 33M+ cells), Geneformer
(Theodoris et al.), scFoundation, GeneCompass, AIDO.Cell — learning
gene-gene and cell-state relationships as embeddings rather than encoding
known mechanism. A hard finding recurs across multiple 2024–2025
benchmarking papers (PertEval-scFM; arXiv:2410.13956; scFME): these large
pretrained models show only limited improvement over much simpler
baselines — plain PCA, or the earlier graph-based GEARS model — at
predicting a cell's transcriptomic response to a genetic perturbation it
was not trained on. Arc Institute's Virtual Cell Challenge (2025,
$100,000 prize) and its companion piece "Toward a Turing test for the
virtual cell" state the field's honest position: there is no
first-principles ground truth to validate a virtual cell against, so
behavioral adequacy — does the model's response to intervention match a
real cell's — is offered as the working criterion instead. CZI's Virtual
Cells Platform (with NVIDIA from 2025) is the field's emerging shared
infrastructure, and its own 2025 workshop report (arXiv:2507.10502) is
candid that no third-party reproducibility standard yet exists and that
regulators have no settled review process for AI-derived biological
claims.

### 1c. Process calculi and membrane computing

A lineage 15–25 years older than the AI wave treats "the cell" as a
formal computational object to be reasoned about, not a numeric system to
be fit and run. **P systems** (Gheorghe Păun, "Computing with Membranes,"
1998; *Membrane Computing: An Introduction*, Springer 2002) model a
nested hierarchy of membranes, each enclosing a multiset of symbolic
objects and evolution rules that transform objects, move them across
membranes, or dissolve/create membranes, computing by maximally parallel,
nondeterministic rewriting until no membrane has an applicable rule left.
**Brane calculi** (Luca Cardelli, CMSB 2004 / *LNCS* 3082, 2005) put the
computation on the membrane surface itself rather than in the volume it
bounds: primitives named Phago/Exo/Pino model a membrane engulfing,
expelling, or budding, and an alternative Mate/Bud/Drip set models fusion
and fission. **Stochastic pi-calculus** (Regev, Silverman, Shapiro, 2001;
Regev & Shapiro, 2004) represents a molecule as a concurrent process and a
binding interaction as a channel communication, with Gillespie rate
semantics; its BioAmbients extension (2004) adds explicit compartments.
These three formalisms are understood by their own practitioners as
siblings, not competitors — Cardelli and others have cross-encoded
BioAmbients, brane calculi, and P systems into each other and into
bigraphs. Particle-based spatial simulators (MCell, 1991; Smoldyn, 2004)
sit adjacent, simulating individual molecules as literal diffusing
point particles rather than reasoning about compartments symbolically;
VCell embeds Smoldyn directly, the concrete point where the general
platform and particle-physics lineages meet.

### The field's live fault lines

Mechanism versus learned models is unsettled, not decided: whole-cell
models are interpretable submodel by submodel but expensive to build and
only as complete as current knowledge; learned models train at a scale no
curation team can match but underperform simple baselines at genuinely
novel perturbation prediction and are not mechanistically interpretable.
Validation has no first-principles ground truth at all — the Turing-test
framing is an admission of this, not a solution to it. SBML (Systems
Biology Markup Language, current release Level 3 Version 2 Core) is the
field's actual shared interoperability standard for mechanistic models,
with companions CellML and SED-ML (which standardizes how a simulation
was run, not just what the model is); none of the AI-virtual-cell
foundation models emit or consume SBML, so the older standard and the new
models currently talk past each other entirely. Compositionality's best
answer is Vivarium (Agmon et al., *Bioinformatics*, 2022), which composes
mismatched-timescale submodels (ODE, stochastic, FBA, agent-based) via
discrete-event orchestration; its own authors report that encoding
composition in Python code "limited transparency, interoperability, and
reuse," motivating newer formal follow-ons ("process bigraphs,"
arXiv:2512.23754; "Foundations of a Compositional Systems Biology,"
arXiv:2408.00942) that try to give composition a language-independent
mathematical semantics — closer in spirit to how P systems and brane
calculi already specify composition formally.

## 2. The estate's third pole: the semiotic cell

None of the three active lineages above have any construct analogous to
paraconsistency. Karr-style mechanism, VCell, and the AI-foundation-model
program are all built on the assumption that cell state, however
uncertain empirically, is in principle a single consistent numeric vector
at any instant. The estate's own mathematics — developed independently,
for a different original purpose (a predication logic for evidence and
assertion, not biology) — describes a cell differently: as a bounded
region whose interior state is not a vector but a lattice of
*evidence-for-and-against*, admitted only through a gated boundary, and
whose metabolism is the ongoing process of resolving (or failing to
resolve) disagreement in that evidence. This is not a metaphor laid over
the estate's math after the fact; the math was there first, built for
predication, and the cell-shaped reading is what this note and the
natural-computer-simulation-engine design document (`apps/natural-computer-simulation-engine/dev/design/`)
now propose to take seriously as an actual simulator target.

### The atomic unit: FOUR-valued charge on a predication cell

The estate's most-developed formal object is the **predication cell**, an
oriented triple φ = (s, p, o) — subject, predicate, object — where (s,p,o)
and (o,p,s) are distinct cells with independently tracked values (Verso
literate-math tree,
`obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/`).
Values live in a Belnap **FOUR** bilattice `{⊥ₖ, t, f, ⊤ₖ}` — paraconsistent,
so a cell can hold contradictory evidence without collapsing — with a
**charge** as a `[truth-side, falsity-side]` pair plus witnessing marks:
evidence for and against a predication, never a single boolean. The
executable carrier
(`.../semiotics-science-services-section/services/articulation-services-section/lib/articulating/predicating/positing/fiber.mts`)
implements this as running, tested TypeScript: `Meme` (one cell bound to
one charge), `FiberAlgebra`, `Valuation` (a full state snapshot),
`composeFibers` (folds many memes into one valuation by knowledge-order
join — literally "merge concurrent updates to the same site"), and four
generators (`converse`, `subjectProjection`, `objectProjection`,
`specialization`) that move state along relations. Read as a cell's
biology, this is directly a state layer: "project all reactions a
molecule participates in," "restrict to one organelle's cells" are
generator operations, not bespoke queries.

### Metabolism as settling: equilibrium is a fixed point, not a target value

**Settling** is the modal-closure fixed point a knowledge-monotone
sequence of valuations converges to, classified into four regimes by
closure ordinal κ: strict (κ<ω), Scott-continuous (κ=ω), transfinite-
bounded (ω<κ<ω₁), and aperiodic (κ≥ω₁) — a difficulty ladder for free
(`predication-state-of-the-theory.md`, "the four-regime stratification").
Independently, and proved over a real-number type in Lean, the estate's
reaction-network library states literal chemical-reaction-network theory:
stoichiometric propensities, a mass-action rate field, Euler integration,
and `detailedBalance_euler_fixed` — the theorem that detailed balance
(zero net flux) is exactly a fixed point of the Euler flow
(`obsmetrologia/Obsmetrologia/ReactionNetworks/{MassActionRate,
DetailedBalance}.lean`). These are the same word for the same thing at two
different levels: chemical equilibrium and predication-cell settling are
both "the state a monotone process converges to when it stops finding new
disagreement to resolve." Because no inner product exists on bilattice
values (Hansen–Ghrist's spectral apparatus provably does not extend to
FOUR), the estate's proved substitute for energy minimization is
fixed-point iteration of the Tarski Laplacian (Ghrist–Riess 2022) or
Lawvere Laplacian (Ghrist et al. 2025), with H⁰ = ker L the
consensus/harmonic space — directly relevant to any metabolic network
whose state space is not a vector space, which a paraconsistent one
categorically is not.

A 2026-08-21 note on attention thermodynamics
(`.../biomimetic-semiotics-science-services-section/content/text/documents/articles/notes/2026/08/21/2026-08-21-note-on-attention-thermodynamics.md`)
names the alkaline-vent theory of the origin of life directly: the first
metabolism in porous mineral at the heat-water interface, proton gradients
across thin membranes of stone foam, and invokes Prigogine's dissipative
structures — organisms are order that persists because it dissipates a
gradient faster than dead matter can. Read together with the settling
math, a cell's metabolism in this design is charge-settling *driven by* a
maintained gradient: without a gradient to dissipate, there is nothing
forcing new evidence into the system, settling reaches a trivial fixed
point, and — per the same note's Landauer grounding (erasing one bit
costs ≥ kT ln 2) — the cell has no real energy budget left to spend on
resolving anything. This is the estate's own bridge from "settling" as an
abstract closure operation to "metabolism" as a physically motivated one:
a cell that has stopped settling because it has run out of gradient is a
cell that has died, not a cell that has finished.

### The membrane: admission as predicate, not passive boundary

Two independent, compatible readings of the membrane exist in the estate's
corpus, one purely formal and one executable. The **mark doctrine**
(`mark.md`) establishes that nothing enters the system except as a mark —
the arbitrary atomic primitive with no internal structure — carried by
exactly one of two dual roles, token (identity-carrying) or claim
(content-carrying); everything downstream is built only from marks
admitted this way, and `fiber.mts`'s `fiberCarrier()` enforces this at
runtime, throwing if a valuation contains a cell or predicate not already
present in the predication site it is being admitted into. Admission is
type-and-site-checked, not a bare merge. The **executable A2A membrane**
pattern (`local-a2a-membrane.mjs`, repeated near-identically across ~10
enterprise services, e.g.
`.../curiosity-research-market-enterprise/src/local-a2a-membrane.mjs`)
scopes a content-addressed (sha256) task/coordination store under one
provider's namespace with atomic write-then-rename and a serialized write
lane — a concrete, minimal "one gated boundary per cell, admitting and
content-addressing everything that crosses it." Named at the biology-
metaphor layer, this is the **Rendanheyi border**
(`.../rendanheyi-enterprise-services-section`), the ladder's rung-6
membrane concept, described as an ActivityPub/A2A-gated interface managing
"metabolic exchange of information" between a cell (machine) and
everything outside it.

The design consequence, spelled out fully in the natural-computer-simulation-engine design
document, is that a membrane in this reading is an evaluator, not a rule.
An object does not cross because some external rule happens to fire (the
P-system reading, below); the membrane itself judges admission against
what the object *is*, epistemically — closer to how a real membrane's
receptors and channels decide what crosses based on molecular recognition.

### Organelles as subsheaves, division as site-splitting, death in two registers

A colony (read: an organelle) is a subsheaf over a region of the base
site, carrying its own per-observer rule system; because a sheaf section
is a compatible family, not stored state, its health must be recomputed,
never cached (SHRIMP Ecology Brief v2, GLASS-SPONGE row,
`.../semiotic-computer-system-services-section/content/text/documents/articles/notes/2026/08/19/shrimp-ecology-brief-v2.md`).
Division has concrete, reusable estate-native math: the Eigen error
threshold (`u < ln σ / L`, the mutation-rate ceiling above which heritable
information delocalizes) and Weismann's barrier (a daughter's committed
state descends only from settled parent state, never transient working
state), both stated and explicitly *not* over-claimed in the physarum-
zeosemiocenum note
(`.../semiotic-smart-material-services-section/content/text/documents/articles/notes/2026/07/25/2026-07-25-note-on-physarum-zeosemiocenum-system-specification.md`,
§9). Death has two independent registers: literal, programmed cell death
— a stageable state machine (vacuolization, collapse, organelle digestion,
shrinkage, corpse), documented with primary citation via bamboo's
intercalary pith cavity (Guo et al. 2019, *Plant Biotechnology Journal*)
— and a structural register, permanently-⊥ cells at the Lorentzian void
cone's apex, cells that can never again receive evidence, read against
"informational amyloid death," total crystallization with no protected
whirling defect left to keep any part of the state space molten. A
simulator can encode "the cell is dead" as either terminus, and they are
genuinely different failure semantics for the same word, not two
descriptions of one mechanism.

## 3. Nearest formal kin: P systems and brane calculi, and what neither has

Against the four active public lineages, a simulator built this way does
not compete with Karr-style mechanism (it is not fitting a real organism's
biochemistry), VCell (it is not a general reaction-diffusion solver), or
the AI-virtual-cell program (it is not learned from single-cell
measurement data at all). Its real neighbors are the two formalisms that
already treat the cell as a computational object rather than a numeric
one, and reading the comparison carefully is the actual argument for
building a third thing rather than adopting one of the existing two.

**P systems are the closer kin structurally.** Both are built from nested,
bounded regions holding contents and governed by local rules, and both
treat the membrane arrangement itself as doing real work rather than as
passive packaging — this is directly the organelle-as-subsheaf reading
above. But a P-system membrane is permeable by rule-application alone: an
object crosses because some rule says "send this out," with no notion of
the membrane itself judging or admitting the object based on what it *is*
epistemically. Symbolic multiset rewriting abstracts molecular recognition
away entirely. A membrane-as-admission-predicate design restores exactly
what P systems set aside.

**Brane calculi are the closer kin in spirit.** Cardelli's explicit point
— computation belongs to the membrane surface, two-sided, not to the
volume it bounds — is structurally the same claim an admission-predicate
membrane makes, and the local-a2a-membrane pattern's "gated boundary,
content-addressing everything that crosses" is a genuine, if informal,
instance of a two-sided membrane computation. What brane calculi lack is
any treatment of uncertain or contradictory internal state: PEP and MBD
are classical rewriting systems where an object's presence or absence is
a fact, not a claim with a truth-value a paraconsistent logic must
reconcile. A brane-calculus membrane interaction either fires or it
doesn't; there is no notion of a metabolic process resolving a *conflict*
between incompatible readings of cell state.

**The genuine novelty**, stated plainly rather than oversold: not the
membrane structure — P systems and brane calculi got there first, decades
ago — but treating metabolism itself as an epistemic settling process
over a state that is allowed, for a time, to disagree with itself. No
formalism surveyed, public or estate-native, combines a membrane that
evaluates admission epistemically with an interior whose state is
paraconsistent and whose "reaching equilibrium" is a proved fixed-point
closure with a classified difficulty ladder. That combination is what
rung 6 of the estate's own complexity ladder was already describing before
any simulator existed to test it, and it is what the paradigm-case claim
of §0 actually cashes out to: not that the cell is *like* a computer, but
that the specific computational structure this corpus has spent its
mathematics on — bounded admission, paraconsistent charge, settling
closure — is one nature had already built, at rung 6, before anyone
engineered a version of it.

## 4. What is missing, honestly

Two gaps carry over directly from the estate-cell-math survey and matter
for what a simulator can and cannot yet claim. First, `RReal`, the
real-number type the reaction-network Lean theorems are proved over, is a
Lean-internal constructive-reals type not yet bound to any runtime float
— the chemistry math is proved, not yet executable. Second, no enzyme
kinetics beyond raw mass action exists anywhere in the estate's math
(no Michaelis–Menten, cooperativity, or allosteric regulation), and no
signaling-cascade-specific model exists beyond the general reaction-
network substrate that could in principle encode one. Both gaps are
exactly the kind of thing the public field's oldest and most literal
tools already solve well — SBML's kinetic-law vocabulary and VCell's
six solver treatments are mature, validated engineering for precisely
this problem — which is the honest argument, developed further in the
natural-computer-simulation-engine design document, for borrowing SBML awareness and
validation discipline from the mechanistic lineage even while building
something that is not a mechanistic simulator in the Karr sense.

## Sources

Public field: Karr et al., *Cell* 150(2):389–401 (2012);
Tomita, *Trends in Biotechnology* (2001); Macklin et al., *Science* 369
(2020); Thornburg, Bianchi et al., *Cell* 185(2):345–360 (2022); Ye et al.
WM_S288C (2020); "Multi-scale models of whole cells," *Frontiers in Cell
and Developmental Biology* (2023); Schaff et al., *Biophysical Journal*
(1997), vcell.org; Bunne et al., arXiv:2409.11654, *Cell* (2024); scGPT
(2023); Geneformer (Theodoris et al.); PertEval-scFM, arXiv:2410.13956;
Arc Institute Virtual Cell Challenge, *Cell* (2025); CZI Virtual Cells
Platform, arXiv:2507.10502; Păun, "Computing with Membranes" (1998),
*Membrane Computing: An Introduction* (2002); Cardelli, CMSB 2004/*LNCS*
3082 (2005); Regev, Silverman, Shapiro (2001); Regev & Shapiro (2004);
Stiles & Bartol, MCell (1991); Andrews, Smoldyn (2004); Agmon et al.,
*Bioinformatics* 38(7):1972 (2022); arXiv:2408.00942; arXiv:2512.23754.

Estate: full path index in `estate-cell-math.md`
(`natural-computer-simulation-engine/dev/research/estate-cell-math.md`);
the complexity-ladder rung-6 claim, `2026-07-28-gemini-notebook-studio-report-
the-sovereign-actor-...md` and its Unionification-tower companion,
`services/science-services-section/content/text/documents/articles/notes/2026/07/28/`;
the natural-computing-science topic document and its founding note, this
section's own `content/text/glossary/topics/natural-computing-science.md`
and `content/text/documents/articles/notes/2026/08/21/2026-08-21-note-on-
six-engineering-programs-from-the-silica-tetralogy.md`.
