---
type: question
status: partial
explores: [governance]
title: What is the theory of governance?
description: "The theory of governance, in the sense the scope statement asks for, is a correspondence: between a logic of governance, a type theory of governance, and a category of governance."
---

# What is the theory of governance?

> **Scope.** A formal question about the mathematical structure of governance — *the steering of a collective*, in the cybernetic-etymological sense of κυβερνάω — at the abstract level, prior to any choice of governance tradition (kyriarchical, Indigenous, anarchist, corporate, ecclesiastical, …).
> The question is not what governance *should* look like, nor what the differences between traditions are, but what category $\mathbf{Gov}$ has governances as objects and governance-preserving maps as morphisms, in the sense of Curry-Howard-Lambek.

## The Curry-Howard-Lambek formulation

The theory of governance, in the sense the scope statement asks for, is a *correspondence*: between a logic of governance, a type theory of governance, and a category of governance.
These are not three theories to be related; they are three presentations of one mathematical object (Lambek 1968-72; Howard 1980; Lawvere 1969).
The theory of governance is that object.

To derive that object — rather than to stack pre-existing modal logics and call the stack "governance" — we identify the *primitive moves* of governance, the *empirical anchor* picking out governance from arbitrary structured systems, and the resulting *syntactic category*.
The standard governance modalities (deontic, STIT, coalition, counts-as) emerge as derived operators, not as imported building-blocks.

### The empirical anchor: the governance thesis

A process $\pi$ is a *governance act* if and only if it simultaneously satisfies three conditions:

1. **Attribution.** $\pi$ is attributable to a collective $C$ — there is a recognized sense in which $\pi$ is done *by* $C$ (not merely by some individual $a$ who happens to be a member of $C$).
2. **Binding.** $\pi$ produces or modifies a normative constraint on at least one member of $C$ — performing $\pi$ has the consequence that some member is now (newly, or differently) bound.
3. **Becoming.** $\pi$ effects a transition of $C$'s state — the collective after $\pi$ is in some respect not the collective before $\pi$.

**Governance Thesis.** *The class of governance acts is exactly the class of processes satisfying attribution, binding, and becoming jointly.*

The thesis is the analog of Church-Turing: it pins the abstract mathematical structure (the category to be defined below) to the empirical phenomenon.
None of the three conditions individually picks out governance — a market exchange satisfies becoming and (perhaps) binding but not attribution to a collective; a constitutional preamble satisfies attribution but neither binds nor effects a state-change on its own; a purely descriptive sociological claim satisfies none.
All three jointly are necessary and sufficient.
The thesis is contestable in the same sense Church-Turing is: empirical cases may demand revision (e.g., what about ritual that effects becoming without explicit binding?
What about purely declarative sovereignty-claims?), but a formal theory must commit to *some* anchor for the abstract structure to be a theory *of* anything.

### The primitive calculus

The three conditions of the thesis are not aggregated as a Boolean conjunction at the end of a process.
They are the *three primitive judgment-forms* of the governance calculus, from which all further structure derives.

The signature has six sorts: $\mathrm{Coll}$ (collectives), $\mathrm{Mem}$ (members), $\mathrm{Act}$ (acts), $\mathrm{Norm}$ (norms), $\mathrm{Cnst}$ (constraints), $\mathrm{St}$ (states).

The three primitive judgment-forms:

- **Attribution** $\Gamma \vdash a \mathbin{::} C$, read "act $a$ is attributed to collective $C$," with $a \in \mathrm{Act}$, $C \in \mathrm{Coll}$.
- **Binding** $\Gamma \vdash n \cdot m \rhd k$, read "norm $n$ binds member $m$ to constraint $k$," with $n \in \mathrm{Norm}$, $m \in \mathrm{Mem}$, $k \in \mathrm{Cnst}$.
- **Becoming** $\Gamma \vdash s \rightsquigarrow_a s'$, read "act $a$ effects the becoming of state $s$ into $s'$," with $s, s' \in \mathrm{St}$, $a \in \mathrm{Act}$.

Inference rules: standard structural rules (weakening, contraction, exchange); a compositional rule for becoming ($s \rightsquigarrow_a s' \wedge s' \rightsquigarrow_b s'' \vdash s \rightsquigarrow_{b \circ a} s''$); a transitivity rule for attribution along sub-collective inclusions ($a \mathbin{::} C \wedge C \subseteq C' \vdash a \mathbin{::} C'$); a *governance rule* enforcing the thesis (an act $a$ may be introduced into derivations only when all three primitive judgments are derivable for some $C, m, n, k, s, s'$).

The calculus is intentionally thinner than imported modal logics.
It commits only to the existence of the three primitive moves and to their compositional behavior; it commits to nothing about how attribution is achieved (recognition? performance? genealogy? ritual?), how binding is enforced (force? consent? kinship?), or what counts as a state-change (institutional fact? material outcome? felt relation?).
These commitments are *parameters* set by which interpretation a tradition gives to the sorts and rules.

### The category Gov as syntactic category of the primitive calculus

**Definition.** $\mathbf{Gov}$ is the *syntactic category* of the primitive governance calculus: objects are sort-terms (possibly compound: $\mathrm{Coll} \times \mathrm{Mem}$, $\mathrm{Act} \to \mathrm{St}$, etc.) and morphisms $A \to B$ are equivalence classes of derivations $A \vdash B$ under cut-elimination.

By construction, $\mathbf{Gov}$ inherits from the calculus: - The six sorts as basic objects. - Three families of primitive morphisms — attribution-morphisms, binding-morphisms, becoming-morphisms — one for each primitive judgment. - Finite products (interpreting context-concatenation in sequents) and exponentials (interpreting the hom-judgment) by the standard Lambek construction. - A cut-elimination theorem (standard sequent calculus) ensuring composition is well-defined.

The category $\mathbf{Gov}$ is *not* assumed to be Cartesian closed or to have any modal structure a priori.
It has exactly the structure forced by the primitive calculus.
Whether $\mathbf{Gov}$ has Cartesian closure, subobject classifiers, monads, or other structure becomes a *theorem-or-counterexample* question, not a definitional choice.

### Derived structure: the standard modalities

The standard governance modalities are *derived* in $\mathbf{Gov}$, not imported.
Each is a definable abbreviation in the primitive calculus.

**Deontic operators.** Define $O\varphi := \exists n: \mathrm{Norm}.\, \forall m: \mathrm{Mem}.\, (n \cdot m \rhd \mathrm{require}(\varphi))$ — "$\varphi$ is obligatory" iff there is a norm binding every member to the constraint of requiring $\varphi$. $P\varphi := \neg O \neg\varphi$. $F\varphi := O\neg\varphi$.
Standard deontic axiom $D$ ($O\varphi \to P\varphi$) holds in $\mathbf{Gov}$ iff no norm produces an unsatisfiable constraint — a *consistency-of-binding* condition on the binding judgment.

**Agentive STIT.** Define $[a \mathrm{stit}] \varphi := \exists b: \mathrm{Act}.\, (b \mathbin{::} \{a\}) \wedge \exists s, s'.\, (s \rightsquigarrow_b s') \wedge \varphi(s')$ — "$a$ sees to it that $\varphi$" iff there is an act attributable to the singleton collective $\{a\}$ effecting a becoming whose result satisfies $\varphi$.
Agency is recovered as attribution-to-singletons plus becoming.

**Coalition operator.** Define $[C] \varphi := \exists b: \mathrm{Act}.\, (b \mathbin{::} C) \wedge \exists s, s'.\, (s \rightsquigarrow_b s') \wedge \varphi(s')$ — "coalition $C$ ensures $\varphi$" iff some act attributable to $C$ effects a becoming to a $\varphi$-state.
Pauly's coalition logic is the special case where $C$ ranges over a fixed agent-power-set; here $C$ ranges over the full sort $\mathrm{Coll}$, which is more general (collectives need not be defined extensionally as sets of agents).

**Counts-as.** Define $D_a A := \exists b: \mathrm{Act}.\, (b \mathbin{::} \{a\}) \wedge (b \mathbin{::} C_A)$ where $C_A$ is the institutional collective constituting $A$ — "$a$'s designated act counts as $A$" iff $a$'s act is dually attributable to both $a$ as singleton and to the institution constituting $A$.
Jones-Sergot's counts-as conditional is the special case where the dual-attribution-pattern is contextually triggered.

These derivations are theorems of $\mathbf{Gov}$ (or, equivalently, definitions in the primitive calculus).
The standard modalities are not foundational; the three primitive judgments are.

### Four-valued operativity, derived

The thesis says a process is a governance act iff attribution, binding, and becoming hold *simultaneously*.
But each can independently *fail to settle*: attribution may be contested, binding may be claimed but unenforced, becoming may be partial.
Hence each primitive judgment is naturally $\mathbf{FOUR}$-valued:

- $\models_G (a \mathbin{::} C) \in \mathbf{FOUR}$ — attribution settlement.
- $\models_G (n \cdot m \rhd k) \in \mathbf{FOUR}$ — binding settlement.
- $\models_G (s \rightsquigarrow_a s') \in \mathbf{FOUR}$ — becoming settlement.

The operativity of a governance act, by the thesis, is the *information meet* $\otimes_k$ of the three: $\models_G(\pi) = \models_G(\text{attribution}) \otimes_k \models_G(\text{binding}) \otimes_k \models_G(\text{becoming})$.
This makes the corpus's "operativity = recognition ⊗ execution" reading a *derived theorem* of the thesis under a refinement: recognition decomposes as attribution + binding (the act is acknowledged as the collective's *and* the binding is acknowledged), and execution is becoming (the act's becoming actually happens).

The four-valued structure of $\mathbf{Gov}$ is thus not imposed externally; it is the natural value-structure of the three primitive judgments, each of which can independently settle to $\mathbf{t}, \mathbf{f}, \bot, \top$.
The previously-developed §FOUR-enrichment section (below) becomes a study of $\mathbf{FOUR}$-valued primitive-judgment-settlements rather than an external enrichment.

### Meta-stratification: constituent acts and self-amendment

The primitive calculus as stated captures *operational* governance acts — acts taking place against a fixed apparatus of attribution, binding, and becoming.
Two phenomena require extension. *Constituent acts* bring a new collective into existence, with no prior attribution-target to be attributed-to. *Self-amending acts* have becoming-effects on the very apparatus that generates them (constitutions amending themselves; councils changing how councils convene).
Stratification of the calculus into levels — a standard construction (Hart 1961 on primary/secondary rules; Ostrom 2005 on operational/collective-choice/constitutional levels; Adámek-Rosický 1994 for the colimit machinery) — resolves both.

**Stratified primitive calculus.** For each $n \geq 0$ define a calculus at level $n$ with sorts $\{\mathrm{Coll}_n, \mathrm{Mem}_n, \mathrm{Act}_n, \mathrm{Norm}_n, \mathrm{Cnst}_n, \mathrm{St}_n\}$ and the three primitive judgment-forms (attribution, binding, becoming) at level $n$, subject to:

- At level 0, the calculus is the base primitive calculus already given. $\mathrm{St}_0$ is the sort of operational states.
- At level $n+1$, the state-sort is $\mathrm{St}_{n+1} = \mathrm{Mor}(\mathbf{Gov}_n)$ — *the states at level $n+1$ are the morphisms of level $n$'s syntactic category* (i.e., level-$n$ apparatus).
  Becoming at level $n+1$ is $s \rightsquigarrow_a^{n+1} s'$ where $s, s' \in \mathrm{Mor}(\mathbf{Gov}_n)$ — acts at level $n+1$ effect transitions on level-$n$ apparatus.

**Stratified syntactic categories.** $\mathbf{Gov}_n$ is the syntactic category of the level-$n$ calculus.
The natural inclusion $\iota_n: \mathbf{Gov}_n \to \mathbf{Gov}_{n+1}$ sends each level-$n$ act to the level-$(n+1)$ act with trivial becoming-effect (the level-$n$ act does not revise level-$n$ apparatus when viewed from level $n+1$).

**Definition.** $\mathbf{Gov} := \mathrm{colim}_n \mathbf{Gov}_n$, the directed colimit of the level-tower in $\mathbf{Cat}$.

**Proposition 11 (well-definedness).** *The tower $(\mathbf{Gov}_n, \iota_n)_{n \in \mathbb{N}}$ is a filtered diagram in $\mathbf{Cat}$, and its directed colimit exists.*

*Proof.* Each $\iota_n$ is a functor: preservation of identities and composition is immediate from the trivial-becoming embedding.
The diagram is filtered (any finite subset of indices has a common upper bound, the maximum). $\mathbf{Cat}$ has all filtered colimits (Adámek-Rosický 1994 §1.
A; Mac Lane 1998 §IX.
1). $\square$

**Proposition 12 (constituent acts).** *For any new collective $C$ to be introduced at level $n$, there exists a morphism $\nu_C: \mathbf{1} \to (\mathrm{Coll}_n\text{-object for } C)$ in $\mathbf{Gov}_{n+1}$ — a level-$(n+1)$ act whose becoming is the endofunctor of $\mathbf{Gov}_n$ extending its $\mathrm{Coll}_n$-sort with $C$.
The act $\nu_C$ has attribution at level $n+1$ (to the founder-collective, the constituent power, or the prior-tradition) but its becoming lands on level $n$.*

*Proof.* Collectives at level $n+1$ are the constituent powers.
Their acts have becomings that are endofunctors of $\mathbf{Gov}_n$.
The endofunctor introducing a new $\mathrm{Coll}_n$-object is the constituent act $\nu_C$.
The terminal source $\mathbf{1}$ is the trivial precondition (no prior level-$n$ collective is required for the founding act to be performed at level $n+1$). $\square$

This is the resolution of the constituent-act gap: founding a new collective at level $n$ is a normal governance act at level $n+1$, with attribution to the founder-collective at level $n+1$.
Sieyès's *pouvoir constituant*, Schmitt's *verfassunggebende Gewalt*, and Negri's *potenza costituente* are the level-1 founder-collectives constituting level-0 polities; level-2 founder-collectives (the framers-of-the-amendment-procedure) constitute the level-1 amendment-procedure; and so on.

**Proposition 13 (self-amendment).** *An act $a$ at level $n$ whose becoming lands on $\mathbf{Gov}_n$ itself — a self-amending act — is representable as an element of $\mathbf{Gov}_{n+1}(\iota_n A, \iota_n A)$ for some level-$n$ object $A$.
The level-shift trivializes the apparent self-reference: at level $n+1$ the act is a morphism between two level-$n$ apparatus-states; at level $n$ the act appears as substrate-revision; no infinite-descent arises.*

*Proof.* By construction, $\mathbf{Gov}_{n+1}$ contains morphisms whose source and target are $\iota_n$-images of level-$n$ objects and whose becoming is a non-trivial endofunctor of $\mathbf{Gov}_n$.
Such morphisms are self-amending acts in the sense that their effect is on level-$n$ apparatus.
The well-foundedness condition (acts cannot effect their own performance without prior occurrence) holds because the act lives one level up from the apparatus it modifies. $\square$

This handles council-changing-how-it-convenes: the act lives at the level above the apparatus it changes, so its self-referential appearance at the apparatus-level is a level-shift rather than a fixed-point.
For acts whose self-reference cannot be removed by level-shift — genuinely paradoxical self-amending acts — the coalgebraic fixed-point treatment of Aczel (1988, *Non-Well-Founded Sets*) and Jacobs (2017, *Introduction to Coalgebra*) is available; whether real governance phenomena require this stronger treatment is open.

**Hart-Ostrom correspondence.** Hart's *primary rules* are level-0 acts (operational binding of members).
Hart's *secondary rules of change* are level-1 acts (revising operational rules).
Hart's *secondary rules of recognition and adjudication* are level-2 acts (revising what counts as a rule of change).
Ostrom's three-level analysis (operational, collective-choice, constitutional) is the truncation of the tower at $n = 3$.
Empirically most polities truncate at $n \leq 3$; the tower extends in principle to all $n \in \mathbb{N}$, with the colimit $\mathbf{Gov}$ accommodating arbitrary stratification depth.

### The correspondence theorem

**Theorem (Curry-Howard-Lambek for governance, primitive form).** *The following three structures are equivalent under the standard free-construction:*

1. *Derivations in the stratified governance primitive calculus (three primitive judgments at each level $n$, with level-$(n+1)$ becomings acting as endofunctors of $\mathbf{Gov}_n$; structural rules; governance rule), modulo cut-elimination.*
2. *Well-typed terms in the stratified type theory whose types are level-indexed governance sort-terms, term-constructors include the three primitive judgment-formers at each level and the level-shifting term-formers $\iota_n$, modulo $\beta\eta$-reduction.*
3. *Morphisms in $\mathbf{Gov} = \mathrm{colim}_n \mathbf{Gov}_n$ (the colimit of the stratified syntactic categories).*

The equivalence (1) ⇔ (2) is Howard's propositions-as-types under the addition of the three primitive judgment-formers as term-constructors.
The equivalence (2) ⇔ (3) is Lambek's construction of the syntactic category of a typed calculus, adapted to a three-judgment-form base.
Neither extension requires new metatheoretical machinery beyond what is standard in dependent type theory (Martin-Löf 1984; Jacobs 1999, *Categorical Logic and Type Theory*).

*This theorem is the theory of governance.* The standard modalities (deontic, STIT, coalition, counts-as) are derived operators that surface natural patterns of the three primitives, not separate logical commitments.
The Boolean / four-valued question is settled by the primitive judgments' settlement-values, not externally.
The relationship to traditions (kyriarchical, Lakotaean, etc.) is a question of how a tradition interprets the three primitives — what it takes attribution-to-a-collective, binding-of-a-member, and becoming-of-a-state to be — rather than which modal logic the tradition speaks.

### What this delivers that the imported-modalities formulation did not

- *Derivation rather than stacking*: the structure is built from three primitives, not imported from STIT + deontic + coalition + counts-as as separate components.
- *An empirical anchor*: the governance thesis fixes which mathematical structures count as governances — selecting from arbitrary structured systems exactly those satisfying attribution, binding, and becoming jointly.
- *Tradition-interpretation as the locus of variation*: different traditions correspond to different *interpretations* of the three primitives in different base categories — not to different choices of which modal logic to import.
- *Standard modalities as theorems*: deontic, STIT, coalition, counts-as are recoverable as definable abbreviations, not as axioms.
- *Four-valued operativity as natural*: the $\mathbf{FOUR}$-valuation arises from the independent settlement of each primitive judgment, not from external bilattice enrichment.

### The previously-considered formulations as fragments

The CCC-with-deontic-monad-and-STIT-endofunctors-and-coalition-action-and-counts-as-Lawvere-Tierney-and-FOUR-classifier formulation (formerly presented as the answer) is the *internal-modal-logic presentation* of $\mathbf{Gov}$ obtained by treating the derived modalities as primitive and reading off their categorical realization.
It is correct but not foundational — it presupposes the derived modalities rather than deriving them.

The multicategory-with-self-action formulation (developed below) is the *joint-act-and-substrate-effect fragment* of $\mathbf{Gov}$ obtained by suppressing binding and attending only to attribution + becoming, with the self-action encoding the becoming-modifies-the-collective subset of moves.

Both are useful presentations of fragments.
The primitive-calculus formulation above is the foundational definition.

### The logic of governance (legacy section, kept for reference)

The earlier "minimum logic capable of expressing the irreducible features of governance" — propositional STIT-deontic logic with four-valued semantics — is a *derived* logic in the sense above, not the foundational one.
The components remain individually standard and useful as derived operators; their integration is now justified as derivation rather than stipulation.

- **Deontic modality** (Mally 1926, *Grundgesetze des Sollens*; von Wright 1951, "Deontic logic"; Chellas 1980, *Modal Logic*).
  Operators $O$ (obligation), $P$ (permission), $F$ (prohibition) on propositions, with $F\varphi \equiv O\neg\varphi$ and $P\varphi \equiv \neg O\neg\varphi$.
  Axiomatized as a normal modal logic of type $KD$.
- **Agentive STIT** (Belnap-Perloff-Xu 2001, *Facing the Future*; Horty 2001, *Agency and Deontic Logic*).
  Operator $[a \mathrm{stit}]\varphi$ — "agent $a$ sees to it that $\varphi$" — capturing agency without reduction to causation.
  Sound and complete over branching-time-with-choice frames.
- **Coalition action** (Pauly 2001, *Logic for Social Software*).
  Operator $[C]\varphi$ — "coalition $C \subseteq \mathrm{Agents}$ has a joint strategy ensuring $\varphi$ regardless of what the complement does."
  Sound and complete over playable effectivity functions.
- **Institutional empowerment / counts-as** (Jones-Sergot 1996, "A Formal Characterisation of Institutionalised Power", *Logic J.
  IGPL* 4(3); Grossi-Meyer-Dignum 2008).
  Operator $D_a \varphi$ — "agent $a$'s performance of a designated-type act counts as bringing about institutional state $\varphi$."
  A conditional connective with non-monotonic and context-relative behavior, axiomatized in Jones-Sergot's system.
- **Four-valued semantics** (Belnap 1977, "A useful four-valued logic"; Dunn 1976, "Intuitive semantics for first-degree entailments and 'coupled trees'"; Fitting 1991, "Bilattices and the semantics of logic programming").
  Each formula evaluates to a member of the Belnap-Dunn bilattice $\mathbf{FOUR} = \{\bot, \mathbf{t}, \mathbf{f}, \top\}$.
  Conjunction and disjunction follow the truth-lattice operations $\wedge_t, \vee_t$; the information-lattice operations $\otimes_k, \oplus_k$ govern evidence accumulation.
  The logic is paraconsistent: $\varphi \wedge \neg\varphi$ at value $\top$ does not entail arbitrary conclusions.

The integrated logic — call it $\mathcal{L}_{\mathbf{Gov}}$ — has the union of the above formation rules and a Hilbert-style axiomatization combining the components' axiom-schemes.
The interactions are constrained: the $D_a$ conditional is non-monotonic across the deontic modalities; coalition operators distribute over conjunction modulo agent-set restrictions; STIT and counts-as compose along Jones-Sergot's "$a$ sees to it that $a$'s act counts as $\varphi$" pattern.
Completeness for $\mathcal{L}_{\mathbf{Gov}}$ over its intended bilattice-valued multi-agent-branching-time semantics has been established piecewise in the literature for each component pair (Horty-Belnap on STIT-deontic; Boella-van der Torre on deontic-counts-as; van Benthem on coalition-deontic); full integration is conjectural at the metatheorem level but the model theory is well-understood.

### The type theory of governance

Curry-Howard for $\mathcal{L}_{\mathbf{Gov}}$: types correspond to propositions; terms correspond to derivations.
Type-formation rules:

- $A \times B$ for $A \wedge B$ (products).
- $B^A$ for $A \to B$ (exponentials).
- $A + B$ for $A \vee B$ (coproducts).
- $\Box_O A$ for $OA$ — the *deontic-obligation type*: a term $t: \Box_O A$ is a derivation that $A$ is obligated.
- $\diamond_P A$ for $PA$ — the *deontic-permission type*: dual to $\Box_O$.
- $\Box_a A$ for $[a \mathrm{stit}] A$ — the *agentive type* (one for each agent variable $a$).
- $\Box_C A$ for $[C] A$ — the *coalition type* (one for each coalition $C$).
- $\langle a \rangle_D A$ for $D_a A$ — the *counts-as type*: a term is a derivation that $a$'s designated act counts as producing $A$.

Reduction rules: $\beta$-reduction for $\lambda$-abstraction at $B^A$; $\eta$-rules for the modalities (standard modal-type-theory presentation: Bierman-de Paiva 2000 for the box monads; Maietti-Maneggia-de Paiva-Ritter 2005 for coproducts; Murakami 2004 for STIT).
Each modality is presented as a *monad* (for box-type) or *comonad* (for diamond-type), giving rise to Kleisli categories and the associated do-notation.

Strong normalization and confluence: hold for the deontic-only fragment (Eberle et al. 2014, "The categorical imperative", *J.
Applied Logic*), for the STIT-only fragment (Murakami 2004), and for products-exponentials-coproducts (Lambek-Scott 1986).
The interaction-extended full system $\mathcal{T}_{\mathbf{Gov}}$ is conjectured but not proved strongly normalizing in full generality; failure cases would correspond to *normative loops* (an obligation imposing itself, etc.) which are a known governance pathology (Carmo-Jones 2002 on contrary-to-duty paradoxes).

### The category Gov

**Definition (the category $\mathbf{Gov}$).** $\mathbf{Gov}$ is the *syntactic category* of $\mathcal{T}_{\mathbf{Gov}}$: objects are types (equivalently: propositions of $\mathcal{L}_{\mathbf{Gov}}$), morphisms $A \to B$ are equivalence classes of terms $t: A \to B$ under $\beta\eta$-reduction (equivalently: equivalence classes of derivations of $A \vdash B$ under cut-elimination).

By Lambek's theorem (1968-72) and its modal extensions (Maietti et al. 2005; Bierman-de Paiva 2000), $\mathbf{Gov}$ has the following structure as a categorical realization of $\mathcal{T}_{\mathbf{Gov}}$:

1. **Finite products and coproducts.** $\mathbf{Gov}$ has all finite limits and colimits in its propositional fragment.

2. **Exponentials.** $\mathbf{Gov}$ is *Cartesian closed*: for any $A, B$ the exponential $B^A$ exists with the standard adjunction $\mathrm{Hom}(A \times C, B) \cong \mathrm{Hom}(C, B^A)$.

3. **Deontic monads and comonads.** $O$ is realized as a *monad* on $\mathbf{Gov}$: an endofunctor $O: \mathbf{Gov} \to \mathbf{Gov}$ with unit $\eta_A: A \to OA$ and multiplication $\mu_A: O O A \to OA$ satisfying the monad laws.
  The axiom $D$ of standard deontic logic ($O\varphi \to P\varphi$ — no impossible obligations) holds iff the natural transformation $\eta_A: A \to OA$ has a right inverse on subobjects. $P$ is realized dually as a comonad.
  The Eilenberg-Moore category $\mathbf{Gov}^O$ is the category of *obligation-closed types* — types $A$ equipped with a map $OA \to A$ telling how the obligation is discharged.

4. **STIT and coalition endofunctors.** $[a \mathrm{stit}]$ for each $a$, and $[C]$ for each $C$, are realized as *indexed endofunctors* on $\mathbf{Gov}$, with functorial transitions $[C \subseteq C']$ giving a covariant action of the coalition-lattice on $\mathbf{Gov}$.
  By Pauly's effectivity-function semantics, the family $\{[C]\}_{C \subseteq \mathrm{Agents}}$ satisfies the playable-effectivity axioms internally.

5. **Counts-as as a Lawvere-Tierney structure.** $D_a$ is realized as a *left-exact endofunctor* in the sense of Lawvere-Tierney (Lawvere-Tierney 1972; Sileno 2015 for the institutional reading) — an endofunctor preserving finite limits, with a unit-like natural transformation $\eta^D_A: A \to \langle a \rangle_D A$ realizing the "counts-as" closure.
  This is the *modal* form of the counts-as conditional in $\mathbf{Gov}$.

6. **FOUR-valued subobject classifier.** The subobject classifier of $\mathbf{Gov}$ is *not* the Boolean $\Omega = \mathbf{2}$ but the Belnap-Dunn bilattice $\Omega = \mathbf{FOUR}$.
  Subobjects of any object $A$ are classified by maps $A \to \mathbf{FOUR}$.
  The four classifying values correspond to: $\mathbf{t}$ — the subobject is recognized and propagating; $\mathbf{f}$ — refused and not-propagating; $\bot$ — unsettled; $\top$ — contested.
  Diaconescu's many-valued-institution framework (Diaconescu 2013) provides the metatheorem connecting bilattice-valued classifiers to standard-institution-style satisfaction.

$\mathbf{Gov}$ is therefore: *the free Cartesian-closed category with deontic monad, STIT-indexed endofunctors, coalition-lattice action, counts-as Lawvere-Tierney operator, and four-valued subobject classifier, generated by a set of atomic types.*

### The correspondence theorem

**Theorem (Curry-Howard-Lambek for governance).** *The following three structures are equivalent (under their respective free-construction):*

1. *The set of derivations in $\mathcal{L}_{\mathbf{Gov}}$ modulo cut-elimination.*
2. *The set of well-typed terms in $\mathcal{T}_{\mathbf{Gov}}$ modulo $\beta\eta$-reduction.*
3. *The set of morphisms in $\mathbf{Gov}$.*

*Proof sketch.* (1) $\Leftrightarrow$ (2): standard Curry-Howard for propositional logic (Howard 1980) extended by Bierman-de Paiva (2000) for the monadic modalities, Murakami (2004) for STIT, and Sileno (2015) for the counts-as fragment.
(2) $\Leftrightarrow$ (3): standard Lambek (1968-72; Lambek-Scott 1986) for the CCC fragment, extended by Maietti-Maneggia-de Paiva-Ritter (2005) and the modal-type-theory literature for each modality.
The four-valued refinement requires bilattice-valued classifying objects, handled by Diaconescu (2013, Ch. 4-5).
The piecewise extensions compose at the meta-theoretic level under the assumption of pairwise interaction-compatibility; full meta-theoretic integration is conjectural. $\square$

This theorem *is* the theory of governance.

### What this delivers that the multicategorial presentation does not

- *An internal logic*: the logic $\mathcal{L}_{\mathbf{Gov}}$ is recoverable from $\mathbf{Gov}$ as its internal logic via the standard Mitchell-Bénabou construction (Lambek-Scott 1986, Part II).
  The multicategorial presentation lacks an internal logic — it is a category but not a logical category.
- *A type theory*: $\mathcal{T}_{\mathbf{Gov}}$ gives an effective syntax for constructing morphisms in $\mathbf{Gov}$.
  The multicategorial presentation gives no comparable construction discipline.
- *Universal property*: $\mathbf{Gov}$ is the *free* such category — every other Cartesian-closed-with-the-listed-structure category receives a unique functor from $\mathbf{Gov}$ (up to specified equivalences).
  The multicategorial presentation has no comparable universal property.
- *Standard machinery*: the propositions about $\mathbf{Gov}$ become applications of standard CCC + modal type theory + categorical logic results, not ad-hoc constructions.

### The multicategorial presentation as a fragment

The previously-developed multicategory-with-self-action presentation (below) is a *partial presentation* of $\mathbf{Gov}$ — specifically, of the subcategory of $\mathbf{Gov}$ generated by atomic propositions under finite products, with $\mu$ encoding the deontic-monad's Kleisli-extension restricted to this fragment.
The propositions 1-5 below are results about this fragment, not about $\mathbf{Gov}$ in full.
The fragment is useful when only joint-acts-with-substrate-effects are being modeled (i.e., when the modalities are suppressed); for the general theory, the CHL formulation above is primary.

## Multicategorial presentation of a fragment

The following presentation captures the joint-act-and-substrate-effect fragment of $\mathbf{Gov}$, suppressing modalities.
It is *not* the definition of $\mathbf{Gov}$; it is a useful representation when only the joint-act fragment is needed.
Propositions 1-5 are theorems about this fragment.

Let $\mathbf{SymMult}$ denote the category whose objects are small symmetric colored multicategories and whose morphisms are multicategory functors.
(See Leinster, *Higher Operads, Higher Categories* 2004, Ch. 2 for definitions.)
For a multicategory $M$, write $\mathrm{Ob}(M)$ for its set of objects (called *positions* in what follows) and $M(p_1, \ldots, p_n; q)$ for its set of multimorphisms with input positions $p_1, \ldots, p_n$ and output position $q$ (called *acts* in what follows).
Write $\mathrm{End}_{\mathbf{SymMult}}(M)$ for the monoid of multicategory endofunctors $M \to M$ under composition.

**Definition (governance).** A *governance* is a pair $G = (M_G, \mu_G)$ where:

1. $M_G$ is a small symmetric colored multicategory.
  Its objects $p \in \mathrm{Ob}(M_G)$ are *positions* — possible standings of constituents within the collective.
  Its multimorphisms $f \in M_G(p_1, \ldots, p_n; q)$ are *acts* — joint operations taking $n$ constituents in positions $p_1, \ldots, p_n$ to a collective-output in position $q$.
  Operadic composition of acts is sequential joint action: doing $g_1, \ldots, g_n$ in parallel and then feeding the outputs into $f$.

2. $\mu_G: \mathrm{Mor}(M_G) \to \mathrm{End}_{\mathbf{SymMult}}(M_G)$ is a *self-action*: a function assigning to each act a multicategory endofunctor of $M_G$, subject to two axioms.

    - **(unit)** $\mu_G(\mathrm{id}_p) = \mathrm{id}_{M_G}$ for each position $p$ — trivial acts effect no substrate revision.

    - **(composition)** For any operadic composite $f \circ_{M_G} (g_1, \ldots, g_n)$ in $M_G$:
      $$\mu_G\!\bigl(f \circ_{M_G} (g_1, \ldots, g_n)\bigr) \;=\; \mu_G(f) \,\circ\, \mu_G(g_1) \,\circ\, \cdots \,\circ\, \mu_G(g_n)$$
      where the right-hand composition is composition in $\mathrm{End}_{\mathbf{SymMult}}(M_G)$ — performing the composite act effects the composite substrate-revision.

The self-action $\mu_G$ encodes the *self-modifying* character of governance: every act not only produces a collective-output (via its operadic role) but also potentially revises the act-system itself (via $\mu_G$).
The unit axiom says trivial acts revise nothing; the composition axiom says substrate-revision is functorial in act-composition.

**Definition (morphism of governances).** A *morphism* $\phi: G \to G'$ is a multicategory functor $\phi: M_G \to M_{G'}$ such that, for every act $f \in \mathrm{Mor}(M_G)$, the square $$\phi \circ \mu_G(f) \;=\; \mu_{G'}(\phi(f)) \circ \phi$$ of multicategory functors $M_G \to M_{G'}$ commutes.
(Phrased: $\phi$ intertwines the self-actions.)

**Definition (the category $\mathbf{Gov}$).** Composition of governance morphisms is composition of underlying multicategory functors (well-defined by the intertwining condition: if $\phi$ intertwines $\mu_G, \mu_{G'}$ and $\psi$ intertwines $\mu_{G'}, \mu_{G''}$, then $\psi \circ \phi$ intertwines $\mu_G, \mu_{G''}$).
The identity governance morphism is the identity multicategory functor.
With these, *governances and their morphisms form a category* $\mathbf{Gov}$.

## Basic properties of the multicategorial fragment

The following are immediate from the multicategorial presentation.
They concern the joint-act fragment, not $\mathbf{Gov}$ in full.

**Proposition 1 (forgetful functor).** *The map $U: \mathbf{Gov} \to \mathbf{SymMult}$ given by $U(M, \mu) = M$ on objects and $U(\phi) = \phi$ on morphisms is a faithful functor.*

*Proof.* Functoriality is immediate from the definition of composition in $\mathbf{Gov}$.
Faithfulness: if $\phi_1, \phi_2: (M, \mu) \to (M', \mu')$ are governance morphisms with $U(\phi_1) = U(\phi_2)$, then they agree as multicategory functors, hence are equal as governance morphisms. $\square$

**Proposition 2 (terminal object).** *Let $\mathbf{1} \in \mathbf{SymMult}$ be the terminal multicategory: one object $\star$, only the identity multimorphism $\mathrm{id}_\star$, and no nontrivial multimorphisms.
The unique self-action on $\mathbf{1}$ is $\mu_\mathbf{1}(\mathrm{id}_\star) = \mathrm{id}_\mathbf{1}$.
The governance $(\mathbf{1}, \mu_\mathbf{1})$ is terminal in $\mathbf{Gov}$.*

*Proof.* For any governance $(M, \mu)$, the unique multicategory functor $!_M: M \to \mathbf{1}$ sends every position to $\star$ and every act to $\mathrm{id}_\star$.
The intertwining condition reduces to $!_M \circ \mu(f) = \mu_\mathbf{1}(!_M(f)) \circ !_M = \mathrm{id}_\mathbf{1} \circ !_M = !_M$, which holds automatically since the codomain $\mathbf{1}$ has only one object and one morphism.
Hence $!_M$ is the unique governance morphism. $\square$

**Proposition 3 (initial object).** *The empty multicategory $\emptyset$ (no objects, no morphisms) with the empty self-action is initial in $\mathbf{Gov}$.*

*Proof.* For any $(M, \mu)$, the unique multicategory functor $\emptyset \to M$ is the empty functor, which trivially intertwines self-actions (vacuously). $\square$

**Proposition 4 (the static-governance subcategory).** *Let $\mathbf{Gov}_{\mathrm{stat}} \subseteq \mathbf{Gov}$ be the full subcategory of governances $(M, \mu)$ with $\mu(f) = \mathrm{id}_M$ for every act $f$ (i.e., no act revises the substrate).
Then $\mathbf{Gov}_{\mathrm{stat}}$ is equivalent to $\mathbf{SymMult}$.*

*Proof.* Define $E: \mathbf{SymMult} \to \mathbf{Gov}_{\mathrm{stat}}$ by $E(M) = (M, \mu_{\mathrm{triv}})$ where $\mu_{\mathrm{triv}}(f) = \mathrm{id}_M$ for all $f$ — this satisfies the unit axiom (trivially) and the composition axiom ($\mathrm{id}_M \circ \cdots \circ \mathrm{id}_M = \mathrm{id}_M$).
Every multicategory functor $\phi: M \to M'$ intertwines $\mu_{\mathrm{triv}}$ with $\mu_{\mathrm{triv}}'$ since both sides of the intertwining condition equal $\phi$.
The functor $E$ is fully faithful (intertwining is automatic) and essentially surjective onto $\mathbf{Gov}_{\mathrm{stat}}$ (every static governance is $E$ of its underlying multicategory). $\square$

**Proposition 5 (translation-refusal is structural).** *There exist objects $G_1, G_2 \in \mathbf{Gov}$ with $\mathbf{Gov}(G_1, G_2) = \emptyset$ — no morphism from $G_1$ to $G_2$ exists.*

*Proof sketch.* Take $G_1 = (M_1, \mu_1)$ where $M_1$ is the free symmetric multicategory on one binary operation $f: (p, p) \to p$ over one object $p$, with $\mu_1(f) \neq \mathrm{id}_{M_1}$ — say, $\mu_1(f)$ permutes some structure of $M_1$ in a way preserving $f$.
Take $G_2$ to be a multicategory with no binary operations at all, only identities and trivial $\mu_2$.
Any multicategory functor $\phi: M_1 \to M_2$ must send $f$ to some binary operation in $M_2$ — but $M_2$ has none.
Hence $\mathbf{Gov}(G_1, G_2) = \emptyset$. $\square$

This proposition is the *mathematical content* of translation-refusal: emptiness of hom-sets in $\mathbf{Gov}$ is a structural fact, not a sociological commentary.
Some pairs of governances cannot be related by structure-preserving translation, and the category records this.

## What the corpus has established about general governance structure

Prior abstract-level thought in the corpus identifies several structural features of governance that enrich the definition above.
These are extracted as *abstract structural results* — they apply to governance qua governance, not to any specific tradition.
Each is sourced to the prior text where the corpus develops it.

- **Governance requires feedback structure beyond rule-prescription** (corpus: `texts/cybernetics-and-governance-survey.md`).
  A governance is not exhausted by its act-system; it must also contain a *sensor* (detection of deviation from purpose), a *comparator* (measurement of gap between observed and desired state), and an *effector* (a way to correct).
  This is the Wiener formulation (1948).
  Mathematically: the multicategory $M_G$ captures the prescriptive face of governance (which acts are available) but does not capture the cybernetic face (how the system detects and corrects).
  A fuller object of $\mathbf{Gov}$ may need an additional coalgebraic component $\delta: S \to F(S)$ on a state space $S$, where $F$ encodes the sensor-comparator-effector triple, coupled to $(M_G, \mu_G)$ by *which acts the system performs in response to which detected deviations*.
  The minimal definition treats this as missing structure.

- **Requisite variety is a hard quantitative constraint on $\mathbf{Gov}$** (corpus: `texts/cybernetics-and-governance-survey.md`, citing Ashby 1956).
  For a governance $G$ to regulate an environment with disturbance-set $D$, the variety of $G$'s acts (cardinality of $\mathrm{Mor}(M_G)$ under appropriate quotients) must be at least $|D|$.
  This is the Law of Requisite Variety: $\log|\mathrm{outcomes}| \geq \log|\mathrm{disturbances}| - \log|\mathrm{controller\text{-}variety}|$.
  As a structural fact about $\mathbf{Gov}$: the subcategory of "viable" governances with respect to a given environment is selected by a cardinality lower bound on $\mathrm{Mor}(M)$.
  This is a governance-specific structural constraint with a precise cardinality semantics.

- **Meta-governance is stratified, not flat** (corpus: `texts/temporality-of-normative-systems.md` citing Hart 1961; `terms/normative-system.md` citing Ostrom 1990).
  The corpus has identified at least three (Hart) or three-as-recursive-levels (Ostrom) layers of acts:
  - *Primary / operational acts* — acts that bind directly: do-$X$, do-not-$Y$.
  - *Secondary-of-change / collective-choice acts* — acts that revise the operational rule-set.
  - *Secondary-of-recognition + secondary-of-adjudication / constitutional-choice acts* — acts that revise the rule-set that governs which acts count as in the system at all.

This *refines* the $\mu$ structure in the definition: $\mu$ should be understood not as a single endomorphism-valued map but as a stratification $\mu = \mu_{\mathrm{op}} \sqcup \mu_{\mathrm{cc}} \sqcup \mu_{\mathrm{const}}$ where each layer acts on the layers below it in a typed way.
Operationally, this corresponds to a *filtration* on $M_G$ by levels, with $\mu$ respecting the filtration.
Ostrom's polycentric finding shows this stratification can be *recursive* — every level may itself decompose into three sublevels — giving an $\omega$-stratification rather than a fixed three-level one.
As a structural fact: $\mathbf{Gov}$ should probably be the category of *graded* multicategories with grade-respecting self-actions, not the category of flat multicategories with arbitrary self-actions.

- **Normative systems have a deductive-closure structure** (corpus: `terms/normative-system.md` citing Alchourrón-Bulygin 1971).
  A normative system is the closure $N(\Sigma) = \{\varphi : \Sigma \vdash \varphi\}$ of an explicit axiom set $\Sigma$ under an entailment relation $\vdash$.
  As a structural fact about $\mathbf{Gov}$: the multicategory $M_G$ associated with a governance is not arbitrary but is the closure of a *generating set* of explicit acts under operadic composition and a derivation relation.
  This is the analog of Alchourrón-Bulygin's $N(\Sigma)$ at the multicategory level: $M_G = \overline{\Sigma_G}$ where $\Sigma_G$ is a generating set of declared acts.
  Two important structural consequences: (i) *gaps* — propositions where the closure is silent — are distinct from *contradictions* — propositions where the closure derives both $\varphi$ and $\neg \varphi$; the bilattice / paraconsistent structure handling this is below.
  (ii) Operational acts (typically finite, declared) generate the infinite closure of normative consequences operadically.

- **Operativity is settlement-valued, not Boolean** (corpus: `terms/normative-system.md`, "Settlement reading" section).
  A norm $\mathcal{N}$ is *operative at history $t$* iff both its *recognition* predicate (that the system acknowledges $\mathcal{N}$ as in force) and its *execution* predicate (that $\mathcal{N}$ propagates as a binding obligation in continuations of $t$) have reached affirming settlement in the predication-theoretic bilattice.
  Either may have settled while the other has not (a norm declared but not propagating, or propagating but not yet recognized).
  As a structural fact about $\mathbf{Gov}$: the value of "$f$ is an operative act of $G$" is not a Boolean but an element of a four-valued settlement bilattice $\mathbf{FOUR}$ on the (recognition × execution) axes — affirmed-and-propagating ($\mathbf{t}$), refused-and-not-propagating ($\mathbf{f}$), unsettled ($\bot$), or contested-with-evidence-both-ways ($\top$).
  Mathematically: $\mathbf{Gov}$ is naturally enriched over a $\mathbf{FOUR}$-valued setting, not over $\mathbf{Set}$ alone.

- **Internal plurality of logics is structural, not pathological** (corpus: `texts/institutional-logics-survey.md`).
  A single governance typically operates under multiple, often conflicting, normative logics simultaneously (Friedland-Alford 1991; Thornton-Ocasio-Lounsbury 2012).
  The corpus identifies four organizational coping strategies — *decoupling* (two parallel systems with no morphism between them), *selective coupling* (partial morphisms / spans between sub-systems), *structural differentiation* (product or coproduct decomposition), and *temporal separation* (sequential factorization, which is operadic composition).
  As a structural fact about $\mathbf{Gov}$: an object of $\mathbf{Gov}$ should not be assumed to be *internally simple*; the multicategory $M_G$ may decompose as a colimit (coproduct, pushout, more general) of sub-multicategories corresponding to coexisting logics, and the coping strategies correspond to specific colimit-cone configurations.
  The Boltanski-Thévenot orders-of-worth analysis (1991/2006) supplies independent confirmation: justificatory conflict between coexisting orders is irreducible and is resolved through *compromise* structures — fragile hybrid principles acknowledging value across orders.

- **Temporality is constitutive** (corpus: `texts/temporality-of-normative-systems.md`).
  Every governance act has a *lifecycle* (proposed → enacted → in force → amended → repealed).
  Governance has a *recurrence* structure (periodic re-confirmation of authority — the temporal mechanism of accountability).
  Norms persist as *meaning-settled* even when *execution* fails (lex posterior orders conflicts; meaning-settlement and execution-settlement are independent).
  As a structural fact about $\mathbf{Gov}$: a governance is at minimum a functor from a temporal index category $\mathbb{T}$ to (multicategories-with-self-action), not a single multicategory-with-self-action.
  The minimal definition above is a *snapshot*; a governance proper is a time-indexed family of snapshots with structure-preserving transitions.

- **The rule of recognition is an external social fact** (corpus: `terms/normative-system.md` citing Hart 1961).
  The unity of a normative system rests on accepted practice among officials regarding which rules are in force — not on a higher rule within the system.
  As a structural fact about $\mathbf{Gov}$: the *membership predicate* "$f \in \mathrm{Mor}(M_G)$" is grounded in a social acceptance external to $G$.
  This is a non-trivial constraint: any putative formal mechanism that internalizes the rule of recognition (a meta-norm validating norms) faces Kelsen's regress; Hart's resolution is to step outside the formal system.
  Mathematically: $\mathbf{Gov}$ may not be cartesian closed in any naive way, because the function space $G^H$ would presuppose an internal recognition relation that the rule-of-recognition observation rules out.
  This rules out certain natural-looking constructions and is itself a structural constraint.

- **Status function declarations are the generative mechanism of institutional fact** (corpus: `terms/status-function-declaration.md` citing Searle 1995, 2010; Grossi-Meyer-Dignum 2008).
  The corpus formalizes Searle's "X counts as Y in C" as a four-tuple $\mathcal{D} = (X, Y, C, A)$: target $X$, institutional status $Y$, context $C$, authorizing act $A$.
  Four invariants — *constitutive not descriptive* (the declaration creates the fact, does not report it), *standing required* (the declarer must have authority within $C$), *collective recognition sustains* (the fact persists only while the relevant community recognizes $C$), *context-relative* (status is never absolute, always $Y$-in-$C$).
  As a structural fact about $\mathbf{Gov}$: not all acts in $M_G$ are morphisms between fixed positions; some are *generative* — they introduce new positions into $\mathrm{Ob}(M_G)$ as a side effect of their performance.
  This is the *constitutive-rule* fragment of $M_G$, distinct from the *regulative-rule* fragment (acts governing pre-existing positions).
  The constitutive-regulative distinction (Searle 1969) is a partition on $\mathrm{Mor}(M_G)$ that the minimal definition does not yet make.
  Mathematically: $M_G$ has a generative-acts subset whose performance is a colimit-cone operation extending $M_G$'s object set — turning $\mathrm{Ob}(M_G)$ into a directed colimit of position sets indexed by the constitutive-act history.
  The closure-operator structure (Alchourrón-Bulygin) operates on the regulative fragment; the constitutive fragment is *additive* in a different sense — adding new entities to be regulated.

- **Accountability is a delegation-invariant total function on outcomes** (corpus: `terms/accountability.md`).
  The corpus formalizes accountability as a triple $\mathcal{Ac} = (B, S, A: \mathrm{Outcomes}(S) \to \{B\})$ — bearer $B$, scope $S$, total function $A$ sending every outcome in $S$ to $B$.
  Four invariants: totality (no outcome unassigned), *non-transferability by delegation* (delegating authority does not modify $A$ — the bearer remains answerable for outcomes regardless of who caused them), installation-anchoring (binding from investiture to formal relief), scope-exclusivity (within $S$, only $B$ is accountable).
  As a structural fact about $\mathbf{Gov}$: a governance object has *two distinct types of role*.
  (i) The *authority-bearing* role decomposes under delegation — a delegated agent has the authority the principal extended.
  (ii) The *accountability-bearing* role does *not* decompose under delegation — the bearer remains the total answerable party for every outcome in scope.
  Mathematically: $M_G$ has both a delegation operad-structure on authority (sub-multicategories embedding) and a fixed-point structure on accountability (a function $\mathrm{outcomes} \to \mathrm{bearer}$ that is invariant under the delegation operations).
  The minimal definition collapses these into a single multicategory; a fuller theory must keep them distinct.

- **Authority is structured but plural in its legitimacy basis** (corpus: `terms/authority.md` citing Weber 1922; Raz 1986).
  Authority is formalized as the capacity $\mathbf{A}(a, R \to R', s)$ of agent $a$ to perform a deontic act $R \to R'$ within scope $s$ such that the act generates new normative relations binding regardless of the bound parties' consent.
  Weber's three pure types — *traditional* (legitimacy by immemorial tradition), *charismatic* (legitimacy by exceptional gift of the leader), *rational-legal* (legitimacy by codified rules and the office) — exhaust the bases on which authority claims and receives legitimacy; real authority structures are mixtures with specifiable transition dynamics (charismatic → traditional or rational-legal via routinization).
  Raz (1986) adds the *service conception*: authority is justified iff following the authority's directives better serves the reasons that already apply to the subject than independent judgment would.
  As a structural fact about $\mathbf{Gov}$: the *legitimacy basis* of acts in $M_G$ is not a free parameter — it is one of (or a mixture of) three structurally-distinct types, with specifiable composition and routinization dynamics between them.
  The Weber typology suggests that the morphism-set $\mathrm{Mor}(M_G)$ is partitioned (or graded) by legitimacy-type, with certain transitions between types (charismatic-to-traditional, traditional-to-rational-legal) being structurally possible and others (rational-legal-to-charismatic without revolution) being structurally hard.
  This is content that goes into the *internal logic* of $\mathbf{Gov}$, not just its objects.

- **Office is distinct from person; role-as-type is distinct from role-as-token** (corpus: `terms/authority.md`, `texts/weber-bureaucracy-and-legitimacy-survey.md`, `texts/social-role-theory-survey.md` citing Masolo et al. 2004; Boella-van der Torre 2006-2007).
  The bureaucratic separation of *office* (an impersonal bearer-independent position-type with a Hohfeldian-position profile) from *officeholder* (a specific agent filling that interface at a specific time) is a structural feature of any non-charismatic governance.
  Masolo et al. (2004) generalize this to the role-as-type vs role-as-token distinction.
  Boella-van der Torre (2006-2007) prove that a normative role-system generates a *partial order on agent actions* — the actions satisfying a role's norms form an *upward-closed set* in the action lattice, connecting role theory to fixed-point semantics over a closure operator.
  As a structural fact about $\mathbf{Gov}$: positions in $\mathrm{Ob}(M_G)$ are not undifferentiated; they have a *type/token* structure where types are bearer-independent specifications and tokens are specific assignments.
  Investiture (the act of installing a bearer into a type-position to produce a token) and relief (the act of dissolving the token) are specific kinds of acts in $M_G$ with specific composition laws — investiture is unit, relief is its inverse where both exist.

- **Separation of duty is a structural constraint on role-assignment** (corpus: `texts/social-role-theory-survey.md` citing Sandhu et al. 1996; ANSI/INCITS 359-2004).
  RBAC formalizes role-assignment as a relation $\mathrm{UA} \subseteq \mathrm{USERS} \times \mathrm{ROLES}$ with a role hierarchy $\leq$ as partial order. *Separation of duty* constraints — certain role combinations cannot be co-assigned (static SoD) or co-activated (dynamic SoD) — are structural axioms on $\mathrm{UA}$ that the role-system imposes for accountability and conflict-of-interest reasons.
  As a structural fact about $\mathbf{Gov}$: the assignment-of-token-to-type relation has structural constraints expressible as forbidden role-product sub-multicategories.
  Mathematically: certain colimits in $M_G$ are *forbidden* by SoD constraints, generating a notion of *admissible decomposition* of acts that the minimal definition does not impose.

- **The semi-autonomous social field is the canonical unit of analysis** (corpus: `texts/legal-pluralism-survey.md` citing Moore 1973).
  A *semi-autonomous social field* is one that can generate rules and induce or coerce compliance, but is also vulnerable to rules and decisions emanating from the larger world by which it is surrounded.
  Galanter (1981) generalizes to "justice in many rooms": rule-generation and dispute-processing occur across many sites; the state's courts are one site among many.
  Griffiths (1986) distinguishes weak from strong legal pluralism — weak pluralism is the state's recognition of other orders within state-set carve-outs; strong pluralism is the empirical claim that orders coexist regardless of state recognition.
  As a structural fact about $\mathbf{Gov}$: a governance object is *not* a closed system; it is internal to a context of other governance objects with interaction effects (penetration, accommodation, hybridization, forum-shopping).
  Mathematically: $\mathbf{Gov}$ may not be the right working level — the natural setting may be an *enclosing* category of *governance-fields* with semi-autonomous-field objects as morphisms-with-leakage rather than strict isomorphism classes.
  Strong pluralism rules out treating any single object of $\mathbf{Gov}$ as analytically isolated.

- **The Ostrom-IAD framework formalizes the action situation** (corpus: `texts/polycentric-governance-survey.md` citing E.
  Ostrom 1990, 2005, 2010).
  The Institutional Analysis and Development framework decomposes any *action situation* into seven elements — positions, actors, allowed actions, available information, control over outcomes, costs and benefits, outcome-functions — and sorts the rules-in-use governing it into seven types: *boundary* (who participates), *position* (what positions exist), *choice* (what actions are allowed in each position), *aggregation* (how individual choices become collective outcomes), *information* (what is available to whom), *payoff* (what costs and benefits attach to outcomes), *scope* (what outcomes are within the situation).
  Each rule-type is modifiable at each of the three levels (operational, collective-choice, constitutional), giving a $7 \times 3$ structural grid of rule-modification operators.
  The corpus also identifies eight empirically-grounded *design principles* for sustainable common-pool resource governance (boundary clarity, congruence with local conditions, collective-choice arrangements for rule-modification, monitoring, graduated sanctions, conflict-resolution mechanisms, recognition of rights to organize, nested enterprises).
  As a structural fact about $\mathbf{Gov}$: the multicategory $M_G$ has more internal structure than "positions and acts" — it has at least a $7 \times 3$ grid of *rule-types-at-levels* governing how acts modify positions, what counts as a valid action, how individual contributions aggregate to joint outcomes, what information flows, what payoffs attach.
  Mathematically: $M_G$ is graded by rule-type as well as by level, giving a $\mathbb{Z}/7 \times \mathbb{Z}/3$-graded structure on the self-action $\mu_G$ rather than a flat structure.

- **A polity can operate under multiple governance theories in different operational contexts** (corpus: `prose/teaching/explanations/dual-governance-context.md`).
  The corpus identifies a structural pattern: a single polity operates under one governance theory for its internal life and a different governance theory for its external operations, with the two theories not being reducible to one another.
  This is sharper than institutional logics' "multiple coexisting logics" — the *same set of agents* is governed by *categorically different* rule-systems depending on the operational context.
  As a structural fact about $\mathbf{Gov}$: a governance object may not be a single $(M, \mu)$ but a *family* of such, indexed by operational context, with *transition morphisms* between contexts that need not be structure-preserving in either direction.
  Mathematically: $\mathbf{Gov}$ is more naturally a 2-category (or a fibration) over a base category of *operational contexts*, with each context having its own governance-theory and inter-context transitions being a separate level of structure.

- **Algorithmic regulation is a structurally distinct governance mode** (corpus: `texts/algorithmic-governance-and-governance-by-indicators-survey.md` citing Yeung 2017, 2018; Hildebrandt 2015; Fourcade-Healy 2024).
  The literature distinguishes classical regulation (general rules applied *after the fact* to *individual cases* under conditions permitting *contestation*) from algorithmic regulation (individual predictions applied *in advance* to *categorized populations* under conditions often *precluding* contestation).
  The corpus identifies four meta-structural axes: predictive-vs-retrospective, population-categorical-vs-case-individual, opaque-vs-publicly-rule-bound, pre-emptive-vs-contestable.
  As a structural fact about $\mathbf{Gov}$: acts in $M_G$ vary along these meta-structural axes, and certain combinations (predictive + opaque + pre-emptive + population-categorical) produce structurally distinct governance that resists the standard formal accounts.
  Mathematically: $\mathrm{Mor}(M_G)$ has a meta-typing along these axes, with certain combinations admitting standard formal analysis and others requiring extensions (probabilistic / coalgebraic / predictive structure not present in the classical-regulation fragment).

- **The corpus has an alternative topos-theoretic articulation** (corpus: `terms/polity.md`).
  The polity term in the corpus formalizes a related object: a *polity* is a quadruple $\mathcal{P} = (T_\mathcal{P}, J_\mathcal{P}, \mathrm{Aut}, C_\mathcal{P})$ where $T_\mathcal{P}$ is a geometric theory (the constitutional theory), $J_\mathcal{P}$ is a Grothendieck topology (the recognition topology), $\mathrm{Aut}$ is an autarkeia certificate (the classifying topos $[\!
  [T_\mathcal{P}]\!]$ has a conservative set of points — self-sufficiency), and $C_\mathcal{P}$ is the constituent power (initial founding act).
  Constitutional amendment is a geometric morphism between classifying topoi.
  This is a *different mathematical level* from the multicategory-with-self-action definition: it operates at the topos / classifying-object level rather than the operadic level.
  The two articulations are not in conflict — they capture different structural features.
  The topos-theoretic articulation makes constitutional amendment, autarkeia, and constituent power explicit; the multicategory articulation makes joint acts, self-modification, and translation-refusal explicit.
  A full theory of governance probably needs both: the operadic level to model what acts exist and how they compose; the topos level to model the constitutional theory those acts collectively realize.
  Whether there is a clean functor or geometric morphism connecting the two articulations is open.

## Prior formal frameworks adjacent to Gov

External research surfaces seven formal frameworks developed in adjacent literatures (categorical logic in computer science, deontic logic, normative-multi-agent systems, social-science topos-theory) whose technical apparatus bears directly on the seams of the definition above.
None of them is "$\mathbf{Gov}$ already done" — but several of the open seams have prior-art resolutions that the definition above should accommodate rather than re-invent.

- **Institutions (Goguen-Burstall 1992; Mossakowski-Tarlecki 1990s-2000s; Diaconescu 2008).** A direct categorical formalization, in computer science, of "logical system" as a quadruple $(\Sigma, S, M, \models)$ where $\Sigma$ is a category of signatures, $S: \Sigma \to \mathbf{Set}$ a sentence functor, $M: \Sigma^{op} \to \mathbf{Cat}$ a model functor, and $\models$ a satisfaction relation invariant under signature change ("satisfaction condition").
  Institutions form a category $\mathbf{INS}$ with at least four distinct morphism notions (morphism, comorphism, forward morphism, backward morphism) — Mossakowski-Tarlecki give a systematic comparison.
  Grothendieck institutions (Diaconescu) combine institutions via fibration. *Bearing on $\mathbf{Gov}$*: $\mathbf{INS}$ is direct precedent for a category of "structured systems with translation between them," and its multiplicity of morphism notions is precedent for translation-refusal as structural (Proposition 5).
  The satisfaction-condition pattern lifts to $\mathbf{Gov}$ as: governance-morphisms $\phi: G \to G'$ should preserve some operativity judgment $\phi$-coherently, not merely intertwine $\mu$.
  This refines the definition of $\mathbf{Gov}$-morphism: it should carry, in addition to the intertwining condition, a *satisfaction-translation invariance* over a sentence functor $S_G: M_G \to \mathbf{Set}$ tracking which acts are operative. *What is novel in $\mathbf{Gov}$ vs. $\mathbf{INS}$*: the self-action $\mu$ — institutions are *static* logical systems; governances are self-modifying.
  There is no $\mu$ in the institution definition; this is a $\mathbf{Gov}$-specific addition.

- **Counts-as conditionals and institutionalized power (Jones-Sergot 1996; Grossi-Meyer-Dignum 2006-2008; Sileno 2015-2018).** Jones and Sergot's "Formal Characterisation of Institutionalised Power" (1996, *Logic J.
  IGPL* 4(3)) introduces a conditional connective for institutional empowerment — distinct from action, obligation, and ability — capturing "$a$'s performance of an act of designated type *counts as* producing institutional state $A$."
  Grossi-Meyer-Dignum systematize three semantically distinct readings of "$X$ counts as $Y$ in $C$" (contextual classification, proper classification, constitutive rule). *Bearing on $\mathbf{Gov}$*: this fills the *binding-force primitive* seam.
  The definition above has acts producing collective outputs (operadically) and revising the substrate (via $\mu$), but no separate "this act, when performed in this context, brings into being an institutional state-of-affairs that binds."
  The counts-as primitive supplies exactly this.
  Mathematically: $M_G$ should be equipped with a binary relation $\Rightarrow_C \subseteq \mathrm{Mor}(M_G) \times \mathrm{InstStates}_G$ relative to each institutional context $C$, satisfying the Jones-Sergot axioms (non-monotonic conditional with appropriate inference rules).
  This relation is the *constitutive* fragment in the sense already extracted from Searle in the corpus enrichments; Jones-Sergot give its formal calibration.

- **Input/output logic (Makinson-van der Torre 2000-; Parent 2008-).** Normative codes formalized as sets of ordered pairs $N \subseteq \mathcal{L} \times \mathcal{L}$, with input-output operations $\mathrm{out}_i(N, A)$ for $i \in \{1, 2, 3, 4\}$ yielding the outputs triggered by inputs in $A$.
  Two structural advances over classical deontic logic: (i) norms are *operational* (procedural) rather than truth-conditional, avoiding the paradoxes of monadic deontic logic; (ii) AGM-style change operations on the norm-set itself — expansion $N \oplus (a, x)$, contraction $N \ominus (a, x)$, revision $N \otimes (a, x)$ — give a rigorous account of norm dynamics. *Bearing on $\mathbf{Gov}$*: this fills the *operativity-as-procedural-closure* seam and connects to the AGM theory of belief change as machinery for governance change.
  The Alchourrón-Bulygin closure $N(\Sigma)$ extracted from the corpus is the classical truth-conditional version; Makinson-van der Torre's input/output operations are the corresponding procedural-closure operators.
  Mathematically: the multicategory $M_G = \overline{\Sigma_G}$ should be understood not as a deductive closure but as the procedural closure of $\Sigma_G$ under input/output operations.
  The norm-change operations $\oplus, \ominus, \otimes$ are concrete examples of acts that $\mu_G$ should map to specific endofunctors of $M_G$ — they are the most-studied instances of substrate-revising acts.

- **Logical architecture of a normative system (Boella-van der Torre 2006-2008).** A normative system as a *combination* of input/output logic components, one for each architectural function: a *counts-as* component, an *institutional-constraint* component, an *obligation* component, a *permission* component, and a *norm-change* component, each operating as its own input/output logic with specified interactions. *Bearing on $\mathbf{Gov}$*: this fills the *stratified $\mu$* seam.
  The corpus enrichments above identified a $\mathbb{Z}/7 \times \mathbb{Z}/3$ grid of rule-types-at-levels from Ostrom-IAD; Boella-van der Torre's architecture gives the orthogonal *functional* stratification of $\mu_G$.
  The self-action $\mu_G$ should be decomposed as $\mu_G = (\mu_G^{\text{counts-as}}, \mu_G^{\text{constr}}, \mu_G^{\text{oblig}}, \mu_G^{\text{perm}}, \mu_G^{\text{change}})$ with each component governing acts of the corresponding architectural type and with specified compatibility conditions between components.

- **Boolean quasi-orderings and the algebra of normative position (Odelstad-Lindahl 1998-; Lindahl-Odelstad 2008).** An algebraic integration of the Kanger-Lindahl-Sergot-Jones theory of normative positions with the Alchourrón-Bulygin theory of normative systems via *Boolean quasi-orderings* — pairs $(B, \leq)$ where $B$ is a Boolean algebra and $\leq$ a quasi-order on $B$ refining the Boolean order.
  Normative systems are represented as Bqos; transitions between systems as Bqo-homomorphisms. *Bearing on $\mathbf{Gov}$*: provides a concrete worked algebraic semantics for one operativity-level of $M_G$ — the level at which positions, normative relations between positions, and their entailments are tracked. *What is novel in $\mathbf{Gov}$ vs. Bqo*: the Bqo apparatus is single-level and static; $\mathbf{Gov}$ requires it to be stratified by Ostrom levels and to be acted on by $\mu$ — the algebraic structure of the *change* operations on Bqos is not yet developed.

- **Categorical semantics of deontic logic (Eberle et al. 2014; Sileno-Boer-van Engers 2018).** Deontic deductive systems as fibrations in Cartesian closed categories on an intuitionistic propositional action-logic base.
  The deontic operators are interpreted as endofunctors with specified universal properties; obligation, permission, and prohibition correspond to monads, comonads, and their interaction. *Bearing on $\mathbf{Gov}$*: this is the closest external prior art to the categorical-formalization-of-governance program.
  It validates the fibrational reading already anticipated in the corpus enrichments above (under "dual operational contexts") and supplies a worked categorical semantics for the deontic fragment. *What remains novel in $\mathbf{Gov}$*: governance is broader than deontic logic — it includes constitutive acts (Jones-Sergot, Searle), self-modifying acts ($\mu$), and the stratification of meta-governance (Hart-Ostrom) that the deontic fragment does not cover.
  The Eberle fibration is a sub-fibration of the structure that $\mathbf{Gov}$ requires.

- **Topos-theoretic social science (Sallach 2010-; cf. Lawvere 1976).** A sociology research program treating local truth-attribution by individual social actors as the data of a sheaf over a site of social situations, with social pluralism articulated as the failure of the sheaf to globalize. *Bearing on $\mathbf{Gov}$*: independent confirmation, from the sociological side, of the topos-theoretic polity articulation already developed in the corpus (`terms/polity.md`).
  The Sallach program does not pursue the *governance* application specifically — it works at the social-epistemology level — but the structural insight is the same: pluralism is geometric (sheaves not globalizing) rather than ideological, and the natural setting is a topos. *Implication for $\mathbf{Gov}$*: the relationship between the multicategorial articulation (this question's definition) and the topos-theoretic articulation (`terms/polity.md`) is not arbitrary — the multicategory $M_G$ presents the *acts available within a polity*, while the topos $[\!
  [T_\mathcal{P}]\!]$ presents the *propositions internal to the polity's constitutional theory*.
  There is likely a Lawvere-Tierney-style adjunction between the two — making explicit which acts in $M_G$ correspond to which interior automorphisms of $[\!
  [T_\mathcal{P}]\!]$ — but this adjunction has not been worked out.

**Synthesis.** Of the eight open seams identified in the corpus-enrichments section:

| Seam | Prior art | Status |
|---|---|---|
| Temporal extension | (none direct) | open |
| Empirical anchor / Church-Turing analog | (none direct; Bqo-algebra and input/output logic are partial empirical anchors at the procedural-norm level) | open |
| Binding-force primitive | Jones-Sergot 1996 counts-as | resolved up to choice of axiomatization |
| Contestation primitive | (none direct; AGM revision $\otimes$ is the closest, but covers norm-change, not contestation by a bound party) | open |
| $\mathbf{FOUR}$-enrichment for operativity | Belnap-Dunn four-valued logic (Belnap 1977; Dunn 1976); Fitting-Ginsberg interlaced bilattices; Diaconescu's many-valued institutions | resolved via two formulations (internal-satisfaction, hom-set-enrichment) — see §FOUR-enrichment below |
| Stratified $\mu$ | Boella-van der Torre logical architecture; Ostrom-IAD $7 \times 3$ grid | resolved up to specifying compatibility conditions |
| Coalgebraic feedback | Aczel 1988; Rutten 2000; Jacobs 2017 (general coalgebra); Cîrstea-Pattinson on normative-systems-as-coalgebras | open at the governance-specific level; general apparatus exists |
| Connection to topos polity articulation | Sallach topos-theoretic social science; Lawvere geometric logic for predicate theories | open as conjectural adjunction |

The empirical anchor — the governance-side Church-Turing thesis — remains the deepest open question.
Three of the open seams (contestation, $\mathbf{FOUR}$-enrichment, coalgebraic feedback for governance specifically) appear to require *novel* work that the existing adjacent literatures do not supply; the others can be developed by adapting existing apparatus.

## FOUR-enrichment of Gov: two formulations

The minimal definition treats hom-sets as ordinary sets and treats acts as either operative or not.
Both restrictions are at odds with the empirical fact that operativity-judgments are *partial* (a norm may be declared but not propagating; recognized but not executing) and that translations between governances are themselves contested rather than simply present or absent.
Two standard mathematical formulations of "four-valued operativity" lift the definition.
Both use only standard apparatus from Belnap-Dunn four-valued logic (Belnap 1977, "A useful four-valued logic"; Dunn 1976, "Intuitive semantics for first-degree entailments and 'coupled trees'"), Fitting-Ginsberg interlaced bilattices (Ginsberg 1988, "Multivalued logics: A uniform approach to inference in artificial intelligence"; Fitting 1991, "Bilattices and the semantics of logic programming"), and Diaconescu's institutional semantics for many-valued logics (Diaconescu 2013, *Institutional Semantics for Many-Valued Logics*).
They are independent commitments and can be adopted separately or jointly.

**Preliminaries.** The Belnap-Dunn bilattice $\mathbf{FOUR} = \{\bot, \mathbf{t}, \mathbf{f}, \top\}$ carries two lattice orders.
The *truth order* $\leq_t$ has $\mathbf{f} \leq_t \bot, \top \leq_t \mathbf{t}$; meet $\wedge_t$ and join $\vee_t$ generalize classical conjunction and disjunction.
The *information order* $\leq_k$ has $\bot \leq_k \mathbf{t}, \mathbf{f} \leq_k \top$; meet $\otimes_k$ and join $\oplus_k$ accumulate or refine information.
Fitting (1991) proves $\mathbf{FOUR}$ is *interlaced* — operations of either order are monotone in the other.
Ginsberg-Fitting's *twist-product representation* gives $\mathbf{FOUR} \cong \mathbf{2} \odot \mathbf{2}$: the four values factor as pairs (truth-judgment, falsity-judgment).
For governance: a value $(r, e) \in \mathbf{2} \times \mathbf{2}$ records *recognition* settlement (the system acknowledges the act as in force) and *execution* settlement (the act propagates as binding).
The four values arise: $\mathbf{t} = (1, 1)$ (recognized and executing); $\mathbf{f} = (0, 0)$ (refused and not executing); $\bot = (0, 0)$-via-no-evidence (insufficient evidence — distinguishable from $\mathbf{f}$ in Belnap-Dunn but collapses if recognition and execution are determinate); $\top = (1, 0) \text{ or } (0, 1)$ (the two axes disagree — declared but not propagating, or propagating without acknowledgment).
The truth-projection $t: \mathbf{FOUR} \to \mathbf{2}$ sending $\{\mathbf{t}, \top\} \mapsto 1$, $\{\mathbf{f}, \bot\} \mapsto 0$ is a bounded-lattice morphism, so any Boolean-valued result transports along it.

### Reading 2: Internal satisfaction (many-valued institutional)

The lighter formulation.
Adapt Diaconescu's many-valued-institutional framework to $\mathbf{Gov}$: keep ordinary hom-sets, but equip each governance with a four-valued internal satisfaction relation.

**Definition (FOUR-valued governance).** A *$\mathbf{FOUR}$-valued governance* is a triple $G = (M_G, \mu_G, \models_G)$ where:

1. $(M_G, \mu_G)$ is a governance in the sense of the base definition.

2. $\mathrm{Cond}_G$ is a set of *operativity-conditions* — propositions about which acts in $M_G$ count as operative under which circumstances.
  (In Diaconescu's framework these play the role of the sentence functor $S: \Sigma \to \mathbf{Set}$.)

3. $\models_G: \mathrm{Mor}(M_G) \times \mathrm{Cond}_G \to \mathbf{FOUR}$ is a four-valued satisfaction relation.
  The value $\models_G(f, \varphi) \in \mathbf{FOUR}$ records the recognition-and-execution settlement of "$f$ is operative under condition $\varphi$."

4. **Self-action compatibility.** For each act $f$, the substrate-revision $\mu_G(f): M_G \to M_G$ induces a transformation on operativity: $\models_G(\mu_G(f)(g), \varphi) \geq_k \models_G(g, \varphi)$ — performing an act may *accumulate* information (raise the value in $\leq_k$) but does not *contradict* prior settlement.

**Definition (morphism of FOUR-valued governances).** A morphism $\phi: G \to G'$ is a governance morphism (in the base sense) equipped with a *condition-translation* $\phi^*: \mathrm{Cond}_{G'} \to \mathrm{Cond}_G$ satisfying the *four-valued satisfaction condition*: $$\models_G(f, \phi^*\varphi) \;=\; \models_{G'}(\phi(f), \varphi) \quad \text{in } \mathbf{FOUR}$$ for every $f \in \mathrm{Mor}(M_G)$ and $\varphi \in \mathrm{Cond}_{G'}$.
This is the direct adaptation of Goguen-Burstall's satisfaction condition to four-valued logic in the sense of Diaconescu.

**Proposition 6 (FOUR-Gov is a category).** *$\mathbf{FOUR}$-valued governances and their morphisms form a category $\mathbf{Gov}_{\mathbf{FOUR}}$, with a forgetful functor $U_{\mathbf{FOUR}}: \mathbf{Gov}_{\mathbf{FOUR}} \to \mathbf{Gov}$ given by $(M, \mu, \models) \mapsto (M, \mu)$.*

*Proof sketch.* Composition: $(\psi \circ \phi)^* = \phi^* \circ \psi^*$ and the satisfaction condition composes (equality is transitive).
Identity: $\mathrm{id}_G^* = \mathrm{id}_{\mathrm{Cond}_G}$ and the condition holds trivially.
Forgetfulness: drop $\models_G$ and $\phi^*$. $\square$

**Proposition 7 (Boolean reduction).** *The truth-projection $t: \mathbf{FOUR} \to \mathbf{2}$ induces a functor $T: \mathbf{Gov}_{\mathbf{FOUR}} \to \mathbf{Gov}_{\mathbf{2}}$ from four-valued governances to Boolean-valued governances by post-composing $\models_G$ with $t$.
Diaconescu's results on truth-value-morphisms of institutions ([Diaconescu 2013, Ch. 3]) give: $T$ commutes with the forgetful functor and preserves the satisfaction-condition equality.*

*Proof.* $t$ is a bounded-lattice morphism, so applying it pointwise to $\models_G$ yields a $\mathbf{2}$-valued satisfaction satisfying the corresponding condition (equality in $\mathbf{2}$).
Functoriality on morphisms is immediate. $\square$

This proposition shows that the FOUR-valued formulation conservatively extends the Boolean-valued one — every two-valued result is the $T$-image of a four-valued result, but four-valued $\mathbf{Gov}$ records additional information that the Boolean projection loses (the distinction between $\mathbf{t}/\top$ and between $\mathbf{f}/\bot$).

**Proposition 8 (contradictions vs. gaps are distinguished).** *In $\mathbf{Gov}_{\mathbf{FOUR}}$, governance operativity-states distinguish (i) gaps where recognition and execution have not yet settled ($\models_G(f, \varphi) = \bot$) from (ii) contradictions where they have settled to incompatible values ($\models_G(f, \varphi) = \top$).
In $\mathbf{Gov}_{\mathbf{2}}$ both project to $0$ — gaps and contradictions are indistinguishable.*

*Proof.* By construction of $\mathbf{FOUR}$: $\bot$ and $\top$ are distinct elements with $t(\bot) = 0$ and $t(\top) = 1$, but $T$ collapses them to $0/1$ respectively only via the truth-projection — the *information* axis ($\bot \leq_k \top$) is invisible in $\mathbf{2}$.
Alchourrón-Bulygin's distinction between *normative gaps* and *normative contradictions* (1971, §6) is therefore representable in $\mathbf{Gov}_{\mathbf{FOUR}}$ as the $\bot/\top$ distinction but not representable in $\mathbf{Gov}_{\mathbf{2}}$. $\square$

This is the technical payoff of reading 2: a structural feature flagged at the corpus level (operativity has two independent axes, gaps differ from contradictions) becomes a structural feature of the category, recoverable from $\mathbf{FOUR}$'s interlaced-bilattice structure via standard Belnap-Dunn semantics.

### Reading 1: Hom-set enrichment (FOUR-enriched category)

The heavier formulation.
Make $\mathbf{Gov}$ itself a category enriched over $\mathbf{FOUR}$ in the sense of Kelly (1982, *Basic Concepts of Enriched Category Theory*).
This requires choosing one of $\mathbf{FOUR}$'s monoidal structures as the enrichment.

**Definition (truth-enriched Gov).** Choose the truth-monoidal structure $(\mathbf{FOUR}, \wedge_t, \mathbf{t})$.
The *truth-enriched governance category* $\mathbf{Gov}_t$ has:

1. Objects: governances $(M, \mu)$ as in the base definition.

2. For each pair $(G, G')$: a hom-value $\mathbf{Gov}_t(G, G') \in \mathbf{FOUR}$ — the settlement-value of "there exists a structure-preserving translation $G \to G'$." Cases:
    - $\mathbf{t}$ — translation exists, is recognized, and propagates (corresponds to a base-$\mathbf{Gov}$ morphism).
    - $\mathbf{f}$ — translation does not exist, is refused, and does not propagate (structurally untranslatable, the case of Proposition 5).
    - $\bot$ — insufficient evidence (the two governances may or may not be relatable; the question is unsettled).
    - $\top$ — contested: there is evidence for and against the existence of a translation simultaneously (e.g., a partial translation that is recognized but not executing, or executing without recognition — the *Treaty of Waitangi* situation discussed below in "what is genuinely established").

3. Identity: $\mathbf{t} \leq_t \mathbf{Gov}_t(G, G)$ for every $G$ (the identity translation is always at least true).

4. Composition: $\mathbf{Gov}_t(G, G') \wedge_t \mathbf{Gov}_t(G', G'') \leq_t \mathbf{Gov}_t(G, G'')$.
  Standard $\mathbf{FOUR}$-conjunction: $\mathbf{t} \wedge_t \mathbf{t} = \mathbf{t}$; either argument being $\mathbf{f}$ gives $\mathbf{f}$; $\top$ propagates contestation; $\bot$ propagates as $\bot$ unless dominated.

**Definition (information-enriched Gov).** Choose the information-monoidal structure $(\mathbf{FOUR}, \otimes_k, \top)$.
The *information-enriched governance category* $\mathbf{Gov}_k$ has the same objects, hom-values in $\mathbf{FOUR}$, but composition via the information meet: $$\mathbf{Gov}_k(G, G') \otimes_k \mathbf{Gov}_k(G', G'') \leq_k \mathbf{Gov}_k(G, G'')$$ Composing translations accumulates evidence: combining two recognized translations yields $\mathbf{t} \otimes_k \mathbf{t} = \mathbf{t}$; combining a recognized with a refused yields $\mathbf{t} \otimes_k \mathbf{f} = \top$ (the composite is contradictory — translation evidence exists and is refused); combining either with no-information yields the original.

**Proposition 9 (twist-product factorization).** *Under the Ginsberg-Fitting twist-product $\mathbf{FOUR} \cong \mathbf{2} \odot \mathbf{2}$, a $\mathbf{FOUR}$-enriched category factorizes (up to isomorphism) as a pair of $\mathbf{2}$-enriched categories — equivalently, a pair of preorders on the same object-set.
The two preorders correspond to the recognition-axis and execution-axis of translation-existence.*

*Proof sketch.* $\mathbf{2}$-enriched categories are preorders (Lawvere 1973).
The twist-product $\mathbf{2} \odot \mathbf{2}$ defines $\mathbf{FOUR}$-elements as pairs $(p, n)$ with $p$ representing positive-evidence and $n$ representing negative-evidence, with operations defined componentwise (truth) or with appropriate sign (information). $\mathbf{FOUR}$-enrichment with composition in $\wedge_t$ unfolds to: $(p_1, n_1) \wedge_t (p_2, n_2) = (p_1 \wedge p_2, n_1 \vee n_2)$ — positive composes by conjunction, negative by disjunction.
This factorizes the enrichment into a pair of preorders: a *translation-affirmation preorder* (when does positive evidence compose) and a *translation-refusal preorder* (when does negative evidence accumulate). $\square$

**Proposition 10 (truth-projection functor).** *The truth-projection $t: \mathbf{FOUR} \to \mathbf{2}$ extends to a 2-functor $T: \mathbf{Gov}_t \to \mathbf{Gov}_2$ that sends each $\mathbf{FOUR}$-hom-value to its truth-projection and recovers the base category $\mathbf{Gov}$ (since $\mathbf{Gov}_2 \cong \mathbf{Gov}$ as $\mathbf{2}$-enriched is the same as ordinary).*

*Proof.* $t$ preserves $\wedge_t$ (it is a bounded-lattice morphism), so the enriched composition condition transports.
The $\mathbf{2}$-enrichment is equivalent to ordinary category structure. $\square$

Reading 1 is the strong-pluralist commitment: not only is translation-between-governances paraconsistent, the *paraconsistency is structural to the category*.
Reading 2 keeps the category Set-enriched and locates the paraconsistency inside each object's operativity-semantics.

### Joint reading

Reading 1 and reading 2 are independent but combinable.
The joint structure is the category of $\mathbf{FOUR}$-valued institutions, $\mathbf{FOUR}$-enriched — formally $\mathbf{FOUR}\text{-}\mathbf{Inst}(\mathbf{FOUR})$ in Diaconescu's notation.
This is heavier but well-defined; Diaconescu (2013, Chapters 4-5) develops the analogous structure for arbitrary residuated-lattice-valued institutions.

### What FOUR-enrichment captures that the base definition does not

- *Operativity-gaps vs. operativity-contradictions* (Proposition 8) — distinguishable in $\mathbf{Gov}_{\mathbf{FOUR}}$, indistinguishable in base $\mathbf{Gov}$.
- *Contested translatability* — in reading 1, $\top$-valued hom-values record translations that are simultaneously affirmed and refused (Treaty-of-Waitangi-style situations).
- *Recognition-execution decomposition* — via twist-product, both readings expose the corpus-identified two-axis structure of operativity (and, in reading 1, of translation) as the fundamental factorization.

### What it does not capture

- *Temporality* — the four-valued structure is still synchronic; lifecycle of norms (proposed → enacted → in force → repealed) requires the temporal extension seam, independent of $\mathbf{FOUR}$-enrichment.
- *Refinement of $\bot$* — Belnap-Dunn $\bot$ collapses many distinct epistemic states ("no one has investigated," "investigated but undecidable," "investigated and provisionally undecided").
  Refinement requires moving from $\mathbf{FOUR}$ to a larger residuated lattice (e.g., the unit interval or a graded bilattice).
- *Non-interlaced phenomena* — Belnap-Dunn's interlacing forces a specific compatibility between truth- and information-orders that may not hold for all governance situations (a recognition can rise while execution evidence falls — this is interlaced — but more exotic phenomena may need a non-interlaced bilattice).

## What this definition does and does not capture

The definition is a first-pass commitment.
Honest accounting of what it does and does not yet capture, in mathematical terms:

**Captured.** - *N-ary joint acts*: multicategories have $n$-ary morphisms as primitives, so joint commitment is not reduced to sequenced individual acts. - *Typed positions*: positions are objects of the multicategory; different traditions correspond to different object-sets and different available acts. - *Self-modification*: $\mu$ assigns to each act an endofunctor that revises the act-system. - *Static vs. dynamic distinction*: $\mathbf{Gov}_{\mathrm{stat}}$ vs. its complement is a clean structural division. - *Translation-refusal as emptiness of hom-sets*: Proposition 5. - *Composition of acts*: operadic composition.

**Not yet captured (open work).** - *Temporal extension beyond operadic composition*: governance acts have downstream consequences over time that are not exhausted by sequential composition with subsequent acts.
Adding explicit time-parametrization requires passing to operads in presheaves over a time-category, or to enriched multicategories.
The category $\mathbf{Gov}$ as defined treats time as implicit in act-composition only. - *Empirical anchor*: nothing in the definition pins $\mathbf{Gov}$ to the *empirical* phenomenon of governance.
Any symmetric multicategory with self-action is an object of $\mathbf{Gov}$ — including ones that have no plausible interpretation as governance.
A *governance thesis* analogous to Church-Turing — picking out which objects of $\mathbf{Gov}$ correspond to empirical governance — is open. - *Binding force*: the definition has acts that change positions (operadically, by their typing), but does not have an explicit *binding* primitive distinguishing "what is now obligatory for constituent $c$" from "what position $c$ occupies."
Binding can be encoded into positions (a position can be "obligated to do $X$"), but whether this encoding is faithful to all traditions is open. - *Contestation*: there is no primitive for the contestation of an act, only for the production of a derivative act (operadic composition with a fresh act in input position).
Whether contestation deserves its own primitive is open. - *Plural-vs-singular metaphysics*: the definition treats individual constituents as occupying positions in a multicategory.
Relational-ontology traditions where individuals are derived from relations are accommodated by taking *positions to be relational positions* — but this is a modeling choice, not built into the structure.
Different metaphysical commitments correspond to different choices of $\mathrm{Ob}(M)$; the structure does not adjudicate between them.

> **The question of what is being theorized is itself substantive.** What governance *is* — what makes a multiplicity a unity-of-action at all, what makes an act an act *of* a collective, what binds members to a collective decision — is contested at the metaphysical and political-ontological level (Searle 1995 on collective intentionality; Gilbert 1989 on plural subjects; Bratman 1993, 2014 on reductive shared-intention; Tuomela 2007 on we-mode; Negri 2002 on constituent power; against all of these, the relational ontologies of Indigenous traditions where the relational whole is constitutively prior to any individual locus).
> The candidates are not parameter-variants of one structure; they are categorically different starting points.
> Any answer to the theory-of-governance question must say either *which* starting point the theory takes or *how* the theory abstracts across them — and both moves are themselves substantive philosophical claims, not neutral mathematical choices.
> The primitive calculus above commits to the thinnest starting point compatible with all three primitives (attribution, binding, becoming) being present; tradition-specific interpretations are made at the level of how each primitive is realized in each tradition's base category.

> **Two questions before the structural question.** (i) *Singular or plural?* Does governance have a single canonical mathematical structure of which every governance tradition is an instance, or is governance an irreducibly plural phenomenon whose "theory" is the *meta-category of governance-traditions* with translation morphisms (and refusals-of-translation) between them?
> The methodological-individualist tradition (game theory, mechanism design, public choice) implicitly assumes singularity.
> The decolonial and pluriversalist traditions (Escobar 2020; Mignolo) assume plurality.
> The question is open.
> (ii) *What is governance's Church-Turing analog?* The thesis that pins the abstract structure to the empirical phenomenon.
> Candidates: the *recognition criterion* (an act is a governance act of $C$ iff some socially-relevant party recognizes it as such), the *performance criterion* (iff it actually transforms the social state of affairs in the way governance acts do), the *genealogical criterion* (iff it has a recoverable derivation from $C$'s constitutive acts), the *binding criterion* (iff it binds members in the way governance acts bind).
> Each candidate is partisan to a different metaphysics.

> **The self-modifying-meta-structure.** Governance is *self-modifying* in a strong sense: the substrate that determines what counts as a governance act is itself one of the things governance acts can revise.
> A constitution can amend the constitution; a council can change how the council convenes; a tiyóšpaye can adjust the kinship structure that makes it a tiyóšpaye.
> The minimum mathematical structure must support this — through stratified levels (Hart-Ostrom-style operational/collective-choice/constitutional, possibly $\omega$-stratified), greatest-fixed-point coalgebra, non-well-founded set theory à la Aczel, or higher-category structure where meta-acts are higher cells — without trivializing into "anything can become anything."
> The primitive calculus addresses this by stratification: see the *meta-stratification* development below.

## What a resolution requires

- **A position on the singularity question.** Before any structural commitment, the theory must declare whether it claims a canonical single structure or an irreducibly plural meta-structure.
  Either choice is substantive.
  The first risks colonial universalism (forcing all traditions into one frame); the second risks losing the ability to say anything general about governance.
- **A specification of the empirical anchor.** What thesis pins the mathematics to the phenomenon?
  Without one, the theory is a free choice of mathematical structure rather than a theory *of* anything.
- **A treatment of self-modification.** The structure must accommodate revisions of the structure-defining apparatus without collapsing — a non-trivial constraint that rules out most static type-theoretic and topos-theoretic accounts that treat the type system as fixed.
- **A position on the metaphysics of the collective.** Does the structure treat the collective as primitive (plural-subject view), as derived from individuals (reductive view), as a node in a relational web that precedes both (Indigenous relational view), or as a contingent product of a constituent act (constituent-power view)?
  Different choices yield different mathematical structures.
- **An account of binding.** What it means for a governance act to *bind* members — and how that differs across traditions (binding by consent, by kinship, by office, by recognition, by force, by ritual).
  The mathematical structure must make binding an internal feature, not an external commentary.

## What is genuinely established

This section collects what is firmly established at the meta-level about governance theory's foundations — about the structure of *the theory-of-governance question itself*, prior to any specific structural commitment.

- **Collective intentionality is non-reducible at least under some technical specifications.** Gilbert's joint-commitment account (1989, *On Social Facts*) and Searle's we-intention account (1990, "Collective intentions and actions"; 1995, *The Construction of Social Reality*) each give technically explicit reasons that the intentional state expressed by "we intend to $\varphi$" cannot be analyzed as a Boolean combination of individual intentions plus common knowledge of those intentions.
  Bratman (1993, "Shared intention"; 2014, *Shared Agency*) offers a partial reductive account that survives many but not all of the Gilbert-Searle objections.
  The dispute is technical and unresolved; the relevant established fact is that *some* form of irreducibility is forced under standard formalizations of intention.
  Any theory of governance must take a position on this — and the position is mathematically consequential, because reductive accounts permit modeling collectives as derived objects in $\mathbf{Set}$-like categories while irreducibility-accounts force at minimum a different base category in which collective-states are primitive.
- **Several partial logics capture fragments of governance.** Each has a complete axiomatization and an established model theory; none has been shown to be the canonical underlying structure of which the others are sub-fragments.
  - *Coalition logic* (Pauly 2001, *Logic for Social Software*): the logic of what coalitions can force.
    Operator $[C]\varphi$ — "coalition $C$ has a joint strategy such that whatever the complement coalition does, $\varphi$ results."
    Sound and complete over playable effectivity functions; decidable.
  - *ATL and Strategy Logic* (Alur-Henzinger-Kupferman 2002, "Alternating-time temporal logic"; Mogavero-Murano-Vardi 2014 on Strategy Logic): coalition operators in branching-time, with explicit strategy variables in SL.
  - *STIT logic* (Belnap-Perloff-Xu 2001, *Facing the Future*; Horty 2001, *Agency and Deontic Logic*): "$a$ sees to it that $\varphi$" over branching-time-with-agents-and-choices.
    Captures agentive seeing-to-it without reducing to causal manipulation.
  - *Dynamic deontic logic* (Meyer 1988, "A different approach to deontic logic"; Sergot-Jones 1996 on count-as): PDL extended with deontic operators on actions, modeling the dynamics of obligations and permissions.
  - *Social choice theory's impossibility results*: Arrow 1951, Gibbard 1973, Satterthwaite 1975, Sen 1970.
    These are theorems about *aggregation procedures* — a narrow technical fragment of governance — not theorems about governance in general; they apply when governance reduces to preference-aggregation, which it generally does not.
- **No unification of these fragments is established.** There is no agreed mathematical structure of which coalition logic, STIT, dynamic deontic logic, and the social choice impossibilities are all sub-fragments.
  There are attempts (game-theoretic semantics for STIT; algebraic coalgebra for normative systems in Cîrstea-Pattinson) but no canonical answer.
- **Self-modifying systems have a coalgebraic-fixed-point treatment, but not specifically for governance.** Aczel's anti-foundation axiom and the coalgebraic treatment of circular phenomena (Rutten 2000; Jacobs 2017, *Introduction to Coalgebra*) supply mathematical machinery for self-referential and self-modifying systems.
  This machinery has been applied to non-well-founded sets, streams, processes, and bisimulation — not, to the corpus's knowledge, to constitutional self-amendment or to councils revising how councils convene.
  Whether the existing machinery suffices or whether governance's self-modification has features (e.g., the meta-modification is itself a *normative* act with binding force on subsequent meta-modifications) that exceed standard coalgebra is open.

- **The singularity-vs-plurality question has at least three coherent positions, not two, and the choice between them is itself substantive.** The naive contrast (one structure for all governance vs. irreducibly many) hides a middle position with its own mathematical articulation.
  - *Strong singularity* (one doctrine, varied parameterizations).
    There is a single mathematical structure — a doctrine in the Lawvere sense, a signature of sorts and operations — and every governance tradition is a model of this doctrine in some category.
    Differences between traditions are differences in the choice of base category and in the interpretation of the operations.
    The methodological-individualist tradition (rational-choice theory, mechanism design, public choice theory: Buchanan, Tullock, Olson, Ostrom under one reading) implicitly assumes this.
    It is also the position required by any naturalistic universalism — biological-cognitive-evolutionary accounts of governance (Boehm 1999, *Hierarchy in the Forest*; Bowles-Gintis 2011, *A Cooperative Species*) presume that governance is a single phenomenon with culturally-varied instantiations.
  - *1-categorical plurality* (many doctrines, each tradition sui generis).
    Each governance tradition has its own structure, its own signature, its own internal logic.
    The "theory of governance" is the *category of governance-traditions* with morphisms between them, where the morphisms are translations and the absences of morphisms are refusals-of-translation.
    Different traditions are not different models of one doctrine; they are different doctrines.
    This is the position most consistent with the decolonial-pluriversalist tradition (Mignolo 2011, *The Darker Side of Western Modernity*; Escobar 2020, *Pluriversal Politics*).
  - *2-categorical plurality* (doctrine-model pairs with translation 1-morphisms and natural transformations).
    Each governance tradition is a pair $(D, M)$ where $D$ is the tradition's doctrine and $M$ is its interpretation; translations are 1-morphisms $(D_1, M_1) \to (D_2, M_2)$ consisting of a doctrine-translation and a model-comparison; natural transformations between translations capture the fact that "the same translation can be performed in multiple incompatible ways."
    This avoids the colonial move of treating one doctrine as the universal frame while still permitting structural comparisons between traditions.
  - The choice between these positions is not a neutral mathematical preference.
    Strong singularity entails that traditions are essentially comparable on a single yardstick — a substantive metaphysical claim.
    1-categorical plurality entails that any cross-tradition comparison is a translation between equally-fundamental frames — also substantive, and one that some traditions actively reject as itself a colonial move.
    2-categorical plurality is mathematically the most general but it has its own commitment: that translation is the right notion of comparison at all, rather than (say) ritual reciprocity, treaty-making, or kinship-recognition as the constitutive cross-tradition relation.
    Each of these reflects a position taken from inside a tradition; no position is from nowhere.

- **Empirical evidence cuts in both directions and supports a "weak singularity, strong plurality" reading.** Some facts argue for substantive plurality at the structural level: translation failures between governance vocabularies are well-documented, persistent under skilled good-faith translation, and structural rather than merely lexical.
  Documented cases:
  - *Te Tiriti o Waitangi / Treaty of Waitangi* (1840): the Maori text guaranteed *te tino rangatiratanga* over lands and *taonga*; the English text claimed cession of *sovereignty*. *Rangatiratanga* is not sovereignty — it is the authority of *rangatira* (chiefs) within a relational kinship structure where land is not alienable property but is the substance of identity and belonging.
    The English/Maori asymmetry is not a translation error; the categories *property*, *sovereignty*, and *cession* have no equivalents in the source structure.
    Generations of legal-philosophical work (Mead 2003, *Tikanga Maori*; Mikaere 2011, *Colonising Myths — Maori Realities*) document the structural untranslatability.
  - *Wolakota* and *Mitakuye Oyasin* in Lakotaean tradition: the ground of governance is *being-in-good-relation* with all relatives (human, more-than-human, ancestral).
    There is no contract-prior-state of unrelated individuals; relation is constitutive and prior to membership.
    Liberal social-contract theory's starting point (atomic individuals who consent to associate) has no analog in this structure.
    The translation problem is structural: there is no concept *individual-prior-to-relation* to consent in the first place.
  - *Ubuntu* in post-apartheid South African jurisprudence (Cornell-Muvangua 2012, *Ubuntu and the Law*): "*umuntu ngumuntu ngabantu*" — "a person is a person through other persons."
    Personhood is constituted by community-relations, not presupposed by them.
    The Constitutional Court has invoked ubuntu as a constitutional principle, and the courts have repeatedly struggled with the fact that Roman-Dutch and English common-law frameworks presuppose a self that ubuntu does not.
  - *Haudenosaunee Great Law of Peace* (Kaianerekowa): governance through matrilineal clans, with the Clan Mothers selecting and recallable-by-recall the male chiefs who sit in council; consensus across the Five (now Six) Nations; treaty-relationships as governance with neighboring polities (the *Two Row Wampum*).
    The structure has no analog in either individualistic-citizen frameworks or in unitary-sovereign frameworks.
    (Borrows 2002, *Recovering Canada*; Tully 1995, *Strange Multiplicity*; Mohawk 2010, *Thinking in Indian*.)
  - *Inuit Qaujimajatuqangit* in Nunavut: knowledge-of-conditions-for-flourishing-on-the-land grounds governance authority; the regulatory frameworks of the Canadian state (which posit governance-of-territory by representative institutions) systematically fail to encode this.
    Nunavut's institutional design (Henderson 2007) attempts a hybrid; the structural mismatch is the subject of an ongoing literature.
  - These cases are not isolated.
    The accumulated evidence of decolonial legal theory, comparative anthropology of governance (Graeber-Wengrow 2021, *The Dawn of Everything*), and Indigenous political philosophy is that substantive structural differences between traditions are real, not artifacts of inadequate translation.

Other facts argue for thin functional universality: every documented governance tradition has *some* mechanism for collective decision, *some* mechanism for handling conflict and breach, *some* mechanism for member-recognition and member-loss, *some* mechanism for revising its own apparatus.
The forms differ radically; the *function-level* commonalities are robust enough to support cross-cultural anthropology of governance at all.

The reading most consistent with both bodies of evidence: *weak singularity at the function level, strong plurality at the structural level.* The mathematical articulation: a minimal universal signature (collective sort, member sort, act sort, conflict-resolution operation, recognition predicate, meta-modification operation) admits radically different models in radically different base categories; the universal-signature claim is *thin* (it commits only to the existence of these operations, not to their internal structure); the structural diversity lives in the choice of base category and the interpretation of the operations.
This is a 2-categorical plurality position with a minimal-signature commitment.

- **Translation-refusal is itself a governance act with binding force, which constrains the meta-category structure.** Indigenous jurists (Borrows 2002; Tully 1995; Christie 2003, "Aboriginal Nationhood and the Inherent Right to Self-Government"; Coulthard 2014, *Red Skin, White Masks*) have argued — and acted on the basis that — refusing to translate certain governance concepts into settler-state vocabulary is constitutive of the source tradition's continued existence.
  The translation IS the dispossession; the refusal IS the governance act.
  This empirical fact constrains the mathematical structure of any meta-category of governance-traditions: morphisms between traditions cannot be simply *possible-or-impossible*; they must be *taken-or-refused*, and the taking-or-refusing is itself a governance act inside one or both traditions.
  The meta-category is therefore *internal* — its 1-morphisms are themselves governed by the very objects (traditions) that the meta-category contains.
  This is a non-trivial constraint that rules out flat externalist articulations of "the category of governance-traditions" and forces some kind of internal-category or fibrational structure where the morphism-data is part of the object-data.

- **The minimal universal signature, if it exists, is too thin to determine a structure — its content is closer to a *parameter space of axes of variation* than to a Lawvere doctrine of sorts and operations.** Three nested attempts at a minimal universal signature, each more honest than the last about what is being smuggled in.

*First attempt (thin signature of sorts and operations).* Sorts: $\mathrm{Polity}$ (a unity-of-action with persistence); $\mathrm{Constituent}$ (something related to a polity such that the polity can act in its name); $\mathrm{Act}$ (a unit of doing attributable to a polity); $\mathrm{Moment}$ (temporal locus).
Operations: $\mathrm{attribute}: \mathrm{Act} \times \mathrm{Polity} \to \mathbf{3}$ (yes/no/contested); $\mathrm{constitutes}: \mathrm{Constituent} \times \mathrm{Polity} \to \mathbf{3}$; $\mathrm{bind}: \mathrm{Act} \times \mathrm{Constituent} \to \mathrm{Constraint}$; $\mathrm{contest}: \mathrm{Constituent} \times \mathrm{Act} \to \mathrm{Act}$ (contestation produces a derivative act); $\mathrm{revise}: \mathrm{Act} \times \mathrm{Apparatus} \to \mathrm{Apparatus}$.
This signature already smuggles: a Polity/Constituent distinction (relational ontologies reject this — the relations ARE the polity, not something a polity has); an Act/State distinction (Lakotaean wolakota, Confucian *li* under one reading, ubuntu under another — governance is a *state-of-being-in-right-relation*, not a sequence of discrete acts); a notion of attribution-with-three-valued-truth (some traditions attribute through standing-in-relation rather than through any act-attribution operation).
Each smuggled commitment is recognizable from inside the kyriarchical-legal-positivist tradition; the smuggling is invisible from inside that tradition and visible from outside it.

*Second attempt (parameter space of axes of variation).* What is universal is not specific operations but the *axes along which traditions vary*.
Six candidate axes survive preliminary scrutiny. - **Persons-and-relations axis.** Are individuals primitive (relations between them derived) or are relations primitive (individuals derived as nodes-in-relation)?
Liberal social-contract theory takes the first; Indigenous relational ontologies (Wahkohtowin, Mitakuye Oyasin, Ubuntu, Confucian *renqing*) take the second. - **Synchronic-diachronic axis.** Is governance a *state-of-affairs* (wolakota — being-in-right-relation; *li* — the harmonious-ordered-state) or a *sequence of acts* (legal positivism: acts of legislation, adjudication, execution)?
The two readings yield categorically different mathematical structures: ongoing-state-with-equilibrium-condition vs. sequence-of-transitions-on-state. - **Constitutive-vs-regulative axis** (after Searle 1969, 1995).
Does the tradition primarily *generate new institutional facts* (constitutive: marriages, treaties, citizenships into existence; Searle's $X$-counts-as-$Y$-in-$C$) or *regulate pre-existing facts* (regulative: traffic laws, property rules)?
Most traditions do both; the *proportion* and the *priority* between them differs. - **Binding-source axis.** What grounds the force of governance acts on members? *Consent* (liberal contract); *kinship and relation* (Lakotaean, many Indigenous, ubuntu); *office* (Weberian rational-legal); *recognition* (Hegelian, post-Kojevean); *force-with-legitimation* (Schmittian, Realist); *ritual* (Confucian *li* under another reading, many Indigenous); *cosmic order* (dharma, *tao-te*, *halakha* under one reading).
These are not all reducible to one another. - **Boundary-source axis.** How is the collective's edge defined? *Territory* (Westphalian state); *descent and clan* (Lakotaean tiyóšpaye, Haudenosaunee Nations); *act-of-membership* (immigration-naturalization regimes; chosen affiliation); *profession of belief* (umma, ecclesia); *participation-in-ritual* (citizen-bodies of classical antiquity); *kinship-in-the-extended-sense* (Mitakuye Oyasin — all that lives is relative). - **Recursion-of-meta-governance axis.** How does the tradition handle revisions of its own apparatus? *Explicit amendment procedures* (constitutional amendment, statutory revision); *informal evolution* (common law's case-by-case accretion); *ceremonial revision* (Wampum-renewal, Sun Dance, Treaty renewals); *denial of the distinction* (many traditions do not separate "governance" from "meta-governance" — every act is potentially constitutive-of-the-apparatus). - The minimal universal *claim* under this approach: every documented governance tradition takes a position on each axis (or, more carefully, every documented tradition has its operative position on each axis recoverable by external analysis — the tradition need not internally thematize the axis).
The choice of *which axes are the universal ones* is itself a substantive theoretical claim; this list of six is the current best-supported synthesis, not a settled answer.

*Third attempt (irreducible core triple).* The thinnest claim that survives the strictest test: governance involves at least the possibility of *something being-done in the name of a multiplicity* such that *the doing has consequences for the multiplicity or its parts*.
The triple $\langle \mathrm{multiplicity}, \mathrm{in\text{-}the\text{-}name\text{-}of}, \mathrm{consequence}\rangle$ is the minimal universal core.
Each term is empty until a tradition fills it; none of the three is independently characterizable without the others.
Mathematically: this is not a signature but a *ternary relation* on a single sort $\mathrm{governance\text{-}stuff}$, and the structure of the relation is what varies across traditions.
The strong-plurality reading is honest at this level: even *which sub-objects of governance-stuff count as multiplicities, which acts count as in-the-name-of, and which downstream effects count as consequences* is tradition-relative.

These three attempts are not competing — they are three articulations of the same insight at three levels of philosophical aggression.
The thin-signature attempt is what a methodological-individualist mathematical theory would propose; the axes-of-variation attempt is what a *comparative* theory of governance would propose; the core-triple attempt is what a strictly-pluralist meta-theory would propose.
The choice between them mirrors the singularity-vs-plurality choice exactly — confirming that the minimal-signature question and the singularity question are not independent but are two presentations of the same underlying commitment.

## Candidate structural framings

Each candidate is named with the genuine reason it is a candidate, not as a parallel transposition of a structure from another theory.
Each has serious open problems.

- **Coalgebra of collective state-transitions.** A governance system as $\gamma: C \to F(C)$ where $C$ is the type of collective-states (including the collective's current self-description and its current rule-set) and $F$ encodes the space of next-states the collective can transition to under its own steering. *Strength*: handles self-modification cleanly (the rule-set is part of $C$, so transitions can revise rules); handles branching; gives a notion of bisimulation that might capture "governance-equivalent" collectives. *Weakness*: too general — every dynamic system is a coalgebra; the specificity of governance has to come from constraints on $F$ that have not been characterized.
- **Sheaves over a site of collectives.** Each collective is an object in a site; the sheaf assigns to each collective the data of its local commitments and member-attitudes; gluing conditions express how local commitments cohere into global collective acts. *Strength*: handles plurality (different collectives, different sheaves) and partiality (no commitment without local support); the topos of sheaves might be the meta-category of governance-traditions. *Weakness*: the sheaf condition — that local data compatible on overlaps glue to global data — is exactly what the disagreements in governance are *about*; assuming it as a structural axiom would beg the question.
- **Multicategory or operad of joint acts.** A collective act as an $n$-ary operation taking the $n$ members' contributions to a single collective output.
  Operad axioms (associativity, unitality, equivariance) constrain how composite joint acts decompose.
  Different traditions = different operads (kyriarchical: highly asymmetric, with offices having distinguished roles; consensus: highly symmetric, with all members equivalent contributors). *Strength*: makes joint commitment explicit as an n-ary primitive rather than reducing it to sequential individual acts. *Weakness*: doesn't capture the temporal/dynamic dimension; doesn't capture self-modification.
- **Higher-category / homotopy-type-theoretic.** Collectives as types; acts as paths; binding as identification; meta-governance as paths between paths.
  The univalence axiom would identify structurally-identical governance frameworks. *Strength*: handles the iterative recursion of meta-governance and the equivalence-of-traditions question cleanly. *Weakness*: speculative — no developed application to governance exists, and the substantive content of "what acts are paths" requires philosophical commitments not yet made.
- **Category of governance-traditions (the negative-answer framing).** Accept that there is no canonical single structure.
  The theory of governance is the *category whose objects are governance-traditions* (each with its own internal structure) and whose morphisms are *translations* — and importantly, *refusals-of-translation*, which encode the structural untranslatabilities (e.g., the impossibility of expressing wolakota purely in kyriarchical legal vocabulary).
  The theory of governance is then a theory of how governance-traditions stand to each other, not a theory of one underlying structure they all share. *Strength*: honest about the actual situation; aligns with pluriversalist and decolonial commitments. *Weakness*: weak general statements; the meta-category itself needs its own structural characterization.

## Why it matters

The 561 polity's founding claim — that it is a Lakotaean tiyóšpaye realized as a flatfile agentic resource system — depends on being able to say what *kind of governance* a tiyóšpaye is, in terms of some abstract structure or in terms of its position within a meta-category of traditions.
If governance has a canonical single structure, 561 has to say which sub-structure it inhabits and which others it relates to.
If governance is irreducibly plural, 561 has to say which tradition it inhabits and how that tradition translates (or refuses translation) into adjacent ones.
Neither answer is available without resolving the question.

More generally: the difference between governance-traditions is usually argued in normative, historical, or ideological terms.
A formal answer to "what is the theory of governance" would let those arguments be replaced (or, more honestly, supplemented) by structural ones — what kinds of acts each tradition makes possible or impossible, what kinds of binding each supports, what self-modifications each permits.

## Status

Partial but with a primary definition derived from primitives and stratified by meta-level.
The theory of governance is the Curry-Howard-Lambek correspondence between: 1.
The *stratified governance primitive calculus* — at each level $n \geq 0$, three primitive judgment-forms (attribution $a \mathbin{::}^n C$; binding $n \cdot m \rhd^n k$; becoming $s \rightsquigarrow_a^n s'$); level-$(n+1)$ becomings act as endofunctors of $\mathbf{Gov}_n$; the **Governance Thesis** enforced as a governance rule.
2.
The *stratified governance type theory* — level-indexed sort-terms; level-shifting term-formers $\iota_n$; $\beta\eta$-reduction.
3.
The *category* $\mathbf{Gov} = \mathrm{colim}_n \mathbf{Gov}_n$ — directed colimit of the stratified syntactic categories.

Standard governance modalities (deontic $O$/$P$/$F$; agentive $[a \mathrm{stit}]$; coalition $[C]$; counts-as $D_a$) are *derived* operators at each level.
Constituent acts and self-amendment are handled by cross-level moves (Prop 12, Prop 13).
Four-valued operativity is the natural settlement-structure of the three primitive judgments.

The CCC-with-deontic-monad-and-modal-endofunctors formulation is the internal-modal-logic *presentation* of each $\mathbf{Gov}_n$.
The multicategory-with-self-action formulation is the attribution-plus-becoming-without-binding *fragment* (cf. Prop 13's self-amendment construction realized via the multicategorial $\mu$).

Refined: external research surfaces direct prior art for three of the eight open seams.
The binding-force primitive is supplied by Jones-Sergot (1996) institutionalized-power / counts-as conditionals.
The stratification of $\mu$ is supplied by Boella-van der Torre's logical architecture of normative systems (counts-as, institutional-constraint, obligation, permission, norm-change components, each as input/output logic).
The procedural-closure structure of $M_G$ is supplied by Makinson-van der Torre input/output logic with AGM-style norm-change operations $\oplus, \ominus, \otimes$.
The relationship between the multicategorial articulation and the topos-theoretic polity articulation (`terms/polity.md`) is conjecturally a Lawvere-Tierney-style adjunction; this is open.

Open: temporal extension beyond operadic composition; an empirical anchor (governance Church-Turing thesis) picking out which objects of $\mathbf{Gov}$ correspond to empirical governance; explicit contestation primitive (distinct from norm-change); $\mathbf{FOUR}$-enrichment for settlement-valued operativity is developed in §FOUR-enrichment via two formulations using standard Belnap-Dunn / Fitting-Ginsberg / Diaconescu machinery; open question: whether reading 1, reading 2, or the joint reading is the canonical commitment; coalgebraic feedback component tailored to governance (general coalgebra apparatus exists; the governance-specific shape of $F$ does not); the conjectural Lawvere-Tierney adjunction with the polity topos; characterization of $\mathbf{Gov}$'s further structure (completeness, cocompleteness, presentability, cartesian-closedness, monoidal structure); whether tradition-specific subcategories ($\mathbf{Gov}_{\mathrm{Lakotaean}}$, $\mathbf{Gov}_{\mathrm{kyriarchical}}$, etc.) are reflective, coreflective, or neither inside $\mathbf{Gov}$.
The lift of specific traditions to objects of $\mathbf{Gov}$ — Lakotaean tiyóšpaye governance being the next downstream question — is open.
