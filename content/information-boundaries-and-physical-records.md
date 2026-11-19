---
page-title: "Information, boundaries and physical records"
title: "What can a boundary tell us about the world inside?"
summary: "A two-bit example makes boundary reconstruction exact, connects ambiguity to conditional entropy, and identifies the additional physical assumptions needed before information loss becomes a heat bound."
date-created: 2026-10-31
type: article
status: draft
visibility: public
math: true
tags: [relationality, information, causality, thermodynamics, holography, obsmetrologia]
keywords: [boundary sufficiency, conditional entropy, information loss, physical records, Landauer principle, relational physics]
---

## A boundary can reveal a relation while hiding its participants

Imagine an interior containing two binary variables A and B. A boundary instrument reports only whether they agree. It displays their parity, P=A⊕B: zero when they agree and one when they differ.

The reading is perfectly informative about that relation. It is insufficient to reconstruct the two variables.

| Interior (A,B) | Boundary reading P | Interiors consistent with that reading |
| --- | --- | --- |
| (0,0) | 0 | (0,0), (1,1) |
| (0,1) | 1 | (0,1), (1,0) |
| (1,0) | 1 | (0,1), (1,0) |
| (1,1) | 0 | (0,0), (1,1) |

![The four interior states 00, 11, 01 and 10 feed into two parity readings. States 00 and 11 give reading zero; states 01 and 10 give reading one. Recording both A and parity separates all four interiors and allows B to be reconstructed.](/figures/boundary-information.svg)

*Figure 1. Exact finite ambiguity under a declared readout. This is an illustrative information model, not evidence about a physical horizon.*

The example captures a research question in the existing kinetic and Holofoam work: **when does a chosen boundary observation determine the interior?** The word “chosen” matters. A boundary has to expose some actual observation, and a claim of reconstruction has to say what is to be reconstructed.

## Reconstruction is a property of a map

Let S be the set of admitted interior states and let r:S→B be the readout. For a reading b, the compatible interiors form its fiber

$$ F_b=\{s\in S:r(s)=b\}. $$

For every attainable reading, exact reconstruction is possible precisely when its fiber contains one state. Equivalently, r is injective on the admitted states. If two distinct interiors have the same reading, no decoder receiving only that reading can always identify which one occurred.

Sometimes the scientific question asks less. We may want only a property q(s), such as parity, a conserved quantity, or a class of histories. That property is reconstructible from r exactly when it is constant on every readout fiber. In that case a function g can be defined on the attainable readings so that

$$ q=g\circ r. $$

The proof is short. If q=g∘r, equal readouts must have equal q-values. Conversely, if q is constant on each fiber, define g(b) to be that common value. There is no ambiguity in this definition.

This gives boundary sufficiency a precise, question-relative meaning. The parity instrument is sufficient for knowing whether the bits agree. It is insufficient for knowing A or B individually. The same boundary can therefore be complete for one inquiry and incomplete for another.

### What an additional observation changes

Suppose the boundary records A as well as parity. Its readout is now r′(A,B)=(A,A⊕B). This map is injective, because B can be recovered as A⊕P. The extra observation removes the ambiguity.

Nothing about the original parity reading was wrong. It represented a relation faithfully while forgetting distinctions that another inquiry needed. The [causal transport example](/causal-intervals-and-projection/) displays the same general issue in a different carrier: a map preserves specified relations while identifying source events whose difference matters to independence.

For a research instrument or software system, the useful question is what the next consumer needs to distinguish. Storing everything can be wasteful; storing only a convenient summary can make a later inference impossible. A reconstruction theorem states which loss is harmless for a declared purpose.

## From ambiguity to probabilistic information

The parity fibers each contain two states. Their logarithmic size is one bit of combinatorial ambiguity. Calling that a Shannon entropy requires a distribution.

Assume the four interiors are equally likely. Then their joint entropy is H(A,B)=2 bits, the parity entropy is H(P)=1 bit, and

$$ H(A,B\mid P)=H(A,B)-H(P)=1\text{ bit}. $$

The equality uses the fact that P is a deterministic function of the pair. Shannon's conditional entropy measures the average uncertainty remaining after a reading under the specified distribution.

Change the distribution and the answer can change even though the readout formula and its four-state domain remain the same. If the source produces only 00 and 01, with equal probabilities, then parity distinguishes the two admitted possibilities and H(A,B|P)=0. If a readout fiber contains several possible states with unequal probabilities, its uncertainty need not equal the logarithm of its cardinality.

The distinction is useful in practice. A worst-case reconstruction claim concerns every admitted state. An average compression or prediction claim concerns a probability model. A model trained on only two interiors cannot establish lossless reconstruction after the source begins producing all four.

## A hidden bit has not necessarily been erased

Looking only at parity does not physically destroy A or B. The source can retain both, and another permitted observation can recover them. Mathematical projection and physical erasure are different operations.

A reversible implementation can retain the entire input while computing the readout:

$$ (A,B,0)\longmapsto(A,B,A\oplus B). $$

The visible parity output still has two-state fibers, but the complete stored state has not lost the original pair. The example establishes an information boundary for one observer. It does not, on its own, establish heat production.

To ask a thermodynamic question, specify a physical memory, its initial distribution, its Hamiltonian and environment, the transformation protocol, and which records are retained or reset. Reeb and Wolf's formulation of Landauer's principle makes one such set of assumptions explicit: a system and a thermal reservoir start uncorrelated, the reservoir starts in a Gibbs state, and their joint evolution is unitary with no omitted participant serving as an unaccounted entropy sink. For the heat lower bound below, take a reservoir at a positive temperature T>0.

In that setting they derive an equality of the form

$$ \beta\Delta Q=\Delta S+I(S':R')+D(\rho'_R\Vert\rho_R). $$

Here ΔQ is heat transferred to the reservoir; β=1/(kBT); ΔS is the reduction in the system's entropy, expressed with natural logarithms; the remaining terms measure final system–reservoir mutual information and the reservoir's departure from its initial Gibbs state. Their nonnegativity yields a lower bound on heat for a positive entropy reduction.

A reduction of one bit therefore yields the familiar lower bound kBT ln 2 under those assumptions. It does not follow that an arbitrary data summary, a forgotten causal distinction, or one pass through a closure operator dissipates exactly that amount. The physical implementation and the complete accounting determine whether the thermodynamic result applies.

This is a productive route for the Group's information research: carry the lost distinction explicitly, then identify the physical operation that removes or preserves its record. The resulting model can be tested against measurement and protocol changes.

## A precise finite question for holography

The kinetic research program already proposes a finite boundary-sufficiency problem. Given a region, its allowed interiors or histories, and a boundary readout, ask whether the boundary identifies the interior exactly, up to a stated equivalence, probabilistically, or not at all.

The fiber calculation supplies the simplest version. A candidate boundary description should expose collisions: distinct interiors with identical readings. If the description claims exact reconstruction, one collision refutes it. If it claims reconstruction of a specific invariant, a collision only refutes that claim when the invariant differs across the colliding interiors.

This is useful to Holofoam and to the publication tools that display its worlds. A viewer can show which regions remain ambiguous, which extra observation resolves a collision, and which claim survives the projection. The public account can then point to a measured finite result instead of relying on the visual suggestiveness of a boundary.

Physical holographic results, including the Ryu–Takayanagi relation in its applicable gravitational setting, concern much more structure: quantum states, entropy, a geometric prescription and the assumptions of the duality. Our finite parity example supplies none of that. It gives an exact reconstruction question that can become one part of a later comparison.

## What to ask of a proposed information claim

A useful claim names its source states, its actual readout and its target question. It says whether a conclusion holds for every admitted state or under a probability distribution. If it predicts physical cost, it includes the physical system and protocol that carry the information.

Those choices turn broad questions into things a reader can check. Does the boundary map have a collision? Is the target invariant constant on that fiber? Does the claimed conditional entropy use the declared distribution? Is a physical record erased, or merely absent from one presentation?

The [quantum article](/quantum-contexts-and-probability/) takes this one step further. There the difficulty is not simply that one readout hides a variable. Several compatible measurement contexts can resist any single global probability account. The kind of information being preserved becomes decisive.

Return to the [relational physics guide](/relational-physics/) for the larger program.

### Sources and reproduction

- **Existing Group research question:** the boundary-sufficiency section of [Obsmetrologia's kinetic reality program](https://github.com/lenticule-science/obsmetrologia/issues/24), an authorized-source reference. This article makes that question accessible with a finite teaching example; it does not claim a new physical holographic theorem.
- **Information theory:** Shannon (1948), [A Mathematical Theory of Communication](https://doi.org/10.1002/j.1538-7305.1948.tb01338.x), especially conditional entropy and its chain rule. [Accessible reprint](https://home.csulb.edu/~cwallis/382/readings/482/shannon.mathematical.theory.communication.1948.pdf).
- **Physical accounting:** Reeb and Wolf (2014), [An improved Landauer Principle with finite-size corrections](https://arxiv.org/abs/1306.4352), *New Journal of Physics* 16, 103011, section 2.1 and Theorem 3.
- **Distinct gravitational comparison:** Ryu and Takayanagi (2006), [Holographic derivation of entanglement entropy from AdS/CFT](https://arxiv.org/abs/hep-th/0603001), *Physical Review Letters* 96, 181602.
- **Public finite reproduction:** [relational-examples.py](https://github.com/lenticule-science/science.561.group/blob/main/examples/relational-examples.py) enumerates all four states, both readouts, the reconstruction criterion and the two probability examples. It reports a mathematical illustration, not hardware thermometry or experimental data.

*Research status:* finite mathematical exposition and external scientific comparison, prepared with AI assistance. No device, thermal experiment, physical horizon or new holographic duality is asserted.

*Reuse terms:* no additional reuse license is granted by this page. Cited works and linked source repositories retain their own terms.
