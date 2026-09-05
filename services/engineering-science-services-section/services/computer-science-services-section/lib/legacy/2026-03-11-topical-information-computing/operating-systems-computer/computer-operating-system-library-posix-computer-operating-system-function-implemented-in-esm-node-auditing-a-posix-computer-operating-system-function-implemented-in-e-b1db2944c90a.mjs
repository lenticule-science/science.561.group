import { readFileSync } from "node:fs";
import Ajv2020 from "ajv/dist/2020.js";

const realizationSchema = JSON.parse(
  readFileSync(
    new URL(
      "../../../../posix-computer-operating-system-function-implemented-in-esm-node.schema.json",
      import.meta.url,
    ),
    "utf8",
  ),
);
const transformerSchema = JSON.parse(
  readFileSync(
    new URL(
      "../auditing-a-posix-computer-operating-system-function-implemented-in-esm-node.schema.json",
      import.meta.url,
    ),
    "utf8",
  ),
);

const ajv = new Ajv2020({ allErrors: true, strict: false });
ajv.addSchema(realizationSchema, realizationSchema.$id);
ajv.addSchema(transformerSchema, transformerSchema.$id);

const validateInput = ajv.compile(transformerSchema.properties.input);
const validateOutput = ajv.compile(realizationSchema);

const CAPABILITY_BY_EFFECT = {
  argv: "argv",
  stdin: "stdio",
  stdout: "stdio",
  stderr: "stdio",
  cwd: "cwd",
  env: "env",
  "filesystem-read": "filesystem-read",
  "filesystem-write": "filesystem-write",
  subprocess: "subprocess",
  network: "network",
  clock: "clock",
  "dynamic-import": "dynamic-import",
};

const EFFECT_PATTERNS = {
  argv: /\bprocess\s*\.\s*argv\b/,
  stdin: /\bprocess\s*\.\s*stdin\b/,
  stdout: /\b(?:process\s*\.\s*stdout|console\s*\.\s*(?:log|info|debug))\b/,
  stderr: /\b(?:process\s*\.\s*stderr|console\s*\.\s*(?:error|warn))\b/,
  cwd: /\bprocess\s*\.\s*cwd\s*\(/,
  env: /\bprocess\s*\.\s*env\b/,
  "filesystem-read":
    /\b(?:readFileSync|readFile|readdirSync|readdir|statSync|stat|lstatSync|lstat|existsSync)\b/,
  "filesystem-write":
    /\b(?:writeFileSync|writeFile|appendFileSync|appendFile|mkdirSync|mkdir|rmSync|rm|unlinkSync|unlink|createWriteStream)\b/,
  subprocess: /\b(?:node:child_process|child_process|spawnSync|spawn|execSync|execFileSync|execFile|exec)\b/,
  network: /\b(?:fetch|WebSocket|node:(?:http|https|net|tls|dgram)|(?:http|https|net|tls|dgram)\s*\.\s*(?:request|get|createServer|connect|createConnection|listen))\b/,
  clock: /\b(?:new\s+Date\s*\(|Date\s*\.\s*now\s*\(|performance\s*\.\s*now\s*\(|process\s*\.\s*hrtime)\b/,
  "dynamic-import": /\bimport\s*\(/,
};

const OBSERVATION_PATTERNS = {
  "has-default-export": /(?:^|[\n;\s])export\s+default\s+/,
  "has-cli-entrypoint": /\bimport\.meta\.url\b[\s\S]{0,120}\bprocess\s*\.\s*argv\b|\bprocess\s*\.\s*argv\b[\s\S]{0,120}\bimport\.meta\.url\b/,
  "uses-module-relative-resolution": /\bimport\.meta\.(?:url|dirname|filename|resolve)\b/,
  "uses-repo-root-constant": /\bREPO_ROOT\b/,
  "imports-ajv": /\bAjv(?:2020)?\b|["']ajv(?:\/dist\/2020\.js)?["']/,
  "mentions-schema-json": /\.schema\.json\b/,
};

export default function auditingAPosixComputerOperatingSystemFunctionImplementedInEsmNode(input) {
  if (!validateInput(input)) {
    throw new TypeError(
      "auditing-a-posix-computer-operating-system-function-implemented-in-esm-node: input violates schema: " +
        ajv.errorsText(validateInput.errors),
    );
  }

  const source = stripCommentsAndStrings(input.source);
  const declaredRole = input["declared-role"] ?? "unknown";
  const declaredCapabilities = input["declared-capabilities"] ?? [];
  const declaredCapabilitySet = new Set(declaredCapabilities);

  const observations = Object.fromEntries(
    Object.entries(OBSERVATION_PATTERNS).map(([name, pattern]) => [name, pattern.test(source)]),
  );
  const effects = Object.entries(EFFECT_PATTERNS)
    .filter(([, pattern]) => pattern.test(source))
    .map(([name]) => name);

  const violations = [];
  if (observations["uses-repo-root-constant"]) {
    violations.push("uses REPO_ROOT instead of module-relative resolution or caller-supplied capability");
  }
  if (declaredRole === "transformer-body" && !observations["has-default-export"]) {
    violations.push("transformer-body must default-export the function body");
  }
  if (declaredRole === "transformer-body") {
    for (const forbidden of ["argv", "stdin", "stdout", "stderr", "cwd"]) {
      if (effects.includes(forbidden)) {
        violations.push(`transformer-body must not use POSIX boundary effect ${forbidden}`);
      }
    }
  }
  for (const effect of effects) {
    const capability = CAPABILITY_BY_EFFECT[effect];
    if (capability && !declaredCapabilitySet.has(capability)) {
      violations.push(`effect ${effect} requires declared capability ${capability}`);
    }
  }

  const output = {
    path: input.path,
    "module-system": "esm",
    runtime: "node",
    "posix-file-kind": "regular-file",
    "declared-role": declaredRole,
    "declared-capabilities": declaredCapabilities,
    observations,
    effects,
    conforms: violations.length === 0,
    violations,
  };
  if (input.mode) output.mode = input.mode;

  if (!validateOutput(output)) {
    throw new Error(
      "auditing-a-posix-computer-operating-system-function-implemented-in-esm-node: output violates schema: " +
        ajv.errorsText(validateOutput.errors),
    );
  }
  return output;
}

function stripCommentsAndStrings(source) {
  return source
    .replace(/\/\*[\s\S]*?\*\//g, "")
    .replace(/(^|[^:\\])\/\/[^\n]*/g, "$1")
    .replace(/`(?:\\.|[^`\\])*`/g, "``")
    .replace(/'(?:\\.|[^'\\\n])*'/g, "''")
    .replace(/"(?:\\.|[^"\\\n])*"/g, '""');
}

export { realizationSchema, transformerSchema };
