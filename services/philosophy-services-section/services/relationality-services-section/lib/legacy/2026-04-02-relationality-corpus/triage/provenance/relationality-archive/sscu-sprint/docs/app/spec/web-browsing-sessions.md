---
name: web-browsing-sessions
keywords:
  - idea
  - web
  - browsing
part-of: relational-computer
description: "Treats web browsing history as a graph of pages, sessions, tabs, and hyperlinks."
---

Treat web browsing history as a graph over recognitions—pages, sessions, tabs,
and hyperlinks—so the relational computer can reason about exploration,
attention, and provenance.

## 1. Core recognitions

- `WebPageRecognition`
  - URLs with content snapshots, metadata (title, author, site), and parsed
    structure (headings, links, citations).
- `WebSessionRecognition`
  - Browsing sessions: start/end times, device, associated identity, sequence
    of visited pages.
- `TabRecognition`
  - Individual tabs/windows with their page sequences and relationships
    (forked tabs, back/forward navigation).
- `HyperlinkRecognition`
  - Directed edges between pages with link context (anchor text, position,
    inferred intent).

## 2. Topology and measurement

- **Topology**
  - Hyperlink graph of pages.
  - Session graph showing how you traverse the web, which branches you explore,
    and which topics you dwell on.
- **Measurement**
  - Time-on-page, revisit frequency, branching factor, “rabbit hole” depth.
  - Per-domain metrics (by site, topic, or recognition categories).

## 3. Runbooks and flows

- `run_import_browsing_history`
  - Ingest browser history into `WebSessionRecognition` and
    `WebPageRecognition` with hyperlink edges.
- `run_summarize_sessions`
  - Generate summaries of sessions (topics explored, sources consulted,
    outcomes) as recognitions for later recall and analysis.
- `run_recommend_next_reads`
  - Suggest follow-up pages or topics based on gaps, interests, and ongoing
    projects/notebooks.

## 4. Cross-domain connections

- Feeds:
  - research notebooks, reading queues, personal site content, finance/health
    analyses, and more.
- Provides a rich context for LLM/agent interpretation of what you’re doing on
  the web and how it connects to the rest of your relational universe.

