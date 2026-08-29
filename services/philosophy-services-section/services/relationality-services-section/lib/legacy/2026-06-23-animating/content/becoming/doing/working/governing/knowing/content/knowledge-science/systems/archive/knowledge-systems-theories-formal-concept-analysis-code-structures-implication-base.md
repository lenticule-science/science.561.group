---
type: definition
class: derived-content
status: stable
depends-on: [formal-context, attribute-implication]
see-also: [duquenne-guigues-completeness]
---

# Implication base

An **implication base** of a formal context $\mathbb{K} = (G, M, I)$ is a set $\mathcal{B} \subseteq \mathcal{P}(M) \times \mathcal{P}(M)$ of attribute implications such that the deductive closure of $\mathcal{B}$ under the Armstrong rules (per [attribute-implication](teaching/explanations/attribute-implication.md)) equals $\mathrm{Imp}(\mathbb{K})$, the full set of implications holding in $\mathbb{K}$.

The implication theory of a context is typically infinite (or, for finite $M$, exponentially large in $|M|$). An implication base is a finite, ideally small generating set. The lineage's central concrete result is that there is a *canonical* such base — the Duquenne–Guigues base — that is unique up to renaming and minimum in cardinality.

## The Duquenne–Guigues base

A subset $P \subseteq M$ is a **pseudo-intent** of $\mathbb{K}$ when $P \ne P''$ (so $P$ is not closed) but $Q'' \subseteq P$ for every pseudo-intent $Q \subsetneq P$ (so $P$ is closed under all "smaller" pseudo-intent implications). The set of pseudo-intents is well-defined by induction on $|P|$.

The **Duquenne–Guigues base** is

$$\mathcal{B}_{DG}(\mathbb{K}) := \{P \to P'' \mid P \text{ is a pseudo-intent of } \mathbb{K}\}.$$

**Theorem (Duquenne–Guigues 1986).** $\mathcal{B}_{DG}(\mathbb{K})$ is sound, complete, and of minimum cardinality among all implication bases of $\mathbb{K}$.

See [theorems/duquenne-guigues-completeness](../theorems/duquenne-guigues-completeness.md) for the proof sketch.

## Attribute exploration

The Duquenne–Guigues base is the output of *attribute exploration* (Ganter 1984), the FCA lineage's interactive knowledge-acquisition algorithm. Attribute exploration walks the pseudo-intents of $\mathbb{K}$ in lectic order, posing each candidate implication $P \to P''$ to a domain expert who either:

- **Accepts** the implication, in which case it joins $\mathcal{B}_{DG}$ and the algorithm proceeds.
- **Rejects** by supplying a counterexample object — an object $g$ with $P \subseteq \{g\}'$ but $P'' \not\subseteq \{g\}'$. The new object is added to $G$, refining the context $\mathbb{K}$, and the algorithm restarts the pseudo-intent enumeration on the refined context.

Attribute exploration terminates (for finite $M$) and produces both the Duquenne–Guigues base of the *final* refined context and the set of counterexamples elicited along the way.

## Implication base as closure-rule system

Read against the predicated framing (per [concepts/attribute-implication](teaching/explanations/attribute-implication.md)): an implication base is a finite [closure-rule system](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) generating the FCA-substrate's Galois closure. The Duquenne–Guigues base is its *minimum* presentation. Attribute exploration is, in substrate language, *interactive elicitation of a minimum closure-rule system from a domain expert with counterexample feedback*.

The substrate generalisation: in the predicated framing, the closure-rule system is not restricted to attribute implications on a single binary predicate. A predicated knowledge system admits closure rules over arbitrary predicates and arbitrary regimes; the Duquenne–Guigues construction is a special case for the strict-regime, single-binary-predicate, $\mathbf{2}$-valued sub-substrate.
