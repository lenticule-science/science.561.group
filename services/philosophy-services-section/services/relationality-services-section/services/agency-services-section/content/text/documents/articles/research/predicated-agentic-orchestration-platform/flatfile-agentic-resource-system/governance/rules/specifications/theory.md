---
name: theory
description: Specification of what a theory is in a flatfile-agentic-resource-system. A theory is a directory presenting nine math-derived kinds of content — structures, transformers, judgments, sub-theories, realization roles, abstaining speech acts, traversal paths, modal-restriction records, and researching/idealization in progress. Each is held in a canonical sub-directory present iff the theory has content of that kind. The directory's `_index.md` declares the theory's identity and structural relations to other theories.
title: theory
---

A theory is a directory.

## What a theory presents (derived from the math)

A predication settling over base parameters $(\mathbf{L}, \mathcal{C}, E, \lambda)$ with closure operator $\mathrm{Cl}^T$ decomposes into four irreducible kinds of content directly:

1. **Structures** — the mathematical structures the theory defines or commits to.
  These include its [predicates](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predicate.md) (objects of the [predicate category](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) $\mathcal{C}$), the predicate category itself, the value-domain $\mathbf{L}$ ([residuated lattice](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/residuated-lattice.md), bilattice, four-bilattice), the [predication fiber algebras](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) $A_p$, [predication fibrations](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md), and any other defined mathematical structure.

2. **Transformers** — the transformations between structures the theory defines.
  These include the [predicate-category morphisms](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) (specialization, converse, subject-projection, object-projection, and composites), [closure operators](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md), [bilattice homomorphisms](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/bilattice-homomorphism.md), reindexing functors $f^*$, and any other defined transformation.

3. **Judgments** — the propositional content of the theory: the closure rules generating $\mathrm{Cl}^T$, asserted cell values in the initial valuation $v_0$, and universal claims about settling behavior.

4. **Sub-theories** — narrower predication settlings whose predicate scope is type-embedded into this theory's via $\iota: \mathcal{C}^{\text{sub}} \hookrightarrow \mathcal{C}^{\text{host}}$ (per [theory-relative-ideal](../../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/closure-2-monad/content/theory-relative-ideal/theory-relative-ideal.md)).

Five further content kinds are distinguished by the agentic extensions of predication category theory:

5. **Realization roles (concepts)** — the predication-category-natural roles that one or more structures realize.
  Math: the `realizes:` relation has these as its targets; per [predicate-category-naturality](../../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predicate-category/content/predicate-category-naturality/predicate-category-naturality.md), a concept is the named role separable from any particular structure that fills it.

6. **Abstaining speech acts (questions)** — recorded $\bot$-valued positings per the [speech-act](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/speech-act.md) framework.
  The math identifies these as the abstaining illocutionary class (datum $\bot$, identity morphism).
  A question is the precondition for a [researching morphism](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/researching.md) that would close the gap.

7. **Traversal paths (prose)** — finite ordered traversals of the theory's dependency graph respecting topological-sort constraints.
  The renderer's `introduces:`/`recaps:`/`discusses:` relations position prose against the atoms it walks.

8. **Modal-restriction records (governance)** — substrate-recorded $\Box_R u_a$ structure per the predicated-agentic-orchestration-platform's [governance](../../../../../predicated-agentic-orchestration-platform/concepts/governance.md).
  The office graph, accessibility relation $R$, and authority closure rules are themselves substrate entities; the four Hohfeldian positions are shapes on $R$.

9. **Researching/idealization in progress (work)** — substrate predications recording the cycle of [researching morphisms](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/researching.md) (extending the theory) and [idealization morphisms](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/idealization-morphism.md) (moving resource settlings toward theory ideals).
  Per [agent-self-queued-work](../../../../agent/agential-self-generation/agent-self-queued-work/agent-self-queued-work.md), each is signed and bounded by the queueing agent's modal-restricted capability.

Beyond these four, the predication category theory plus its agentic extensions (agential-orchestration-platform, predicated-agentic-orchestration-platform) distinguish five further content kinds, each math-derived: realization roles, abstaining speech acts, traversal paths, modal-restriction records, and in-progress idealization/researching records.

## Required structure of a theory directory

A theory directory MUST contain `_index.md` declaring its identity and structural relations.

A theory directory MAY contain any of the nine canonical sub-directories.
Each MUST contain at least one resource if it exists at all — an empty canonical sub-directory is presentation noise and a violation.

- `structures/` — one file per defined structure (see [structure.md](structure.md)).
  Math: $\mathrm{Ob}(\mathcal{C})$ plus the broader mathematical structures the theory commits to.
  Present iff this theory defines any structures.

- `transformers/` — one file per defined transformation (see [transformer.md](transformer.md)).
  Math: $\mathrm{Mor}(\mathcal{C})$ plus the broader transformations the theory defines (closure operators, bilattice homomorphisms, reindexing functors).
  Present iff this theory defines any transformers.

- `claims/` — one file per judgment (see [claim.md](claim.md)).
  Math: closure rules generating $\mathrm{Cl}^T$, asserted cell values in $v_0$, universal claims about settling.
  Present iff this theory asserts any claims.

- `theories/` — sub-theory directories, each itself a theory.
  Math: type-embedded narrower settlings per [theory-relative-ideal](../../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/closure-2-monad/content/theory-relative-ideal/theory-relative-ideal.md).
  Present iff this theory contains any sub-theories.

- `concepts/` — one file per realization role (see [concept.md](concept.md)).
  Math: the predication-category-natural roles that structures realize via the `realizes:` relation.
  Present iff this theory names any roles distinct from their realizations.

- `questions/` — one file per abstaining speech act (see [question.md](question.md)).
  Math: $\bot$-valued positings per the [speech-act](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/speech-act.md) framework — preconditions for [researching morphisms](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/researching.md) that would extend the theory.
  Present iff this theory tracks any open inquiries.

- `prose/` — long-form rhetorical material (see [prose.md](prose.md)).
  Math: finite ordered traversals of the theory's dependency graph respecting topological-sort constraints — readings made explicit.
  Present iff this theory has any prose.

- `governance/` — substrate-recorded authority structure (see [governance.md](governance.md)).
  Math: modal-necessity restriction $\Box_R u_a$ on capability fibers per the predicated-agentic-orchestration-platform's [governance](../../../../../predicated-agentic-orchestration-platform/concepts/governance.md) concept.
  Present iff this theory carries any governance.

- `work/` — in-progress idealization and researching records (see [work.md](work.md)).
  Math: substrate predications signed by their queueing agent, recording the basic unit of theory-driven knowledge production (researching → idealization cycle).
  Present iff this theory tracks any work in progress.

The absence of a canonical sub-directory means the theory carries no content of that kind.
No other sub-directory is canonical; sub-directories outside the nine are realization-specific and SHALL be flagged as suspicious by linting.

## `_index.md` frontmatter

### `name`

The slug naming this theory.
Required.

### `description`

One-sentence statement of what this theory is — its base parameters, scope, and the role it plays.
Required.

### `derives-methods-from-theory`

List of theories.
Each entry asserts: there exists a [predication-settling base-morphism](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predication-settling-base-morphism.md) from that theory's base parameters into this theory's, whose predicate-category component $\pi$ is faithful and generator-preserving.
This theory inherits the listed theory's value-domain (or a residuated-lattice extension), entity scope, predicate generators, and closure rules.
Optional, multi-valued.

### `models-theory`

List of theories.
Each entry asserts: there exists a [modeling morphism](../../../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/modeling-morphism.md) $v_{\text{this}} \models v_{\text{listed}}$ over a common base.
This theory's settling satisfies the listed theory's truth commitments.
Optional, multi-valued.

### `extends-knowledge-of`

List of theories.
Each entry asserts: there exists a [predication-settling preorder morphism](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predication-settling-preorder-morphism.md) over a common base such that this theory knows at least as much as the listed theory in the knowledge order $\leq_k$.
Optional, multi-valued.

### `mld-equivalent-to`

List of theories.
Each entry asserts: this theory is [mutually-locally-derivable](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/mutually-locally-derivable.md) with the listed theory.
Same-base; aperiodic regime.
Optional, multi-valued, symmetric.

## Cardinality

`name` and `description` are required.
The four structural relation keys are each optional, multi-valued, and independent — a theory may declare any combination, including none.
