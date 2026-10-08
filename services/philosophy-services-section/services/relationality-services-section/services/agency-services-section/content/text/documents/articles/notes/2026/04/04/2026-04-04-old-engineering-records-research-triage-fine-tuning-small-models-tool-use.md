---
name: fine-tuning-small-models-tool-use-2026
description: "Survey of parameter-efficient fine-tuning methods, benchmark performance, available datasets, cost structures, and recent papers for training 1B-7B models on function calling and tool use."
date-created: 2026-04-04
source-type: web-research
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: fine-tuning-small-models-tool-use-2026
---

## Executive Summary

As of April 2026, fine-tuning small language models (1B-7B parameters) for agentic tool use has matured into a well-supported domain with clear economic advantages, benchmarking standards, and multiple open-source datasets. The state of the art shows:

1. **Parameter-efficient fine-tuning (QLoRA)** reduces costs by 10-20x compared to full fine-tuning
2. **Multiple high-quality datasets** exist specifically for function calling: ToolACE, glaive-function-calling-v2, and Gorilla OpenFunctions
3. **Small models can match or exceed large model performance** on tool use with proper fine-tuning (77.55% pass rate on ToolBench)
4. **Cost per run** is now as low as $1,500-3,000 for training a 7B model, versus $50,000 for full fine-tuning
5. **BFCL (Berkeley Function Calling Leaderboard)** provides standardized evaluation across models and remains the primary benchmark

---

## 1. Parameter-Efficient Fine-Tuning Methods

### QLoRA (Quantized Low-Rank Adaptation)

QLoRA combines 4-bit quantization with low-rank adaptation, enabling efficient fine-tuning of billion-parameter models on consumer hardware.

**Memory and Speed Characteristics:**
- Reduces memory by 75% vs 16-bit fine-tuning
- Requires roughly 70% less VRAM than full fine-tuning
- Single A100 80GB can handle 70B models (vs 7B models with full fine-tuning)
- Enables training on RTX 4090 (24GB VRAM) for 7B models

**Architecture:**
- Base model quantized to 4-bit precision
- Trainable LoRA adapters added (typically rank 64, alpha 16)
- ~0% accuracy degradation compared to full fine-tuning (when using Unsloth backend)

### MoRAgent: Mixture-of-Roles (ICML 2025)

Recent innovation decomposing agent capabilities into three specialized roles:
- **Reasoner**: Planning and decision-making
- **Executor**: Tool invocation and action
- **Summarizer**: Result synthesis and reflection

Uses three independent LoRA groups (one per role) for modular optimization. Presented at ICML 2025.

### Other PEFT Methods in Use (2025)

- **DoRA (Distributed Low-Rank Adaptation)**
- **Spectrum**: Spectrum-based parameter-efficient adaptation
- Standard **LoRA**: 2x faster than full fine-tuning but requires ~20GB VRAM for 7B models

**Key insight from research:** Parameter-efficient methods exhibit favorable generalization due to implicit regularization from constrained optimization space — modifying only a small number of parameters acts as a regularizer preventing overfitting.

---

## 2. Available Datasets for Fine-Tuning

### ToolACE (2024-2025)

**Overview:** Automatic agentic pipeline generating accurate, complex, and diverse tool-learning data.

**Dataset size and structure:**
- 26,507 diverse APIs in the API pool
- High-quality dialogs generated through multi-agent interplay
- Includes rule-based and model-based verification layers for accuracy

**Performance on BFCL:**
- 8B-parameter models fine-tuned on ToolACE achieve state-of-the-art performance rivaling GPT-4
- Excels at mitigating hallucination: 85.37% relevance score, 83.81% irrelevance score
- Consistent scaling behavior across model sizes

**Availability:** [Hugging Face - Team-ACE/ToolACE](https://huggingface.co/datasets/Team-ACE/ToolACE)

**Citation:** Published at ICLR 2025. arxiv:2409.00920

### Glaive Function Calling V2

**Overview:** Widely-used function calling dataset from Glaive.

**Dataset characteristics:**
- 52,000+ samples covering function calling scenarios
- Includes samples with zero, single, and multiple function invocations
- Balanced to include non-invocation cases
- Multi-purpose design for different function calling task variants

**Current use:** Primary dataset for models like Granite-20B-FunctionCalling and other open-source function-calling models.

**Availability:** [glaiveai/glaive-function-calling-v2 on Hugging Face](https://huggingface.co/datasets/glaiveai/glaive-function-calling-v2)

### Gorilla OpenFunctions

**Overview:** Retriever-aware fine-tuning dataset derived from APIBench.

**Dataset composition:**
- **APIBench**: 1,645 API calls across HuggingFace, TorchHub, TensorHub
- **OpenFunctions v2**: 65,283 question-function-answer pairs from:
  - Python packages (19,353 pairs)
  - Java repositories (16,586 pairs)
  - JavaScript repositories (4,245 pairs)
  - Public APIs (6,009 pairs)
  - Command-line tools (19,090 pairs)

**Language support:** Python, Java, JavaScript, REST API, and multiple parallel function calls.

**Format:** Self-instruct generated instruction-API pairs, converted to user-agent chat-style conversations.

**Availability:** [gorilla-llm/Berkeley-Function-Calling-Leaderboard on Hugging Face](https://huggingface.co/datasets/gorilla-llm/Berkeley-Function-Calling-Leaderboard)

### Berkeley Function Calling Leaderboard (BFCL) Dataset

**Overview:** Real-world evaluation dataset underlying the BFCL benchmark.

**Evaluation approach:**
- Abstract Syntax Tree (AST) evaluation method
- Serial and parallel function calls
- Multi-language support
- Scales to thousands of functions

**Update frequency:** Periodic updates (v4 current as of April 2026)

**Availability:** [Hugging Face BFCL Dataset](https://huggingface.co/datasets/gorilla-llm/Berkeley-Function-Calling-Leaderboard)

---

## 3. Recent Papers on Small Model Fine-Tuning for Tool Use (2024-2026)

### "Small Language Models for Efficient Agentic Tool Calling: Outperforming Large Models with Targeted Fine-tuning" (December 2025)

**Key finding:** Fine-tuned SLM achieved 77.55% pass rate on ToolBench evaluation, significantly outperforming baseline models:
- ChatGPT-CoT: 26.00%
- ToolLLaMA-DFS: 30.18%
- ToolLLaMA-CoT: 16.27%

**Method:**
- Base model: facebook/opt-350m (350M parameters)
- Tool: Hugging Face TRL Supervised Fine-Tuning (SFT) trainer
- Demonstrates efficiency: 1B model trained to 79% success in 15 minutes on MacBook

**arxiv:** 2512.15943

### "Small Language Models are the Future of Agentic AI" (2025, NVIDIA/Anthropic Research)

**Contribution:** Knowledge distillation framework where specialist SLMs learn to mimic powerful generalist LLM outputs on task-specific data.

**Key insight:** SLMs offer advantages for agent workflows:
- Easier to fine-tune for strict formatting and behavioral requirements
- More reliable JSON output and function call formatting
- SLM trained to always respond in single format vs LLM that occasionally fails

**arxiv:** 2506.02153

### "AgentFly: Fine-tuning LLM Agents without Fine-tuning LLMs" (August 2025)

**Alternative approach:** Non-parametric, learn-on-the-fly framework for case-based reasoning.

**Architecture:**
- Planner component
- Tool-enabled executor
- Growing Case Bank storing past trajectories as episodic memory

**Significance:** Demonstrates fine-tuning agent behavior without modifying model weights.

**arxiv:** 2508.16153

### "From Language to Action: A Review of Large Language Models as Autonomous Agents and Tool Users" (August 2025)

**Scope:** Comprehensive review of LLMs as agents and tool users.

**Fine-tuning insights:**
- Main adaptation method for new domains and improved reasoning
- Common practice: knowledge distillation where advanced LLMs generate training data for smaller open-source models
- Fine-tuning enables behavioral specificity required for tool-using workflows

**arxiv:** 2508.17281

### "Meta-Tool: Unleash Open-World Function Calling" (ACL 2025)

**Contribution:** Framework for enabling models to call functions from open-world APIs not seen during training.

**Status:** Published in ACL Long papers track 2025

---

## 4. Cost Analysis and GPU Economics (2025-2026)

### Full Fine-Tuning Costs (Baseline)

**Training a 7B model with full fine-tuning:**
- VRAM requirement: 100-120 GB
- Hardware: ~4-8 H100 GPUs
- Cost: ~$50,000 per training run

### QLoRA Fine-Tuning Costs

**Hardware options and per-hour rates:**
| Hardware | VRAM | Hourly Cost | Typical Training Hours | Total Cost |
|----------|------|-------------|------------------------|-----------|
| H100 80GB | 80GB | $2.50-4.00 | 10-20 | $25-80 |
| A100 40GB | 40GB | $1.50-2.50 | 15-25 | $22-62 |
| RTX 4090 | 24GB | $0.40-0.80 | 20-40 | $8-32 |

**Cost reduction:** QLoRA enables 10-20x cost reduction vs full fine-tuning.

### Memory Requirements by Model Size

| Model Size | FP16 Requirement | With LoRA | With QLoRA |
|-----------|-----------------|----------|-----------|
| 3B | ~6GB | ~8-10GB | ~4-5GB |
| 7B | ~14GB | ~18-20GB | ~8-10GB |
| 13B | ~26GB | ~32-40GB | ~14-16GB |
| 70B | ~140GB | - | ~20-24GB |

**Note:** A single A100 80GB can handle 70B models with QLoRA, which would require 4-8 H100s with full fine-tuning.

### Cloud Provider 2025 Pricing

- **Lambda Labs**: H100 ~$2.50/hr, RTX 4090 ~$0.40/hr
- **RunPod**: RTX 4090 ~$0.50-1.00/hr, H100 ~$3.00/hr
- **Paperspace**: Variable by region, generally $1-3/hr for H100

### Practical Training Time Estimates

**Without optimization (standard LoRA):**
- 7B model on 10K samples: 8-12 hours on A100
- Cost: $12-30

**With Unsloth optimization (2.7-5x speedup):**
- Same training: 2-4 hours on A100
- Cost: $3-10
- Memory savings: Up to 74% reduction

---

## 5. Training Speed and Optimization: Unsloth (2025-2026)

### Performance Improvements

**Speedup metrics:**
- 2.7x faster than standard fine-tuning with latest Transformers
- Up to 5x faster for MoE (Mixture-of-Experts) models like Qwen3.5
- 2x faster than standard LoRA pipelines
- ~12x faster MoE training with >35% less VRAM

**Memory efficiency:**
- 70% less VRAM than full fine-tuning
- 60% memory reduction vs standard LoRA
- No accuracy degradation (0% vs standard QLoRA)

### How Unsloth Achieves Gains

**Optimization techniques:**
- Kernel-level CUDA optimizations
- Memory-efficient attention mechanisms
- Gradient checkpointing
- Mixed-precision training
- Fused operations for common patterns

**Framework integration:**
- Works with Hugging Face TRL (Transformer Reinforcement Learning)
- Compatible with Axolotl and LLaMA-Factory
- Training Hub support (v0.4.0+)
- Direct integration with Hugging Face transformers library

### Production Readiness

As of April 2026, Unsloth is production-ready with:
- Red Hat Developer official documentation
- Integration with enterprise training platforms
- Support for 500+ models
- No accuracy tradeoffs

---

## 6. Berkeley Function Calling Leaderboard (BFCL) - April 2026 Results

### Benchmark Overview

The BFCL V4 evaluates function calling ability across:
- **Evaluation type**: Real-world function invocation accuracy
- **Call types**: Serial and parallel function calls
- **Evaluation method**: Abstract Syntax Tree (AST) parsing
- **Scale**: Thousands of functions across multiple languages

### Top Performers and Cost-Effectiveness (2025 Results)

**Frontier models:**
- **OpenAI GPT-5**: Leading performance (~95%+ pass rate estimated), cost $127.46 per benchmark run
- **Claude Sonnet 4**: Strong performance, cost $252.41 per benchmark run
- **Google Gemini family**: Native tool use and agentic capabilities
- **Alibaba Qwen family**: Strong performance in smaller packages

**Small model tier (8B models):**
- **ToolACE fine-tuned 8B**: State-of-the-art for small model category, rivaling GPT-4
- **Gorilla (7B)**: Strong baseline for open-source models
- **Granite-20B-FunctionCalling**: Production-ready open-source model

### Key Benchmark Findings

**Performance gaps:**
- Top LLMs excel at single-turn function calls
- Challenges remain: memory, dynamic decision-making, long-horizon reasoning
- Most models struggle with context retention across multiple turns
- Few models perform well at "when NOT to call a function"

**Zero-shot performance in small models:**
- Most SLMs < 3B fail at JSON format adherence in zero-shot
- DeepSeek-Coder-1.3B achieves only 7.34% JSON parsability, 1.11% task accuracy zero-shot
- Improvement dramatic with fine-tuning: 1B model can reach 79% success

### Where to Access BFCL Results

- **Live leaderboard**: [gorilla.cs.berkeley.edu/leaderboard.html](https://gorilla.cs.berkeley.edu/leaderboard.html)
- **Hugging Face Space**: [Berkeley Function Calling Leaderboard Space](https://huggingface.co/spaces/gorilla-llm/berkeley-function-calling-leaderboard)
- **Evaluation package**: `pip install bfcl-eval==2025.12.17`
- **GitHub repository**: [ShishirPatil/gorilla](https://github.com/ShishirPatil/gorilla)
- **Formal paper**: Published at ICML 2025, Proceedings of Machine Learning Research

---

## 7. Recommended Tooling and Frameworks (2025-2026)

### Training Frameworks

**Quick experiments → Production:**

1. **Axolotl** — Recommended for initial experiments, integrated dataset support for ToolACE and Glaive
2. **LLaMA-Factory** — Flexible configuration, good for iterative tuning
3. **Hugging Face PEFT** — Recommended for production control, composable adapters
4. **Training Hub** — Enterprise-grade with Unsloth backend (v0.4.0+)

### Experiment Tracking and Management

- **Weights & Biases (W&B)**: LoRA weight tracking and experiment comparison
- **MLflow**: Metric tracking and model registry
- **Hugging Face Hub**: Model card creation and community sharing

### Development Stack (2026)

- **Base models**: Phi-3.8B, Qwen2.5-Coder 7B, Ministral-3-3B-Instruct-2512
- **Fine-tuning method**: QLoRA with Unsloth backend
- **Datasets**: ToolACE or Glaive V2 depending on use case
- **Evaluation**: BFCL eval package for standardized benchmarking
- **Deployment**: GGML quantization for edge or vLLM for serving

---

## 8. Key Insights and Patterns

### Small Models Advantages for Tool Use

1. **Behavioral control**: Easier to enforce strict formatting, JSON compliance, function call structure
2. **Deterministic outputs**: Fine-tuned 1B model more reliable than large LLM for function calls
3. **Cost efficiency**: $1,500 training vs $50,000 for 70B models
4. **Latency**: 50-100ms vs 500ms-2s for frontier models
5. **Edge deployment**: Can run on mobile, embedded, or single-instance hardware

### Training Efficiency Curve

**Time-to-accuracy analysis:**
- Baseline 350M model: 15 minutes to 79% success on MacBook
- 1B model: ~30-45 minutes for 80%+ success on consumer GPU
- 3B model: ~1-2 hours for 85%+ success
- 7B model: ~3-5 hours for 90%+ success

All assumes ~10K-20K sample dataset with QLoRA + Unsloth.

### Generalization Without Domain-Specific Fine-Tuning

**Key finding:** Models fine-tuned on diverse APIs (26,507 in ToolACE) generalize well to unseen APIs without additional fine-tuning, suggesting broad transfer learning for tool-use skills.

### Hallucination Reduction

**ToolACE-specific:** Dataset design explicitly addresses hallucination through dual-layer verification:
- Rule-based checks on API structure
- Model-based relevance/irrelevance verification (85%+ accuracy both directions)

---

## 9. Recommended Reading Order

For practitioners implementing tool-use agents:

1. **Start**: [Gorilla Repository](https://github.com/ShishirPatil/gorilla) — Open-source models and leaderboard
2. **Datasets**: ToolACE paper (arxiv:2409.00920) or Glaive V2 Hugging Face page
3. **Fine-tuning**: Unsloth documentation for implementation details
4. **Benchmarking**: BFCL paper from ICML 2025 proceedings
5. **SLM specifics**: "Small Language Models for Efficient Agentic Tool Calling" (arxiv:2512.15943)
6. **Advanced**: MoRAgent (ICML 2025 poster) for role-decomposed architecture

---

## 10. Open Questions and Limitations (As of April 2026)

1. **Context retention**: Most models still struggle with remembering prior API calls across conversation history
2. **Dynamic decision-making**: When to NOT call a function remains challenging
3. **Error recovery**: Limited research on fine-tuning for graceful degradation on API failures
4. **Multi-turn reasoning**: Performance drops significantly in 5+ turn conversations
5. **API schema evolution**: No clear patterns for adapting to new APIs after deployment

---

## Sources

### QLoRA and Fine-Tuning Infrastructure
- [Fine-Tuning Infrastructure: LoRA, QLoRA, and PEFT at Scale](https://introl.com/blog/fine-tuning-infrastructure-lora-qlora-peft-scale-guide-2025)
- [LLM Fine-Tuning in 2025: A Hands-On, Test-Driven Blueprint](https://medium.com/@tabers77/llm-fine-tuning-in-2025-a-hands-on-test-driven-blueprint-dd1c7887bb99)
- [Fine-tuning LLMs for Function Calling with xLAM Dataset](https://huggingface.co/learn/cookbook/en/function_calling_fine_tuning_llms_on_xlam)
- [How to Build QLoRA Fine-Tuning](https://oneuptime.com/blog/post/2026-01-30-qlora-fine-tuning/view)
- [Unsloth and Training Hub: Lightning-fast LoRA and QLoRA fine-tuning](https://developers.redhat.com/articles/2026/04/01/unsloth-and-training-hub-lightning-fast-lora-and-qlora-fine-tuning)
- [LoRA vs QLoRA: Best AI Model Fine-Tuning Platforms & Tools 2026](https://www.index.dev/blog/top-ai-fine-tuning-tools-lora-vs-qlora-vs-full)
- [QLoRA: Efficient Finetuning of Quantized LLMs (arxiv:2305.14314)](https://arxiv.org/abs/2305.14314)

### Berkeley Function Calling Leaderboard
- [BFCL V4 Live Leaderboard](https://gorilla.cs.berkeley.edu/leaderboard.html)
- [BFCL GitHub Repository](https://github.com/ShishirPatil/gorilla/tree/main/berkeley-function-call-leaderboard)
- [BFCL Paper - OpenReview](https://openreview.net/forum?id=2GmDdhBdDk)
- [BFCL ICML 2025 Poster](https://icml.cc/virtual/2025/poster/46593)
- [BFCL Paper - Proceedings of Machine Learning Research](https://proceedings.mlr.press/v267/patil25a.html)
- [Function Calling and Agentic AI in 2025: Benchmarks and Model Performance](https://www.klavis.ai/blog/function-calling-and-agentic-ai-in-2025-what-the-latest-benchmarks-tell-us-about-model-performance)

### ToolACE Dataset
- [ToolACE - OpenReview](https://openreview.net/forum?id=8EB8k6DdCU)
- [ToolACE Paper - ICLR 2025](https://proceedings.iclr.cc/paper_files/paper/2025/file/663865ea167425c6c562cb0b6bcf76c7-Paper-Conference.pdf)
- [ToolACE arxiv:2409.00920](https://arxiv.org/abs/2409.00920)
- [ToolACE Dataset - Hugging Face](https://huggingface.co/datasets/Team-ACE/ToolACE)

### Glaive Function Calling Dataset
- [Glaive Function Calling V2 - Hugging Face](https://huggingface.co/datasets/glaiveai/glaive-function-calling-v2)
- [Glaive Function Calling V1 - Hugging Face](https://huggingface.co/datasets/glaiveai/glaive-function-calling)

### Gorilla Project
- [Gorilla GitHub Repository](https://github.com/ShishirPatil/gorilla)
- [Gorilla: Large Language Model Connected with Massive APIs](https://shishirpatil.github.io/publications/gorilla-2023.pdf)
- [Gorilla OpenFunctions](https://gorilla.cs.berkeley.edu/blogs/4_open_functions.html)
- [Gorilla OpenFunctions V2](https://gorilla.cs.berkeley.edu/blogs/7_open_functions_v2.html)
- [Gorilla - NeurIPS 2024 Paper](https://proceedings.neurips.cc/paper_files/paper/2024/file/e4c61f578ff07830f5c37378dd3ecb0d-Paper-Conference.pdf)

### Small Language Model Fine-Tuning for Tool Use
- [Small Language Models for Efficient Agentic Tool Calling (arxiv:2512.15943)](https://arxiv.org/abs/2512.15943)
- [Fine Tuning SLMs on Agentic Tool Calling: An Experiment](https://medium.com/@dataenthusiast.io/fine-tuning-slms-on-agentic-tool-calling-an-experiment-ccbef62ac5c7)
- [Small Language Models are the Future of Agentic AI (arxiv:2506.02153)](https://arxiv.org/pdf/2506.02153)
- [How Small Language Models Are Key to Scalable Agentic AI - NVIDIA](https://developer.nvidia.com/blog/how-small-language-models-are-key-to-scalable-agentic-ai/)
- [AgentFly: Fine-tuning LLM Agents without Fine-tuning LLMs (arxiv:2508.16153)](https://arxiv.org/html/2508.16153v1)
- [From Language to Action: A Review of LLMs as Autonomous Agents (arxiv:2508.17281)](https://arxiv.org/html/2508.17281v1)

### Parameter-Efficient Fine-Tuning Methods
- [MoRAgent: Parameter Efficient Agent Tuning with Mixture-of-Roles - ICML 2025](https://icml.cc/virtual/2025/poster/43879)
- [Fine-tuning large language models (LLMs) in 2025 - SuperAnnotate](https://www.superannotate.com/blog/llm-fine-tuning)
- [The Best 5 LLM Fine-Tuning Tools of 2026 - DeepChecks](https://deepchecks.com/best-llm-fine-tuning-tools/)
- [Revisiting Fine-Tuning: Survey of Parameter-Efficient Techniques](https://www.preprints.org/manuscript/202504.0743)
- [Parameter-Efficient Fine-Tuning Survey - arxiv:2403.14608](https://arxiv.org/pdf/2403.14608)
- [Parameter-Efficient Fine-Tuning in Large Models Survey - arxiv:2410.19878](https://arxiv.org/abs/2410.19878)

### Cost and GPU Economics
- [How to Fine-tune LLMs on a Budget using LoRA and QLoRA](https://www.runpod.io/articles/guides/how-to-fine-tune-large-language-models-on-a-budget)
- [The Real Cost of Fine-Tuning LLMs](https://scopicsoftware.com/blog/cost-of-fine-tuning-llms/)
- [The Complete Guide to GPU Requirements for LLM Fine-Tuning](https://www.runpod.io/blog/llm-fine-tuning-gpu-guide)
- [GPU Options for Finetuning Large Models - DigitalOcean](https://www.digitalocean.com/resources/articles/gpu-options-finetuning)
- [How LoRA Makes AI Fine-Tuning Faster, Cheaper, and More Practical](https://www.exxactcorp.com/blog/deep-learning/ai-fine-tuning-with-lora)
- [Fine-Tune a 7B Model for $1,500 (Not $50,000)](https://www.chanl.ai/blog/fine-tuning-lora-qlora-ai-agent-builders)
- [GPU Cloud Platforms Cost for AI Startups in 2025](https://www.gmicloud.ai/blog/how-much-do-gpu-cloud-platforms-cost-for-ai-startups-in-2025)

### Unsloth Optimization
- [Make LLM Fine-tuning 2x faster with Unsloth](https://huggingface.co/blog/unsloth-trl)
- [QLoRA Fine-Tuning with Unsloth: Complete Guide](https://medium.com/@matteo28/qlora-fine-tuning-with-unsloth-a-complete-guide-8652c9c7edb3)
- [Fine-tune MoE Models 12x Faster with Unsloth](https://unsloth.ai/docs/basics/faster-moe)
- [Unsloth GitHub Repository](https://github.com/unslothai/unsloth)
- [Unsloth - Train and Run Models Locally](https://unsloth.ai/)

### Small Language Model Comparisons
- [Top 10 Small Language Models in 2026](https://www.intuz.com/blog/best-small-language-models)
- [Best Small Language Models for Accuracy and Enterprise Use](https://medium.com/@darrenoberst/best-small-language-models-for-accuracy-and-enterprise-use-cases-benchmark-results-cf71964759c8)
- [The Best Open-Source Small Language Models in 2026](https://www.bentoml.com/blog/the-best-open-source-small-language-models)
- [SmolLM2: New Series of Small Language Models](https://www.marktechpost.com/2024/10/31/smollm2-released-the-new-series-0-1b-0-3b-and-1-7b-of-small-language-models-for-on-device-applications-and-outperforms-meta-llama-3-2-1b)
- [Small Models, Big Tasks: Empirical Study on SLMs for Function Calling](https://dl.acm.org/doi/10.1145/3756681.3757001)

### Meta-Tool
- [Meta-Tool: Unleash Open-World Function Calling - ACL 2025](https://aclanthology.org/2025.acl-long.1481.pdf)
- [Meta-Tool arxiv:2603.05515](https://arxiv.org/html/2603.05515)
