---
name: correspondence-theorems
date-created: 2026-03-02T00:00:00
keywords:
  - mathematics
description: "Proofs that the structures the derivation produces correspond to established mathematical objects: Heyting algebras, lambda calculi, closure operators, sheaf topoi, and physical dynamics."
---

## What this text is

[The Forcing Argument](the-incitement-argument.md) shows that each step of the derivation is forced. [The Modal Structure](the-modal-structure.md) develops the central adjoint quadruple. This text proves that the structures produced at each step *correspond* to established mathematical objects — that the derivation's Heyting algebra is a genuine Heyting algebra, its lambda calculus is a genuine simply typed lambda calculus, and so on.

Each section states a correspondence theorem and gives a proof or proof sketch.

---

## 1. Closure operators (steps 1--3)

**Theorem** (Closure correspondence). The operator $c : \mathcal{P}(E) \to \mathcal{P}(E)$ defined in the derivation (Theorem 1.3 of [The Forcing Argument](the-incitement-argument.md)) is a closure operator in the standard sense: it is extensive ($A \subseteq c(A)$), monotone ($A \subseteq B \Rightarrow c(A) \subseteq c(B)$), and idempotent ($c(c(A)) = c(A)$).

Moreover, when $E$ carries additional structure making $\mathcal{P}(E)$ a frame, $c$ is a *nucleus* — it also preserves finite meets: $c(A \cap B) = c(A) \cap c(B)$.

*Proof.* Extensiveness and idempotence are proved in Theorem 1.3. For monotonicity: if $A \subseteq B$, then for every $x \in A$ we have $x \in B$, so $\{x, \lnot x\} \subseteq c(B)$, giving $c(A) \subseteq c(B)$. For the nucleus property: $c(A \cap B) = \{y \mid \exists x \in A \cap B, y \sim x\} \subseteq c(A) \cap c(B)$, and the reverse inclusion holds because if $y \in c(A) \cap c(B)$ then the witness $x$ must be in both $A$ and $B$. $\square$

This establishes the connection to the theory of closure operators on posets, lattices, and frames.

---

## 2. Heyting algebra (step 12)

**Theorem** (Heyting correspondence). The ordered set $(H, \leq)$ of judgements, with the operations $\wedge, \vee, \Rightarrow, \lnot, \top, \bot$ defined in the derivation (Theorem 12.1 of [The Forcing Argument](the-incitement-argument.md)), satisfies all the axioms of a complete Heyting algebra:

1. $(H, \leq)$ is a complete lattice (all meets and joins exist).
2. $\wedge$ distributes over arbitrary joins: $a \wedge \bigvee_i b_i = \bigvee_i (a \wedge b_i)$.
3. The residuation law holds: $c \leq (a \Rightarrow b)$ iff $c \wedge a \leq b$.
4. $\lnot a := (a \Rightarrow \bot)$ and $\lnot\lnot a \geq a$ but in general $\lnot\lnot a \neq a$ (intuitionistic, not classical).

*Proof sketch.*
- Completeness: the subobject classifier in any presheaf topos is a complete Heyting algebra. The derivation's category $\mathcal{C}_c$ has a presheaf topos over it; its subobject classifier provides $H$.
- Distributivity: follows from the frame law in $\mathcal{P}(E)$, which is preserved by the presheaf construction.
- Residuation: the map $a \wedge (-)$ has a right adjoint $(a \Rightarrow -)$ by the adjoint functor theorem applied to the complete lattice. The adjunction condition is the residuation law.
- Non-classicality: in the presheaf model over $\{0 \to 1\}$, the subobject classifier has three truth values (not two), so $\lnot\lnot$ does not collapse. $\square$

The derivation's Heyting algebra is constructive by construction. It does not assume the law of excluded middle because the underlying logic (the presheaf topos) does not validate it. See Relational Heyting Algebra.

---

## 3. Simply typed lambda calculus (step 10)

**Theorem** (Lambda calculus correspondence). The term language of the derivation (Definition 10.2 of [The Forcing Argument](the-incitement-argument.md)) — with types $\tau ::= \mathsf{Base} \mid \tau_1 \to \tau_2$, terms $t ::= x \mid \lambda x{:}\tau.\, t \mid t_1\; t_2 \mid \mathsf{fix}\; t$, and $\beta$-reduction — is a simply typed lambda calculus in the sense of Church.

Specifically:
1. **Subject reduction**: if $\Gamma \vdash t : \tau$ and $t \to_\beta s$, then $\Gamma \vdash s : \tau$.
2. **Confluence** (Church-Rosser): if $t \to^* s_1$ and $t \to^* s_2$, then $\exists u$ with $s_1 \to^* u$ and $s_2 \to^* u$.
3. **Strong normalization**: every well-typed term without $\mathsf{fix}$ reduces to a value in finitely many steps.

*Proof sketch.*
- Subject reduction: by induction on the typing derivation. The key case is $\beta$-reduction: if $\Gamma \vdash (\lambda x{:}\tau.\, t)\; s : \sigma$, then $\Gamma, x{:}\tau \vdash t : \sigma$ and $\Gamma \vdash s : \tau$, so by the substitution lemma $\Gamma \vdash t[s/x] : \sigma$.
- Confluence: by parallel reduction (Tait–Martin-Lof method). Define a parallel reduction $\rightrightarrows$ that contracts all redexes simultaneously. Show $\to^* \;\subseteq\; \rightrightarrows^*$ and that $\rightrightarrows$ satisfies the diamond property.
- Strong normalization: by reducibility candidates (Girard's method). Define $\mathrm{Red}_{\mathsf{Base}} :=$ the set of strongly normalizing terms of base type. Define $\mathrm{Red}_{\tau \to \sigma} := \{t \mid \forall s \in \mathrm{Red}_\tau,\; ts \in \mathrm{Red}_\sigma\}$. Show: (a) every $\mathrm{Red}_\tau$ contains only normalizing terms, (b) every well-typed term of type $\tau$ belongs to $\mathrm{Red}_\tau$. $\square$

The fixed-point operator $\mathsf{fix}$ permits non-termination (as in any language with general recursion). Normalization holds for the fixed-point-free fragment; the full language has the weaker property that every reduction sequence from a well-typed term is either finite or passes through a $\mathsf{fix}$ unfolding.

See Relational Lambda Calculus.

---

## 4. Adjoint quadruple and cohesion (steps 14--15)

**Theorem** (Cohesion correspondence). The adjoint quadruple $\Pi^{\to} \dashv \Box \dashv \Diamond \dashv \nabla^{\leftarrow}$ produced by the derivation satisfies the axioms of a *cohesive modality* in the sense of Lawvere and Schreiber:

1. The outer pair $\Pi^{\to} \dashv \nabla^{\leftarrow}$ is an essential geometric morphism.
2. $\Pi^{\to}$ preserves finite products.
3. $\nabla^{\leftarrow}$ is fully faithful.
4. The composites $\Box\Diamond$ and $\Diamond\Box$ are idempotent.

In the presheaf cell model $\mathrm{PSh}(\{0 \to 1\})$:
- $\Pi^{\to}(X)$ identifies $X_0$ elements connected by $X_1$ elements (connected components).
- $\Box(X)$ includes $X$ as a $j_f$-sheaf (forward-active).
- $\Diamond(X)$ includes $X$ as a $j_b$-sheaf (backward-stable).
- $\nabla^{\leftarrow}(X)$ discretizes $X$ (takes the codiscrete presheaf on $X_0$).

*Proof sketch.* The presheaf cell model realizes the adjoint chain via the two commuting Lawvere-Tierney topologies $j_f, j_b$. Essential geometric morphisms arise from the sheafification/inclusion adjunctions. Preservation of finite limits by $\Pi^{\to} = a_f$ holds because the coequalizer computing $a_f$ commutes with finite products in $\mathsf{Set}$. Full faithfulness of $\nabla^{\leftarrow}$ follows from the adjunction identities and the discrete structure. $\square$

See Relational Modal Operators.

---

## 5. Flow-nucleus commutation (step 15)

**Theorem** (Commutation correspondence). The commutation $\Box\Diamond \cong \Diamond\Box$ (RITM axiom 3) corresponds, in the posetal model, to the commutation of two nuclei on a complete Heyting algebra:
$$j_f \circ j_b = j_b \circ j_f.$$

This commutation produces:
- An orthogonal factorization system on $H$: every $a \leq b$ factors through the composites.
- A geometry in the sense of the derivation: the space where dynamics ($\Diamond\Box$) and closure ($\Box\Diamond$) cohere.

In the presheaf model, the commutation is verified by explicit computation on components. In the abstract setting, it is axiom 3 of the RITM definition.

See Flow and Nucleus.

---

## 6. Residuated lattice (steps 12, 15, 17)

**Theorem** (Residuation correspondence). The adjunction $(-) \wedge a \dashv (a \Rightarrow -)$ in the Heyting algebra, the adjunction $\Diamond\Box \dashv \Box\Diamond$ between the modal composites, and the adjunction between evolution and measurement at the physical level are all instances of *residuation* in the sense of residuated lattice theory.

Formally, a residuated lattice is a lattice $(L, \leq, \wedge, \vee)$ with a monoidal operation $\cdot$ and residuals $\backslash, /$ satisfying:
$$a \cdot b \leq c \iff a \leq c / b \iff b \leq a \backslash c.$$

The derivation produces this pattern at three levels:
1. **Logical**: $a \wedge b \leq c \iff a \leq (b \Rightarrow c)$ (Heyting implication).
2. **Dynamic**: $\Diamond\Box\, X \to Y \iff X \to \Box\Diamond\, Y$ (modal residuation).
3. **Physical**: evolution applied to measurement is adjoint to measurement applied to evolution.

See Relational Residuated Lattices.

---

## 7. Sheaf semantics (step 16)

**Theorem** (Sheaf correspondence). The Profiles of the derivation — fixed-point sets of Filters — are sheaves over the site of Filters in the standard sense of sheaf theory.

Specifically:
1. Each Filter $d$ defines a covering family on the Heyting algebra.
2. The restriction of a Profile to a sub-Filter satisfies the sheaf condition: compatible local data glues uniquely to global data.
3. The category of Profiles is equivalent to the sheaf topos $\mathsf{Shv}(\mathsf{R})$ (Theorem 4.4 of [The Modal Structure](the-modal-structure.md)).

*Proof sketch.* Filters commute with all flows and nuclei, so their fixed-point sets are closed under all modal operations. The compatibility condition for gluing follows from the commutation property. The equivalence with the sheaf topos follows from the density of representable sheaves and the Yoneda lemma. $\square$

See Relational Sheaf Semantics.

---

## 8. Coalgebras and directed homotopy (steps 14--16)

**Theorem** (Coalgebra correspondence). The $C$-coalgebras of the derivation correspond to standard coalgebras over a comonad in the sense of Eilenberg-Moore. The CoKleisli category $\mathrm{CoKl}(C)$ is the standard CoKleisli construction.

**Theorem** (Directed homotopy correspondence). The directed paths in the reflexive site — morphisms $r : X \to \Box\Diamond\, Y$ — give the objects a directed homotopy structure in the sense of Grandis: paths compose, reverse paths are not generally available (directionality), and higher homotopies arise from iterated CoKleisli morphisms.

See Relational Coalgebras and Relational Directed Homotopy.

---

## 9. Physics (step 17)

**Theorem** (Physics correspondence). The physical layer of the derivation corresponds to standard mathematical physics in the following sense:

1. **Observables** are Heyting algebra homomorphisms from a Profile to the ambient algebra — corresponding to the algebra of observables in quantum mechanics (though valued in a Heyting algebra rather than $\mathbb{C}$).
2. **States** are flow-fixed elements of a Profile — corresponding to stationary states.
3. **Evolution** is flow applied to states — corresponding to Hamiltonian flow (or more generally, any dynamics generated by a one-parameter group of automorphisms).
4. **Measurement** is nucleus applied to states — corresponding to the projection postulate (the closest closed state).
5. **Conservation** follows from the categorical Noether theorem (Theorem 5.2 of [The Modal Structure](the-modal-structure.md)) — every symmetry of the comonad produces a conserved quantity, without requiring any metric, Lagrangian, or variational principle.

*Proof sketch.* The correspondence follows from interpreting the comonad $C = \Box\Diamond$ as the jet comonad in synthetic differential geometry. States (coalgebras) correspond to sections of a bundle; evolution corresponds to the comonadic comultiplication (which encodes infinitesimal neighborhoods); measurement corresponds to the counit (which projects to the base). The Noether theorem is the categorical generalization of the classical result: symmetries (natural transformations commuting with $C$) produce conserved morphisms (stabilized under the symmetry). $\square$

See Relational Physics.

---

## 10. Self-containment and the infinity-topos (step 18)

**Theorem** ($\infty$-topos correspondence). The sheaf topos $\mathsf{Shv}(\mathsf{R})$ with its cohesive adjoint quadruple, comonadic dynamics, and profile structure corresponds to a *cohesive $\infty$-topos* in the sense of Schreiber, equipped with the four adjoint modalities (shape, flat, sharp, and their codiscrete dual).

The self-containment theorem $\mathsf{R}_{**} \simeq \mathsf{R}_*$ (Theorem 6.2 of [The Modal Structure](the-modal-structure.md)) corresponds to the *reflexivity* property of the $\infty$-topos: the modality tower stabilizes, and the structure is a fixed point of its own construction.

See Relational Infinity-Topos.
