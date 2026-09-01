---
type: object
class: contemporary
status: active
depends-on:
  - tool.md
see-also:
  - teaching/explanations/tool-selection.md
  - ../morphisms/tool-discovery.md
references:
  - references/qin-toolllm2023.md
---

# Tool registry

A **tool registry** is a collection of available [tools](tool.md), possibly with metadata supporting [tool-selection](teaching/explanations/tool-selection.md) and [tool-discovery](../morphisms/tool-discovery.md).
It is the *namespace* the agent draws from when invoking tools.

## Registry roles

A registry serves:

- **Storage.** Tools and their schemas live in the registry.
- **Discovery.** Agents (or selection systems) find relevant tools through the registry.
- **Versioning.** Multiple versions of a tool may coexist with version metadata.
- **Access control.** Permissions on which agents can use which tools.
- **Observability.** Usage metrics per tool inform registry curation.

A registry is more than a list — it's a managed collection.

## Registry sizes

- **Small** (< 50 tools).
  All tools fit in prompt; selection is straightforward.
- **Medium** (50-500 tools).
  Retrieval before selection becomes useful.
- **Large** (1000+ tools).
  Retrieval-augmented selection necessary; selection accuracy depends heavily on retrieval quality.
- **Internet-scale** (millions of APIs, conceptually).
  Two-stage retrieval + ranking required.

Registry size affects every aspect of agent design.

## Registry sources

- **Application-defined.** Each application defines its own tool registry.
- **Standardized libraries.** Frameworks ship with common-tool registries.
- **Aggregated APIs.** Services like RapidAPI, Composio aggregate many third-party APIs into registries.
- **Discovered.** Agents may discover tools through introspection or documentation crawl.
- **MCP-style.** Model Context Protocol enables external tool servers expose registries via standardized protocol.

## Registry metadata

Beyond tool schemas, registries may store:

- **Tags / categories.** For browsing.
- **Embeddings.** For retrieval.
- **Usage statistics.** Frequency, success rate per tool.
- **Quality scores.** Aggregated assessments.
- **Cost / latency profiles.** For routing decisions.
- **Trust / safety classifications.** For permissioning.

Rich metadata enables better selection and routing.

## In contemporary AI

- **Function-calling APIs.** Implicit registries: the list of tools registered with the API call.
- **Frameworks.** LangChain Tools, LlamaIndex Tools, AutoGen registries.
- **Aggregators.** Composio (1000s of integrations), RapidAPI Hub, ToolBench corpus.
- **MCP** (Model Context Protocol).
  Standardized way to expose tool registries to LLMs across vendors.

## Registry curation

A non-trivial responsibility:

- **Adding tools.** What gets included.
- **Removing tools.** Deprecation, removal of unsafe tools.
- **Quality control.** Verifying tools work as declared.
- **Permissioning.** Who can add/use which tools.
- **Updates.** Keeping schemas current with implementations.

Bad curation produces bad agent outcomes.

## Limits

- **Registry quality dependency.** Agent quality depends on registry quality.
- **Selection scaling.** Per [selection-cost-bound](../theorems/selection-cost-bound.md), selection cost grows with registry size.
- **Trust.** Registries with untrusted tools introduce attack surface.
- **Version skew.** Tool implementations may diverge from registered schemas.

## Status

Standard concept.
Active development of registry standards (MCP) and aggregator services.
Foundational infrastructure for agentic systems at scale.
