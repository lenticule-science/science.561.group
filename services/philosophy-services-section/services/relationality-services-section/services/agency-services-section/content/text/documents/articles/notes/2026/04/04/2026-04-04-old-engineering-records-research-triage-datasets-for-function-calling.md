---
name: datasets-for-function-calling-2026
description: "Comprehensive guide to available datasets for training models on tool use and function calling, with evaluation notes and practical access information."
date-created: 2026-04-04
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: datasets-for-function-calling-2026
---

## Overview

Four major open-source datasets exist for training models on function calling (tool use), each with different strengths and use cases.

---

## 1. ToolACE (2024-2025)

### Overview
ToolACE is an **automatic agentic pipeline** designed to generate accurate, complex, and diverse tool-learning data specifically tailored for LLM function calling capabilities.

### Dataset Characteristics

| Property | Value |
|----------|-------|
| **Size** | 26,507 diverse APIs in pool |
| **Dialog samples** | 15,000-20,000 (exact size varies by version) |
| **API sources** | Synthesized across categories |
| **Language** | Python, Java, JavaScript primary |
| **Hallucination rate** | 85.37% relevance, 83.81% irrelevance (very low) |
| **License** | Open research |

### How It Was Created

1. **API pool generation**: 26,507 diverse APIs synthesized
2. **Dialog generation**: Multi-agent conversation with complexity evaluator
3. **Dual-layer verification**:
   - Rule-based checks on API structure validity
   - Model-based checks on relevance/irrelevance
4. **Quality filtering**: Only dialogues passing both layers

### Strengths

- **Lowest hallucination rate** among available datasets
- **Diverse API coverage**: Trained models generalize to unseen APIs
- **Scale**: Models fine-tuned on ToolACE achieve state-of-the-art on BFCL
- **8B models outperform GPT-4** when trained on ToolACE (in function calling only)
- **Complexity evaluation**: Focuses on hard examples for better learning

### Weaknesses

- **Synthetic data**: All APIs are synthesized, may not perfectly match real-world patterns
- **Limited documentation**: Fewer published case studies than Gorilla
- **Verification cost**: Dual-layer verification adds complexity to dataset generation

### Benchmark Performance

- **8B model trained on ToolACE**: Rivals GPT-4 performance on BFCL
- **BFCL score**: Top-tier for open-source models
- **ToolBench evaluation**: Consistent scaling across model sizes

### Access

- **Hugging Face**: [Team-ACE/ToolACE](https://huggingface.co/datasets/Team-ACE/ToolACE)
- **Citation**: arxiv:2409.00920, accepted ICLR 2025
- **License**: Open for research

### Recommended Use Case

**Best for:** State-of-the-art tool-calling models, diverse API coverage, low hallucination tolerance, competition with frontier models.

---

## 2. Glaive Function Calling V2

### Overview
Widely-used, production-tested dataset from Glaive designed for function calling tasks across diverse scenarios.

### Dataset Characteristics

| Property | Value |
|----------|-------|
| **Size** | 52,000+ samples |
| **Dialog format** | Natural language + function schema + invocation |
| **Coverage** | Single/multiple/zero function invocations |
| **Language** | Python, JavaScript, other languages supported |
| **Format** | Instruction-following (user query → function call) |
| **Hallucination rate** | Moderate (not explicitly measured) |
| **License** | Open |

### How It's Structured

Each sample contains:
1. **Natural language instruction** from user
2. **Function schema** (name, parameters, description)
3. **Expected function invocation** (in JSON or executable format)
4. **Multiple variations** (different phrasings of same task)

### Strengths

- **Production-proven**: Used by IBM Granite, multiple open-source models
- **Balanced samples**: Includes zero-invocation, single, and multiple cases
- **Diverse scenarios**: Real-world function calling situations
- **Community adoption**: Most integrated with training frameworks
- **Multiple versions**: V1 (original) and V2 (improved) available

### Weaknesses

- **Less diverse APIs**: Smaller API pool than ToolACE
- **Higher hallucination risk**: Not explicitly optimized for relevance/irrelevance
- **Smaller scale**: 52K vs ToolACE's larger sample count

### Models Trained on Glaive V2

- **IBM Granite-20B-FunctionCalling**: Production-grade model
- **Various open-source models**: Community standard baseline

### Access

- **Glaive V2**: [glaiveai/glaive-function-calling-v2](https://huggingface.co/datasets/glaiveai/glaive-function-calling-v2)
- **Glaive V1**: [glaiveai/glaive-function-calling](https://huggingface.co/datasets/glaiveai/glaive-function-calling)
- **License**: Open
- **Format**: Hugging Face dataset format, compatible with `datasets` library

### Recommended Use Case

**Best for:** Production deployments, quick baseline establishment, integration with Axolotl/LLaMA-Factory, teams already using Glaive infrastructure.

---

## 3. Gorilla OpenFunctions V2

### Overview
Comprehensive dataset from Berkeley's Gorilla project, derived from real APIs across multiple programming ecosystems.

### Dataset Characteristics

| Property | Value |
|----------|-------|
| **Total samples** | 65,283 question-function-answer pairs |
| **Python packages** | 19,353 samples |
| **Java repositories** | 16,586 samples |
| **JavaScript repositories** | 4,245 samples |
| **Public APIs** | 6,009 samples |
| **Command-line tools** | 19,090 samples |
| **Language coverage** | Python, Java, JavaScript, REST, CLI |
| **Parallel calls** | Supported |
| **License** | Apache 2.0 |

### How It Was Created

1. **API scraping**: Real-world APIs from HuggingFace, TorchHub, TensorHub
2. **Self-instruct generation**: GPT-4 generates instruction-API pairs
3. **Chat format conversion**: Converts to user-agent conversation format
4. **Format diversity**: Different instruction phrasings for robustness

### Strengths

- **Real-world APIs**: Not synthesized, based on actual library/framework APIs
- **Broad language support**: Python, Java, JavaScript, REST, CLI in one dataset
- **Retriever-aware**: Designed for retrieval-augmented tool calling
- **Production pedigree**: Gorilla models deployed in real systems
- **Parallel function calls**: Explicitly handles multiple concurrent calls
- **Apache 2.0 licensed**: Fully open and commercial-friendly

### Weaknesses

- **Imbalanced**: Heavy weighting toward Python, light on JavaScript
- **Legacy approaches**: Some APIs may be outdated (especially for fast-moving domains)
- **Self-instruct quality**: GPT-4 generation quality varies

### Benchmark Performance

- **Gorilla-7B**: Original model, strong baseline
- **BFCL performance**: Competitive for open-source
- **Generalization**: Good transfer to unseen APIs

### Access

- **Main dataset**: [Berkeley Function Calling Leaderboard](https://huggingface.co/datasets/gorilla-llm/Berkeley-Function-Calling-Leaderboard)
- **OpenFunctions**: [Gorilla Repository](https://github.com/ShishirPatil/gorilla)
- **Citation**: NeurIPS 2024, ICML 2025 (leaderboard paper)
- **Models**: [Gorilla on Hugging Face](https://huggingface.co/gorilla-llm) (deprecated) → use fine-tuning instead

### Recommended Use Case

**Best for:** Projects using multiple programming languages, web API integration, tool discovery/retrieval scenarios, academic research on function calling.

---

## 4. Berkeley Function Calling Leaderboard (BFCL) Dataset

### Overview
Evaluation-focused dataset designed as a benchmark for function calling ability, not primarily for fine-tuning, but used for constructing training-evaluation pipelines.

### Dataset Characteristics

| Property | Value |
|----------|-------|
| **Evaluation samples** | 1,000+ test cases |
| **Evaluation method** | Abstract Syntax Tree (AST) parsing |
| **Call types** | Serial and parallel function calls |
| **Function coverage** | Thousands of functions across domains |
| **Language diversity** | Python, JavaScript, Java primary |
| **License** | Open |

### How It Works

1. **Function schema**: Diverse function definitions with complex parameters
2. **Natural language prompts**: User requests requiring correct function calls
3. **Expected output**: Correct function invocation in specific format
4. **Evaluation**: AST comparison (structure, not string matching)

### Strengths

- **Standardized evaluation**: Used by entire community for benchmarking
- **Robust evaluation**: AST-based avoids string matching fragility
- **Comprehensive**: Covers edge cases (parallel calls, complex parameters)
- **Community-driven**: Updated periodically with new test cases
- **Real-world difficulty**: Reflects actual agent deployment challenges

### Weaknesses

- **Not for training**: Primarily evaluation (data size too small for training)
- **Evaluation set leakage**: Using BFCL test data for training breaks benchmark validity

### Using BFCL for Training

**Approach 1: BFCL as validation set**
- Train on ToolACE/Glaive
- Evaluate on BFCL to track progress
- Recommended for hyperparameter tuning

**Approach 2: BFCL synthetic expansion**
- Use BFCL patterns to generate synthetic training data
- Create variations of BFCL examples with different phrasings
- Recommended for specialized domains

### Access

- **Dataset**: [gorilla-llm/Berkeley-Function-Calling-Leaderboard](https://huggingface.co/datasets/gorilla-llm/Berkeley-Function-Calling-Leaderboard)
- **Evaluation package**: `pip install bfcl-eval==2025.12.17`
- **Live leaderboard**: [gorilla.cs.berkeley.edu/leaderboard.html](https://gorilla.cs.berkeley.edu/leaderboard.html)
- **GitHub**: [ShishirPatil/gorilla](https://github.com/ShishirPatil/gorilla/tree/main/berkeley-function-call-leaderboard)

### Recommended Use Case

**Best for:** Benchmarking fine-tuned models, validating improvements, comparing against published results, measuring BFCL pass rates.

---

## Comparative Analysis

### By Size and Coverage

| Dataset | Total Samples | API Diversity | Language Coverage | API Realism |
|---------|---------------|---------------|-------------------|------------|
| ToolACE | ~20,000 | 26,507 APIs | Python, Java, JS | Synthetic (high quality) |
| Glaive V2 | ~52,000 | ~5,000 APIs | Python, JS primary | Mixed/synthetic |
| Gorilla OpenFunctions | ~65,000 | 1,600+ | Python, Java, JS, REST, CLI | Real-world APIs |
| BFCL | ~1,000 | 1,000+ | Python, JS, Java | Real-world (curated) |

### By Hallucination Resistance

| Dataset | Hallucination Control | Method |
|---------|----------------------|--------|
| ToolACE | Highest (85%+ relevance) | Dual-layer verification |
| Glaive V2 | Moderate | Format checking only |
| Gorilla | Moderate | Self-instruct quality |
| BFCL | High (evaluation focus) | Curated test set |

### By Training Efficiency

| Dataset | Typical Training Time (7B) | Final BFCL Performance |
|---------|---------------------------|----------------------|
| ToolACE | 8-12 hours | ~90% (near GPT-4) |
| Glaive V2 | 10-15 hours | ~85% (good) |
| Gorilla | 12-18 hours | ~82% (good baseline) |
| BFCL (with augmentation) | Variable | Varies by approach |

---

## Choosing a Dataset: Decision Tree

```
Are you optimizing for BFCL performance?
├─ YES → Use ToolACE
│        (highest BFCL scores for open-source models)
│
└─ NO → Do you need multiple programming languages?
        ├─ YES → Use Gorilla OpenFunctions V2
        │        (best language diversity)
        │
        └─ NO → Do you want production-proven baseline?
                ├─ YES → Use Glaive V2
                │        (most integrated with tools)
                │
                └─ NO → Start with Glaive V2, validate with BFCL
```

---

## Practical: Combining Datasets

### Approach 1: Multi-dataset Fine-tuning

**Strategy:** Train on all datasets simultaneously

```python
# Pseudocode
combined_data = (
    load_dataset("Team-ACE/ToolACE") +
    load_dataset("glaiveai/glaive-function-calling-v2") +
    load_dataset("gorilla-llm/Berkeley-Function-Calling-Leaderboard")
)
# Downsample larger datasets to balance
# Train with ~30K total samples
```

**Expected result:** 
- 10-15% performance boost on BFCL
- More robust across different API styles
- Training time: ~15-20 hours on RTX 4090 with Unsloth

### Approach 2: Staged Fine-tuning

**Strategy:** Fine-tune sequentially for specialization

```python
# Stage 1: General function calling on Glaive V2 (baseline)
model = fine_tune(model, glaive_v2_data, epochs=1)

# Stage 2: Specialize on ToolACE (BFCL focus)
model = fine_tune(model, toolace_data, epochs=1, lr=1e-5)

# Stage 3: Domain-specific on custom data (your domain)
model = fine_tune(model, custom_data, epochs=3, lr=5e-6)
```

**Expected result:**
- Strong general performance + domain specialization
- Training time: ~25-30 hours total, best accuracy

### Approach 3: Curriculum Learning

**Strategy:** Easy → hard examples

```
Phase 1 (hours 0-4):   Glaive V2 simple cases
Phase 2 (hours 4-8):   Gorilla diverse APIs
Phase 3 (hours 8-12):  ToolACE complex scenarios
Phase 4 (hours 12-16): Hard examples only
```

**Expected result:**
- Faster convergence
- Better generalization to unseen APIs
- More stable training

---

## Implementation: Data Format Unification

### Common Issue
Datasets use different formats:
- ToolACE: One format
- Glaive: Different format
- Gorilla: Yet another format

### Solution: Convert to Standard Format

```python
# Standardize all to this format
{
    "instruction": "Call the get_weather function with location='Paris'",
    "function_name": "get_weather",
    "parameters": {"location": "Paris"},
    "output": {"function": "get_weather", "parameters": {"location": "Paris"}}
}
```

### Tools That Handle This

- **Hugging Face datasets library**: Built-in format conversion
- **LLaMA-Factory**: Automatic format detection and conversion
- **Axolotl**: Dataset adapter system for multiple formats

---

## Dataset Metadata for Reproducibility

When publishing results, include:

```yaml
dataset:
  name: "ToolACE v1"
  huggingface_id: "Team-ACE/ToolACE"
  date_accessed: "2026-04-04"
  subset: "full"
  filtering: "none"
  train_split: 0.9
  val_split: 0.1
  
preprocessing:
  tokenizer: "meta-llama/Llama-2-7b"
  max_length: 2048
  packing: true
  
training:
  method: "QLoRA"
  base_model: "meta-llama/Llama-2-7b-hf"
  lora_rank: 64
  lora_alpha: 16
  learning_rate: 2e-4
  batch_size: 8
  epochs: 3
  
evaluation:
  benchmark: "BFCL"
  score: 0.90
```

---

## Sources

- [ToolACE - OpenReview](https://openreview.net/forum?id=8EB8k6DdCU)
- [ToolACE Paper - ICLR 2025](https://proceedings.iclr.cc/paper_files/paper/2025/file/663865ea167425c6c562cb0b6bcf76c7-Paper-Conference.pdf)
- [ToolACE arxiv:2409.00920](https://arxiv.org/abs/2409.00920)
- [Glaive Function Calling V2 - Hugging Face](https://huggingface.co/datasets/glaiveai/glaive-function-calling-v2)
- [Gorilla: Large Language Model Connected with Massive APIs](https://shishirpatil.github.io/publications/gorilla-2023.pdf)
- [Gorilla OpenFunctions](https://gorilla.cs.berkeley.edu/blogs/4_open_functions.html)
- [Gorilla OpenFunctions V2](https://gorilla.cs.berkeley.edu/blogs/7_open_functions_v2.html)
- [Gorilla - NeurIPS 2024](https://proceedings.neurips.cc/paper_files/paper/2024/file/e4c61f578ff07830f5c37378dd3ecb0d-Paper-Conference.pdf)
- [Berkeley Function Calling Leaderboard](https://gorilla.cs.berkeley.edu/leaderboard.html)
- [BFCL Paper - ICML 2025](https://proceedings.mlr.press/v267/patil25a.html)
