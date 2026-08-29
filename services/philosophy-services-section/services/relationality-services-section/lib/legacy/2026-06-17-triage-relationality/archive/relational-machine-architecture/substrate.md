---
constituted-by:
  - medium
  - enabling-conditions
grounds: superstructure
modes:
  - base-substrate
  - foundation-substrate
  - patient-substrate
date-created: 2026-03-20
date-modified: 2026-03-20
---

# Substrate

## Formal definition

A **Substrate** is a pair $\Sigma = (S, \mathcal{E}(S))$:

$$\Sigma = (S : \mathrm{Medium},\; \mathcal{E}(S) : \mathrm{Medium} \to \mathbf{Prop})$$

where:
- $S$ is the **medium** — the underlying object, layer, or material that occupies a lower stratum in a stratified hierarchy; $S$ is what the superstructure is built on, runs in, or is realized through
- $\mathcal{E}(S)$ is the **enabling conditions** — the set of properties $S$ satisfies that determine what can be built on it; $\mathcal{E}(S)$ is not fixed in advance but depends on what superstructure $X$ requires; the enabling conditions are the formal content of "being fit for purpose as a substrate for $X$"

The **superstructure** $X$ is not part of the substrate tuple — it is what the substrate enables. The substrate/superstructure relationship is:

$$X \text{ is realizable on } S \iff S \text{ satisfies } \mathcal{E}(S, X)$$

where $\mathcal{E}(S, X)$ reads "S satisfies the enabling conditions required by X." Multiple superstructures can share the same substrate; the same superstructure can be realized on multiple substrates (substrate independence — see below).

**Four invariants.** $\Sigma$ is a substrate iff it satisfies:

1. **Stratification**: $S$ occupies a strictly lower stratum than $X$ in a layered ontology. No substrate is its own superstructure; no superstructure is the substrate it rests on. The stratification is irreflexive and asymmetric: $S$ is the substrate of $X$ implies $X$ is not the substrate of $S$.

2. **Enabling**: $S$ must satisfy $\mathcal{E}(S, X)$ for $X$ to be realizable on $S$. The enabling conditions are the interface contract between substrate and superstructure. A substrate that fails $\mathcal{E}(S, X)$ cannot support $X$, regardless of how $X$ is designed. The substrate constrains the possible superstructures.

3. **Grounding** (for Base and Foundation modes): the superstructure obtains *in virtue of* the substrate — constitutively, not merely causally. The grounding relation is:
   - **Irreflexive**: $X$ is not grounded in $X$
   - **Asymmetric**: if $X$ is grounded in $S$, then $S$ is not grounded in $X$
   - **Hyperintensional**: sensitive to description, not only modal profile
   - **Non-causal**: grounding is constitutive, not a temporal precedence of cause before effect

   This is strictly stronger than supervenience (which only asserts "no $X$-difference without $S$-difference"): grounding adds direction and explanation. The superstructure does not merely covary with the substrate — it *exists* in virtue of the substrate.

4. **Mode specificity**: a substrate operates in exactly one of three modes — **Base**, **Foundation**, or **Patient** — distinguished by the relationship between the substrate and the process it enables (see below). The mode is determined by whether the substrate is preserved, whether it exposes a topology, and whether it is consumed.

## The three modes

The word "substrate" names three structurally distinct relationships between a lower layer and what is built on or acts through it:

### Mode 1: Base
The **Base** mode is the minimal substrate — a positional indexing structure that provides objects (positions) and morphisms (transitions) over which fibers are defined. The base is preserved (not consumed) by the superstructure. It provides *where* without imposing *how*.

In the relational universe: the history category $T$ is the **Base** of the presheaf $H : T^{\mathrm{op}} \to \mathbf{HA}_{\mathrm{nucl}}$. $T$ provides the indexing positions (histories $t \in T$) and the transitions (the ordering $t \leq t'$). The base imposes no topological constraint — it does not specify which families of histories collectively "cover" a history. Any presheaf on $T$ is consistent with $T$ as base.

See [Base](base-substrate.md).

### Mode 2: Foundation
The **Foundation** mode is an enriched base — a base equipped with additional structure (covering conditions, enabling conditions) that constrains what can be coherently built on it. The foundation is preserved (not consumed) and exposes an interface contract specifying what the superstructure must satisfy. The foundation is what the superstructure is *grounded in*.

In the relational universe: the history site $(T, J)$ — the history category $T$ equipped with a Grothendieck topology $J$ — is the **Foundation** of the sheaf $H : T^{\mathrm{op}} \to \mathbf{HA}_{\mathrm{nucl}}$. The topology $J$ specifies the covering sieves: which families of morphisms collectively cover a history. The sheaf condition (local sections assemble uniquely over covering sieves) is the enabling condition $\mathcal{E}((T, J), H)$.

See [Foundation](foundation.md).

### Mode 3: Patient
The **Patient** mode is the substrate that is acted upon and transformed by an operation. Unlike Base and Foundation (which are preserved while the superstructure operates), the Patient is consumed/changed — it enters the operation as input and exits as output. The Patient is the biochemical substrate: the molecule that binds to the potential site and is transformed into product.

In the relational universe: an element $a \in H_t$ is the **Patient** of a nuclear operation $\sigma_t$ or $\Delta_t$ — the nucleus acts on $a$ and produces $\sigma_t(a) \geq a$ (the inflated, meaning-settled output). The Patient $a$ is not destroyed; it is transformed upward toward the fixed fiber $H^*_t$. The nuclei are the enzymes; the fiber elements are the patients.

See [Patient](patient.md).

## Substrate independence

Substrate independence of $X$ with respect to property $P$ holds when:

$$\forall S, S'.\; \mathcal{E}(S, X) \wedge \mathcal{E}(S', X) \implies X\text{-on-}S \;\sim_P\; X\text{-on-}S'$$

The same superstructure $X$, realized on two different substrates $S$ and $S'$ that both satisfy the enabling conditions, is $P$-equivalent. The choice of substrate is irrelevant to $X$'s behavior with respect to $P$.

Substrate independence is a **modal claim about enabling conditions**: it says the enabling conditions are the only substrate features that matter for the superstructure's behavior. Any substrate meeting $\mathcal{E}(S, X)$ works equally well.

In the relational universe: FARS is a substrate for the enterprise that runs on it. The flatfile encoding (markdown + YAML + Python) satisfies the enabling conditions $\mathcal{E}(\mathrm{FARS}, \mathrm{Enterprise})$: distinguishable states (`id`), stability (git versioning), compositionality (links + frontmatter), interface conformance (Fregean pattern). The enterprise is substrate-independent: it could in principle run on a database substrate, a graph store substrate, or any other substrate satisfying the same enabling conditions. The specific flatfile realization is contingent; the enterprise's logical structure is not.

## The substrate hierarchy: stratified layers

In a complex system, substrates stack:

$$S_0 \;\text{(ground layer)} \;\leftarrow\; S_1 \;\text{(built on } S_0\text{)} \;\leftarrow\; S_2 \;\text{(built on } S_1\text{)} \;\leftarrow\; \cdots$$

Each $S_i$ is simultaneously a substrate for $S_{i+1}$ (viewed from above) and a superstructure on $S_{i-1}$ (viewed from below). In the relational universe:

| Stratum | Object | Mode | Enables |
|---|---|---|---|
| $S_0$ | File system (git) | Foundation | Identity, persistence, addressability of files |
| $S_1$ | Flatfile encoding (FARS) | Foundation | Fregean relations, vocabulary constraint, 7 conditions |
| $S_2$ | Relational universe $(T, J, H)$ | Foundation | Presheaf structure, nucleus evaluation, settlement |
| $S_3$ | Enterprise | Superstructure | Runs on $S_0$–$S_2$ simultaneously |

The enterprise is grounded in all three substrate layers: it cannot exist without file-system persistence ($S_0$), without the flatfile encoding ($S_1$), or without the relational universe structure ($S_2$).

## Substrate vs. adjacent concepts

| Concept | Relation to Substrate |
|---|---|
| [Base](base-substrate.md) | Mode-1 substrate: positional indexing, no topology, preserved |
| [Foundation](foundation.md) | Mode-2 substrate: enriched base with covering conditions, preserved |
| [Patient](patient.md) | Mode-3 substrate: element acted upon and transformed, consumed |
| [Field](field.md) | A field is a section of a fibration over a base substrate — the field IS the superstructure; the base IS the substrate |
| [Institution](institution.md) | An institution requires a substrate (physical, computational, or social medium) for its constitutive rules to operate |
| Supervenience | Weaker than grounding: no X-difference without S-difference, but no explanatory direction |

## Nuclear tension: the three substrate modes as positions relative to the σ-Δ dyad

**Source:** [Relational Universe Nuclear Tension Saturating Transferring Nucleus Duality](../../../science/domains/math/relational-universe-nuclear-tension-saturating-transferring-nucleus-duality.md).

The nuclear tension is the most fundamental duality in the relational universe: RelationalHistoryFiberSaturatingNucleus looks backward to sub-histories (the accumulated past), while RelationalHistoryFiberTransferringNucleus looks forward to one-step extensions (every possible next step). The three substrate modes are not just engineering categories — each one has a precise position relative to this tension.

**Base mode: below the tension.** The history category T is the Base of the relational universe. No nuclear tension operates at the T-level: T has no nuclei, no notion of saturation, no notion of transfer. The nuclear tension begins above T — it begins with the fibers H_t defined over T. The Base substrate is precisely the part of the system that the nuclear tension does not touch: it is preserved through all nuclear activity because the tension acts on fibers, not on the base positions themselves. "Base mode = below the reach of σ and Δ."

**Foundation mode: the locus where the tension is grounded.** The history site (T,J) is the Foundation. The Grothendieck topology J is exactly what determines the enabling conditions for the nuclear tension: the saturation nucleus RelationalHistoryFiberSaturatingNucleus at each history t is computed as the join over sub-history restriction images — this is the covering sieve structure J manifesting as σ; the transfer nucleus RelationalHistoryFiberTransferringNucleus at t is computed as the intersection of restriction images from one-step extensions — this is the coverage structure of J manifesting as Δ. The Foundation is preserved: the topology J remains unchanged as σ and Δ act on fibers above it. "Foundation mode = the stable ground that fixes the form of both σ and Δ."

**Patient mode: inside the tension, being transformed by it.** A fiber element a ∈ H_t is in Patient mode relative to the nuclear tension. The saturation nucleus applies to a: RelationalHistoryFiberSaturatingNucleus(a) is the largest proposition whose restriction profile to every sub-history is componentwise ≤ that of a — it fills a up to the boundary determined by the accumulated past. The transfer nucleus applies to a: RelationalHistoryFiberTransferringNucleus(a) is the smallest proposition already present in every one-step extension — it finds what every future has already committed to back-transferring to t. The Patient a is transformed upward by both until it reaches RelationalHistoryFixedFiber, where both nuclei act trivially: "the past has finished speaking, the future has already sent everything back."

**The doubly-quiescent Patient.** The convergence of the nuclear tension is RelationalHistoryFixedFiber = Fix(RelationalHistoryFiberSaturatingNucleus) ∩ Fix(RelationalHistoryFiberTransferringNucleus). A fiber element a ∈ RelationalHistoryFixedFiber is the substrate in Patient mode that has been fully transformed: it is simultaneously saturation-stable (σ cannot enlarge it further — the past is exhausted) and transfer-stable (Δ cannot enlarge it further — the future has nothing more to contribute). This is the doubly-quiescent Patient: the substrate element that has been acted upon by both enzymes and reached the stable product.

**The dyad table and the substrate modes.**

| Nuclear direction | Nucleus | Substrate mode it operates on | What it does |
|---|---|---|---|
| Backward (sub-histories) | RelationalHistoryFiberSaturatingNucleus | Patient (fiber element a) | Fills a to the maximum consistent with all sub-history restrictions |
| Forward (extensions) | RelationalHistoryFiberTransferringNucleus | Patient (fiber element a) | Finds the minimum of a already present in every one-step future |
| Neither | Identity | Base (history category T) | T is below the reach of both nuclei — no saturation, no transfer at the base |
| Both (grounded) | The topology J that defines both | Foundation (history site (T,J)) | J determines the enabling conditions for both nuclei; J is preserved |

**The commutation axiom as substrate coherence.** RelationalHistoryFiberNucleusCommutationAxiom asserts that the two directions of the nuclear tension commute: RelationalHistoryFiberSaturatingNucleus ∘ RelationalHistoryFiberTransferringNucleus = RelationalHistoryFiberTransferringNucleus ∘ RelationalHistoryFiberSaturatingNucleus. In substrate terms: applying σ then Δ to a Patient (transfer first, then saturate) gives the same result as applying Δ then σ (saturate first, then transfer). The commutativity axiom is the coherence condition that makes the Patient's transformation order-independent — the doubly-quiescent product RelationalHistoryFixedFiber is independent of which nuclear enzyme acts first. Without this coherence, the Patient would reach different doubly-quiescent products depending on the order of application, and the Foundation's enabling conditions would not uniquely determine the stable product.

**Proposition (Substrate mode = position relative to the nuclear tension).** The three substrate modes are distinguished by their position in the nuclear tension: (1) Base mode = below the tension (T, preserved, no nuclei defined); (2) Foundation mode = grounding the tension (T,J), preserved, determining both σ and Δ through J); (3) Patient mode = inside the tension (H_t elements, transformed by σ and Δ toward RelationalHistoryFixedFiber). The substrate hierarchy Base ← Foundation ← Patient is the nuclear tension's ascending chain of involvement.

*Source.* Nuclear tension dyad table and definitions from [Relational Universe Nuclear Tension §The Dyad](../../../science/domains/math/relational-universe-nuclear-tension-saturating-transferring-nucleus-duality.md#tension-dyad). Saturation and transfer named characterizations from [§Saturation](../../../science/domains/math/relational-universe-nuclear-tension-saturating-transferring-nucleus-duality.md#tension-saturation) and [§Transfer](../../../science/domains/math/relational-universe-nuclear-tension-saturating-transferring-nucleus-duality.md#tension-transfer). Doubly-quiescent convergence from [§The Convergence](../../../science/domains/math/relational-universe-nuclear-tension-saturating-transferring-nucleus-duality.md#tension-convergence). Status: the nuclear tension dyad is established; the commutativity gap (whether idempotency of the joint retraction holds without the axiom) is noted in [§The Nuclear Retraction](../../../science/domains/math/relational-universe-nuclear-tension-saturating-transferring-nucleus-duality.md#tension-commutativity). $\square$

## Open questions

- Whether the three modes (Base, Foundation, Patient) are exhaustive — whether there are substrate/superstructure relationships that fit none of the three modes. Candidates: the **scaffold** (a substrate that enables construction then is removed, e.g., biological scaffolding in tissue engineering) and the **catalyst** (changed and restored, not consumed) might constitute additional modes.
- Whether substrate independence is the right way to characterize the relationship between the enterprise and FARS — whether the enterprise could genuinely run on a non-flatfile substrate while preserving its logical structure, or whether the flatfile substrate is so deeply entangled with the enterprise's identity (the Fregean encoding, the git-history-as-history-monoid) that they are constitutively related rather than contingently related.
- Whether **Aristotle's prime matter** (pure potentiality, no actual properties) has a formal analog in the relational universe — whether there is a "maximally thin" substrate that provides only the minimal structure required by any superstructure, and what that structure would be.
