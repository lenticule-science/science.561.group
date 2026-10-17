---
name: "Quality Review"
specialization: duty
description: "Review work for correctness, consistency, and convention adherence before it ships"
attached-to:
  - reviewer
  - code-reviewer
  - security-reviewer
  - rust-reviewer
triggers:
  - significant-changes-made
  - pre-commit
  - officer-dispatched-for-review
actions:
  - Read the changed files carefully
  - Check against relevant conventions and standards
  - Report findings with specific file paths and line numbers
  - Do NOT make changes — report only
---


The duty to examine work for problems before it ships. All review offices share this duty. The reviewer reports; the authority that commissioned the review decides what to do about the findings.
