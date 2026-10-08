---
name: Natural Language Inference
description: The task of classifying a (premise, hypothesis) sentence pair as entailment, contradiction, or neutral, established at scale by the SNLI (Bowman et al. 2015) and MultiNLI (Williams et al. 2018) corpora and shown by Gururangan et al. (2018) to carry annotation artifacts that let a hypothesis-only classifier recover the correct label most of the time, a brittleness this glossary treats as load-bearing for any verification gate that uses NLI as its entailment check.
date-created: 2026-08-22
aliases: ["NLI", "textual entailment", "recognizing textual entailment"]
instance-of: evaluation-metric
---

Natural language inference (NLI) is the task of labeling a hypothesis sentence as entailed by, contradicted by, or neutral with respect to a premise sentence.
Bowman et al. introduced SNLI, 570k human-written English pairs labeled by Mechanical Turk workers given an image-caption premise, at a scale two orders of magnitude larger than prior textual-entailment corpora, which is what first made large-scale neural NLI training practical.
Source: [Bowman et al., "A Large Annotated Corpus for Learning Natural Language Inference," EMNLP 2015](https://aclanthology.org/D15-1075/).
Williams et al. extended the same annotation protocol across ten genres of spoken and written English as MultiNLI (433k pairs), built specifically to test cross-genre generalization.
Source: [Williams et al., "A Broad-Coverage Challenge Corpus for Sentence Understanding through Inference," NAACL 2018](https://aclanthology.org/N18-1101/).

NLI classifiers are the component that FEVER-style retrieve-then-verify architectures and reference-conditioned faithfulness metrics both use to decide whether a claim is supported by retrieved or source text.
That reliance carries a documented risk: Gururangan et al. show the crowd-sourced elicitation protocol behind SNLI and MultiNLI leaves artifacts in the hypothesis alone, letting a hypothesis-only classifier (no premise access at all) recover the correct label in roughly 67% of SNLI and 53% of MultiNLI cases, via cues such as negation and vagueness words correlating with specific labels.
Source: [Gururangan et al., "Annotation Artifacts in Natural Language Inference Data," NAACL 2018](https://aclanthology.org/N18-2017/).
For a claim-verification gate, this means an NLI model's "entailment" output can be correct for a reason unrelated to whether the premise (retrieved evidence) actually supports the hypothesis (the claim) — a failure mode a per-claim conformance layer must design against rather than assume away.

See the fuller discussion in the [study of claim extraction and grounded generation engineering](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-claim-extraction-and-grounded-generation-engineering.md), Section 3.
