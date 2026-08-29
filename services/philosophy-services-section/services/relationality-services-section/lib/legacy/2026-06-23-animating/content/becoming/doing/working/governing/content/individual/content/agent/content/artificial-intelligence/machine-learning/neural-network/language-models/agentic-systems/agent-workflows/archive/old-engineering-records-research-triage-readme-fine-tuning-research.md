---
name: README-fine-tuning-research
description: "Navigation guide and summary for April 2026 research on fine-tuning models for function calling."
date-created: 2026-04-04
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

This folder contains comprehensive research on the current state (April 2026) of fine-tuning small language models (1B-7B parameters) for agentic tool use and function calling.

## Research Documents

### 1. [Fine-Tuning Small Models for Agentic Tool Use: State of the Art (fine-tuning-small-models-tool-use-2026.md)](./fine-tuning-small-models-tool-use-2026.md)

**Comprehensive survey of the entire landscape.** Start here for a complete overview.

**Covers:**
- Parameter-efficient fine-tuning methods (QLoRA, MoRAgent, LoRA variants)
- All major datasets (ToolACE, Glaive V2, Gorilla OpenFunctions, BFCL)
- Recent papers from 2024-2026 on small model tool use
- Berkeley Function Calling Leaderboard results
- Unsloth optimization techniques
- Recommended tools and frameworks
- Open questions and limitations

**Read time:** 15-20 minutes
**Best for:** Overview, finding papers, understanding the field

---

### 2. [Cost Analysis: Fine-Tuning a 7B Model (cost-analysis-fine-tuning-7b-2026.md)](./cost-analysis-fine-tuning-7b-2026.md)

**Practical cost breakdown and ROI analysis.** Essential for budgeting.

**Covers:**
- Full fine-tuning vs QLoRA costs
- Hardware options and pricing (RTX 4090, A100, H100)
- Speedup with Unsloth optimization
- Detailed cost breakdowns for representative scenarios
- Cloud provider pricing (RunPod, Lambda, Paperspace)
- Break-even analysis and ROI calculation
- Comparative economics vs prompt engineering

**Key takeaway:** Fine-tune a 7B model for $5-20 (with optimization) vs $50,000 (full fine-tuning)

**Read time:** 10-15 minutes
**Best for:** Justifying spend, choosing hardware, budgeting projects

---

### 3. [Datasets for Function Calling (datasets-for-function-calling-2026.md)](./datasets-for-function-calling-2026.md)

**Complete guide to available datasets.** Use this to choose your training data.

**Covers:**
- Detailed analysis of 4 major datasets:
  1. **ToolACE** — Best BFCL performance, synthetic but high-quality, 26K+ APIs
  2. **Glaive V2** — Production-proven, 52K samples, community standard
  3. **Gorilla OpenFunctions** — Real-world APIs, multiple languages, 65K samples
  4. **BFCL** — Evaluation dataset (not for training), standardized benchmark

- Dataset characteristics comparison
- Hallucination resistance metrics
- Decision tree for choosing datasets
- Strategies for combining multiple datasets
- Format unification and preprocessing
- Reproducibility metadata

**Read time:** 10-15 minutes
**Best for:** Selecting training data, planning experiments, understanding trade-offs

---

## Quick Start Guides

### "I want to fine-tune a 7B model for tool use today"

1. Read: [Cost Analysis](#2-cost-analysis-fine-tuning-a-7b-model) → Understand costs
2. Read: [Datasets](#3-datasets-for-function-calling) → Choose ToolACE or Glaive V2
3. Choose hardware: RTX 4090 ($5-7 per run) or A100 ($16-20 per run)
4. Framework: Use Axolotl or LLaMA-Factory with Unsloth backend
5. Tools: HuggingFace PEFT + Unsloth
6. Evaluate: Use BFCL benchmark (`pip install bfcl-eval==2025.12.17`)

**Total time:** 8-15 hours training, $5-20 cost

---

### "I want to understand the field before investing"

1. Read: [State of the Art](#1-fine-tuning-small-models-for-agentic-tool-use-state-of-the-art) → Full landscape
2. Read: [Cost Analysis](#2-cost-analysis-fine-tuning-a-7b-2026) → Business case
3. Follow links to original papers (all cited with arxiv/proceedings links)

**Total reading time:** 30-45 minutes

---

### "I'm comparing small models vs large API models"

1. Skim: [State of the Art](#1-fine-tuning-small-models-for-agentic-tool-use-state-of-the-art) sections 4 & 6
2. Focus: [Cost Analysis](#2-cost-analysis-fine-tuning-a-7b-2026) section "ROI Analysis"
3. Key insight: 
   - Fine-tuned 7B: $5-7 training, $0.0005-0.002/inference
   - API call (GPT-4): $0.01-0.03/call
   - Break-even at 10K-100K daily API calls

---

## Key Findings Summary

### Performance
- **Small models can match large models** on tool use with proper fine-tuning
- 8B model fine-tuned on ToolACE: **rivals GPT-4** on BFCL function calling
- 350M model: can reach **79% success rate** in 15 minutes on MacBook
- State-of-the-art SLM: **77.55% pass rate** on ToolBench (vs GPT-4's ~95%)

### Cost
- **QLoRA reduces costs 10-20x** vs full fine-tuning
- Full fine-tuning 7B: $50,000 → QLoRA: $1,500-5,000 → QLoRA+Unsloth: $5-20
- Break-even on training cost: 2-20 days of production use

### Methods
- **QLoRA + Unsloth** is the production standard (as of April 2026)
- Typical training: 8-12 hours on single GPU
- Memory: 8-12 GB VRAM (fits on RTX 4090, A100)

### Datasets
- **ToolACE**: Best overall quality, highest BFCL scores
- **Glaive V2**: Production-proven, widely integrated
- **Gorilla OpenFunctions**: Best language diversity
- All open-source and freely available

### Benchmarking
- **BFCL (Berkeley Function Calling Leaderboard)** is the standard
- Evaluation package: `pip install bfcl-eval==2025.12.17`
- Live leaderboard: [gorilla.cs.berkeley.edu/leaderboard.html](https://gorilla.cs.berkeley.edu/leaderboard.html)

---

## Research Articles Used

All citations are to published papers, proceedings, or official documentation. Here are the most important:

### Core Papers
- **ToolACE**: "Winning the Points of LLM Function Calling" — ICLR 2025
- **BFCL**: "The Berkeley Function Calling Leaderboard (BFCL)" — ICML 2025
- **Small LLMs**: "Small Language Models are the Future of Agentic AI" — 2025
- **SLM Tool Calling**: "Small Language Models for Efficient Agentic Tool Calling" — December 2025

### Methods
- **QLoRA**: "Efficient Finetuning of Quantized LLMs" — arxiv:2305.14314
- **MoRAgent**: "Parameter Efficient Agent Tuning with Mixture-of-Roles" — ICML 2025
- **PEFT Survey**: "Parameter-Efficient Fine-Tuning in Large Models" — arxiv:2410.19878

### Tools & Frameworks
- **Unsloth**: Official documentation & Red Hat integration (2026)
- **Gorilla**: "Large Language Model Connected with Massive APIs" — NeurIPS 2024
- **BFCL Dataset**: Hugging Face official dataset

---

## How to Use This Research in Your Work

### For Team Decision-Making
1. Read the cost analysis (30 min)
2. Share the ROI section with stakeholders
3. Present benchmarks from BFCL paper
4. Decision: Use QLoRA + Unsloth for any serious tool-use project

### For Implementation
1. Choose dataset from [datasets guide](#3-datasets-for-function-calling)
2. Set up training on [recommended hardware](#2-cost-analysis-fine-tuning-a-7b-2026)
3. Use Axolotl/LLaMA-Factory for training
4. Evaluate on BFCL benchmark
5. Deploy on single GPU (16-24GB VRAM)

### For Academic Use
1. Cite BFCL paper for benchmarking
2. Cite ToolACE for dataset
3. Use BFCL eval package for reproducibility
4. Follow metadata standards in [datasets guide](#3-datasets-for-function-calling)

### For Competition/Research
1. Read BFCL leaderboard directly
2. Note that BFCL test data should not be used for training
3. Train on ToolACE/Glaive, evaluate on BFCL
4. Compare against frontier models (GPT-5, Claude Sonnet 4, Gemini)

---

## Open Questions (Not Addressed in This Research)

1. **Multi-turn context retention**: How to maintain state across 5+ conversation turns?
2. **Error recovery**: Fine-tuning for graceful API failure handling
3. **Dynamic tool discovery**: Adding new APIs after training without retraining
4. **Long-horizon reasoning**: Planning across 10+ tool calls
5. **Tool composition**: Calling sequence of dependent APIs
6. **Privacy-preserving training**: Fine-tuning on proprietary API schemas

---

## Tools and Commands Reference

### Dataset Access
```bash
# Download ToolACE
from datasets import load_dataset
data = load_dataset("Team-ACE/ToolACE")

# Download Glaive V2
data = load_dataset("glaiveai/glaive-function-calling-v2")

# Download Gorilla OpenFunctions
data = load_dataset("gorilla-llm/Berkeley-Function-Calling-Leaderboard")
```

### Training Setup
```bash
# Install Unsloth
pip install unsloth

# Install evaluation tools
pip install bfcl-eval==2025.12.17

# Use Axolotl for training (recommended)
pip install axolotl

# Or LLaMA-Factory
pip install llama-factory
```

### Cloud Platforms
- **RunPod**: RTX 4090 @ $0.44-0.70/hr, A100 @ $1.29-2.00/hr
- **Lambda Labs**: RTX 4090 @ $0.40/hr, H100 @ $2.50/hr
- **Paperspace**: A100 @ $2.30/hr, H100 @ $3.00/hr

---

## Recommended Reading Order by Role

### Manager/Decision-Maker
1. Cost Analysis — ROI section (5 min)
2. State of the Art — Executive Summary (3 min)
3. Datasets — Overview section (5 min)
**Total: 13 minutes**

### Engineer (Implementing)
1. Cost Analysis — Full document (15 min)
2. Datasets — Full document with practical strategies (15 min)
3. State of the Art — Methods and tools sections (10 min)
4. Follow links to framework documentation (Axolotl/LLaMA-Factory)
**Total: 40 minutes + implementation time**

### Researcher (Publishing)
1. State of the Art — All papers and citations (30 min)
2. Follow links to original papers (60+ min for full papers)
3. Datasets — Reproducibility section (5 min)
4. Review BFCL paper (30 min)
**Total: 125+ minutes for thorough understanding**

---

## Feedback and Updates

These documents were created April 4, 2026 based on:
- 12+ web searches across multiple domains
- Papers from 2024-2026
- Official leaderboards and benchmarks
- Live cloud pricing data

As of April 2026, this represents the current state of the art. This field moves rapidly, so check:
- [BFCL Leaderboard](https://gorilla.cs.berkeley.edu/leaderboard.html) for latest benchmarks
- [Papers with Code](https://paperswithcode.com/) for new papers
- [Hugging Face Blog](https://huggingface.co/blog) for framework updates

---

## Files in This Research Set

```
operations/engineering/records/research/
├── README-fine-tuning-research.md (this file)
├── fine-tuning-small-models-tool-use-2026.md (comprehensive survey)
├── cost-analysis-fine-tuning-7b-2026.md (economic analysis)
└── datasets-for-function-calling-2026.md (dataset guide)
```

All files are marked as completed research documents, not work-in-progress.
