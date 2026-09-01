---
title: "Patient"
id: patient
description: "A Patient is a pair (a, φ) — an element and a nuclear operation — determining what gets processed and how. The element acted upon and transformed by a nucleus, entering at a and exiting as φ(a) ≥ a, inflated toward the fixed fiber."
dual-of: agent
contrasts-with: [base, foundation]
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  fiber: relational-universe
  element: relational-universe
  operation: relational-universe-morphism
output: relational-universe
ast:
  nuclear-application:
    - operation:
        - fiber
    - element:
        - fiber
---


## Formal definition

A **Patient** is a pair $(a, \varphi)$:

$$(a, \varphi) = (a \in H_t,\; \varphi : H_t \to H_t)$$

where:
- $H_t$ is the **fiber** at history $t$ — a Heyting algebra carrying the commuting nuclear pair $(\sigma_t, \Delta_t)$; this is the ambient structure in which the patient lives
- $a$ is the **patient element** — the element being acted upon; $a$ is what gets processed; the patient is individuated within the fiber: not $H_t$ itself (which is the Base or Foundation's business) but a specific element of it
- $\varphi : H_t \to H_t$ is the **nuclear operation** — either $\sigma_t$ (the meaning-nucleus) or $\Delta_t$ (the transfer-nucleus), or their composition $\Delta_t \circ \sigma_t$ (the full settlement operation); $\varphi$ must be a nucleus on $H_t$: inflating ($a \leq \varphi(a)$), monotone ($a \leq b \Rightarrow \varphi(a) \leq \varphi(b)$), and idempotent ($\varphi(\varphi(a)) = \varphi(a)$)

The **output** of a Patient is $\varphi(a)$ — the image of the element under the nuclear operation. The patient is not destroyed: $a \leq \varphi(a)$ (inflation). The patient is not merely copied: $\varphi(a) \neq a$ if $a \notin \mathrm{Fix}(\varphi)$. The patient is settled: $\varphi(\varphi(a)) = \varphi(a)$ (the output is a fixed point of $\varphi$).

**Four invariants.** $(a, \varphi)$ is a patient iff it satisfies:

1. **Element specificity**: $a$ is a specific element of $H_t$, not $H_t$ itself and not a subset of $H_t$. The Patient is individuated within the fiber. This is the defining difference between Patient and the Base/Foundation modes: the Base is the whole category $\mathcal{B}$; the Foundation is the whole site $(\mathcal{B}, J)$; the Patient is a single element within a single fiber. The patient is the minimal unit of nuclear processing.

2. **Nuclear operation**: $\varphi$ is a nucleus on $H_t$. It is not an arbitrary endomorphism; it must satisfy the nucleus axioms:
   - **Inflation**: $a \leq \varphi(a)$ for all $a$ — the nucleus never decreases
   - **Monotonicity**: $a \leq b \Rightarrow \varphi(a) \leq \varphi(b)$ — the nucleus is order-preserving
   - **Idempotence**: $\varphi(\varphi(a)) = \varphi(a)$ — the nucleus settles in one step; applying it again does nothing
   These three axioms are the formal content of "settlement": the nucleus moves every element toward its fixed-point image in one step.

3. **Transformation**: if $a \notin \mathrm{Fix}(\varphi)$ (if $a$ is not already a fixed point), then $\varphi(a) > a$ strictly — the patient is transformed, moved upward in $H_t$. A patient that is already a fixed point ($a \in \mathrm{Fix}(\varphi)$) is invariant: $\varphi(a) = a$. The nuclear operation applies but does nothing. In the biochemical analogy: the enzyme fails to catalyze a reaction on a molecule that is already in product form.

4. **Output fixedness**: the output $\varphi(a) \in \mathrm{Fix}(\varphi)$ is always a fixed point of $\varphi$. The patient, after transformation, is in the fixed sublocale $\mathrm{Fix}(\varphi) = H^*_t$ (if $\varphi = \sigma_t \circ \Delta_t$ is the full nucleus) or $\mathrm{Fix}(\sigma_t)$ or $\mathrm{Fix}(\Delta_t)$ depending on which nucleus is applied. Once settled, the element is stable under further applications of $\varphi$.

## The three patient types

Two nuclei $(\sigma_t, \Delta_t)$ operate on $H_t$ in the relational universe. This generates three types of Patient:

**$\sigma$-patient** $(a, \sigma_t)$: acted on by the **meaning-nucleus** $\sigma_t$. The meaning-nucleus is asynchronous-phase: it operates globally on the whole fiber at once, settling the semantic content of $a$ — whether $a$ is fully interpreted, whether its meaning is coherent within the whole fiber context. Output: $\sigma_t(a)$ — the meaning-settled form of $a$. Andreoli's asynchronous decomposition operates here.

$$\text{Meaning-settling patient:}\quad a \xrightarrow{\sigma_t} \sigma_t(a) \in \mathrm{Fix}(\sigma_t)$$

**$\Delta$-patient** $(a, \Delta_t)$: acted on by the **transfer-nucleus** $\Delta_t$. The transfer-nucleus is synchronous-phase: it operates on the patient directly and propagates forward — settling whether $a$ is committed to transfer from the current fiber $H_t$ to downstream action. Output: $\Delta_t(a)$ — the transfer-committed form of $a$. This is the active binding step: the element is being moved from "available in fiber" to "committed to operation."

$$\text{Transfer-committing patient:}\quad a \xrightarrow{\Delta_t} \Delta_t(a) \in \mathrm{Fix}(\Delta_t)$$

**Double-patient** $(a, \Delta_t \circ \sigma_t)$: acted on by the **full settlement** — first meaning-settled, then transfer-committed. Output: $\Delta_t(\sigma_t(a)) \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$. A double-patient enters $H^*_t$ — the fixed fiber, the institutionally settled region. The double-patient is the canonical form of full processing.

$$\text{Fully-settled patient:}\quad a \xrightarrow{\sigma_t} \sigma_t(a) \xrightarrow{\Delta_t} \Delta_t(\sigma_t(a)) \in H^*_t$$

The three types are not mutually exclusive stages of one process: they are three formal relationships between an element and an operation. A $\sigma$-patient becomes a double-patient if subsequently paired with $\Delta_t$.

## The biochemical analogy

The word "substrate" in biochemistry names exactly the Patient mode: an enzyme binds to a substrate molecule (the patient), catalyzes a reaction, and releases the product. The formal parallel:

| Biochemical | Relational universe |
|---|---|
| Enzyme | Nucleus $\varphi$ ($\sigma_t$ or $\Delta_t$) |
| Substrate molecule | Patient element $a \in H_t$ |
| Active site | Fiber $H_t$ (the ambient structure where binding occurs) |
| Catalysis | Nuclear application $a \mapsto \varphi(a)$ |
| Product | $\varphi(a) \in \mathrm{Fix}(\varphi)$ |
| Enzyme unchanged | Nucleus preserved: $\varphi$ is the same before and after |
| Substrate consumed | Element transformed: $\varphi(a) \neq a$ (if not already fixed) |

The nucleus (enzyme) is preserved — it is available to catalyze the same reaction on the next patient. The patient (substrate molecule) is transformed — it exits as product. This asymmetry distinguishes the Patient mode from the Base and Foundation modes:

- **Base** and **Foundation** are preserved and unchanged by their superstructures
- The **Patient** is transformed by the operation — it exits as something different from what it entered as

## Patient and MicroFocus

A [MicroFocus](../../../../../../../social-science-services-section/services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/microfocus.md) is a pair $(H_{t^*}, a^*)$ — a designated fiber and a designated element within it. The MicroFocus designates which element is currently being processed. When a nuclear operation $\varphi$ is applied to the MicroFocus element $a^*$, the result is the Patient:

$$(H_{t^*}, a^*) \xrightarrow{\varphi} (H_{t^*}, \varphi(a^*))$$

The MicroFocus is the *attention structure* that selects which element to process; the Patient is the *processing structure* that formalizes what happens to the selected element. A MicroFocus identifies the patient; the Patient concept describes the formal structure of what nuclear processing does to it.

## Patient and fixed points

The fixed fiber $H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ is the set of elements that are invariant under both nuclei — the elements that are already fully processed. An element $a \in H^*_t$ is a degenerate patient: when paired with either nucleus, $\varphi(a) = a$. The operation applies but produces no change.

This is the sense in which $H^*_t$ is the "settled" region of the fiber: it contains all elements that have been processed (reached their fixed-point images) and all elements that were already in product form from the start. A patient element outside $H^*_t$ is one that still needs processing.

The **settlement sequence** of a patient:
$$a \leq \sigma_t(a) \leq \Delta_t(\sigma_t(a)) = a^* \in H^*_t$$
where $a^*$ is the doubly-settled form of $a$. Every element has a canonical settlement: $a^* = \Delta_t(\sigma_t(a))$ is the smallest element of $H^*_t$ above $a$. The patient is transformed toward its settlement; the settlement is the smallest fixed point dominating it.

## Patient vs. adjacent concepts

| Concept | Relation to Patient |
|---|---|
| [Base](../../../../../../../../../engineering-services-section/content/text/glossary/terms/base-substrate.md) | Mode-1 substrate: preserved, not transformed; Patient is Mode-3: transformed |
| [Foundation](./foundation.md) | Mode-2 substrate: preserved, enables sheaf condition; Patient is Mode-3: individual element |
| [Substrate](../../../../../../../biological-science-services-section/services/mycology-services-section/content/text/glossary/terms/substrate.md) | General concept; Patient is one of three modes |
| [MicroFocus](../../../../../../../social-science-services-section/services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/microfocus.md) | Selects the patient element; Patient formalizes what the nucleus does to it |
| Nucleus | The nuclear operation is the agent that transforms the patient; the patient is what gets acted on |
| Fixed fiber $H^*_t$ | Fixed points are invariant patients; elements outside $H^*_t$ are non-trivial patients |

## Open questions

- Whether the **patient concept extends to non-nuclear operations** — whether any monotone endomorphism of $H_t$ can be an "operation" in the patient pair $(a, \varphi)$, or whether nuclei are the only admissible operations. The nucleus axioms (inflation, monotonicity, idempotence) are the formal conditions; without idempotence, repeated application would produce an unbounded sequence rather than a settled output.
- Whether there is a formal notion of **patient chain** — a sequence $(a_0, a_1, a_2, \ldots)$ where $a_{n+1} = \varphi(a_n)$ for a non-idempotent operation — and whether this chain concept captures processes that settle not in one step but through iterated transformation (e.g., negotiated meaning-settlement across multiple nuclei applied in sequence).
- Whether the **double-patient** $(a, \Delta_t \circ \sigma_t)$ is always well-defined — whether $\Delta_t \circ \sigma_t$ is itself a nucleus (satisfying inflation, monotonicity, idempotence). The commutation condition $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ is the requirement that the two nuclei commute; if they commute, then their composition is again idempotent ($({\Delta\sigma})({\Delta\sigma}) = \Delta\sigma\Delta\sigma = \Delta\Delta\sigma\sigma = \Delta\sigma$ using idempotence of each). Commutation is thus the condition for double-patients to be well-defined.
- Whether **patient failure** — applying a nucleus to an element and getting no change when change was expected — has a formal characterization, and whether it is always because $a \in \mathrm{Fix}(\varphi)$ or whether there are cases where a nucleus "fails to engage" for structural reasons other than fixedness.
