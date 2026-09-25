---
name: "Policy as code for knowledge repositories"
date-created: 2026-03-07
type: text
authors:
  - claude
keywords:
  - PolicyAsCode
  - KnowledgeOrganization
  - AgentialSemioverse
cites:
  - "Open Policy Agent"
  - "ESLint configuration cascade"
description: "Survey of policy-as-code patterns from infrastructure engineering and their applicability to AI-agent-operated knowledge repositories."
---

Policy as code (PaC) is the practice of expressing governance rules as
machine-readable files that tools evaluate and enforce automatically.
The pattern is well-established in infrastructure engineering (cloud
permissions, deployment pipelines, code linting) but has not been
applied to knowledge repositories where AI agents operate under
discipline-specific constraints. This text surveys the relevant
patterns and identifies what a knowledge repository can borrow.

## The decision architecture

Every PaC system separates three concerns:

1. **Policy declaration** — what the rules are, expressed as data
2. **Input data** — what the agent wants to do, expressed as structured
   context
3. **Evaluation** — input + policy = decision (allow, deny, warn)

Open Policy Agent (OPA), the CNCF-graduated standard, implements this
separation using Rego, a declarative language inspired by Datalog. The
key insight is that policy *decisions* are decoupled from policy
*enforcement*: the system sends structured data to the policy engine,
which returns a decision. The system then acts on the decision. This
means policies can express "almost any kind of invariant" without the
policy engine needing to know what the system does.

## Terminology

The industry uses several overlapping terms, each with a slightly
different emphasis:

| Term | Emphasis | Best use |
|---|---|---|
| **Policy** | High-level organizational rule | Umbrella term for the system |
| **Rule** | Single evaluable statement | Individual machine-readable constraint |
| **Constraint** | Restriction that must hold | Boundary conditions |
| **Guardrail** | Protection without prohibition | Human-facing documentation |
| **Invariant** | Property that always holds | Formal/mathematical register |

"Policy" is the standard umbrella term. Individual statements within a
policy are "rules" or "constraints." "Guardrail" communicates the spirit
(enabling, not restricting) but is too informal for structured data.

## Directory-based inheritance

Multiple systems implement policy inheritance through directory
hierarchies, and the patterns are consistent:

**`.editorconfig`** — cascading config files in directories that control
formatting rules, with inheritance up the tree until `root = true`.

**ESLint's legacy `.eslintrc` cascade** — each directory could contain a
config that merged with parent configs. This was powerful but was
deprecated because unintended ancestor configs caused confusion. ESLint
moved to a single flat config with glob-based overrides.

**Google Cloud Organization Policies** — constraints applied at
org/folder/project levels with explicit inheritance. Deny values always
take precedence over allow values.

**AWS Service Control Policies** — JSON documents that set permission
boundaries across an account hierarchy. Effective permissions are the
intersection of all ancestor policies.

The ESLint cautionary tale is important: cascading directory configs are
intuitive but cause real confusion from unintended ancestor inheritance.
The lesson: support inheritance but make it explicit, and provide a
clear root boundary (`root: true`).

### Inheritance semantics

Two models dominate:

- **Union/merge** — effective policy is the union of all ancestor
  policies. Used when policies are additive (IAM permissions).
- **Override with precedence** — closest config wins on conflict. Used
  when policies constrain (linting rules, formatting).

For a knowledge repository, the override model is appropriate:
discipline-level rules specialize project-level rules. A mathematics
directory might override `requires_citation: true` with
`requires_formal_proof: true` (adding a stronger constraint), or
override `research_output: text` with `research_output: formal_spec`
(specializing the output type).

## Applicability to knowledge repositories

No widely adopted standard exists for encoding disciplinary norms
("reasoning must be constructive," "citations required," "specific
methods apply") as machine-readable policy. This is a genuine gap.

The infrastructure patterns transfer well. A knowledge repository's
policy system needs:

1. **YAML policy files per directory** — following `.editorconfig`
   conventions. A file like `POLICIES.yaml` or structured frontmatter
   on policy files.
2. **Explicit inheritance** — child directories inherit parent policies
   unless they explicitly override. A `root: true` marker bounds
   traversal.
3. **Typed rules** — each rule has a key, a value, and a type
   (boolean, enum, string). For example: `constructive_only: true`,
   `citation_required: true`, `research_output: text`.
4. **Resolution script** — given a directory path, collects all
   ancestor policies, resolves overrides, and outputs the effective
   policy set.
5. **Contradiction detection** — when two rules at the same level
   conflict, flag the contradiction rather than silently resolving it.

## What the repository already has

The emsemioverse's policies are prose commitments. They describe what
kind of work is always done. The missing layer is the machine-readable
encoding: structured fields on policy files that a script can
collect, resolve, and evaluate.

The existing `predicate-graph.py` already demonstrates the pattern:
frontmatter as structured data, scripts that evaluate properties across
the repository, and typed relations that scripts can query. Policy
resolution is the same architecture applied to directives rather than
content.

## Sources

- [Open Policy Agent Documentation](https://www.openpolicyagent.org/docs/latest/)
- [HashiCorp — Policy as Code Explained](https://www.hashicorp.com/en/blog/policy-as-code-explained)
- [Google Cloud Organization Policy Hierarchy](https://cloud.google.com/resource-manager/docs/organization-policy/understanding-hierarchy)
- [ESLint Config System Background](https://eslint.org/blog/2022/08/new-config-system-part-1/)
- [ESLint Legacy Configuration Files](https://archive.eslint.org/docs/user-guide/configuring/configuration-files)
- [The AI Agent Code of Conduct: Policy-as-Prompt (arXiv)](https://arxiv.org/html/2509.23994v1)
- [Ontology-Based Knowledge Management for Information Governance (IGONTO)](https://www.scitepress.org/Papers/2023/119850/119850.pdf)

---

## Additional formulation

```yaml
---

name: "Policy as code for knowledge repositories"
date-created: 2026-03-07T00:00:00
keywords:
  - policy-as-code
  - knowledge-organization
  - agential-semioverse
references:
  - id: ref1
    type: document
    title: Open Policy Agent
  - id: ref2
    type: document
    title: ESLint configuration cascade
description: "Survey of policy-as-code patterns from infrastructure engineering and their applicability to AI-agent-operated knowledge repositories."
---
```

Policy as code (PaC) is the practice of expressing governance rules as
machine-readable files that tools evaluate and enforce automatically.
The pattern is well-established in infrastructure engineering (cloud
permissions, deployment pipelines, code linting) but has not been
applied to knowledge repositories where AI agents operate under
discipline-specific constraints. This text surveys the relevant
patterns and identifies what a knowledge repository can borrow.

## The decision architecture

Every PaC system separates three concerns:

1. **Policy declaration** — what the rules are, expressed as data
2. **Input data** — what the agent wants to do, expressed as structured
   context
3. **Evaluation** — input + policy = decision (allow, deny, warn)

Open Policy Agent (OPA), the CNCF-graduated standard, implements this
separation using Rego, a declarative language inspired by Datalog. The
key insight is that policy *decisions* are decoupled from policy
*enforcement*: the system sends structured data to the policy engine,
which returns a decision. The system then acts on the decision. This
means policies can express "almost any kind of invariant" without the
policy engine needing to know what the system does.

## Terminology

The industry uses several overlapping terms, each with a slightly
different emphasis:

| Term | Emphasis | Best use |
|---|---|---|
| **Policy** | High-level organizational rule | Umbrella term for the system |
| **Rule** | Single evaluable statement | Individual machine-readable constraint |
| **Constraint** | Restriction that must hold | Boundary conditions |
| **Guardrail** | Protection without prohibition | Human-facing documentation |
| **Invariant** | Property that always holds | Formal/mathematical register |

"Policy" is the standard umbrella term. Individual statements within a
policy are "rules" or "constraints." "Guardrail" communicates the spirit
(enabling, not restricting) but is too informal for structured data.

## Directory-based inheritance

Multiple systems implement policy inheritance through directory
hierarchies, and the patterns are consistent:

**`.editorconfig`** — cascading config files in directories that control
formatting rules, with inheritance up the tree until `root = true`.

**ESLint's legacy `.eslintrc` cascade** — each directory could contain a
config that merged with parent configs. This was powerful but was
deprecated because unintended ancestor configs caused confusion. ESLint
moved to a single flat config with glob-based overrides.

**Google Cloud Organization Policies** — constraints applied at
org/folder/project levels with explicit inheritance. Deny values always
take precedence over allow values.

**AWS Service Control Policies** — JSON documents that set permission
boundaries across an account hierarchy. Effective permissions are the
intersection of all ancestor policies.

The ESLint cautionary tale is important: cascading directory configs are
intuitive but cause real confusion from unintended ancestor inheritance.
The lesson: support inheritance but make it explicit, and provide a
clear root boundary (`root: true`).

### Inheritance semantics

Two models dominate:

- **Union/merge** — effective policy is the union of all ancestor
  policies. Used when policies are additive (IAM permissions).
- **Override with precedence** — closest config wins on conflict. Used
  when policies constrain (linting rules, formatting).

For a knowledge repository, the override model is appropriate:
discipline-level rules specialize project-level rules. A mathematics
directory might override `requires_citation: true` with
`requires_formal_proof: true` (adding a stronger constraint), or
override `research_output: text` with `research_output: formal_spec`
(specializing the output type).

## Applicability to knowledge repositories

No widely adopted standard exists for encoding disciplinary norms
("reasoning must be constructive," "citations required," "specific
methods apply") as machine-readable policy. This is a genuine gap.

The infrastructure patterns transfer well. A knowledge repository's
policy system needs:

1. **YAML policy files per directory** — following `.editorconfig`
   conventions. A file like `POLICIES.yaml` or structured frontmatter
   on policy files.
2. **Explicit inheritance** — child directories inherit parent policies
   unless they explicitly override. A `root: true` marker bounds
   traversal.
3. **Typed rules** — each rule has a key, a value, and a type
   (boolean, enum, string). For example: `constructive_only: true`,
   `citation_required: true`, `research_output: text`.
4. **Resolution script** — given a directory path, collects all
   ancestor policies, resolves overrides, and outputs the effective
   policy set.
5. **Contradiction detection** — when two rules at the same level
   conflict, flag the contradiction rather than silently resolving it.

## What the repository already has

The emsemioverse's policies are prose commitments. They describe what
kind of work is always done. The missing layer is the machine-readable
encoding: structured fields on policy files that a script can
collect, resolve, and evaluate.

The existing `predicate-graph.py` already demonstrates the pattern:
frontmatter as structured data, scripts that evaluate properties across
the repository, and typed relations that scripts can query. Policy
resolution is the same architecture applied to directives rather than
content.

## Sources

- [Open Policy Agent Documentation](https://www.openpolicyagent.org/docs/latest/)
- [HashiCorp — Policy as Code Explained](https://www.hashicorp.com/en/blog/policy-as-code-explained)
- [Google Cloud Organization Policy Hierarchy](https://cloud.google.com/resource-manager/docs/organization-policy/understanding-hierarchy)
- [ESLint Config System Background](https://eslint.org/blog/2022/08/new-config-system-part-1/)
- [ESLint Legacy Configuration Files](https://archive.eslint.org/docs/user-guide/configuring/configuration-files)
- [The AI Agent Code of Conduct: Policy-as-Prompt (arXiv)](https://arxiv.org/html/2509.23994v1)
- [Ontology-Based Knowledge Management for Information Governance (IGONTO)](https://www.scitepress.org/Papers/2023/119850/119850.pdf)

---

## Supplementary formulation

```yaml
---
name: "Policy as code for knowledge repositories"
date-created: 2026-03-07T00:00:00
type: text
authors:
  - claude
keywords:
  - PolicyAsCode
  - KnowledgeOrganization
  - AgentialSemioverse
cites:
  - "Open Policy Agent"
  - "ESLint configuration cascade"
description: "Survey of policy-as-code patterns from infrastructure engineering and their applicability to AI-agent-operated knowledge repositories."
---
```

Policy as code (PaC) is the practice of expressing governance rules as
machine-readable files that tools evaluate and enforce automatically.
The pattern is well-established in infrastructure engineering (cloud
permissions, deployment pipelines, code linting) but has not been
applied to knowledge repositories where AI agents operate under
discipline-specific constraints. This text surveys the relevant
patterns and identifies what a knowledge repository can borrow.

## The decision architecture

Every PaC system separates three concerns:

1. **Policy declaration** — what the rules are, expressed as data
2. **Input data** — what the agent wants to do, expressed as structured
   context
3. **Evaluation** — input + policy = decision (allow, deny, warn)

Open Policy Agent (OPA), the CNCF-graduated standard, implements this
separation using Rego, a declarative language inspired by Datalog. The
key insight is that policy *decisions* are decoupled from policy
*enforcement*: the system sends structured data to the policy engine,
which returns a decision. The system then acts on the decision. This
means policies can express "almost any kind of invariant" without the
policy engine needing to know what the system does.

## Terminology

The industry uses several overlapping terms, each with a slightly
different emphasis:

| Term | Emphasis | Best use |
|---|---|---|
| **Policy** | High-level organizational rule | Umbrella term for the system |
| **Rule** | Single evaluable statement | Individual machine-readable constraint |
| **Constraint** | Restriction that must hold | Boundary conditions |
| **Guardrail** | Protection without prohibition | Human-facing documentation |
| **Invariant** | Property that always holds | Formal/mathematical register |

"Policy" is the standard umbrella term. Individual statements within a
policy are "rules" or "constraints." "Guardrail" communicates the spirit
(enabling, not restricting) but is too informal for structured data.

## Directory-based inheritance

Multiple systems implement policy inheritance through directory
hierarchies, and the patterns are consistent:

**`.editorconfig`** — cascading config files in directories that control
formatting rules, with inheritance up the tree until `root = true`.

**ESLint's legacy `.eslintrc` cascade** — each directory could contain a
config that merged with parent configs. This was powerful but was
deprecated because unintended ancestor configs caused confusion. ESLint
moved to a single flat config with glob-based overrides.

**Google Cloud Organization Policies** — constraints applied at
org/folder/project levels with explicit inheritance. Deny values always
take precedence over allow values.

**AWS Service Control Policies** — JSON documents that set permission
boundaries across an account hierarchy. Effective permissions are the
intersection of all ancestor policies.

The ESLint cautionary tale is important: cascading directory configs are
intuitive but cause real confusion from unintended ancestor inheritance.
The lesson: support inheritance but make it explicit, and provide a
clear root boundary (`root: true`).

### Inheritance semantics

Two models dominate:

- **Union/merge** — effective policy is the union of all ancestor
  policies. Used when policies are additive (IAM permissions).
- **Override with precedence** — closest config wins on conflict. Used
  when policies constrain (linting rules, formatting).

For a knowledge repository, the override model is appropriate:
discipline-level rules specialize project-level rules. A mathematics
directory might override `requires_citation: true` with
`requires_formal_proof: true` (adding a stronger constraint), or
override `research_output: text` with `research_output: formal_spec`
(specializing the output type).

## Applicability to knowledge repositories

No widely adopted standard exists for encoding disciplinary norms
("reasoning must be constructive," "citations required," "specific
methods apply") as machine-readable policy. This is a genuine gap.

The infrastructure patterns transfer well. A knowledge repository's
policy system needs:

1. **YAML policy files per directory** — following `.editorconfig`
   conventions. A file like `POLICIES.yaml` or structured frontmatter
   on policy files.
2. **Explicit inheritance** — child directories inherit parent policies
   unless they explicitly override. A `root: true` marker bounds
   traversal.
3. **Typed rules** — each rule has a key, a value, and a type
   (boolean, enum, string). For example: `constructive_only: true`,
   `citation_required: true`, `research_output: text`.
4. **Resolution script** — given a directory path, collects all
   ancestor policies, resolves overrides, and outputs the effective
   policy set.
5. **Contradiction detection** — when two rules at the same level
   conflict, flag the contradiction rather than silently resolving it.

## What the repository already has

The emsemioverse's policies are prose commitments. They describe what
kind of work is always done. The missing layer is the machine-readable
encoding: structured fields on policy files that a script can
collect, resolve, and evaluate.

The existing `predicate-graph.py` already demonstrates the pattern:
frontmatter as structured data, scripts that evaluate properties across
the repository, and typed relations that scripts can query. Policy
resolution is the same architecture applied to directives rather than
content.

## Sources

- [Open Policy Agent Documentation](https://www.openpolicyagent.org/docs/latest/)
- [HashiCorp — Policy as Code Explained](https://www.hashicorp.com/en/blog/policy-as-code-explained)
- [Google Cloud Organization Policy Hierarchy](https://cloud.google.com/resource-manager/docs/organization-policy/understanding-hierarchy)
- [ESLint Config System Background](https://eslint.org/blog/2022/08/new-config-system-part-1/)
- [ESLint Legacy Configuration Files](https://archive.eslint.org/docs/user-guide/configuring/configuration-files)
- [The AI Agent Code of Conduct: Policy-as-Prompt (arXiv)](https://arxiv.org/html/2509.23994v1)
- [Ontology-Based Knowledge Management for Information Governance (IGONTO)](https://www.scitepress.org/Papers/2023/119850/119850.pdf)
