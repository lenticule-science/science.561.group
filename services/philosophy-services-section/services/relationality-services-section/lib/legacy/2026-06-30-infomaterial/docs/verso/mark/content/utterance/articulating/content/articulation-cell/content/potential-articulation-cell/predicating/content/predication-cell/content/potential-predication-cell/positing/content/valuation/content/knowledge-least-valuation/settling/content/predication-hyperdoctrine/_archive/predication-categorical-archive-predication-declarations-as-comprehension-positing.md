---
type: theorem
status: sketch
depends-on: [closure-operator, predication-hyperdoctrine, predication-settling, predication-cell, four-bilattice, truth-order, knowledge-order]
see-also: [positing-morphism, lawvere-comprehension-paraconsistent, belnap-speech-act-partition, speech-act]
---

# Self-validating positing is positing into the comprehension of the datum

A positing morphism $\mathrm{posit}_{(\phi, q)}$ from the uninformed valuation $v_0$ with $v_0(\phi) = \bot$ is **self-validating** with respect to closure operator $\mathrm{cl}$ iff the posited cell $\phi$ belongs to the hyperdoctrine's comprehension of datum $q$ in the settled valuation $\mathrm{cl}(v_0 \vee_k \delta_{\phi, q})$. This gives a hyperdoctrinal characterization of Austin's declarative speech acts: declarations are exactly the positing morphisms that land their target cell inside the comprehension of the posited value.

## Statement

**Theorem.** Let $\phi = (s, p, o) \in \Phi$, $q \in \mathbf{L}^\bowtie$, and $v_0$ a settling with $v_0(\phi) = \bot$. The following are equivalent:

(a) The positing morphism $\mathrm{posit}_{(\phi, q)}$ is self-validating: $\mathrm{cl}(v_0 \vee_k \delta_{\phi, q})(\phi) \geq_t q$.

(b) The cell $(s, o)$ falls within the comprehension of $q$ at predicate $p$ in the settled valuation $v_1 := \mathrm{cl}(v_0 \vee_k \delta_{\phi, q})$: the pair $(s, o)$ is in the extent of $\{p : q\}_{\mathbf{t}}$ — the comprehension morphism (axiom B4 of the predication hyperdoctrine) applied to $q$ in the fiber $A_p$.

**(a) and (b) are equivalent by definition.** Self-validation at $\phi$ means the settled value at $\phi$ is truth-designated at level $q$. The comprehension $\{p : q\}_\mathbf{t}$ selects exactly those cells $(s, p, o)$ where the settled value $\geq_t q$. $\square$

## Which closure operators support self-validation

The theorem above is an equivalence, not a construction. The substance is in which closure operators $\mathrm{cl}$ make self-validating positing possible at given cells.

**Definition.** A closure operator $\mathrm{cl}$ is **declaration-supporting at $\phi$ for datum $q$** if:
$$\text{for all } v_0 \text{ with } v_0(\phi) = \bot:\quad \mathrm{cl}(v_0 \vee_k \delta_{\phi, q})(\phi) \geq_t q.$$

That is, the closure rules confirm truth-class at $\phi$ upon any positing of $q$ at $\phi$ from an uninformed state.

**Characterization.** A closure operator is declaration-supporting at $\phi$ for datum $q$ iff its rule system contains a rule of the form:

> *If cell $\phi$ has knowledge-order value $\geq_k q$ (i.e., value $\geq_k q$ in $\leq_k$), then cell $\phi$ has truth-order value $\geq_t q$.*

A rule of this form fires as soon as $q$ is posited at $\phi$ (since positing $q$ raises $\phi$'s value to $v_0(\phi) \vee_k q \geq_k q$), and it confirms truth-designation at level $q$. The closure then satisfies the self-validation condition.

**Note on triviality.** For $q = \mathbf{t}$ (the assertive class in $\mathbf{FOUR}$): positing $\mathbf{t}$ gives $v_0(\phi) \vee_k \mathbf{t} = \mathbf{t}$ (since $v_0(\phi) = \bot$), and $\mathrm{cl}(\mathbf{t}) \geq_t \mathbf{t}$ holds iff closure does not add negative evidence that moves $\mathbf{t}$ to $\top$. So assertive positing is self-validating at $\phi$ iff $\mathrm{cl}$ is **assertion-stable at $\phi$** (does not add negative evidence to truth-designated cells).

## Constitutive versus confirmatory declarations

A stronger condition than self-validation is **constitutiveness**:

$$\mathrm{cl}(v_0 \vee_k \delta_{\phi, q})(\phi) \geq_k q \quad \text{and} \quad \mathrm{cl}(v_0)(\phi) = \bot.$$

This requires not only that the closure confirms the posit, but also that the closure alone (without the posit) derives nothing at $\phi$. A constitutive declaration creates its truth-content: the cell is not derivable from the background valuation, but becomes confirmed upon positing.

The comprehension reading: $\mathrm{cl}(v_0)(\phi) = \bot$ means $(s,o) \notin \mathrm{ext}(\{p : q\}_\mathbf{t})$ before the posit (the cell is outside the comprehension). After positing, $(s,o) \in \mathrm{ext}(\{p : q\}_\mathbf{t})$ in $v_1$. The positing act changes the extension of the comprehension morphism — the declaration literally creates a new member of $\{p : q\}_\mathbf{t}$.

## Connection to the four regime classes

Self-validating positing interacts with the settling regime:

- **Strict regime** ($\kappa < \omega$): closure terminates in finitely many steps. If the confirmation rule fires in the first closure step, self-validation is immediate. The declaration "takes effect" in bounded time.
- **Scott-continuous regime** ($\kappa = \omega$): if the confirmation rule requires a chain of derived values (e.g., closure derives $\phi$ from $\psi$, and $\psi$ from $\phi$), reaching confirmation may require the directed colimit $\omega$-step. A declaration at an isolated cell (no circular dependencies) still terminates finitely.
- **Aperiodic regime** ($\kappa$ limit ordinal, non-Scott-continuous): a self-validating posit at a cell involved in a non-Scott-continuous firing may oscillate — truth-confirmed at even stages, not confirmed at odd stages — and never permanently settle. Such declarations are incoherent in the operational sense; they require rejecting declaration-supporting closure operators in aperiodic regimes.

**Corollary.** For strict-regime settling systems, every declaration-supporting positing morphism is coherent: the declared cell permanently reaches truth-designation after finitely many closure steps.

## Connection to entity realization

From the [entity realization theorem](entity-realization.md): a posit-entity $e_q$ representing the posit $(\phi, q)$ would, under a declaration-supporting closure, be the entity whose existence is constituted by the act of positing. The closure rules confirm both: (a) that $\phi$ has value $\geq_t q$ (the self-validation condition), and (b) that the entity $e_q$ exists with the appropriate membership in $\{p : q\}_\mathbf{t}$ (the entity-realization condition). Declaration-supporting positing is the operational mechanism for constitutive entity creation.

## Relation to Austin's declaratives

Austin's defining property of declarations is that the speech act and its truth-content are simultaneous: saying constitutes doing. In PredCat, this is the constitutive condition above: the cell is outside the comprehension before the posit, inside after. The closure rules play the role of the institutional background that validates the declaration — the officiant's closing of a contract, the legislature's passing of a bill. Without declaration-supporting closure rules, positing $q$ at $\phi$ does not self-validate; with them, it does.

This gives a mathematical model of Austin's claim that declarations require a proper institutional setting: the declaration-supporting property of $\mathrm{cl}$ is the formal analog of the institutional rules that govern when declarations succeed.
