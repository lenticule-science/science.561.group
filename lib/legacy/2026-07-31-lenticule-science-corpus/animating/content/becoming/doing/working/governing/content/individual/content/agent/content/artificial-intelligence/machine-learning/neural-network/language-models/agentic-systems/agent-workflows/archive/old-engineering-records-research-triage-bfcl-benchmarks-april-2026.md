---
name: bfcl-benchmarks-april-2026
description: "Snapshot of top-performing models on the BFCL benchmark with focus on small, fine-tuned, and cost-effective options."
date-created: 2026-04-04
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

## What Is BFCL?

The **Berkeley Function Calling Leaderboard (BFCL)** is the standardized benchmark for evaluating function calling (tool invocation) capabilities in language models. As of April 2026, it is the primary evaluation metric for agents and tool-using systems.

**Evaluation methodology:**
- Abstract Syntax Tree (AST) comparison (structural, not string matching)
- Serial and parallel function calls
- Real-world function schemas
- Thousands of test cases across domains

**Live leaderboard:** [gorilla.cs.berkeley.edu/leaderboard.html](https://gorilla.cs.berkeley.edu/leaderboard.html)

---

## Top Performers (April 2026)

### Frontier Models (Paid APIs)

| Model | Provider | Pass@1 | Cost/Run | Cost/1M Calls |
|-------|----------|--------|----------|--------------|
| **GPT-5** | OpenAI | ~95% | $127.46 | ~$127 |
| **Claude Sonnet 4** | Anthropic | ~94% | $252.41 | ~$268 |
| **Gemini 2.0 Ultra** | Google | ~93% | ~$100 | ~$107 |
| **Qwen3.5-72B** | Alibaba | ~91% | ~$20 | ~$22 |

**Note:** Frontier models excel at single-turn calls but struggle with multi-turn context retention and "don't call" decisions.

---

### Best Open-Source Models (Fine-Tuned)

| Model | Base Size | Training Data | Pass@1 | Inference Speed | VRAM |
|-------|-----------|---------------|--------|-----------------|------|
| **ToolACE-8B-FT** | 8B | ToolACE | ~89% | 50-100ms | 16GB |
| **Gorilla-7B-v1** | 7B | OpenFunctions | ~84% | 40-80ms | 14GB |
| **Granite-20B-FunctionCalling** | 20B | Glaive V2 | ~87% | 150-300ms | 40GB |
| **Qwen2.5-Coder-7B-FT** | 7B | Internal + Glaive | ~85% | 50-100ms | 14GB |

---

### Small Models (Best Cost-Efficiency)

| Model | Size | Training Data | Pass@1 | Training Cost | Inference Cost |
|-------|------|---------------|--------|---------------|-----------------|
| **opt-350m-FT-toolace** | 350M | ToolACE | ~45% | $2-3 | $0.0001/call |
| **opt-1b-FT-toolace** | 1B | ToolACE | ~65% | $3-5 | $0.0002/call |
| **phi-3-8b-FT-glaive** | 3.8B | Glaive V2 | ~78% | $5-8 | $0.0004/call |
| **ministral-3-3b-FT** | 3B | Glaive V2 | ~76% | $4-6 | $0.0003/call |

---

### Zero-Shot Performance (Untrained Small Models)

**Why this matters:** How much improvement does fine-tuning give you?

| Model | Size | Zero-Shot Pass@1 | Fine-Tuned Pass@1 | Improvement |
|-------|------|------------------|-------------------|-------------|
| OPT-350M | 350M | 2% | 45% | +43pp |
| OPT-1B | 1B | 5% | 65% | +60pp |
| DeepSeek-Coder-1.3B | 1.3B | 7% | 72% | +65pp |
| Phi-3-3.8B | 3.8B | 15% | 78% | +63pp |
| Qwen-2.5-7B | 7B | 18% | 85% | +67pp |

**Key insight:** Small models improve 60-70 percentage points with fine-tuning, suggesting tool-calling is largely a behavior learned through training, not inherent to model size.

---

## Performance by Evaluation Category

### Serial vs Parallel Function Calls

| Category | Frontier | Fine-Tuned 7B | Small 3B | Frontier Advantage |
|----------|----------|--------------|----------|-------------------|
| **Single function call** | 97% | 91% | 82% | 6pp |
| **Parallel calls (2-3)** | 92% | 84% | 71% | 8pp |
| **Complex sequences** | 88% | 77% | 61% | 11pp |

**Pattern:** Small models fall behind on complex scenarios; frontier models maintain consistency.

---

### Language Coverage

BFCL evaluates across multiple languages. Performance varies:

| Language | Frontier | Fine-Tuned 7B | Small 3B |
|----------|----------|--------------|----------|
| Python | 96% | 90% | 80% |
| JavaScript | 94% | 85% | 75% |
| Java | 91% | 82% | 71% |
| REST/cURL | 93% | 87% | 78% |
| Bash/CLI | 88% | 79% | 68% |

**Note:** Python dominance in training data (ToolACE, Glaive) explains performance skew.

---

### Error Modes (What Goes Wrong)

**Analysis from BFCL paper identifies:**

1. **Hallucinated functions** (10-15% of failures)
   - Model invents functions that don't exist
   - More common in: small models, zero-shot
   - Mitigated by: ToolACE (dual verification), retrieval-augmented approaches

2. **Wrong parameters** (15-20% of failures)
   - Correct function, wrong parameter values
   - More common in: complex parameter schemas
   - Mitigated by: function schema examples in prompts, chain-of-thought

3. **Format errors** (5-10% of failures)
   - JSON malformed, structure wrong
   - More common in: small models on parallel calls
   - Mitigated by: fine-tuning (enforces format), constrained generation

4. **"When NOT to call"** (20-25% of failures)
   - Model calls function when instruction says don't
   - Most challenging across all models
   - Frontier models: 85% accuracy, small models: 60% accuracy

5. **Context retention** (15-20% of failures in multi-turn)
   - Model forgets earlier API call results
   - Frontier models: retain context well
   - Small models: degrade significantly after 3+ turns

---

## Cost-Effectiveness Analysis

### Total Cost of Ownership (12-month horizon)

**Scenario: 10 million function calls/month (120M/year)**

| Option | Training Cost | Inference Cost/Year | Total | Break-Even |
|--------|---------------|-------------------|-------|-----------|
| Fine-tuned 7B (deployed) | $20 | $10,000 | $10,020 | 1 week |
| Fine-tuned 7B (on-demand) | $20 | $60,000 | $60,020 | <1 day |
| GPT-5 (API) | $0 | $1,200,000 | $1,200,000 | — |
| Claude Sonnet 4 | $0 | $2,680,000 | $2,680,000 | — |

**Conclusion:** For production workloads >1M calls/month, fine-tuning breaks even immediately.

### Cost per Correct API Call

| Method | Training | Inference | Per-Call Cost |
|--------|----------|-----------|---------------|
| Fine-tuned 7B (deployed) | $0.0002 | $0.0005 | $0.0007 |
| Fine-tuned 7B (on-demand) | $0.0002 | $0.003 | $0.0032 |
| Fine-tuned 3B (deployed) | $0.0001 | $0.0002 | $0.0003 |
| GPT-5 (API) | — | $0.01-0.02 | $0.01-0.02 |

**Deployed = self-hosted; on-demand = cloud inference**

---

## Recent Trends (2025-2026)

### 1. Small Model Improvements
- **2024**: Best small model ~60% on BFCL
- **2025**: Best small model ~75% on BFCL
- **Trend**: Steep improvement from better fine-tuning techniques and datasets

### 2. Dataset Quality Matters More Than Size
- ToolACE (20K well-curated samples): ~89% with 8B model
- Glaive (52K mixed samples): ~84% with 7B model
- **Insight:** Verification-focused dataset beats size

### 3. Specialization Works
- Fine-tuned 3B for tool-calling: 76% (outperforms general 7B base model)
- General-purpose 7B: 18% on tool-calling zero-shot
- **Insight:** Domain-specific training >> general capability

### 4. Multi-turn Performance Gap Widening
- Single-turn: frontier vs 7B = 6pp gap
- Multi-turn (5+ calls): frontier vs 7B = 25pp gap
- **Challenge:** Memory and context accumulation unresolved for small models

---

## How to Use BFCL for Your Project

### Step 1: Establish Baseline
```bash
# Install evaluation package
pip install bfcl-eval==2025.12.17

# Evaluate your fine-tuned model
from bfcl_eval import evaluate_bfcl
results = evaluate_bfcl("path/to/model", split="test")
print(results.pass_at_1)  # Your score
```

### Step 2: Compare Against Leaderboard
```
Your model Pass@1: 0.82 (82%)
Gorilla-7B:         0.84 (84%)
ToolACE-8B:         0.89 (89%)
GPT-5:              0.95 (95%)

You're competitive with Gorilla, 7pp behind SOTA, 13pp behind frontier
```

### Step 3: Identify Weak Spots
```python
# Get per-category breakdown
results.by_category['parallel_calls']  # 74% (weakness)
results.by_category['single_call']     # 88% (strength)
results.by_category['context_retention']  # 68% (major weakness)
```

### Step 4: Decide Next Steps
```
If Pass@1 < 70%:
  → Increase training data (try ToolACE)
  → Use Unsloth optimization to train longer
  → Add curriculum learning (easy → hard examples)

If Pass@1 70-85%:
  → Fine-tune longer on hard examples
  → Add domain-specific data
  → Consider multi-dataset training

If Pass@1 > 85%:
  → Consider production deployment
  → Measure inference latency/cost
  → Set up A/B testing vs API models
```

---

## Benchmarking Best Practices

### What BFCL Tests Well
- Single-turn function calling accuracy
- Parallel function invocation
- Parameter binding correctness
- Cross-language capabilities
- Format compliance

### What BFCL Doesn't Test
- Multi-turn context retention
- Error recovery and fallbacks
- Dynamic tool discovery
- API rate limits and retries
- Cost efficiency (only inference latency)
- User experience (conversation flow)

### Recommendation
**Use BFCL as primary metric, but supplement with:**
- Custom benchmarks for your domain/APIs
- Multi-turn conversation tests
- Cost measurement in production
- User satisfaction metrics
- Error analysis on failed calls

---

## Notable Models by Category

### Best for Production Deployment
- **Granite-20B-FunctionCalling**: 87% accuracy, production-ready
- **ToolACE-8B-FT**: 89% accuracy, good balance
- **Qwen2.5-Coder-7B**: 85% accuracy, coder-specific

### Best for Constrained Environments
- **OPT-1B-FT**: 65% accuracy, fits in 4GB VRAM
- **Phi-3-3.8B-FT**: 78% accuracy, 8GB VRAM
- **Ministral-3-3B-FT**: 76% accuracy, optimized for efficiency

### Best Research Quality
- **ToolACE-8B**: Highest accuracy for open-source
- **Gorilla-7B**: Well-documented, reproducible

### Best for Web APIs
- **Gorilla OpenFunctions**: Designed for REST APIs
- **Granite-20B**: Diverse language support

---

## Reproducing BFCL Benchmark

### Official Process
```bash
# Clone BFCL repo
git clone https://github.com/ShishirPatil/gorilla.git
cd gorilla/berkeley-function-call-leaderboard

# Install evaluation tools
pip install -e .

# Evaluate your model
python evaluate.py --model_name "your-model" \
                   --model_path "path/to/model" \
                   --dataset_split test
```

### Important Notes
- **Test set is held-out**: Don't train on BFCL data
- **Version matters**: Specify `bfcl-eval==2025.12.17` for April 2026 results
- **Reproducibility**: Random seeds set for determinism
- **Multi-GPU**: Supports distributed evaluation for faster benchmarking

---

## Interpreting Your Results

### Pass@1 Expectations

- **< 50%**: Model undertrained or base model too small
  - Action: More data, larger model, or better dataset (ToolACE)

- **50-70%**: Baseline achieved, room for improvement
  - Action: Fine-tune longer, add domain data, use curriculum learning

- **70-85%**: Production-ready for most applications
  - Action: Measure real-world performance, consider deployment

- **85%+**: Frontier performance, comparable to GPT-4
  - Action: Deploy confidently, measure cost-benefit vs API

### Context for Interpretation

- GPT-5: ~95% (frontier, expensive)
- ToolACE-8B: ~89% (SOTA small model)
- Gorilla-7B: ~84% (reliable baseline)
- Glaive-7B: ~82% (conservative estimate)
- Untrained 7B: ~18% (raw capability)

---

## Sources

- [BFCL V4 Live Leaderboard](https://gorilla.cs.berkeley.edu/leaderboard.html)
- [BFCL GitHub Repository](https://github.com/ShishirPatil/gorilla/tree/main/berkeley-function-call-leaderboard)
- [BFCL Paper - ICML 2025](https://proceedings.mlr.press/v267/patil25a.html)
- [BFCL Paper - OpenReview](https://openreview.net/forum?id=2GmDdhBdDk)
- [ToolACE Paper - ICLR 2025](https://proceedings.iclr.cc/paper_files/paper/2025/file/663865ea167425c6c562cb0b6bcf76c7-Paper-Conference.pdf)
- [Small Language Models for Efficient Agentic Tool Calling - arxiv:2512.15943](https://arxiv.org/abs/2512.15943)
- [Gorilla - NeurIPS 2024](https://proceedings.neurips.cc/paper_files/paper/2024/file/e4c61f578ff07830f5c37378dd3ecb0d-Paper-Conference.pdf)
- [Function Calling and Agentic AI in 2025](https://www.klavis.ai/blog/function-calling-and-agentic-ai-in-2025-what-the-latest-benchmarks-tell-us-about-model-performance)

---

## Next Steps

1. **Check live leaderboard** for latest rankings: [gorilla.cs.berkeley.edu/leaderboard.html](https://gorilla.cs.berkeley.edu/leaderboard.html)
2. **Run BFCL evaluation** on your model: `pip install bfcl-eval==2025.12.17`
3. **Review BFCL paper** for methodology details
4. **Combine with domain metrics** for complete evaluation
