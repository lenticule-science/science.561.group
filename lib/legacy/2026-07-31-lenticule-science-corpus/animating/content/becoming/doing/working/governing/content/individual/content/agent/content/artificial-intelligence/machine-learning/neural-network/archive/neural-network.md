---

title: "Neural Network"
description: "A computational model composed of layers of interconnected nodes (neurons) that learn to map inputs to outputs by adjusting connection weights during training — the substrate on which large language models are built."
defines: Neural Network
domain: artificial-intelligence
contains: transformer
enables: large-language-model
optimized-by: fine-tuning, rlhf
produces: embedding
date-created: 2026-03-29
---

A neural network is a computational model composed of layers of interconnected nodes (artificial neurons) that learn to approximate functions by adjusting the strengths (weights) of connections between nodes during training. Each node takes weighted inputs, applies a nonlinear activation function, and passes its output to nodes in the next layer. The network learns by comparing its output to a desired output, computing the error, and propagating that error backward through the layers to adjust weights — a process called backpropagation (Rumelhart, Hinton, and Williams, 1986).

The architecture of a neural network — how many layers, what type of connections, what operations each layer performs — determines what kinds of patterns it can learn. Feedforward networks pass information in one direction. Convolutional networks (LeCun et al., 1989) share weights spatially and excel at image recognition. Recurrent networks (Hochreiter and Schmidhuber, 1997) maintain hidden state across sequential inputs. The [transformer](./transformer.md) architecture (Vaswani et al., 2017) uses attention mechanisms to process sequences in parallel, and is the basis for all current [large language models](../../on-device-inference/terms/large-language-model.md).

The term "deep learning" refers to neural networks with many layers (typically dozens to hundreds). Depth allows the network to learn hierarchical representations — early layers learn simple features, later layers compose them into complex abstractions. The practical viability of deep networks depended on three developments: large training datasets (enabled by the internet), sufficient compute (GPUs repurposed from graphics to matrix multiplication), and algorithmic improvements (better initialization, normalization, and optimization techniques).

Neural networks learn by statistical optimization. A network trained on millions of text examples contains billions of numerical weights encoding statistical regularities in language — no hand-written rules about grammar or meaning. The network's behavior is difficult to interpret, it fails on inputs unlike its training data, and its capabilities emerge from scale. [Fine-tuning](./fine-tuning.md), [RLHF](./rlhf.md), and [tool use](theories/agents/terms/tool-use.md) all operate by modifying or leveraging these learned statistical patterns.

