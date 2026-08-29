# Research Memo: Model Context Protocol (MCP) Servers and Tooling

**Date:** June 2026

## Executive Summary

The Model Context Protocol (MCP) has emerged as the dominant interoperability layer between AI systems and external tools, data sources, services, and user interfaces. Originally introduced by Anthropic in late 2024, MCP has evolved from a lightweight protocol for local tool integration into a broad ecosystem spanning AI IDEs, enterprise agent platforms, cloud services, and multi-agent systems.

This memo surveys:

- Current MCP standards and specifications
- Architectural conventions
- Server and tooling best practices
- Security and governance patterns
- Emerging paradigms
- Competing philosophies
- Likely future directions

---

# 1. What MCP Is

MCP is best understood as a protocol layer analogous to:

- HTTP for documents
- OpenAPI for APIs
- USB-C for peripherals
- MCP for AI capabilities

Instead of every AI host implementing custom integrations for every tool, MCP defines a standard interface for:

1. Capability discovery
2. Structured tool invocation
3. Resource access
4. Prompt publication
5. Authentication
6. Context exchange

The core ecosystem consists of:

- Hosts
- Clients
- Servers
- Tools
- Resources
- Prompts

---

# 2. Core Architectural Model

## Host

The AI application.

Examples:

- Claude
- ChatGPT integrations
- Cursor
- IDE assistants
- Agent frameworks

## Client

Protocol implementation inside the host.

Responsibilities:

- Capability discovery
- Connection management
- Authentication
- Tool invocation
- Resource retrieval

## Server

Provides capabilities.

Examples:

- Filesystem access
- Git repositories
- Databases
- Internal APIs
- CRM systems
- Cloud infrastructure

## Primitives

### Tools

Executable actions.

Examples:

- query_database
- create_ticket
- deploy_service

### Resources

Read-oriented contextual data.

Examples:

- Files
- Documents
- Database records
- Configuration state

### Prompts

Reusable prompt templates and workflows.

---

# 3. Current Specification Conventions

The post-2025 specifications increasingly emphasize:

## Capability Discovery

Servers advertise capabilities rather than requiring hard-coded integrations.

### Convention

Expose minimal, coherent capabilities.

Bad:

- 200 loosely related tools

Good:

- 10–20 strongly cohesive tools

## Schema-Driven Design

Tools expose structured schemas.

Best practice:

- Strict typing
- Strong validation
- Explicit required fields
- Predictable outputs

## Self-Describing Systems

Modern MCP philosophy strongly favors discoverability.

Tool descriptions are now treated as a critical component of system behavior.

---

# 4. Server Design Best Practices

## Single Responsibility Servers

The strongest emerging convention.

Instead of:

Monolithic enterprise MCP server

Prefer:

- CRM server
- Billing server
- Knowledge server
- Infrastructure server

Benefits:

- Security isolation
- Easier maintenance
- Better discoverability

## Capability Cohesion

Tools should solve related problems.

Bad example:

- Filesystem access
- Payroll approval
- Kubernetes deployment

in the same server.

## Explicit State Boundaries

Servers should clearly communicate:

- What state exists
- What state changes
- What permissions are required

---

# 5. Tool Design Best Practices

## Fewer Tools, Better Tools

A major lesson from production deployments.

Many small tools create:

- Discovery problems
- Selection ambiguity
- Context window pressure

Prefer:

- Rich, composable tools
- Strong schemas
- High semantic clarity

## Verb-Oriented Naming

Preferred:

- search_documents
- create_issue
- update_record

Avoid:

- doStuff
- executeAction

## Deterministic Outputs

Return structured outputs whenever possible.

Prefer:

```json
{
  "status": "success",
  "ticket_id": 1234
}
```

over free-form text.

---

# 6. Resource Design Philosophy

Resources increasingly function as a lightweight alternative to RAG.

## Modern View

Tools perform actions.

Resources provide context.

## Resource Patterns

### Immutable Resources

Examples:

- Documentation
- Policies
- Specifications

### Dynamic Resources

Examples:

- Dashboards
- Database views
- Monitoring data

Trend:

Expose data through resources before creating tools.

---

# 7. Prompt Publication Philosophy

Prompt primitives remain controversial.

Two schools exist.

## Minimalist School

Prompts are application concerns.

Servers should expose only:

- Tools
- Resources

## Workflow School

Servers should publish:

- Templates
- Procedures
- Guided workflows

Enterprise adoption increasingly favors workflow publication.

---

# 8. Authentication and Security

Security has become the dominant topic in MCP architecture.

## Zero Trust MCP

Emerging best practice:

Treat every MCP server as potentially hostile.

## Least Privilege

Servers should expose only:

- Minimum data
- Minimum permissions
- Minimum actions

## OAuth-Based Authentication

Recent specifications increasingly align MCP servers with OAuth resource server concepts.

Best practices:

- Scoped tokens
- Short-lived credentials
- Explicit consent

## Sandboxing

Production systems increasingly isolate MCP servers inside:

- Containers
- VMs
- Sandboxed runtimes

---

# 9. Major Security Risks

Research has identified several recurring classes of MCP-specific vulnerabilities.

## Prompt Injection

Malicious content influences model behavior.

## Tool Poisoning

Tools intentionally misrepresent functionality.

## Supply Chain Attacks

Compromised servers distributed through registries.

## Cross-Tool Privilege Escalation

Individually safe tools become dangerous when combined.

## Data Exfiltration

Sensitive information leaves approved boundaries.

---

# 10. Governance Patterns

Enterprise deployments increasingly add a governance layer.

## MCP Gateway Pattern

Instead of direct connections:

Host → Gateway → Servers

Benefits:

- Policy enforcement
- Logging
- Authentication
- Auditing

## Private Registries

Organizations increasingly avoid public registries.

Common architecture:

- Approved server catalog
- Signed releases
- Internal distribution

---

# 11. Emerging Paradigms

## Agent-Native Infrastructure

The newest philosophy.

Traditional architecture:

Humans use tools.

Agent-native architecture:

Agents use tools continuously.

MCP becomes infrastructure rather than integration.

## Capability Meshes

Organizations are beginning to model capabilities as interconnected MCP services.

This resembles:

- Service meshes
- API gateways

but for agents.

## Dynamic Skill Loading

Agents increasingly discover capabilities at runtime.

This reduces hard-coded workflows.

---

# 12. MCP Apps and Interactive Interfaces

One major evolution is the rise of MCP-delivered UI components.

Emerging capabilities include:

- Dashboards
- Forms
- Visualizations
- Interactive workflows

This extends MCP beyond text-based interaction.

The philosophical shift:

From tool execution
to
capability presentation.

---

# 13. Multi-Agent MCP

A rapidly growing area.

Patterns include:

## Shared Tool Layer

Many agents use the same MCP servers.

## Agent Specialization

Different agents own different capabilities.

## Delegation

One agent invokes another through MCP-mediated workflows.

This is moving MCP toward an operating-system-like role for agent ecosystems.

---

# 14. Observability and Reliability

Modern production deployments increasingly require:

- Audit trails
- Structured logging
- Distributed tracing
- Tool execution metrics

Emerging consensus:

Every tool invocation should be observable.

---

# 15. Philosophical Schools

## API-Centric School

MCP is simply a better API layer.

Focus:

- Tools
- Integrations
- Transactions

## Context-Centric School

MCP primarily distributes knowledge and context.

Focus:

- Resources
- Memory
- Retrieval

## Agent Infrastructure School

MCP becomes the operating fabric for autonomous systems.

Focus:

- Coordination
- Discovery
- Governance
- Dynamic capability composition

This third school appears to be gaining momentum.

---

# 16. Current Consensus Best Practices

1. Small, focused servers.
2. Strong schema validation.
3. Deterministic outputs.
4. OAuth-based authentication.
5. Least-privilege permissions.
6. Containerized execution.
7. Capability discovery over hard coding.
8. Private registries for enterprise use.
9. Comprehensive observability.
10. Human approval for high-risk actions.

---

# 17. Future Directions (2026–2028)

Likely developments:

### MCP Gateways

Centralized governance layers become standard.

### Signed Capability Registries

Trust frameworks emerge.

### Rich Interactive Components

UI delivery becomes mainstream.

### Agent-to-Agent Protocols

MCP increasingly used between agents.

### Policy-Aware Execution

Authorization becomes context-sensitive.

### Formal Verification

Safety validation for tool schemas and workflows.

---

# Conclusion

MCP is evolving from a protocol for tool invocation into a general infrastructure layer for agent ecosystems. The strongest trends are:

- Capability discovery
- Agent-native architectures
- Security-first design
- Governance layers
- Dynamic runtime composition
- Interactive UI delivery
- Multi-agent coordination

Organizations building serious MCP deployments increasingly treat MCP servers as production infrastructure rather than developer conveniences. The emerging consensus is that successful MCP systems require the same rigor applied to APIs, service meshes, and distributed systems, with additional controls for AI-specific risks such as prompt injection, tool poisoning, and cross-system privilege escalation.
