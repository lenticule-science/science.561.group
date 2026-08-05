#!/usr/bin/env node
/**
 * Governance Predication Grounding Auditor
 *
 * Analyzes governance structures for compliance with predication theory mappings
 * (SPO triples, fibers, bilattices, concept lattices, closure operations, federation principles)
 * and generates a compliance report.
 *
 * @module governance-predication-grounding
 */

import { readFileSync, existsSync, statSync, readdirSync } from 'fs';
import { join, dirname, relative, isAbsolute } from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Default governance path
const DEFAULT_GOVERNANCE_PATH = '/home/emsenn/561/work/governance/persona/main';
// Default theory path (using the grounding skill as reference)
const DEFAULT_THEORY_PATH = '/home/emsenn/561/work/governance/skills/grounding-predication-theory-in-agent-design/SKILL.md';

/**
 * Reads a file and returns its content
 * @param {string} filePath - Path to the file
 * @returns {string} - File content
 */
function readFile(filePath) {
  try {
    return readFileSync(filePath, 'utf8');
  } catch (error) {
    throw new Error(`Failed to read file ${filePath}: ${error.message}`);
  }
}

/**
 * Checks if a path exists and is accessible
 * @param {string} filePath - Path to check
 * @returns {boolean} - True if path exists
 */
function pathExists(filePath) {
  try {
    return existsSync(filePath);
  } catch (error) {
    return false;
  }
}

/**
 * Normalizes a path relative to the workspace root
 * @param {string} inputPath - Input path to normalize
 * @returns {string} - Normalized absolute path
 */
function normalizePath(inputPath) {
  if (!inputPath) return null;

  // If already absolute, return as-is
  if (isAbsolute(inputPath)) return inputPath;

  // Otherwise, resolve relative to current directory
  return join(process.cwd(), inputPath);
}

/**
 * Extracts skill metadata from SKILL.md frontmatter
 * @param {string} skillContent - Content of SKILL.md file
 * @returns {Object} - Parsed frontmatter data
 */
function parseSkillFrontmatter(skillContent) {
  const frontmatterMatch = skillContent.match(/^---\n([\s\S]*?)\n---/);
  if (!frontmatterMatch) return {};

  const frontmatterText = frontmatterMatch[1];
  const data = {};

  frontmatterText.split('\n').forEach(line => {
    const match = line.match(/^(\w+):\s*(.+)$/);
    if (match) {
      const key = match[1].trim();
      let value = match[2].trim();

      // Try to parse as JSON if it looks like an array or object
      if ((value.startsWith('[') && value.endsWith(']')) ||
          (value.startsWith('{') && value.endsWith('}'))) {
        try {
          value = JSON.parse(value);
        } catch (e) {
          // Keep as string if JSON parsing fails
        }
      }

      data[key] = value;
    }
  });

  return data;
}

/**
 * Checks if governance content contains evidence for a specific theory concept
 * @param {string} governancePath - Path to the governance directory
 * @param {string} theoryPath - Path to the theory reference
 * @param {string} criterion - The criterion to check for
 * @returns {Object} - Evidence object with found, missing, excessive, contradiction arrays
 */
function checkGovernanceCriterion(governancePath, theoryPath, criterion) {
  const evidence = {
    found: [],
    missing: [],
    excessive: [],
    contradiction: []
  };

  // Load governance index for basic structure
  const indexPath = join(governancePath, '_index.md');
  const hasIndex = pathExists(indexPath);

  // Load theory reference
  let theoryContent;
  try {
    theoryContent = readFile(theoryPath);
  } catch (error) {
    // If we can't load theory, we can't do much
    evidence.missing.push(`Unable to load theory reference: ${error.message}`);
    return evidence;
  }

  const theoryData = parseSkillFrontmatter(theoryContent);

  switch (criterion) {
    case 'spo_triple_mapping':
      // Check for clear SPO triple mapping in governance
      if (hasIndex) {
        const indexContent = readFile(indexPath);
        // Look for mentions of roles, functions, decisions
        if (indexContent.includes('architect') || indexContent.includes('officer') || indexContent.includes('counsel')) {
          evidence.found.push('Governance roles mentioned (architect, officer, counsel)');
        }
        if (indexContent.includes('exercises') || indexContent.includes('performs') || indexContent.includes('oversees')) {
          evidence.found.push('Governance predicates mentioned (exercises, performs, oversees)');
        }
        if (indexContent.includes('technical design') || indexContent.includes('operations') || indexContent.includes('compliance')) {
          evidence.found.push('Governance objects/functions mentioned');
        }
        if (indexContent.includes('decisions') || indexContent.includes('outputs') || indexContent.includes('policies')) {
          evidence.found.push('Governance values/outputs mentioned');
        }

        // Check for explicit SPO examples
        if (indexContent.includes('Architect exercises oversight') ||
            indexContent.includes('Operations Officer performs management') ||
            indexContent.includes('Organizational Counsel oversees compliance')) {
          evidence.found.push('Explicit SPO triple examples found in governance documentation');
        } else {
          evidence.missing.push('No explicit SPO triple examples found in governance documentation');
        }
      } else {
        evidence.missing.push('_index.md missing in governance directory');
      }
      break;

    case 'fiber_mapping':
      // Check for defined fiber with range of possible outputs
      if (hasIndex) {
        const indexContent = readFile(indexPath);
        // Look for mentions of possible outputs, range of decisions, etc.
        if (indexContent.includes('possible') || indexContent.includes('range') || indexContent.includes('outputs')) {
          evidence.found.push('References to possible outputs or range found');
        } else {
          evidence.missing.push('No clear definition of fiber (range of possible outputs) found');
        }

        // Check for specific fiber examples from theory
        if (indexContent.includes('technical decisions') ||
            indexContent.includes('operational state') ||
            indexContent.includes('governance policies')) {
          evidence.found.push('Specific governance fiber outputs mentioned');
        } else {
          evidence.missing.push('No specific fiber output examples found');
        }
      } else {
        evidence.missing.push('_index.md missing - cannot check for fiber definition');
      }
      break;

    case 'bilattice_mapping':
      // Check for explicit handling of all four bilattice values
      if (hasIndex) {
        const indexContent = readFile(indexPath);
        // Check for mentions of uncertainty, truth, falsity, contradiction
        const bilatticeTerms = ['uncertainty', 'unknown', '⊥', 'true', 'confirmed', 't', 'false', 'refuted', 'f', 'contradiction', 'conflicting', '⊤'];
        let foundTerms = 0;
        for (const term of bilatticeTerms) {
          if (indexContent.includes(term)) {
            foundTerms++;
            evidence.found.push(`Bilattice term found: ${term}`);
          }
        }

        if (foundTerms >= 4) {
          evidence.found.push('All four bilattice values referenced');
        } else if (foundTerms > 0) {
          evidence.found.push(`Some bilattice values referenced (${foundTerms}/4)`);
          evidence.missing.push(`Missing bilattice value references (${4-foundTerms}/4 missing)`);
        } else {
          evidence.missing.push('No bilattice value references found');
        }
      } else {
        evidence.missing.push('_index.md missing - cannot check for bilattice handling');
      }
      break;

    case 'concept_lattice_mapping':
      // Check for concept lattice organization of governance capabilities
      if (hasIndex) {
        const indexContent = readFile(indexPath);
        // Look for hierarchical organization, grouping by attributes
        if (indexContent.includes('hierarchy') ||
            indexContent.includes('grouping') ||
            indexContent.includes('attributes') ||
            indexContent.includes('jurisdiction') ||
            indexContent.includes('authority')) {
          evidence.found.push('Concept lattice organization principles mentioned');
        } else {
          evidence.missing.push('No clear concept lattice organization found');
        }

        // Check for specific governance offices as concepts
        const offices = ['architect', 'operations-officer', 'organizational-counsel'];
        let foundOffices = 0;
        for (const office of offices) {
          if (indexContent.includes(office)) {
            foundOffices++;
            evidence.found.push(`Governance office found: ${office}`);
          }
        }
        if (foundOffices >= 2) {
          evidence.found.push('Multiple governance offices organized');
        } else if (foundOffices > 0) {
          evidence.found.push(`Some governance offices found (${foundOffices}/3)`);
          evidence.missing.push(`Missing governance office references (${3-foundOffices}/3 missing)`);
        } else {
          evidence.missing.push('No governance offices found');
        }
      } else {
        evidence.missing.push('_index.md missing - cannot check for concept lattice organization');
      }
      break;

    case 'closure_mapping':
      // Check for closure conditions defined for learning/adaptation
      if (hasIndex) {
        const indexContent = readFile(indexPath);
        // Look for mentions of settling, fixed points, learning, adaptation
        const closureTerms = ['settling', 'fixed point', 'learning', 'adaptation', 'evidence accumulation', 'precedent', 'policy'];
        let foundTerms = 0;
        for (const term of closureTerms) {
          if (indexContent.includes(term)) {
            foundTerms++;
            evidence.found.push(`Closure term found: ${term}`);
          }
        }

        if (foundTerms >= 3) {
          evidence.found.push('Closure concepts well referenced');
        } else if (foundTerms > 0) {
          evidence.found.push(`Some closure concepts referenced (${foundTerms}/~3)`);
          evidence.missing.push(`Missing closure concept references`); // Approximate
        } else {
          evidence.missing.push('No closure concept references found');
        }

        // Check for explicit closure conditions
        if (indexContent.includes('closure conditions') ||
            indexContent.includes('settle on') ||
            indexContent.includes('stable decision')) {
          evidence.found.push('Explicit closure conditions mentioned');
        } else {
          evidence.missing.push('No explicit closure conditions found');
        }
      } else {
        evidence.missing.push('_index.md missing - cannot check for closure conditions');
      }
      break;

    case 'federation_mapping':
      // Check for federation analysis for multi-office governance
      if (hasIndex) {
        const indexContent = readFile(indexPath);
        // Look for mentions of federation, collaboration, emergent properties
        const federationTerms = ['federation', 'collaboration', 'emergent', 'multi-office', 'interaction', 'Mayer-Vietoris'];
        let foundTerms = 0;
        for (const term of federationTerms) {
          if (indexContent.includes(term)) {
            foundTerms++;
            evidence.found.push(`Federation term found: ${term}`);
          }
        }

        if (foundTerms >= 2) {
          evidence.found.push('Federation concepts referenced');
        } else if (foundTerms > 0) {
          evidence.found.push(`Some federation concepts referenced (${foundTerms}/~2)`);
          evidence.missing.push(`Missing federation concept references`);
        } else {
          evidence.missing.push('No federation concept references found');
        }

        // Check for explicit federation analysis
        if (indexContent.includes('federation analysis') ||
            indexContent.includes('emerggent properties') ||
            indexContent.includes('multi-office governance')) {
          evidence.found.push('Explicit federation analysis mentioned');
        } else {
          evidence.missing.push('No explicit federation analysis found');
        }
      } else {
        evidence.missing.push('_index.md missing - cannot check for federation analysis');
      }
      break;

    default:
      evidence.missing.push(`Unknown criterion: ${criterion}`);
  }

  return evidence;
}

/**
 * Determines status based on evidence
 * @param {Object} evidence - Evidence object from checkCriterion
 * @returns {string} - Status: aligned, deficient, excessive, or contradicted
 */
function determineStatus(evidence) {
  if (evidence.contradiction.length > 0) {
    return 'contradicted';
  }
  if (evidence.excessive.length > 0) {
    return 'excessive';
  }
  if (evidence.missing.length > 0) {
    return 'deficient';
  }
  return 'aligned';
}

/**
 * Main function
 */
async function main() {
  const args = process.argv.slice(2);

  // Parse command line arguments
  let governancePath = null;
  let theoryPath = null;

  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--governance_path' || args[i] === '-g') {
      governancePath = args[++i];
    } else if (args[i] === '--theory_path' || args[i] === '-t') {
      theoryPath = args[++i];
    } else if (!governancePath && !args[i].startsWith('-')) {
      governancePath = args[i];
    }
  }

  if (!governancePath) {
    governancePath = DEFAULT_GOVERNANCE_PATH;
  }
  if (!theoryPath) {
    theoryPath = DEFAULT_THEORY_PATH;
  }

  governancePath = normalizePath(governancePath);
  theoryPath = normalizePath(theoryPath);

  // Validate paths
  if (!pathExists(governancePath)) {
    console.error(`Error: Governance path does not exist: ${governancePath}`);
    process.exit(1);
  }

  if (!pathExists(theoryPath)) {
    console.error(`Error: Theory path does not exist: ${theoryPath}`);
    process.exit(1);
  }

  // Load theory reference for metadata
  let theoryContent;
  try {
    theoryContent = readFile(theoryPath);
  } catch (error) {
    console.error(`Error reading theory reference: ${error.message}`);
    process.exit(1);
  }

  const theoryData = parseSkillFrontmatter(theoryContent);

  // Define the six theory concepts
  const criteria = [
    'spo_triple_mapping',
    'fiber_mapping',
    'bilattice_mapping',
    'concept_lattice_mapping',
    'closure_mapping',
    'federation_mapping'
  ];

  // Check each criterion
  const assessments = {};
  let alignedCount = 0;
  let deficientCount = 0;
  let excessiveCount = 0;
  let contradictedCount = 0;

  for (const criterion of criteria) {
    const evidence = checkGovernanceCriterion(governancePath, theoryPath, criterion);
    const status = determineStatus(evidence);
    assessments[criterion] = {
      status,
      evidence: evidence.found,
      missing: evidence.missing,
      excessive: evidence.excessive,
      contradiction: evidence.contradiction
    };

    switch (status) {
      case 'aligned': alignedCount++; break;
      case 'deficient': deficientCount++; break;
      case 'excessive': excessiveCount++; break;
      case 'contradicted': contradictedCount++; break;
    }
  }

  // Determine overall compliance
  let overallCompliance;
  if (contradictedCount > 0 || excessiveCount > 0) {
    overallCompliance = 'low';
  } else if (deficientCount > 3) {
    overallCompliance = 'low';
  } else if (deficientCount > 0) {
    overallCompliance = 'medium';
  } else {
    overallCompliance = 'high';
  }

  // Generate improvement work list
  const improvementWorkList = [];

  // 1. Address contradictions first
  for (const [criterion, assessment] of Object.entries(assessments)) {
    if (assessment.status === 'contradicted') {
      improvementWorkList.push(`Resolve contradictions in ${criterion}: ${assessment.contradiction.join('; ')}`);
    }
  }

  // 2. Address excessive claims
  for (const [criterion, assessment] of Object.entries(assessments)) {
    if (assessment.status === 'excessive') {
      improvementWorkList.push(`Justify or remove excessive claims in ${criterion}: ${assessment.excessive.join('; ')}`);
    }
  }

  // 3. Fill deficiencies
  for (const [criterion, assessment] of Object.entries(assessments)) {
    if (assessment.status === 'deficient') {
      improvementWorkList.push(`Address missing elements in ${criterion}: ${assessment.missing.join('; ')}`);
    }
  }

  // 4. Enhance alignment where already partially implemented

  // Determine theory status eligibility (for governance)
  let governanceTheoryEligibility;
  if (overallCompliance === 'high') {
    governanceTheoryEligibility = 'well-grounded';
  } else if (overallCompliance === 'medium' && contradictedCount === 0 && excessiveCount === 0) {
    governanceTheoryEligibility = 'partially-grounded';
  } else {
    governanceTheoryEligibility = 'poorly-grounded';
  }

  // Collect missing elements for quick reference
  const missingElements = [];
  for (const [criterion, assessment] of Object.entries(assessments)) {
    if (assessment.status === 'deficient' || assessment.status === 'contradicted' || assessment.status === 'excessive') {
      missingElements.push(...assessment.missing);
    }
  }

  // Create mapping object (examples from the exploration)
  const mapping = {
    "spo_triple_mapping": {
      "subject_examples": ["Architect", "Operations Officer", "Organizational Counsel", "governance offices", "roles"],
      "predicate_examples": ["exercises", "performs", "oversees", "manages", "governs"],
      "object_examples": ["technical design", "daily operations", "compliance functions", "governance domains", "processes"],
      "value_examples": ["technical decisions", "operational state", "governance policies", "decisions", "outputs", "state changes"],
      "governance_examples": [
        "Architect exercises oversight over technical design → produces technical decisions",
        "Operations Officer performs management of daily operations → produces operational state",
        "Organizational Counsel oversees compliance functions → produces governance policies"
      ]
    },
    "fiber_mapping": {
      "fiber_definition": "Range of possible outputs/decisions for a given office-predicate combination",
      "fiber_examples": [
        "For Architect-overseeing-technical-design: {technical approval, technical rejection, technical revision, technical deferral}",
        "For Operations Officer-managing-daily-operations: {operational continue, operational pause, operational escalate, operational terminate}",
        "For Organizational Counsel-overseeing-compliance: {compliance compliant, compliance non-compliant, compliance waiver, compliance investigation}"
      ],
      "fiber_operations": "Combining, comparing, or transforming governance outputs (e.g., combining decisions from multiple offices)"
    },
    "bilattice_mapping": {
      "bilattice_values": {
        "bottom": "⊥: No information/uncertainty about governance situation",
        "true": "t: Confirmed governance knowledge through evidence/process",
        "false": "f: Determined governance approach is false/refuted",
        "top": "⊤: Conflicting governance principles or contradictory evidence"
      },
      "governance_examples": [
        "Uncertainty (⊥): New governance situation with no prior data",
        "Truth (t): Governance decision verified through audit trail and evidence",
        "Falsity (f): Governance approach determined ineffective through outcome measurement",
        "Contradiction (⊤): Conflicting legal requirements or opposing stakeholder directives"
      ]
    },
    "concept_lattice_mapping": {
      "concepts": ["governance offices", "governance functions", "governance processes"],
      "attributes": ["jurisdiction", "authority type", "domain scope", "decision impact"],
      "lattice_structure": "Hierarchy from general governance principles to specific office duties",
      "galois_connection": "Between governance capabilities and required organizational contexts",
      "governance_examples": [
        "General governance principle → Specific office duty (e.g., 'oversight' → 'Architect technical oversight')",
        "Grouping by jurisdiction: {Architect: technical, Operations Officer: operational, Organizational Counsel: legal}"
      ]
    },
    "closure_mapping": {
      "closure_definition": "Governance process of integrating experience until stable understanding",
      "closure_conditions": [
        "Evidence accumulation threshold met",
        "Stable decision reached after iteration",
        "Policy established and accepted",
        "Precedent set for similar future cases"
      ],
      "increment_sequence": "History of governance interactions, decisions, and outcomes",
      "fixed_point": "Established governance precedent or policy",
      "governance_examples": [
        "Governance body settles on technical standard after multiple reviews",
        "Policy becomes established precedent after consistent application",
        "Governance process reaches stable state after stakeholder consultation"
      ]
    },
    "federation_mapping": {
      "federation_definition": "Multiple governance offices working together as a cohesive system",
      "emergent_properties": [
        "Integrated governance decisions that single offices cannot produce",
        "Conflict resolution mechanisms between offices",
        "Unified governance strategy across domains",
        "Emergent oversight capabilities from office interaction"
      ],
      "mayer_vietoris_sequence": "Analyzing what's gained/lost in governance federation",
      "governance_examples": [
        "Architect + Operations Officer + Organizational Counsel → Unified product governance",
        "Technical governance + Operational governance → Sustainable service delivery",
        "Legal governance + Technical governance → Compliant innovation"
      ]
    }
  };

  // Create compliance report
  const compliance_report = {
    "governance_analyzed": governancePath,
    "theory_used": theoryPath,
    "assessments": assessments,
    "overall_compliance": overallCompliance,
    "improvement_work_list": improvementWorkList,
    "validation_checklist_status": {
      "clear_spo_triple_mapping": assessments.spo_triple_mapping.status === 'aligned',
      "defined_fiber_with_outputs": assessments.fiber_mapping.status === 'aligned',
      "explicit_bilattice_handling": assessments.bilattice_mapping.status === 'aligned',
      "concept_lattice_organization": assessments.concept_lattice_mapping.status === 'aligned',
      "closure_conditions_defined": assessments.closure_mapping.status === 'aligned',
      "federation_analysis_included": assessments.federation_mapping.status === 'aligned'
    }
  };

  // Create final report object
  const report = {
    mapping,
    compliance_report
  };

  // Output report as JSON
  console.log(JSON.stringify(report, null, 2));
}

// Run main function
main().catch(error => {
  console.error(`Unexpected error: ${error.message}`);
  process.exit(1);
});