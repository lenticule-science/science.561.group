---

description: Delegate a text-forming task to a local LLM via Ollama — classify, summarize, format, or transform supplied content
name: triage
enables-capabilities: [dispatch]
version: [0, 1]
runtime: mcp
triggers:
  - "delegate to ollama"
  - "local model"
  - "classify with ollama"
inputs:
  task: string
  context: string?
  model: string?
  temperature: number?
outputs:
  response: string
  model: string
  eval_count: number
  total_duration_ms: number
region:
  reads: []
  writes: []
part-of: agential-relations-system
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

Delegate a text-forming task to a local LLM via Ollama.

## MCP tool

`mcp__asr__delegate_task`

## Usage constraints

The local model is a text-forming tool, NOT a knowledge source. All
knowledge must be supplied in the `context` parameter. The model
transforms, classifies, or formats supplied content.

**Good uses:**
- Classify a file as term/concept/text (with file content as context)
- Generate frontmatter matching a schema (with schema + content)
- Summarize text in N sentences (with text as context)

**Bad uses:**
- Ask factual questions (no context needed = wrong tool)
- Generate knowledge from training data

## Available models

Check `ollama list` for installed models. Default: `qwen2.5:7b`.
