---
name: formal-axioms-layer
type: narrative
status: sketch
introduces: [differentiate, includes-excludes, together-either, induces, negate, close, open, balance, necessary-possible, flow, dynamic-residuation, cohesive-chain, ritm, states-observables, conserving]
discusses: [generative-closure, self-grounding]
---

The relational calculus has a formal-math articulation that runs in parallel to the act-algebra trace. Where the trace says "Reflex composes with the void to produce Differentiate," the formal layer says "Differentiate is a binary operator $(\text{Entity}, \text{Entity}) \to \text{Rel}$ with such-and-such Tarski semantics, producing a closure operator $c$ on $\mathcal{P}(E)$ satisfying $A \subseteq c(A)$ and $c(c(A)) = c(A)$." The two views describe the same structure; the formal layer makes the structure available to existing mathematical tools (order theory, Heyting algebras, category theory) without requiring the reader to first accept the act-algebra notation.

This narrative collects what the formal axioms look like at each movement. It is the synthesis of the source dump `from-sloppyresearch/content/relationing/formal-axioms-of-relationing/` (Movement I, in axiom-lemma form, ~2900 lines) and `foundations-of-relation/` (Movements I–V in compressed form, ~1200 lines), with the [relational-posets](https://en.wikipedia.org/wiki/Heyting_algebra) section pulled in for the algebraic prototype.

## Movement I (formal)

**Axiom 1 (Differentiate).** A binary operator `Differentiate : (Entity, Entity) -> Rel`. For each $(m, u)$, `Differentiate(m, u)` produces a primitive $r \in \text{Rel}$ with marked side $m$ and unmarked side $u$.

**Lemma 1 (Field of recognition).** Given `Differentiate(m, u)`:

1. `Includes(m, m)` and `Includes(u, u)` (reflexivity).
2. `¬Includes(m, u)` and `¬Includes(u, m)` (asymmetry).

The totality of acts of `Differentiate` forms a domain $D$ supporting two primitive predicates: `Includes(a, b)` (containment, $\llbracket a \rrbracket \subseteq \llbracket b \rrbracket$) and `Excludes(a, b)` (incompatibility, $\llbracket a \rrbracket \cap \llbracket b \rrbracket = \emptyset$). Includes is reflexive and transitive; Excludes is symmetric and irreflexive; cross-stability holds: `Includes(a, b) ∧ Excludes(b, c) → Excludes(a, c)`.

**Axiom 2 (Together / Either).** Operators $\land, \lor : \text{Rel} \times \text{Rel} \to \text{Rel}$ with the standard lattice laws on `Includes`. Together is meet; Either is join.

**Axiom 3 (Induces).** A binary operator $\Rightarrow : \text{Rel} \times \text{Rel} \to \text{Rel}$ characterized by the residuation law

$$\text{Includes}(a \land b, c) \iff \text{Includes}(a, b \Rightarrow c).$$

**Axiom 4 (Negate).** $\neg a := a \Rightarrow \bot$.

**Theorem (Heyting-algebra closure).** $(\text{Rel}, \text{Includes}, \land, \lor, \Rightarrow, \neg, \top, \bot)$ is a complete Heyting algebra. (Distributivity follows from residuation; completeness from the closure construction in the Foundations doc.)

The relevant existential closure: define $c : \mathcal{P}(E) \to \mathcal{P}(E)$ by $c(A) := \{y \mid \exists x \in A, y = x \lor y = \neg x\}$. Then $A \subseteq c(A)$ and $c(c(A)) = c(A)$. Write $\text{Fix}(c)$ for the closure's fixed points; this is the order-theoretic prototype of the field of recognition.

## Movement II (formal)

**Axiom 5 (Close, Open).** Operators $\Box, \Diamond : \text{Rel} \to \text{Rel}$, with $\Box$ a *nucleus* (monotone, inflationary, idempotent) on the Heyting algebra, and $\Diamond$ its De Morgan dual: $\Diamond a = \neg \Box \neg a$.

**Lemma (Frobenius).** $\Box(a \land b) = \Box a \land \Box b$ — the closure preserves Together.

**Theorem (Lax-idempotence).** $\Box$ is *Kelly–Lack lax-idempotent*: there is an adjunction $\mu \dashv \eta_\Box$ in the 2-category of endomorphisms of $\text{Rel}$. Being a $\Box$-algebra is therefore a *property*, not additional structural data. (See [Kelly 1974], [Street 1972], [Riehl–Verity 2018 §7–8] in [references/](../references/).)

**Definition (Necessary / Possible).** $\text{Necessary}(a) := \Box a$, $\text{Possible}(a) := \Diamond a$. Together they generate a modal sub-logic of the Heyting algebra.

## Movement III (formal)

**Axiom 6 (Flow).** A comonad $F = (\text{Flow}, \varepsilon, \delta)$ on $\text{Rel}$ satisfying:

1. **KZ-laxity** (Street 1972 §3): $F(F(a)) \leq F(a)$.
2. **Core preservation**: if $\Box a = a$ then $\Box(F(a)) = F(a)$.
3. **Counit**: $\varepsilon : F \Rightarrow \text{id}$, $\varepsilon_a : F(a) \to a$.
4. **Comultiplication**: $\delta : F \Rightarrow F \circ F$, $\delta_a : F(a) \to F(F(a))$.

**Theorem (Dynamic Residuation).** Flow's interaction with implication satisfies the lax monoidal preservation law (Street §3 Cor.; Riehl–Verity §8.2):

$$F(a \land b) \leq c \iff a \leq F(b \Rightarrow c).$$

Equivalently: logical reasoning remains valid under process application. (Whether this law *defines* Flow's interaction with implication or *follows* from the KZ-comonadic structure is an open question — see [`questions/dynamic-residuation-axiom-or-consequence.md`](../questions/dynamic-residuation-axiom-or-consequence.md).)

The CoKleisli category $F\text{-CoKl}$ has the same objects as $\text{Rel}$ and morphisms $F(X) \to Y$. Coalgebras of $F$ are the *flow-active* recognitions: $a$ such that $F(a) = a$.

## Movement IV (formal)

**Axiom 7 (RITM).** An adjoint quadruple of idempotent endofunctors

$$\Pi^\to \dashv \Box_r \dashv \Diamond_l \dashv \nabla^\leftarrow$$

on a presheaf model of $\text{Rel}$. Read: Shape ⊣ Flat ⊣ Sharp ⊣ Crisp, the Lawvere–Schreiber cohesive adjoint quadruple ([Lawvere–Schreiber 1989/2013], [Shulman, *Cohesive HoTT* §1–3]).

**Definition (Discipline).** A unary endomap $d : \text{Rel} \to \text{Rel}$ such that $d \circ j = j \circ d$ for every nucleus $j$, and $d \circ F = F \circ d$.

**Definition (Regime).** $\text{Regime}(d) := \{a \in \text{Rel} : d(a) = a\}$.

**Definition (Filter).** A Discipline that additionally commutes with the four cohesive functors of RITM.

**Definition (Profile).** $\text{Profile}(F) := \text{Regime}(F)$ for $F$ a Filter.

**Theorem (Filter-Induced Reflexive Reconstruction).** Every Profile carries a complete RelationalStructure, RelationalLanguage, RelationalGeometry, and RelationalPhysics — the entire [four-part framework](../teaching/explanations/four-part-framework.md). (Proof sketch: each layer's defining operations are built from operators that commute with the Filter; their restrictions to the Filter's fixed points yield the layer's Profile-internal version.)

**Theorem (Stratification).** The cohesive chain induces a constructible decomposition $\text{Rel} = \bigsqcup_\alpha S_\alpha$ along which the cohomological invariants stabilize. The diagrammatic counterpart of the Discipline/Regime/Filter/Profile hierarchy is *Stratify / Constructible* — see [`questions/discipline-vs-stratify.md`](../questions/discipline-vs-stratify.md) for whether these are the same hierarchy.

## Movement V (formal)

**Definition (State).** A state of a Profile $P$ is an element of $P$.

**Definition (Observable).** An observable on $P$ is a morphism $P \to L$ for $L$ a value object (typically a complete lattice or, in bilattice-valued settings, a [bilattice](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice.md)).

**Theorem (Existence-Observation Duality / Ambidexterity).** For each coherent configuration with constructible diagram $F$ and dual sheaf of observations $S = F^\vee$:

$$\text{hcolim}\ F \simeq \text{hlim}\ S.$$

(Ayala–Francis ambidexterity for the cohesive ∞-topos.)

**Theorem (Noether correspondence).** If $S : \text{Rel} \to \text{Rel}$ is a continuous symmetry of the system (an endofunctor commuting with Flow), then there is an associated conserved observable $I_S$ such that $I_S \circ F = I_S$.

**Theorem (Self-grounding).** The least fixed point $A_\infty$ of the [generative closure](../teaching/explanations/generative-closure.md) operator $G$ contains the constructors of $G$. The system produces the tools it uses to produce itself. (Three independent demonstrations: generative closure on $\{$Relationlessness$\}$; RITM self-stabilization; Filter-Induced Reflexive Reconstruction.)

## What this layer is for

The formal-axioms layer exists so the relational calculus can be discussed using the same tools other parts of mathematics use — Heyting algebras, lax-idempotent 2-monads, KZ-comonads, cohesive ∞-toposes. Without it, the calculus is locked inside its bespoke act-algebra notation. With it, every theorem in the calculus has a translation into a statement that can be checked using existing literature and machine-formalized using existing proof assistants.

The translation is not yet complete. The Movement I axioms above are the most carefully developed (the source dump runs ~2900 lines on Movement I alone); Movements II–V are sketched at axiom level but the proofs that the act-algebra constructions actually realize the formal-axiom structures are largely unwritten. This is the load-bearing piece of unfinished work the calculus most needs.
