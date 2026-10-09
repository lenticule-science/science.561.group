---

name: agentic-harness-architecture
date-created: 2026-04-01
specialization: plan
department: engineering
cross-cuts: [command]
---


## Goal

Separate the shared agentic infrastructure (skills, agents, commands, rules, hooks, contexts) from the harness-specific deployment configuration (Claude Code's `.claude/` layout, settings format, identity). This makes the agentic tooling a managed engineering asset that can be installed to any harness — Claude Code now, Codex or others later.

## Current State

The system's agentic infrastructure is split incoherently:

- **`.claude/`** — 11 agents, 26+ skills, 28+ commands, 3 contexts, 1 rule, 1 hook script, settings.json, identity.json. Claude Code reads from here at runtime.
- **`operations/engineering/fars/hooks/`** — 13 hook scripts (JS and Python). Already managed under engineering.
- **`operations/engineering/skills/`** — 1 skill (writing-library-frontmatter). Started the pattern, didn't follow through.
- **`.claude/settings.json`** — references paths in both locations. The wiring is harness-specific but the scripts it wires are shared.

13 of 14 hook scripts are already managed under engineering. The rest of the agentic infrastructure is not. There is no principled boundary — just historical accident from adding things where Claude Code expects them.

## Target Architecture

```
operations/engineering/fars/agentic/
  agents/          — shared agent definitions (markdown)
  skills/          — shared skill definitions (markdown + subdirs)
  commands/        — shared command definitions (markdown)
  rules/           — shared rules (markdown)
  contexts/        — shared context files (markdown)
  hooks/           — shared hook scripts (JS/Python) ← already mostly here

operations/engineering/fars/harnesses/agentic/claude-code/
  manifest.json    — declares which shared tools to install + harness-specific config
  install.js       — reads manifest, copies to .claude/
  settings.json    — Claude Code hook wiring format
  identity.json    — Claude Code identity config
  overrides/       — any Claude-Code-specific versions of shared files (if needed)
```

After installation:

```
.claude/                ← deployment target, not source-of-truth
  agents/               ← copied from shared
  skills/               ← copied from shared
  commands/             ← copied from shared
  rules/                ← copied from shared
  contexts/             ← copied from shared
  hooks/                ← copied from shared (or stays empty if hooks are in tools/)
  settings.json         ← copied from harness
  identity.json         ← copied from harness
```

### What is shared vs. harness-specific

**Shared** (harness-agnostic, lives in `tools/agentic/`):
- Agent definitions — markdown describing role, tools, behavior. Any agent framework that reads markdown can use these.
- Skills — markdown describing patterns and procedures. Format-neutral.
- Commands — markdown describing invocable actions. The trigger syntax may vary between harnesses, but the content is shared.
- Rules — markdown conventions that apply regardless of harness.
- Contexts — markdown context files.
- Hook scripts — the JS/Python scripts that do the actual work. The script is the same whether Claude Code or Codex wires it.

**Harness-specific** (lives in `tools/harnesses/agentic/claude-code/`):
- `settings.json` — Claude Code's hook wiring format (matchers, async flags, timeouts). Other harnesses will have their own config format.
- `identity.json` — Claude Code's identity config.
- `install.js` — the script that knows how to deploy to `.claude/`.
- `manifest.json` — declares which shared components this harness installs. Not every harness needs every skill.
- Overrides — if a shared agent definition needs Claude-Code-specific modifications (unlikely but possible).

### The manifest

The manifest is the key piece. It declares:

```json
{
  "harness": "claude-code",
  "target": ".claude",
  "install": {
    "agents": ["*"],
    "skills": ["*"],
    "commands": ["*"],
    "rules": ["*"],
    "contexts": ["*"],
    "hooks": []
  },
  "config": {
    "settings": "settings.json",
    "identity": "identity.json"
  }
}
```

Glob patterns or explicit lists. A future Codex harness might install only a subset of skills and no commands (if Codex doesn't support them). The manifest makes the selection explicit.

### Hook path convention

Currently `settings.json` references hook scripts at `operations/engineering/fars/hooks/`. This already works — hooks don't need to be in `.claude/hooks/` to function. The one hook in `.claude/hooks/` (`check-frontmatter.js`) should move to the shared location. The harness `settings.json` continues to reference hooks by their `operations/engineering/fars/agentic/hooks/` paths.

This means hooks are the simplest case: they're already almost fully in the shared location, and the harness config already references them there.

## Steps

### Step 1: Create the shared agentic directory and move hooks

**Context brief:** The hooks are 13/14 consolidated already. Complete that consolidation and establish the `tools/agentic/` directory structure. This is the lowest-risk step — hooks already work from `operations/engineering/fars/hooks/`, and only one file needs to move.

**Tasks:**
1. Create `operations/engineering/fars/agentic/` with subdirectories: `agents/`, `skills/`, `commands/`, `rules/`, `contexts/`, `hooks/`
2. Move contents of `operations/engineering/fars/hooks/` to `operations/engineering/fars/agentic/hooks/`
3. Move `.claude/hooks/check-frontmatter.js` to `operations/engineering/fars/agentic/hooks/`
4. Update all hook path references in `.claude/settings.json`
5. Move `operations/engineering/skills/` contents to `operations/engineering/fars/agentic/skills/`
6. Verify hooks still fire correctly

**Depends on:** nothing
**Verify:** All hooks run from their new paths. No references to old paths remain in settings.json.

### Step 2: Create the harness directory and install script

**Context brief:** Build the Claude Code harness adapter — the manifest, the settings, and the install script that copies shared tools to `.claude/`. The install script is Node.js (per the hooks-must-be-Node.js-on-Windows constraint). It reads the manifest, copies files, and reports what it installed.

**Tasks:**
1. Create `operations/engineering/fars/harnesses/agentic/claude-code/`
2. Write `manifest.json` declaring all current shared components
3. Copy current `.claude/settings.json` to the harness directory (this is the harness-specific config)
4. Copy current `.claude/identity.json` to the harness directory
5. Write `install.js` — reads manifest, copies from shared to `.claude/`, copies harness config. Must handle:
   - Creating `.claude/` subdirectories if missing
   - Copying individual files and skill subdirectories
   - Reporting installed/skipped/failed items
   - A `--dry-run` flag for safety
6. Test: run install, verify `.claude/` matches current state

**Depends on:** Step 1 (shared directory must exist with hooks)
**Verify:** Running `node operations/engineering/fars/harnesses/agentic/claude-code/install.js` produces a `.claude/` directory identical to the current one. `--dry-run` reports what would happen without changing anything.

### Step 3: Migrate agents, skills, commands, rules, contexts

**Context brief:** Move the remaining 70+ files from `.claude/` to the shared location. This is the bulk migration. Do it in batches (agents first, then skills, then commands, then rules+contexts) to catch issues incrementally.

**Tasks:**
1. Move `.claude/agents/*.md` to `operations/engineering/fars/agentic/agents/`
2. Move `.claude/skills/` contents to `operations/engineering/fars/agentic/skills/`
3. Move `.claude/commands/*.md` to `operations/engineering/fars/agentic/commands/`
4. Move `.claude/rules/*.md` to `operations/engineering/fars/agentic/rules/`
5. Move `.claude/contexts/*.md` to `operations/engineering/fars/agentic/contexts/`
6. After each batch: run install.js to repopulate `.claude/`, verify Claude Code still reads the files correctly
7. Remove any now-redundant files from `.claude/` that are managed by the installer

**Depends on:** Step 2 (install script must work)
**Verify:** After full migration, `.claude/` contains only installed files. `operations/engineering/fars/agentic/` is the sole source-of-truth. Running install.js reproduces the working state.

### Step 4: Add .claude/ to .gitignore and document

**Context brief:** Once `.claude/` is fully generated by the installer, it should not be tracked in git — the source-of-truth is under `operations/engineering/`. The installer becomes part of the setup process for new clones.

**Tasks:**
1. Add `.claude/` to `.gitignore` (except maybe `.claude/settings.local.json` if we want user-specific overrides — consider this)
2. Update `CLAUDE.md` to reference the new architecture: shared tools live under engineering, harness installs to `.claude/`
3. Update `AGENTS.md` to note agent definitions are managed under engineering
4. Add install instructions to repo README or CLAUDE.md: `node operations/engineering/fars/harnesses/agentic/claude-code/install.js`
5. Consider: should install.js run automatically as a hook or git post-checkout? Or stay manual?

**Depends on:** Step 3 (all files migrated)
**Verify:** Fresh clone + install.js produces a working `.claude/` directory. No shared agentic content is committed directly to `.claude/`.
**If unclear:** Whether `.claude/` should be fully gitignored or partially tracked. The conservative choice is to gitignore it fully and require install.js. The pragmatic choice might be to keep it tracked but mark it as generated (a comment in CLAUDE.md saying "do not edit .claude/ directly").

## Open Questions

1. **Gitignore or track?** If `.claude/` is gitignored, every clone requires running install.js. If tracked, it's redundant with the source but zero-friction. The answer depends on how many people clone this repo. Currently it's one person — tracking is fine for now, gitignore when there are multiple contributors.

2. **User-local overrides.** Should there be a `.claude/settings.local.json` or similar that the installer doesn't touch? For user-specific preferences that shouldn't be shared. Claude Code may not support this natively — investigate.

3. **Subset installs.** The manifest supports glob patterns and explicit lists. When a second harness arrives, should it install only what it needs? Probably yes — a Codex harness might not support commands at all.

4. **Hook path strategy.** Currently hooks are referenced by full path in settings.json (`operations/engineering/fars/agentic/hooks/observe.js`). Alternative: copy hooks to `.claude/hooks/` and use relative paths. The current approach (full paths, no copy) is simpler and avoids duplication. Keep it unless a harness requires local paths.

5. **Relationship to charter blueprint.** Step 4 of the charter blueprint (formalizing hooks as runbooks) will want to annotate hooks with trigger norms, goals, and quartet classification. That metadata could live in the manifest, in the hook files themselves, or in a separate index. This plan should not block on the charter, but the two should stay compatible.

6. **The `operations/engineering/fars/hooks/` path.** Several existing paths reference `operations/engineering/fars/hooks/` (settings.json, possibly other docs). Step 1 moves these to `operations/engineering/fars/agentic/hooks/`. All references need updating. Consider whether the old `tools/hooks/` path should symlink to the new location during transition.

## Parallel Groups

- **Step 1** can start immediately
- **Step 2** depends on Step 1
- **Steps 3 and 4** depend on Step 2
- Steps 3 and 4 are sequential (3 before 4)

This is a 2-3 session blueprint. Step 1 is small enough to do in the same session as Step 2.
