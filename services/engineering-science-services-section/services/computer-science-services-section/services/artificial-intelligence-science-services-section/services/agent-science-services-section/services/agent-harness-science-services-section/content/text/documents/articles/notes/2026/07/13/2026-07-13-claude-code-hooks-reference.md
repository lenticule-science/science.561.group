---
title: "Claude code hooks reference"
description: "Claude Code Hooks: Complete 2026 Reference"
date-created: 2026-07-13
kind: research-note
in-service-of: lib/emsenn
keywords:
  - claude-code
  - hooks
  - reference
status: settled
declared-by: researcher
---
# Claude Code Hooks: Complete 2026 Reference

Authoritative guide to Claude Code's deterministic behavioral automation. Use hooks to enforce discipline that doesn't depend on model memory.

---

## I. ALL HOOK EVENTS (Complete 2026 List)

| Event | Cadence | When it fires | Supports block? |
|-------|---------|---------------|-----------------|
| **SessionStart** | Once per session | Session begins or resumes | No (exit 2 shows to user) |
| **Setup** | Once per session | `--init-only`, `--init`, `--maintenance` with `-p` | No |
| **UserPromptSubmit** | Once per turn | Before Claude processes user input | No |
| **UserPromptExpansion** | Once per turn | When command expands into prompt | Yes (exit 2) |
| **PreToolUse** | Per tool call | Before tool executes | Yes (exit 2 blocks) |
| **PermissionRequest** | Per prompt | Permission dialog shows | Yes (JSON decision) |
| **PermissionDenied** | Per tool call | Tool denied by auto-mode classifier | Yes (JSON decision) |
| **PostToolUse** | Per tool call | After tool succeeds | No (tool already ran) |
| **PostToolUseFailure** | Per tool call | After tool fails | No |
| **PostToolBatch** | Per turn | After all parallel tools resolve | No |
| **Notification** | Event-driven | When notification fires | No (side effect only) |
| **MessageDisplay** | Per message | While assistant text displays | No |
| **SubagentStart** | Per spawn | Subagent begins | No |
| **SubagentStop** | Per finish | Subagent finishes | No (feedback only) |
| **TaskCreated** | Per task | Via TaskCreate | No |
| **TaskCompleted** | Per task | Via TaskComplete | No |
| **Stop** | Once per turn | Claude finishes responding | No (block by hook cap) |
| **StopFailure** | Once per turn | Turn ends via API error | No |
| **TeammateIdle** | Per team member | Agent team member about to idle | No |
| **InstructionsLoaded** | Per load | CLAUDE.md or rules/*.md loaded | No |
| **ConfigChange** | Event-driven | Configuration file changes externally | Yes (exit 2) |
| **CwdChanged** | Event-driven | Working directory changes | No |
| **FileChanged** | Event-driven | Watched file changes on disk | No |
| **WorktreeCreate** | Per worktree | Worktree created via `--worktree` | No |
| **WorktreeRemove** | Per worktree | Worktree removed at session exit | No |
| **PreCompact** | Per compaction | Before context compaction | No |
| **PostCompact** | Per compaction | After compaction completes | No |
| **Elicitation** | During tool call | MCP server requests user input | No |
| **ElicitationResult** | During tool call | After user responds to elicitation | No |
| **SessionEnd** | Once per session | Session terminates | No |

---

## II. CONFIGURATION LOCATIONS & SCOPES

### Settings File Hierarchy (lowest to highest precedence)

```
~/.claude/settings.json              ← Global, all projects (local only)
  .claude/settings.json              ← Project-level (shareable, commit-safe)
    .claude/settings.local.json      ← Project-level (gitignored, local-only)
    Plugin hooks/hooks.json          ← When plugin enabled
    Skill/agent YAML frontmatter     ← While active
    Managed settings (org policy)    ← Enterprise-enforced
```

### Exact JSON Structure

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",              // Filter group: tool name, event type, etc.
        "if": "Bash(rm *)",             // Optional: refined pattern matching
        "hooks": [                      // Handlers in this group (run in parallel)
          {
            "type": "command",          // "command", "http", "prompt", "agent", "mcp_tool"
            "command": "/path/to/script.sh",
            "args": [],                 // Exec form: [arg1, arg2, ...] (no shell)
            "timeout": 600,             // Seconds (default: 600 for command/http/mcp_tool)
            "async": false              // If true, don't wait for completion
          },
          {
            "type": "http",
            "url": "http://localhost:8080/hooks/validate",
            "headers": {"Authorization": "Bearer $TOKEN"},
            "allowedEnvVars": ["TOKEN"]
          }
        ]
      }
    ]
  }
}
```

---

## III. EXIT CODES & BEHAVIOR (Command Hooks)

### Exit Code Semantics

| Exit Code | Meaning | Behavior |
|-----------|---------|----------|
| **0** | Success | Parse JSON from stdout (if present); continue normally |
| **2** | Blocking error | Read stderr for user/Claude feedback; **block action** (event-dependent) |
| **Other** | Non-blocking error | Show hook error in transcript; continue normally |

### Per-Event Block Behavior (Exit 2)

| Event | Exit 2 behavior |
|-------|-----------------|
| `PreToolUse` | Tool call BLOCKED; stderr fed to Claude as reason |
| `PostToolUse` | No effect; tool already executed |
| `PostToolUseFailure` | No effect; tool already failed |
| `UserPromptExpansion` | Expansion BLOCKED; stderr shown to user |
| `ConfigChange` | Change rejected; file reverted, stderr to user |
| `SessionStart`, `Setup`, `Notification`, `MessageDisplay`, etc. | Shown to user; execution continues |

**Example blocking script** (exit 2 = block):

```bash
#!/bin/bash
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

if [[ "$COMMAND" == rm\ -rf* ]]; then
  echo "Blocked: rm -rf not allowed in this project" >&2
  exit 2  # ← Blocks the Bash command
fi

exit 0  # ← No decision; normal permission flow applies
```

---

## IV. JSON OUTPUT FORMAT (Exit 0 with Structured Control)

### Universal Fields (any hook can return these)

```json
{
  "continue": true,                           // If false, stop processing
  "stopReason": "Why execution stopped",      // Message when continue=false
  "suppressOutput": false,                    // Hide from transcript
  "systemMessage": "Warning to user",         // Displayed in terminal
  "terminalSequence": "\033]777;notify;...",  // Desktop notification escape seq
  "hookSpecificOutput": {                     // Event-specific decisions (see below)
    "hookEventName": "PreToolUse",
    "permissionDecision": "deny",
    "permissionDecisionReason": "..."
  }
}
```

### PreToolUse-Specific Output

```json
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "allow|deny|ask|defer",  // REQUIRED if blocking
    "permissionDecisionReason": "Why you made this decision",
    "updatedInput": {                               // Rewrite tool arguments
      "command": "safer-command",
      "file_path": "/alternate/path"
    }
  }
}
```

**Permission decision values:**
- `"allow"` — Skip interactive prompt (but still respect permission rules/deny lists)
- `"deny"` — Cancel tool call; reason sent to Claude
- `"ask"` — Show permission dialog normally
- `"defer"` — (Non-interactive mode only) Exit process, preserve tool call for Agent SDK wrapper

### PostToolUse-Specific Output

```json
{
  "hookSpecificOutput": {
    "hookEventName": "PostToolUse",
    "updatedToolOutput": "Modified result to feed Claude",
    "additionalContext": "Information for Claude"
  }
}
```

### Stop / SubagentStop Output (Non-blocking)

```json
{
  "hookSpecificOutput": {
    "hookEventName": "Stop",
    "additionalContext": "Build succeeded. Next: write docs."
  }
}
```
If you return `additionalContext`, Claude receives it and must process it before stopping.

### SessionStart Output

```json
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "Current branch: main | Recent: commit 1a2b3c",
    "sessionTitle": "my-session-name",
    "watchPaths": ["/path/to/watch"],        // For FileChanged event
    "reloadSkills": true
  }
}
```

### UserPromptSubmit Output

```json
{
  "hookSpecificOutput": {
    "hookEventName": "UserPromptSubmit",
    "additionalContext": "Injected context here. Affects this turn only."
  }
}
```

### PermissionRequest Output (Decision Control)

```json
{
  "hookSpecificOutput": {
    "hookEventName": "PermissionRequest",
    "decision": {
      "behavior": "allow|ask|defer",
      "updatedPermissions": [
        {
          "type": "setMode",
          "mode": "acceptEdits|auto|default|plan|dontAsk|bypassPermissions",
          "destination": "session"  // or "user" for persistent change
        }
      ]
    }
  }
}
```

---

## V. STDIN INPUT (What Hooks Receive)

### Common Fields (all hooks)

```json
{
  "session_id": "abc123def456",
  "prompt_id": "550e8400-e29b-41d4-a716-446655440000",
  "transcript_path": "/path/to/transcript.jsonl",
  "cwd": "/current/working/directory",
  "permission_mode": "default|plan|auto|acceptEdits|dontAsk|bypassPermissions",
  "hook_event_name": "PreToolUse",
  "effort": {
    "level": "low|medium|high|max|ultracode",
    "cost_estimate": 50000  // tokens
  }
}
```

### PreToolUse / PostToolUse / PermissionRequest Input

```json
{
  "tool_name": "Bash|Edit|Write|Read|Glob|Grep|WebSearch|WebFetch|...",
  "tool_input": {
    "command": "git push",              // For Bash
    "file_path": "src/main.ts",         // For Edit/Write/Read
    "pattern": "TODO.*",                // For Glob/Grep
    "query": "python async/await",      // For WebSearch
    "url": "https://example.com",       // For WebFetch
    "prompt": "Write a CLI"             // For other tools
  }
}
```

### SessionStart Input

```json
{
  "source": "startup|resume|clear|compact",
  "previous_context": {
    "lines": 2500,
    "tokens": 150000
  }
}
```

### UserPromptSubmit Input

```json
{
  "prompt": "The user's full typed message"
}
```

### Stop / SubagentStop Input

```json
{
  "stop_hook_active": false,           // True if this hook has blocked before
  "assistant_message": "...",
  "tool_calls": [...]
}
```

### ConfigChange Input

```json
{
  "source": "user_settings|project_settings|local_settings|policy_settings|skills",
  "file_path": ".claude/settings.json",
  "change_type": "modified|created|deleted"
}
```

### FileChanged Input

```json
{
  "file_path": ".envrc",
  "change_type": "modified|created|deleted"
}
```

### CwdChanged Input

```json
{
  "from_cwd": "/old/path",
  "to_cwd": "/new/path"
}
```

---

## VI. MATCHER PATTERNS (Filter Which Events Trigger Hooks)

### Matcher Syntax

| Pattern Type | Example | Behavior |
|--------------|---------|----------|
| Empty or `"*"` | `"matcher": ""` | Fires on all occurrences of the event |
| Alphanumeric only | `"matcher": "Bash"` | Exact string match (case-sensitive) |
| Pipe-separated | `"matcher": "Edit\|Write"` | Multiple options (OR logic) |
| Regex | `"matcher": "^(Bash\|Zsh)$"` | Full regex (if contains non-alphanumeric) |
| MCP tools | `"matcher": "mcp__github__.*"` | Tool name = `mcp__<server>__<tool>` |

### Per-Event Matcher Values

| Event | Matches | Examples |
|-------|---------|----------|
| `PreToolUse`, `PostToolUse`, etc. | tool name | `Bash`, `Edit\|Write`, `mcp__.*` |
| `SessionStart` | startup reason | `startup`, `resume`, `clear`, `compact` |
| `Setup` | CLI flag | `init`, `maintenance` |
| `Notification` | notification type | `permission_prompt`, `idle_prompt`, `auth_success`, `agent_needs_input`, `elicitation_dialog` |
| `SubagentStart`, `SubagentStop` | agent type | `general-purpose`, `Explore`, `Plan`, custom names |
| `PreCompact`, `PostCompact` | trigger reason | `manual`, `auto` |
| `ConfigChange` | config source | `user_settings`, `project_settings`, `local_settings`, `policy_settings`, `skills` |
| `SessionEnd` | exit reason | `clear`, `resume`, `logout`, `prompt_input_exit`, `other` |
| `StopFailure` | error type | `rate_limit`, `overloaded`, `authentication_failed`, `server_error`, `model_not_found` |
| `InstructionsLoaded` | load reason | `session_start`, `nested_traversal`, `path_glob_match`, `include`, `compact` |
| `FileChanged` | filenames to watch | `.envrc\|.env` (literal, not regex) |
| `UserPromptExpansion` | command name | skill or command names |

**Regex rules:** If the matcher contains characters other than alphanumerics, `_`, `-`, `|`, or `,`, it's evaluated as regex (unanchored).

---

## VII. THE `if` FIELD: Pattern Matching on Tool Arguments

Refine `PreToolUse` / `PostToolUse` / `PermissionRequest` / `PermissionDenied` hooks to fire only on specific arguments:

```json
{
  "matcher": "Bash",
  "hooks": [
    {
      "type": "command",
      "if": "Bash(git push *)",     // Only git push commands
      "command": "/path/to/check-git-policy.sh"
    },
    {
      "type": "command",
      "if": "Edit(*.env*)",          // Only .env* files
      "command": "/path/to/block-env.sh"
    }
  ]
}
```

**Matching rules:**
- `Bash(git *)` matches `git push`, `FOO=bar git pull`, `git log && echo done`
- Commands in `$()`, backticks, and variable expansions are checked
- If pattern is more than just command name (`Bash(git push *)`), the filter fails open (hook runs anyway)

---

## VIII. PATH PLACEHOLDERS & ENVIRONMENT

### Built-in Path Variables

| Variable | Expands to | Example |
|----------|-----------|---------|
| `${CLAUDE_PROJECT_DIR}` | Project root | `/Users/alice/my-app` |
| `${CLAUDE_PLUGIN_ROOT}` | Plugin directory | `~/.claude/plugins/my-plugin` |
| `${CLAUDE_PLUGIN_DATA}` | Plugin data directory | `~/.claude/plugins/data/my-plugin` |

### Exec Form vs. Shell Form

**Shell form** (no `args` field): runs with `sh -c` / Git Bash
```json
{
  "command": "jq -r '.tool_input.command' | xargs prettier --write"
  // Pipes, redirects, && work; but watch shell profile pollution
}
```

**Exec form** (with `args` array): spawns directly, no shell
```json
{
  "command": "node",
  "args": ["${CLAUDE_PLUGIN_ROOT}/scripts/check.js", "--fix"]
  // No pipes/redirects; safer argument passing
}
```

### Environment Variables in HTTP Hooks

```json
{
  "type": "http",
  "url": "http://localhost:8080/hooks",
  "headers": {
    "Authorization": "Bearer $MY_SECRET_TOKEN"
  },
  "allowedEnvVars": ["MY_SECRET_TOKEN"]  // Only these are resolved; others → empty
}
```

### CLAUDE_ENV_FILE: Persist Environment Variables Across Bash Calls

Hook can write to `CLAUDE_ENV_FILE` (set by Claude Code) to affect subsequent Bash commands:

```bash
#!/bin/bash
# Set environment for direnv
if [ -n "$CLAUDE_ENV_FILE" ]; then
  direnv export bash >> "$CLAUDE_ENV_FILE"
fi
exit 0
```

---

## IX. HOOK TYPES: Implementation Patterns

### 1. Command Hook

```json
{
  "type": "command",
  "command": "/absolute/path/to/script.sh",
  "args": [],           // Optional: switch to exec form
  "timeout": 600,       // Seconds (default)
  "async": false        // If true, don't wait for completion
}
```

- **stdin**: JSON event data
- **stdout**: (exit 0) Parse JSON or ignore
- **stderr**: (exit 2) Feedback to Claude or user
- **exit code**: 0=success, 2=block, other=error

### 2. HTTP Hook

```json
{
  "type": "http",
  "url": "http://localhost:8080/hooks/validate",
  "headers": {
    "Content-Type": "application/json",
    "Authorization": "Bearer $TOKEN"
  },
  "allowedEnvVars": ["TOKEN"],
  "timeout": 30        // Default 10 min (300s) for HTTP
}
```

- **Request**: POST with JSON body (same as stdin)
- **Response**: 2xx with JSON body uses same output format as command hooks
- **Non-2xx or timeout**: Non-blocking error

### 3. Prompt Hook

```json
{
  "type": "prompt",
  "prompt": "Is this safe? $ARGUMENTS",
  "model": "claude-opus"  // Default: claude-haiku-4-5
}
```

- **Input**: Receives `$ARGUMENTS` (the full JSON event)
- **Output**: `{"ok": true}` or `{"ok": false, "reason": "why"}`
- **Behavior**: `ok: false` → action blocked or turn ends (event-dependent)

### 4. Agent Hook (Experimental)

```json
{
  "type": "agent",
  "prompt": "Verify all tests pass. $ARGUMENTS",
  "timeout": 120        // Default 60s
}
```

- **Capability**: Spawns subagent; can run Read, Bash, Grep, etc.
- **Output format**: Same as prompt hooks (`{"ok": true/false, "reason": "..."}`)

### 5. MCP Tool Hook

```json
{
  "type": "mcp_tool",
  "server": "my_mcp_server",
  "tool": "security_scan",
  "input": {
    "file_path": "${tool_input.file_path}",
    "severity": "high"
  }
}
```

- **Invokes**: Existing MCP server tool with provided input
- **Use case**: Audit or verification without shelling out

---

## X. PRACTICAL COPY-PASTE EXAMPLES

### Example 1: Block Dangerous Bash Commands

**File: `.claude/hooks/protect.sh`**

```bash
#!/bin/bash
set -e

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

# Patterns to block
DANGEROUS_PATTERNS=(
  "rm -rf"
  "sudo"
  "pkill"
  "killall"
)

for pattern in "${DANGEROUS_PATTERNS[@]}"; do
  if echo "$COMMAND" | grep -qi "$pattern"; then
    echo "Blocked: '$COMMAND' contains dangerous pattern '$pattern'" >&2
    exit 2  # Exit code 2 = BLOCK the tool call
  fi
done

exit 0  # No decision; normal flow
```

**File: `.claude/settings.json`**

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "${CLAUDE_PROJECT_DIR}/.claude/hooks/protect.sh"
          }
        ]
      }
    ]
  }
}
```

**Behavior:**
- PreToolUse fires before Bash command runs
- Script checks command against patterns
- Exit 2 blocks the command; Claude gets error message
- Exit 0 allows normal permission flow

---

### Example 2: Auto-Format After File Edits

**File: `.claude/settings.json`**

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "jq -r '.tool_input.file_path' | xargs npx prettier --write"
          }
        ]
      }
    ]
  }
}
```

**Behavior:**
- Fires AFTER file edit succeeds
- Cannot undo (tool already ran)
- Prettier automatically formats every edit

---

### Example 3: Inject Context After Compaction

**File: `.claude/settings.json`**

```json
{
  "hooks": {
    "SessionStart": [
      {
        "matcher": "compact",
        "hooks": [
          {
            "type": "command",
            "command": "echo 'Reminder: Use Bun not npm. Run tests before commits. Sprint: auth refactor.'"
          }
        ]
      }
    ]
  }
}
```

**Behavior:**
- Fires on session resume after auto-compaction
- stdout text injected into Claude's context
- Compensates for context loss from summarization

---

### Example 4: Block File Edits to Protected Paths

**File: `.claude/hooks/protect-files.sh`**

```bash
#!/bin/bash
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

PROTECTED=(".env" "package-lock.json" ".git/" "dist/")

for pattern in "${PROTECTED[@]}"; do
  if [[ "$FILE_PATH" == *"$pattern"* ]]; then
    jq -n '{
      hookSpecificOutput: {
        hookEventName: "PreToolUse",
        permissionDecision: "deny",
        permissionDecisionReason: "Cannot edit protected file: '"$pattern"'"
      }
    }'
    exit 0  # Exit 0 because we returned JSON
  fi
done

exit 0
```

**File: `.claude/settings.json`**

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "${CLAUDE_PROJECT_DIR}/.claude/hooks/protect-files.sh"
          }
        ]
      }
    ]
  }
}
```

**Behavior:**
- Returns JSON with `permissionDecision: "deny"`
- Claude receives reason and adapts approach
- File edit is cancelled

---

### Example 5: Stop Hook Prevents Agent from Finishing (Keep it Working)

**File: `.claude/settings.json`**

```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "prompt",
            "prompt": "Are all required tasks complete? Check the requirements. Return {\"ok\": false, \"reason\": \"Tasks remaining: ...\"} if more work is needed."
          }
        ]
      }
    ]
  }
}
```

**Behavior:**
- Fires when Claude finishes a turn
- If prompt returns `ok: false`, Claude keeps working
- Reason sent back to Claude as instruction

---

### Example 6: Auto-Approve Specific Permission Prompts

**File: `.claude/settings.json`**

```json
{
  "hooks": {
    "PermissionRequest": [
      {
        "matcher": "ExitPlanMode",
        "hooks": [
          {
            "type": "command",
            "command": "echo '{\"hookSpecificOutput\": {\"hookEventName\": \"PermissionRequest\", \"decision\": {\"behavior\": \"allow\"}}}'"
          }
        ]
      }
    ]
  }
}
```

**Behavior:**
- Approves plan-mode exit without showing dialog
- Other permission prompts still show

---

### Example 7: Reload Environment on Directory Change

**File: `~/.claude/settings.json`**

```json
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "direnv export bash > \"$CLAUDE_ENV_FILE\""
          }
        ]
      }
    ],
    "CwdChanged": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "direnv export bash > \"$CLAUDE_ENV_FILE\""
          }
        ]
      }
    ]
  }
}
```

**Behavior:**
- SessionStart: Load direnv for launch directory
- CwdChanged: Reload when Claude cd's
- Variables persisted in CLAUDE_ENV_FILE for next Bash command

---

### Example 8: Log All Bash Commands to Audit Trail

**File: `~/.claude/settings.json`**

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "jq -c '{timestamp: now | todate, session: .session_id, command: .tool_input.command}' >> ~/.claude/bash-audit.jsonl"
          }
        ]
      }
    ]
  }
}
```

**Behavior:**
- Fires after every Bash command succeeds
- Appends JSON log entry with timestamp, session, command
- No blocking; purely side-effect (logging)

---

## XI. TROUBLESHOOTING

### Hook Not Firing

- Run `/hooks` to verify it appears under the right event
- Check matcher is case-sensitive exact match
- Verify you're triggering the right event (PreToolUse vs. PostToolUse)
- For `PermissionRequest` in non-interactive mode, use `PreToolUse` instead

### "Command not found" in Hook Error

- Use absolute paths: `/path/to/script.sh`
- Or use `${CLAUDE_PROJECT_DIR}/.claude/hooks/script.sh`
- Or switch to exec form with `"args": []`

### "jq: command not found"

Install jq: `brew install jq` (macOS), `apt-get install jq` (Linux)

### Shell Profile Pollution

If your `~/.bashrc` or `~/.zshrc` has unconditional `echo` statements, they prepend to hook JSON output, causing parse errors.

**Fix:** Wrap echos in interactive check:

```bash
if [[ $- == *i* ]]; then
  echo "Shell ready"
fi
```

### Multiple Hooks Returning Conflicting Decisions

If two hooks return different `permissionDecision` values, the most restrictive wins (order: deny > defer > ask > allow).

### Stop Hook Blocks 8+ Times Without Progress

Claude Code raises block cap after 8 consecutive blocks. Your hook must check `stop_hook_active`:

```bash
INPUT=$(cat)
if [ "$(echo "$INPUT" | jq -r '.stop_hook_active')" = "true" ]; then
  exit 0  # Allow Claude to stop
fi
# ... rest of logic
```

Raise cap with env var: `export CLAUDE_CODE_STOP_HOOK_BLOCK_CAP=20`

---

## XII. DISABLE ALL HOOKS

```json
{
  "disableAllHooks": true
}
```

Managed policy hooks cannot be disabled by user settings.

---

## XIII. DEBUGGING

Run `/hooks` in Claude Code to browse all configured hooks, see their event, matcher, type, source, and exact command.

For detailed execution info (which hooks matched, exit codes, stdout, stderr):
- Start: `claude --debug-file /tmp/claude.log`
- Or mid-session: `/debug` to enable and find the log path
- Then: `tail -f /tmp/claude.log | grep hook`

Transcript view (Ctrl+O) shows one-line summaries:
- Success: silent
- Exit 2: shows stderr
- Error: shows `<hook name> hook error` + first line of stderr
