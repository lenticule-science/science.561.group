---
title: "Agent-to-Agent Protocol"
description: "An open, vendor-neutral protocol (A2A) enabling communication and interoperability between opaque agentic systems — the inter-agent complement to MCP, donated by Google to the Linux Foundation in June 2025."
defines: Agent-to-Agent Protocol
domain: agents
dual-of: model-context-protocol
enables: multi-agent-system
requires: json-schema
acts-on: agentic-system
date-created: 2026-03-29
date-updated: 2026-03-29
---

The Agent-to-Agent protocol (A2A) is an open, vendor-neutral protocol enabling communication and interoperability between opaque [agentic systems](./agentic-system.md).
It is the inter-agent complement to [MCP](../domains/model-context-protocol/index.md): MCP standardizes how an agent connects to tools; A2A standardizes how agents connect to each other.

A2A was announced by **Google Cloud** at Google Cloud Next on **April 9, 2025**, with 50+ technology partners at launch.
Google donated the protocol to the **Linux Foundation** on **June 24, 2025** under the Apache 2.0 license.
The Linux Foundation formally established the Agent2Agent Protocol Project on **February 27, 2026**, with AWS, Cisco, Google, Microsoft, Salesforce, SAP, and ServiceNow as founding contributors. **Version 1.0** — the first stable, production-ready release — shipped in early 2026, with 150+ supporting organizations.

### Technical architecture

**Agent Cards.** A2A servers publish JSON metadata documents describing their identity, capabilities, skills, service endpoint, authentication requirements, and (as of v1.0) cryptographic signatures.
Clients discover agents by fetching their Agent Cards.
This is the discovery mechanism: before two agents can communicate, the client agent reads the server agent's Card to determine what it can do and how to talk to it.

**Tasks.** The fundamental unit of work.
Each task has a unique ID and progresses through a lifecycle: `working` → `completed` | `failed` | `canceled` | `rejected` | `input_required` | `auth_required`.
Terminal states are completed, failed, canceled, and rejected.
Tasks contain **Messages** (with a role of `user` or `agent` and one or more Parts: TextPart, FilePart, DataPart) and produce **Artifacts** (output documents, structured data, files).

**Protocol bindings.** Three standard bindings: JSON-RPC 2.0 over HTTP, gRPC, and HTTP/REST with JSON.
All maintain functional equivalence.
Core methods include `SendMessage`, `SendStreamingMessage`, `GetTask`, `ListTasks`, `CancelTask`, and `SubscribeToTask`.
Interaction patterns include synchronous request/response, streaming (SSE), asynchronous push notifications, and polling.

**Security.** Supports API Key, HTTP Basic/Bearer, OAuth 2.0, OpenID Connect, and Mutual TLS.
Extended Agent Cards require authentication.
V1.0 adds cryptographically signed Agent Cards and multi-tenancy support.

### Relationship to MCP

A2A and MCP are designed to be used together.
An agent uses MCP to connect to its tools (databases, APIs, file systems, code execution environments).
It uses A2A to communicate with other agents that may have different tools, different models, and different implementations.
The two protocols address orthogonal concerns: MCP is about what an agent can do; A2A is about how agents coordinate.
[PydanticAI](./pydantic-ai.md) integrates both protocols natively.

## Related terms

- [MCP](../domains/model-context-protocol/index.md) — agent-to-tool protocol (complementary to A2A)
- [Agentic system](./agentic-system.md) — the systems A2A connects
- [Agent orchestration](./agent-orchestration.md) — coordination patterns A2A enables
- [PydanticAI](./pydantic-ai.md) — framework with native A2A integration
