---
type: question
class: bridge
status: partial
explores:
  - felber-et-al2025
  - unified-distributed-systems-cohomology
  - d-frame
  - d-frame-valued-sheaf
  - cohomological-calm
  - crdt-convergence-via-mayer-vietoris
  - bilattice-network-sheaf-consensus
  - network-sheaf-consensus-on-agent-graphs
---

# Felber task sheaf — d-frame translation

[@felber-et-al2025] characterizes terminating task solvability in distributed systems via a *task sheaf* on a *system slice*: a task is terminating-solvable iff the task sheaf has a global section (their Theorem 20). The cohomology of the task sheaf — computed by lifting from set-valued stalks to $\mathbf{Ab}$-valued via the free abelian group functor — encodes the obstructions to solvability.

The corpus's [unified distributed-systems cohomology question](unified-distributed-systems-cohomology.md) Sub-question 1 asks whether d-frames is a common enriching category for both the corpus's settling-cohomology side (which natively values in $\mathbf{Ab}$ or $\mathbf{dFrm}$) and Felber's task-sheaf side. This question is the working space for engaging that sub-question directly, in the same pass-by-pass shape as the [per-fiber Curry working question](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/per-fiber-curry-on-clopen-lattice-fiber.md) and the [Hansen–Ghrist spectral engagement question](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/hansen-ghrist-spectral-engagement.md).

## Setup: Felber et al's task sheaf precisely

Felber et al work in the following category (their Definitions 7, 14, 17, 19, 22, 23; Theorem 20):

**A system $\Pi$** is a finite set of processes communicating by messages. A **run** $\rho = (g_t)_{t \in \mathbb N}$ is a sequence of global configurations. The **execution graph** $E$ has vertices $V(E) = \{g_t : \rho \in \Sigma\}$ and directed causal edges. Each process $p \in \Pi$ has an **indistinguishability relation** $\sim_p$ on $V(E)$: $g \sim_p h$ iff $p$ has the same local state in $g$ and $h$.

**A task** $T = (I, O, \Delta)$ is a triple where $I, O$ are sets of input/output vectors (indexed by processes; chromatic simplicial complexes in the topological version) and $\Delta : I \to 2^O$ specifies valid outputs per input.

**A system slice** $S_A = (C, \{\sim_p\}_{p \in \Pi})$ for terminal execution cut $A$ has $C = \mathrm{ccl}(N(A))$ — the causal closure of the local star. As an undirected graph: vertices = configurations in $C$, edges $(g, h)_p$ = indistinguishability pairs labeled by process $p$. As a cellular category $\mathrm{Cell}(S_A)$: 0-cells = vertices; 1-cells = edges; arrows $v \to e$ for each incidence.

**The task sheaf** $\mathcal F_{S, T}$ is a cellular sheaf on $\mathrm{Cell}(S_A)$ defined (Definition 17):

- Stalk at configuration $g$: $\mathcal F_{S, T}(g) = \Delta(I(g))$ — the set of valid output vectors for input $I(g)$.
- Stalk at indistinguishability edge $(g, h)_p$: $\mathcal F_{S, T}((g, h)_p) = \{\pi_p(x) : x \in \Delta(I(g)) \cap \Delta(I(h))\}$ — possible values process $p$ can decide on at either endpoint.
- Restriction $\mathcal F_{S, T}(g) \to \mathcal F_{S, T}((g, h)_p)$ is $\pi_p$ — projection onto process $p$'s component.

A **section** (Definition 19) is a choice $s_\sigma \in \mathcal F_{S, T}(\sigma)$ for each cell satisfying the restriction-coherence: $\mathcal F_{S, T}(s_g) = s_{(g,h)_p}$ for $g \lhd (g, h)_p$, and the analogous equality for $h$. In task-language: a global decision map agreeing on indistinguishable configurations.

**Theorem 20 (Terminating Task Solvability).** *A task $T$ is terminating-solvable by $\Pi$ iff there exists an execution cut $A$ such that the task sheaf $\mathcal F_{A, \Delta}$ on the system slice $S_A$ has a global section.*

For cohomology, Felber et al lift the set-valued task sheaf to $\mathbf{Ab}$ via the free-abelian-group functor $\mathbb Z[-]$ (their pipeline $\mathrm{Cell}(X) \xrightarrow{\mathcal F} \mathbf{CSet} \xrightarrow{\mathbb Z} s\mathbf{Ab} \xrightarrow{\partial^n} \mathrm{Ch}_{\mathbb Z} \xrightarrow{H^n} \mathbf{Ab}$). The **coboundary** (Definition 23) at edge $e = (g, h)_p$ is

$$d(x)_e = \pi_p(x_h) - \pi_p(x_g),$$

an alternating sum after lifting to $\mathbb Z$-coefficients. The **zeroth cohomology** (Definition 24) is $\ker d$; by Theorem 20, this is the set of decision maps solving $T$ on slice $A$.

## The question

Sub-question 1 of the [unified distributed-systems cohomology question](unified-distributed-systems-cohomology.md) asks whether d-frames is a common enriching category for the corpus's settling-cohomology and Felber's task sheaves. This question pursues the answer directly: identify the natural value category of Felber's task sheaf as it appears in the paper (before the lift to $\mathbf{Ab}$ for cohomology computation), and assess whether d-frame translation is a definitional move (yes, with structural extension) or an obstruction (no, the value category resists it).

## Progress log

### Pass 1 (Felber's stalks live in $\mathbf{Frm}$, not just $\mathbf{Ab}$) — done

Felber's task-sheaf stalks are *subsets of a fixed output set*: $\mathcal F_{S, T}(g) \subseteq O$ (where $O$ is the global output simplicial complex), and $\mathcal F_{S, T}((g, h)_p) \subseteq O_p$ (the per-process output set). The frame structure on $\mathcal F_{S, T}(g)$:

- $\bot = \emptyset$, $\top = \Delta(I(g))$ (the full valid-output set for input $I(g)$).
- Meet $\wedge =$ set intersection.
- Join $\vee =$ set union.
- Distributivity holds because $\Delta(I(g))$ is a powerset of a finite set.

The restriction map $\pi_p : \mathcal F_{S, T}(g) \to \mathcal F_{S, T}((g, h)_p)$ is the projection-induced subset map: for $A \subseteq \Delta(I(g))$, $\pi_p(A) = \{\pi_p(x) : x \in A\}$. This **preserves $\vee$** (image of union = union of images) and **preserves $\bot$** (image of empty set = empty set). In general it does *not* preserve $\wedge$ (image of intersection $\subseteq$ intersection of images, with strict inclusion possible when distinct $x, y$ have $\pi_p(x) = \pi_p(y)$). So the restriction maps are **frame morphisms in the strong-adjoint sense** — they are **left adjoints** preserving arbitrary joins, but not in general right adjoints (do not preserve all meets).

This is consistent with Felber's section condition: a section requires the restrictions to *agree*, not to preserve all algebraic structure. The obstruction to a section is, in frame terms, a failure of the restriction-induced join projections to land in a common point of the codomain frame.

**Pass 1 result.** *Felber's task-sheaf stalks are frames (powersets of output sets); restrictions are frame morphisms preserving joins and bottom but not arbitrary meets. The lifting to $\mathbf{Ab}$ via $\mathbb Z[-]$ is a technical move for the cohomology computation, not a structural feature of the task sheaf. The natural value category is $\mathbf{Frm}_{\vee}$ — frames with $\vee$-preserving morphisms.*

This already partially answers Sub-question 1 of the [unified distributed-systems cohomology question](unified-distributed-systems-cohomology.md): both the corpus's settling-associated sheaf (frame-valued via the powerset frame on cells) and Felber's task sheaf (frame-valued via the powerset frame on outputs) live in $\mathbf{Frm}_\vee$. *The settling and task frameworks share a value category at the frame level*, before the lift to $\mathbf{Ab}$. The corpus has been thinking of its frame-valued material as one half of a d-frame; identifying Felber's setting as also frame-valued opens the d-frame-translation question of Pass 2.

### Pass 2 (d-frame extension of Felber's task sheaf) — partially done

Felber's framework treats validity classically: $\Delta(I(g)) \subseteq O$ is the set of *valid* outputs; outputs not in $\Delta(I(g))$ are *invalid*. There's no native distinction between "no information about output $o$" and "explicitly excluded output $o$" — both are simply $o \notin \Delta(I(g))$.

A **d-frame-valued task sheaf** $\mathbb F_{S, T}$ would assign to each configuration $g$ a d-frame:

$$\mathbb F_{S, T}(g) = (\Delta^+(I(g)),\ \Delta^-(I(g)),\ \mathrm{con}_g,\ \mathrm{tot}_g)$$

where:

- $\Delta^+(I(g)) \subseteq O$ — outputs *positively designated as valid* for input $I(g)$.
- $\Delta^-(I(g)) \subseteq O$ — outputs *positively designated as invalid* for input $I(g)$.
- $\mathrm{con}_g \subseteq \Delta^+(I(g)) \times \Delta^-(I(g))$ — pairs $(o^+, o^-)$ such that no specific output $o$ is co-witnessed in both. *Con-failure* records paraconsistency: an output simultaneously asserted as valid *and* invalid.
- $\mathrm{tot}_g \subseteq \Delta^+(I(g)) \times \Delta^-(I(g))$ — pairs whose joint $\Delta^+ \cup \Delta^-$ covers $O$. *Tot-failure* records *underdetermination*: an output with no valid/invalid judgment at all.

Restrictions $\mathbb F_{S, T}(g) \to \mathbb F_{S, T}((g, h)_p)$ are d-frame morphisms — pairs of frame morphisms (one for $\Delta^+$, one for $\Delta^-$) preserving the relations.

The four bilattice values then correspond to Belnap's four (per the [bilattice-prelims-opener narrative](../narratives/bilattice-prelims-opener.md)):

| pair $(o \in \Delta^+, o \in \Delta^-)$ | bilattice value |
|---|---|
| (yes, no) | $\mathbf t$ — output $o$ is valid |
| (no, yes) | $\mathbf f$ — output $o$ is invalid |
| (yes, yes) | $\top$ — output $o$ is paraconsistently both |
| (no, no) | $\bot$ — no information about $o$ |

This refines Felber's classical setting in the obvious way: the original $\Delta(I(g))$ is the $\mathbf t$-component of the d-frame, and Felber's "outputs not in $\Delta(I(g))$" is the union of $\mathbf f$, $\top$, and $\bot$ — the d-frame *distinguishes* these where Felber's classical setting collapses them.

**Section under d-frame extension.** A d-frame section $s$ is a per-configuration assignment $s_g = (s_g^+, s_g^-) \in \Delta^+(I(g)) \times \Delta^-(I(g))$ such that restrictions agree on indistinguishability edges componentwise, *and* the assignment respects the $\mathrm{con}, \mathrm{tot}$ relations cell-by-cell.

This is a strict refinement of Felber's section condition: every Felber-section (treating the classical $\Delta$ as $\Delta^+$ with $\Delta^- = O \setminus \Delta^+$) is a d-frame section, but not every d-frame section is a Felber-section in the classical sense — d-frame sections may *deliberately leave $\bot$-content* (no judgment) at some outputs, which Felber's binary classification cannot represent.

**Solvability under d-frame extension.** The natural lift of Felber's Theorem 20:

> *A task $T$ is terminating-solvable* in the **paraconsistent sense** *(i.e., processes may decide on outputs about which there is no positive evidence either way, but cannot decide on outputs that are positively excluded) iff there exists an execution cut $A$ such that the d-frame task sheaf $\mathbb F_{A, \Delta}$ has a global section in the d-frame sense.*

This statement is the proposed d-frame analog of Theorem 20 — its proof would mirror Felber's (forward: a paraconsistent decision map gives a d-frame section; backward: a d-frame section gives a paraconsistent decision map). Pending: actually carrying out the proof at corpus's structural-rigor level. **Status: conjectural; the construction is structurally clean but the proof has not been written.**

**Cohomology under d-frame extension.** Lift componentwise via the [d-frame cohomology comparison theorem](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-cohomology-comparison.md): the shadow functor $\mathbb S : \mathbf{dFrm} \to \mathbf{Ab} \times \mathbf{Ab}$ sends the d-frame task sheaf $\mathbb F_{S, T}$ to a pair of $\mathbf{Ab}$-valued task sheaves $(\mathcal F^+_{S, T}, \mathcal F^-_{S, T})$, on each of which Felber's cohomology pipeline applies. The d-frame cohomology has the shadow components plus consistency/totality relations inherited from the sheaf level, exactly parallel to the situation in the [bilattice network-sheaf consensus theorem](../theorems/bilattice-network-sheaf-consensus.md).

**Pass 2 result (provisional).** *D-frame extension of Felber's task sheaf is structurally available: the construction parallels the d-frame extension of network sheaves on agent graphs (the [bilattice network-sheaf consensus theorem](../theorems/bilattice-network-sheaf-consensus.md)). The proposed d-frame Theorem 20 statement is conjectural — the proof has not been carried out, but the structural pieces are in place. The d-frame setting refines Felber's classical setting by distinguishing $\mathbf f$ (positive invalidity) from $\bot$ (absence of evidence) from $\top$ (paraconsistent over-evidence).*

**What this gains over Felber's classical setting:**

- **$\bot$-tolerant solvability.** A task may admit a d-frame section that leaves some outputs unjudged ($\bot$), where the classical Felber setting requires a definite valid/invalid decision per output. Useful in distributed knowledge-base settings where partial information is the realistic case.
- **$\top$-aware obstruction analysis.** Where Felber's coboundary $\delta^0 \neq 0$ records "no section exists," the d-frame coboundary records *which outputs are co-witnessed as both valid and invalid* — locating the obstruction at the specific output, not just at the slice level.
- **Per-process bilattice judgment.** Each process can independently maintain bilattice-valued output evaluations, with consensus computed via d-frame join (as in the [bilattice network-sheaf consensus theorem](../theorems/bilattice-network-sheaf-consensus.md)). The classical Felber setting forces agreement-or-failure; the d-frame setting allows graded per-process disagreement.

### Pass 3 (cohomological CALM analog for task sheaves — Sub-question 2) — open

Sub-question 2 of the [unified distributed-systems cohomology question](unified-distributed-systems-cohomology.md) asks whether [cohomological CALM](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/cohomological-calm.md) generalizes to the task-sheaf side. The conjecture: task solvability corresponds to obstruction vanishing in some Mayer–Vietoris sequence on the task-sheaf side, with cohomological-CALM-compatibility being a natural analog.

**Setup.** Felber's $H^0(\mathcal F_{S, T}) = \ker D$ characterizes solvability: nonzero iff a section exists. The corpus's [CRDT convergence via Mayer–Vietoris theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/crdt-convergence-via-mayer-vietoris.md) characterizes coordination-freeness: $\delta^0 = 0$ on every replica cover. Both characterize *some* property of the global structure via cohomology, but they characterize *different* properties:

- Felber: existence of a section on a *particular* slice (the system slice $S_A$ for some chosen execution cut $A$).
- Corpus: vanishing of obstruction *across all replica covers* — a uniform property.

**The proposed task-sheaf CALM analog.** A task sheaf $\mathcal F_{S, T}$ is **CALM-compatible** if for every refinement of system slice $S_A \subseteq S_{A'}$ (where $A'$ is a finer terminal execution cut), the inclusion-induced map $H^0(\mathcal F_{S_{A'}, T}) \to H^0(\mathcal F_{S_A, T})$ is surjective — i.e., every solvability witness on a coarser slice extends to a witness on every refinement. Equivalently: the Mayer–Vietoris connecting homomorphism $\delta^0 : H^0(\mathcal F_{S_A \cap S_{A'}, T}) \to H^1(\mathcal F_{S_{A''}, T})$ vanishes for every pair of slices $A, A'$ on a common refinement $A''$.

This is a *stronger* property than Felber's solvability: it asks not just that *some* slice has a section, but that solvability is *robust under slice refinement*. Distributed-systems intuition: a task is CALM-compatible (in this sense) iff it can be solved by *monotone* protocols — protocols that don't have to backtrack as the execution graph grows.

**Conjecture (open).** *A task $T$ is CALM-compatible iff its task sheaf admits a CALM-compatible decision map — i.e., a decision map that extends consistently as the execution graph deepens.*

The d-frame version of this conjecture (combining Pass 2 and Pass 3) is even stronger: the d-frame task sheaf's $\delta^0_\pm$ vanishes uniformly on each shadow component across all slice refinements iff the task admits a paraconsistent-monotone decision map.

**Status: conjectural; framework constructed in this question, theorem statement pending.**

### Pass 4 (mixed-system framework — Sub-question 3) — pre-open

Sub-question 3 of the [unified distributed-systems cohomology question](unified-distributed-systems-cohomology.md) asks for a cohomology of *mixed* systems combining state-evolution (CRDT) with discrete tasks (Herlihy / Felber). With Pass 1 establishing common $\mathbf{Frm}$-valuedness and Pass 2 establishing d-frame extension, the conditions for a mixed framework are:

- **Common base site.** A site combining the bitopological settling site with the system-slice cellular category $\mathrm{Cell}(S_A)$. Natural construction: the *product site* $(\mathcal C^{\mathrm{op}} \times \lambda^{\mathrm{op}}) \times \mathrm{Cell}(S_A)$ with the product Grothendieck topology. Whether this product is well-behaved enough for the corpus's existing cohomology theorems to apply is open.
- **Common value category.** D-frame-valued sheaves on the product site, by Pass 2.
- **Common cohomology pipeline.** Lifting the product-site sheaf via the shadow functor to a pair of $\mathbf{Ab}$-valued sheaves on the product site, then taking cohomology componentwise. Whether this commutes with the projection to either factor (settling-only, task-only) is open.

**Status: pre-open — the construction is not yet attempted; the structural pieces from Passes 1 and 2 establish the prerequisites for attempting it.**

## What's settled

- **Pass 1.** Felber's task-sheaf stalks live in $\mathbf{Frm}_\vee$ (frames with $\vee$-preserving morphisms). The lift to $\mathbf{Ab}$ via $\mathbb Z[-]$ is a technical computational move, not a structural feature. **This partially answers Sub-question 1 affirmatively at the frame level**: corpus's settling-cohomology and Felber's task-sheaves share a value category before either lifts to $\mathbf{Ab}$.
- **Pass 2 (provisional).** D-frame extension of Felber's task sheaf is structurally available as a refinement, paralleling the d-frame extension of network sheaves on agent graphs. **The d-frame analog of Felber's Theorem 20 is constructive but not yet proved** — it's the natural conjecture, with the structural pieces in place.

## What's open

- **Pass 2 completion.** Carry out the proof of the d-frame analog of Felber's Theorem 20 at the corpus's structural rigor level. The proof outline mirrors Felber's: forward (paraconsistent decision map ⇒ d-frame section) and backward (d-frame section ⇒ paraconsistent decision map). Should be a clean translation; the conjectural status reflects "not yet written" rather than "not yet structurally clear."
- **Pass 3 (CALM analog for task sheaves).** State and prove the cohomological-CALM-style theorem for task sheaves: monotone-solvability ⇔ uniform vanishing of slice-refinement Mayer–Vietoris. **Substantially open.**
- **Pass 4 (mixed framework).** Construct the product-site framework combining settling and task data; verify that corpus's cohomology theorems apply and produce sensible results on the product. **Pre-open** — Pass 3 is a prerequisite.
- **Worked instance: lossy-link consensus at the d-frame level.** Felber's Example 18, 21, 25 give worked instances of task sheaves on the lossy-link adversary. Computing the d-frame version explicitly would test the constructive content of Pass 2 on a non-trivial case.

## What's not in scope

- Felber et al's worked example (the $\epsilon$-agreement task with the lossy link) uses *real-valued* output vectors; their task sheaf inherits a real-vector-space structure on stalks. The d-frame extension as constructed in Pass 2 takes the *combinatorial / set-valued* aspect of Felber's framework, where stalks are subsets of a finite output set. The continuous case requires further machinery (likely Lopez 2024's fuzzy-adjoint extension; see [Hansen–Ghrist spectral engagement question](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/hansen-ghrist-spectral-engagement.md) Pass 3) and is out of scope here.
- Felber et al's assumption of *finite* slices is preserved here. Infinite slices (their Example 15, the tilted-consensus task) introduce additional infinitary-cohomology issues parallel to the corpus's transfinite-bounded and aperiodic regimes, but the d-frame translation in Pass 2 doesn't address them.

## Migration policy

As passes complete and findings consolidate, they migrate out:

- **Pass 1's "Felber's stalks are frame-valued" claim** is the headline structural result; it migrates to the [unified distributed-systems cohomology question](unified-distributed-systems-cohomology.md) Sub-question 1's progress section as the affirmative-at-frame-level answer.
- **Pass 2's d-frame extension** (when proved) becomes a new theorem `theorems/d-frame-task-sheaf-solvability.md`, citing Felber's Theorem 20 as input and the [d-frame cohomology comparison theorem](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-cohomology-comparison.md) for the cohomological side.
- **Pass 3's CALM analog** (when stated and proved) becomes a new theorem `theorems/cohomological-calm-for-task-sheaves.md`, paralleling the existing [cohomological CALM theorem](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/cohomological-calm.md).
- The [Felber et al 2025 reference annotation](../references/felber-et-al2025.md) gets updated to reflect Pass 1's value-category finding (currently listed as a "difference" but actually a *shared* feature once the technical lift to $\mathbf{Ab}$ is recognized as such).

This question stays `partial` until Passes 2 (proof) and 3 (theorem statement) are settled. Pass 4 may spawn its own working question if the construction grows beyond the present scope.

## Position in the swarm-theory program

This question is **task 4 of the [agentic-swarm-theory study plan](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/toward-agentic-swarm-theory.md)** — the engagement with Felber et al 2025 via the [unified distributed-systems cohomology](unified-distributed-systems-cohomology.md) question. The plan flagged it as "Direct mathematical work: study Felber's task-sheaf construction in detail, identify its value-category structure, attempt to express it as a d-frame specialization. Concrete deliverable: a progress note attached to the existing question, with either positive evidence (a candidate translation) or a structural obstruction."

The deliverable is **positive evidence**: Felber's stalks are frame-valued (Pass 1), d-frame extension is structurally available (Pass 2), and the cohomological-CALM analog is statable on this footing (Pass 3). The remaining work in Passes 2–4 is substantive but follows a clear path, not a research-program-scale exploration.

The output of this question feeds back into:

- The [unified distributed-systems cohomology question](unified-distributed-systems-cohomology.md), which can have its Sub-question 1 promoted from `open` to `partially-settled-affirmatively`.
- The [Felber et al 2025 reference annotation](../references/felber-et-al2025.md), which can be updated to reflect the shared frame-valuedness.
- The [crdt-applications-opener narrative](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/crdt-applications-opener.md), which can position the corpus's CRDT machinery as the *settling-side* of a unified framework with Felber's *task-side*, both d-frame-valued.
- The [distributed-systems topology relation narrative](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/distributed-systems-topology-relation.md), where the relationship to Felber et al currently is given a paragraph but can now be sharpened into a structural-correspondence statement.
