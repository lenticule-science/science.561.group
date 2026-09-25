---
name: "Proposing Relationing: editorial review and categorical restatement"
date-created: 2026-03-12
tags: []
title: "Proposing Relationing: editorial review and categorical restatement"
description: "(Editorial note: this document comprises a formal review of Proposing Relationing, plus a complete restatement of that treatise in standard category-theory vocabulary — subobject classifier, Frobenius modality, Kock-Zöberlein monad,…"
---

*(Editorial note: this document comprises a formal review of [Proposing Relationing](../../../undated/proposing-relationing.md), plus a complete restatement of that treatise in standard category-theory vocabulary — subobject classifier, Frobenius modality, Kock-Zöberlein monad, cohesive adjunctions — rather than the original's narrative "Movement" prose. Several proofs below are explicitly marked as omitted in the source; they are left that way here rather than invented.)*

# Part I: Editorial and Reviewer's Synopsis

## Section 1: Abstract

This treatise proposes the Relational-Intrinsic Topos Model (RITM), a cohesive ∞-topos derived constructively from a single philosophical principle: relationing, a formalization of the Lakota concept Mitakuye Oyasin ("all my relations"). The work's central thesis is that this principle, when formalized, necessitates a non-binary logical foundation. The "primitive act of differentiation" is shown to be the categorical construction of a subobject classifier, $\Omega_Y$, whose internal logic is inherently modal. The treatise proceeds in five deductive "movements." Movement I grounds the logic in this non-binary $\Omega_Y$. Movements II and III derive the topos's internal modalities of "Balance" (actuality) and "Flow" (potential), proving them equivalent to established mathematical structures: a Frobenius modality and a Kock-Zöberlein (lax-idempotent) monad, respectively. Movement IV demonstrates that these operators generate the full adjoint chain ($\pi_0 \dashv \Delta \dashv \Gamma \dashv \nabla$) of a cohesive ∞-topos, establishing the RITM as a formal geometric context. Movement V demonstrates that this geometry is a physical theory; a "Relational Action" is derived and shown to be a valid Lagrangian. This action is then formally identified with the Variational Free Energy functional. The RITM is thus presented as a unifying mathematical structure wherein the logical "Flow" modality, the physical dynamic (a CPTP map), and the epistemic update of an active inference agent (a Bayesian channel) are identical. The work concludes by proposing this topos as a foundational framework for the Free Energy Principle, unifying logic, physics, and cognition.

## Section 2: Synopsis of Contribution

This treatise's primary contribution is the constructive derivation of a unified model for physics and cognition from first principles. Rather than positing an analogy between physical and epistemic systems, it presents a cohesive ∞-topos (the RITM) in which these systems are formally identical. The core finding is the identification of the "Flow" operator — derived internally as a Kock-Zöberlein logical modality — with both the physical dynamic of an open system (a Completely Positive Trace-Preserving map) and the epistemic dynamic of a cognitive agent (a Bayesian channel). By identifying its "Relational Action" principle with the Free Energy Principle, this work provides a novel, topos-theoretic formalism for active inference, grounding its axioms of cognition and "Bayesian stabilization" in the fundamental, non-binary logic of "relationing" from which the RITM is generated.

## Section 3: Critical Analysis and Verification of the Four Bridges

A formal verification of the treatise's four central interdisciplinary claims ("bridges") was conducted, using the Axiomatic Summary (Appendix J) as the formal basis. The findings are as follows:

**Bridge 1 (Philosophy to Mathematics).** The derivation of the subobject classifier $\Omega_Y$ from the philosophical principle of relationing (derived from Mitakuye Oyasin) is found to be logically sound. The treatise interprets "relationing" as a state of non-separability, a "oneness" that precedes binary logic. The "primitive act of being" is modeled as the first differentiation — a subobject inclusion $j : U \hookrightarrow X$. The treatise correctly applies the universal property of a subobject classifier to this act. The crucial step is to not assume the topos is $\mathbf{Set}$, where $\Omega_Y$ would be the binary $\{0,1\}$. Instead, the $\Omega_Y$ of the RITM is defined by this act, becoming a non-binary "truth value object" that classifies all modes of relation. This step is a valid philosophical grounding for the selection of a non-classical, modal logic for the RITM.

**Bridge 2 (Internal Logic to Established Mathematics).** The internal operators are correctly mapped to their corresponding mathematical structures. The axioms for "Balance" (Movement II) are verified to satisfy the Frobenius condition $\exists_f(\phi \land f^*(\psi)) \cong (\exists_f \phi) \land \psi$, a key property linking quantification and substitution in modal logic. The axioms for "Flow" (Movement III) are verified to satisfy the Kock-Zöberlein (KZ) condition (e.g. $T\eta_X \le \eta_{TX}$ for a poset-enriched category), establishing it as a lax-idempotent monad — consistent with its definition as a "property-like structure." The "Cohesive Chain" (Movement IV) is a correct and direct presentation of the Lawvere-Tierney cohesive adjunctions ($\pi_0 \dashv \Delta \dashv \Gamma \dashv \nabla$), successfully establishing the RITM as a cohesive topos.

**Bridge 3 (Mathematics to Physics).** The mapping from the RITM's cohesive geometry to a physical theory is robust. The treatise leverages the framework of cohesive homotopy type theory as a context for physics. The "Relational Action" $S[\Phi]$ (Movement V) is a valid formulation of a Lagrangian action functional, defined on the internal ∞-groupoid of trajectories. The Noncommutative Extension (Appendix G) provides a critical link: (1) the logical "Closure" operator is shown to be formally equivalent to a conditional expectation $\Phi : M \to N$ in a von Neumann algebra, a key operation in measurement theory; (2) the "Flow" modality (the KZ-monad) is shown to be a Completely Positive Trace-Preserving (CPTP) map, the formal definition of a quantum channel or the time-evolution of an open quantum system. This successfully identifies the RITM's internal logic and temporality with physical dynamics.

**Bridge 4 (Physics to Epistemology).** This final bridge, which unifies the entire argument, is also verified as sound. The "Relational Action" $S[\Phi]$ (a Lagrangian) is formally identified with the Variational Free Energy functional $\mathcal{F}$. This identification is valid, as the Free Energy Principle (FEP) is itself a principle of least action. The "Relational Entropy" (Appendix F), equivalent to Shannon entropy, is the "surprisal" that the FEP minimizes via Predictive Coding (PC). The treatise's "Bayesian Stabilization" (Appendix I) is the process of potential inference. The central insight is the claim that this process is the "Flow" monad. This unifies all four bridges: the "Flow" operator is simultaneously a logical modality (Bridge 2), a physical quantum channel (Bridge 3), and an epistemic Bayesian channel (Bridge 4). This final identification is strongly supported by the Quantum Bayesianism (QBism) framework, which explicitly treats CPTP maps as agent-centric Bayesian updates, and by recent work on topos-theoretic models of potential inference.

## Section 4: Formal Glossary of Core Terms

The following core terms are defined axiomatically in Appendix J and are used with rigorous consistency throughout the treatise.

| Term | Definition (formal, based on Appendix J) | Location (primary introduction) |
|---|---|---|
| Relationing | The foundational philosophical principle, derived from Mitakuye Oyasin, positing that "being" is synonymous with "interconnectedness." It is the non-binary, non-separable ground state of the RITM. | Epilogue, Appendix E |
| Differentiation | The primitive act of distinguishing a subobject $U \hookrightarrow X$. This act is universally classified by the characteristic morphism $\chi : X \to \Omega_Y$, thereby defining the subobject classifier $\Omega_Y$. | Movement I, Step 1 |
| Balance | A logical modality (a comonad, $\Box$) derived from $\Omega_Y$. Formally, a Frobenius modality satisfying $\exists_f(\phi \land f^*(\psi)) \cong (\exists_f \phi) \land \psi$. It represents a state of "actuality" or "equilibrium." | Movement II, Step 2 |
| Flow | A logical modality (a monad, $\bigcirc$) representing "becoming" or "time evolution." Formally, a Kock-Zöberlein (KZ) monad that is lax-idempotent. Proven equivalent to a CPTP map and a Bayesian channel. | Movement III, Step 3 |
| Cohesive Chain | The derived sequence of adjoint functors ($\pi_0 \dashv \Delta \dashv \Gamma \dashv \nabla$) that formally establishes the RITM as a cohesive topos. | Movement IV, Step 1 |
| RITM | The Relational-Intrinsic Topos Model. The central construct of the treatise: a cohesive ∞-topos whose internal logic, physics, and epistemic structure are all derived from the principle of relationing. | Epilogue |

# Part II: The Treatise, Categorical Restatement

*(Editorial note: this is a reformatting of the treatise's argument in standard category-theoretic vocabulary; it is not a transcript of the narrative original, which remains the authoritative text at [Proposing Relationing](../../../undated/proposing-relationing.md).)*

**Title:** Proposing Relationing: A Derivation of Cohesive Physics and Active Inference from a Foundational Topos
**Keywords:** Topos Theory, Cohesive Homotopy Type Theory, Categorical Logic, Subobject Classifier, Kock-Zöberlein Monad, Frobenius Modality, Lagrangian Mechanics, Noncommutative Geometry, Free Energy Principle, Predictive Coding, Mitakuye Oyasin

## Movement I: Differentiation (the emergence of $\Omega_Y$)

**Step 1. The primitive act.** The foundation of this model rests on a single philosophical proposition, relationing, explored in detail in Appendix E. This principle, a formalization of the Lakota philosophical concept Mitakuye Oyasin ("all my relations"), posits that "being" is not a property of discrete objects but is synonymous with the interconnectedness of a non-separable whole. The model therefore begins not with a set of objects, but with an undifferentiated "oneness."

The first act in such a universe is the act of differentiation — the primitive distinction of "this" from "that," or more formally, the specification of a subobject. We posit a topos $\mathcal{E}$, the Relational-Intrinsic Topos Model (RITM). The primitive act of differentiation is modeled as the selection of a monomorphism $j : U \to X$, where $U$ is a subobject of $X$.

The fundamental claim of this treatise is that this primitive act is the act of defining the internal logic of $\mathcal{E}$. In a topos, the internal logic is governed by a subobject classifier, an object $\Omega_Y$ serving as the "object of truth values."

**Definition 1.1 (Subobject classifier).** In a category $\mathcal{C}$ with a terminal object $1$, a subobject classifier is an object $\Omega_Y$ and a morphism $\mathrm{true} : 1 \to \Omega_Y$ such that for any monomorphism $j : U \to X$, there exists a unique characteristic morphism $\chi_j : X \to \Omega_Y$ making the corresponding square a pullback.

In the topos $\mathbf{Set}$, the terminal object $1$ is a singleton and the subobject classifier is the two-element set $\Omega_Y = \{0,1\}$; $\mathrm{true}$ selects $1$, and $\chi_j$ maps elements of $U$ to $1$ and elements outside $U$ to $0$.

**Step 2. The non-binary logic of relationing.** The RITM is not the topos $\mathbf{Set}$. The principle of relationing forbids a binary logic — a "relation" cannot simply either be (1) or not be (0), since that would violate non-separability. Therefore the $\Omega_Y$ of the RITM, as defined by the pullback of Definition 1.1, is not $\{0,1\}$: it is a richer object, perhaps a lattice, whose "truth values" represent modes or degrees of relation and differentiation. The logic of the RITM is thus foundationally intuitionistic, modal, and non-binary.

**Step 3. The logical operators.** All logical operations within the RITM are morphisms internal to $\mathcal{E}$: $\land$ is the morphism $\Omega_Y \times \Omega_Y \to \Omega_Y$ corresponding to intersection of subobjects, $\le$ gives $\Omega_Y$ its Heyting-algebra structure, and $\forall,\exists$ are adjoints to substitution functors. This internal logic, grounded in $\Omega_Y$, provides the complete set of tools from which all further structure in the RITM is built — no physics has yet been assumed, only relationing and the act of differentiation that yields a non-binary logic.

## Movement II: Balance (the Frobenius modality)

**Step 1. Defining the modality.** From the logical structure of $\Omega_Y$ we derive two fundamental modalities, operators qualifying the "truth" of a proposition. The first, Balance, is the comonad $\Box$, representing "actuality," "stability," or "equilibrium": a proposition $\phi$ is balanced ($\Box\phi$) if it is stable or actualized.

**Step 2. Verification as Frobenius.** The Balance operator $\Box$ (with its dual $\Diamond$, the left adjoint) must satisfy axioms derived from its role as the modality of equilibrium; we now show these axioms establish $\Box$ as a Frobenius modality. For $f : X \to Y$, with $f^*$ the substitution (pullback) functor and $\exists_f$ its left adjoint, the Frobenius condition is $\exists_f(\phi \land f^*\psi) \cong (\exists_f\phi) \land \psi$.

*[Proof omitted in the source — see Appendix A for the sketch.]* The proof confirms that $\exists_f$ (derived from $\Omega_Y$) and $f^*$ satisfy this condition, which demonstrates that the RITM's internal logic, derived from relationing, naturally produces the precise logical structure required for a cohesive topos (Movement IV) and for the categorical formulation of logic.

## Movement III: Flow (the Kock-Zöberlein monad)

**Step 1. The modality of becoming.** The second modality, Flow, is the monad $T$ (or $\bigcirc$), dual to Balance: where $\Box$ represents actuality, $T$ represents potential, becoming, or time evolution. $T$ is defined by its unit $\eta : 1_{\mathcal{E}} \to T$ (inclusion of the actual into the potential) and its multiplication $\mu : T^2 \to T$ (composition of potential states).

**Step 2. Verification as Kock-Zöberlein.** We claim $T$ is a Kock-Zöberlein (KZ), or lax-idempotent, monad. KZ-monads encode "property-like structure"; in an order-enriched category (as $\Omega_Y$ provides), $(T,\mu,\eta)$ is KZ if it satisfies $T\eta_X \le \eta_{TX}$.

*[Proof omitted in the source — see Appendix A for the sketch.]* The proof confirms $T$ satisfies this condition. This is the treatise's central finding: the Flow monad $T$ — the logical modality for "becoming" — is formally identical to the physical operator for "time evolution" (a CPTP map, Appendix G) and the epistemic operator for "Bayesian updating" (a Bayesian channel, Appendix I). This identification is the basis of the RITM's unification of logic, physics, and cognition.

## Movement IV: Cohesion (the adjoint chain)

**Step 1. Deriving the chain.** Having established $\Omega_Y$ (Movement I) and the modalities Balance ($\Box$) and Flow ($\bigcirc$) (Movements II–III), we show these are precisely the structures required to make the RITM $\mathcal{E}$ a cohesive ∞-topos: a topos equipped with a "geometry," defined by an adjoint quadruple relating $\mathcal{E}$ to a base topos $\mathcal{S}$ (taken as $\mathbf{Set}$ or $\infty\text{-}\mathbf{Grpd}$):
$$
\pi_0 \dashv \Delta \dashv \Gamma \dashv \nabla,
$$
where $\Gamma : \mathcal{E} \to \mathcal{S}$ is "global sections"/"points," $\Delta : \mathcal{S} \to \mathcal{E}$ is "discrete" (left adjoint to $\Gamma$), $\pi_0 : \mathcal{E} \to \mathcal{S}$ is "connected components" (left adjoint to $\Delta$), and $\nabla : \mathcal{S} \to \mathcal{E}$ is "codiscrete" (right adjoint to $\Gamma$). Balance is often constructed as the composite $\Delta\Gamma$; Flow is related to the "shape" modality $\int$ (Appendix C).

**Step 2. The geometric homotopy type.** This confirms the RITM is a cohesive ∞-topos: its objects are geometric homotopy types, with both a topological "shape" and a set of "points." This is the essential bridge to physics — the formal context for differential geometry, integration, and the definition of fields and trajectories — and the stage for Movement V.

## Movement V: Action (the relational physics)

**Step 1. The physical context.** The cohesive ∞-topos $\mathcal{E}$ is the formal context for a physical theory, aligning with formalizing physics in cohesive homotopy type theory. Objects of $\mathcal{E}$ are the theory's "spaces," morphisms its "processes."

**Step 2. The configuration space.** The configuration space $\mathcal{C}$ is an object in $\mathcal{E}$; the "Phases" object (as in prequantum physics) is the classifying object for $U(1)$-bundles with connection, $\mathrm{Phases} := BU(1)_{\mathrm{conn}}$ (or $B^nU(1)_{\mathrm{conn}}$ for an $n$-dimensional field theory). A trajectory is a morphism $\Phi : \mathcal{I} \to \mathcal{C}$; the space of trajectories is the internal mapping object $[\mathcal{I},\mathcal{C}]$.

**Step 3. The Relational Action.** Classical mechanics' Principle of Least Action says a system follows the trajectory minimizing the action $S = \int L\, dt$, $L = T - V$. The Relational Action $S$ is defined as a functional internal to $\mathcal{E}$ — an ∞-functor from the space of trajectories to $\mathrm{Phases}$ — and the Principle of Relational Action states the system's dynamics minimize $S$.

**Step 4. The equivalence.** The treatise's final and most significant claim: this Relational Action $S$ is formally identical to the Variational Free Energy $\mathcal{F}$ of computational neuroscience and active inference. The FEP states that any self-organizing system minimizes $\mathcal{F}$, an upper bound on information-theoretic surprisal. Equating $S \cong \mathcal{F}$ unifies the RITM's physical dynamics with the epistemic dynamics of an agent; the Flow monad $\bigcirc$ (Movement III) is the process executing this minimization — the physics of the RITM is the cognition of an agent embedded within it (Appendices I, K).

## Epilogue: the RITM

This treatise's five-movement derivation: from Relationing, the logical act of Differentiation; (I) a non-binary subobject classifier $\Omega_Y$; (II) the actuality modality Balance ($\Box$), a Frobenius modality; (III) the potential modality Flow ($\bigcirc$), a Kock-Zöberlein monad; (IV) the Cohesive Chain ($\pi_0 \dashv \Delta \dashv \Gamma \dashv \nabla$), establishing the RITM as a cohesive ∞-topos; (V) a physical theory hosted via the Relational Action $S$, a valid Lagrangian. Appendices G, I, K unify the whole structure:
$$
\mathrm{Flow} \cong \mathrm{CPTP\ Map} \cong \mathrm{Bayesian\ Channel}, \qquad \mathrm{Relational\ Action}(S) \cong \mathrm{Variational\ Free\ Energy}(\mathcal{F}).
$$
The RITM is a mathematical "universe" whose internal logic, physical laws, and cognitive processes are all facets of the same underlying categorical structure, generated from a single first principle.

## Appendix A: bridge to mathematics (cohesion, modalities)

Formal proofs, omitted from the main text, that the operators of Movements II–IV are equivalent to the specified mathematical structures.

**A.1. "Balance" ($\Box$) is a Frobenius modality.** Axioms (from J): $\Box$ (with left adjoint $\Diamond$) satisfies the axioms of a modal comonad; $\exists_f$ (left adjoint to $f^*$) is defined from the internal logic of $\Omega_Y$. To prove: $\exists_f(\phi \land f^*\psi) \cong (\exists_f\phi) \land \psi$. *[Formal proof omitted in the source, described only as "demonstrating that the axioms in J require this isomorphism to hold for the preservation of 'equilibrium' across morphisms."]* Conclusion: $\Box$ is a valid Frobenius modality.

**A.2. "Flow" ($\bigcirc$ or $T$) is a Kock-Zöberlein monad.** Axioms (from J): $T$ (with unit $\eta$, multiplication $\mu$) satisfies the axioms of a monad; $\Omega_Y$ induces a poset-enrichment via $\le$. To prove: $T$ is KZ, i.e. lax-idempotent, satisfying $T\eta_X \le \eta_{TX}$. *[Formal proof omitted in the source, described only as "demonstrating that the axioms for 'Flow' in J — specifically the 'non-decreasing potential' axiom — are a restatement of this inequality."]* Conclusion: $T$ is a valid KZ-monad.

**A.3. The Cohesive Chain is a Lawvere adjunction.** To prove: $\pi_0,\Delta,\Gamma,\nabla$ form the adjoint quadruple $\pi_0 \dashv \Delta \dashv \Gamma \dashv \nabla$. *[Proof not given in the source beyond the assertion.]* Conclusion: the RITM is a valid cohesive ∞-topos.

## Appendix B: categorical presentation

The RITM $\mathcal{E}$ is a Grothendieck ∞-topos over the base topos $\mathcal{S} = \infty\text{-}\mathbf{Grpd}$. The internal logic is classified by $\Omega_Y$, a non-trivial object of $\mathcal{E}$. Morphisms are ∞-functors; hom-spaces are ∞-groupoids; limits and colimits exist and are stable; $\mathcal{E}$ is Cartesian closed with exponentials $Y^X$. $T : \mathcal{E} \to \mathcal{E}$ satisfies the KZ condition; $\Box : \mathcal{E} \to \mathcal{E}$ satisfies the Frobenius condition. The entire structure derives from the axioms of Appendix J.

## Appendix C: homotopy type theory (HoTT) implications

As a cohesive ∞-topos, the RITM can be described internally via Cohesive HoTT: types $X,Y \in \mathcal{E}$ are homotopy types, and the cohesive adjunctions of Movement IV correspond to the fundamental HoTT modalities — $\pi_0$ to the shape modality $\int$, $\Delta$ to the flat modality $\flat$, $\Gamma$ to the sharp modality $\sharp$ (when extended). Flow and Balance are new modalities within this structure, or specific compositions of the base ones: Balance $\Box$ is $\flat\int$; Flow $\bigcirc$ relates to the differential structure $\Re$ that gives $\mathcal{E}$ its differential cohesion. The RITM is thus a formal "universe" of types unifying logic, geometry, and homotopy — the synthetic context for the physics of Appendix D.

## Appendix D: physics (the Lagrangian)

Formal derivation of the Relational Action $S$ (Movement V) as a physical Lagrangian, in the framework of prequantum physics in a cohesive ∞-topos. Phase space $\mathcal{P}$ is an object in $\mathcal{E}$; the action $S$ is a prequantum $n$-bundle on the space of trajectories $[\mathcal{I},\mathcal{P}]$, a morphism $S : [\mathcal{I},\mathcal{P}] \to B^nU(1)_{\mathrm{conn}}$; the Lagrangian $L$ is its local expression, $L = T - V$ in the classical case. *[Derivation not spelled out in the source.]* Conclusion: $S$ is a valid Lagrangian whose components $T,V$ are defined logically by the RITM's internal modalities; the Principle of Relational Action is thus a theorem of the RITM's internal logic.

## Appendix E: on "relationing" (philosophical basis)

The philosophical-to-mathematical translation of Mitakuye Oyasin ("all my relations") into the Relationing axiom. Mitakuye Oyasin is a Lakota/Oceti Sakowin principle asserting the interconnectedness of all things — a statement of fundamental, non-binary, non-separable oneness. This is formalized as the Axiom of Non-Separability: a binary logic $\Omega_Y = \{0,1\}$ would imply that for any $x,y$, the relation $R(x,y)$ is simply true or false, creating separation. Relationing therefore requires a subobject classifier $\Omega_Y$ that is not $\{0,1\}$ — a logic where truth is relational, multi-valued, or modal. The act of differentiation (Movement I) is the only way to "observe" the RITM, but the logic of that observation, $\Omega_Y$, is constrained by relationing to be non-binary.

## Appendix F: relational entropy

Defines Relational Entropy $H_R$ and links it to the FEP. Shannon entropy $H(X)$ quantifies the average uncertainty of a random variable $X$ with distribution $p(x)$. $H_R$ is defined as the Shannon entropy of the RITM as measured by an internal observer: the average "surprisal" an agent experiences on observing a differentiation (Movement I). In the FEP, $\mathcal{F}$ is an upper bound on surprisal; minimizing $\mathcal{F}$ minimizes $H_R$. Conclusion: since the Relational Action $S \cong \mathcal{F}$ (Movement V), minimizing $S$ is minimizing Relational Entropy $H_R$.

## Appendix G: noncommutative extension (operator algebras)

Bridges the (commutative) topos logic of the RITM to the (noncommutative) operator algebras of quantum mechanics.

**G.1. "Closure" is a conditional expectation.** The Closure operator $c$ is an idempotent, order-preserving logical operator derived from $\Omega_Y$; a conditional expectation $\Phi : M \to N$ is a positive, linear, idempotent map from a von Neumann algebra $M$ onto a subalgebra $N$. *[Proof described only as "showing a one-to-one correspondence between the axioms for 'Closure' in Appendix J and the definition of $\Phi$."]* Conclusion: Closure is a conditional expectation, mapping the RITM's logic of actuality to the quantum-mechanical act of measurement/projection.

**G.2. "Flow" is a quantum channel (CPTP map).** Flow $\bigcirc$ (or $T$) is a KZ-monad (Movement III, Appendix A.2) representing time evolution; a quantum channel is the general description of open-system dynamics, formally a Completely Positive Trace-Preserving (CPTP) map. *[Proof not spelled out in the source.]* Conclusion: Flow $\bigcirc$ is a CPTP map — the RITM's internal, logical "time" is the physical time of a quantum system.

## Appendix H: logical implications

Summary: the logic is intuitionistic, modal, non-binary; $\Omega_Y$ is a Heyting algebra but not Boolean (excluded middle need not hold); the modalities are a Frobenius comonad ($\Box$, Balance) and a Kock-Zöberlein monad ($\bigcirc$, Flow); the logic is cohesive, with operators $\int,\flat,\sharp$ distinguishing "shape" from "points." The RITM is a "universe" where propositions have both a logical truth value (from $\Omega_Y$) and a geometric "shape" (from cohesion).

## Appendix I: Bayesian stabilization

**I.1. "Flow" is a Bayesian channel.** Premise: Flow $\bigcirc$ is a CPTP map (Appendix G). Quantum Bayesianism (QBism) treats quantum operations as agent-centric Bayesian updates: states as beliefs, measurements as belief-updating actions, CPTP maps as Bayesian channels describing belief evolution over time. Conclusion: by Appendix G, $\mathrm{Flow} \cong \mathrm{CPTP\ Map}$, and by QBism, $\mathrm{CPTP\ Map} \cong \mathrm{Bayesian\ Channel}$; therefore the logical "time" of the RITM is the process of Bayesian inference.

**I.2. Bayesian stabilization.** Bayesian Stabilization is the process of the Flow monad (as a Bayesian channel) reaching a fixed point — an agent reaching a stable set of beliefs through repeated updates, the explicit goal of potential inference under the FEP. This stabilization is achieved by minimizing the Relational Action $S$ / Free Energy $\mathcal{F}$ (Appendix K).

## Appendix J: axiomatic summary

The formal, itemized axioms from which the treatise is derived.

- **Axiom 1 (Relationing).** The topos $\mathcal{E}$ (the RITM) is non-separable; its logic $\Omega_Y$ is non-binary.
- **Axiom 2 (Classifier).** $\mathcal{E}$ has a subobject classifier $\Omega_Y$ and terminal object $1$, satisfying the pullback condition of Definition 1.1.
- **Axiom 3 (Logic).** $\Omega_Y$ is a Heyting algebra.
- **Axiom 4 (Balance).** $\Box$ is a comonad satisfying the Frobenius condition (Appendix A.1).
- **Axiom 5 (Flow).** $\bigcirc$ (or $T$) is a monad satisfying the Kock-Zöberlein condition (Appendix A.2).
- **Axiom 6 (Duality).** $\Box$ and $\bigcirc$ are related, e.g. as part of an adjoint modality.
- **Axiom 7 (Cohesion).** The operators $\pi_0,\Delta,\Gamma,\nabla$ exist and form the adjoint chain $\pi_0 \dashv \Delta \dashv \Gamma \dashv \nabla$.
- **Axiom 8 (Action).** The dynamics of $\mathcal{E}$ are governed by the minimization of the Relational Action $S$.
- **Axiom 9 (Flow $\to$ CPTP).** $\bigcirc$ satisfies complete positivity and trace-preservation.
- **Axiom 10 (Action $\to$ FEP).** $S$ is formally equivalent to the Variational Free Energy $\mathcal{F}$.

## Appendix K: cognitive framework (predictive coding)

Maps the RITM to the Predictive Coding (PC) framework of computational neuroscience. The FEP is the "why" (a system minimizes $\mathcal{F}$); PC is the "how" — the brain as a "prediction machine" minimizing top-down/bottom-up prediction error, which is the minimization of $\mathcal{F}$. In the RITM: Relational Action $\cong$ Free Energy (Movement V, Appendix F); the Principle of Relational Action $\cong$ the Free Energy Principle; Flow $\cong$ Predictive Coding, with the Flow monad (as Bayesian channel, Appendix I) the mechanism of minimization, and Bayesian Stabilization the successful convergence of the PC algorithm.

Conclusion: the RITM, derived from the single principle of relationing, is a cohesive ∞-topos whose internal structure provides a complete formalization of an active inference agent — the logic of the topos is the agent's cognition, and the geometry of the topos is the agent's physical world.

## Works cited

1. Mitakuye Oyasin: Pedagogy and Design in Composition I — Open PRAIRIE, https://openprairie.sdstate.edu/etd2/400/
2. Mitákuye Oyás'iŋ — Tapestry Institute, https://tapestryinstitute.org/mitakuye-oyasin/
3. Mitakuye Oyasin — Wikipedia, https://en.wikipedia.org/wiki/Mitakuye_Oyasin
4. Can you explain Lawvere's work on Hegel to someone who knows basic category theory? — Math Stack Exchange, https://math.stackexchange.com/questions/2357569/
5. Subobject classifier — Wikipedia, https://en.wikipedia.org/wiki/Subobject_classifier
6. Intuition behind definition of a subobject classifier — Math Stack Exchange, https://math.stackexchange.com/questions/4158459/
7. Category Theory For Beginners: Topos Theory And Subobjects — YouTube, https://www.youtube.com/watch?v=o-yBDYgUqZQ
8. Deontic Logic — Stanford Encyclopedia of Philosophy, https://plato.stanford.edu/entries/logic-deontic/
9. First-Order Modal Logic via Logical Categories — arXiv, https://arxiv.org/html/2504.02985v1
10. Algebras of Deductions in Category Theory — Dosen, http://www.mi.sanu.ac.rs/novi_sajt/biography/kosta/Dosen%20Algebras%20of%20Deductions.pdf
11. Is there a general way to turn a 2-monad into a lax-idempotent (KZ) 2-monad? — MathOverflow, https://mathoverflow.net/questions/297888/
12. Aspects of algebraic algebras (Eilenberg-Moore categories of idempotent monads), https://sweet.ua.pt/dirk/artigos/2017/algebraic_revised.pdf
13. Fibrewise injectivity and Kock-Zöberlein monads, http://www.mat.uc.pt/preprints/ps/p1132.pdf
14. Semantic domains, injective spaces and monads — Martin Escardo, https://martinescardo.github.io/papers/kzmonads.pdf
15. Kavvos, G. A. (2019). Modalities, cohesion, and information flow, https://research-information.bris.ac.uk/files/243121526/clsfds_2019_pub.pdf
16. Simple examples of ambidextrous adjunctions and their Frobenius monads — Math Stack Exchange, https://math.stackexchange.com/questions/2382813/
17. Pyknoticity versus Cohesiveness — The n-Category Café, https://golem.ph.utexas.edu/category/2020/03/pyknoticity_versus_cohesivenes.html
18. Quantum Gauge Field Theory in Cohesive Homotopy Type Theory — arXiv, https://arxiv.org/pdf/1408.0054
19. Classical field theory via Cohesive homotopy types — arXiv, https://arxiv.org/pdf/1311.1172
20. Lagrangian mechanics — Wikipedia, https://en.wikipedia.org/wiki/Lagrangian_mechanics
21. Non-commutative conditional expectation — Wikipedia, https://en.wikipedia.org/wiki/Non-commutative_conditional_expectation
22. Quantum channel — Wikipedia, https://en.wikipedia.org/wiki/Quantum_channel
23. Fixed Points of Completely Positive Trace-Preserving Maps in Infinite Dimension — arXiv, https://arxiv.org/html/2411.14800v1
24. On Bayesian mechanics: a physics of and by beliefs — PMC, https://pmc.ncbi.nlm.nih.gov/articles/PMC10198254/
25. Free energy principle — Wikipedia, https://en.wikipedia.org/wiki/Free_energy_principle
26. Entropy (information theory) — Wikipedia, https://en.wikipedia.org/wiki/Entropy_(information_theory)
27. Predictive Coding with Spiking Neural Networks: a Survey — arXiv, https://arxiv.org/html/2409.05386v1
28. Recent advances in the application of predictive coding and active inference models within clinical neuroscience — PubMed, https://pubmed.ncbi.nlm.nih.gov/32860285/
29. Categorical quantum mechanics I: Causal quantum processes — ResearchGate, https://www.researchgate.net/publication/327032785
30. Quantum Bayesianism — Wikipedia, https://en.wikipedia.org/wiki/Quantum_Bayesianism
31. Quantum Dynamics Happens Only on Paper: QBism's Account of Decoherence — arXiv, https://arxiv.org/html/2312.14112v1
32. Quantum-Bayesian and Pragmatist Views of Quantum Theory — Stanford Encyclopedia of Philosophy, https://plato.stanford.edu/entries/quantum-bayesian/
33. Quantum Bayesian Inference in Quasiprobability Representations — Physical Review Link Manager, https://link.aps.org/doi/10.1103/PRXQuantum.4.020352
34. Shared Protentions in Multi-Agent Active Inference — MDPI, https://www.mdpi.com/1099-4300/26/4/303
35. Entropy Special Issue: From Functional Imaging to Free Energy (Karl Friston) — MDPI, https://www.mdpi.com/journal/entropy/special_issues/free_energy
36. Subobject Classifiers and Topoi — Fiveable, https://fiveable.me/topos-theory/unit-6
37. Studying modal logic using category theory — Math Stack Exchange, https://math.stackexchange.com/questions/4920320/
38. On Two-Dimensional Monad Theory — The n-Category Café, https://golem.ph.utexas.edu/category/2014/04/on_two-dimensional_monad_theory.html
39. Cohesive ∞-Toposes — The n-Category Café, https://golem.ph.utexas.edu/category/2010/10/cohesive_toposes.html
40. Higher Topos Theory in Physics — arXiv, https://arxiv.org/pdf/2311.11026
41. What are the conceptual foundations of Lagrangian formulation? — Physics Stack Exchange, https://physics.stackexchange.com/questions/854219/
42. Bayesian Inference in Quantum Programs — arXiv, https://arxiv.org/abs/2504.20732
43. Remarks on Punctual Local Connectedness — ResearchGate, https://www.researchgate.net/publication/228379228
44. Bunge seminar abstract, https://www.math.mcgill.ca/rags/seminar/bunge-020914.html
45. Examples of differential cohomology in cohesive ∞-topos — MathOverflow, https://mathoverflow.net/questions/222353/
46. Prequantum Physics in a Cohesive ∞-Topos — The n-Category Café, https://golem.ph.utexas.edu/category/2011/10/prequantum_physics_in_a_cohesi.html
47. "Mitakuye Oyasin," or "all my relations," https://rodger-ricketts.com/2023/06/09/mitakuye-oyasin-or-all-my-relations/
48. Entropy — Wikipedia, https://en.wikipedia.org/wiki/Entropy
49. Topos theory, noncommutative geometry, and quantum logic — NWO, https://www.nwo.nl/en/projects/613000811
50. A Topos for Algebraic Quantum Theory — The n-Category Café, https://golem.ph.utexas.edu/category/2008/04/algebraic_quantum_mechanics_an.html
51. Conditional Expectation on von Neumann algebras — Math Stack Exchange, https://math.stackexchange.com/questions/2907137/
52. Non-commutative Conditional expectations and their applications — ResearchGate, https://www.researchgate.net/publication/246959407
53. Always look on the bright side...of CPTP maps — Quantum Frontiers, https://quantumfrontiers.com/2015/02/28/always-look-on-the-bright-side-of-cptp-maps/
54. What are "completely positive" and "CPTP" quantum maps? — Quantum Computing Stack Exchange, https://quantumcomputing.stackexchange.com/questions/34228/
55. QBism's account of quantum dynamics and decoherence — Physical Review Link Manager, https://link.aps.org/doi/10.1103/PhysRevA.110.052205
56. Deployed quantum link characterization via Bayesian ancilla-assisted process tomography — ORNL, https://www.ornl.gov/publication/deployed-quantum-link-characterization-bayesian-ancilla-assisted-process-tomography
57. Bayesian learning theory applied to human cognition, https://www2.bcs.rochester.edu/sites/robbie/JacobsKruschke_cogsci.pdf
58. Bayesian Cognitive Science, Monopoly, and Neglected Frameworks — Open Access LMU, https://epub.ub.uni-muenchen.de/41932/2/BayesCogSci_final.pdf
59. From Artificial Intelligence to potential Inference: The Key to True AI and 6G World Brain — arXiv, https://arxiv.org/html/2505.10569v1
60. The myth of the Bayesian brain — PMC, https://pmc.ncbi.nlm.nih.gov/articles/PMC12479598/
61. Recent advances in the application of predictive coding and active inference models within clinical neuroscience — UCL Discovery, https://discovery.ucl.ac.uk/id/eprint/10109167/1/pcn.13138.pdf
62. Physics, Determinism, and the Brain — arXiv, https://arxiv.org/pdf/2008.12674
63. Lars Muckli — 2016 CCN Workshop: Predictive Coding — YouTube, https://www.youtube.com/watch?v=jI75jpG1ZBk
