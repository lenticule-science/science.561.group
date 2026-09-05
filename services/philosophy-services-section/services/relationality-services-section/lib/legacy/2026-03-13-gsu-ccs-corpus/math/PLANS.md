# math/PLANS.md

Active workflows and committed work queue for the math/ department.
For proof assistant work see `proof/PLANS.md`.

---

## Open Work

### section-reference-migration

**Added:** 2026-03-17
**Status:** open
**Action:** Replace every `§anchor-id` sigil reference in `math/*.md` and `math/skills/*.md` with standard markdown links `[anchor-id](file.md)`. Scope: ~250 unit files. Batch by file or alphabetical range.
**Why:** `links-not-sigils` principle (root SOUL.md). Sigil syntax is non-clickable and non-standard.

---

## Standing Conventions

### The Three-Perspective Rule

Every canonical name must work from all three perspectives simultaneously.

- **Below** (constitutive): what the thing is made of — generators, components, construction
- **Same level** (structural): what the thing IS at its own level — its algebraic or categorical identity
- **Above** (functional): what the thing does or is for — its role in the structure above it

A name valid from only one perspective is naming debt. Find the word that answers all three.

| Candidate | Below | Same level | Above | Verdict |
|---|---|---|---|---|
| "history" | ✓ constituted by steps taken | ✓ commutation class of step sequences | ✓ stage at which H_t is evaluated | **PASSES** |
| "trace" | ✓ quotient of Σ* | ✓ Mazurkiewicz term | ✗ collides with categorical traces | **FAILS** |

### Vocabulary

- "diamond" for the abstract confluence property (not "Diamond Lemma," not "Church-Rosser")
- "history monoid" for M(Σ,I) (not "trace monoid")
- "confluence" for the abstract rewriting property — as-is
- `π_t = σ_t ∘ Δ_t` is the **joint projection** — always cite §joint-projection. It appears under four deprecated aliases that are active naming debt: "stabilization map" (§stabilization, §invariant-locale), "canonical retraction" (§canonical-retraction), "semantic normalizer" (§normalization), "fiber closure" (§closure-generation). Each of those files should cite §joint-projection for the map definition; the alias is a context-name, not a re-definition.

---

## Naming Debt

**Standing rule:** math symbols belong only in math blocks. Every named object needs
a canonical English name usable in prose.

**Open — undefined symbols:**
- $J_\mathcal{H}$ — the hyperversal Grothendieck topology; cited but never defined; open gap
- $\Pi_\to$, $\nabla_\leftarrow$ — shape and codiscrete functors in [ambidexterity.md](ambidexterity.md); speculative

---

## Open Math Gaps

### Naming-resolved gaps (prerequisite for the computational program)

The following gaps were made explicit by separating previously conflated notions.
They are prerequisite for the Hurwitz-Zeno computational program.

**Sheafification Fiber Preservation** (`raw-new-modes-presheaf.md`)
Does sheafification of $N_{[k]}^{\mathrm{raw}}$ preserve the fibers $K^{d_{k-1}}$
at every history $t \in T$? The sheaf condition in the commutation topology may
collapse fibers to zero at covered objects when restriction maps are zero. Until this
is settled, Čech computations using "zero restriction maps" address
$H^1(T,J;\,N_{[k]}^{\mathrm{raw}})$, not $H^1(T,J;\,N_{[k]})$.

**Zero-Restriction of the Sheaf** (`raw-new-modes-presheaf.md`)
Related: are the restriction maps of $N_{[k]}$ (the sheaf cokernel) zero? The
zero-restriction property is clear for $N_{[k]}^{\mathrm{raw}}$; it is not
automatic after sheafification.

**Local-to-Global Fibonacci** (`depth-new-modes.md`)
The equality $\dim H^1_{\mathrm{depth}}(k) = d_{k-1}$ is a claim, not a consequence
of the fiber dimension formula. A proof requires knowing the actual fibers of
$N_{[k]}$ (not $N_{[k]}^{\mathrm{raw}}$) and a Čech computation over the full history
site. These are now separate tasks, not a single computation.

**Growth-to-Collapse Inversion** (`fiber-binarity.md`)
The sequence $d_n = \dim H_\mathbf{U}^{(n)*}$ grows as Fibonacci, yet Fiber Binarity
conjectures $|H_\mathbf{U}^\mathcal{H}| = 2$ at the colimit. What is the mechanism
by which growing finite fiber algebras collapse to $\mathbf{2}$? No existing file
accounts for this inversion.

**Fiber Binarity vs. Booleanness** (`fiber-binarity.md`, `modal-collapse.md`)
Fiber Booleanness and Fiber Binarity are now distinct named conjectures. What
additional condition strengthens Booleanness to Binarity? The chain
$\text{Binarity} \Rightarrow \text{Booleanness} \Rightarrow \text{Nuclear Triviality}$
is strict; the reversal conditions are open.

### Ground level (Section A — should be closed)

**Step-fiber aperiodicity gap** (`step-fiber-aperiodicity.md`)
History Separation as automorphism-reflection is not strong enough to prove
$H_t \not\cong H_{s^n \star t}$. Two routes to close it:
1. Strengthen the axiom to object-faithfulness (strong form of separation).
2. Depth-complexity growth argument: $H_{s^n \star t}$ has strictly greater depth than $H_t$.
The file records the gap honestly; it should not be cited as settled until one route is executed.

**Initiality uniqueness** (`initiality.md`)
Existence of the initial universe is proved (Lean: `Initiality.lean` 2026-03-14).
Uniqueness requires a relational faithfulness axiom not yet stated. Gap is live.

**Commutativity from Syntactic Completeness** (`fiber-nuclear-language-commutativity.md`, `nucleus-commutation.md`)
The nucleus commutation axiom (σ_t ∘ Δ_t = Δ_t ∘ σ_t) is currently imposed as a primitive
fiber axiom. It can be derived as a theorem if syntactic model completeness holds *without*
commutativity: i.e., if every abstract structure satisfying the other fiber axioms embeds
faithfully into FML₀. Since Saturate∘Transfer = Transfer∘Saturate is a theorem of FML₀ ([fiber-nuclear-language-commutativity](fiber-nuclear-language-commutativity.md),
pending critical-pair check), the axiom would then be inherited from the embedding.
**Non-circularity constraint**: the completeness proof must not use the commutativity axiom
at any point. This rules out most standard Lindenbaum-Tarski completeness arguments (which
assume all axioms hold in the algebra). A dedicated construction is required.
When proved: update `nucleus-commutation.md` to mark commutativity as a theorem; demote it
from the fiber doctrine's list of primitive conditions.

**Transfer-Topology Correspondence** (`transfer-nucleus.md`, `commutation-topology.md`, `locality.md`)
Both $\Delta_t$ and $J$ are generated by the same independence relation $I \subseteq \Sigma \times \Sigma$:
$\Delta_t$ uses $\{s \in \Sigma : s \perp t\}$ algebraically (intersection of restriction-map images
from independent one-step extensions); $J$ uses the same set geometrically (covers by step-set-disjoint
sub-histories). The Axiom of Locality — $H$ is a sheaf for $J$ — is the coherence condition connecting
them. Theorem to prove: $J$ is canonically determined by the transfer nucleus structure, in the sense
that a family $\{t_i \to t\}$ is a $J$-cover iff the induced map from $\mathrm{Fix}(\Delta_t)$ into
$\prod_i \mathrm{Fix}(\Delta_{t_i})$ is an isomorphism (a sheaf condition phrased entirely in terms
of nuclei). Note: locality.md states $H_{h \cdot s} \cong H_h \times_{H_e} H_s$ (fiber product over
$H_e$); this is correct and is why restriction-map images need not be all of $H_h$, making $\Delta_t$
non-trivial. The same correspondence holds at each hyperverse tower level: profile topology
$J^{(n+1)}$ and the meta-transfer nucleus are related by the identical pattern.

### Tower level (Sections B–E — conjecture territory)

These are open conjectures; the files record them honestly. Work here is exploratory.

- `fiber-nuclear-language-commutativity.md` — analogous commutativity theorems for the level-n nuclear language at each tower level; open. (Fiber level closed 2026-03-16.)
- `commutativity-from-diamond.md` — deriving σ∘Δ = Δ∘σ from the diamond of M(Σ,I).
  **Partial result (2026-03-16):** at single-Foata-block histories, Locality gives σ_t = id
  and commutativity is trivial. **Diagnosis (2026-03-16):** the proposed strategy of
  "interchange of limits over the diamond diagram" is structurally blocked: the Locality axiom
  is vacuous exactly at the histories where σ_t is non-trivial (connected dependency poset,
  no non-trivial J-cover). The Diamond Lemma constrains only upward structure (domain of Δ_t)
  while σ_t is a downward operation; no interchange principle applies across opposite directions.
  Three remaining routes documented in the file: (1) remain an axiom; (2) derive from History
  Separation; (3) derive from syntactic model completeness.
- `modal-collapse.md` — three conditions for nuclei becoming trivial at the colimit; all unproved.
- `emergent-commutativity.md` — hyperverse-level commutativity from iterated tower diamonds; open.
- `hyperverse-terminality.md` — $\mathcal{H}$ terminal in faithful relational universes; open.
- `recursive-ambidexterity.md` — requires Beck-Chevalley tower at ∞-categorical level; open.
- `instability-width-tower.md` — width decreases at rate $\varphi^{-1}$; open.
- `syntactic-collision-promotion.md` — kernel of level-n map generates level-(n+1); open.
- `tower-entanglement.md` — entanglement monotone non-decreasing in tower level; open.
- `convolution-tower-commutativity.md` — interchange law for adjacent tower convolutions; open.
- `patch-adjoint-restriction.md` — four-adjoint chain restricts cleanly to patches; open.
- `golden-rigidity.md` — three independent constraints on φ are mutually equivalent; open.
- `completeness-tower-stratification.md` — FML₀-incomplete elements exactly those first expressible
  at next tower level; open.
- `step-fiber-aperiodicity.md` — see Ground level above.
- `hull-truncation-tower.md` — interplay grid $R^{(n),(r)} = U_\mathcal{H}^n(R^{\text{hull},(r)})$; commutativity of the two towers in the limit; open.

---

## Computational Goal — Verify the Hurwitz-Zeno Conjecture

**Goal.** Compute $\dim H^1_\mathrm{tower}(k)$ for $k = 0, 1, 2, 3$ for the simplest
concrete relational universe and verify that $F_k \cdot \dim H^1_\mathrm{tower}(k)$
converges to $C/\sqrt{5}$ (§hurwitz-zeno-conjecture). This would determine $C$ and
confirm the Diophantine–cohomological correspondence.

**What is confirmed.** The Diophantine side is verified: $F_k|\varphi - F_{k+1}/F_k|
= \varphi^{-k}$ exactly, and $F_k^2|\varphi - F_{k+1}/F_k| \to 1/\sqrt{5}$.

**The fiber algebra model is settled: Option B (syntactic model).** The fiber $H_t$
is the Lindenbaum–Tarski algebra of $\mathrm{FML}_0$ closed terms at $t$, generated
purely from $\{\mathsf{True}, \mathsf{False}\}$ with no additional atomic propositions.
All three previously open inputs are resolved:

1. **The primitive propositions** are $\mathsf{True}$ and $\mathsf{False}$ only. No
   atoms per step. The fiber algebra is not richer at the base; the non-trivial
   structure emerges as depth grows — more $\mathrm{FML}_0$ normal forms survive the
   context equations at each depth level. From the perspective of the operator above,
   every proposition at the level below reduces to true or false; the Heyting structure
   is the nuclear quotient of this binary base.

2. **The restriction maps** are syntactic reindexing: the map $H_{s \star t} \to H_t$
   sends $[M]_{s \star t} \mapsto [M]_t$ (the same normal form, evaluated at $t$). This
   is well-defined because the reduction system R1–R19$'$ is context-independent; the
   context equations at $t$ (e.g.\ $\mathsf{Saturate}(M) \equiv \mathsf{True}$ at $t = \epsilon$)
   are additional collapses on top of the shared normal form.

3. **The nuclear operations** are $\sigma_t = \mathsf{Saturate}$ and $\Delta_t = \mathsf{Transfer}$
   from $\mathrm{FML}_0$, exactly as specified. No further concretization is required.

The non-trivial Fibonacci growth (§nuclear-fibonacci-recurrence) is a consequence of
depth iteration: at depth $k$, the context equations at $\epsilon$ (and all
sub-histories) leave exactly $F_{k+1}$ surviving doubly-stable normal forms, because
the depth-$k$ diamond cover constrains $\mathsf{Transfer}(\mathsf{False})$ to survive as a
new doubly-stable element only when the full covering family is present.

**Candidate monoid.** The diamond monoid $\mathbb{N}^2$ (step set $\{a,b\}$ with
$I = \{(a,b)\}$, i.e., $a$ and $b$ commute) is the simplest case with a non-trivial
Grothendieck topology. The free step-sequence monoid on $\{a,b\}$ has trivial topology and gives
$H^1 = 0$ everywhere (tree structure, no cohomological obstructions). The Fibonacci
shift is more natural for the golden ratio structure but harder to implement.

**Implementation plan.** ~100 lines of Python: enumerate $\mathrm{FML}_0$ normal
forms at each depth up to $k$, apply the context equations to determine which
collapse at each history, compute the new-modes sheaf $\widetilde{N}_k$ fiberwise,
and run a Čech cohomology computation for the diamond cover.

---

## Lean Synchronization

Current Lean state summary (see `proof/PLANS.md` for detail):

**Sorry-free:** Core chain through `SyntacticRelationalUniverse.lean` and
`NormalizationStrong.lean`. Initiality existence done.

**4 active sorries:**
- `HistoryUniversality.lean` — `left_cancel_single` trans case (~250 lines, Lean engineering)
- `NormalizationCompleteness.lean` — `localConfluence` (~300 lines, **Lean engineering** — the math is in §strong-normalization; all critical pairs are checked there)
- `NormalizationCompleteness.lean` — `confluence` (Newman's Lemma, pending `localConfluence`)
- `NormalizationCompleteness.lean` — `canonical_forms_mpr` (pending `confluence`)
- Initiality uniqueness — relational faithfulness axiom not yet stated

**Stubs (no Lean content yet):** spectral, dynamics, and all tower-level files.

The critical path to closing the ground-level Lean proof:
`localConfluence` → `confluence` → `canonical_forms_mpr` → completeness.
