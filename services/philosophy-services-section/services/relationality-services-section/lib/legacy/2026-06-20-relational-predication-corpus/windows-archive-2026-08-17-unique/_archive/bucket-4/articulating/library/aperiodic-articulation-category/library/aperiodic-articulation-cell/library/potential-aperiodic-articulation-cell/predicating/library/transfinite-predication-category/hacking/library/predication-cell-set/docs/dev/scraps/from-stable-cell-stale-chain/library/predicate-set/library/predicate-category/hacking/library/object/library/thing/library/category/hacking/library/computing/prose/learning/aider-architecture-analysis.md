---
title: "Aider Architecture Analysis"
description: "Analysis of Aider's repo map, git integration, edit formats, model routing, and verification loop — focused on patterns relevant to agentic harness design"
date-created: 2026-04-04
source: https://github.com/paul-gauthier/aider
keywords:
  - agentic-harness
  - code-editing
  - ai-pair-programming
---

Aider is an AI pair programming tool that operates from the terminal. It edits code in a git repository, auto-commits changes, and uses a "repo map" to give the LLM context about the full codebase without sending every file. This analysis covers the architectural decisions most relevant to agentic harness design: how Aider builds context, structures edits, routes between models, and verifies changes.

## Repo Map: PageRank Over a Definition-Reference Graph

The repo map (`repomap.py`) is Aider's most distinctive architectural feature. Rather than dumping file contents into context, it builds a ranked summary of the codebase's structure — which definitions matter most given the current conversation.

### How It Works

1. **Tag extraction via tree-sitter.** For each source file, Aider parses it with tree-sitter and runs language-specific tag queries (`.scm` files) to extract two kinds of tags: `def` (definitions — functions, classes, methods) and `ref` (references — usages of those names). If tree-sitter's tag queries only produce definitions (as with C++), Aider falls back to Pygments tokenization to backfill references.

2. **Graph construction with NetworkX.** The tags form a directed multigraph where nodes are files and edges represent "file A references a symbol defined in file B." Edge weights are multiplied by heuristics:
   - **10x** for identifiers mentioned in the user's current message
   - **10x** for identifiers that look like real names (snake_case, camelCase, kebab-case, 8+ chars)
   - **50x** for references originating from files already in the chat
   - **0.1x** for private names (leading underscore) or names defined in more than 5 files
   - Reference counts are square-rooted to prevent high-frequency imports from dominating

3. **PageRank with personalization.** The graph is fed to `nx.pagerank()` with a personalization vector that biases toward files in the chat, files mentioned in the conversation, and files whose path components match mentioned identifiers. This is the core insight: rather than manually selecting "relevant" files, the algorithm propagates relevance through the actual dependency structure.

4. **Rank distribution across definitions.** After PageRank, each node's rank is distributed across its outgoing edges proportional to weight. This produces a ranked list of `(file, identifier)` pairs — the most relevant definitions in the codebase.

5. **Tree context rendering.** The ranked definitions are rendered using `grep_ast.TreeContext`, which shows each definition with its surrounding structural context (parent scopes, class headers) but elides irrelevant lines. A binary search finds how many ranked tags can fit within the token budget.

6. **Token budget management.** The map has a configurable token limit (`map_tokens`, default 1024). When no files are in the chat, it expands by a multiplier (`map_mul_no_files`, default 8x) up to the context window minus 4096 padding. Caching kicks in when map generation takes more than 1 second.

### Relevance to Knowledge Graphs

The repo map is a runtime-generated knowledge graph with PageRank ranking. It solves the same problem our EAVT datastore addresses: given a large corpus, select the most relevant subset for a task. Key differences:

- Aider's graph is code-structural (definitions and references). Our graph is semantic (entities, attributes, relations).
- Aider regenerates per-message. Our graph is persistent and pre-computed.
- Aider uses PageRank for relevance. We could adopt similar graph-based ranking when selecting which entities to include in agent context.

## Git Integration: Auto-Commit with Attribution

The git layer (`repo.py`) wraps GitPython and auto-commits after each successful edit round.

### Commit Flow

1. **Dirty commit.** Before applying AI edits, Aider optionally commits any pre-existing dirty files to preserve the user's work as a separate commit.
2. **Diff generation.** `get_diffs()` computes the diff of specified files against HEAD (or index + working dir for initial commits).
3. **LLM-generated commit messages.** The diff is sent to a "weak model" (typically a cheaper model like gpt-4o-mini) with a commit message prompt. The system tries multiple models in sequence if the diff exceeds a model's context window.
4. **Attribution.** Aider modifies the git author/committer name by appending `(aider)` — e.g., "Jane Doe (aider)". This is controlled by several flags:
   - `--attribute-author`: Modify the Author field (default: yes for AI edits)
   - `--attribute-committer`: Modify the Committer field (default: yes)
   - `--attribute-co-authored-by`: Add a `Co-authored-by: aider (<model>) <aider@aider.chat>` trailer instead of modifying names
   - When co-authored-by is enabled, name modification is suppressed unless explicitly re-enabled
5. **Undo support.** Aider records the commit SHA before each message. The `/undo` command can revert to that point.

### Design Patterns

- **Each AI turn is one commit.** This makes every change atomic and reversible.
- **Separation of AI and human commits.** Dirty user changes are committed separately before AI edits, maintaining a clean attribution trail.
- **No branching.** Aider works on the current branch. It doesn't create feature branches or manage parallel workstreams.

## Edit Formats: A Taxonomy of Code Change Representations

Aider supports multiple "edit formats" — different ways the LLM can express code changes. Each has a dedicated `Coder` subclass. The format is selected per-model based on what works best empirically.

### SEARCH/REPLACE Blocks (EditBlockCoder, format: "diff")

The primary format. The LLM outputs blocks like:

```
filename.py
<<<<<<< SEARCH
old code here
=======
new code here
>>>>>>> REPLACE
```

**Parsing** (`editblock_coder.py`): Lines are scanned for the `<<<<<<< SEARCH`, `=======`, and `>>>>>>> REPLACE` markers. The filename is extracted from up to 3 lines preceding the SEARCH marker, with fuzzy matching against files in the chat.

**Application** (`editblock_coder.py:do_replace`): Multiple strategies are tried in order:
1. **Perfect match** — exact string match of the SEARCH block in the file
2. **Whitespace normalization** — strip uniform leading whitespace from both blocks and match
3. **Dotdotdot expansion** — if the SEARCH block contains `...` lines, treat them as wildcards
4. **Fuzzy matching** (disabled by default) — SequenceMatcher with 0.8 similarity threshold

**Error recovery**: If a SEARCH block fails to match, Aider tries it against all other files in the chat. If it still fails, it sends the error back to the LLM as a "reflected message" for self-correction (up to 3 reflections).

### Unified Diff (UdiffCoder, format: "udiff")

Used for GPT-4 Turbo models. The LLM outputs standard unified diff format. Application uses `search_replace.py` with the same flexible strategy cascade.

### Whole File (WholeFileCoder, format: "whole")

The LLM outputs the entire file content. Simple but expensive for large files. Used as a fallback for less capable models.

### Architect Mode (ArchitectCoder, format: "architect")

A two-phase approach:
1. **Architect model** (typically a strong reasoning model like o1, Claude Opus, or Deepseek R1) analyzes the request and produces natural language instructions describing what to change.
2. **Editor model** (typically a faster model like Claude Sonnet or GPT-4o) receives those instructions and produces actual SEARCH/REPLACE blocks.

The architect never sees the edit format rules — it just describes changes. The editor never sees the user's original request — it just follows the architect's instructions. This separation lets each model do what it's best at.

### Editor Variants

Several formats prefix the edit format with "editor-" (e.g., `editor-diff`, `editor-whole`). These are used for the editor phase of architect mode and have slightly different prompting.

### The `search_replace.py` Module: Flexible Patch Application

This module contains sophisticated strategies for applying edits even when the LLM's SEARCH text doesn't exactly match the file:

1. **Literal search-and-replace** — `str.replace()` if the search text appears exactly once
2. **Git cherry-pick** — Creates a temporary git repo, commits Original->Search->Replace, then cherry-picks Replace onto Original. This leverages git's merge machinery for conflict resolution.
3. **diff-match-patch line-level** — Google's diff-match-patch library applied at the line level for fuzzy patching
4. **Relative indentation** — A custom `RelativeIndenter` that converts absolute indentation to relative (delta from previous line), applies the edit, then converts back. This handles the common case where the LLM gets the indentation level wrong but the relative structure right.

Each strategy is tried with combinations of preprocessing: strip blank lines, relative indent, reverse lines.

## Model Routing

Aider uses a YAML configuration (`model-settings.yml`) to assign capabilities to models. Key settings per model:

| Setting | Purpose |
|---------|---------|
| `edit_format` | Which edit format the model uses (whole, diff, udiff, architect) |
| `weak_model_name` | Cheaper model for commit messages and summarization |
| `editor_model_name` | Model to use as editor in architect mode |
| `editor_edit_format` | Edit format for the editor model |
| `use_repo_map` | Whether this model benefits from the repo map |
| `lazy` | Model tends to omit unchanged code (needs reminders) |
| `cache_control` | Whether to use Anthropic-style prompt caching |
| `use_system_prompt` | Some models (o1) don't support system prompts |
| `reasoning_tag` | Tag name for extended thinking content |

**Routing patterns:**
- **Claude Sonnet models** use `diff` format (SEARCH/REPLACE) with `editor-diff` as editor format and themselves as their own editor model
- **Claude Opus / o1 / Deepseek R1** use `architect` format — they reason about changes, then delegate to a Sonnet/GPT-4o editor
- **GPT-4o** uses `diff` format with repo map enabled
- **Weaker models** (GPT-3.5) use `whole` format — they can't reliably produce SEARCH/REPLACE blocks

The alias system (`MODEL_ALIASES`) maps short names like "sonnet", "opus", "haiku" to canonical model identifiers.

## Linting and Testing Integration

### Lint Loop (`linter.py`)

After edits are applied, `lint_edited()` runs linting on each changed file:

1. **Language detection** via `filename_to_lang()` (tree-sitter grammar lookup)
2. **Built-in basic lint**: tree-sitter parse to find syntax errors (`ERROR` nodes or `is_missing` nodes)
3. **Python-specific**: `compile()` to catch syntax errors, plus flake8 for fatal errors only (E9, F821, F823, F831, etc.)
4. **Custom linters**: Users can set per-language or global lint commands via `--lint-cmd`

Lint errors are formatted with `TreeContext` to show the error location with surrounding code structure, then fed back to the LLM as a reflection message.

### Test Integration

Users configure a test command (`--test-cmd`). After edits (and linting), Aider runs the test command. If tests fail, the output is fed back to the LLM for self-correction.

### Reflection Loop

The `run_one()` method implements a reflection loop:
1. Send message to LLM, get response
2. Apply edits (may set `reflected_message` on failure)
3. Lint edited files (may set `reflected_message` on errors)
4. Run tests (may set `reflected_message` on failure)
5. If `reflected_message` is set, repeat from step 1 (up to `max_reflections`, default 3)

This creates a tight feedback loop: edit -> verify -> fix, without human intervention.

## Context Management

### Chat Files vs. Other Files

Aider distinguishes:
- **Chat files** (`/add`): Full content sent to the LLM, editable
- **Read-only files** (`/read-only`): Full content sent but not editable
- **Other files**: Only appear in the repo map as structural summaries

### Message Assembly

The `ChatChunks` system assembles the prompt from:
1. System message (edit format rules, examples)
2. Repo map (ranked structural summary)
3. Read-only file contents
4. Chat file contents
5. Conversation history (done messages, possibly summarized)
6. Current message with reminder

### Summarization

When conversation history grows too long, a background thread summarizes older messages using the weak model, preserving the conversation's key decisions while reducing token count.

## Architectural Lessons for Harness Design

1. **Graph-based context selection outperforms heuristics.** Aider's PageRank repo map is more principled than "send the files the user mentioned." The same approach — build a graph of relationships, rank by relevance — applies to any knowledge corpus.

2. **Edit format diversity matters.** Different models have different strengths. Having multiple edit representations and selecting per-model is a form of model routing that significantly affects reliability.

3. **Reflection loops with concrete feedback are high-leverage.** The lint -> test -> reflect cycle is simple but effective. The key is that feedback is concrete (actual error messages, actual test output) rather than abstract.

4. **Architect/editor separation decomposes the problem well.** Strong reasoning models plan; fast models execute. This is directly analogous to our planner/writer agent split.

5. **Git as undo mechanism makes AI edits safe.** Every change is committed, so any change can be reverted. The user never loses work. This is why Aider can be aggressive about applying changes.

6. **Flexible patch application is essential.** LLMs don't produce exact matches reliably. The cascade from exact match through whitespace normalization, git cherry-pick, and diff-match-patch handles real-world LLM output gracefully.

## See Also

- [Cline Architecture Analysis](./cline-architecture-analysis.md) — VS Code extension with tool-use approach
- [ECC Hook Architecture](./ecc-hook-architecture-analysis.md) — Our own harness hook system
- [Continuous Learning in Agentic Harnesses](./continuous-learning-in-agentic-harnesses.md) — Learning systems across tools
