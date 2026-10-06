const SAFE_REWRITES = [
  { code: 'PTR001', pattern: /\bmay\s+potentially\b/gi, replacement: 'may' },
  { code: 'PTR002', pattern: /\bcould\s+possibly\b/gi, replacement: 'could' },
  { code: 'PTR003', pattern: /\bmight\s+perhaps\b/gi, replacement: 'might' },
  { code: 'PTR004', pattern: /\bin order to\b/gi, replacement: 'to' },
  { code: 'PTR005', pattern: /\bdue to the fact that\b/gi, replacement: 'because' },
  { code: 'PTR006', pattern: /\bin light of the fact that\b/gi, replacement: 'because' },
  { code: 'PTR007', pattern: /\bhas the ability to\b/gi, replacement: 'can' },
  { code: 'PTR008', pattern: /\bat this point in time\b/gi, replacement: 'now' },
  { code: 'PTR009', pattern: /\bat the present time\b/gi, replacement: 'now' },
  { code: 'PTR010', pattern: /\bin the event that\b/gi, replacement: 'if' },
  { code: 'PTR011', pattern: /\bon a regular basis\b/gi, replacement: 'regularly' },
  { code: 'PTR012', pattern: /\bsubsequent to\b/gi, replacement: 'after' },
  { code: 'PTR013', pattern: /\bprior to\b/gi, replacement: 'before' },
  { code: 'PTR014', pattern: /\bwith regard to\b/gi, replacement: 'about' },
  { code: 'PTR015', pattern: /\bwith respect to\b/gi, replacement: 'about' }
];

const LEADING_FILLER = [
  ['PTR016', /\bIt is important to note that\s+/gi],
  ['PTR017', /\bIt is worth noting that\s+/gi],
  ['PTR018', /\bIt should be noted that\s+/gi],
  ['PTR019', /\bIt is worth mentioning that\s+/gi],
  ['PTR020', /\bIt is important to remember that\s+/gi],
  ['PTR021', /\bNeedless to say,\s*/gi],
  ['PTR022', /\bAt the end of the day,\s*/gi],
  ['PTR023', /\bIn conclusion,\s*/gi],
  ['PTR024', /\bTo conclude,\s*/gi],
  ['PTR025', /\bIn summary,\s*/gi]
];

const SECTION_STUDY = {
  code: 'PTR026',
  pattern: /\bThe ([A-Z][A-Za-z0-9 '&()/-]* Services Section) maintains knowledge and practices for the study of ([^.!?\n]+)\./g,
  replace: (_match, section, subject) => `The ${section} studies ${subject}.`
};

const GENERIC_SECTION = {
  code: 'PTR027',
  pattern: /\bThe [A-Z][A-Za-z0-9 '&()/-]* Services Section maintains knowledge and practices for this service domain\./g,
  replacement: 'Description incomplete.'
};

function capitalizeFirstLetter(text) {
  return text.replace(/^([\s"'([{]*)([a-z])/, (_m, prefix, letter) => prefix + letter.toUpperCase());
}

function rewriteOutsideCode(source, transform) {
  let out = '';
  let plain = '';
  let i = 0;
  let fence = null;
  let inline = false;

  const flush = () => {
    if (plain) {
      out += transform(plain);
      plain = '';
    }
  };

  while (i < source.length) {
    const three = source.slice(i, i + 3);
    if (!inline && (three === '```' || three === '~~~')) {
      flush();
      if (!fence) fence = three;
      else if (fence === three) fence = null;
      out += three;
      i += 3;
      continue;
    }

    const ch = source[i];
    if (!fence && ch === '`') {
      flush();
      inline = !inline;
      out += ch;
      i += 1;
      continue;
    }

    if (fence || inline) out += ch;
    else plain += ch;
    i += 1;
  }

  flush();
  return out;
}

function transformPlainText(text, changes) {
  let next = text;

  for (const rule of SAFE_REWRITES) {
    next = next.replace(rule.pattern, (...args) => {
      changes.push(rule.code);
      return rule.replacement;
    });
  }

  for (const [code, pattern] of LEADING_FILLER) {
    next = next.replace(pattern, (...args) => {
      changes.push(code);
      return '';
    });
  }

  next = next.replace(SECTION_STUDY.pattern, (...args) => {
    changes.push(SECTION_STUDY.code);
    return SECTION_STUDY.replace(...args);
  });

  next = next.replace(GENERIC_SECTION.pattern, (...args) => {
    changes.push(GENERIC_SECTION.code);
    return GENERIC_SECTION.replacement;
  });

  const sentences = next.split(/(?<=[.!?])(?=\s|$)/);
  next = sentences.map(capitalizeFirstLetter).join('');

  return next;
}

export function rewritePTGAE(source) {
  const changes = [];
  const text = rewriteOutsideCode(source, plain => transformPlainText(plain, changes));
  return {
    text,
    changed: text !== source,
    changes
  };
}

export const SAFE_REWRITE_CODES = new Set([
  ...SAFE_REWRITES.map(rule => rule.code),
  ...LEADING_FILLER.map(([code]) => code),
  SECTION_STUDY.code,
  GENERIC_SECTION.code
]);

if (import.meta.url === 'file://' + process.argv[1]) {
  const fs = await import('node:fs/promises');
  const args = process.argv.slice(2);
  const check = args.includes('--check');
  const files = args.filter(arg => !arg.startsWith('--'));

  if (!files.length) {
    console.error('usage: node ptgae-rewrite.mjs [--check] FILE [...]');
    process.exit(2);
  }

  let changed = false;
  for (const file of files) {
    const source = await fs.readFile(file, 'utf8');
    const result = rewritePTGAE(source);
    if (!result.changed) continue;
    changed = true;
    if (check) {
      console.log(file + ': ' + result.changes.join(','));
    } else {
      await fs.writeFile(file, result.text);
      console.log(file + ': rewrote ' + result.changes.join(','));
    }
  }

  if (check && changed) process.exitCode = 1;
}
