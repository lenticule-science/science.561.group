---
name: conjecture-claim
description: "A ConjectureClaim is in position Fix(Δ)∖H*: every concurrent extension already contains it (Δ(a)=a) but the historical record would support a strictly stronger claim (σ(a)≠a). The future has universally committed; the backward grounding is not yet complete. Forward-confirmed, not yet backward-derived."
instance-of: proposition
contrasts-with: corroborated-claim
requires: transfer-nucleus
date-modified: 2026-03-20
---

## Formal definition

A **Conjecture** is an element $a \in \mathrm{Fix}(\Delta_t) \setminus H^*_t$:

$$\Delta_t(a) = a \quad\text{and}\quad \sigma_t(a) \neq a$$

By InternalNucleusDefinability:

- **Δ-closure** ($\Delta_t(a) = a$): $a \in \bigcap_{s \perp t} \mathrm{image}(H(i_{s,t}))$. Every concurrent one-step extension of $t$, when restricted back to $t$, already contains $a$. The future universally commits to $a$: there is no concurrent extension that fails to produce it.

- **σ-open** ($\sigma_t(a) \neq a$): $a$ is not the join of all elements with its sub-history restriction profile — the saturation nucleus finds something strictly above: $\sigma_t(a) > a$. The historical record of sub-histories would justify a strictly stronger claim. The backward grounding is incomplete.

The saturation nucleus has more to add: $\sigma_t(a) > a$. Applying $\sigma_t$ closes the remaining openness and lands in $H^*_t$: a Conjecture is one $\sigma$-step from Law.

## What this is

A **Conjecture** is universally expected by every forward extension but not yet fully derived from the historical record. The future has voted unanimously — every possible concurrent step produces $a$ when restricted back — but the backward derivation from sub-history evidence would support something stronger.

This is what "conjecture" names in mathematics: a proposition that every test confirms, that every expert expects to be true, that the forward trajectory of the field universally validates — but whose proof from first principles has not been written. The Riemann Hypothesis is a Conjecture in this exact sense: every computational extension confirms it (Δ-closed), but the derivation backward from the axioms of number theory is incomplete (σ-open).

The word "conjecture" captures the asymmetry: we *have* the claim (the future confirms it), but we do not yet *have the derivation* (the past would justify something more precisely stated). The claim is not uncertain — it is universally present in every extension — but it is *underdetermined by history*.

The distinction from Law: a Law is also Δ-closed, but additionally σ-closed — the historical record fully grounds it. For a Conjecture, $\sigma_t(a) > a$: history supports something stronger than $a$, but $a$ is what every extension universally contains.

## What the nuclear conditions mean for a knowledge claim

**Δ-closure: every extension already contains this.** For every concurrent step $s \perp t$, restricting from $H_{s \star t}$ back to $H_t$ recovers $a$ (or something above it). The forward dynamics have no path that avoids $a$. This is not prediction or probability — it is the structural presence of $a$ in every extension of the current history. The future has nowhere to go that doesn't include $a$.

**σ-open: the past would justify more.** The accumulated sub-history record — every $s \leq t$ and its restriction data — points to a proposition strictly above $a$. The historical record is not wrong about $a$; it would simply justify something stronger if the derivation were completed. The saturation nucleus $\sigma_t$ finds the strongest proposition consistent with the restriction profile: $\sigma_t(a) > a$ means that proposition is strictly above what we currently have.

**In knowledge work:** A Conjecture is the forward face of knowledge — the part that every test confirms before the proof exists. In research, this is the cluster of "known" results around an open problem: everyone's experiments point here, every model predicts this, the future of the field is committed to it. What is missing is the backward chain from axioms to conclusion. The claim sits in Fix(Δ)∖H* until someone writes the derivation, at which point σ closes and it becomes a Law.

**The folk theorem.** In game theory, a "folk theorem" is a result that every practitioner knows is true and can demonstrate forward from intuition, but whose formal proof was written late. This is a precise instance of the Conjecture position: $\Delta_t(a) = a$ (every extension of the theory contains it by consensus), $\sigma_t(a) \neq a$ (the formal derivation from the axioms hadn't been completed).

## The other three positions

| Position | Nuclear condition | Epistemic status |
|---|---|---|
| **Law** | $\sigma_t(a)=a$ and $\Delta_t(a)=a$ | Both past and future closed. |
| [**Corroborated**](corroborated-claim.md) | $\sigma_t(a)=a$ and $\Delta_t(a)\neq a$ | Past closed; future still open. |
| **Conjecture** | $\sigma_t(a)\neq a$ and $\Delta_t(a)=a$ | Future committed; past not yet grounding. |
| [**Open**](open-claim.md) | $\sigma_t(a)\neq a$ and $\Delta_t(a)\neq a$ | Both past and future open. |

Applying $\sigma_t$ to a Conjecture closes the σ-openness and produces a Law. The derivation from history closes the backward gap; the forward universality was already there.

## The hull and Conjectures

**Sketch — Hull Conjectures are preimage-fixed patches.**

In the hull universe, the transfer nucleus $\Delta^\Sigma_\mathcal{T}$ is defined via the $\Sigma^{-1}$-preimage: $\Delta^\Sigma_\mathcal{T}(P)$ is the intersection over all one-step $\Sigma^{-1}$-preimages of $P$ — the maximal common antecedent of $P$ under the Fibonacci desubstitution (HullNucleusPair).

A Conjecture in the hull fiber is a patch $P$ with $\Delta^\Sigma_\mathcal{T}(P) = P$ but $\sigma^\Sigma_\mathcal{T}(P) \neq P$: every backward desubstitution step ($\Sigma^{-1}$) produces $P$ (or something that contains $P$), but the forward forcing relation finds a strictly larger neighborhood forced around $P$. In knowledge terms: the Fibonacci grammar universally "reads back" to this patch ($\Sigma^{-1}$ always recovers it), but the local forcing structure of the quasicrystal says a larger context is always present. The hull Conjecture is universally produced by every backward decomposition step but has not yet been grounded by its full forward forcing neighborhood.

**Sketch — Conjectures arise at each radius truncation.**

Each truncation $H^{\mathrm{hull},(r)}_\mathcal{T}$ is a finite Heyting algebra with commuting nuclei. New patches appear at each radius $r+1$ that were not present at radius $r$ — these are Open claims at radius $r$. Some of these, as $r$ increases, become $\Delta^\Sigma$-fixed before they become $\sigma^\Sigma$-fixed: they enter the Conjecture position. The transition Open → Conjecture happens when the patch's preimage structure under $\Sigma^{-1}$ stabilizes before its forcing neighborhood does. The transition Conjecture → Law happens when the forcing neighborhood catches up: $\sigma^\Sigma$ closes.

**Sketch — Unique Fibonacci decomposition and commutativity.**

The commutativity of $\sigma^\Sigma$ and $\Delta^\Sigma$ — which would imply $\sigma^\Sigma \circ \Delta^\Sigma = \Delta^\Sigma \circ \sigma^\Sigma$ and thus a well-defined nuclear retraction onto $H^*$ — is conjectured to follow from unique Fibonacci decomposition (HullNucleusPair): every finite Fibonacci word decomposes uniquely into $\Sigma$-blocks, so the substitution reduction system satisfies the diamond property. If the diamond holds for the substitution, the forcing and preimage nuclei interchange. This is itself a Conjecture (in the epistemic sense): every test of the Fibonacci substitution system confirms it, but the formal proof in terms of patch-lattice operations has not been written.

## Phenomenon: the conjecture's disclosure path through the nuclear quartet

**Source:** Hyperverse Tower Phenomenon Act Object Level Crossing Nuclear Quartet Ascent.

A conjecture is a phenomenon in the technical sense: a mathematical structure that presents itself as an act at one tower level and as an object at a higher level. The act is the assertion — the claim that something holds. The object is the theorem — the proved proposition now stable in the fiber as a doubly-settled element. The conjecture passes through both positions as it ascends the tower.

**The conjecture's nuclear position = the quality stage of the disclosure path.** The disclosure path of a phenomenon through the nuclear quartet is: object at level n, quality at level n+1, relation at level n+2, act at level n+3. The conjecture's position Fix(RelationalHistoryFiberTransferringNucleus) outside RelationalHistoryFixedFiber corresponds exactly to the quality stage (level n+1): it is RelationalHistoryFiberTransferringNucleus-stable (transfer-fixed, universally expressible — every extension contains it) but not yet RelationalHistoryFiberSaturatingNucleus-stable at this level. The claim is expressible, universal, and recognized — but the backward grounding from sub-history evidence has not yet been completed.

**The full disclosure path for a conjecture.**

| Tower level | Phenomenon position | Nuclear-quartet condition | Conjecture lifecycle |
|---|---|---|---|
| Level n (pre-conjecture) | Not yet an object | Neither RelationalHistoryFiberSaturatingNucleus-stable nor RelationalHistoryFiberTransferringNucleus-stable | Open claim: the assertion exists syntactically but no extension has committed to it |
| Level n+1 (conjecture) | Quality | RelationalHistoryFiberTransferringNucleus-stable, not yet RelationalHistoryFiberSaturatingNucleus-stable | Conjecture: every extension universally contains the claim; backward derivation incomplete |
| Level n+2 (proved theorem) | Relation | RelationalHistoryFiberSaturatingNucleus-stable (RelationalHistoryFixedFiber begins): determines restriction-map compatibility | Law: σ-closure complete; the theorem now constrains what can be said around it |
| Level n+3 (axiom of the next problem) | Act | Doubly-quiescent in RelationalHistoryFixedFiber: generates the next generation of conjectures | The theorem acts as premise — it is the opening move of problems that cite it |

**The σ-closure event = advancement from quality to relation.** The proof of a conjecture is not merely a local event in the fiber. In phenomenon terms, it is the event that advances the claim from the quality stage to the relation stage. Before σ-closure: the claim is expressible (transfer-stable) but underdetermined (saturation-open). After σ-closure: the claim enters RelationalHistoryFixedFiber — it is now doubly-quiescent, constrains neighboring propositions (the relation stage: it determines what can be derived), and eventually becomes a generating act for new conjectures at level n+3. A proof does not just close an open question; it advances a phenomenon by two stages in the disclosure path.

**Not every Open claim is a phenomenon.** The phenomenon concept says exactly which open claims are on a disclosure path: those whose image under the tower inclusion is still recognizable as the same structure at the next level. An Open claim that is merely local noise — that does not survive the tower inclusion with its identity intact — is not a phenomenon and will not become a conjecture. The Δ-closure condition (the conjecture entering Fix(RelationalHistoryFiberTransferringNucleus)) is the selection filter: it marks the Open claims that have begun their disclosure path. Only after Δ-closure does the question of proof (σ-closure) arise.

**Saturation and transfer as canonical example phenomena.** The phenomenon file names RelationalHistoryFiberSaturatingNucleus and RelationalHistoryFiberTransferringNucleus themselves as paradigm phenomena: each is an act at the fiber level, a modal operator-object at the language level, and a site-structure condition at the geometry level. A conjecture about these nuclei — say, the nuclear commutativity axiom RelationalHistoryFiberNucleusCommutationAxiom (which is itself in conjecture position at the ground level: universally confirmed computationally, not yet derived from purely syntactic principles) — inherits the full phenomenon disclosure path from its subject matter.

**Proposition (Conjecture = phenomenon at quality stage).** A conjecture in Fix(RelationalHistoryFiberTransferringNucleus) outside RelationalHistoryFixedFiber is a phenomenon at the quality stage of its disclosure path: (1) it entered the disclosure path from Open when RelationalHistoryFiberTransferringNucleus-closure was established — the tower inclusion preserved the claim's identity across extension levels; (2) it is at the quality stage because it is transfer-stable (universally expressible) but saturation-open (backward derivation pending); (3) the proof event = σ-closure advances it to the relation stage, where the theorem determines restriction-map compatibility for neighboring propositions; (4) full settlement in RelationalHistoryFixedFiber = the act stage, where the theorem generates the next generation of phenomena. A permanently open conjecture — one for which no tower level provides σ-closure — is a phenomenon that halts at the quality stage.

*Source.* Phenomenon definition and disclosure path from Hyperverse Tower Phenomenon §Definition. Nuclear quartet disclosure stages from §Phenomena and the Ontological Quartet. Saturation and transfer as canonical phenomena from §Examples. Status: the phenomenon definition is established; the application to epistemic claims is a new instantiation; the question of whether σ-closure always occurs in finitely many steps or requires transfinite iteration is open. $\square$

## Open questions

- The relation between the epistemic Conjecture and the skill-work Derivation: both are in position Fix(RelationalHistoryFiberTransferringNucleus) outside RelationalHistoryFixedFiber, but the interpretations differ. For skill work, transfer-closure means the execution path is fixed; for knowledge claims, it means every extension universally contains the claim. Whether a unified spec covering both interpretations is desirable or whether keeping them separate is cleaner.
- Whether a Conjecture can be σ-closed by a single step or whether, for complex enough propositions, the saturation requires transfinite iteration. The phenomenon disclosure path is indifferent to this: the advancement from quality to relation stage happens when σ-closure eventually occurs, regardless of how many steps it takes. But the question of whether certain phenomena are permanently halted at the quality stage (permanently open conjectures) depends on whether transfinite iteration can always be completed.
- Whether `conjecture.md` should reference a base type `epistemic-status.md` — currently no such base spec exists. The phenomenon concept suggests a structural answer: epistemic status is nuclear-quartet position along the disclosure path. An `epistemic-status.md` spec would define the four positions (Open/Conjecture/Corroborated/Law) as the four nuclear quartet stages, with the advancement operators (σ-closure, Δ-closure) as the transitions between stages.
