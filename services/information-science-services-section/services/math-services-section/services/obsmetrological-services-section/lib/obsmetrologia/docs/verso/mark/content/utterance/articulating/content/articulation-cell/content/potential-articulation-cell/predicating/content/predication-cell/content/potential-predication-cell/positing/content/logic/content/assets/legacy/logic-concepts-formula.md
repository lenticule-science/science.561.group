---

title: "Formula"
description: "Let $mathcal{L}$ be a formal language with a signature $Sigma$ consisting of constant symbols, function symbols (each with a specified arity), relation symbols (each with a specified arity), and a countable set of variables."
aliases:
  - "formula"
  - "formulas"
  - "well-formed formula"
date-created: 2025-12-26
introduces: definition
tags: []
mathematical-object: formal-language
references:
  - id: ref1
    type: document
    title: Enderton, A Mathematical Introduction to Logic, 2nd ed., Academic Press, 2001
requires:
  - ./connective.md
  - ./quantifier.md
---

Let $\mathcal{L}$ be a formal language with a signature $\Sigma$ consisting of constant symbols, function symbols (each with a specified arity), relation symbols (each with a specified arity), and a countable set of variables.

**Definition.** The set $\mathrm{Form}(\mathcal{L})$ of *well-formed formulas* (or simply *formulas*) of $\mathcal{L}$ is the smallest set satisfying:

1. **Atomic formulas.** If $R$ is an $n$-ary relation symbol and $t_1, \ldots, t_n$ are terms of $\mathcal{L}$, then $R(t_1, \ldots, t_n) \in \mathrm{Form}(\mathcal{L})$. In particular, $\top, \bot \in \mathrm{Form}(\mathcal{L})$.
2. **[Connectives](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/connective.md).** If $\varphi, \psi \in \mathrm{Form}(\mathcal{L})$, then $(\varphi \wedge \psi)$, $(\varphi \vee \psi)$, $(\varphi \to \psi)$, and $(\neg\varphi)$ are in $\mathrm{Form}(\mathcal{L})$.
3. **[Quantifiers](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/quantifier.md).** If $\varphi \in \mathrm{Form}(\mathcal{L})$ and $x$ is a variable, then $(\forall x.\, \varphi)$ and $(\exists x.\, \varphi)$ are in $\mathrm{Form}(\mathcal{L})$.

A *term* of $\mathcal{L}$ is built from variables and constant symbols by iterated application of function symbols.

**Proposition.** *Every formula $\varphi \in \mathrm{Form}(\mathcal{L})$ has a unique parse tree.*

*Proof sketch.* By structural induction on the definition, using the fact that the outermost constructor (connective, quantifier, or atomic predicate) is uniquely determined by the formula's syntax. $\square$

**Definition.** A variable $x$ occurs *free* in $\varphi$ if it is not in the scope of any quantifier $\forall x$ or $\exists x$ within $\varphi$. A *sentence* (or *closed formula*) is a formula with no free variables. An *open formula* defines a [property](../../../../../humanities/theories/philosophy/terms/property.md) or relation depending on the values assigned to its free variables.

**Examples.**

- **Propositional logic.** $\Sigma$ has no function or relation symbols beyond nullary propositional variables $p, q, r, \ldots$ and no quantifiers. Formulas are built by clauses (1) and (2) alone.
- **First-order arithmetic.** $\Sigma = \{0, S, +, \times, <\}$. The sentence $\forall x.\, \exists y.\, (x < y)$ is a closed formula; $x < y$ is an open formula with free variables $x$ and $y$.

A formula is a purely syntactic object. It becomes a [proposition](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/proposition.md) only when interpreted in a [model](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/model.md). The study of which formulas are satisfied by which models is model theory.
