---
name: task-to-office-routing
date-created: 2026-04-05
serves: system-architecture-refactor
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

Produced by applying the library's work-ontology schema (`work-type`, `requires`, `produces`, `depends-on`) to potential task records, then matching `requires` against each office's `action-domain`.

## Summary

- Active tasks processed: **153**
- Files enriched (frontmatter changed): **167 total edits across 3 passes** (last pass: 3 files)

### Keys added (cumulative across all passes)

- `work-type`: +47
- `requires`: +153
- `produces`: +76
- `depends-on`: +0 (no tasks had `blocked-by` without also having `depends-on`)

### Consolidations

- closure-kind → work-type (renamed in place): 21
- closure-kind removed (work-type already present): 0

### Coverage after enrichment

- `work-type`: 153/153 (100%)
- `requires`: 153/153 (100%)
- `depends-on`: preserved wherever present (no `blocked-by`-only tasks found)
- `produces`: enriched on 76 tasks that previously lacked it

## Routing table

| task-id | work-type | requires | candidate offices | assigned-to |
|---------|-----------|----------|-------------------|-------------|
| audit-fars-spec-readability | derivation | review | reviewer, code-reviewer, security-reviewer | — |
| authority-scope-checking | derivation | writing, code-editing, graph-query, frontmatter-audit, dispatch | operations-officer, first-officer, researcher | — |
| auto-dispatch-scoring-refinement | procedure | dispatch | operations-officer, first-officer, planner | — |
| cde-decide-old-files | inquiry | code-editing | reviewer, code-reviewer, security-reviewer | — |
| cde-migrate-core-roles | process | writing, code-editing | researcher, writer, reviewer | — |
| cde-migrate-support-structures | process | writing, code-editing | researcher, writer, reviewer | — |
| cde-split-command-term | derivation | writing, code-editing | researcher, writer, reviewer | — |
| cde-update-crossrefs | process | code-editing | reviewer, code-reviewer, security-reviewer | — |
| change-provenance-tracking | inquiry | library-research | docs-lookup, operations-officer, researcher | — |
| ci-validation-pipeline | process | writing, code-editing, graph-query, frontmatter-audit | code-reviewer, security-reviewer, researcher | — |
| cl-instinct-to-duty-update | procedure | code-editing | reviewer, code-reviewer, security-reviewer | — |
| cl-office-scoped-instincts | procedure | code-editing | reviewer, code-reviewer, security-reviewer | — |
| cl-session-review-hook | procedure | code-editing, review | code-reviewer, reviewer, security-reviewer | — |
| coi-build-computational-bridge | derivation | code-editing | reviewer, code-reviewer, security-reviewer | — |
| coi-formalize-crew | derivation | writing | researcher, writer, first-officer | — |
| coi-formalize-hooks-as-runbooks | derivation | code-editing | code-reviewer, reviewer, security-reviewer | — |
| coi-rewrite-claude-md | procedure | code-editing | reviewer, code-reviewer, security-reviewer | — |
| coi-route-work-by-quartet | derivation | dispatch | first-officer, operations-officer, planner | — |
| command-history-replay | procedure | code-editing, graph-query, dispatch | code-reviewer, security-reviewer, first-officer | — |
| command-integration | procedure | writing | researcher, writer, operations-officer | — |
| computational-bridge | inquiry | code-editing, frontmatter-audit | code-reviewer, reviewer, security-reviewer | — |
| consolidate-fars-into-engineering-fars | process | code-editing, graph-query | code-reviewer, reviewer, security-reviewer | — |
| create-plugin-repo | process | code-editing | code-reviewer, reviewer, security-reviewer | — |
| decide-fars-declaration-pattern-tab-vs-qtops | inquiry | review, dispatch | reviewer, first-officer, operations-officer | — |
| decide-plugin-license | inquiry | library-research | researcher, docs-lookup, code-reviewer | — |
| decompose-fars-architecture-into-estimated-tasks | inquiry | writing, library-research, graph-query, review, frontmatter-audit | researcher, planner, writer | — |
| define-render-spec-format | procedure | code-editing, graph-query | reviewer, code-reviewer, security-reviewer | — |
| definition-derived-validation | derivation | writing, code-editing, graph-query, frontmatter-audit | researcher, code-reviewer, writer | — |
| delegation-tracking | procedure | code-editing | reviewer, code-reviewer, security-reviewer | — |
| derive-field-fallbacks-relationally | derivation | graph-query | graph-analyst, code-reviewer, reviewer | — |
| design-doc-bundle-mechanism | derivation | code-editing | reviewer, code-reviewer, security-reviewer | — |
| ecc-port-desktop-notify | derivation | writing, code-editing | code-reviewer, researcher, writer | — |
| ecc-port-governance-capture | procedure | code-editing | code-reviewer, rust-reviewer, reviewer | — |
| ecc-port-shared-utils | procedure | writing, code-editing | code-reviewer, researcher, writer | — |
| ecc-port-truncation-detection | procedure | code-editing | security-reviewer, code-reviewer, rust-reviewer | — |
| enrich-existing-terms-with-broader-traditions | procedure | writing, library-research | researcher, docs-lookup, writer | — |
| entity-inbox-per-office | procedure | code-editing | reviewer, code-reviewer, security-reviewer | — |
| failure-reassignment-saga | derivation | code-editing, dispatch | operations-officer, first-officer, reviewer | — |
| flatfile-contacts-schema | inquiry | writing, code-editing, graph-query, frontmatter-audit | researcher, writer, reviewer | — |
| flatfile-inventory-schema | inquiry | writing, code-editing, graph-query, frontmatter-audit | researcher, writer, reviewer | — |
| goal-tracking | procedure | code-editing | code-reviewer, reviewer, security-reviewer | — |
| gvc-add-argument-routing | procedure | code-editing, review, dispatch | code-reviewer, reviewer, security-reviewer | — |
| gvc-add-tool-hook-verification | procedure | code-editing, review | code-reviewer, reviewer, security-reviewer | — |
| harness-test-suite | process | code-editing | code-reviewer, reviewer, security-reviewer | — |
| hcr-graph-staleness-check | process | graph-query | graph-analyst, docs-lookup, harness-cleaner | — |
| hcr-session-start-diff | procedure | code-editing | code-reviewer, reviewer, security-reviewer | — |
| hcr-triage-dispatcher | procedure | writing, graph-query, frontmatter-audit | researcher, writer, triage-processor | — |
| hcr-work-record-creation | process | code-editing | reviewer, code-reviewer, security-reviewer | — |
| hugo-publish-integration | procedure | writing, code-editing, publishing | publisher, researcher, writer | — |
| ids-integrate-plan-command | procedure | code-editing | reviewer, code-reviewer, security-reviewer | — |
| ids-seed-from-session-logs | inquiry | review | reviewer, code-reviewer, security-reviewer | — |
| ids-session-start-integration | procedure | code-editing | code-reviewer, reviewer, security-reviewer | — |
| implement-create-with-template | procedure | writing, code-editing, graph-query, frontmatter-audit | researcher, writer, reviewer | — |
| implement-domain-navigation | derivation | writing, code-editing, graph-query | researcher, writer, reviewer | — |
| implement-frontmatter-validation | procedure | writing, code-editing, graph-query, frontmatter-audit | writer, reviewer, security-reviewer | — |
| implement-plan-status-view | derivation | code-editing | reviewer, code-reviewer, security-reviewer | — |
| implement-settings-tab | procedure | code-editing, graph-query | reviewer, code-reviewer, security-reviewer | — |
| implement-term-lookup | procedure | writing, code-editing | researcher, writer, reviewer | — |
| inline-diagram-injection | process | code-editing | code-reviewer, reviewer, security-reviewer | — |
| input-processing-pipeline | procedure | review, dispatch | reviewer, security-reviewer, first-officer | — |
| integrate-nuclear-quartet | procedure | writing | researcher, writer, docs-lookup | — |
| integrate-relationality-foundations | procedure | writing, graph-query | researcher, writer, graph-analyst | — |
| inter-session-messaging | derivation | graph-query | graph-analyst, chief-of-staff, researcher | — |
| local-svc-file-watcher | procedure | code-editing, graph-query | graph-analyst, rust-reviewer, reviewer | — |
| local-svc-rule-engine | inquiry | writing, graph-query, frontmatter-audit | researcher, writer, graph-analyst | — |
| mash-pkg-deployment-guide | procedure | code-editing | rust-reviewer, reviewer, code-reviewer | — |
| mermaid-emitter | derivation | code-editing, graph-query | reviewer, code-reviewer, security-reviewer | — |
| minimal-plugin-entry | procedure | code-editing, graph-query | code-reviewer, reviewer, security-reviewer | — |
| multi-session-dashboard | process | code-editing | code-reviewer, reviewer, security-reviewer | — |
| notification-system | procedure | dispatch | operations-officer, first-officer, chief-of-staff | — |
| ovo-dispatch-routing | procedure | dispatch | operations-officer, first-officer, planner | — |
| ovo-first-officer-integration | procedure | code-editing, dispatch | operations-officer, first-officer, chief-of-staff | — |
| ovo-mash-engine-office-dispatch | procedure | code-editing, dispatch | operations-officer, code-reviewer, rust-reviewer | — |
| plan-gantt-view | procedure | code-editing | reviewer, code-reviewer, security-reviewer | — |
| port-fars-core-typescript | procedure | code-editing | code-reviewer, reviewer, security-reviewer | — |
| port-tab-collect-bases-to-fars-core | procedure | code-editing | reviewer, code-reviewer, security-reviewer | — |
| port-tab-merge-models-to-fars-core | procedure | code-editing | reviewer, code-reviewer, security-reviewer | — |
| project-dashboard | procedure | code-editing | operations-officer, reviewer, code-reviewer | — |
| pta-crypto-integration | procedure | code-editing | reviewer, code-reviewer, security-reviewer | — |
| pta-design-chart-of-accounts | inquiry | library-research | researcher, docs-lookup, architect | — |
| pta-reporting-commands | procedure | code-editing | code-reviewer, reviewer, security-reviewer | — |
| push-pull-dispatch-selection | derivation | code-editing, dispatch | operations-officer, first-officer, reviewer | — |
| recurring-tasks | procedure | writing, graph-query, review, frontmatter-audit | researcher, writer, reviewer | — |
| redo-primitive-terms-with-captains-research | inquiry | writing, library-research, code-editing, graph-query, review | researcher, reviewer, code-reviewer | — |
| research-agent-governance-bridge | inquiry | writing, library-research, dispatch | researcher, writer, docs-lookup | — |
| research-foundational-ontology | inquiry | writing, library-research | researcher, writer, docs-lookup | — |
| rh-archive-retracted-records | procedure | code-editing | reviewer, code-reviewer, security-reviewer | — |
| rh-daemon-retraction-tick | procedure | code-editing | reviewer, code-reviewer, security-reviewer | — |
| risk-register | procedure | code-editing | reviewer, code-reviewer, security-reviewer | — |
| security-scanning-skill | procedure | code-editing | security-reviewer, code-reviewer, reviewer | — |
| session-artifact-linking | procedure | code-editing | reviewer, code-reviewer, security-reviewer | — |
| session-save-resume | procedure | code-editing | reviewer, code-reviewer, security-reviewer | — |
| skill-evolution-tracking | procedure | graph-query | graph-analyst, operations-officer | — |
| sprint-planning | procedure | code-editing | planner, operations-officer, reviewer | — |
| ssa-declare-independence-relation | procedure | code-editing | reviewer, code-reviewer, security-reviewer | — |
| ssa-register-predicates | procedure | writing | researcher, writer, chief-of-staff | — |
| subgraph-query-function | derivation | code-editing, graph-query | graph-analyst, reviewer, code-reviewer | — |
| submit-to-obsidian-community | process | code-editing | security-reviewer, reviewer, code-reviewer | — |
| tag-first-release | process | frontmatter-audit | — | — |
| task-history-tracking | procedure | review, dispatch | first-officer, operations-officer, reviewer | — |
| task-priority-matrix | procedure | dispatch | operations-officer, first-officer, chief-of-staff | — |
| task-template-system | procedure | writing, library-research, code-editing, review | researcher, writer, reviewer | — |
| time-tracking | procedure | code-editing | code-reviewer, operations-officer, reviewer | — |
| tool-call-logging | derivation | code-editing, graph-query | code-reviewer, security-reviewer, reviewer | — |
| tool-directory-restructure | process | code-editing | code-reviewer, reviewer, security-reviewer | — |
| ub-academy-onboarding | inquiry | library-research | researcher, docs-lookup, architect | — |
| ub-authentication-fiber | procedure | code-editing, graph-query | security-reviewer, reviewer, code-reviewer | — |
| ub-authorization-fiber | procedure | code-editing, graph-query, dispatch | first-officer, operations-officer, reviewer | — |
| ub-boundary-entity-spec | procedure | graph-query | graph-analyst | — |
| ub-captain-boundary | procedure | graph-query | graph-analyst, operations-officer | — |
| verify-plugin-in-obsidian | process | code-editing, graph-query, review | reviewer, code-reviewer, security-reviewer | — |
| view-entity-format | procedure | writing, code-editing, graph-query, frontmatter-audit | graph-analyst, researcher, writer | — |
| wdls-extract-nuclear-quartet | derivation | library-research, code-editing | researcher, docs-lookup, reviewer | — |
| wdls-move-fars-terms | derivation | writing, code-editing | writer, researcher, reviewer | — |
| wdls-split-operation-item | derivation | graph-query | graph-analyst, first-officer, planner | — |
| wdls-update-crossrefs | process | writing | researcher, writer, doc-updater | — |
| webui-add-axum-http | procedure | code-editing | rust-reviewer, reviewer, code-reviewer | — |
| webui-bridge-page | procedure | code-editing | reviewer, code-reviewer, security-reviewer | — |
| webui-crew-page | procedure | code-editing | reviewer, code-reviewer, security-reviewer | — |
| webui-json-api | procedure | code-editing, graph-query | code-reviewer, reviewer, security-reviewer | — |
| workload-balancing | procedure | dispatch | operations-officer, first-officer, planner | — |
| write-fars-explanations | inquiry | writing, graph-query | researcher, writer, graph-analyst | — |
| write-fars-howtos | derivation | writing, graph-query | researcher, writer, graph-analyst | — |
| write-fars-reference | procedure | writing, code-editing, graph-query, frontmatter-audit | writer, reviewer, researcher | — |
| write-fars-tutorials | derivation | writing | researcher, writer, operations-officer | — |
| write-plugin-readme | derivation | writing | researcher, writer, harness-optimizer | — |
| write-vault-adapter | derivation | writing | researcher, writer, doc-updater | — |
| achievement-system | procedure | writing, review | reviewer, operations-officer, researcher | harness-optimizer |
| agent-spawning-mechanic | derivation | writing, review | reviewer, researcher, writer | architect |
| character-command | procedure | code-editing | reviewer, code-reviewer, security-reviewer | harness-optimizer |
| character-sheet-data-model | procedure | review | operations-officer, reviewer, code-reviewer | harness-optimizer |
| mcp-add-comment | procedure | code-editing | code-reviewer, operations-officer, reviewer | harness-optimizer |
| mcp-add-milestone | procedure | writing, code-editing, graph-query, frontmatter-audit | code-reviewer, researcher, writer | harness-optimizer |
| mcp-agent-context-resource | procedure | writing, code-editing | researcher, writer, reviewer | harness-optimizer |
| mcp-block-unblock-task | procedure | code-editing | code-reviewer, reviewer, security-reviewer | harness-optimizer |
| mcp-create-plan | procedure | code-editing, graph-query | code-reviewer, operations-officer, reviewer | harness-optimizer |
| mcp-create-task-tool | procedure | code-editing, graph-query | operations-officer, code-reviewer, graph-analyst | harness-optimizer |
| mcp-create-term | procedure | writing, code-editing, graph-query | researcher, code-reviewer, writer | harness-optimizer |
| mcp-create-text | procedure | writing, code-editing, graph-query | researcher, code-reviewer, writer | harness-optimizer |
| mcp-domain-health | procedure | writing, code-editing, graph-query | researcher, writer, code-reviewer | harness-optimizer |
| mcp-heartbeat-tools | procedure | code-editing | code-reviewer, reviewer, security-reviewer | harness-optimizer |
| mcp-list-get-task-tools | procedure | code-editing | code-reviewer, reviewer, security-reviewer | harness-optimizer |
| mcp-plan-status-forecast-tools | procedure | code-editing | code-reviewer, reviewer, security-reviewer | harness-optimizer |
| mcp-ready-work-assign-tools | procedure | code-editing, dispatch | operations-officer, first-officer, code-reviewer | harness-optimizer |
| mcp-record-decision | procedure | code-editing, graph-query | code-reviewer, reviewer, security-reviewer | harness-optimizer |
| mcp-record-transaction | procedure | code-editing | code-reviewer, bookkeeper, reviewer | harness-optimizer |
| mcp-related-entities | procedure | code-editing, graph-query | code-reviewer, reviewer, security-reviewer | harness-optimizer |
| mcp-search-library | procedure | writing, code-editing, graph-query | researcher, writer, reviewer | harness-optimizer |
| mcp-stop-session | procedure | code-editing | code-reviewer, reviewer, security-reviewer | harness-optimizer |
| mcp-update-complete-task-tools | procedure | writing, code-editing, graph-query, frontmatter-audit | code-reviewer, researcher, writer | harness-optimizer |
| mcp-whats-next-parameterized | procedure | code-editing, dispatch | first-officer, operations-officer, code-reviewer | harness-optimizer |
| quest-view | procedure | writing, code-editing | researcher, writer, reviewer | harness-optimizer |
| ship-web-view | procedure | graph-query | graph-analyst, first-officer | harness-optimizer |

## Uninferrable tasks

_None — work-type inferred for all active tasks._

## Notes on inference

- `work-type` inferred from title/goal keywords per the four-type taxonomy: research/survey→inquiry, refactor/implement/write→procedure, compute/generate→derivation, install/deploy→process.
- `requires` inferred conservatively from surface keywords. Values NOT invented beyond: library-research, writing, code-editing, graph-query, review, frontmatter-audit, dispatch, publishing.
- `produces` inferred from artifact-keywords in title/goal.
- Office matching is a keyword scorer against each office's `action-domain` + representative tags; candidates are top-3.
