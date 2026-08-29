---
id: double-closure-doctrine
name: DoubleClosureDoctrine
description: "A double-closure doctrine is a Heyting doctrine equipped with two natural commuting nuclei; the fiber doctrine H : T^op → HA_nucl is one, proved from naturality (§reindexing) and commutativity (§nucleus-commutation)"
defines: DoubleClosureDoctrine
---

### Definition — Double-Closure Doctrine {#double-closure-doctrine}

A **closure doctrine** over a category $C$ is a Heyting doctrine
$P : C^{\mathrm{op}} \to \mathbf{HA}$ (§doctrine) equipped with a family of maps
$\{j_c : P(c) \to P(c)\}_{c \in C}$ such that:
- each $j_c$ is a nucleus on $P(c)$: extensive, idempotent, meet-preserving (§nucleus);
- the family is **natural**: for every morphism $f : c \to c'$ in $C$,
  $$P(f) \circ j_{c'} = j_c \circ P(f).$$

A **double-closure doctrine** over $C$ is a Heyting doctrine $P$ equipped with two
such families $\{\sigma_c\}$ and $\{\Delta_c\}$, additionally satisfying:
- **Commutativity**: $\sigma_c \circ \Delta_c = \Delta_c \circ \sigma_c$ for all $c \in C$.

Equivalently, a double-closure doctrine is an object of the functor category
$[C^{\mathrm{op}},\, \mathbf{HA_{nucl}}]$: a presheaf valued in nuclear Heyting algebras
(§nuclear-heyting-algebra), with morphisms that preserve both nuclei.

#### Theorem — The Fiber Doctrine Is a Double-Closure Doctrine {#double-closure-fiber}

**Theorem.** $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ is a double-closure doctrine
over the history category $T$.

**Proof.** The four conditions are verified from results already established:

1. **$\sigma_t$ is a nucleus** at each fiber $H_t$: proved in §saturation-nucleus
   (extensive, idempotent, meet-preserving).

2. **$\Delta_t$ is a nucleus** at each fiber $H_t$: proved in §transfer-nucleus
   (extensive, idempotent, meet-preserving).

3. **Naturality of $\sigma$ and $\Delta$**: for every morphism $f : t \to t'$ in $T$,
   $$H(f)(\sigma_{t'}(a)) = \sigma_t(H(f)(a)), \qquad H(f)(\Delta_{t'}(a)) = \Delta_t(H(f)(a))$$
   for all $a \in H_{t'}$. Proved in §reindexing (Restriction Maps — Preservation of
   nuclei).

4. **Commutativity**: $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ for all $t$.
   This is the commutativity condition of §nucleus-commutation, which is part of the
   fiber doctrine axiom (§fiber-doctrine). $\square$

#### Corollary — The Single-Closure Case {#double-closure-single}

When $\sigma_t = \Delta_t$ for all $t$ (the case of a single nucleus), the commutativity
condition is automatic and the double-closure doctrine reduces to a **closure doctrine**:
a Heyting doctrine with one natural nucleus per fiber. This is the propositional fragment
of the closure hyperdoctrines of Castelnovo et al. (2021): their setup additionally
requires quantifier adjoints $\exists_f \dashv P(f) \dashv \forall_f$ satisfying
Beck-Chevalley, making the structure a closure hyperdoctrine rather than a mere closure
doctrine. The fiber doctrine is the double-closure generalization without quantifiers;
the canonical hyperdoctrine $\mathrm{Sub}_R$ (§hyperdoctrine) is where the quantifiers
enter.

#### Remark — Two Descriptions of the Same Object {#double-closure-remark}

A double-closure doctrine $P : C^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ can be described
in two equivalent ways:

- **Externally** (double-closure doctrine): a Heyting doctrine with two natural commuting
  nuclei.
- **Internally** (nuclear doctrine): a presheaf valued in the category
  $\mathbf{HA_{nucl}}$ of nuclear Heyting algebras.

These are the same object. The external description makes the closure structure visible;
the internal description makes the categorical structure visible. Both are used in this
paper: §doctrine and §fiber-doctrine use the internal description; this unit establishes
the external characterization and its connection to Castelnovo et al. (2021).
