---
name: entity-as-model
description: "The framing under which a FARS entity is read as a model in the model-theoretic sense — a structure that assigns values to predicates — and the inference primitive respond is read as consequence under that model."
type: concept
class: framing
depends-on: [predication-fiber, substrate-value-domain, settling-as-computation]
see-also: [respond, fiber, frontmatter-as-presentation]
title: entity-as-model
---

# Entity as model

The framing under which a FARS entity is read as a *model* in the model-theoretic sense — a structure that assigns values to predicates — and the inference primitive [`respond`](../code/transformers/respond.md) is read as *consequence* under that model.
An entity's interpreted [fiber](../code/structures/fiber.md) is the model's content: each cell is the model's commitment about one predicate.
A message arriving at the entity is a query (or an extension); the entity's response is what the model concludes about the query under the [substrate's value-domain](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/substrate-value-domain.md) algebra.

The framing is *adjacent to* but *distinct from* the [settling-as-computation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settling-as-computation.md) framing the parent theory commits to.
Settling-as-computation reads the substrate as Curry-Howard: programs are predications, types are predicates, normalization is settling.
Entity-as-model reads the same machinery as Tarski-style logical inference: structures are entities, satisfaction is fiber values, consequence is composition under $\odot \dashv \Rightarrow$.
The two readings characterize the same underlying operations; they emphasize different operational handles.
Settling-as-computation handles *how the substrate advances*; entity-as-model handles *what an entity says about a question*.

## The reading

Three correspondences make the model-theoretic reading precise:

- **Entity as structure.** A FARS entity, after interpretation, is a function from the substrate's predicate vocabulary to substrate-value-domain elements.
  This is the model-theoretic content of "structure": an assignment of values to relation symbols, with the algebra's adjunction supplying the rules under which the assignment composes.
  Two entities with byte-identical fibers are the same model; an entity whose fiber is missing a predicate has $\bot$ as its commitment, not silence.

- **Message as query (or extension).** An incoming message is itself an interpretable note (or, for synthesized messages, a directly-built fiber).
  When the message's predicates already have values in the entity's fiber, the message is a *query* — the algebra computes whether the entity's commitments restrict to (or compose with) the message's commitments.
  When the message carries predicates the entity does not yet hold, the message is an *extension* — the algebra produces a richer fiber that the entity may absorb on its next [tick](../../teaching/explanations/tick.md).

- **Response as consequence.** The output of [`respond`](../code/transformers/respond.md) is the fiber the model concludes when extended by the message and saturated to fixed-point under the substrate's [closure rules](../../../../teaching/explanations/closure-rule.md).
  This is the value-domain analog of "consequence" — what the model entails given the message, where the value-domain's $\bot$/$t$/$f$/$\top$ structure replaces classical logic's two-valued entailment with paraconsistent inference that surfaces partial information and contradiction explicitly.

## Why this framing earns its keep in FARS

FARS's distinguishing claim is that inference over a corpus of human-authored entities is a *first-class* operation — not a search-engine query, not a database join, not a vector similarity.
The model-theoretic framing names what it is instead.
An entity's fiber is its commitment-set; the algebra is its inference engine; the response is its conclusion.
The framing makes the four-valued bilattice's role legible: $\bot$ responses mean "the model has no commitment about this," $t$ responses mean "the model concludes affirmatively," $f$ responses mean "the model concludes negatively," $\top$ responses mean "the model holds contradictory commitments and cannot resolve them under the current closure rules."

A consequence: enriching an entity (adding frontmatter predicates, completing a body, citing relations to other entities) is *training the model* — strengthening its commitments so future responses are richer.
A FARS corpus's inference quality scales with predicate density per entity, predicate vocabulary alignment across entities, and the presence of closure rules that compose commitments across entity-relation chains.
None of this is hidden in operator code; all of it is substrate content the corpus author edits.

## What this is not

- **Not Tarski semantics imported wholesale.** The model-theoretic reading is structural, not literal.
  A Tarski model is a set with relations defined classically; an entity-as-model is a fiber with relations defined over a four-valued bilattice.
  The adjunction $\odot \dashv \Rightarrow$ does the work classical entailment does in Tarski, but with paraconsistent values the classical setting forecloses.
- **Not a language model.** The framing's "model" is logical, not statistical.
  There are no parameters trained by backpropagation, no probability distributions, no soft outputs.
  A response is determined by the substrate's algebra acting on the entity's fiber and the message's fiber; the same inputs produce the same output, byte-for-byte.
- **Not a substitute for [settling-as-computation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settling-as-computation.md).** The two framings are *both* applicable to FARS; they are tools for thinking about different aspects of what the substrate is doing.
  A reader who finds one framing more legible may use it; the substrate's behavior is the same under either.

## Position

Entity-as-model is FARS-specific in that it characterizes how FARS is meant to be *read by its users* — as an inference engine over a model corpus.
The framing does not introduce new substrate machinery; everything it names is already in [substrate-value-domain](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/substrate-value-domain.md), [predication-fiber](../../../../teaching/explanations/predication-fiber.md), and [settling-as-computation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settling-as-computation.md).
Entity-as-model is the operational face FARS presents to a corpus author: *write entities as commitments; ask them questions; the answers compose under the algebra*.
