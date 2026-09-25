---
type: theorem
status: established
depends-on: [implication-base, attribute-implication]
see-also: [basic-theorem-of-fca]
references:
  - id: duquenne-guigues1986
    type: document
    title: Duquenne & Guigues, Famille minimale d'implications informatives résultant d'un tableau de données binaires (1986)
title: Duquenne–Guigues completeness
description: The structural theorem characterising the canonical implication base of a formal context.
---

# Duquenne–Guigues completeness

The structural theorem characterising the canonical implication base of a formal context.

## Statement

**Theorem (Duquenne & Guigues 1986).** Let $\mathbb{K} = (G, M, I)$ be a finite formal context and let

$$\mathcal{B}_{DG}(\mathbb{K}) := \{P \to P'' \mid P \text{ is a pseudo-intent of } \mathbb{K}\}.$$

Then:

1. **(Soundness)** Every implication in $\mathcal{B}_{DG}(\mathbb{K})$ holds in $\mathbb{K}$.
2. **(Completeness)** The deductive closure of $\mathcal{B}_{DG}(\mathbb{K})$ under the Armstrong rules equals $\mathrm{Imp}(\mathbb{K})$.
3. **(Minimum cardinality)** $|\mathcal{B}_{DG}(\mathbb{K})| \le |\mathcal{B}|$ for every implication base $\mathcal{B}$ of $\mathbb{K}$, with equality iff $\mathcal{B}$ has the same set of implication-premises as $\mathcal{B}_{DG}$.
4. **(Uniqueness up to renaming)** Any two minimum-cardinality implication bases of $\mathbb{K}$ have the same set of premises and differ only by replacing each conclusion with another conclusion deductively equivalent under the rest of the base.

## Proof sketch

**Soundness.** $P''$ is the closure of $P$ under the implication theory $\mathrm{Imp}(\mathbb{K})$, so $P \to P''$ holds.

**Completeness.** Suppose $B_1 \to B_2$ holds in $\mathbb{K}$, so $B_2 \subseteq B_1''$. Compute $B_1''$ by iteratively applying implications $P \to P''$ for pseudo-intents $P \subseteq B_1$: the construction of pseudo-intents (closing under all smaller-pseudo-intent implications) ensures the iteration terminates with $B_1''$. Hence $B_1 \to B_2$ is derivable from $\mathcal{B}_{DG}$ via repeated application of pseudo-intent implications plus Armstrong augmentation and transitivity.

**Minimum cardinality.** Each pseudo-intent $P$ is an *implication-essential* premise: there is no implication $B_1 \to B_2 \in \mathrm{Imp}(\mathbb{K})$ with $P \subsetneq B_1$ that derives $P \to P''$. So every base must contain an implication with a premise deductively equivalent to $P$. The pseudo-intents are pairwise deductively independent in this sense; hence at least $|\mathcal{B}_{DG}|$ implications are required.

**Uniqueness up to renaming.** Follows from minimum cardinality plus the deductive-equivalence flexibility of conclusions.

(Full proofs in Ganter & Wille 1999, Theorem 8; Duquenne & Guigues 1986.)

## Significance

The theorem is the FCA lineage's contribution to the theory of *minimum implicational bases* of relational data. It generalises and refines earlier results on functional-dependency bases in relational databases (Armstrong 1974) and is the structural foundation of attribute exploration (per [implication-base](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/implication-base.md)).

## Substrate reading

In predicated language: the Duquenne–Guigues base is the *minimum* presentation of the closure-rule system whose settlement equals the FCA-substrate's Galois closure. The substrate's general theory does not require a minimum closure-rule presentation; the FCA case is special because the substrate is restricted enough (one binary predicate, $\mathbf{2}$-valued, no scope structure) for minimality to be canonically determined. In richer substrates (multi-predicate, bilattice-valued, multi-scope) the corresponding minimum-presentation question is open; see the companion subtheory's [non-monotonic-extensions](../../documents/articles/learning-articles/questions/non-monotonic-extensions.md) and this subtheory's own [questions/duquenne-guigues-beyond-binary](../../documents/articles/learning-articles/questions/duquenne-guigues-beyond-binary.md).
