---
description: Normative specification for the 561 Group software system. Generated in conversation with emsenn 2026-03-11.
date-created: 2026-03-11
type: slop
---

# 561 Group System Specification

## Status

DRAFT. Incomplete. Contains only what is established. Do not extend with speculation.

---

## 1. Introduction

This document specifies the requirements for the 561 Group software system: the engine that runs the Group's knowledge repository as a live computational system.

---

## 2. Conventions

The key words MUST, MUST NOT, SHOULD, SHOULD NOT, MAY, and CANNOT in this document are to be interpreted as described in RFC 2119.

---

## 3. Definitions

**Agential semioverse**: An interactive semioverse enriched with agents, skills, and tools, where all operations are mediated by a disciplined skill calculus.

**QCHTTopos** (Quasicrystalline Hypertensor Topos): The mathematical universe in which the system operates.

**Skill**: A parametric procedure, composed from tools, that constitutes the sole admissible operational primitive in the system.

**Agent**: A participant in the system operating via an authorized skill set, characterized by a profile of the form `(role, goals, policy, skills, tools, memory)`.

---

## 4. System Identity

4.1. The 561 Group repository MUST be treated as an **agential semioverse** running in a **QCHTTopos**.

---

## 5. Implementation Requirements

5.1. Library content MUST be encoded as Markdown files with YAML frontmatter.

5.2. The implementation language MUST be Python.

5.3. Agent-to-system communication MUST use MCP (Model Context Protocol).

5.4. Library and engine development MUST proceed in parallel. Neither can be fully specified without the other.

---

## 6. Operational Requirements

6.1. All system operations MUST be mediated by skills. No operation MAY directly mutate system state outside of skill execution.

6.2. Every skill execution MUST produce an effect report.

6.3. Authorization MUST be enforced as a precondition to skill execution. It MUST NOT be enforced as a side effect.

---

## 7. References

- RFC 2119: Key words for use in RFCs to indicate requirement levels
- Agential semioverse specification (this repository)
- QCHTTopos specification (this repository)
