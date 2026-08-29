import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { dirname, resolve } from "node:path";
import Ajv2020 from "ajv/dist/2020.js";

const __dirname = dirname(fileURLToPath(import.meta.url));

const scriptSchema = JSON.parse(
  readFileSync(resolve(__dirname, "../../script.schema.json"), "utf8"),
);
const auditSchema = JSON.parse(
  readFileSync(
    resolve(__dirname, "../auditing-the-realization-discipline-of-a-script.schema.json"),
    "utf8",
  ),
);

const ajv = new Ajv2020({ allErrors: true, strict: false });
ajv.addSchema(scriptSchema, scriptSchema.$id);
ajv.addSchema(auditSchema, auditSchema.$id);
const validateScript = ajv.compile(scriptSchema);
const validateAudit = ajv.compile(auditSchema);

// Patterns are assembled from string fragments at call time, not written as
// regex literals or whole-word identifiers in the source. This prevents the
// audit script's own definition of the feature names from triggering its own
// detectors when it is asked to audit itself.
const W = "\\b";
const SP = "\\s*";

const FEATURE_FRAGMENTS = {
  "reads-argv": ["pro" + "cess" + "\\." + "ar" + "gv"],
  "writes-stdio": [
    "pro" + "cess" + "\\.(std" + "out|std" + "err|std" + "in)",
    "con" + "sole" + "\\.(lo" + "g|err" + "or|war" + "n|in" + "fo|deb" + "ug)",
  ],
  "writes-files": [
    "writ" + "eFileSync",
    "appen" + "dFileSync",
    "unli" + "nkSync",
    "mkd" + "irSync",
    "rmS" + "ync",
    "createW" + "riteStream",
  ],
  "spawns-processes": [
    "child_" + "process",
    "spawn" + "Sync",
    "exec" + "Sync",
    "exec" + "FileSync",
  ],
  "reads-clock": [
    "new" + "\\s+Da" + "te" + "\\s*\\(",
    "Da" + "te" + "\\." + "no" + "w" + "\\s*\\(",
    "perform" + "ance" + "\\." + "no" + "w" + "\\s*\\(",
    "pro" + "cess" + "\\.hrti" + "me",
  ],
  "reads-env": ["pro" + "cess" + "\\." + "en" + "v"],
  "uses-network": [
    "fet" + "ch" + "\\s*\\(",
    "Web" + "Socket",
    "(ht" + "tp|htt" + "ps|ne" + "t|tl" + "s|dg" + "ram)" + "\\." +
      "(reque" + "st|g" + "et|crea" + "teServer|conne" + "ct|crea" + "teConnection|liste" + "n)" +
      "\\s*\\(",
  ],
};

const FEATURE_PATTERNS = Object.fromEntries(
  Object.entries(FEATURE_FRAGMENTS).map(([k, frags]) => [
    k,
    new RegExp(W + "(?:" + frags.join("|") + ")"),
  ]),
);

const DEFAULT_EXPORT_PATTERN = new RegExp(
  "(?:^|[\\n;\\s])" + "exp" + "ort" + "\\s+" + "defau" + "lt" + "\\s+",
);

const PURE_DISALLOWED = [
  "reads-argv",
  "writes-stdio",
  "writes-files",
  "spawns-processes",
  "reads-clock",
  "reads-env",
  "uses-network",
];

function stripCommentsAndStrings(source) {
  // Strip block comments, line comments, template literals, and single- and
  // double-quoted strings. Each could carry a feature name as a substring that
  // would yield a false positive.
  return source
    .replace(new RegExp("/" + "\\*[\\s\\S]*?\\*" + "/", "g"), "")
    .replace(new RegExp("(^|[^:\\\\])" + "/" + "/" + "[^\\n]*", "g"), "$1")
    .replace(new RegExp("`(?:\\\\.|[^`\\\\])*`", "g"), "``")
    .replace(new RegExp("'(?:\\\\.|[^'\\\\\\n])*'", "g"), "''")
    .replace(new RegExp('"(?:\\\\.|[^"\\\\\\n])*"', "g"), '""');
}

/**
 * Audit a script's source bytes against the discipline its record declares.
 * Pure-function-on-json: takes { script, source }, returns an audit-record.
 * No filesystem reads or writes at call time; the schemas imported at module
 * load are part of the realization's setup, not its call-time behavior.
 *
 * @param {{script: object, source: string}} input
 * @returns {object} instance of audit-record schema
 */
export default function auditTheRealizationDisciplineOfAScript(input) {
  if (input === null || typeof input !== "object" || Array.isArray(input)) {
    throw new TypeError(
      "auditing-the-realization-discipline-of-a-script: input must be an object { script, source }",
    );
  }
  const { script, source } = input;
  if (!validateScript(script)) {
    throw new TypeError(
      "auditing-the-realization-discipline-of-a-script: script violates script.schema.json: " +
        ajv.errorsText(validateScript.errors),
    );
  }
  if (typeof source !== "string") {
    throw new TypeError(
      "auditing-the-realization-discipline-of-a-script: source must be the script's bytes as a string",
    );
  }

  const declared = script["has-realization-discipline"];

  const stripped = stripCommentsAndStrings(source);

  const observations = {
    "has-default-export": DEFAULT_EXPORT_PATTERN.test(stripped),
    "reads-argv": FEATURE_PATTERNS["reads-argv"].test(stripped),
    "writes-stdio": FEATURE_PATTERNS["writes-stdio"].test(stripped),
    "writes-files": FEATURE_PATTERNS["writes-files"].test(stripped),
    "spawns-processes": FEATURE_PATTERNS["spawns-processes"].test(stripped),
    "reads-clock": FEATURE_PATTERNS["reads-clock"].test(stripped),
    "reads-env": FEATURE_PATTERNS["reads-env"].test(stripped),
    "uses-network": FEATURE_PATTERNS["uses-network"].test(stripped),
  };

  const violations = [];
  if (declared === "pure-function-on-json") {
    if (!observations["has-default-export"]) {
      violations.push("pure-function-on-json requires a default export");
    }
    for (const feature of PURE_DISALLOWED) {
      if (observations[feature]) {
        violations.push("pure-function-on-json forbids " + feature);
      }
    }
  }

  const result = {
    "script-path": script["has-path"],
    "declared-discipline": declared,
    observations,
    conforms: violations.length === 0,
    violations,
  };

  if (!validateAudit(result)) {
    throw new Error(
      "auditing-the-realization-discipline-of-a-script: output violates audit-record schema: " +
        ajv.errorsText(validateAudit.errors),
    );
  }
  return result;
}

export { scriptSchema, auditSchema };
