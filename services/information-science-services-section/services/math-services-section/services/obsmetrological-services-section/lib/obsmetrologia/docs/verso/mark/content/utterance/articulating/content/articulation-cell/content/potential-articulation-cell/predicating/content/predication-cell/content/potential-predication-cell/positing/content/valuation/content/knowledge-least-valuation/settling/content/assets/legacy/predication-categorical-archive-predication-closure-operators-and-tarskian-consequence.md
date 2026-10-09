---
type: prose
class: literature-survey
status: draft
surveys-question: what-is-a-theory
---

# Closure operators and Tarskian consequence

A survey of the abstract-consequence tradition — Tarski's closure operators, the lattice of theories, matrix semantics and the Łoś-Suszko Galois connection, Blok-Pigozzi algebraizability, the substructural / residuated extension — read against [predication-theory](../../../objects/predication-theory.md) and the open question [what-is-a-theory](questions/what-is-a-theory.md). The tradition is the closest external match to what a predication theory actually is: a closure operator whose fixed points are the models. The survey is organized to make explicit which constructions transfer to the bilattice-fibered setting and which break.

## The Tarskian setting

Tarski (1930; collected in *Logic, Semantics, Metamathematics*, 1956) defined an **abstract consequence operator** on a set $\mathrm{Fm}$ of formulas as a map $\mathrm{Cn} : \mathcal{P}(\mathrm{Fm}) \to \mathcal{P}(\mathrm{Fm})$ satisfying

- **Extensivity:** $X \subseteq \mathrm{Cn}(X)$
- **Monotonicity:** $X \subseteq Y \implies \mathrm{Cn}(X) \subseteq \mathrm{Cn}(Y)$
- **Idempotence:** $\mathrm{Cn}(\mathrm{Cn}(X)) = \mathrm{Cn}(X)$

These three axioms make $\mathrm{Cn}$ a closure operator on the power-set lattice $(\mathcal{P}(\mathrm{Fm}), \subseteq)$. Two further axioms are standard in the algebraic-logic tradition (Wójcicki 1988 §1.1; Font-Jansana-Pigozzi 2003 §1):

- **Finitarity / compactness:** $\phi \in \mathrm{Cn}(X)$ implies $\phi \in \mathrm{Cn}(X_0)$ for some finite $X_0 \subseteq X$.
- **Structurality / substitution-invariance:** for every substitution $\sigma : \mathrm{Fm} \to \mathrm{Fm}$, $\sigma(\mathrm{Cn}(X)) \subseteq \mathrm{Cn}(\sigma(X))$.

A **theory** of $\mathrm{Cn}$ is a fixed point: a set $T$ with $\mathrm{Cn}(T) = T$. The class of theories of $\mathrm{Cn}$ is denoted $\mathrm{Th}(\mathrm{Cn})$.

The structural content of the Tarskian setting is the assertion that *logical consequence is a closure operator*. Everything else — proof theory, model theory, algebraization — is a way of presenting or analyzing one particular closure operator.

## The lattice of theories

The set $\mathrm{Th}(\mathrm{Cn})$ ordered by inclusion is a **complete lattice** (Tarski 1930; Wójcicki 1988 §1.3). Its meets are intersections; joins are $\mathrm{Cn}$-closures of unions:

$$\bigwedge_i T_i = \bigcap_i T_i, \qquad \bigvee_i T_i = \mathrm{Cn}\Bigl(\bigcup_i T_i\Bigr).$$

The bottom is $\mathrm{Cn}(\emptyset)$, the **set of logical theorems** (formulas derivable from no premises). The top is $\mathrm{Fm}$ itself, the **inconsistent theory** that derives everything.

Dually, the set of consequence operators on a fixed $\mathrm{Fm}$ is itself a complete lattice under the **pointwise order** $\mathrm{Cn}_1 \leq \mathrm{Cn}_2 \iff \forall X.\ \mathrm{Cn}_1(X) \subseteq \mathrm{Cn}_2(X)$. Bigger operator means *more derivations*, hence *fewer* fixed points — the map $\mathrm{Cn} \mapsto \mathrm{Th}(\mathrm{Cn})$ is **antitone**.

This is the first portability check: the corpus's [predication-theory](../../../objects/predication-theory.md) is a closure operator on a fiber functor, and the set of closure operators on a fixed fiber functor is a complete lattice under pointwise order. The lattice structure transfers immediately. The bottom of the lattice is $\mathrm{Cl} = \mathrm{id}$ (the trivial theory; every cell is its own theorem) and the top is the absurd theory $\mathrm{Cl}_p = \top_p$ for every $p$ (every cell goes to the bilattice's $\top_k$). Existing theory-morphism notions are restrictions of this lattice plus action on the predicate-category component.

## Theory morphisms: translations

Tarskian theory morphisms have not converged on a single canonical form; the literature carries at least three traditions.

**Strict translations** (Wójcicki 1988 §1.5; Czelakowski 2001 §0.7). A translation between consequence operators $(\mathrm{Fm}_1, \mathrm{Cn}_1)$ and $(\mathrm{Fm}_2, \mathrm{Cn}_2)$ is a structural map $\tau : \mathrm{Fm}_1 \to \mathrm{Fm}_2$ — i.e., one commuting with substitutions — satisfying the **conservation condition**

$$X \vdash_1 \phi \quad \Longrightarrow \quad \tau(X) \vdash_2 \tau(\phi),$$

equivalently $\tau(\mathrm{Cn}_1(X)) \subseteq \mathrm{Cn}_2(\tau(X))$. This is the abstract analog of an interpretation in the model-theoretic sense.

**Faithful translations.** A translation is *faithful* (or a **conservative translation**) when the reverse implication also holds: $\tau(X) \vdash_2 \tau(\phi) \implies X \vdash_1 \phi$. Faithfulness is the condition that the source logic is exactly recovered from its image — the translation introduces no new derivations on the embedded formulas.

**Equivalence of logics** (Blok-Pigozzi 1989; Font-Jansana-Pigozzi 2003 §3). Two consequence operators are *equivalent* if there are mutually-inverse translations $\tau, \rho$ that compose to the identity *up to interderivability* in each direction. This is weaker than logical isomorphism but stronger than mutual interpretability.

The general pattern is: a theory morphism is a **map on the syntactic carrier** plus **a comparison condition on the consequence operators**. This decomposition matches exactly the candidate "general theory morphism" identified in the [what-is-a-theory](questions/what-is-a-theory.md) question: a pair $(\pi, \alpha)$ where $\pi$ is a predicate-category functor (replacing the substitution-commuting $\tau$) and $\alpha$ is a closure comparison (replacing the conservation condition).

The corpus's [subtheory-inclusion](../../../morphisms/subtheory-inclusion.md) corresponds to the case where $\tau$ is an inclusion of formula-set carriers and $\alpha$ is **equality** $\mathrm{Cn}_1 = \tau^*\mathrm{Cn}_2$. Translated to the Tarskian setting: a sub-logic is given by an embedding $\iota : \mathrm{Fm}_1 \hookrightarrow \mathrm{Fm}_2$ such that $\mathrm{Cn}_1(X) = \mathrm{Cn}_2(X) \cap \mathrm{Fm}_1$ for every $X \subseteq \mathrm{Fm}_1$. This is the standard sub-logic definition in the algebraic-logic literature. The fact that the corpus has chosen this version, and not the weaker $\mathrm{Cn}_1 \leq \tau^*\mathrm{Cn}_2$ (sub-logic with derivations possibly *added* by the embedding), is a deliberate strictness — and exactly the strictness that algebraic logic standardly adopts.

The corpus's [researching](../../../morphisms/researching.md) morphism corresponds to a conservative extension *of model* but not necessarily *of closure*: it requires $v^{T'}_\infty(\pi p) \geq_k v^T_\infty(p)$, which is the bilattice-fibered analog of "every old theorem is still a theorem," but it does not require $\pi^*\mathrm{Cn}_2 = \mathrm{Cn}_1$. So researching is the bilattice analog of a **non-conservative extension** that nonetheless preserves the model — a class of morphism that exists in the algebraic-logic tradition as "extensions by definitions" and "definitional expansions" (Wójcicki 1988 §3.3). The asymmetry the question file noted between subtheory-inclusion (strict on closure) and researching (silent on closure) is therefore not anomalous — it has a clean analog in algebraic logic, where sub-logic relations are typically strict on the consequence operator and extension relations are typically strict on the model but lax on the operator.

## Matrix semantics and the Łoś-Suszko Galois

The model-theoretic side of Tarskian consequence is **matrix semantics** (Łoś-Suszko 1958; Wójcicki 1988 ch. 2). A **logical matrix** is a pair $\mathfrak{M} = (\mathbf{A}, D)$ of an algebra $\mathbf{A}$ of the formula language's signature and a designated subset $D \subseteq A$. A formula $\phi$ is *true* in $\mathfrak{M}$ under valuation $h : \mathrm{Fm} \to A$ if $h(\phi) \in D$. The **matrix consequence** of a class $\mathcal{K}$ of matrices is

$$X \vdash_\mathcal{K} \phi \quad \iff \quad \forall \mathfrak{M} \in \mathcal{K},\ \forall h.\ \bigl(h(X) \subseteq D \implies h(\phi) \in D\bigr).$$

This $\vdash_\mathcal{K}$ is always a structural consequence operator. The **Łoś-Suszko theorem** (Łoś-Suszko 1958) states that every structural consequence operator on $\mathrm{Fm}$ is $\vdash_\mathcal{K}$ for some class $\mathcal{K}$ of matrices: every Tarskian logic has matrix semantics. The construction is canonical (the **Lindenbaum matrices**: matrices whose algebra is $\mathrm{Fm}$ itself and whose designated set is a theory).

The matrix-to-operator and operator-to-matrix maps form an antitone **Galois connection**:

$$\mathrm{Cn}_{(-)} : \{\text{matrix classes}\} \rightleftarrows \{\text{structural Cn on } \mathrm{Fm}\} : \mathrm{Mod}_{(-)}$$

with closed elements on each side characterized: the closed matrix classes are those generated by direct products, submatrices, and homomorphic images preserving designation (an analog of HSP for matrix classes); the closed operators are exactly the *structural* consequence operators.

The Łoś-Suszko Galois is the prototype of the model-theory ↔ theory adjunction. **This is the part of the Tarskian tradition whose fibered analog is most important for the corpus.** The bilattice-fibered analog would be:

- **Matrix:** a "designated" sub-presheaf $D \subseteq F$ assigning to each predicate $p$ a designated subset $D_p \subseteq A_p$ — or, more naturally for bilattices, a designated *upper set* $D_p$ closed under bilattice operations.
- **Matrix consequence:** the closure operator $\mathrm{Cl}_\mathcal{K}$ whose fixed points are exactly the cells that are forced into $D_p$ by every $\mathcal{K}$-matrix and valuation.
- **The Galois:** a connection between classes of designated sub-presheaves and closure operators on $F$.

The literature (Czelakowski 2001 ch. 1; Font-Jansana 2009 §2.4) handles designated sets in $n$-valued and lattice-valued matrices uniformly, and the bilattice case is in scope of that framework, but the fibered-presheaf generalization is not in the literature. This is one of the two main entry points for the predication-categorical Mod-Th adjunction.

## Algebraizability (Blok-Pigozzi)

Blok and Pigozzi (1989, *Algebraizable Logics*, Memoirs AMS 396) gave a tight characterization of when a Tarskian logic is *the* logic of some algebraic structure. A logic $\vdash$ on $\mathrm{Fm}$ is **algebraizable** if there exist:

- a set $\Delta(x,y)$ of formulas in two variables (the "equivalence formulas"), and
- a set $E(x) = \{(\delta_i(x), \epsilon_i(x))\}$ of equations in one variable (the "defining equations"),

together with a quasivariety $\mathcal{K}$ of algebras, such that the following two translations are mutually inverse up to interderivability in the equational consequence of $\mathcal{K}$:

$$\tau : \phi \mapsto E(\phi), \qquad \rho : (s \approx t) \mapsto \Delta(s,t).$$

Algebraizability says that *the consequence operator $\vdash$ is, up to translation, the equational consequence operator of $\mathcal{K}$*. Classical propositional logic is algebraizable with Boolean algebras; intuitionistic logic with Heyting algebras; the Łukasiewicz logics with MV-algebras (Cignoli-D'Ottaviano-Mundici 2000); the substructural logics with residuated lattices (Galatos-Jipsen-Kowalski-Ono 2007 §2).

The relevance to predication theories is twofold. **First**, algebraizability is the criterion under which a logic *is* an algebraic structure — and predication theories already live entirely on the algebraic side, since fibers are bilattices. So predication-theory consequence is "algebraic" by construction: there is no separate syntactic layer to algebraize against. The bilattice algebras *are* the formulas, in a sense. **Second**, the Blok-Pigozzi translations $\tau, \rho$ are *theory morphisms* in the strong (equivalence-of-logics) sense, and they are exactly the structure that allows transfer of theorems between two logics. The bilattice-fibered analog — when is one predication theory equivalent in this strong sense to another? — is exactly what is needed for theory-equivalence in $\mathbf{Th}$ (sub-question 7 of the question file).

## Substructural and residuated

Galatos, Jipsen, Kowalski, and Ono (2007, *Residuated Lattices: An Algebraic Glimpse at Substructural Logics*) is the canonical reference for consequence operators valued in **residuated lattices** — the structure underlying the corpus's $\mathbf{L}$. Substructural logics drop one or more of weakening, contraction, exchange, and associativity from the structural rules of sequent calculus; the resulting consequence operators have proof theory in *residuated frames* and algebraic semantics in residuated lattices and pointed residuated lattices.

The book's chapter 2 develops the equivalence between substructural sequent calculi and equational consequence in residuated lattices, in the Blok-Pigozzi sense. Chapter 3 develops the structure theory of residuated lattices: the *spectrum* (prime filter lattice), the **subreduct** ordering on classes, and the lattice of subvarieties.

What is directly relevant: residuated lattices admit a natural lattice of **subreducts** and a corresponding lattice of **subvarieties**. A subreduct relation between residuated lattices $\mathbf{L}_1 \subseteq \mathbf{L}_2$ induces an embedding of one logic of $\mathbf{L}_1$-valued matrices into the logic of $\mathbf{L}_2$-valued matrices. The corpus's [predication-theory](../../../objects/predication-theory.md) holds $\mathbf{L}$ fixed and varies $\mathcal{C}, \mathrm{Cl}$. The natural fibered generalization — allowing $\mathbf{L}$ to vary via residuated-lattice morphisms — is the residuated-lattice analog of change-of-signature in algebraic logic, and the existing [predication-settling-base-morphism](../../../morphisms/predication-settling-base-morphism.md) carries exactly the component $\ell : \mathbf{L}_S \to \mathbf{L}_T$ that does this. The lifting from "theories share $\mathbf{L}$" to "theories live over an arbitrary residuated-lattice morphism" is a fibered structure over the category of integral commutative residuated lattices — and Galatos-Jipsen-Kowalski-Ono ch. 3 is the reference for what that base category looks like.

## What transfers

Specific portability claims, with sketches of the lifting argument.

**(T1) The lattice of theories at fixed base.** Tarskian: $\mathrm{Th}(\mathrm{Cn})$ is a complete lattice. Predication-categorical: for fixed $(\mathbf{L}, \mathcal{C}, E)$, the set of closure operators on the fiber functor $F$ is a complete lattice under pointwise order. **Lift:** the bilattice fiber $A_p$ is a complete lattice in $\leq_k$ (corpus's definition), so the set of closure operators on $A_p$ is a complete lattice (standard); the pointwise lattice of closures on $F$ is the corresponding pointwise product, again a complete lattice. The antitonicity of $\mathrm{Cl} \mapsto \mathrm{Fix}(\mathrm{Cl})$ also transfers.

**(T2) Subtheory-inclusion is sub-logic.** Tarskian: $\iota : \mathrm{Fm}_1 \hookrightarrow \mathrm{Fm}_2$ with $\mathrm{Cn}_1(X) = \mathrm{Cn}_2(X) \cap \mathrm{Fm}_1$ defines a sub-logic. Predication-categorical: $\pi : \mathcal{C}^S \hookrightarrow \mathcal{C}^T$ with $\mathrm{Cl}^S = \pi^*\mathrm{Cl}^T$ defines a subtheory (corpus). **Lift:** the corpus already proves [closure-restriction-is-closure](../../../theorems/closure-restriction-is-closure.md), which is the bilattice-fibered analog of "the restriction of a closure operator along an inclusion is again a closure operator." The structural axioms (extensivity, monotonicity, idempotence) lift fiber-wise. The bilattice fibers play no obstruction.

**(T3) Theory morphism = predicate-category functor + closure comparison.** Tarskian: theory morphism = structural $\tau : \mathrm{Fm}_1 \to \mathrm{Fm}_2$ + conservation condition. Predication-categorical (proposed): theory morphism = predicate-category functor $\pi : \mathcal{C}^S \to \mathcal{C}^T$ + closure comparison $\alpha : \mathrm{Cl}^S \to \pi^*\mathrm{Cl}^T$ (or $\geq$, with the inequality direction to be determined). **Lift:** structurality on the Tarskian side becomes naturality of $\pi$ as a functor of predicate categories; the conservation condition becomes a 2-cell between closures. The conservation direction $\tau(\mathrm{Cn}_1(X)) \subseteq \mathrm{Cn}_2(\tau(X))$ becomes $\alpha_p : \mathrm{Cl}^S_p(v) \leq_k \pi^*\mathrm{Cl}^T_p(v) = \mathrm{Cl}^T_{\pi p}(v)$ for every cell $v$. This is one inequality direction; the other (faithfulness / conservativity) is the equality case.

**(T4) Mod-Th Galois at fixed base.** Tarskian: $\mathrm{Mod} \dashv \mathrm{Th}$ between matrix classes and structural consequence operators. Predication-categorical (proposed): an analogous Galois between *designated-cell families* on $F$ and closure operators on $F$. **Lift:** the Knaster-Tarski machinery the corpus already uses to construct fixed points gives one direction (closure $\to$ fixed-point cells). The other direction (designated-cell family $\to$ closure) is the assignment $D \mapsto \mathrm{Cl}_D$ where $\mathrm{Cl}_D(v)$ is the least cell above $v$ in every fiber lying in $D$. Closed elements on each side need characterization; this is the entry point to a *bilattice-fibered Łoś-Suszko theorem* and is the most substantial transfer item.

## What does not transfer cleanly

Equally important: the obstructions to direct lift.

**(N1) Power-set carriers are replaced by bilattice carriers.** Tarski's $\mathcal{P}(\mathrm{Fm})$ is a Boolean lattice; closures on $\mathcal{P}(\mathrm{Fm})$ are completely determined by their action on singletons (since $\mathrm{Cn}(\{phi_i\}_i) = \bigcup_i \mathrm{Cn}(\{\phi_i\})$ when $\mathrm{Cn}$ is finitary). In bilattice fibers, joins are bilattice joins (not unions), so closures are not determined by action on singletons — the *join-distribution* property of Tarskian closures has no analog. Consequence: many results from the algebraic-logic tradition that exploit finitarity-and-additivity (e.g., the *compactness-implies-completeness* arguments of Wójcicki 1988 ch. 3) do not transfer; their bilattice analogs require Scott-continuity or stronger hypotheses, which the corpus already names as [scott-continuous-closure](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/closure-operator/content/scott-continuous-closure/scott-continuous-closure.md).

**(N2) Substitution is replaced by predicate-category functoriality.** In Tarski, substitution acts on formulas via a free monoid structure on $\mathrm{Fm}$. The "structurality" axiom — that substitutions commute past $\mathrm{Cn}$ — is the algebraic content of "logical consequence does not depend on which variables you use." In the predication-categorical setting, the analog is functoriality of $\mathrm{Cl}$ along predicate-category morphisms: a closure operator is a *natural* family of closures $\{\mathrm{Cl}_p\}_{p \in \mathcal{C}}$ with respect to predicate-category morphisms $f : p \to q$. This is *stronger* than Tarskian structurality (which is only invariance under endomorphisms of the formula algebra). The predication-categorical version requires the corpus's `predicate-category-naturality` concept and is the place where the fibered structure does real work.

**(N3) The truth/knowledge bilattice axis is doubled.** Tarski's $\mathrm{Cn}$ is monotone in one order, the inclusion order $\subseteq$ on $\mathcal{P}(\mathrm{Fm})$. The bilattice fibers have two orders ($\leq_t$ and $\leq_k$) with the corpus's closure operators monotone in $\leq_k$ (the knowledge order). This means: the predication-categorical Mod-Th Galois lives along the *knowledge* axis, not the truth axis. The corresponding truth-axis story is the corpus's [truth-order-closure](../../truth-order-closure/truth-order-closure.md) — a different and dual construction. Tarskian consequence has no truth/knowledge distinction; the predication-categorical Mod-Th adjunction must carry both axes and explain how they interact.

**(N4) Finitarity is non-trivial.** A bilattice-fibered closure $\mathrm{Cl}$ is "finitary" only in the sense of being Scott-continuous; the corpus already separates [scott-continuous-closure](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/closure-operator/content/scott-continuous-closure/scott-continuous-closure.md) from [non-scott-continuous-firing-ordinal](../../settling-continuity/content/non-scott-continuous-firing-ordinal/non-scott-continuous-firing-ordinal.md) and develops a four-regime classification. Tarski's compactness theorem (finitary $\implies$ standard completeness arguments) does not transfer; its bilattice-fibered analog is the corpus's regime-stratified machinery.

## Concrete next steps

From this survey, the following claims are now well-posed and ready for `prose/learning/claims/`:

**(C1)** For fixed $(\mathbf{L}, \mathcal{C}, E)$, the set of closure operators on the predication fiber functor $F$ forms a complete lattice under pointwise order, with bottom $\mathrm{Cl} = \mathrm{id}$ and top $\mathrm{Cl} = \top$. The map $\mathrm{Cl} \mapsto \{\text{fixed-point cells of } \mathrm{Cl}\}$ is antitone.

**(C2)** The general theory morphism $T \to T'$ is a pair $(\pi, \alpha)$ where $\pi$ is a predicate-category functor preserving generator classes and $\alpha : \mathrm{Cl}^T \to \pi^*\mathrm{Cl}^{T'}$ is a pointwise inequality in $\leq_k$. [Subtheory-inclusion](../../../morphisms/subtheory-inclusion.md) is the case $\pi$ embedding, $\alpha$ equality. [Researching](../../../morphisms/researching.md) is the case $\pi$ embedding (cross-base), $\alpha$ silent on closure but with strict-advance on the settled state.

**(C3)** *(Bilattice-fibered Łoś-Suszko, conjectural)* There is an antitone Galois connection between (i) closure operators on $F$ and (ii) families $\{D_p \subseteq A_p\}_p$ of designated cells natural in $\mathcal{C}$, given by $\mathrm{Cl} \mapsto \mathrm{Fix}(\mathrm{Cl})$ and $D \mapsto$ (least closure with $\mathrm{Cl}_p(v) \in D_p$ for $v \in D_p$). The closed elements on the operator side are the corpus's "saturated" closures; the closed elements on the designation side are those that are also closure-monotone.

**(C4)** *(Axiomatic-extension morphism, missing structure)* The unnamed dual to [subtheory-inclusion](../../../morphisms/subtheory-inclusion.md) along the closure axis: a theory morphism $T \to T'$ with $\mathcal{C}^T = \mathcal{C}^{T'}$ and $\mathrm{Cl}^{T'} \geq \mathrm{Cl}^T$ pointwise. The settled state of $T'$ is $\leq_k$-above the settled state of $T$ (more derivations means $\leq_k$-larger fixed point). This is the bilattice analog of "adding axioms."

The first three are immediately checkable against the existing corpus; (C4) requires writing a new morphism file and a corresponding closure-extension theorem. Suggested order: prove (C1) first (the lattice claim is direct and unblocks the rest); state and prove the inequality direction of (C2) with subtheory-inclusion as the equality special case; then attempt (C3) and (C4) in parallel.

## References

- Arieli, O.; Avron, A. (1996). "Reasoning with logical bilattices." *Journal of Logic, Language and Information* 5: 25–63.
- Blok, W. J.; Pigozzi, D. (1989). *Algebraizable Logics.* Memoirs of the American Mathematical Society 396.
- Cignoli, R.; D'Ottaviano, I.; Mundici, D. (2000). *Algebraic Foundations of Many-Valued Reasoning.* Kluwer.
- Czelakowski, J. (2001). *Protoalgebraic Logics.* Trends in Logic 10. Kluwer.
- Font, J. M.; Jansana, R. (2009). *A General Algebraic Semantics for Sentential Logics.* 2nd ed. Lecture Notes in Logic 7. ASL.
- Font, J. M.; Jansana, R.; Pigozzi, D. (2003). "A survey of abstract algebraic logic." *Studia Logica* 74: 13–97.
- Galatos, N.; Jipsen, P.; Kowalski, T.; Ono, H. (2007). *Residuated Lattices: An Algebraic Glimpse at Substructural Logics.* Studies in Logic and the Foundations of Mathematics 151. Elsevier.
- Łoś, J.; Suszko, R. (1958). "Remarks on sentential logics." *Indagationes Mathematicae* 20: 177–183.
- Tarski, A. (1930). "Fundamentale Begriffe der Methodologie der deduktiven Wissenschaften I." *Monatshefte für Mathematik und Physik* 37: 361–404.
- Tarski, A. (1956). *Logic, Semantics, Metamathematics.* (Trans. Woodger; ed. Corcoran, 2nd ed. 1983.) Hackett.
- Wójcicki, R. (1988). *Theory of Logical Calculi: Basic Theory of Consequence Operations.* Synthese Library 199. Kluwer.
