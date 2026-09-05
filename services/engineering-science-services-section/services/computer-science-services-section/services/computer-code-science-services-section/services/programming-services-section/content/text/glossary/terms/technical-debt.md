---
name: "technical debt"
date-created: 2026-03-05
keywords:
  - SoftwareEngineering
  - ProjectManagement
---

Technical debt is the accumulated cost of deferred or incomplete work in a software system. The term was introduced by [Ward Cunningham](../../../../../../general/people/ward-cunningham.md) in 1992 as a metaphor: just as financial debt incurs interest that makes future payments more expensive, shortcuts in software development incur maintenance costs that make future changes harder.

Technical debt is not inherently negative. Deliberately incurring debt — choosing a simpler implementation now with a plan to revise later — can be a reasonable trade-off when the cost of delay outweighs the cost of revision. Debt becomes harmful when it is untracked, unacknowledged, or allowed to accumulate without a plan for repayment.

## Forms

Technical debt takes several forms:

- **Structural debt** — missing abstractions, inconsistent organization, files or directories that do not follow established conventions.
- **Documentation debt** — conventions that are practiced but not written down, or documentation that describes a system that has since changed.
- **Testing debt** — behavior that is not verified by automated checks, making it possible for regressions to go undetected.
- **Design debt** — decisions that were appropriate at the time but no longer fit the system as it has evolved.

## Repayment

Paying down technical debt involves identifying what was deferred, prioritizing it against new work, and doing the deferred work. Effective debt management requires visibility: debt that is not tracked tends to grow. Auditing — systematically surveying a codebase for known categories of debt — is a common technique for maintaining visibility.

## Related terms

- [bug](./bug.md) — a defect in behavior, distinct from debt (which is deferred work, not necessarily broken behavior)
- [program](./program.md)
- [module](./module.md)
