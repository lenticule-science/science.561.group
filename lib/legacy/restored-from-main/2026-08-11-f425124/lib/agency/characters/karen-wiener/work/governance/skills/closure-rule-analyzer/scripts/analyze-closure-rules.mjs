#!/usr/bin/env node
/**
 * Closure Rule Set Analyzer
 *
 * Analyzes closure rule sets for properties like termination, confluence,
 * and other algebraic properties to support theoretical work in predicated computing.
 *
 * @module closure-rule-analyzer
 */

import { readFileSync, existsSync, statSync, readdirSync } from 'fs';
import { join, dirname, relative, isAbsolute, extname } from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Default theory path for reference
const DEFAULT_THEORY_PATH = '/home/emsenn/561/theories/humanities/theories/math/theories/categories/theories/predication-categories';

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
 * Extracts closure rules from various file formats
 * @param {string} content - File content to parse
 * @param {string} filePath - Path to the file (for format detection)
 * @returns {Array<Object>} - Array of rule objects with left and right sides
 */
function extractRules(content, filePath) {
  const ext = extname(filePath).toLowerCase();
  let rules = [];

  try {
    if (ext === '.json') {
      // Parse JSON format
      const jsonData = JSON.parse(content);
      if (Array.isArray(jsonData)) {
        // Array of rule objects
        rules = jsonData.map(rule => ({
          left: rule.left || rule.lhs || '',
          right: rule.right || rule.rhs || ''
        })).filter(rule => rule.left && rule.right);
      } else if (jsonData.rules && Array.isArray(jsonData.rules)) {
        // Object with rules array
        rules = jsonData.rules.map(rule => ({
          left: rule.left || rule.lhs || '',
          right: rule.right || rule.rhs || ''
        })).filter(rule => rule.left && rule.right);
      }
    } else if (ext === '.md') {
      // Parse Markdown - look for code blocks or structured lists
      const codeBlockMatches = content.match(/```(?:[^\n]*\n)?([\s\S]*?)```/g) || [];
      let ruleText = content;

      // If we found code blocks, use the first one that looks like rules
      for (const block of codeBlockMatches) {
        const cleanBlock = block.replace(/```[^\n]*\n?/, '').replace(/```$/, '').trim();
        if (cleanBlock.includes('→') || cleanBlock.includes('->') || cleanBlock.includes('=>')) {
          ruleText = cleanBlock;
          break;
        }
      }

      // Extract rules from text
      rules = extractRulesFromText(ruleText);
    } else {
      // Default to plain text parsing
      rules = extractRulesFromText(content);
    }
  } catch (error) {
    console.warn(`Warning: Could not parse ${filePath} as structured format: ${error.message}`);
    // Fallback to plain text parsing
    rules = extractRulesFromText(content);
  }

  return rules;
}

/**
 * Extracts rules from plain text using common patterns
 * @param {string} text - Text to parse for rules
 * @returns {Array<Object>} - Array of rule objects
 */
function extractRulesFromText(text) {
  const rules = [];
  const lines = text.split('\n');

  for (const line of lines) {
    const trimmed = line.trim();
    if (!trimmed || trimmed.startsWith('#') || trimmed.startsWith('//') || trimmed.startsWith('/*')) {
      continue; // Skip empty lines and comments
    }

    // Look for various arrow patterns
    let left = null;
    let right = null;

    // Pattern: left → right
    const arrowMatch = trimmed.match(/^(.+?)\s*[→→]\s*(.+)$/);
    if (arrowMatch) {
      left = arrowMatch[1].trim();
      right = arrowMatch[2].trim();
    }
    // Pattern: left -> right
    else if ((arrowMatch = trimmed.match(/^(.+?)\s*[-=]>+\s*(.+)$/))) {
      left = arrowMatch[1].trim();
      right = arrowMatch[2].trim();
    }
    // Pattern: left => right
    else if ((arrowMatch = trimmed.match(/^(.+?)\s*=>\s*(.+)$/))) {
      left = arrowMatch[1].trim();
      right = arrowMatch[2].trim();
    }
    // Pattern: left = right (equational)
    else if ((arrowMatch = trimmed.match(/^(.+?)\s*=\s*(.+)$/))) {
      left = arrowMatch[1].trim();
      right = arrowMatch[2].trim();
    }

    if (left !== null && right !== null && left.length > 0 && right.length > 0) {
      rules.push({ left, right });
    }
  }

  return rules;
}

/**
 * Analyzes termination property of a rule set
 * @param {Array<Object>} rules - Array of rule objects
 * @returns {Object} - Termination assessment
 */
function analyzeTermination(rules) {
  const evidence = [];
  const violations = [];
  const notes = [];

  if (rules.length === 0) {
    return {
      status: 'unknown',
      evidence: ['No rules to analyze'],
      violations: [],
      notes: ['Termination analysis requires at least one rule']
    };
  }

    // Simple heuristics for termination checking
    // In a real implementation, we'd use more sophisticated techniques
    // like recursive path ordering, dependency pairs, etc.

    // Check for obviously non-terminating patterns
    let hasPotentialNonTermination = false;

    for (const rule of rules) {
      // Check if right side contains left side (potential for expansion)
      if (rule.right.includes(rule.left) && rule.left.length > 0) {
        hasPotentialNonTermination = true;
        violations.push(`Rule may cause expansion: ${rule.left} → ${rule.right}`);
      }

      // Check for rules that don't reduce complexity in any obvious way
      // This is a very simplistic check - real termination analysis is much more complex
      if (rule.left.length === 0 || rule.right.length === 0) {
        violations.push(`Rule has empty side: ${rule.left} → ${rule.right}`);
        hasPotentialNonTermination = true;
      }
    }

    if (!hasPotentialNonTermination && violations.length === 0) {
      evidence.push('No obvious non-terminating patterns detected (heuristic check)');
      notes.push('Note: This is a conservative heuristic - full termination checking is undecidable');
      return {
        status: 'satisfied',
        evidence,
        violations,
        notes
      };
    } else {
      return {
        status: 'violated',
        evidence: violations.length > 0 ? [] : ['No clear violations detected'],
        violations,
        notes: ['Termination violations detected based on simple heuristics']
      };
    }
}

/**
 * Analyzes confluence property of a rule set
 * @param {Array<Object>} rules - Array of rule objects
 * @returns {Object} - Confluence assessment
 */
function analyzeConfluence(rules) {
  const evidence = [];
  const violations = [];
  const notes = [];

  if (rules.length < 2) {
    return {
      status: 'unknown',
      evidence: ['Need at least 2 rules to check confluence'],
      violations: [],
      notes: ['Confluence analysis requires at least two rules']
    };
  }

  // Simple confluence checking - look for critical pairs
  // In practice, this would involve computing overlaps and checking joinability

  let criticalPairsFound = 0;

  // Check for overlapping left-hand sides
  for (let i = 0; i < rules.length; i++) {
    for (let j = i + 1; j < rules.length; j++) {
      const rule1 = rules[i];
      const rule2 = rules[j];

      // Check if left side of rule1 appears in right side of rule2 or vice versa
      if (rule2.right.includes(rule1.left) && rule1.left.length > 0) {
        criticalPairsFound++;
        violations.push(`Potential critical pair: ${rule1.left} → ${rule1.right} overlaps with ${rule2.left} → ${rule2.right}`);
      }
      if (rule1.right.includes(rule2.left) && rule2.left.length > 0) {
        criticalPairsFound++;
        violations.push(`Potential critical pair: ${rule2.left} → ${rule2.right} overlaps with ${rule1.left} → ${rule1.right}`);
      }
    }
  }

  if (criticalPairsFound === 0) {
    evidence.push('No obvious critical pairs detected (simple overlap check)');
    notes.push('Note: This is a simplified confluence check - full analysis requires computing all overlaps and checking joinability');
    return {
      status: 'satisfied',
      evidence,
      violations,
      notes
    };
  } else {
    return {
      status: 'violated',
      evidence: [],
      violations,
      notes: ['Found ' + criticalPairsFound + ' potential critical pairs requiring joinability check']
    };
  }
}

/**
 * Analyzes local confluence property of a rule set
 * @param {Array<Object>} rules - Array of rule objects
 * @returns {Object} - Local confluence assessment
 */
function analyzeLocalConfluence(rules) {
  // Local confluence is similar to confluence but with some restrictions
  // For simplicity, we'll use the same analysis as confluence for now
  // In a full implementation, this would have different criteria
  return analyzeConfluence(rules);
}

/**
 * Analyzes unique normal forms property based on termination and confluence
 * @param {Object} terminationResult - Termination analysis result
 * @param {Object} confluenceResult - Confluence analysis result
 * @returns {Object} - Unique normal forms assessment
 */
function analyzeUniqueNormalForms(terminationResult, confluenceResult) {
  const evidence = [];
  const violations = [];
  const notes = [];

  // According to Newman's Lemma: If a rewrite system is terminating and locally confluent, then it is confluent.
  // And if it's terminating and confluent, then every element has a unique normal form.

  const isTerminating = terminationResult.status === 'satisfied';
  const isConfluent = confluenceResult.status === 'satisfied';

  if (isTerminating && isConfluent) {
    evidence.push('System is terminating and confluent → unique normal forms exist (by Newman\'s Lemma)');
    return {
      status: 'satisfied',
      evidence,
      violations,
      notes: ['Unique normal forms guaranteed by termination and confluence']
    };
  } else if (!isTerminating) {
    violations.push('System may not terminate → unique normal forms not guaranteed');
    return {
      status: 'violated',
      evidence,
      violations,
      notes: ['Termination is required for unique normal forms']
    };
  } else if (!isConfluent) {
    violations.push('System is not confluent → unique normal forms not guaranteed');
    return {
      status: 'violated',
      evidence,
      violations,
      notes: ['Confluence is required for unique normal forms']
    };
  } else {
    // Unknown case
    return {
      status: 'unknown',
      evidence: ['Cannot determine termination/confluence status'],
      violations: [],
      notes: ['Need both termination and confluence analysis to determine unique normal forms']
    };
  }
}

/**
 * Analyzes a closure rule set for specified properties
 * @param {string} ruleSetPath - Path to rule set file or directory
 * @param {Array<string>} propertiesToCheck - Specific properties to check
 * @returns {Object} - Analysis report
 */
function analyzeClosureRuleSet(ruleSetPath, propertiesToCheck = []) {
  // Normalize path
  const normalizedPath = normalizePath(ruleSetPath);

  if (!pathExists(normalizedPath)) {
    throw new Error(`Rule set path does not exist: ${normalizedPath}`);
  }

  // Collect all rule files to analyze
  const ruleFiles = [];

  const stats = statSync(normalizedPath);
  if (stats.isDirectory()) {
    // Read all files in directory
    const files = readdirSync(normalizedPath);
    for (const file of files) {
      const filePath = join(normalizedPath, file);
      const fileStats = statSync(filePath);
      if (fileStats.isFile() &&
          (extname(file).toLowerCase() === '.md' ||
           extname(file).toLowerCase() === '.txt' ||
           extname(file).toLowerCase() === '.json')) {
        ruleFiles.push(filePath);
      }
    }
  } else {
    // Single file
    ruleFiles.push(normalizedPath);
  }

  if (ruleFiles.length === 0) {
    throw new Error(`No rule set files found in: ${normalizedPath}`);
  }

  // Analyze each file and combine results
  let allRules = [];
  const fileResults = [];

  for (const filePath of ruleFiles) {
    try {
      const content = readFile(filePath);
      const rules = extractRules(content, filePath);
      allRules = [...allRules, ...rules];
      fileResults.push({
        file: filePath,
        ruleCount: rules.length,
        rules
      });
    } catch (error) {
      console.warn(`Warning: Skipping file ${filePath} due to error: ${error.message}`);
    }
  }

  if (allRules.length === 0) {
    throw new Error(`No rules extracted from files in: ${normalizedPath}`);
  }

  // Default properties to check if none specified
  const properties = propertiesToCheck.length > 0
    ? propertiesToCheck
    : ['termination', 'confluence', 'local_confluence', 'unique_normal_forms'];

  // Analyze each requested property
  const assessments = {};

  // Termination analysis
  if (properties.includes('termination')) {
    assessments.termination = analyzeTermination(allRules);
  }

  // Confluence analysis
  if (properties.includes('confluence')) {
    assessments.confluence = analyzeConfluence(allRules);
  }

  // Local confluence analysis
  if (properties.includes('local_confluence')) {
    assessments.local_confluence = analyzeLocalConfluence(allRules);
  }

  // Unique normal forms analysis
  if (properties.includes('unique_normal_forms')) {
    // This depends on termination and confluence results
    const termResult = assessments.termination || analyzeTermination(allRules);
    const confResult = assessments.confluence || analyzeConfluence(allRules);
    assessments.unique_normal_forms = analyzeUniqueNormalForms(termResult, confResult);
  }

  // Determine overall assessment
  let overallAssessment = 'sound';
  const statusValues = Object.values(assessments).map(a => a.status);

  if (statusValues.includes('violated')) {
    overallAssessment = 'unsound';
  } else if (statusValues.includes('unknown')) {
    overallAssessment = 'deficient';
  }

  // Generate improvement suggestions
  let improvement_suggestions = [];

  // Add suggestions based on violations
  Object.entries(assessments).forEach(([property, assessment]) => {
    if (assessment.status === 'violated') {
      if (property === 'termination') {
        improvement_suggestions.push('Review rules for potential non-terminating patterns (e.g., rules that increase complexity)');
        improvement_suggestions.push('Consider using a termination proof technique like recursive path ordering');
      } else if (property === 'confluence' || property === 'local_confluence') {
        improvement_suggestions.push('Check for critical pairs and add rules to make them joinable');
        improvement_suggestions.push('Consider completing the system using Knuth-Bendix completion');
      } else if (property === 'unique_normal_forms') {
        improvement_suggestions.push('Ensure the system is both terminating and confluent');
        improvement_suggestions.push('Address any termination or confluence issues first');
      }
    }
  });

  // Add general suggestions if no specific violations
  if (improvement_suggestions.length === 0) {
    improvement_suggestions = [
      'Rule set appears to have good theoretical properties',
      'Consider testing with specific examples to verify behavior'
    ];
  }

  // Mathematical notes
  const mathematical_notes = [
    'Analysis based on term rewriting system theory',
    'For more advanced analysis, consider using specialized tools like AProVE, CiME, or Maude',
    'Results are based on heuristic checks and may not be definitive for all cases'
  ];

  // Return analysis report
  return {
    rule_set: normalizedPath,
    properties_checked: properties,
    assessments,
    overall_assessment: overallAssessment,
    improvement_suggestions: improvement_suggestions,
    mathematical_notes: mathematical_notes,
    summary: `Analyzed ${allRules.length} rules from ${ruleFiles.length} file(s). Overall assessment: ${overallAssessment}`,
    details: {
      total_rules: allRules.length,
      files_analyzed: ruleFiles.length,
      rule_files: fileResults.map(f => ({ file: f.file, rule_count: f.ruleCount }))
    }
  };
}

/**
 * Main execution function
 */
async function main() {
  try {
    // Parse command line arguments
    const args = process.argv.slice(2);

    if (args.length === 0) {
      console.error('Usage: node analyze-closure-rules.js <rule_set_path> [properties...]');
      console.error('Example: node analyze-closure-rules.js ./work/governance/skills/some-skill/closure-rules.txt');
      console.error('Properties: termination, confluence, local_confluence, unique_normal_forms');
      process.exit(1);
    }

    const ruleSetPath = args[0];
    const propertiesToCheck = args.slice(1).filter(prop =>
      ['termination', 'confluence', 'local_confluence', 'unique_normal_forms'].includes(prop));

    // Perform analysis
    console.log(`🔍 Analyzing closure rule set: ${ruleSetPath}`);
    if (propertiesToCheck.length > 0) {
      console.log(`📋 Checking properties: ${propertiesToCheck.join(', ')}`);
    } else {
      console.log(`📋 Checking all standard properties: termination, confluence, local_confluence, unique_normal_forms`);
    }

    const report = analyzeClosureRuleSet(ruleSetPath, propertiesToCheck);

    // Output report
    console.log('\n📊 CLOSURE RULE SET ANALYSIS REPORT');
    console.log('='.repeat(50));
    console.log(`Rule Set: ${report.rule_set}`);
    console.log(`Files Analyzed: ${report.details.files_analyzed}`);
    console.log(`Total Rules: ${report.details.total_rules}`);
    console.log(`Overall Assessment: ${report.overall_assessment.toUpperCase()}`);
    console.log(`Summary: ${report.summary}`);

    console.log('\n📋 PROPERTY ASSESSMENTS:');
    console.log('-'.repeat(30));
    for (const [property, assessment] of Object.entries(report.assessments)) {
      const statusIcons = {
        satisfied: '✅',
        violated: '❌',
        unknown: '❓'
      };
      const icon = statusIcons[assessment.status] || '❓';
      console.log(`${icon} ${property}: ${assessment.status.toUpperCase()}`);

      if (assessment.evidence.length > 0) {
        console.log(`   Evidence: ${assessment.evidence.join('; ')}`);
      }
      if (assessment.violations.length > 0) {
        console.log(`   Violations: ${assessment.violations.join('; ')}`);
      }
      if (assessment.notes.length > 0) {
        console.log(`   Notes: ${assessment.notes.join('; ')}`);
      }
    }

    if (report.improvement_suggestions.length > 0) {
      console.log('\n🔧 IMPROVEMENT SUGGESTIONS:');
      console.log('-'.repeat(30));
      report.improvement_suggestions.forEach((suggestion, index) => {
        console.log(`${index + 1}. ${suggestion}`);
      });
    }

    if (report.mathematical_notes.length > 0) {
      console.log('\n📐 MATHEMATICAL NOTES:');
      console.log('-'.repeat(30));
      report.mathematical_notes.forEach((note, index) => {
        console.log(`${index + 1}. ${note}`);
      });
    }

    console.log('\n' + '='.repeat(50));

  } catch (error) {
    console.error('❌ Error during analysis:', error.message);
    process.exit(1);
  }
}

// Execute if called directly
if (import.meta.url === `file://${process.argv[1]}`) {
  main();
}

export { analyzeClosureRuleSet };