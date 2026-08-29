---
title: "Development Guidelines - Relationing Research Program Repository"
date-created: 2026-03-06T00:00:00
---
# Development Guidelines - Relationing Research Program Repository

## Project Overview

This repository IS the **Relationing Research Program** - the canonical repository for researching Relationing concepts developed by emsenn, building on Vine Deloria Jr. and Aragorn. The Python tooling in this repository provides infrastructure for navigating, understanding, and editing the research itself.

**The Repository = The Research**
- Markdown files, theory documents, notes = the actual research
- Python scripts = tools for querying, traversing, and modifying that research
- Web/CLI interfaces = thin wrappers around one-shot operations agents can execute

**RRPR Interface**: Infrastructure applying Relationing principles (differentiation, recognition, relation, stabilization) to make the repository itself queryable as a knowledge graph. This tooling is general-purpose and could be applied to any repository as an object of study.

## Architecture

### Repository Structure

**Research Content** (the primary entity):
```
txt/                    # Scientific texts, core theory
  scientific-texts/relations/proposing-relationing.md  # Foundation
internal-theory/        # Theoretical developments
research-notes/         # Working explorations
ref/                    # Reference materials, bibliography
```

**RRPR Interface** (navigation/editing tools):
```
rsc/                    # Core operations (to be renamed rrpr_interface/)
  database.py           # Graph storage (SQLite)
  ingestor.py           # Transform files → graph nodes
  query.py              # Graph traversal operations
  predicates.py         # Relation types registry
  frontmatter_parser.py # Extract TOML metadata
  git_extractor.py      # Repository scanning
  virtual_cells.py      # Synthesize abstractions
  cli/main.py           # CLI interface (Typer)

cli.py                  # CLI entry point (thin wrapper)
app.py                  # Web interface (thin wrapper, needs refactoring)
docs/                   # Interface documentation
  SCHEMA_SPECIFICATION.md  # Graph schema
  QUERY_MODEL.md           # Relationing semantics
```

### Graph Representation

The interface maintains a SQLite graph with three core tables representing repository structure:

1. **relcells** - Entities (files, commits, virtual entities)
   - `differentiation_mode`: How the entity came to exist (git-tree, frontmatter, virtual-synthesis)
   - `is_virtual`: Boolean flag for synthesized entities
   - Provenance: branch, commit_hash

2. **edges** - Typed relations between entities
   - subject_id → predicate → object_id (or object_literal)
   - 45+ predicate types (has_type, cites_internal, defines_term, commit_parent_of, etc.)

3. **provenance** - Origin tracking
   - source_path, ingestor, timestamp

### Relationing Conceptual Mapping

| Technical Primitive | Relationing Concept | Meaning |
|-------------------|-------------------|---------|
| RelCell (row) | Act of Differentiation | Entity brought into being |
| differentiation_mode | Mode of Differentiation | How entity came to exist |
| Edge | Relation | Connection between entities |
| Predicate | Type of Relation | Nature of connection |
| Virtual Cell | Recognition | Synthesized abstraction |
| Path | Relational Chain | Sequence of relations |
| Closure | Relational Space | Complete reachability domain |

## Development Policies

**Remember**: You are building navigation/editing tools for a research repository, not a standalone application. Every feature should serve researchers' ability to query, traverse, and understand the repository structure.

### 1. Preserve Relationing Alignment

**DO**:
- Maintain `differentiation_mode` tracking on all cells
- Use semantically meaningful predicates from the registry
- Document how new features map to Relationing concepts
- Reference theoretical foundations when adding capabilities

**DON'T**:
- Remove or rename `differentiation_mode` field
- Add predicates without registering them in `predicates.py`
- Create features that contradict RITM phases (generation→fixation→stabilization)

### 2. Database Integrity

**DO**:
- Use Alembic migrations for all schema changes (once set up)
- Maintain provenance tracking on all edges
- Respect .gitignore during Git ingestion
- Use parameterized SQL queries (prevent injection)

**DON'T**:
- Modify schema directly without migration
- Delete data without explicit user approval
- Ingest files that should be ignored (check .cache/, __pycache__/)
- Use string concatenation for SQL queries

### 3. Code Organization

**DO**:
- Write one-shot scripts that agents can execute independently
- Keep web/CLI interfaces thin (they're just wrappers around core operations)
- Make operations composable and scriptable
- Use pure functions for graph algorithms

**DON'T**:
- Build monolithic applications that require persistent services
- Put complex logic in interface layers (web/CLI)
- Create unnecessary abstractions that obscure operations
- Hardcode assumptions about how tools will be used

**Remember**: The goal is agent-accessible operations, not a "product"

### 4. Testing Requirements

**DO**:
- Write pytest tests for new features
- Use temporary SQLite databases in test fixtures
- Test edge cases (empty graphs, cycles, disconnected components)
- Add regression tests for bugs

**DON'T**:
- Test against production database
- Skip tests for complex graph algorithms
- Mock core database operations (use real SQLite)
- Ignore test failures

### 5. API Design

**DO**:
- Use Pydantic models for request/response validation
- Return structured metadata with all queries
- Include Relationing semantic context in responses
- Document endpoints with OpenAPI/Swagger

**DON'T**:
- Return raw SQLite rows without transformation
- Omit error handling for invalid inputs
- Expose internal IDs without context
- Break backward compatibility without versioning

### 6. CLI Design (Typer)

**DO**:
- Use Typer for composability and auto-documentation
- Share validation logic with API layer
- Provide progress feedback for long operations
- Support both interactive and scriptable modes

**DON'T**:
- Duplicate validation between CLI and API
- Print stack traces to users (log them instead)
- Require interactive input in scripts
- Mix output formats (use --format flag)

### 7. Documentation

**DO**:
- Update `replit.md` for architectural changes
- Document Relationing semantics for new features
- Keep SCHEMA_SPECIFICATION.md synchronized with schema
- Add inline docstrings with examples

**DON'T**:
- Document implementation details in user guides
- Let documentation diverge from code
- Omit theoretical grounding for features
- Write jargon-heavy docs (users are researchers, not engineers)

## Common Tasks

### Adding a New Predicate

1. Register in `rsc/predicates.py` with category and description
2. Document Relationing semantics (what relation does it express?)
3. Update SCHEMA_SPECIFICATION.md if needed
4. Add to relevant ingestor (frontmatter_parser.py or git_extractor.py)

### Adding a Query Operation

1. Implement pure function in `rsc/query.py`
2. Add FastAPI endpoint in appropriate router (once refactored)
3. Add CLI command in `rsc/cli/` (once migrated)
4. Document in QUERY_MODEL.md with Relationing semantics
5. Write pytest tests for edge cases

### Ingesting New Metadata

1. Extend frontmatter schema in `frontmatter_parser.py`
2. Create virtual cells if needed (see `virtual_cells.py`)
3. Generate edges with appropriate predicates
4. Update provenance tracking
5. Test with Proposing Relationing document (golden test case)

### Modifying Database Schema

1. Create Alembic migration (once migrations are set up)
2. Update `rsc/database.py` schema definition
3. Regenerate database or run migration
4. Update SCHEMA_SPECIFICATION.md
5. Test data integrity with existing corpus

## Current Refactoring Status

**In Progress** (as of November 2025):
- [x] Migrating CLI from argparse to Typer ✅
- [ ] Refactoring app.py into `rsc/api/` routers
- [ ] Adding pytest testing framework
- [ ] Setting up Alembic migrations
- [ ] Implementing structured logging
- [ ] Creating MkDocs documentation site

**Completed**:
- [x] Phase 1: Core schema (RelCells, Edges, Provenance)
- [x] Phase 2: Ingestion pipeline (Markdown, Git, frontmatter)
- [x] Query system with graph traversals
- [x] FastAPI web interface (monolithic, needs refactoring)
- [x] CLI tool (argparse-based, migrating to Typer)
- [x] differentiation_mode field tracking

## Research Workflow Support

The interface enables researchers (human and AI) to ask questions about the repository:

1. **Differentiation Chains**: "How does concept X propagate through the corpus?"
   - Query: `traverse(term_cell, predicates=["cites_internal"], max_depth=3)`

2. **Recognition Regions**: "What virtual entities were synthesized from document Y?"
   - Query: `neighbors(doc_cell, predicates=["defines_term", "authored_by"])`

3. **Stabilization Checks**: "Are there unstable relational structures?"
   - Query: `detect_cycles(predicate="cites_internal")`

When adding features, ask: "How does this enable Relationing research?"

## Getting Started

### For AI Assistants

**You are helping maintain research infrastructure, not building a software product.**

1. Read `replit.md` to understand the research program
2. Read `txt/scientific-texts/relations/proposing-relationing.md` for theoretical foundation
3. Review `docs/SCHEMA_SPECIFICATION.md` for how repository maps to graph
4. Check `docs/QUERY_MODEL.md` for Relationing semantics in operations
5. Run `python3 cli.py stats` to see current repository state
6. Think: "How does this help researchers navigate/understand the repository?"

### For Human Researchers

**The repository is the research. The Python tools help you navigate it.**

1. Browse research content in `txt/`, `internal-theory/`, `research-notes/`
2. Use CLI to query structure: `python3 cli.py query neighbors <id>`
3. Use web interface to visualize connections (auto-starts on port 5000)
4. Run one-shot operations to understand relationships
5. The graph representation helps you see how concepts relate

**For Infrastructure Developers**:
1. Dependencies managed automatically
2. Graph built via: `python3 cli.py ingest repo`
3. Tests: `pytest` (once created)
4. Keep interfaces thin - they're just wrappers around core operations

### CLI Quick Reference

```bash
# View all commands
python3 cli.py --help

# Ingest repository
python3 cli.py ingest repo

# View statistics
python3 cli.py stats

# Query the graph
python3 cli.py query neighbors <cell_id>
python3 cli.py query path <from_id> <to_id>
python3 cli.py query cycles cites_internal

# List entities
python3 cli.py list files --limit 20
python3 cli.py list documents
python3 cli.py list terms
```

## References

- **Theoretical Foundation**: `txt/scientific-texts/relations/proposing-relationing.md`
- **Schema Spec**: `docs/SCHEMA_SPECIFICATION.md`
- **Query Model**: `docs/QUERY_MODEL.md`
- **Project Memory**: `replit.md`

## Support

This is research infrastructure for the Relationing Research Program. Development prioritizes:
1. **Serving the research**: Tools must help researchers navigate/understand the repository
2. **Theoretical alignment**: Operations should emerge from Relationing principles
3. **Agent accessibility**: Everything should be scriptable and one-shot executable
4. **Open science**: Infrastructure design follows from Relationing's closure operations
5. **Simplicity**: Thin interfaces, composable operations, no unnecessary complexity

**When in doubt**: Ask "Does this help researchers understand the repository?" not "Is this good software engineering?"

The repository is the research. The code is just tooling.

