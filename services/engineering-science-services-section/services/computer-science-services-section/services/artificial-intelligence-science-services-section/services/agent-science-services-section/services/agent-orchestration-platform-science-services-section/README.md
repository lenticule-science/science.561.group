# Agent Orchestration Platform Science Services Section

This section studies the systems that make artificial agents operable across
time, workers, tools, and human institutions. It treats “agent orchestration
platform” as a comparative research object, not as the name of one product or
one undifferentiated software layer.

The section distinguishes at least five layers:

- agent runtimes that construct context, invoke models, and execute tools;
- work ledgers that persist tasks, claims, handoffs, review, and blockage;
- memory substrates that preserve events and derive reusable representations;
- control planes that represent organizations, budgets, policies, and operator
  intervention;
- durable-execution systems that recover workflows across process failure.

One implementation may combine several layers, but comparison should not erase
their different authority, durability, and isolation requirements. Model
Context Protocol and agent-to-agent protocols are interfaces between layers;
they are not by themselves governance or proof of delivery.

The dated notes and glossary here are scientific holdings. They do not make an
external product authoritative for the 561 Group, establish a procurement
decision, or prove that a repository design is implemented. Engineering
adoption belongs in the corresponding engineering service, and corporate
authority remains in the current 561 Group operational record.

Start with the [comparative dossier](./content/text/documents/articles/notes/2026/08/29/2026-08-29-comparative-dossier-on-agent-orchestration-platforms.md).
The [second durable-execution pass](./content/text/documents/articles/notes/2026/08/29/2026-08-29-second-pass-on-durable-agent-and-workflow-systems.md) compares workflow runtimes, the Kubernetes-native Dapr Agents surface, stateful agent memory, and the current Microsoft framework without collapsing them into one control plane.
The [interoperation and telemetry note](./content/text/documents/articles/notes/2026/08/29/2026-08-29-agent-interoperation-and-telemetry-boundaries.md) keeps remote-agent protocols and execution traces in their proper role: integration and observation, not authority.

The adjacent `openclaw-science-services-section` contains an earlier product-specific
corpus. It remains available for provenance while its March 2026 claims are
reconciled against current primary sources; it is not the taxonomy for this
section.
