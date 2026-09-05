---
description: "Executes one open src/ WorkItem. Reads the item, finds its spec, implements the code, marks it done."
skill-closure-kind: procedure
---

# do-src-work

Inputs: `item` (WorkItem text and fields), `department` = `src`

1. Read the **Spec** field on the item. If missing, send a message to `spec/INBOX.md`
   requesting the spec and return SkillError MissingInput.

2. Read the spec file. Understand what must be built.

3. Read any existing code at the target location to understand current state.

4. Implement the work. Write or edit files in `src/` only.

5. Verify: does the result satisfy the spec's done condition? If not, continue implementing.

6. Return `work_report`:
   - `item`: the WorkItem text
   - `files_changed`: list of files written or edited
   - `findings`: any new gaps, ideas, or follow-on work discovered
