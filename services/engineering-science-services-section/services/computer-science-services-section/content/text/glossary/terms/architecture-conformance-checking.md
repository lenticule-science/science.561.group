---
description: Automated comparison of a codebase's actual module and dependency structure against a declared architecture description, reporting every disagreement. Knodel and Popescu's WICSA 2007 comparison surveys the approaches; ArchUnit is the class's current reference tool.
identity: architecture-conformance-checking
name: Architecture Conformance Checking
date-created: 2026-09-04
provenance:
  authors:
    - emsenn
    - claude-fable-5-1
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/561-group-services-section/content/text/glossary/terms/fabrication-friday.md
    - /home/emsenn/info/.claude/skills/dispatch-agents/SKILL.md
references:
  knodel2007:
    authors:
      - Jens Knodel
      - Daniel Popescu
    title: A Comparison of Static Architecture Compliance Checking Approaches
    year: 2007
    publication: Proceedings of the IEEE/IFIP Working Conference on Software Architecture (WICSA)
---
Architecture conformance checking is the automated comparison of a codebase's actual module and dependency structure against a declared architecture description, reporting each place the two disagree (Jens Knodel, Daniel Popescu, "A Comparison of Static Architecture Compliance Checking Approaches", WICSA 2007; ArchUnit is the class's current reference tool). This distinguishes architecture conformance checking from a manual architecture review read by a human against a diagram, since the checker's comparison is executed against the real dependency graph on every run rather than judged from memory at review time. The engineering consequence: the org's fitness functions are its architecture-conformance-checking instruments, and a fitness function's exit status, not a reviewer's approval, is the verdict on whether a change holds the declared architecture (import stratification, section layering).
