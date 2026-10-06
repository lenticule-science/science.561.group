const RULES = [
  { code: 'PTG001', severity: 'warning', pattern: /\bit is (?:important|worth) to note(?: that)?\b/gi, message: 'Delete the throat-clearing phrase and state the proposition.' },
  { code: 'PTG002', severity: 'warning', pattern: /\b(?:may|might|could)\s+(?:potentially|possibly)\b/gi, message: 'Use one uncertainty marker, not stacked modality.' },
  { code: 'PTG003', severity: 'warning', pattern: /\bone possible (?:approach|option|way) (?:could|would|might) be\b/gi, message: 'State the proposal directly.' },
  { code: 'PTG004', severity: 'info', pattern: /\bin order to\b/gi, message: 'Prefer “to” unless the longer phrase prevents ambiguity.' },
  { code: 'PTG005', severity: 'info', pattern: /\bserves as\b/gi, message: 'Prefer a direct verb when one names the actual action.' },
  { code: 'PTG006', severity: 'warning', pattern: /\brepresents? a significant\b/gi, message: 'Name the significance or measurement instead of asserting generic importance.' },
  { code: 'PTG007', severity: 'warning', pattern: /\bthis does not necessarily mean\b/gi, message: 'State the bounded implication directly.' },
  { code: 'PTG008', severity: 'warning', pattern: /\bwhile\b[^.!?\n]{0,100}\b(?:not been|cannot|can't)\b[^.!?\n]{0,80}\b(?:prov(?:e|ed|en)|demonstrat(?:e|ed)|establish(?:ed)?)\b/gi, message: 'Put the claim first; encode real uncertainty as claim status.' },
  { code: 'PTG009', severity: 'warning', pattern: /\bit is possible that\b/gi, message: 'State the proposition with a precise uncertainty or claim-status marker.' },
  { code: 'PTG010', severity: 'info', pattern: /\bdue to the fact that\b/gi, message: 'Prefer “because” unless the longer construction changes meaning.' },
  { code: 'PTG011', severity: 'info', pattern: /\bhas the ability to\b/gi, message: 'Prefer “can” when capability is the intended meaning.' },
  { code: 'PTG012', severity: 'warning', pattern: /\bit should be noted that\b/gi, message: 'Delete the note marker and state the proposition.' },
  { code: 'PTG013', severity: 'error', pattern: /\bmaintains knowledge and practices for this service domain\b/gi, message: 'Generic service boilerplate is not a description. State the section’s actual work or mark the description incomplete.' }
];

function maskMarkdownCode(source) {
  const chars = [...source];
  const masked = [...source];
  let inFence = false;
  let fence = null;
  let inInline = false;
  for (let i = 0; i < chars.length; i++) {
    if (!inInline && (source.startsWith('```', i) || source.startsWith('~~~', i))) {
      const mark = source.slice(i, i + 3);
      if (!inFence) { inFence = true; fence = mark; }
      else if (mark === fence) { inFence = false; fence = null; }
      for (let j = 0; j < 3; j++) masked[i + j] = ' ';
      i += 2;
      continue;
    }
    if (!inFence && chars[i] === '`') {
      inInline = !inInline;
      masked[i] = ' ';
      continue;
    }
    if (inFence || inInline) {
      if (chars[i] !== '\n') masked[i] = ' ';
    }
  }
  return masked.join('');
}

function lineColumn(source, index) {
  const before = source.slice(0, index);
  const line = before.split('\n').length;
  const lastNl = before.lastIndexOf('\n');
  return { line, column: index - lastNl };
}

export function lintPTGAE(source) {
  const visible = maskMarkdownCode(source);
  const findings = [];
  for (const rule of RULES) {
    rule.pattern.lastIndex = 0;
    for (const match of visible.matchAll(rule.pattern)) {
      const at = lineColumn(source, match.index ?? 0);
      findings.push({ code: rule.code, severity: rule.severity, line: at.line, column: at.column, text: match[0], message: rule.message });
    }
  }
  return findings.sort((a, b) => a.line - b.line || a.column - b.column || a.code.localeCompare(b.code));
}

export function formatFindings(findings, filename = '<text>') {
  return findings.map(f => `${filename}:${f.line}:${f.column} ${f.code} ${f.severity} ${f.message}`).join('\n');
}

if (import.meta.url === `file://${process.argv[1]}`) {
  const fs = await import('node:fs/promises');
  const files = process.argv.slice(2);
  if (!files.length) {
    console.error('usage: node ptgae-lint.mjs FILE [...]');
    process.exit(2);
  }
  let failed = false;
  for (const file of files) {
    const source = await fs.readFile(file, 'utf8');
    const findings = lintPTGAE(source);
    if (findings.length) console.log(formatFindings(findings, file));
    if (findings.some(f => f.severity === 'error')) failed = true;
  }
  process.exitCode = failed ? 1 : 0;
}
