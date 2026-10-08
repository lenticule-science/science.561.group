---
type: reference
class: academic
status: cited
authors: [Schick, Timo, Dwivedi-Yu, Jane, Dessì, Roberto, Raileanu, Roberta, Lomeli, Maria, Zettlemoyer, Luke, Cancedda, Nicola, Scialom, Thomas]
year: 2023
title: "Toolformer: Language Models Can Teach Themselves to Use Tools"
venue: "Advances in Neural Information Processing Systems 36 (NeurIPS 2023)"
description: T.
---

## Source

T.
Schick, J.
Dwivedi-Yu, R.
Dessì, R.
Raileanu, M.
Lomeli, L.
Zettlemoyer, N.
Cancedda, T.
Scialom.
"Toolformer: Language Models Can Teach Themselves to Use Tools."
In *Advances in Neural Information Processing Systems 36 (NeurIPS 2023)*. arXiv:2302.04761.

## Form

Conference paper.
The load-bearing reference for *learned* tool use in language models, demonstrating that an LLM can be fine-tuned to call external tools (calculator, calendar, search engine, translation API, Q&A system) at appropriate points in its generation.

## Content summary

Demonstrates that a pre-trained language model can be fine-tuned, using a self-supervised data-generation procedure, to insert tool-call markers into its output at points where the tool's output reduces the model's perplexity on subsequent tokens.
The data-generation procedure: (i) for each candidate tool position in a corpus document, sample candidate API calls from a few-shot-prompted version of the model; (ii) execute the candidate calls; (iii) keep API calls whose results, when inserted into the document, reduce the model's loss on subsequent tokens.
The model is then fine-tuned on the resulting tool-augmented documents, learning *when* to call each tool, *what* arguments to pass, and *how* to use the result.
The paper shows that Toolformer-fine-tuned models substantially outperform their non-fine-tuned base on tasks where tool calls are appropriate, with no loss on tasks where they are not.
Toolformer became the canonical reference for *self-trained* LLM tool use.
