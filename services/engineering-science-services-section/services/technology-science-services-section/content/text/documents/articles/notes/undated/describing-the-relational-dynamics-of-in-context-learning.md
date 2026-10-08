---
id: 089457e8-b571-4bbc-84d9-9c9444d75fca
title: The Relational Dynamics of In-Context Learning
description: "In 2025, David Dherin and other researchers at Google's DeepMind released a study titled /Learning Without Training: The Implicit Dynamics of In-Context Learning/.[cite:@dherinlearning2025]"
aliases:
  - The Relational Dynamics of In-Context Learning
  - The relational Dynamics of In-Context learning
  - describing-the-relational-dynamics-of-in-context-learning
  - the relational dynamics of in-context learning
visibility: public
date-created: 2025-10-05
type: essay
author: emsenn
---

# [The Relational Dynamics of In-Context Learning](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/document-body.md) {#the-relational-dynamics-of-in-context-learning-1}

In 2025, David Dherin and other researchers at Google's DeepMind released a study titled *Learning Without Training: The Implicit Dynamics of In-Context Learning*.\[cite:@dherin_learning_2025\]

Their goal was to answer a question familiar to anyone who has used a large language model like GPT:

Why does the model seem to learn from a few examples, even though it is not being retrained?

When you show GPT a pattern, like a list of questions and answers, or a style of writing, it quickly begins to follow that pattern. No permanent update is made to the model, yet its behavior changes in meaningful ways. Dherin et al. set out to explain this apparent learning.

Their findings help clarify what “context” means inside the model and why good prompts matter more than most people realize.

## What the researchers found

Modern language models are built from repeating layers, each containing two key parts:

1.  Self-attention, which allows every token (word or symbol) to look at every other token and decide which ones matter for predicting the next word; and
2.  A feed-forward network, technically a multi-layer perceptron or MLP, which transforms those attention patterns into richer internal representations.

The DeepMind team showed that these two parts don’t simply operate in sequence. Instead, the attention mechanism actively modulates the MLP that follows it. They write:

> “Stacking a self-attention layer with an MLP allows the transformer block to implicitly modify the weights of its MLP sublayer, conditioned on the context.”

In plain language, the attention layer changes the inputs reaching the MLP in such a structured way that, for the duration of the prompt, the MLP behaves *as if its weights had been slightly updated*.

This effect can be described mathematically as a low-rank perturbation: a temporary, small-scale adjustment in how the MLP combines information.

The model’s parameters remain fixed, but the pattern of activation inside them shifts. The authors call this process an implicit dynamic, because learning happens within the model’s moment-to-moment activity rather than through explicit retraining.

In practice, this means that a GPT model “learns” from a prompt by reorganizing how its internal layers talk to each otherThe pattern of your words becomes a scaffold that temporarily reshapes the flow of computation.

## Why this matters for users

This discovery confirms that prompting is not a trick or an art form detached from science—it is literally the way the model learns in real time. Your prompt defines the context that drives those internal modulations. Coherent prompts create coherent modulations; fragmented prompts create unstable ones.

For everyday GPT users, this has straightforward consequences:

- The first few sentences of a prompt are decisive—they establish the field of relationships that the attention layers will follow.
- Consistent structure, vocabulary, and tone reinforce the same internal configuration.
- Abrupt topic shifts or conflicting instructions break the configuration, forcing the model to re-establish a new one.

In other words, your prompt does not feed the model new information. It tunes the model’s existing information into a temporary form suitable for the task at hand. The better the tuning, the more reliable the results.

## How to apply these insights

If prompting reshapes computation through relationships, then effective prompting is about building those relationships intentionally. The research suggests five concrete practices:

- Start with purpose and role.
  - Give the model a clear identity and goal before adding detail:
    - “You are a civic analyst summarizing a scientific paper for a public audience.”
  - This establishes a consistent frame of reference for the attention mechanism.
- Provide relational examples.
  - Show the model how inputs and outputs connect, not just what they are.
  - Example pairs teach structure faster than description alone.
- Use repetition to reinforce stability.
  - Because the internal modulation is low-rank (simple but strong) repeating key terms or formats helps the model sustain the same configuration.
- Keep one topic per conversation.
  - When you change domains, begin a new chat. Each field of discussion generates its own internal alignment.
- Treat tone and pacing as part of structure.
  - The rhythm of your sentences and the emotional stance of your language shape the distribution of attention as much as factual content does.

These habits directly correspond to how the model’s layers compute meaning.

## Relational dynamics: a compatible framework for prompting

The findings of Learning Without Training point toward a simple but powerful conclusion: **prompting works because the model organizes itself through relations**.

This makes the scientific results directly compatible with the framework known as relational dynamics: a way of understanding intelligence as the stabilization of relationships within a field rather than the storage of static rules.\[cite:@emsenn_introducing_relational_dynamics_2025\]

In relational dynamics, coherence emerges from ongoing interaction: each element continually adjusts to others until a momentary equilibrium (a closure) is reached. Dherin et al. describe the same pattern inside GPT: attention distributes relations, the MLP stabilizes them: together they produce a temporary, coherent mode of reasoning.

Based on this research, it is indicated that using the paradigm of relational dynamics to structure your custom prompts will be successful.

The model’s internal mechanics already operate according to relational principles, so prompts written in that language - defining clear relationships, contexts, and roles—align naturally with how the system learns.

For example, instead of saying “Tell me about water shortages," a relational prompt might say:

> “You're a teacher, teaching me about water shortages; I'm asking because I've heard cliamte change might cause them."

This version describes the network of relations (teacher → teaching → topic → user knowledge). That relational framing gives the model a structure its attention layers can mirror, improving relevance and coherence.

Relational dynamics therefore provides a scientifically grounded vocabulary for custom GPT instructions.

It allows both individual users and organizations to describe their aims in terms that match the model’s internal logic: fields, relations, and closures rather than static directives. Adopting this vocabulary can improve accuracy, reduce drift, and make AI systems more transparent to human collaborators.

## Broader implications

Understanding implicit dynamics changes how we think about intelligence itself. The boundary between human and machine learning begins to blur: both adapt through changing how they're thinking about things in-the-moment, not only through formal lessons and training.

Every prompt, like every conversation, creates a temporary order of understanding. When we design those fields carefully, through clarity, respect, and coherence, we can help both kinds of intelligence, human and artificial, learn more wisely.

<div id="refs">

</div>

# [resource code](../../../../../../../../../philosophy-services-section/content/text/glossary/terms/resource-code.md)

## [BibTex entry](../../../../../../../computer-science-services-section/content/text/glossary/terms/bibtex-entry.md)

``` {.bibtex canonical="yes"}
  @online{emsenn_relational_dynamics_context_learning_2025,
  author       = {emsenn},
  title        = {The Relational Dynamics of In-Context Learning},
  year         = {2025},
  url          = {https://emsenn.net/the-relational-dynamics-of-in-context-learning},
}
```

\## Earlier material

\<div id="refs"\>

\</div\>

In 2025, David Dherin and other researchers at Google's DeepMind released a study titled *Learning Without Training: The Implicit Dynamics of In-Context Learning*.(NO_ITEM_DATA:dherin_learning_2025)
