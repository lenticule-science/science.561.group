---
name: prose for ai agents must state not gesture
description: When prose is injected into an AI agent's context window, transformer attention can only aggregate facts that are present in the context — there is no runtime equivalent of human lookup from long-term memory, so gesture-text (labels without statements, prestige tokens, nominalized verbs) leaves the agent with nothing to use and it falls back to training priors that may diverge from the project's facts. The unit of useful prose for AI agents is therefore the positive falsifiable statement — an entity-property assertion concrete enough to act on and refutable by inspection — composed under derived style rules (state-don't-reference, define-before-use, ground-in-training-data-scaffold, one-fact-per-sentence, prefer-the-falsifiable-form, eliminate-prestige-tokens, show-don't-claim, anaphora-is-hazardous).
title: prose for ai agents must state not gesture
---

When a human reads expository prose, the unread parts of the world come along for the ride. Implicit knowledge — what a Heyting algebra is, what "category theory" indexes, what kind of move "an identification has been proved" usually involves — sits in the reader's long-term memory, where it can be retrieved by lookup. The writer relies on this. A sentence like "predication category theory, wolakhota, and dialectics are proved identifications" works for a reader who already knows what each term names, has heard each one before, and can imagine in roughly which sense three such things might be "identified."

For an AI agent based on a large language model, none of this background is retrievable at runtime in the same way. The agent has parameters from training that encode broad facts (standard category theory, common philosophical terminology, public Lakota vocabulary), and it has a finite context window that holds whatever was injected for this session. Between these two stores, there is no third store. There is no "look it up" at runtime that resembles human consultation of long-term memory. The agent will produce text — and act, since its outputs include tool calls — using only what attention can reach in the context plus what has been compiled into the weights.

This changes the discipline of writing. Prose for AI agents is not prose-the-author-reads-and-the-agent-imitates. It is the configuration of the only writeable channel into the agent at runtime. Whatever doesn't make it into context cannot be used, except by accident through prior knowledge. Whatever does make it in is either crisp enough to be usable by attention or smeared enough to be merely decorative. The difference is mechanical and measurable.

## How transformers read

A transformer LLM processes a sequence of tokens. At each layer, multi-head attention computes, for every position $n$, a weighted sum of value vectors from positions $1$ through $n$ (under the causal mask), with weights given by the softmax of query-key dot products: $\mathrm{Attn}(Q,K,V) = \mathrm{softmax}(QK^\top / \sqrt{d_k})\, V$. The residual stream accumulates these contributions across layers, so the activation at a late position is a structured aggregation of features computed from earlier ones.

The property that matters for writers is that only what is present in the context can be aggregated by attention. Tokens not in the context contribute nothing. A query at decoding time looks for keys matching its current need; if the context contains a label but no statement attached to that label, the query retrieves the label and stops. The model then either confabulates a continuation from its priors, or emits a generic placeholder, or refuses.

Recent characterizations sharpen this picture. Olsson et al. (2022) trace much of in-context learning to *induction heads* — attention patterns that find a previous occurrence of the current token and copy its successor. Von Oswald et al. (2022) and Akyürek et al. (2023) show that the transformer forward pass can implement gradient-descent-like updates over examples present in context: the model is, in effect, *fitting* the context, not merely recalling it. Injected prose is therefore not background decoration. It is data the model meta-learns on, in a single forward pass, every turn.

If the context is dense with falsifiable statements that tightly constrain a small region of hypothesis space, the model's effective fit lands in that region. If the context is full of gestures — labels without statements, claims without specifics, prestige tokens without falsifiable content — the model's fit is loose, and it falls back to whatever its priors say is most likely. For research projects whose facts *diverge* from training-data priors, falling back to priors is catastrophic. The project-specific facts must be explicitly carried by the context, or they are not present.

## The failure mode: gesture-text

Consider the sentence "Predication category theory, wolakhota, and dialectics are proved identifications." Parsed by an LLM, this sentence supplies three terms (one familiar from training, two not), a verb ("proved"), and a vague noun ("identifications"). What it does not supply: what the identification is (a categorical equivalence? an isomorphism of presheaves? a forgetful functor with a section? a bisimulation?); what the objects on each side are; what the proof shows; where the proof lives. When the agent later needs to *use* this fact — to decide, say, whether a wolakhota concept should be expressed as a predicate in a `code/structures/` entry — there is nothing concrete for attention to retrieve. The agent falls back to a generic prior about what "identifications" typically mean in mathematics, which may or may not be right for this project.

This is gesture-text: prose that names facts without stating them. Gesture-text is the dominant failure mode in expository writing produced by humans who are themselves steeped in a project. The terms feel sufficient because the writer's own implicit knowledge fills the gaps. For the agent, there is nothing to fill the gaps with.

Gesture-text is recognizable. Diagnostic markers include nominalized verbs ("identification," "realization," "settlement") that absorb the actual verb of the sentence; prestige tokens ("rigorous," "lawful," "sophisticated") that perform seriousness without carrying content; bare proper nouns standing in for facts; lists of terms joined by conjunctions where the relations between them are left implicit; modal hedges ("may," "can be viewed as," "is in some sense") that defer commitment.

## Positive falsifiable statements as the unit of useful writing

A *positive falsifiable statement* asserts that an entity has a property, where both entity and property are concretely meaningful and the assertion could in principle be refuted by inspection. "The predicate-bilattice $A_p$ has the four-valued truth set $\{\mathbf{t},\mathbf{f},\bot,\top\}$ with knowledge order $\bot \leq_k \mathbf{t}, \mathbf{f} \leq_k \top$" is such a statement: one can write down the structure and check whether the claim holds.

The information-theoretic argument is direct. Useful injected text maximizes the mutual information between the context and the agent's downstream decisions in the project's relevant directions. Positive falsifiable statements concentrate that mutual information — each statement carves a definite region out of hypothesis space and tells the agent which side of the boundary it sits on. Gestures spread mutual information thinly, often touching the wrong axes (signaling "something serious is happening" rather than narrowing *what* the something is).

A useful auxiliary rule: every load-bearing sentence should be such that someone could disagree with it. Disagreement requires a position. A position has shape. Shape is what attention can latch onto.

## Style guide derivations

From the mechanics above, a working style for context-injected prose:

**State, don't reference.** If a fact is load-bearing for the agent's work, state the fact in the context. Cite the path to the proof for human auditing, but do not assume the agent will load the citation. Inline the fact in the form the agent will need at decoding time.

**Define before use.** A novel term must be defined the first time it appears in the context. The definition is what attention will retrieve when the term is used downstream.

**Ground in training-data scaffold.** Use familiar mathematical or technical vocabulary as load-bearing structure ("a nucleus on a Heyting algebra," "a fibration with base $B$ and fibers $F_b$") and attach project-specific content to those scaffolds. The model has a real understanding of Heyting algebras, fibrations, and nuclei; it has none of nine novel project terms in a row. Project-specific facts ride for free on training-data competence when grounded this way.

**One fact per sentence.** Sentences with multiple unrelated claims diffuse the attention signal. Sentences with a single clear claim concentrate it. Multi-clause sentences are fine if the clauses are causally or definitionally linked.

**Prefer the falsifiable form.** "Wolakhota is a recognition relation $r: P \times Q \to \mathbf{R}$ between two personnel, where $\mathbf{R}$ is the bilattice of attestation states and $r(p,q) = \mathbf{t}$ iff both $p$ and $q$ have witnessed each other's standing in the relevant cell" is usable; "wolakhota is a kinship relation" is not.

**Eliminate prestige tokens.** Strike "rigorous," "comprehensive," "first-class," "principled," "sophisticated" unless they carry technical meaning. They cue performative seriousness without carrying information; in an agent's context they are noise that consumes positions in a finite window.

**Show, don't claim.** Instead of "we have proved $X$ is equivalent to $Y$," write the equivalence: "the functor $F: \mathbf{C} \to \mathbf{D}$ sending $a \mapsto \phi(a)$ is full, faithful, and essentially surjective; therefore $\mathbf{C} \simeq \mathbf{D}$." If the proof itself is too long for the context, give the *form* of the equivalence and the witness path; do not assert it in the abstract.

**Anaphora is hazardous.** A pronoun or definite description ("the latter," "this property") forces attention to resolve a reference. If the antecedent is unambiguous and recent, fine. Otherwise, repeat the noun. The cost in style is small; the cost of mis-resolution at runtime is large.

## The recursive case

This essay is itself context-injected prose for an agent that will later edit the very files the essay is teaching how to write. The recursion is the point: the agent must learn the style well enough to rewrite the project's context files to comply with it, without producing a new round of gesture-text in the process. The discipline is therefore self-evaluating. After each draft of a project context file, ask: which sentences here are positive and falsifiable? Which are gestures? If the answer is "I cannot tell, because the facts these sentences point at are not in my context," the prose is failing — and the remedy is not to apologize but to inject the facts into the context until the prose can be evaluated.

For the 561 Group's platform specifically: the character surface files, and the project-level facts they reference, must be rewritten until every load-bearing claim is stated in falsifiable form. The mathematical identifications the project relies on are not "proved identifications" in the prose; they are specific structural equivalences with specific witnesses, and the prose must carry those — or carry pointers to short, model-readable statements of them. Anything less is decoration that consumes context budget while teaching the agent nothing it can use.
