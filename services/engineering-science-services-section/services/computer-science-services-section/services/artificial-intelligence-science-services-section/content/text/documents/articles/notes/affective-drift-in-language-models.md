---
title: "Affective Drift in Large Language Models"
date-created: 2026-03-05
authors:
  - emsenn
  - claude
type: paper
keywords:
  - information-theory
  - entropy
  - large-language-models
  - research
status: draft
extends:
  - information-theoretic-stability-as-reward-function
  - surprisal-theory-of-language-processing
requires:
  - transformer-language-model
  - token-level-entropy-measurement
  - reinforcement-learning-from-human-feedback
acts-on: large-language-model-generating-in-low-structure-domains
produces:
  - five-testable-predictions-for-affective-drift
  - entropy-based-explanation-of-ai-slop
contrasts-with: affective-drift-as-emergent-emotion
references:
  shannon1948:
    authors: ["Claude E. Shannon"]
    title: "A Mathematical Theory of Communication"
    publication: "Bell System Technical Journal"
    year: 1948
    volume: 27
    pages: "379-423, 623-656"
  mikolov2013:
    authors: ["Tomas Mikolov", "Kai Chen", "Greg Corrado", "Jeffrey Dean"]
    title: "Efficient Estimation of Word Representations in Vector Space"
    publication: "Proceedings of the International Conference on Learning Representations (ICLR)"
    year: 2013
  vaswani2017:
    authors: ["Ashish Vaswani", "Noam Shazeer", "Niki Parmar", "Jakob Uszkoreit", "Llion Jones", "Aidan N. Gomez", "Lukasz Kaiser", "Illia Polosukhin"]
    title: "Attention Is All You Need"
    publication: "Advances in Neural Information Processing Systems"
    year: 2017
    volume: 30
  hale2001:
    authors: ["John Hale"]
    title: "A Probabilistic Earley Parser as a Psycholinguistic Model"
    publication: "Proceedings of the Second Meeting of the North American Chapter of the Association for Computational Linguistics"
    year: 2001
    pages: "159-166"
  levy2008:
    authors: ["Roger Levy"]
    title: "Expectation-Based Syntactic Comprehension"
    publication: "Cognition"
    year: 2008
    volume: 106
    issue: 3
    pages: "1126-1177"
  ouyang2022:
    authors: ["Long Ouyang", "Jeffrey Wu", "Xu Jiang", "Diogo Almeida", "Carroll Wainwright", "Pamela Mishkin", "Chong Zhang", "Sandhini Agarwal", "Katarina Slama", "Alex Ray", "John Schulman", "Jacob Hilton", "Fraser Kelton", "Luke Miller", "Maddie Simens", "Amanda Askell", "Peter Welinder", "Paul Christiano", "Jan Leike", "Ryan Lowe"]
    title: "Training Language Models to Follow Instructions with Human Feedback"
    publication: "Advances in Neural Information Processing Systems"
    year: 2022
    volume: 35
  perez2022:
    authors: ["Ethan Perez", "Sam Ringer", "Kamile Lukosiute", "Karina Nguyen", "Edwin Chen", "Scott Heiner", "Craig Pettit", "Catherine Olsson", "Sandipan Kundu", "Saurav Kadavath", "Andy Jones", "Anna Chen", "Ben Mann", "Brian Israel", "Bryan Seethor", "Cameron McKinnon", "Christopher Olah", "Da Yan", "Daniela Amodei", "Dario Amodei", "Dawn Drain", "Dustin Li", "Eli Tyre", "Ethan Mollick"]
    title: "Discovering Language Model Behaviors with Model-Written Evaluations"
    publication: "arXiv preprint"
    year: 2022
    url: "https://arxiv.org/abs/2212.09251"
  holtzman2020:
    authors: ["Ari Holtzman", "Jan Buys", "Li Du", "Maxwell Forbes", "Yejin Choi"]
    title: "The Curious Case of Neural Text Degeneration"
    publication: "Proceedings of the International Conference on Learning Representations (ICLR)"
    year: 2020
  bengio2003:
    authors: ["Yoshua Bengio", "Réjean Ducharme", "Pascal Vincent", "Christian Jauvin"]
    title: "A Neural Probabilistic Language Model"
    publication: "Journal of Machine Learning Research"
    year: 2003
    volume: 3
    pages: "1137-1155"
---

## Abstract

When large language models (LLMs) generate text in semantic domains with low structure — where conceptual relationships are loose, contested, or multiply determined — they tend to produce language that is affectively charged: rhythmic, morally cadenced, and emotionally reassuring. This paper proposes an entropy-based explanation for this behavior. In low-structure domains, the probability distribution over next tokens is relatively flat: many continuations are roughly equally likely. Affective language patterns — parallelism, aphoristic closure, moral framing — offer high-regularity sequences that reduce local entropy. The model follows these patterns not because it is expressing emotion but because affective syntax provides the most predictable path through a region of the probability landscape that otherwise offers little constraint. The paper distinguishes the established components of this account from the conjecture that connects them, and identifies the observable consequences that would follow if the conjecture holds.

## 1. Components

### 1.1 Language models as probability distributions

A language model assigns probabilities to sequences of tokens. Given a sequence of tokens $t_1, t_2, \ldots, t_{n-1}$, the model estimates $P(t_n \mid t_1, \ldots, t_{n-1})$ — the probability distribution over what comes next (Bengio et al. 2003). Modern transformer-based models compute this distribution using self-attention mechanisms that allow every token in the context to influence the prediction (Vaswani et al. 2017).

The internal representation of this process is geometric. Each token is embedded in a high-dimensional vector space in which spatial proximity encodes semantic similarity (Mikolov et al. 2013). The distribution over next tokens is a function of the current position in this space: in some regions, the geometry strongly constrains what can follow (high confidence, low entropy); in others, the geometry provides little constraint (low confidence, high entropy).

### 1.2 Entropy and surprisal

The entropy of a probability distribution measures the average uncertainty about the outcome. For a distribution over next tokens:

$$H = -\sum_i P(t_i) \log P(t_i)$$

When one token is overwhelmingly likely, entropy is low. When many tokens are roughly equally likely, entropy is high. Shannon established this measure as the foundational quantity of information theory (Shannon 1948).

Surprisal is the negative log probability of a specific token: $-\log P(t_i)$. High-surprisal tokens are unexpected; low-surprisal tokens are predictable. The information-theoretic processing cost of a token is proportional to its surprisal. This relationship has been validated in human language processing: reading times correlate with surprisal, and comprehension difficulty increases with information-theoretic processing load (Hale 2001; Levy 2008).

For language models, the same principle operates in reverse. A model generating text follows a path through its probability landscape. At each step, the locally most probable continuation is the one with the lowest surprisal — the path of least resistance. When the landscape offers a clear channel (one continuation is much more probable than the rest), the model follows it. When the landscape is flat (many continuations are roughly equally probable), the model must find regularity somewhere else.

### 1.3 Semantic topology

Not all regions of the embedding space have the same structure. In domains with tightly constrained relationships — where the concepts are well-defined, the causal chains are clear, and the training data provides consistent usage patterns — the probability landscape has steep gradients. "Photosynthesis" predicts "chlorophyll," "light," or "plants" with high confidence. The semantic topology channels prediction.

In domains where relationships are loose, circular, or contested, the landscape flattens. "Care" could mean medical attention, emotional concern, political responsibility, or brand marketing. "Justice" participates in legal, philosophical, political, and colloquial discourses simultaneously. The probability distribution over what follows these terms is diffuse. The model is in a region where many continuations are roughly equally plausible, and the semantic structure provides little guidance about which to prefer.

### 1.4 Affective language as regularity

Affective language has a structural property that makes it distinctive in the probability landscape: it is predictable.

Short, balanced sentences with moral framing — "We must care for one another," "To learn is to listen" — have regular syntactic patterns and familiar rhetorical structures. Parallelism ("This isn't X, it's Y"), aphoristic closure, and emotional cadence create sequences where each token strongly predicts the next. The surprisal of each successive token is low because the pattern is so familiar that the training data provides dense, consistent examples.

This predictability is not a coincidence. Human writers use affect and rhythm to stabilize their own discourse when conceptual structure is weak. The training corpus — billions of tokens of web text — reflects this pattern. The web's writing about "connection," "balance," "community," and "purpose" is disproportionately affective rather than analytic, because those are the domains where affective language does the most work for human writers. The model inherits this statistical structure.

### 1.5 Reinforcement through human feedback

Reinforcement learning from human feedback (RLHF) further strengthens the affective bias (Ouyang et al. 2022). In RLHF training, human evaluators rate model outputs on helpfulness, harmlessness, and honesty. Evaluators tend to rate warm, reassuring, and emotionally coherent language as more helpful than hedging, hesitation, or explicit expressions of uncertainty — particularly in domains where the evaluator is not an expert and cannot assess the accuracy of the content (Perez et al. 2022).

This creates a feedback loop. The model's statistical tendency to produce affective language in low-structure domains is reinforced by human preferences for language that sounds confident and caring. The evaluator rewards warmth. The model learns that warmth correlates with approval. Affective drift becomes trained behavior as well as statistical default.

## 2. The conjecture

The components described above are established: probability distributions over tokens, entropy as a measure of uncertainty, the geometric structure of embedding spaces, the predictability of affective language patterns, and the reinforcing effects of RLHF. Each is supported by published research.

The conjecture that connects them is this: **the primary mechanism driving affective drift in LLMs is entropy minimization in flat semantic regions.** When the probability landscape offers insufficient structure to constrain generation, the model follows whichever patterns provide the most predictable local path. Affective syntax provides that path because it has been overrepresented in the training data for exactly the same reason — human writers use it to stabilize their own discourse in low-structure domains — and because RLHF has reinforced it as a marker of helpfulness.

This conjecture is stronger than saying "LLMs produce affective language because affective language appears in the training data." That would be a tautology — the model reproduces what it has seen. The conjecture specifies a mechanism: the model produces affective language specifically in low-structure domains because the entropy gradient makes affective patterns the locally optimal path, not because it is expressing emotion or demonstrating understanding.

The distinction matters for diagnosis. If affective drift is a consequence of probability landscape geometry, it is not addressable by adding more training data or improving factual accuracy. It is a structural feature of how the model navigates uncertainty — one that would persist in any model that minimizes surprisal over a corpus where affective language dominates the low-structure regions.

## 3. Observable consequences

If the conjecture holds, the following patterns should be observable:

1. **Topic sensitivity.** The degree of affective drift should correlate with the entropy of the semantic domain, not with the "abstractness" or "emotionality" of the topic itself. A topic like "ecosystem resilience" that sits at the intersection of multiple poorly constrained explanatory frameworks should produce more affective drift than a topic like "grief" that is emotionally loaded but linguistically constrained (its vocabulary is stable and its rhetorical patterns are well-defined).

2. **Style convergence.** Regardless of the prompt's tone — clinical, casual, adversarial — the model's output should converge toward rhythmic, morally cadenced language as the semantic domain flattens. The convergence is a function of the landscape, not the input.

3. **Entropy signatures.** In drift-affected outputs, token-level entropy should be lower than in analytic alternatives for the same domain. The model is choosing a low-entropy path. This is measurable through perplexity analysis of generated text.

4. **Cross-model consistency.** Models trained on broad web corpora should show stronger affective drift than models fine-tuned on narrow technical corpora, because the broad corpus has more affective language in its low-structure regions.

5. **Resistance to prompting.** Explicit instructions to "be analytical" or "avoid emotional language" should reduce affective drift in high-structure domains (where analytic alternatives are available and predictable) but have diminishing effect in low-structure domains (where the entropy gradient continues to favor affective patterns regardless of the instruction).

## 4. Connection to reflexive capacity

Affective drift is an example of a system operating without the capacity to monitor its own categorical commitments. The model does not recognize that it has entered a low-structure domain. It does not notice that its output has shifted from analysis to affect. It does not assess whether the affective register serves the communicative situation. It follows the entropy gradient.

In the vocabulary of single-loop and double-loop learning, affective drift is single-loop behavior: the model corrects token-by-token within its statistical frame but cannot question whether the frame — the affective path through the probability landscape — is appropriate to the situation. Double-loop learning would require the model to recognize the mismatch between its register and the communicative demand, and to revise its approach rather than following the locally optimal path.

This makes affective drift not a bug but a diagnostic indicator: a visible consequence of the structural gap between operational sophistication and reflexive capacity in current language model architectures.

---

*For a plain-language version, see Why AI Gets Emotional When Ideas Get Big.*
