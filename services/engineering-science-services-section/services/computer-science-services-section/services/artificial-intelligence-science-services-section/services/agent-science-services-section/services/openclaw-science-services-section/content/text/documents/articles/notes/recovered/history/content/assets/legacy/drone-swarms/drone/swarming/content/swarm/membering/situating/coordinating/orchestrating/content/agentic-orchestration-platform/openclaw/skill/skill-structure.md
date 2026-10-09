---
type: object
class: operator
description: A skill in OpenClaw 2026.05.07 - a managed unit of capability that teaches the agent how to use tools.
status: draft
depends-on: []
---

# Skill (v2026.05.07)

In OpenClaw 2026.05.07, a **skill** is a directory containing a `SKILL.md` file with YAML frontmatter and instructions that teaches the agent how to use specific tools.
Skills follow the AgentSkills specification and are loaded from multiple locations with defined precedence.

## Structure

A skill directory contains: - `SKILL.md`: Required file with YAML frontmatter and usage instructions - Optional: installer scripts, configuration files, or other resources

## SKILL.md Format

### Required Frontmatter
```yaml
---
name: <skill-slug>
description: <human-readable description>
---
```

### Optional Frontmatter Keys - `homepage`: URL shown as "Website" in macOS Skills UI - `user-invocable`: boolean (default true) - exposes skill as slash command - `disable-model-invocation`: boolean (default false) - keeps instructions out of normal agent prompt - `command-dispatch`: when set to "tool", slash command bypasses model and dispatches directly to a tool - `command-tool`: tool name to invoke when `command-dispatch: tool` - `command-arg-mode`: "raw" (default) - for tool dispatch, forwards raw args string

### Metadata Gating (Load-time Filters) Skills can declare `metadata.openclaw` to control when they're loaded:

```yaml
---
name: image-lab
description: Generate or edit images via a provider-backed image workflow
metadata:
  openclaw:
    requires:
      bins: ["uv"]              # Each must exist on PATH
      anyBins: []               # At least one must exist on PATH
      env: ["GEMINI_API_KEY"]   # Env var must exist or be provided in config
      config: ["browser.enabled"] # List of openclaw.json paths that must be truthy
    primaryEnv: "GEMINI_API_KEY"  # Env var associated with skills.entries.<name>.apiKey
    install: [                  # Optional installer specs for macOS Skills UI
      {
        id: "brew"
        kind: "brew"
        formula: "gemini-cli"
        bins: ["gemini"]
        label: "Install Gemini CLI (brew)"
      }
    ]
  }
---
```

#### Metadata Fields - `always`: boolean - when true, always include skill (skip other gates) - `emoji`: string - optional emoji for macOS Skills UI - `os`: ["darwin" | "linux" | "win32"] - optional list of eligible platforms - `requires.bins`: string[] - binaries that must exist on PATH - `requires.anyBins`: string[] - at least one binary must exist on PATH - `requires.env`: string[] - environment variables that must exist - `requires.config`: string[] - openclaw.json config paths that must be truthy - `primaryEnv`: string - env var name for apiKey injection - `install`: object[] - installer specs (brew/node/go/uv/download)

## Skill Locations and Precedence

OpenClaw loads skills from these sources (highest precedence first):

| # | Source | Path |
|---|--------|------|
| 1 | Workspace skills | `<workspace>/skills` |
| 2 | Project agent skills | `<workspace>/.agents/skills` |
| 3 | Personal agent skills | `~/.agents/skills` |
| 4 | Managed/local skills | `~/.openclaw/skills` |
| 5 | Bundled skills | shipped with the install |
| 6 | Extra skill folders | `skills.load.extraDirs` (config) |

If a skill name conflicts, the highest-numbered source wins.

## Per-Agent vs Shared Skills

| Scope | Path | Visible to |
|-------|------|------------|
| Per-agent | `<workspace>/skills` | Only that agent |
| Project-agent | `<workspace>/.agents/skills` | Only that workspace's agent |
| Personal-agent | `~/.agents/skills` | All agents on that machine |
| Shared managed/local | `~/.openclaw/skills` | All agents on that machine |
| Shared extra dirs | `skills.load.extraDirs` (config) | All agents on that machine |

## Agent Skill Allowlists

Location/precedence determines which copy of a same-named skill wins; agent allowlists determine which skills an agent can actually use:

```json5
{
  agents: {
    defaults: {
      skills: ["github", "weather"], // inherited by agents without explicit skills
    },
    list: [
      { id: "writer" }, // inherits github, weather
      { id: "docs", skills: ["docs-search"] }, // replaces defaults
      { id: "locked-down", skills: [] }, // no skills
    ],
  },
}
```

### Allowlist Rules - Omit `agents.defaults.skills` for unrestricted skills by default - Omit `agents.list[].skills` to inherit `agents.defaults.skills` - Set `agents.list[].skills: []` for no skills - Non-empty `agents.list[].skills` is the **final** set for that agent (does not merge with defaults) - Effective allowlist applies to prompt building, skill slash-command discovery, sandbox sync, and skill snapshots

## Environment Injection

When an agent run starts, OpenClaw: 1.
Reads skill metadata and applies load-time gates 2.
For eligible skills, applies `skills.entries.<key>.env` and `skills.entries.<key>.apiKey` to `process.env` 3.
Builds the system prompt with eligible skills 4.
Restores original environment after the run ends

Environment injection is **scoped to the agent run**, not a global shell environment.

## Skill Snapshots and Refresh

OpenClaw snapshots eligible skills when a session starts and reuses that list for subsequent turns in the same session.
Changes take effect on next new session.

Skills can refresh mid-session via: 1. **Skills watcher**: Watches skill folders for `SKILL.md` changes (configurable via `skills.load.watch` and `watchDebounceMs`) 2. **Remote macOS nodes**: When Linux gateway connects to macOS node with `system.run` allowed, macOS-only skills become eligible if required binaries are present on that node

## Token Impact

When skills are eligible, OpenClaw injects a compact XML list into the system prompt: - Base overhead: 195 characters (when ≥1 skill) - Per skill: 97 characters + length of XML-escaped `<name>`, `<description>`, and `<location>` values - Formula: `total = 195 + Σ (97 + len(name_escaped) + len(description_escaped) + len(location_escaped))` - Rough estimate: ~4 chars/token, so 97 chars ≈ 24 tokens per skill plus actual field lengths

## Managed Skills Lifecycle

- Bundled skills: shipped with install (npm package or OpenClaw.app)
- Local overrides: `~/.openclaw/skills` (for pinning/patching without changing bundled copy)
- Workspace skills: user-owned in `<workspace>/skills` (overrides both on name conflicts)

## Security Notes

⚠️ Treat third-party skills as untrusted code.
Read them before enabling. - Workspace and extra-dir skill discovery only accepts skill roots whose resolved realpath stays inside configured root - Gateway-backed skill dependency installs run dangerous-code scanner before executing installer metadata - `critical` scanner findings block by default unless caller sets dangerous override - `suspicious` findings warn only - `openclaw skills install <slug>` downloads ClawHub skill folder into workspace (does not use installer-metadata path) - `skills.entries.*.env` and `skills.entries.*.apiKey` inject secrets into **host** process for that agent turn (not sandbox)

## Specification (v2026.05.07)

### SKILL.md Format Details

#### YAML Frontmatter Schema All SKILL.md files must begin with YAML frontmatter delimited by `---` lines:

**Required Fields:** - `name`: string - unique skill identifier (slug format: lowercase with hyphens) - `description`: string - human-readable explanation of the skill's purpose

**Optional Fields:** - `homepage`: URL - shown as "Website" in macOS Skills UI - `user-invocable`: boolean (default true) - if false, skill won't appear as slash command - `disable-model-invocation`: boolean (default false) - if true, skill instructions excluded from normal agent prompt - `command-dispatch`: string - when set to "tool", slash command bypasses model and dispatches directly to a tool - `command-tool`: string - tool name to invoke when `command-dispatch: tool` - `command-arg-mode`: string ("raw" default) - for token dispatch, controls how arguments are forwarded ("raw" or "json")

#### Metadata Gating (Load-time Filters) Skills can declare `metadata.openclaw` to control loading conditions:

```yaml
---
name: image-lab
description: Generate or edit images via a provider-backed image workflow
metadata:
  openclaw:
    requires:
      bins: ["uv"]              # Each binary must exist on PATH
      anyBins: []               # At least one binary must exist on PATH
      env: ["GEMINI_API_KEY"]   # Env var must exist or be provided in config
      config: ["browser.enabled"] # openclaw.json config paths that must be truthy
    primaryEnv: "GEMINI_API_KEY"  # Env var for apiKey injection
    install: [                  # Optional installer specs for macOS Skills UI
      {
        id: "brew"
        kind: "brew"
        formula: "gemini-cli"
        bins: ["gemini"]
        label: "Install Gemini CLI (brew)"
      }
    ]
  }
---
```

**Metadata Fields:** - `always`: boolean - when true, always include skill (skip other gates) - `emoji`: string - optional emoji for macOS Skills UI - `os`: ["darwin" | "linux" | "win32"] - optional list of eligible platforms - `requires.bins`: string[] - binaries that must exist on PATH - `requires.anyBins`: string[] - at least one binary must exist on PATH - `requires.env`: string[] - environment variables that must exist - `requires.config`: string[] - openclaw.json config paths that must be truthy - `primaryEnv`: string - env var name for apiKey injection in `skills.entries.<name>.apiKey` - `install`: object[] - installer specs (brew/node/go/uv/download) with fields: - `id`: string - unique identifier - `kind`: "brew" | "node" | "go" | "uv" | "download" - `formula`: string (for brew) or `url`: string (for download) - `bins`: string[] - binaries to verify after installation - `label`: string - display name in UI

### Skill Locations and Loading Precedence

OpenClaw evaluates skill sources in this order (highest priority first):

1. **Workspace skills**: `<workspace>/skills` - highest precedence, agent-specific
2. **Project agent skills**: `<workspace>/.agents/skills` - project-specific agent skills
3. **Personal agent skills**: `~/.agents/skills` - user-specific skills available to all agents
4. **Managed/local skills**: `~/.openclaw/skills` - locally managed/shared skills
5. **Bundled skills**: Built-in skills shipped with OpenClaw installation
6. **Extra skill folders**: Configured via `skills.load.extraDirs` in openclaw.json

When multiple sources define a skill with the same name, the source highest in this list wins.

### Environment Injection Mechanics

During agent initialization, OpenClaw performs:

1. **Skill Eligibility Determination**:
   - Applies load-time gates from `metadata.openclaw.requires.*`
   - Filters by per-agent allowlist (`agents.list[].skills` or `agents.defaults.skills`)
   - Checks platform compatibility via `metadata.openclaw.os`

2. **Environment Preparation** (for each eligible skill):
   - Injects variables from `skills.entries.<skill-name>.env` as `process.env`
   - Sets API key from `skills.entries.<skill-name>.apiKey` to `process.env.<primaryEnv>` (if defined)
   - Adds skill documentation to system prompt in XML format

3. **Execution Context**:
   - Environment variables are scoped to the agent turn process only
   - Original environment is restored after agent turn completes
   - No persistent changes to host environment

### Skill Snapshots and Refresh Behavior

- **Session Start**: OpenClaw takes a snapshot of all eligible skills and their configurations
- **Turn Execution**: Uses the session's skill snapshot for consistency
- **Mid-session Refresh**:
  - **Skills Watcher**: When `skills.load.watch: true`, monitors SKILL.md files for changes
  - **Debounce**: Changes trigger reload after `skills.load.watchDebounceMs` (default 500ms)
  - **Remote Nodes**: When connected to macOS node with `system.run` allowed, evaluates macOS-only skills

### Tool Interface Declaration

Skills declare available tools through:

1. **Implicit Tools**: All skills automatically receive access to core tools based on global configuration
2. **Explicit Allowlisting**: Via `toolsAllow` array in skill metadata:
   ```yaml
   metadata:
     openclaw:
       toolsAllow: ["read", "write", "web_search"]  # Restricts skill to these tools only
   ```
3. **Tool Categories**: Skills can declare tool categories for broader access:
   ```yaml
   metadata:
     openclaw:
       toolCategories: ["file-system", "network"]  # Grants access to predefined tool groups
   ```

### Token Impact Calculation

When skills are eligible for injection:

- **Base Overhead**: 195 characters (fixed cost when ≥1 skill present)
- **Per Skill Cost**: 97 characters + lengths of XML-escaped field values
- **Formula**: `total_chars = 195 + Σ(97 + len(name_esc) + len(desc_esc) + len(loc_esc))`
- **Token Estimate**: Approximately 4 characters per token
  - Base: ~49 tokens (195 ÷ 4)
  - Per skill: ~24 tokens (97 ÷ 4) + variable tokens from field contents
  - Location field typically contributes 10-30 additional tokens based on path length

### Managed Skills Lifecycle

**Skill Types:** - **Bundled Skills**: Distributed with OpenClaw (npm package or application bundle) - Path: Package resources or application bundle - Updated via OpenClaw version upgrades - **Local Overrides**: `~/.openclaw/skills/<skill-name>/` - Used for patching/pinning specific skill versions - Takes precedence over bundled skills - **Workspace Skills**: `<workspace>/skills/<skill-name>/` - User-developed or customized skills - Highest precedence, overrides both bundled and local

**Skill Management Commands:** - `openclaw skills list` - Shows all available skills with source and status - `openclaw skills info <slug>` - Detailed information about a specific skill - `openclaw skills install <slug>` - Installs skill from ClawHub to workspace - `openclaw skills uninstall <slug>` - Removes skill from workspace - `openclaw skills update` - Updates all skills to latest versions

### Security Considerations

**Execution Environment:** - By default, tools execute in the host environment with access to injected secrets - Sandboxing available via `agents.defaults.sandbox` configuration (Docker container) - When sandboxed, secrets are injected into container environment rather than host

**Dependency Security:** - Installer metadata (`metadata.openclaw.install`) executes host commands - All installer code passes through dangerous-code scanner before execution - Scanner classifications: - `critical`: Blocks execution unless overridden with dangerous flag - `suspicious`: Shows warning but allows execution - `safe`: Proceeds without warning

**Skill Isolation:** - Skills cannot directly access other skills' environment variables - Cross-skill communication only possible through shared files or explicit messaging - Workspace skills have same host access as built-in skills; review third-party skills carefully
