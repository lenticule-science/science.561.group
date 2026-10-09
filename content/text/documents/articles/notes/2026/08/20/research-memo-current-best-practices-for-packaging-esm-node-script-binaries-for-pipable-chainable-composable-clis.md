---
title: "Research Memo: Current Best Practices for Packaging ESM Node Script Binaries for Pipable, Chainable, Composable CLIs"
description: "Date: 2026-06-17 Prepared for: emsenn Scope: ESM-first Node.js command-line packages distributed through npm-compatible package managers, with emphasis on script binaries that behave well in Unix-style pipelines, shell scripts, CI, and…"
---
# Research Memo: Current Best Practices for Packaging ESM Node Script Binaries for Pipable, Chainable, Composable CLIs

**Date:** 2026-06-17  
**Prepared for:** emsenn  
**Scope:** ESM-first Node.js command-line packages distributed through npm-compatible package managers, with emphasis on script binaries that behave well in Unix-style pipelines, shell scripts, CI, and other compositional environments.

---

## Executive Summary

The best current pattern for an npm-distributed Node.js script binary is an ESM package with a very small executable entrypoint declared in `package.json`’s `bin` field, a shebang of `#!/usr/bin/env node`, published JavaScript rather than runtime-transpiled TypeScript, explicit Node engine support, and I/O behavior modeled after traditional Unix filters. A chainable binary should treat `stdin` as input, `stdout` as machine-readable result output, and `stderr` as diagnostics; it should preserve exit status semantics, support quiet and JSON modes, avoid unsolicited banners and spinners when not attached to a TTY, handle backpressure, and remain useful both as a CLI and as an importable library.

The strategic shift is from “CLI as interactive app” to “CLI as protocol participant.” In that paradigm, the executable is one layer over a composable core: arguments select behavior; streams carry data; process exit codes signal control flow; JSON/NDJSON/text contracts allow downstream programs to consume output; and package metadata makes the binary reliably discoverable across npm, pnpm, Yarn, `npx`/`npm exec`, and CI.

---

## 1. Baseline Packaging Conventions

### 1.1 Use `bin` for executables, not `main`

For a package that installs one or more commands, declare `bin` in `package.json`. npm’s package metadata treats `bin` as the map from command names to local executable files; when installed, package managers expose these commands through global shims or local `node_modules/.bin`-style resolution. npm documents this as the mechanism for executable package files, while Node’s package documentation distinguishes package metadata and module-system behavior from command exposure.[^npm-package-json][^node-packages]

Recommended shape:

```json
{
  "name": "@scope/tool",
  "version": "1.0.0",
  "type": "module",
  "bin": {
    "tool": "./bin/tool.js"
  },
  "exports": {
    ".": "./dist/index.js"
  },
  "files": [
    "bin/",
    "dist/",
    "README.md",
    "LICENSE"
  ],
  "engines": {
    "node": ">=20"
  }
}
```

For one command whose command name is the package name, npm also accepts a string form:

```json
{
  "bin": "./bin/tool.js"
}
```

However, the object form is clearer, scales to multiple binaries, and avoids ambiguity for scoped packages.

### 1.2 Put a shebang at byte zero

The binary entry file should begin with:

```js
#!/usr/bin/env node
```

There must be no byte-order mark, blank line, or comment before the shebang. The file must be included in the published package. For Unix-like direct execution outside npm shims, it should also be executable in the working tree, usually via `chmod +x bin/tool.js`. npm and package-manager shims often make installed commands callable even when the source checkout mode bit is wrong, but relying on that makes local development, tarball inspection, and direct use more fragile.

### 1.3 Prefer ESM natively, but isolate the CLI entrypoint

Set `"type": "module"` when the package is ESM-first. Node uses the nearest `package.json` `type` field and file extensions to determine whether `.js` files are ESM or CommonJS.[^node-packages][^node-esm]

A robust layout separates the binary wrapper from implementation:

```text
package.json
bin/
  tool.js        # shebang, argument parsing, calls run()
dist/
  index.js      # importable API
  cli.js        # run(argv, io, env) implementation
src/
  index.ts
  cli.ts
```

`bin/tool.js`:

```js
#!/usr/bin/env node
import { runCli } from '../dist/cli.js';

try {
  const code = await runCli({
    argv: process.argv.slice(2),
    stdin: process.stdin,
    stdout: process.stdout,
    stderr: process.stderr,
    env: process.env,
  });
  process.exitCode = code ?? 0;
} catch (error) {
  process.stderr.write(`${error?.stack ?? error}\n`);
  process.exitCode = 1;
}
```

This keeps top-level process handling thin and makes the logic testable by injecting fake streams and environment.

### 1.4 Publish built JavaScript, not TypeScript-only entrypoints

For public CLI packages, compile TypeScript before publishing and point `bin` at JavaScript. Runtime loaders such as `ts-node`, `tsx`, or custom ESM loaders are excellent for development but add startup cost, loader fragility, and dependency assumptions for users. The `bin` should work with plain `node` and the declared `engines.node` range.

### 1.5 Keep `exports` and `bin` conceptually separate

`exports` controls what other packages can import; `bin` controls what shells can execute. Do not assume that exporting a CLI module makes it executable, or that declaring a binary makes internals importable. A good ESM CLI package usually exposes a documented programmatic API through `exports` and an executable command through `bin`.

---

## 2. ESM-Specific Practices

### 2.1 Always use explicit file extensions in relative imports

In ESM, Node expects full relative specifiers such as:

```js
import { parseInput } from './parse-input.js';
```

not:

```js
import { parseInput } from './parse-input';
```

This matters for published CLI binaries because users execute the built package under Node’s resolver, not under a bundler that may silently fill in extensions.

### 2.2 Avoid CommonJS globals; derive them explicitly

ESM does not provide CommonJS globals like `__dirname` and `__filename`. Use `import.meta.url` and `node:url` when needed:

```js
import { fileURLToPath } from 'node:url';
import { dirname } from 'node:path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
```

### 2.3 Choose a Node support floor based on APIs you actually use

For modern ESM CLIs, Node 20+ is a pragmatic floor in 2026: it gives stable ESM behavior, current LTS expectations, and access to modern web-compatible APIs. If you use `node:util`’s `parseArgs`, stream promises, built-in test runner, top-level `await`, or `fetch`, verify the exact minimum version and encode it in `engines.node`. Node’s `util.parseArgs` is now the core API for structured argument parsing rather than direct `process.argv` manipulation.[^node-parseargs]

### 2.4 Decide whether to bundle

Bundling an ESM CLI can improve startup and simplify dependency graphs, but it can also break dynamic imports, license visibility, stack traces, conditional exports, and platform-specific dependencies. Current best practice is:

- **Small dependency-light tools:** publish unbundled ESM.
- **Latency-sensitive tools:** bundle with a Node-targeted bundler and preserve the shebang.
- **Tools using native addons or complex dynamic loading:** avoid bundling unless tested across platforms.
- **Security-sensitive tools:** keep dependencies minimal, pin development tooling, and publish provenance metadata when available.

---

## 3. Designing Pipable and Chainable Node Binaries

### 3.1 Follow the standard stream contract

Node exposes `process.stdin` as a readable stream and `process.stdout` / `process.stderr` as writable streams; Node’s process docs show `stdin.pipe(stdout)` as the minimal stream-copy pattern.[^node-process] The composable CLI contract is:

- `stdin`: primary data input when no file or explicit argument input is supplied.
- `stdout`: primary result output, suitable for downstream piping.
- `stderr`: logs, progress, warnings, prompts, and diagnostics.
- exit code: machine-readable success/failure signal.

Never write progress indicators, banners, warnings, or prompts to `stdout` unless they are the intended result format. This is the single most important rule for pipe-friendly CLIs.

### 3.2 Treat TTY and pipe modes differently

Many usability features are helpful in a terminal and harmful in a pipeline. Detect TTYs:

```js
const interactive = process.stdin.isTTY && process.stdout.isTTY;
const color = process.stdout.isTTY && !process.env.NO_COLOR;
```

Recommended behavior:

| Context | Behavior |
|---|---|
| `stdout` is a TTY | Human-readable formatting is acceptable. |
| `stdout` is a pipe/file | Suppress color, spinners, tables unless explicitly requested. |
| `stdin` is a TTY and input is required | Show help or prompt only if command is explicitly interactive. |
| `stdin` is not a TTY | Read from stdin without prompting. |
| CI is detected | Disable interactive prompts by default. |

### 3.3 Support filter semantics

A chainable binary should often behave like a Unix filter:

```sh
cat input.jsonl | tool --format ndjson | jq '.id' | sort -u
```

Design implications:

1. If no positional file arguments are provided, read from `stdin` when data is piped.
2. If files are provided, stream them one by one rather than loading all contents into memory.
3. Let users pass `-` to mean stdin.
4. Support output to stdout by default and `--output <file>` only as an option.
5. Keep default output stable enough for downstream use.

### 3.4 Prefer streaming over whole-buffer reads

For large or indefinite input, use streams. Node’s stream module is the core abstraction for streaming data, and `readline` provides line-by-line processing over readable streams.[^node-stream][^node-readline]

Line-oriented example:

```js
import { createInterface } from 'node:readline/promises';

export async function* lines(readable) {
  const rl = createInterface({ input: readable, crlfDelay: Infinity });
  for await (const line of rl) {
    yield line;
  }
}
```

Transform pipeline example:

```js
import { pipeline } from 'node:stream/promises';
import { Transform } from 'node:stream';

const uppercase = new Transform({
  transform(chunk, _enc, callback) {
    callback(null, chunk.toString().toUpperCase());
  },
});

await pipeline(process.stdin, uppercase, process.stdout);
```

Using `pipeline` is preferable to hand-wiring `data` and `end` events because it propagates errors and respects stream lifecycle semantics.

### 3.5 Respect backpressure and broken pipes

`process.stdout.write()` returns a boolean. If it returns `false`, a stream-aware CLI should wait for `drain` before writing more. This matters when downstream consumers are slower than the CLI or exit early.

A common footgun is `process.exit()` immediately after asynchronous writes. Prefer `process.exitCode = n` and let the event loop flush pending writes. Use explicit stream completion only for ordinary file streams you own, not for `process.stdout`/`stderr` in ways that violate Node’s process semantics.

### 3.6 Provide stable machine formats

For composability, expose at least one stable machine-readable format:

- `--json` for a single JSON document.
- `--ndjson` or `--jsonl` for streaming records.
- `--raw` for unquoted scalar output.
- `--format text|json|ndjson` when multiple modes exist.

Avoid making prettified human output the only interface. Human tables are not APIs.

### 3.7 Separate diagnostics from data

Bad:

```js
console.log('Reading input...');
console.log(JSON.stringify(result));
```

Good:

```js
process.stderr.write('Reading input...\n');
process.stdout.write(`${JSON.stringify(result)}\n`);
```

`console.log` writes to stdout; use it only when the message is result output. For structured CLIs, create tiny helpers:

```js
const out = (s) => stdout.write(s);
const err = (s) => stderr.write(s);
```

### 3.8 Exit codes should be boring and documented

Use conventional exit behavior:

| Code | Meaning |
|---:|---|
| 0 | Success. |
| 1 | General failure. |
| 2 | Usage error / invalid arguments. |
| 64+ | Optional `sysexits`-style domain codes if documented. |
| 130 | Interrupted by Ctrl-C / SIGINT, when surfaced. |

Do not encode ordinary empty results as failure. For example, `tool search pattern` returning no matches may be `0` with empty output if absence is a valid result, or `1` if modeled after `grep`; choose and document.

---

## 4. Argument Parsing and CLI Surface

### 4.1 Use Node core `parseArgs` for small tools

For small ESM binaries, `node:util`’s `parseArgs` is often sufficient and avoids a dependency. It turns argv into structured options and positionals rather than forcing ad hoc parsing.[^node-parseargs]

Example:

```js
import { parseArgs } from 'node:util';

const { values, positionals } = parseArgs({
  args: argv,
  allowPositionals: true,
  options: {
    help: { type: 'boolean', short: 'h' },
    version: { type: 'boolean', short: 'v' },
    format: { type: 'string', default: 'text' },
    quiet: { type: 'boolean', short: 'q' },
  },
});
```

### 4.2 Use Commander, yargs, Clipanion, or oclif for richer CLIs

When the command grows subcommands, shell completion, generated help, validation, or plugin architecture, use a CLI framework. oclif explicitly targets Node.js CLIs from simple flag parsers to large extensible command suites, and its current docs describe ESM support and interoperability in modern versions.[^oclif-intro][^oclif-esm] Commander remains a common lightweight option; modern Commander has moved toward ESM-first distribution while maintaining interoperability in supported runtimes.[^commander-changelog]

Decision rule:

- One binary, few flags: `parseArgs`.
- One binary, polished help and subcommands: Commander or yargs.
- Large plugin CLI: oclif.
- Shell-script replacement with heavy subprocess orchestration: zx may be appropriate, especially internally.[^zx]

### 4.3 Preserve `--` semantics

Users expect `--` to terminate option parsing:

```sh
tool run -- grep --color=never pattern
```

If your CLI forwards commands, do not over-parse. Capture tokens after `--` and pass them exactly as arguments to subprocess APIs such as `spawn`, not through shell-concatenated strings.

### 4.4 Avoid prompt-first design

Prompts are hostile to pipelines unless explicitly requested. Prefer:

```sh
tool init --yes
tool deploy --env production --json
tool login   # interactive command is explicit
```

Do not prompt when `stdin` is not a TTY; it may be real data.

---

## 5. Runtime Composition Patterns

### 5.1 Injectable core API

Make the command implementation callable without global process state:

```js
export async function runCli({ argv, stdin, stdout, stderr, env }) {
  // parse args
  // read from stdin or files
  // write only result data to stdout
  // write diagnostics to stderr
  return 0;
}
```

This enables:

- Unit tests without child processes.
- Embedding in other Node tools.
- Deterministic behavior in CI.
- Future adapters such as web workers, MCP tools, or service endpoints.

### 5.2 Subprocesses: use argument arrays, not shell strings

When composing external programs, prefer `spawn(command, args, { stdio })` over `exec('string')`. It avoids shell quoting bugs and injection risks. If you intentionally need shell semantics, make that boundary explicit.

### 5.3 Pass through signals intentionally

Long-running CLIs should handle `SIGINT` and `SIGTERM` gracefully: clean up temp files, stop child processes, and exit with a conventional code. For wrappers around child processes, forward signals to the child process group where appropriate.

### 5.4 Temporary files and caches should be opt-in or invisible

Pipeline tools should not leave artifacts in the current directory unless requested. Use OS temp directories and documented cache directories. Expose `--cache-dir`, `--no-cache`, or environment variables for advanced users.

---

## 6. Package-Manager Behavior and Invocation

### 6.1 Local execution

Users commonly execute binaries through package scripts, where local dependency binaries are made available on `PATH`. npm’s `npm exec`/`npx` command runs arbitrary package binaries from local installs or fetched packages in a script-like environment; npm documents that modern `npx` is implemented through `npm exec` after the npm v7 rewrite.[^npm-exec]

Common invocations:

```sh
npm exec tool -- --help
npx tool --help
pnpm exec tool --help
pnx tool --help
corepack pnpm exec tool --help
```

pnpm documents `pnpm exec` for executing commands in project/workspace contexts and `pnx`/`pnpm dlx`/`pnpx` for fetching a package and running its default binary without adding it as a dependency.[^pnpm-exec][^pnpm-pnx]

### 6.2 Account for `npm exec` argument forwarding

With `npm exec`, option forwarding can surprise users because npm itself also has options. Document canonical usage clearly:

```sh
npm exec -- tool --flag value
npm exec --package=@scope/tool -- tool --flag value
```

For `npx`, users generally expect:

```sh
npx @scope/tool --flag value
```

### 6.3 Use `packageManager` for repositories, not for consumers

For a project repository, add:

```json
{
  "packageManager": "pnpm@10.0.0"
}
```

This pins contributor tooling and helps Corepack-compatible workflows. Node’s Corepack documentation describes Corepack as package-manager proxy tooling that uses the project’s configured package manager.[^corepack] Do not assume every end user has Corepack enabled, and do not make a globally installed CLI depend on a package manager at runtime unless it is specifically a package-manager tool.

---

## 7. Documentation Patterns for Composable CLIs

A pipable CLI needs docs that show composition, not only installation.

Include:

1. **Synopsis:**
   ```text
   tool [options] [file...]
   tool [options] -
   ```
2. **Input contract:** file paths, stdin, encoding, record delimiters.
3. **Output contract:** text, JSON, NDJSON, exit codes.
4. **Pipeline examples:**
   ```sh
   cat events.ndjson | tool filter --type error | jq '.message'
   ```
5. **TTY behavior:** color, progress, prompts.
6. **Environment variables:** `NO_COLOR`, `CI`, auth variables, cache locations.
7. **Stability promise:** which output formats are stable APIs.

Consider shipping man pages through package metadata if your audience expects Unix-style documentation. npm documents package fields for man pages and `directories.man`, though real-world support varies across environments.[^npm-package-json]

---

## 8. Testing and Release Checklist

### 8.1 Test the installed package, not only source

Before publishing:

```sh
npm pack --dry-run
npm pack
mkdir /tmp/tool-test
cd /tmp/tool-test
npm init -y
npm install /path/to/scope-tool-1.0.0.tgz
npx tool --help
printf '{"x":1}\n' | npx tool --json
```

This catches missing `files`, broken shebangs, wrong build paths, and ESM resolver issues.

### 8.2 Matrix-test platforms and Node versions

At minimum, test:

- Linux, macOS, Windows.
- Oldest supported Node and current LTS/current.
- `npm exec`, direct `node bin/tool.js`, and package script execution.
- Piped stdin/stdout and TTY-like help output.

### 8.3 Test pipeline invariants

Automated tests should assert:

- No diagnostics on stdout.
- JSON mode emits valid JSON.
- NDJSON mode emits one valid JSON value per line.
- `--quiet` suppresses non-result diagnostics.
- Broken input returns nonzero with an error on stderr.
- Empty input behavior is documented and stable.
- Large input does not cause memory blowups.

### 8.4 Preserve shebangs through build tools

Bundlers/transpilers sometimes strip shebangs. Ensure your build output starts with `#!/usr/bin/env node`, and test the packed tarball. If needed, configure the bundler to preserve banners or copy a hand-written `bin` file that imports compiled code.

### 8.5 Publish with minimal package contents

Use `files` or `.npmignore` to prevent publishing source maps, tests, fixtures, private notes, or large development artifacts unless intentional. Run `npm pack --dry-run` to inspect contents.

---

## 9. Emerging Paradigms

### 9.1 CLI as stream transformer

The strongest direction for composable tooling is the stream-transformer model: a binary is a deterministic function from `(argv, stdin, env)` to `(stdout, stderr, exitCode)`. This model is easy to test, embed, wrap, parallelize, and reason about.

### 9.2 CLI as protocol adapter

ESM CLI packages increasingly expose both:

- a process interface (`bin`), and
- an importable API (`exports`).

This lets the same implementation power command-line use, editor integrations, MCP servers, GitHub Actions, and service backends. The CLI becomes one adapter over a core capability.

### 9.3 Structured output as an API

The mature stance is to treat JSON/NDJSON output as a public API with compatibility guarantees. Human output can change; machine output should be versioned or at least semver-governed.

### 9.4 Single executable applications remain specialized

Node has official documentation for Single Executable Applications, but the process is still documented with change caveats and is a different distribution model from npm `bin` packages.[^node-sea] SEA-style packaging can be useful for locked-down environments or non-Node users, but npm-distributed ESM binaries remain the default for Node ecosystem composability.

### 9.5 Shell-script ergonomics in JavaScript

Tools such as zx reflect an emerging philosophy: use JavaScript/TypeScript when shell scripts grow beyond shell’s comfort zone. zx provides cross-platform wrappers around child processes, argument escaping, and defaults for scripting.[^zx] For published general-purpose CLIs, however, prefer plain Node entrypoints unless zx is a deliberate runtime dependency and the user experience is tested after installation.

---

## 10. Recommended Reference Implementation Pattern

### `package.json`

```json
{
  "name": "@example/filter-lines",
  "version": "0.1.0",
  "description": "A pipable ESM Node CLI that filters lines from stdin or files.",
  "type": "module",
  "bin": {
    "filter-lines": "./bin/filter-lines.js"
  },
  "exports": {
    ".": "./dist/index.js"
  },
  "files": ["bin", "dist", "README.md", "LICENSE"],
  "engines": {
    "node": ">=20"
  },
  "scripts": {
    "build": "tsc -p tsconfig.json",
    "prepack": "npm run build",
    "test:pack": "npm pack --dry-run"
  }
}
```

### `bin/filter-lines.js`

```js
#!/usr/bin/env node
import { runCli } from '../dist/cli.js';

try {
  process.exitCode = await runCli({
    argv: process.argv.slice(2),
    stdin: process.stdin,
    stdout: process.stdout,
    stderr: process.stderr,
    env: process.env,
  });
} catch (error) {
  process.stderr.write(`${error?.message ?? error}\n`);
  process.exitCode = 1;
}
```

### `src/cli.ts`

```ts
import { parseArgs } from 'node:util';
import { createInterface } from 'node:readline/promises';
import { createReadStream } from 'node:fs';
import type { Readable, Writable } from 'node:stream';

export interface CliIO {
  argv: string[];
  stdin: Readable;
  stdout: Writable;
  stderr: Writable;
  env: NodeJS.ProcessEnv;
}

async function write(stream: Writable, chunk: string): Promise<void> {
  if (stream.write(chunk)) return;
  await new Promise<void>((resolve) => stream.once('drain', resolve));
}

async function processReadable(
  input: Readable,
  pattern: RegExp,
  stdout: Writable,
): Promise<void> {
  const rl = createInterface({ input, crlfDelay: Infinity });
  for await (const line of rl) {
    if (pattern.test(line)) await write(stdout, `${line}\n`);
  }
}

export async function runCli(io: CliIO): Promise<number> {
  const { values, positionals } = parseArgs({
    args: io.argv,
    allowPositionals: true,
    options: {
      help: { type: 'boolean', short: 'h' },
      pattern: { type: 'string', short: 'p' },
      quiet: { type: 'boolean', short: 'q' },
    },
  });

  if (values.help || !values.pattern) {
    await write(io.stdout, 'Usage: filter-lines --pattern <regex> [file...|-]\n');
    return values.help ? 0 : 2;
  }

  const pattern = new RegExp(values.pattern);
  const files = positionals.length ? positionals : ['-'];

  for (const file of files) {
    const input = file === '-' ? io.stdin : createReadStream(file, 'utf8');
    await processReadable(input, pattern, io.stdout);
  }

  return 0;
}
```

---

## 11. Practical Best-Practice Checklist

Use this as a pre-publication checklist:

- [ ] `package.json` has `"type": "module"` if ESM-first.
- [ ] `bin` maps command names to built JavaScript files.
- [ ] Binary entrypoint starts with `#!/usr/bin/env node` at byte zero.
- [ ] Published tarball includes `bin/` and `dist/`.
- [ ] Relative ESM imports include `.js` extensions in build output.
- [ ] `engines.node` matches actual API usage.
- [ ] CLI core is testable without global process state.
- [ ] Reads from stdin when piped or when `-` is supplied.
- [ ] Writes only result data to stdout.
- [ ] Writes diagnostics/progress/prompts to stderr.
- [ ] Suppresses colors/spinners/tables when stdout is not a TTY.
- [ ] Supports `--json` or `--ndjson` when data is meant for machines.
- [ ] Documents exit codes.
- [ ] Avoids `process.exit()` after async writes; uses `process.exitCode`.
- [ ] Handles stream errors and backpressure.
- [ ] Has tests for pipe behavior, package tarball install, and Windows.
- [ ] `npm pack --dry-run` has been inspected.

---

## Bottom Line

For ESM Node script binary packaging, the strongest current practice is to ship a small, shebang-bearing `bin` file that imports a compiled ESM implementation, declare it explicitly in `package.json`, and design the executable as a stream-aware Unix-style component. The packaging details make the command discoverable; the stream discipline makes it composable; and the separation between CLI wrapper and library core makes it maintainable.

---

## Sources

[^node-packages]: Node.js Documentation, “Modules: Packages.” https://nodejs.org/api/packages.html
[^node-esm]: Node.js Documentation, “ECMAScript modules.” https://nodejs.org/api/esm.html
[^npm-package-json]: npm Documentation, “package.json.” https://docs.npmjs.com/files/package.json/
[^npm-exec]: npm Documentation, “npm exec.” https://docs.npmjs.com/cli/v11/commands/npm-exec/
[^node-process]: Node.js Documentation, “Process.” https://nodejs.org/api/process.html
[^node-stream]: Node.js Documentation, “Stream.” https://nodejs.org/api/stream.html
[^node-readline]: Node.js Documentation, “Readline.” https://nodejs.org/api/readline.html
[^node-parseargs]: Node.js Documentation, “util.parseArgs.” https://nodejs.org/api/util.html
[^pnpm-exec]: pnpm Documentation, “pnpm exec.” https://pnpm.io/cli/exec
[^pnpm-pnx]: pnpm Documentation, “pnx / pnpm dlx / pnpx.” https://pnpm.io/cli/pnx
[^corepack]: Node.js Documentation, “Corepack.” https://nodejs.org/download/release/v22.11.0/docs/api/corepack.html
[^oclif-intro]: oclif Documentation, “Introduction.” https://oclif.github.io/docs/introduction/
[^oclif-esm]: oclif Documentation, “ESM.” https://oclif.github.io/docs/esm/
[^commander-changelog]: Commander.js changelog. https://github.com/tj/commander.js/blob/master/CHANGELOG.md
[^zx]: google/zx documentation and repository. https://github.com/google/zx and https://google.github.io/zx/getting-started
[^node-sea]: Node.js Documentation, “Single executable applications.” https://nodejs.org/api/single-executable-applications.html
