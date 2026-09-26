---
title: Relational Notebook Assistant (Agential Research Workspace)
status: someday
keywords:
  - idea
  - research
  - notebook
  - agents
description: Bundle collections of sources into dedicated research workspaces with bound agents that summarize, query, and extend the graph—Gemini Notebook-style, but backed by the universal relational computer.
---
# Idea: Relational Notebook Assistant

Bundle collections of sources into dedicated research workspaces with bound
agents that summarize, query, and extend the graph—Gemini Notebook-style, but backed
by the universal relational computer.

## 1. Core recognitions

- `NotebookWorkspaceRecognition`
  - A named workspace for a topic (paper stack, project, course, MUD arc, etc.):
    references to source recognitions, default views, and policies.
- `NotebookSourceRecognition`
  - Individual sources (papers, web pages, PDFs, notes, datasets) with
    metadata, import provenance, and links into the wider graph.
- `NotebookAgentRecognition`
  - Agents bound to a workspace (summarizer, question-answerer, outline-maker,
    critique-writer), each with role, capabilities, and measurement channels.
- `NotebookArtifactRecognition`
  - Outputs produced in the workspace: outlines, summaries, Q&A threads,
    hypotheses, reading plans, code snippets, lab procedures—each tied back to
    sources and agents.

## 2. Topology and measurement

- **Topology**
  - Workspaces collect sources via edges from `NotebookWorkspaceRecognition` to
    `NotebookSourceRecognition`s, and to relevant recognitions elsewhere
    (finance, ecology, MUD, etc.).
  - Agents are attached to workspaces and to specific flows (e.g. “watch new
    papers on X”, “track changes in this dataset”, “maintain this outline”).
  - Artifacts link both to the sources they depend on and to the agents that
    created them.
- **Measurement**
  - Per-workspace metrics: number of sources, artifacts, agent runs, update
    cadence, reading coverage, “staleness” of summaries.
  - Per-agent metrics: success rates, error/repair counts, user edits after
    suggestions, bias indicators.

## 3. Runbooks and flows

- `run_create_notebook_workspace`
  - Create a new workspace, attach initial sources, default views, and one or
    more `NotebookAgentRecognition`s.
- `run_ingest_sources_to_notebook`
  - Import documents/links/files into a workspace; normalize into
    `NotebookSourceRecognition`s and link them into the larger graph.
- `run_agent_update_workspace`
  - Have bound agents refresh summaries, outlines, Q&A, and other artifacts
    when sources or related recognitions change.
- `run_generate_reading_plan`
  - Use topology and measurement (coverage, difficulty, dependencies) to
    propose reading/experiment sequences for the workspace.

## 4. Cross-domain connections

- Builds on:
  - `archives-media.md`, `research-reading.md`, `lab-notebook.md`,
    `learning-curriculum.md` for sources and study.
  - `autonomous-relational-agents.md`, `agent-newsletters.md`, `llm-interpretation.md`
    for agents and language models.
  - `dataview-query-language.md`, `gui-graph-workbench.md` for views and query
    surfaces.
- Serves as the main “research surface” for many other ideas: finance, ecology,
  medical data, governance, MUD worldbuilding, etc., giving each topic its own
  bounded, traceable, agent-assisted notebook.
