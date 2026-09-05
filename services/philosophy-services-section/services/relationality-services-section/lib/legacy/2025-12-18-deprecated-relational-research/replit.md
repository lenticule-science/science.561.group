# Relationing Research Program Repository

## Overview
The Relationing Research Program develops a framework of logic, algebra, calculus, geometry, and physics derived from Lakota cosmogeny. This project extends Lakota culture and spiritual practice into the scientific community, building on the work of Vine Deloria Jr. and Aragorn. The repository itself is the research, comprising Markdown documents and Python tooling for navigation, querying, and editing, aiming to create an explorable, agent-accessible object of study.

## Recent Changes

### Corpus Cleanup & Standardization (November 2025)
Completed comprehensive cleanup of research corpus with the following results:
-   **Style Guide**: Created docs/CORPUS_STYLE_GUIDE.md (805 lines) defining reproducible formatting standards for Markdown, TOML frontmatter, math notation, citations, and semantic structure
-   **Files Archived**: 62 total files safely archived preserving diverged content
    -   51 .org files (Org-mode duplicates) → archive/org-files-archived-2025-11-09/
    -   11 artifacts (.pdf, .tex, .html, autosaves) → archive/artifacts-removed-2025-11-09/
-   **Frontmatter Added**: 44 .md files now have schema-compliant TOML frontmatter (37 txt/scientific-texts + 7 internal-theory)
-   **Database Re-ingested**: Fresh knowledge graph with 62 RelCells (45 files + 17 virtual), 391 edges, 16 terms extracted from proposing-relationing.md
-   **Current Corpus State**: 45 canonical Markdown files with standardized frontmatter, ready for querying and agent-based content creation

### API Architecture Alignment (November 2025)
Completed concept-aligned API architecture refactor (26 tests passing, architect-approved):
-   **Theory-Code Alignment**: Created `@relationing_cell` decorator to annotate endpoints with Relationing concepts (differentiation, recognition, relation, stabilization)
-   **Concept-Scoped Routers**: Refactored endpoints into routers aligned with theory (recognition.py, relation.py, metadata discovery)
-   **Metadata Discovery**: Added `/api/metadata/relationing/*` endpoints making the theory itself queryable via API
-   **Zero-Overhead Design**: Decorators are metadata-only, no runtime performance impact

## User Preferences
I prefer the AI to operate as an agent, meaning it should focus on one-shot, scriptable operations without requiring persistent services. My communication style is direct and I prefer clear, concise explanations. When making changes, I prefer iterative development and want the agent to ask before making major architectural or large-scale code modifications. Do not change the fundamental design principles of "Repository = Research," "Agent-accessible," "Thin interfaces," "Relationing alignment," and "Open science." I prefer detailed explanations for complex tasks, especially concerning theoretical alignments.

## System Architecture
The core system transforms the repository into a queryable knowledge graph. Files become `RelCells`, metadata and Git history form `Edges`, and concepts like terms and authors become `Virtual Cells`. This graph is stored in SQLite and is deterministically reconstructible.

**Key Technical Implementations:**
-   **Core Operations**: Graph representation (RelCells, Edges, Provenance), SQLite storage with virtual cell synthesis, a predicate registry (45+ relation types), repository scanning and ingestion, and graph traversal/query operations are complete.
-   **Interfaces**: A functional CLI (Typer + Rich) provides one-shot operations for agents. A FastAPI web interface offers visualization and browsing.
-   **Repository Structure**: Research content is organized in `txt/scientific-texts/relations/`, `internal-theory/`, `research-notes/`, and `ref/`. The RRPR Interface tools are in `rsc/` (models, database, parsers, ingestor, queries) and `rsc/api/` (concept-aligned API routers).
-   **UI/UX**: The web interface provides views for statistics, repository files, a dedicated cell viewer (`/cell/{id}`), Git commits, documents, terms, authors, and citations. The CLI uses Rich for formatted terminal output.
-   **Design Principles**: The repository *is* the research. Tools are designed to be agent-accessible, offering one-shot, scriptable operations. Interfaces are thin wrappers around core operations. The design aligns with Relationing theory principles and promotes open science.
-   **Key Concepts (from Proposing Relationing)**:
    -   **Differentiation**: Primitive act of being; distinguishing regions.
    -   **Recognition**: Regions produced by distinctions.
    -   **Relationing**: Framework derived from existence → differentiation → relation → reflexive stability.
    -   **Relational ∞-Topos Modality (RITM)**: Pattern of generation, fixation, and stabilization.
-   **Technical Specifications**: Uses Markdown + Python. Semantic IDs (lowercase, hyphens, dots) with uniqueness validation. TOML frontmatter for metadata. Citation format is frontmatter lists + inline `[@key]`. SQLite is used for storage, with RDF/SPARQL as an export option. Terms have `id`, `label`, and `description`. A comprehensive Markdown style guide is defined in `docs/CORPUS_STYLE_GUIDE.md` for corpus standardization.
-   **API Architecture**: Features a `@relationing_cell` decorator to annotate endpoints with theory concepts. Endpoints are refactored into concept-scoped routers (`recognition.py`, `relation.py`) aligning code structure directly with Relationing principles. Metadata discovery endpoints (`/api/metadata/relationing/*`) make the theory itself queryable via the API.

## External Dependencies
-   **Python Libraries**: Typer, Rich, FastAPI.
-   **Database**: SQLite.
-   **Version Control**: Git (for repository scanning and metadata extraction).
-   **Potential Future**: RDF/SPARQL for data export, D3.js/Cytoscape.js for graph visualization, Alembic for database migrations, Jinja2 for HTML templating.