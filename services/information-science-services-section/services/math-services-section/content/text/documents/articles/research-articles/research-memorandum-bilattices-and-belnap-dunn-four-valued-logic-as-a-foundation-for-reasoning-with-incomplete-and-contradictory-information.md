---
title: "research memorandum bilattices and belnap dunn four valued logic as a foundation for reasoning with incomplete and contradictory information"
type: research-article
description: Question.
---

# Research Memorandum: Bilattices and Belnap–Dunn Four-Valued Logic as a Foundation for Reasoning with Incomplete and Contradictory Information

**Question.** Why do Belnap–Dunn four-valued logic and its bilattice generalizations treat “both true and false” as a legitimate informational state rather than as an error?

## 1. Executive conclusion

Belnap–Dunn logic, also known as first-degree entailment (FDE), separates two matters that classical two-valued logic conflates: truth-directed evaluation and information-directed evaluation. Its four values are best understood as subsets of the two classical markers \( \{\mathsf{T},\mathsf{F}\} \):

\[
\bot=\varnothing,\quad \mathbf{t}=\{\mathsf{T}\},\quad \mathbf{f}=\{\mathsf{F}\},\quad \top=\{\mathsf{T},\mathsf{F}\}.
\]

Here \( \bot \) means neither true nor false has been supplied; \( \mathbf{t} \) means true only; \( \mathbf{f} \) means false only; and \( \top \) means both true and false have been supplied. The value \( \top \) is not “truth-top”; it is the top of the knowledge or information ordering. It records the presence of conflicting information. It is an epistemic or database state, not a system failure and not automatically a metaphysical commitment to true contradictions.

## 2. The two orderings

The four values carry two partial orders.

The **knowledge order** \( \leq_k \) is inclusion of information:

\[
x\leq_k y \quad \text{iff} \quad x\subseteq y.
\]

Thus:

\[
\bot\leq_k \mathbf{t}\leq_k \top,\qquad
\bot\leq_k \mathbf{f}\leq_k \top,
\]

with \( \mathbf{t} \) and \( \mathbf{f} \) incomparable. On this order, \( \bot \) is no information and \( \top \) is maximal information: both a positive and a negative report are present.

The **truth order** \( \leq_t \) ranks values by increasing truth and decreasing falsity:

\[
x\leq_t y
\quad\text{iff}\quad
(\mathsf{T}\in x\Rightarrow \mathsf{T}\in y)
\ \text{and}\
(\mathsf{F}\in y\Rightarrow \mathsf{F}\in x).
\]

Thus \( \mathbf{f} \) is least and \( \mathbf{t} \) is greatest in the truth order, while \( \bot \) and \( \top \) are intermediate and incomparable. This is the central bilattice insight: one can be more informed without being “truer.”

## 3. The four values

| Value | Set form | Informal reading | Knowledge-order role | Truth-order role |
|---|---:|---|---|---|
| \( \bot \) | \( \varnothing \) | neither true nor false supplied | least information | intermediate |
| \( \mathbf{t} \) | \( \{\mathsf{T}\} \) | true only | positive information | greatest truth |
| \( \mathbf{f} \) | \( \{\mathsf{F}\} \) | false only | negative information | least truth |
| \( \top \) | \( \{\mathsf{T},\mathsf{F}\} \) | both true and false supplied | greatest information | intermediate |

Negation swaps \( \mathbf{t} \) and \( \mathbf{f} \), but fixes \( \bot \) and \( \top \):

\[
\neg \mathbf{t}=\mathbf{f},\quad
\neg \mathbf{f}=\mathbf{t},\quad
\neg\bot=\bot,\quad
\neg\top=\top.
\]

Conjunction and disjunction are meet and join in the truth order. Bilattice operations \( \otimes \) and \( \oplus \) are meet and join in the knowledge order. Thus:

\[
\mathbf{t}\oplus \mathbf{f}=\top,\qquad
\mathbf{t}\otimes \mathbf{f}=\bot.
\]

The first equation says: if one source gives \( \mathbf{t} \) and another gives \( \mathbf{f} \), aggregating all information yields \( \top \). The second says: the consensus common to a positive-only and a negative-only report is no shared information.

## 4. Dunn’s relational semantics

Dunn’s semantics makes the key move by replacing a classical valuation function with a relation between sentences and the classical truth markers \( \mathsf{T} \) and \( \mathsf{F} \). Equivalently, each sentence \(A\) receives a set \(V^*(A)\subseteq\{\mathsf{T},\mathsf{F}\}\). The recursive clauses are two-sided:

\[
\mathsf{T}\in V^*(\neg A)\ \text{iff}\ \mathsf{F}\in V^*(A),
\qquad
\mathsf{F}\in V^*(\neg A)\ \text{iff}\ \mathsf{T}\in V^*(A),
\]

\[
\mathsf{T}\in V^*(A\wedge B)\ \text{iff}\ \mathsf{T}\in V^*(A)\ \text{and}\ \mathsf{T}\in V^*(B),
\]

\[
\mathsf{F}\in V^*(A\wedge B)\ \text{iff}\ \mathsf{F}\in V^*(A)\ \text{or}\ \mathsf{F}\in V^*(B),
\]

with dual clauses for disjunction. This semantics validates the idea that truth-conditions and falsity-conditions may be tracked independently.

Dunn explicitly warns that the semantics need not be read as asserting that some sentence is really both true and false. Rather, the point is that agents may suppose, assert, believe, or receive contradictory claims, and the logic should represent what follows from that informational situation without trivializing reasoning.

## 5. Belnap’s “useful” logic

Belnap’s motivating case is a question-answering system or database that receives information from imperfect sources. Classical logic has the defect that an inconsistency \(A\wedge\neg A\) entails arbitrary \(B\). That is unacceptable for a system intended to answer questions from a large, fallible, incrementally updated database. The remedy is not to erase inconsistency, nor to halt inference, but to mark the relevant proposition as having both positive and negative support.

On the standard FDE matrix, the designated values are those containing \( \mathsf{T} \):

\[
D=\{\mathbf{t},\top\}.
\]

So \( \top \) counts as truth-supporting, but it does not collapse the logic. For example, let \(v(p)=\top\) and \(v(q)=\mathbf{f}\). Then \(v(p\wedge\neg p)=\top\), which is designated, while \(v(q)=\mathbf{f}\), which is not designated. Hence \(p\wedge\neg p\not\models q\). Explosion fails.

This is exactly why \( \top \) is useful. It stores conflict locally. It does not license arbitrary conclusions globally.

## 6. Ginsberg’s generalization: bilattices

Ginsberg generalizes Belnap’s FOUR into bilattices: structures carrying both a truth order and a knowledge order. His artificial-intelligence motivation is that many inference systems—default reasoning, truth maintenance, theorem proving, and related nonmonotonic methods—need to distinguish being more true from being more informed.

In this setting, a truth value is not merely a point on a line from false to true. It may encode evidence for and evidence against a sentence. This makes \( \top \) a natural value: it is the state in which evidence exists on both sides. Ginsberg’s framework therefore interprets inconsistent information as an algebraic input to inference, not as a fatal exception.

## 7. Fitting’s logic-programming interpretation

Fitting develops the bilattice framework for logic programming. The key technical point is that logical connectives such as \( \wedge,\vee,\neg \) operate according to the truth ordering, while fixed-point semantics for programs can be taken in the knowledge ordering. The least fixed point in the knowledge order is the interpretation that contains no extraneous information.

This division is conceptually important. Truth operations evaluate formulas; knowledge operations govern informational growth. A computation can therefore start at \( \bot \), add positive information, add negative information, and, when both are present, arrive at \( \top \). The arrival at \( \top \) means the program or database has acquired conflicting reports. It does not mean the semantic machinery has broken.

## 8. Why “both” is not an error

The value \( \top \) is an informational state rather than an error for five reasons.

First, it has a precise semantic interpretation: \( \top=\{\mathsf{T},\mathsf{F}\} \). It records that both truth and falsity have been supplied.

Second, it is structurally regular. It participates in the same lattice operations as the other values. Negation, conjunction, disjunction, knowledge meet, and knowledge join are all defined for it.

Third, it is epistemic. In Belnap’s motivating interpretation, the values concern what the system has been told. In Dunn’s terms, the semantics models contradictory suppositions or assertions, not necessarily ontological contradictions.

Fourth, it is paraconsistent. Since \( \top \) does not make every formula designated, inconsistency remains local. The system can continue to reason nontrivially in the presence of conflict.

Fifth, it preserves diagnostic information. Treating \( \top \) as an error would erase the fact that there are two distinct evidential streams, one positive and one negative. Treating it as a value allows the system to answer, inspect, revise, or defer while retaining the conflict as data.

## 9. Conclusion

Belnap–Dunn logic and bilattices are best understood as logics of information states. The two orderings explain the apparent paradox: \( \top \) is not “maximally true”; it is maximally informed in the specific sense of containing both positive and negative information. This makes it the correct value for contradiction-tolerant reasoning. It is not a crash state. It is the formal record of a conflict.

## References

Belnap, Nuel D., Jr. “How a Computer Should Think.” In *Contemporary Aspects of Philosophy*, edited by Gilbert Ryle, 30–56. Oriel Press, 1977.

Belnap, Nuel D., Jr. “A Useful Four-Valued Logic.” In *Modern Uses of Multiple-Valued Logic*, edited by J. Michael Dunn and George Epstein, 5–37. Dordrecht: D. Reidel, 1977. DOI: 10.1007/978-94-010-1161-7_2.

Dunn, J. Michael. “Intuitive Semantics for First-Degree Entailments and ‘Coupled Trees’.” *Philosophical Studies* 29, no. 3 (1976): 149–168. DOI: 10.1007/BF00373152.

Dunn, J. Michael. “Two, Three, Four, Infinity: The Path to the Four-Valued Logic and Beyond.” In Hitoshi Omori and Heinrich Wansing, eds., *New Essays on Belnap–Dunn Logic*, 77–97. Cham: Springer, 2019.

Fitting, Melvin. “Bilattices and the Semantics of Logic Programming.” *Journal of Logic Programming* 11, no. 2 (1991): 91–116. DOI: 10.1016/0743-1066(91)90014-G.

Ginsberg, Matthew L. “Multi-Valued Logics.” In *Proceedings of the Fifth National Conference on Artificial Intelligence*, 243–247. AAAI Press, 1986.

Ginsberg, Matthew L. “Multivalued Logics: A Uniform Approach to Reasoning in Artificial Intelligence.” *Computational Intelligence* 4, no. 3 (1988): 265–316. DOI: 10.1111/j.1467-8640.1988.tb00280.x.
