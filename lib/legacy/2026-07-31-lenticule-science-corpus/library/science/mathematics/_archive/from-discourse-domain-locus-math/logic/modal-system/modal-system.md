---

title: "Modal System"
description: "Let $(A, Box)$ be a modal algebra, i.e., a Boolean algebra $A$ equipped with a unary operator $Box colon A \to A$ satisfying $Box\top = \top$ and $Box(a wedge b) = Box a wedge Box b$ (normality)."
aliases:
  - "modal system"
  - "modal systems"
date-created: 2025-12-26
tags: []
mathematical-object: modal-algebra
references:
  - id: ref1
    type: document
    title: Blackburn, de Rijke & Venema, Modal Logic, Cambridge University Press, 2001
---

Let $(A, \Box)$ be a modal algebra, i.e., a Boolean algebra $A$ equipped with a unary operator $\Box \colon A \to A$ satisfying $\Box\top = \top$ and $\Box(a \wedge b) = \Box a \wedge \Box b$ (normality).

**Definition.** A *modal system* (or *normal modal logic*) $\Lambda$ is a set of modal formulas containing all propositional tautologies and the axiom

$$\mathbf{K}\colon\; \Box(\varphi \to \psi) \to (\Box\varphi \to \Box\psi),$$

closed under modus ponens, uniform substitution, and the [necessity](teaching/explanations/necessity.md) rule (if $\vdash \varphi$ then $\vdash \Box\varphi$). A modal system is identified with the class of modal algebras validating its theorems.

**Definition.** The principal systems extending **K** are defined by adding axioms:

| System | Additional axiom(s) | Frame condition |
|---|---|---|
| **T** | $\Box\varphi \to \varphi$ | $R$ reflexive |
| **K4** | $\Box\varphi \to \Box\Box\varphi$ | $R$ transitive |
| **S4** | **T** + **4** | $R$ a preorder |
| **B** | **T** + $\varphi \to \Box\Diamond\varphi$ | $R$ reflexive + symmetric |
| **S5** | **S4** + $\Diamond\varphi \to \Box\Diamond\varphi$ | $R$ an equivalence relation |

**Proposition (Soundness and completeness).** *Each system $\Lambda$ in the table above is sound and complete with respect to the corresponding class of [Kripke frames](./kripke-frame.md): $\Lambda \vdash \varphi$ if and only if $\varphi$ is valid on every frame satisfying the given condition.*

*Proof sketch.* Soundness is verified by checking each axiom against the frame condition. Completeness is proved via the canonical model: take $W$ to be the set of maximal $\Lambda$-consistent sets, define $wRv$ iff $\{a : \Box a \in w\} \subseteq v$, and verify the truth lemma. The frame condition on the canonical $R$ follows from the axioms of $\Lambda$. $\square$

**Proposition.** *The modal algebras for S4 are exactly the closure algebras: Boolean algebras with a [closure operator](../../teaching/explanations/closure-operator/index.md) $\Box$ (extensive, monotone, idempotent, preserving $\top$). The fixed-point set $A^{\Box} = \{a : \Box a = a\}$ is a [Heyting algebra](../../teaching/explanations/heyting-algebra/index.md).*

*Proof sketch.* Extensiveness corresponds to the **T** axiom, idempotence to the **4** axiom. The set $A^{\Box}$ is closed under $\wedge$ and $\top$; it inherits a Heyting implication $a \Rightarrow b = \Box(\neg a \vee b)$. $\square$

**Examples.**

- **K** is the modal logic of arbitrary [modal operators](../morphisms/modal-operator.md) on Boolean algebras.
- **S4** is the modal logic of topological spaces, where $\Box$ is the interior operator and $\Diamond$ is the closure operator.
- **S5** is the modal logic of [possibility](teaching/explanations/possibility.md) where all worlds are mutually accessible; the operator $\Box$ is a two-valued modality ($\Box a \in \{\bot, \top\}$ in any simple algebra).
