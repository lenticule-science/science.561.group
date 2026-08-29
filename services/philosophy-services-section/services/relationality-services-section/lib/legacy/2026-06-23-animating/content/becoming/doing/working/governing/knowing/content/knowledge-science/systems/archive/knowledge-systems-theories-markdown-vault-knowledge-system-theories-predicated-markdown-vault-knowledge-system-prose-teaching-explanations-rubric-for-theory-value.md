---
type: narrative
status: current
discusses:
  - ../_index.md
  - ../specifications/theory-discipline.md
  - ../specifications/question-as-first-class.md
  - ../specifications/frontmatter-relations.md
  - ../specifications/skill-colocation.md
  - ../teaching/explanations/staging-area.md
  - ../morphisms/theory-promotion.md
depends-on:
  - ../specifications/theory-discipline.md
  - ../specifications/question-as-first-class.md
  - ../specifications/frontmatter-relations.md
  - ../specifications/skill-colocation.md
  - ../teaching/explanations/staging-area.md
  - ../morphisms/theory-promotion.md
  - ../../../../predicated-knowledge-systems/objects/predicated-knowledge-system.md
  - ../../../../predicated-knowledge-systems/narratives/from-frege-to-fars.md
  - ../../../../predicated-knowledge-systems/narratives/what-knowledge-systems-inherits.md
  - ../../../../predicated-knowledge-systems/concepts/knowing-as-settling.md
  - ../../../../predicated-knowledge-systems/concepts/evidence-accumulation.md
  - ../../../../predicated-knowledge-systems/concepts/reified-retraction.md
  - ../../../../predicated-knowledge-systems/theorems/assertion-monotonicity.md
  - ../../../../predicated-knowledge-systems/morphisms/federate.md
  - ../../../../predicated-knowledge-systems/morphisms/specialize.md
  - ../../../../predicated-knowledge-systems/morphisms/classify.md
  - ../../../../../../../../../humanities/theories/communication/concepts/accountable-closure.md
  - ../../../../../../../../../humanities/theories/communication/concepts/medium-specific-rigor.md
see-also:
  - ../audits/rubric-application-2026-05-03.md
  - ../../../../../../../../linguistics/theories/semiotics/_index.md
  - ./discipline-as-its-own-theory.md
  - ../specifications/note-types/concept.md
  - ../specifications/note-types/theorem.md
  - ../learning/questions/audience-and-pragmatics-of-each-note-type.md
  - ../learning/questions/skill-to-theory-binding.md
  - ../learning/questions/knowledge-theory-as-explicit-layer.md
  - ../../../../../../../../../humanities/theories/philosophy/theories/western/theories/epistemology/terms/disciplinary-matrix.md
  - ../../../../knowing-semioverse/theories/decisions/0001-four-group-directory-structure.md
---

# A rubric for theory-value

What is a theory in this library *worth*? The library refuses any single answer to that question. A theory is not valuable because its claims are accurate, or because its scope is wide, or because it is fruitful for further research, or because it is elegant — though it may be all four. The rubric this library actually applies is *substrate-level*: a theory's value is read off the work it does on the corpus's predicated knowledge substrate, in the conditions the curation discipline names. This narrative pulls that rubric together in one place. It is currently distributed across the [theory-discipline spec](../specifications/theory-discipline.md), the [predicated-knowledge-systems substrate](../../../../predicated-knowledge-systems/objects/predicated-knowledge-system.md), the [question-as-first-class spec](../specifications/question-as-first-class.md), the [skill-colocation spec](../specifications/skill-colocation.md), the load-bearing communication concepts, and the [knowing-semioverse 0001 decision](../../../../knowing-semioverse/theories/decisions/0001-four-group-directory-structure.md). A reader cannot find it without already knowing where to look. Naming the rubric here makes it greppable.

The rubric has ten facets. None is sufficient on its own; together they discriminate which directories the corpus loads on and which it merely keeps.

## 1. Theory-discipline — the gating threshold

A directory is a *theory* in this corpus's strict sense only when it satisfies the six criteria of [theory-discipline](../specifications/theory-discipline.md): a committed subject, its own concepts, its own objects and morphisms, claims, visible open work, and a front door. Everything else is a [staging-area](../teaching/explanations/staging-area.md) or a container. The first thing the rubric asks is whether the directory is even eligible for the rest of the rubric: a staging-area's value is real but not yet load-bearing, and pretending otherwise is the most common curation failure the discipline names. The threshold is the rubric's gate, not its summit.

## 2. Substrate role on $(\mathbf{L}, \mathcal{C}, E, \mathcal{S}, \Sigma)$

A theory carries weight when it can be located against the five-component object the library treats as the substrate of any knowledge system: the value-domain $\mathbf{L}$, the predicate category $\mathcal{C}$, the entity set $E$, the closure-rule system $\mathcal{S}$, and the scope family $\Sigma$ of the [predicated knowledge system](../../../../predicated-knowledge-systems/objects/predicated-knowledge-system.md). [What knowledge systems inherits when it goes predicated](../../../../predicated-knowledge-systems/narratives/what-knowledge-systems-inherits.md) walks the inheritances component by component. A theory whose contribution can be read as a refinement, restriction, or extension of one of the five components has a structural place; one whose contribution cannot be located against the substrate at all is either upstream of the substrate (and the corpus should declare the dependency) or off-substrate (and the corpus should be honest about that).

## 3. Necessity in a structural lineage

Some theories carry their value as steps in a chain of accumulating commitments where each step was *required* by the next. [From Frege to FARS](../../../../predicated-knowledge-systems/narratives/from-frege-to-fars.md) traces eight such steps — Frege's predicate, Lambek's residuation, Lawvere's adjoint quantifiers, Belnap's four values, Fitting's fixpoint, Busaniche-Cignoli's residuation, Maruyama's unification, and the FARS engineering surface — and shows that each was taken in service of a real engineering problem the previous step could not solve. A theory positioned in such a lineage borrows its value from the line: removing it breaks the next step. A theory that floats free of any structural lineage may still be valuable, but the burden of articulating its value falls back on the rest of the rubric without this support.

## 4. Inheritance ledger

Once a theory is located, the library is honest about *how much* it actually inherits. [What knowledge systems inherits](../../../../predicated-knowledge-systems/narratives/what-knowledge-systems-inherits.md) keeps an explicit ledger in three columns: what inherits *with proof*, what inherits *as substantive commitment* with `status: sketch`, and what *does not inherit* (and is therefore a parameter, not a theorem). A theory whose ledger is dense and honest — proofs where there are proofs, sketches where there are sketches, explicit non-inheritances where the parent does not constrain — is more valuable than a theory whose ledger overstates its proofs or hides its parameters. The ledger is itself a substrate-level diagnostic; the discipline of writing it forces the theory to know what it is doing.

## 5. Composability across peers

A theory carries weight when its objects and morphisms compose with those of neighbouring theories on the substrate. The three load-bearing peer-composition morphisms in the predicated-knowledge-systems subtheory — [federate](../../../../predicated-knowledge-systems/morphisms/federate.md), [specialize](../../../../predicated-knowledge-systems/morphisms/specialize.md), and [classify](../../../../predicated-knowledge-systems/morphisms/classify.md) — supply the substrate-level operations any community-bounded theory has to be readable under. This theory's own [theory-promotion](../morphisms/theory-promotion.md) morphism is the curation-side counterpart at the directory level: a theory that can be promoted, demoted, federated with neighbours, specialized within a stratum, and classified into a discourse community is doing structural work; a theory that resists every one of those operations is either genuinely *sui generis* (rare) or under-articulated (much more common).

## 6. Epistemic discipline

A theory's content is held to a substrate-level epistemic discipline: knowing-as-process, evidence-accumulation across sources, and reified retraction of past claims. [Knowing as settling](../../../../predicated-knowledge-systems/concepts/knowing-as-settling.md) names knowing as the substrate's settling under the community's closure rules; [evidence-accumulation](../../../../predicated-knowledge-systems/concepts/evidence-accumulation.md) requires that multiple sources accumulate rather than overwrite; [reified-retraction](../../../../predicated-knowledge-systems/concepts/reified-retraction.md) records withdrawals of claims as substrate cells rather than silent edits. The structural fact underwriting all three is [assertion monotonicity](../../../../predicated-knowledge-systems/theorems/assertion-monotonicity.md): the substrate has no in-place clobber, and disagreement becomes $\top$ rather than silence. A theory whose claims are stated in a way that respects this discipline — that earns its $t$-values, that admits contestation, that survives federation — is in better epistemic shape than a theory that does not.

## 7. Open-work honesty

A theory is more valuable when its open work is *visible*. The [question-as-first-class spec](../specifications/question-as-first-class.md) commits the corpus to typed `question` notes with structured decompositions, "what is established" sections, and "what remains open" sections. The [staging-area](../teaching/explanations/staging-area.md) concept commits the corpus to honest under-claiming of directories that have not yet earned theory status. A theory with one fully-decomposed question and three partially-formed ones is in better epistemic shape than a theory with the same actual gaps but no questions on file. Open-work honesty is not a deficiency to be minimized; it is a *contribution*, because it directs the corpus's next round of work.

## 8. Communicative responsibility

A theory carries weight when its artifacts can be *read*. The communication-theoretic anchors [accountable-closure](../../../../../../../../../humanities/theories/communication/concepts/accountable-closure.md) and [medium-specific-rigor](../../../../../../../../../humanities/theories/communication/concepts/medium-specific-rigor.md) name the discipline: an artifact is legitimate when its demanded closures are inspectable, repairable, and transportable, and when each medium's rigor is judged in its own register rather than by imitating proof. A theory whose concept notes drift into theorem-style claim-and-evidence, or whose narratives drift into definitional terseness, fails the communication discipline — and the [audience-and-pragmatics-of-each-note-type](../learning/questions/audience-and-pragmatics-of-each-note-type.md) question names this as a load-bearing open frontier the rubric currently holds open rather than answers.

## 9. Operational binding

A theory that *establishes things as possible* in the agential-orchestration register is more valuable when the things it establishes are bound back to operational artifacts. The [skill-colocation spec](../specifications/skill-colocation.md) names the discipline: an operational `SKILL.md` cites the theoretical `skill-record` it realizes; the theory cites operational instances as `examples/` witnesses. The [skill-to-theory-binding](../learning/questions/skill-to-theory-binding.md) question holds open how this binding should be realized in detail. The rubric counts a theory's operational bindings asymmetrically: theories that establish operational artifacts gain value by binding them; theories that are purely descriptive are not penalized for the absence of bindings they could not have.

## 10. Citation lineage and dependency soundness

A theory's value is finally read off the relation graph: every `depends-on:` resolves, every `realizes:` points at a concept, every `instantiates:` points at an object, the `depends-on:` subgraph is acyclic, and the renderer's topological sort produces a sound reading order. The [frontmatter-relations spec](../specifications/frontmatter-relations.md) is the canonical inventory of what each relation means and what it costs. A theory whose citation lineage is sound is *load-bearing* in the substrate's strict sense: other notes can depend on it without inheriting hidden cycles or dangling references. A theory whose citations dangle or cycle is not yet load-bearing, regardless of its content quality.

## What this rubric does *not* primitivize

The library does not treat the five Kuhnian disciplinary-matrix virtues — accuracy, consistency, scope, simplicity, fruitfulness, per the [disciplinary-matrix](../../../../../../../../../humanities/theories/philosophy/theories/western/theories/epistemology/terms/disciplinary-matrix.md) entry — as the rubric's primitives. The point is not that the virtues are wrong; it is that each one is already being read off something the substrate-level rubric has already named, so the virtues do not need to be carried as separate criteria. *Accuracy* is read off the substrate's settled-vs-contested behaviour that [knowing-as-settling](../../../../predicated-knowledge-systems/concepts/knowing-as-settling.md) and [assertion-monotonicity](../../../../predicated-knowledge-systems/theorems/assertion-monotonicity.md) already make observable. *Consistency* is read off the same machinery, in the form of $\top$-cell pressure under [federate](../../../../predicated-knowledge-systems/morphisms/federate.md). *Scope* is read off the citation-lineage and composability facets above, since the relation graph and the peer morphisms are what extend a theory's reach. *Simplicity* is read off the inheritance ledger that [what knowledge systems inherits](../../../../predicated-knowledge-systems/narratives/what-knowledge-systems-inherits.md) maintains. *Fruitfulness* is read off the open-work facet, since the [question-as-first-class spec](../specifications/question-as-first-class.md) is precisely what makes ripening from question to sketch to proof visible. The Kuhnian virtues remain real; the substrate just provides the prior observables, and the rubric points at those observables rather than restating the virtues as fresh criteria.

## What is held open

Two facets are under-articulated by their dependency on currently-open questions: facet 8 (communicative responsibility) waits on [audience-and-pragmatics-of-each-note-type](../learning/questions/audience-and-pragmatics-of-each-note-type.md); facet 1's gating threshold inherits the [knowledge-theory-as-explicit-layer](../learning/questions/knowledge-theory-as-explicit-layer.md) decision. The rubric judges itself by its own ten facets.
