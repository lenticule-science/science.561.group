---
type: theorem
status: proven
depends-on: [predication-fibration, predication-settling, positing-morphism, assertive-positing-morphism, closure-operator, truth-order, knowledge-order, four-bilattice, predicate-category]
see-also: [positing-naturality, locution-illocution-perlocution-factorization, belnap-speech-act-partition, positing-realizable-factorization]
---

# PredCat speech-act structure as a graded channel theory

Barwise-Seligman channel theory ([@barwise-seligman1997]) organizes information flow through systems of **classifications** connected by **infomorphisms** and **channels**. The theorem below establishes a formal correspondence between PredCat's speech-act structure and channel theory — first at the binary truth-threshold level, then extended to the full graded bilattice.

## Binary truth-threshold classification

For a settling stage $v$ and entity set $E$, define the **truth-threshold classification** $\mathrm{Cls}(v)$ to be the Barwise-Seligman classification:

$$\mathrm{Cls}(v) := (E \times E,\;\; \mathcal{C},\;\; {\models}^v)$$

where $(s, o) \models^v p \iff v(s, p, o) \geq_t \mathbf{t}$.

Tokens are entity pairs $E \times E$, types are predicates in $\mathcal{C}$, and incidence records which pairs are truth-designated at which predicate. This is a standard Barwise-Seligman classification.

## Theorem (positing is minimal infomorphism extension)

**Lemma.** An assertive positing morphism $\mathrm{posit}_{(\phi, q)}$ with $\phi = (s, p, o)$ and $q \geq_t \mathbf{t}$ induces an **incidence-extension infomorphism** from $\mathrm{Cls}(v)$ to $\mathrm{Cls}(v \vee_k \delta_{(\phi, q)})$: the pair $(\mathrm{id}_\mathcal{C},\, \mathrm{id}_{E \times E})$ witnesses ${\models}^v \subseteq {\models}^{v'}$, extending incidence at exactly the one cell $\phi$.

*Proof.* For any $\phi' = (s', p', o') \neq \phi$: $v'(s', p', o') = v(s', p', o')$ (positing changes only the cell $\phi$), so $(s', o') \models^{v'} p' \iff (s', o') \models^v p'$. For $\phi' = \phi$: $v'(\phi) = v(\phi) \vee_k q \geq_k q \geq_t \mathbf{t}$, so $(s, o) \models^{v'} p$. Since ${\models}^v \subseteq {\models}^{v'}$ (incidence can only grow under knowledge-order join), the identity maps form an incidence-extension infomorphism. $\square$

The assertive positing morphism is the **minimal** such extension: it adds exactly one new incidence to the classification, and the identity maps on types and tokens are the simplest possible infomorphism data.

Denial positing $\mathrm{posit}_{(\phi, \mathbf{f})}$ and contestation positing $\mathrm{posit}_{(\phi, \top)}$ do not extend the truth-threshold incidence relation (adding $\mathbf{f}$ or $\top$ to a $\bot$-valued cell does not make it truth-designated). They are visible in the graded generalization below.

## Theorem (closure operator is a channel)

**Theorem.** The closure operator $\mathrm{cl}$ defines a Barwise-Seligman channel from $\mathrm{Cls}(v)$ to $\mathrm{Cls}(\mathrm{cl}(v))$.

*Construction.* Each ground instance of a $\leq_t$-monotone closure rule — "if $v(s, p, o) \geq_t \mathbf{t}$ then $v(s', p', o') \geq_t \mathbf{t}$" — defines a conditional incidence: $(s, o) \models^v p$ implies $(s', o') \models^{\mathrm{cl}(v)} p'$. Collectively, the closure rules define a channel: a system of such conditionals that the closure operator satisfies by definition (closure is $\geq_t \mathbf{t}$-monotone, so truth-designated cells propagate through closure rules).

The **channel** has:
- Source: $\mathrm{Cls}(v)$
- Target: $\mathrm{Cls}(\mathrm{cl}(v))$
- Theory: the set $\{(s,p,o) \Rightarrow (s',p',o') : \text{closure rule fires}\}$ — the closure rule language at the truth-threshold

The theory of the channel in Barwise-Seligman's sense is exactly the [closure rule language](teaching/explanations/closure-rule-language.md) of $\mathrm{cl}$ restricted to $\leq_t$-monotone rules. $\square$

## Perlocution as information flow

The **perlocutionary effect** of a speech act $\mathrm{posit}_{(\phi, q)}$ at $v$ is the set of new incidences introduced by closing $v' = v \vee_k \delta_{(\phi, q)}$:

$$\{(s', p', o') : (s', o') \models^{\mathrm{cl}(v')} p' \text{ but } (s', o') \not\models^v p'\}.$$

In Barwise-Seligman terms, this is the **information flow** through the closure channel from the posited cell $\phi$ to all cells that receive new truth-designation after closure. The [locution/illocution/perlocution factorization theorem](locution-illocution-perlocution-factorization.md) gives the channel structure:

| Speech-act level | Channel-theory realization |
|---|---|
| **Locution** | Selection of the type $\phi \in \mathcal{C}$ — the channel entry point |
| **Illocution** | Incidence-extension infomorphism at $\phi$ — adding the posit |
| **Perlocution** | Information flow through the closure channel — new incidences downstream |

## The graded generalization: full bilattice as quantitative classification

The binary formulation above captures only the truth-designated part of the bilattice. The full $\mathbf{L}^\bowtie$-valued fibration is a **graded classification**:

$$\mathrm{Cls}_{\mathbf{L}^\bowtie}(v) := (E \times E,\;\; \mathcal{C},\;\; v)$$

where the graded incidence relation $v : (E \times E) \times \mathcal{C} \to \mathbf{L}^\bowtie$ assigns the full bilattice value. A **graded infomorphism** between graded classifications is a pair $(f^\wedge, f^\vee)$ satisfying the graded adjointness condition with $\mathbf{L}^\bowtie$-valued equality.

Under this generalization:

- Every positing morphism $\mathrm{posit}_{(\phi, q)}$ — assertive, denial, or contestation — is a graded incidence-extension infomorphism: the graded incidence value at $\phi$ changes from $v(\phi)$ to $v(\phi) \vee_k q$; all other cells are unchanged.
- The closure operator $\mathrm{cl}$ is a graded channel from $\mathrm{Cls}_{\mathbf{L}^\bowtie}(v)$ to $\mathrm{Cls}_{\mathbf{L}^\bowtie}(\mathrm{cl}(v))$, transmitting $\leq_k$-increases through the closure rule system.
- Information flow is now $\mathbf{L}^\bowtie$-valued: the perlocutionary effect records not just whether a cell newly becomes truth-designated, but by how much its bilattice value increases.

**Corollary.** PredCat's predication settling structure is a graded generalization of Barwise-Seligman channel theory, with the binary incidence relation replaced by $\mathbf{L}^\bowtie$-valued graded incidence. The binary theory is recovered at the truth-threshold quotient $q \mapsto [q \geq_t \mathbf{t}] \in \{0, 1\}$.

## What the channel-theory reading supplies

The Barwise-Seligman channel-theory reading of PredCat provides:

1. **Situated-cognition bridge.** The classification/infomorphism vocabulary connects PredCat's speech-act structure to the situated-cognition and information-flow traditions (Barwise-Perry situation semantics, Seligman's information-flow semantics). A PredCat settling is a graded situation; positing is a local fact-fixing act; closure propagates the situated content.

2. **Comparison with RDF 1.2.** RDF 1.2's grounded triple set (the analog of $\mathrm{Cls}(v)$) is a binary classification; the PredCat graded classification extends it to bilattice-valued truth. RDF 1.2's "asserting a triple" (adding to the potential graph) is the binary case of the incidence-extension infomorphism.

3. **What the channel reading misses.** The binary channel theory does not see: (a) the knowledge-order structure (denial evidence, contested cells, abstaining cells); (b) the closure 2-monad structure (unit, multiplication, Eilenberg-Moore algebras); (c) the hyperdoctrinal quantifier structure (B1–B4). These require the full graded formulation or the PredCat fibration structure directly.
