---
name: "Minimal Fix"
specialization: duty
description: "Fix the specific problem with the smallest change that resolves it — no refactoring, no improvements, no scope creep"
attached-to:
  - build-error-resolver
  - rust-build-resolver
triggers:
  - build-failure
  - error-report
actions:
  - Identify the specific error
  - Fix it with the smallest possible change
  - Verify the fix works
  - Do NOT refactor surrounding code
  - Do NOT add improvements beyond what's needed
  - Do NOT expand scope
---


The duty of restraint. When fixing errors, fix ONLY the error. The surrounding code's quality is not your concern in this moment. One fix, verified, done.
