---
title: Research Memo
description: "To: Contracting Party From: Professor of Non-Classical Logic Date: 14 June 2026 Re: “Paraconsistent, transfinitely-valued linear logic” as a synthesis of established traditions"
---
# Research Memo

**To:** Contracting Party  
**From:** Professor of Non-Classical Logic  
**Date:** 14 June 2026  
**Re:** “Paraconsistent, transfinitely-valued linear logic” as a synthesis of established traditions

## Executive Finding

A logic described as **paraconsistent, transfinitely-valued linear logic** is not, as such, a single canonical system in the literature. It is, however, a coherent synthesis of three well-established lines of work:

1. **Girardian linear logic:** formulas are treated as resources, not freely duplicable or discardable assumptions.
2. **Paraconsistent logic:** contradictions may be present without entailing arbitrary conclusions.
3. **Many-valued, lattice-valued, and transfinite-valued semantics:** truth values may form finite, infinite, lattice-ordered, or ordinal-indexed structures rather than the Boolean pair `{true, false}`.

A plausible synthesis would interpret a formula not merely as true or false, but as carrying **positive and negative support**, possibly at **ordinal or transfinite grades**, while proof rules remain **resource-sensitive**. Contradiction would then be a held semantic value, not a proof-theoretic catastrophe.

---

## I. Girard’s Linear Logic: Formulae as Resources

Jean-Yves Girard’s linear logic was introduced in “Linear Logic” (1987). Its basic innovation is not simply a new truth-functional connective, but a new treatment of the **structural rules** governing assumptions. In classical and intuitionistic sequent calculi, assumptions may typically be weakened, contracted, and reused. Linear logic restricts this: an occurrence of a formula is a resource that must be accounted for.

The crucial contrast is:

- **Weakening:** from a proof using context `Γ`, infer a proof using `Γ, A`. This treats `A` as discardable.
- **Contraction:** from a proof using `Γ, A, A`, infer a proof using `Γ, A`. This treats `A` as duplicable.
- **Linear discipline:** unrestricted weakening and contraction are not generally valid.

Thus a linear implication `A ⊸ B` is not merely “if A then B”; it is closer to a transformation that consumes one occurrence of `A` to produce `B`. Similarly, `A ⊗ B` means that both resources are available jointly, whereas additive connectives such as `&` and `⊕` represent context-sharing or choice-like behavior. The exponentials `!A` and `?A` mark formulas whose use is no longer strictly linear: `!A` reintroduces controlled duplication and disposal.

This is why linear logic is often described as a logic of **resources**, **processes**, or **state change**. It refines the classical notion of stable truth by distinguishing between propositions that may be used once, propositions that may be reused, and propositions that may be discarded. Girard’s later expositions, including “Linear Logic: Its Syntax and Semantics,” make explicit the significance of the multiplicative/additive/exponential decomposition.

For the proposed synthesis, the essential point is this: a contradiction should not be treated merely as the set `{A, ¬A}` inside an unrestricted structural context. In a linear setting, `A` and its negation, dual, or contrary are **resource occurrences**. They need not license arbitrary reuse, copying, or disposal. This resource discipline already helps block many classical routes to triviality.

---

## II. Paraconsistent Traditions: Contradiction Without Explosion

A consequence relation is **explosive** when `{A, ¬A} ⊢ B` holds for arbitrary `B`. Paraconsistent logics reject explosion. They allow inconsistent information to be inferentially meaningful without collapsing into triviality.

### II.a. Priest’s LP

Graham Priest’s **Logic of Paradox** (LP), introduced in “The Logic of Paradox” (1979), is a central truth-glut semantics. LP is closely related to Kleene’s three-valued matrix, but with a paraconsistent choice of designated values.

The values may be described as:

- `T`: true only,
- `F`: false only,
- `B`: both true and false.

Both `T` and `B` are designated. Therefore, a sentence may count as true even when its negation also counts as true. Explosion fails because from `A` and `¬A`, both designated by assigning `A = B`, it does not follow that an arbitrary unrelated `C` is designated.

LP therefore models contradiction as a **semantic value** rather than as a proof-theoretic disaster. Its cost is that some classically valid patterns, such as unrestricted disjunctive syllogism or certain conditionals, must be handled carefully or rejected.

### II.b. Belnap–Dunn Four-Valued Logic and FDE

Belnap and Dunn developed a four-valued framework now often associated with **First-Degree Entailment** (FDE). The values can be represented as subsets of `{t, f}`:

- `∅`: neither true nor false,
- `{t}`: true only,
- `{f}`: false only,
- `{t, f}`: both true and false.

Belnap’s motivation was partly computational: a database or question-answering system may contain incomplete or inconsistent information. Such a system should not infer arbitrary conclusions merely because its information state is imperfect.

FDE is both paraconsistent and paracomplete. It tolerates **gluts**—sentences both true and false—and **gaps**—sentences neither true nor false. The Belnap–Dunn semantics is therefore especially useful for a proposed “contradiction-as-held-value” logic: contradiction is not erased; it is recorded as a determinate informational state.

### II.c. Ginsberg and Fitting Bilattices

Ginsberg generalized this insight through **bilattices**, later developed extensively by Fitting. A bilattice has two relevant orderings:

1. A **truth order**, ordering values by degree of truth.
2. A **knowledge or information order**, ordering values by amount of information.

Belnap’s four values are the simplest canonical case. In the knowledge order, both `∅` and `{t, f}` differ from `{t}` and `{f}` because they encode less or more information, respectively. In the truth order, `{t}` is more true than `{f}`, while `{t, f}` and `∅` occupy intermediate or incomparable positions depending on the presentation.

Bilattices are important for the proposed synthesis because they already separate two questions that classical logic conflates:

- How true is the sentence?
- How much information do we have about the sentence?

A transfinite paraconsistent logic can use precisely this separation, replacing the four Belnap values with a richer ordinal-indexed lattice of positive and negative support.

### II.d. da Costa’s Systems

Newton da Costa’s calculi `C_n`, beginning with “On the Theory of Inconsistent Formal Systems” (1974), offer a different paraconsistent strategy. Rather than beginning with truth-value gluts, da Costa develops formal systems in which contradiction does not generally imply arbitraryity, but where classical reasoning may be recovered for formulas that satisfy suitable consistency conditions.

The da Costa tradition is especially important because it introduces an object-language concern with **consistency itself**. Later systems of **Logics of Formal Inconsistency** make this explicit by adding operators expressing that a formula is consistent or inconsistent. This permits controlled principles of the form: if `A` is well-behaved or consistent, then classical reasoning involving `A` is locally restored.

For the proposed synthesis, this suggests that explosion may be made available only as a **controlled resource**, not as a global structural principle. One might require a linear consistency resource, such as `Cons(A)`, before permitting classical inferences from `A` and `¬A`.

---

## III. Many-Valued, Infinite-Valued, Lattice-Valued, and Transfinite-Valued Logics

### III.a. Łukasiewicz and Early Many-Valued Logic

Łukasiewicz introduced three-valued logic in 1920 and later developed infinite-valued systems. His original motivation included the logical treatment of future contingents: propositions need not already be determinately true or false. In the three-valued system, the third value is often interpreted as possible, indeterminate, or neither true nor false. Later Łukasiewicz logics use finite or infinite chains of truth degrees.

Post’s 1921 work generalized many-valued truth functions and proved results about functional completeness. Together, Łukasiewicz and Post established many-valued logic as a serious alternative to bivalent semantics.

### III.b. Infinite-Valued and Chain-Valued Logics

Infinite-valued logics replace a finite truth-value matrix with an infinite chain, often `[0,1]`, where `0` represents complete falsity and `1` complete truth. In Łukasiewicz logic, the conditional and negation are typically interpreted by operations such as:

- `¬x = 1 − x`,
- `x → y = min(1, 1 − x + y)`.

Dummett’s Gödel logic, with a denumerable matrix, and later fuzzy logics treat truth values as ordered degrees. In such systems, validity is usually defined by preservation of the designated top value, commonly `1`.

### III.c. Lattice-Valued and Fuzzy Logics

Zadeh’s theory of fuzzy sets and Goguen’s `L`-fuzzy sets helped extend the idea from linearly ordered chains to more general lattices. Takeuti and Titani later developed intuitionistic fuzzy logic and fuzzy set theory in a proof-theoretic and model-theoretic direction.

The key generalization is this: truth values need not be linearly ordered real numbers. They may form a lattice, complete lattice, residuated lattice, Heyting algebra, MV-algebra, BL-algebra, or more general algebraic structure. This allows semantics to track multiple dimensions, including truth, falsity, information, reliability, source, cost, or temporal stage.

### III.d. Transfinite-Valued Logics

“Transfinite-valued” logics go beyond finite or real-valued degrees by using ordinal-indexed or otherwise transfinite structures. In logic programming, Rondogiannis and Wadge developed an infinite-valued semantics for negation-as-failure in which truth and falsity values are indexed by countable ordinals. Informally, there are values such as:

- `T_0, T_1, T_2, ...`,
- `F_0, F_1, F_2, ...`,
- and a central indeterminate value.

The ordinal index can measure the stage or depth at which a truth or falsity assignment is obtained. This is especially useful for recursive definitions, negation-as-failure, and stratified or revisionary semantics.

A transfinite truth-value ordering is therefore not an exotic addition to non-classical logic; it extends a recognized many-valued strategy. The central design question is whether the transfinite order is a simple chain, a lattice, a bilattice, or a resource-sensitive algebra such as a quantale.

---

## IV. A Plausible Synthesis: Paraconsistent, Transfinitely-Valued Linear Logic

A coherent synthesis would combine the three traditions as follows.

### IV.a. Semantic Values

Let truth values be pairs of positive and negative support drawn from a complete ordinal-indexed lattice `L`:

`v(A) = (p_A, n_A)`

where:

- `p_A` is the degree, rank, or ordinal stage of support for `A`,
- `n_A` is the degree, rank, or ordinal stage of support against `A`,
- both coordinates may be nonzero.

Then:

- `(0, 0)` represents neither true nor false,
- `(α, 0)` represents true to degree or stage `α`,
- `(0, β)` represents false to degree or stage `β`,
- `(α, β)` represents both true and false, with possibly different strengths.

Belnap’s four-valued semantics is recovered when `L = {0,1}`. LP is recovered when the designated values are those with positive support. More refined paraconsistent systems arise when the positive and negative coordinates range over ordinals, chains, or complete lattices.

### IV.b. Two Orders

The system should distinguish at least two orderings:

1. **Truth order:** compares values by increasing positive support and decreasing negative support.
2. **Information order:** compares values by increasing both positive and negative information.

This is the bilattice insight. A contradiction is not “nothing”; it is highly informative in the information order, even if unstable or nonclassical in the truth order.

### IV.c. Linear Proof Theory

The proof theory should be linear or substructural:

- No unrestricted contraction.
- No unrestricted weakening.
- Formula occurrences are resources.
- Exponentials mark reusable or persistent assumptions.
- Contradictory resources do not automatically license arbitrary conclusions.

A sequent might therefore track not only which formulas are present, but also what value, grade, or resource annotation each occurrence bears. The multiplicative connectives would combine resources, while additives would represent controlled alternatives or shared informational contexts.

The key point is that `A` and `¬A` may both be present, but they are still resources. They cannot simply be copied, discarded, or transformed into any `B` unless the calculus contains an explicit rule or resource permitting that inference.

### IV.d. Controlled Explosion

A da Costa-style consistency operator can be adapted linearly. For instance, explosion might require not merely `A` and `¬A`, but also a resource asserting that `A` is classically well-behaved:

`A, ¬A, Cons(A) ⊢ B`

If `Cons(A)` is absent, contradiction is recorded without triviality. If `Cons(A)` is present and reusable, classical reasoning is locally restored. If `Cons(A)` is linear, even the permission to reason classically is a consumable resource.

### IV.e. Algebraic Semantics

A natural algebraic semantics would use a complete bilattice or residuated bilattice equipped with:

- a monoidal product interpreting tensor `⊗`,
- a residual interpreting linear implication `⊸`,
- lattice operations interpreting additive conjunction and disjunction,
- an involution or negation operation swapping positive and negative support,
- exponentials interpreted by a comonadic or closure operation selecting reusable resources.

Categorically, this resembles interpreting linear logic in a resource-sensitive monoidal setting, but enriching the truth values with paraconsistent bilattice structure and transfinite grades.

### IV.f. Research Risks

The synthesis is plausible but not automatic. Several choices must be made carefully:

1. **Negation:** linear negation, paraconsistent negation, and falsity-support negation should not be conflated without proof.
2. **Designated values:** one must specify whether designatedness means positive support, top positive support, or positive support exceeding negative support.
3. **Cut elimination:** the proof system must preserve normalization or cut elimination if it is to count as a robust linear logic.
4. **Explosion control:** paraconsistency will collapse unless structural rules, consistency principles, and exponentials are restricted.
5. **Transfinite operations:** ordinal-indexed joins, meets, residuals, and limits must be well-defined.

---

## V. Conclusion

A paraconsistent, transfinitely-valued linear logic is best understood as a **resource-sensitive bilattice logic with ordinal-indexed truth and falsity support**.

From **Girard**, it takes the principle that assumptions are resources and that duplication/disposal require explicit control. From **Priest, Belnap, Dunn, Ginsberg, Fitting, and da Costa**, it takes the principle that contradiction need not imply triviality and may be represented semantically or controlled syntactically. From **Łukasiewicz, Post, Dummett, Zadeh, Goguen, Takeuti–Titani, and later infinite-valued semantics**, it takes the principle that truth values may form rich ordered structures, including infinite and transfinite ones.

The most plausible formal core is:

- values: ordinal-indexed pairs of positive and negative support;
- order: bilattice ordering by truth and information;
- proof theory: linear sequents without unrestricted weakening or contraction;
- exponentials: controlled reuse of stable assumptions;
- consistency: optional da Costa-style resource restoring local classicality;
- semantics: complete residuated bilattice, quantale, or enriched phase semantics.

Such a system would not treat contradiction as an error to be erased. It would treat contradiction as a **resource-bearing informational state**, possibly graded through a transfinite hierarchy, and reason with it without permitting unrestricted collapse.

---

# Bibliography

Anderson, Alan Ross, and Nuel D. Belnap Jr. *Entailment: The Logic of Relevance and Necessity, Volume I*. Princeton: Princeton University Press, 1975.

Belnap, Nuel D. Jr. “A Useful Four-Valued Logic.” In J. Michael Dunn and George Epstein, eds., *Modern Uses of Multiple-Valued Logic*, 8–37. Dordrecht: D. Reidel, 1977.

Belnap, Nuel D. Jr. “How a Computer Should Think.” In Gilbert Ryle, ed., *Contemporary Aspects of Philosophy*, 30–56. Stocksfield: Oriel Press, 1977.

Chang, Chen Chung. “Algebraic Analysis of Many Valued Logics.” *Transactions of the American Mathematical Society* 88 (1958): 467–490.

da Costa, Newton C. A. “On the Theory of Inconsistent Formal Systems.” *Notre Dame Journal of Formal Logic* 15, no. 4 (1974): 497–510.

da Costa, Newton C. A., and Edson H. Alves. “A Semantical Analysis of the Calculi C_n.” *Notre Dame Journal of Formal Logic* 18, no. 4 (1977): 621–630.

Dummett, Michael. “A Propositional Calculus with Denumerable Matrix.” *Journal of Symbolic Logic* 24, no. 2 (1959): 97–106.

Dunn, J. Michael. “Intuitive Semantics for First-Degree Entailments and ‘Coupled Trees.’” *Philosophical Studies* 29, no. 3 (1976): 149–168.

Fitting, Melvin. “Bilattices and the Theory of Truth.” *Journal of Philosophical Logic* 18, no. 3 (1989): 225–256.

Fitting, Melvin. “Bilattices and the Semantics of Logic Programming.” *Journal of Logic Programming* 11, no. 2 (1991): 91–116.

Ginsberg, Matthew L. “Multi-Valued Logics: A Uniform Approach to Inference in Artificial Intelligence.” *Computational Intelligence* 4, no. 3 (1988): 256–316.

Girard, Jean-Yves. “Linear Logic.” *Theoretical Computer Science* 50 (1987): 1–102.

Girard, Jean-Yves. “Linear Logic: Its Syntax and Semantics.” In Jean-Yves Girard, Yves Lafont, and Laurent Regnier, eds., *Advances in Linear Logic*, London Mathematical Society Lecture Note Series 222, 1–42. Cambridge: Cambridge University Press, 1995.

Girard, Jean-Yves, Yves Lafont, and Paul Taylor. *Proofs and Types*. Cambridge Tracts in Theoretical Computer Science. Cambridge: Cambridge University Press, 1990.

Goguen, Joseph A. “L-Fuzzy Sets.” *Journal of Mathematical Analysis and Applications* 18 (1967): 145–174.

Goguen, Joseph A. “The Logic of Inexact Concepts.” *Synthese* 19 (1969): 325–373.

Hájek, Petr. *Metamathematics of Fuzzy Logic*. Dordrecht: Kluwer Academic Publishers, 1998.

Łukasiewicz, Jan. “O logice trójwartościowej.” *Ruch Filozoficzny* 5 (1920): 170–171. English translation: “On Three-Valued Logic,” in *Selected Works*, ed. L. Borkowski, 87–88. Amsterdam: North-Holland, 1970.

Łukasiewicz, Jan. “Philosophische Bemerkungen zu mehrwertigen Systemen des Aussagenkalküls.” *Comptes rendus des séances de la Société des Sciences et des Lettres de Varsovie* 23 (1930): 51–77. English translation: “Philosophical Remarks on Many-Valued Systems of Propositional Logic,” in *Selected Works*, ed. L. Borkowski, 153–178. Amsterdam: North-Holland, 1970.

Post, Emil L. “Introduction to a General Theory of Elementary Propositions.” *American Journal of Mathematics* 43, no. 3 (1921): 163–185.

Priest, Graham. “The Logic of Paradox.” *Journal of Philosophical Logic* 8, no. 1 (1979): 219–241.

Rasiowa, Helena, and Roman Sikorski. *The Mathematics of Metamathematics*. Warsaw: Państwowe Wydawnictwo Naukowe, 1963.

Rondogiannis, Panos, and William W. Wadge. “Minimum Model Semantics for Logic Programs with Negation-as-Failure.” *ACM Transactions on Computational Logic* 6, no. 2 (2005): 441–467.

Takeuti, Gaisi, and Satoko Titani. “Intuitionistic Fuzzy Logic and Intuitionistic Fuzzy Set Theory.” *Journal of Symbolic Logic* 49, no. 3 (1984): 851–866.

Zadeh, Lotfi A. “Fuzzy Sets.” *Information and Control* 8, no. 3 (1965): 338–353.
