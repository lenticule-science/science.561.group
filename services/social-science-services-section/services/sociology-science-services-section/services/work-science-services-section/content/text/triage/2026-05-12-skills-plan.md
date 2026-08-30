# Skills and Subagents Exploration Plan

## Immediate Learning Goals (Next 1-2 Sessions)

### 1. Deep Dive into Predication Theory
- Study the Predicated Markdown Vault Knowledge System specifications
- Understand the core concepts: predication cells, truth-state pluralism, predicates-as-first-class
- Examine how this theory is implemented in the polity's infrastructure

### 2. Agent System Comprehension
- Study how agent-forms are defined and used in the dispatch system
- Understand the relationship between persona, agent, personnel, and officer
- Examine existing agent records in governance/agents/

### 3. Skill System Mastery
- Complete the skill-creator skill tutorial
- Create a simple test skill to understand the workflow
- Learn how to package and distribute skills

## Medium-Term Exploration (3-5 Sessions)

### 1. Research Contribution Tools
- Create a skill that helps navigate the theories/ directory structure
- Build a subagent that can suggest where new theories might fit
- Develop tooling for checking theory consistency and dependencies

### 2. Agent Lifecycle Management
- Create skill for spawning and monitoring agent subagents
- Build utilities for checking agent readiness and workload
- Develop templates for common agent-form patterns

### 3. Knowledge System Maintenance
- Skill for validating new theory contributions
- Subagent that can crawl and suggest improvements to existing theories
- Tools for generating theory diagrams or dependency graphs

## Long-Term Vision (Beyond 5 Sessions)

### 1. Autonomous Research Assistant
- Subagent that can read new theories and identify connections
- Skill for generating research questions based on current knowledge gaps
- Tools for simulating theory implications

### 2. Polity Operations Toolkit
- Complete suite of skills for managing the 561 polity
- Automated deployment and monitoring tools
- Governance process assistants

## Specific Skill Ideas to Prototype

### Predication Helper Skill
- Commands: analyze-predication, validate-predication-cell, generate-predication-shape
- References: links to core predication theory documents
- Assets: templates for predication cells and graphs

### Theory Navigator Skill
- Commands: find-related-theories, suggest-theory-location, check-theory-consistency
- References: full theories/ directory structure with indexing
- Uses: grep and frontend relations to build theory maps

### Agent Lifecycle Skill
- Commands: list-agents, spawn-agent, monitor-agent-workflow
- Integrates with: dispatch system, taskflow, skill system
- References: agent-form concepts and existing agent records

## First Experiment: Create a Simple Skill

Let me start by creating a basic "561-orientation" skill that helps new instances understand the workspace.
