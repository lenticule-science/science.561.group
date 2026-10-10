---
name: governance-predication-grounding
description: "Provides explicit mappings from predication theory concepts to concrete governance structures and processes, enabling application of SPO triples, fibers, bilattices, concept lattices, closure operations, and federation principles to governance work."
---

# governance-predication-grounding

Provides explicit mappings from predication theory concepts (SPO triples, fibers, bilattices, concept lattices, closure operations, federation principles) to concrete governance structures and processes in the 561 Group.
This skill enables the application of predication theory to governance work by showing how theoretical concepts manifest in practical governance activities.

## When to call this skill

- When designing or restructuring governance systems to ensure theoretical grounding
- During governance audit processes to check alignment with predication theory
- When applying predication theory principles to governance decision-making
- Before implementing governance changes to verify theoretical compatibility
- When training new governance participants on theoretical foundations

## When NOT to call this skill

- For checking governance syntax or formatting only: use validate-frontmatter or similar
- For measuring governance execution or performance: use governance metrics or KPIs
- For determining governance utility or usefulness: use participant feedback or outcome analysis
- For checking governance dependencies: use dependency analysis tools

## Inputs

| Input | Type | Required | Description |
|---|---|---|---|
| `governance_path` | path | no | Path to the governance directory to analyze. If omitted, uses `/home/emsenn/561/work/governance/persona/main` |
| `theory_path` | path | no | Path to predication theory documentation. If omitted, uses standard predication-categories location |

## Outputs

| Output | Type | Description |
|---|---|---|
| `mapping` | object | Explicit mappings of each predication theory concept to governance components |
| `compliance_report` | object | Assessment of how well the analyzed governance aligns with predication theory principles |

Mapping structure:
```
{
  "spo_triple_mapping": {
    "subject_examples": ["governance offices", "roles", "persons"],
    "predicate_examples": ["exercises", "performs", "oversees", "manages"],
    "object_examples": ["governance functions", "domains", "processes", "resources"],
    "value_examples": ["decisions", "outputs", "state changes", "policies"],
    "governance_examples": [
      "Architect exercises oversight over technical design → produces technical decisions",
      "Operations Officer performs management of daily operations → produces operational state",
      "Organizational Counsel oversees compliance functions → produces governance policies"
    ]
  },
  "fiber_mapping": { ...similar structure... },
  "bilattice_mapping": { ...similar structure... },
  "concept_lattice_mapping": { ...similar structure... },
  "closure_mapping": { ...similar structure... },
  "federation_mapping": { ...similar structure... }
}
```

Compliance report structure:
```
{
  "governance_analyzed": "<path to governance directory>",
  "theory_used": "<path to theory reference>",
  "assessments": {
    "spo_triple_alignment": {
      "status": "aligned|deficient|excessive|contradicted",
      "evidence": ["<list of evidence found>"],
      "missing": ["<list of what's missing for alignment>"],
      "excess": ["<list of what exceeds theory>"],
      "contradiction": ["<list of what conflicts with theory>"]
    },
    "fiber_alignment": { ...same structure... },
    "bilattice_alignment": { ...same structure... },
    "concept_lattice_alignment": { ...same structure... },
    "closure_alignment": { ...same structure... },
    "federation_alignment": { ...same structure... }
  },
  "overall_compliance": "high|medium|low|none",
  "improvement_work_list": ["<ordered list of steps to improve theoretical alignment>"],
  "validation_checklist_status": {
    "clear_spo_triple_mapping": true|false,
    "defined_fiber_with_outputs": true|false,
    "explicit_bilattice_handling": true|false,
    "concept_lattice_organization": true|false,
    "closure_conditions_defined": true|false,
    "federation_analysis_included": true|false
  }
}
```

## Algorithm

### 1. Load and Analyze Governance Structure

Examine the governance directory at the provided governance_path for: - Governance offices and roles (from `_index.md`, office directories, role definitions) - Governance functions and processes (from process documentation, workflow descriptions) - Decision-making structures and output mechanisms - Existing documentation of governance activities

### 2. Load Predication Theory Reference

Load the grounding-predication-theory-in-agent-design SKILL.md as the reference for proper theoretical mappings.
Optionally load deeper theory documentation from theory_path for additional validation.

### 3. Map Governance Components to Theory Concepts

For each of the six theory concepts (SPO triples, fibers, bilattices, concept lattices, closure, federation): - Identify corresponding governance structures and processes - Document explicit examples of how governance implements each concept - Note what's missing, excessive, or contradictory relative to theory - Classify each concept's implementation status in governance

### 4. Evaluate Against Validation Checklist

Check the governance against the six validation checklist items: - Clear SPO triple mapping for governance offices and functions - Defined fiber with range of possible governance outputs - Explicit handling of all four bilattice values in governance epistemology - Concept lattice organization of governance capabilities - Closure conditions defined for governance learning and policy settling - Federation analysis for multi-office governance systems

### 5. Generate Mapping and Compliance Report

Create explicit mappings showing how each theory concept manifests in governance Generate compliance report assessing alignment and providing improvement recommendations

## Edge Cases

- **Governance already theory-grounded**: All assessments aligned, validation checklist all true.
  Report clean compliance.
- **Governance predates theory or uses different framework**: Note theoretical independence but suggest integration points.
- **Governance is aspirational/planning**: Assess based on stated intentions rather than implemented structures.
- **Governance spans multiple domains**: Evaluate each domain's theoretical alignment separately if applicable.
- **Missing or malformed governance documentation**: Report inability to analyze and suggest documentation improvement.

## See Also

- [grounding-predication-theory-in-agent-design](../grounding-predication-theory-in-agent-design/SKILL.md) - Reference for theoretical mappings
- [theoretical-compliance-auditor](../../skills/theoretical-compliance-auditor/SKILL.md) - Similar compliance auditing for agent skills
- [predication-theory-in-governance](./predication-theory-in-governance.md) - Existing application of predication theory to governance
