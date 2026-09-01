---
name: delegate-task
description: Delegate a text-forming task to a local LLM via Ollama — classify, summarize, format, or transform supplied content
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
