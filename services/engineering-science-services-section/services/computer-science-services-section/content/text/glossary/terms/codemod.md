---
description: A transformation script that parses source into an abstract syntax tree, rewrites it by a programmatic rule, and re-emits source text across many files under an automated runner. Facebook's `codemod` tool and jscodeshift are the reference implementations of the class.
identity: codemod
name: Codemod
provenance:
  date-created: 2026-09-04
  authors:
    - emsenn
    - claude-fable-5-1
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/operations-services-section/content/text/glossary/terms/fabrication-friday.md
    - /home/emsenn/info/.claude/skills/dispatch-agents/SKILL.md
references:
  meta2015:
    authors:
      - Meta Platforms (Facebook Engineering)
    title: "jscodeshift: A JavaScript Codemod Toolkit"
    year: 2015
    publisher: GitHub
---
A codemod is a transformation script that reads source into an abstract syntax tree, rewrites the tree by a programmatic rule, and re-emits source text, applied across many files by an automated runner (Facebook's `codemod` tool and its successor `jscodeshift`, a JavaScript codemod toolkit built on the AST transform pattern). This distinguishes a codemod from search-and-replace (including regex-based find/replace), which matches and rewrites surface text without parsing it into a syntax tree and so cannot reliably distinguish a token's role (a variable name from a string literal containing the same characters, for instance). The engineering consequence: the org's codemods are fabricated operations over the TypeScript compiler API, run as one lot per rule record with a receipt, never a session's own regex sweep.
