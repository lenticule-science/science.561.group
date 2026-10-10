---
title: "Tool calls are risk-scored at log-emit time"
description: "Every tool call's audit-log cell carries a risk score and band, computed at emit time from the tool's pinned risk-profile cell. Closure rules subscribe to high-risk and critical bands for surfacing and intervention. Risk scoring is observability, not authorization; the capability fiber is the authorization layer."
kind: decision
date: "2026-05-02"
status: committed
---


## What

Every tool call the substrate emits or accepts — MCP tool calls, driver invocations, runbook step invocations, federation pushes — is recorded as an `audit-log` cell that carries a numeric risk score and a four-band classification (`low`, `medium`, `high`, `critical`).

The score is computed at log-emit time from:

1. The tool's `risk-profile` cell (referenced via the tool's `risk-profile` predicate, with a content-addressed `risk-profile-version` field pinned on the audit cell).
2. The call's argument and payload predicates, evaluated against the profile's `axes`.

The score → band mapping is configured per profile via `thresholds.{low,medium,high,critical}`.
Replay re-derives the same score from the same pinned profile, so historical audit cells are stable under future profile revisions.

Closure rules subscribe to high-risk and critical bands.
The substrate ships canonical rules: a `high`-band firing produces a `captain-attention-required` cell; a `critical`-band firing produces a `blocked-pending: operator-confirmation` cell that the runtime treats as a hold on the call until the operator confirms.

Risk scoring is **observability**, not **authorization**.
Whether a call is permitted is decided by the capability fiber per [`capability-not-acl.md`](capability-not-acl.md).
The two compose: capabilities decide permission; risk scoring decides surfacing and blocking once permission is established.

The full normative content lives in [`specs/security/tool-risk-scoring.md`](../specs/security/tool-risk-scoring.md).
The captain's source idea is [`ecc2-feature-port.md`](../../../engineering/triage/operations/command/ideas/triage/ecc2-feature-port.md) §2.

## Why

The captain's `bash-audit-log.js` work and ECC2's tool-call logging discipline both treat the audit log as a first-class structured store: who ran what tool with what arguments, when, with what outcome.
The captain has been clear that the audit log needs *risk awareness* — not every tool call is equal; an `fs-write` to a config directory is materially different from an `fs-write` to a temp directory; an outbound `smtp-send` is materially different from a local `query`.

Two design points are committed:

- **Score at log-emit, not at policy-evaluation.** Computing the score later (when a query asks "show me high-risk calls") would mean the score depends on the profile cell *at query time*, not at call time.
  Every revision to a risk profile would retroactively re-score history.
  Pinning the score and the profile-version at emit time keeps replay byte-identical and audit history stable.
  Future re-scoring is a deliberate operation (re-running a re-scoring rule against historical events) with its own audit trail.

- **Risk is observability, not authorization.** The substrate already has capability discipline; trying to re-use risk score as a permission check would fork the algebra.
  The clean separation is: capability says yes/no; risk says how loud to be about a yes.
  A `critical`-band call that the operator has not yet confirmed is held by a closure rule, not by the capability layer.
  The hold is itself a substrate cell observable in audit, which is exactly the surface the captain needs to spot operations that warrant attention.

Risk profiles are substrate cells.
The captain can revise them without code changes; revisions are signed and auditable; per-deployment profiles are normal substrate state.
Inheritance via `risk-profile-extends` lets driver authors ship sane defaults that downstream tool definitions only refine.

The `bash-audit-log.js` design intentionally surfaced patterns the captain wanted to spot (e.g., destructive subcommands in shells whose default risk should be low).
Encoding these patterns as `axes` on a profile cell makes the same surveillance into substrate state that participates in federation, signing, and replay.

Source: this conversation (2026-05-02); the captain's [`ecc2-feature-port.md`](../../../engineering/triage/operations/command/ideas/triage/ecc2-feature-port.md) (2026-05-02); the captain's existing `bash-audit-log.js` discipline (referenced, not read).

## What it rules out

- Computing risk scores at query time.
  Scores are pinned at emit time to a specific `risk-profile-version`.
- Using risk scores as the authorization mechanism.
  Capability discipline is authorization; risk is observability and intervention.
- Risk profiles stored outside the substrate (e.g., in a YAML config file).
  Profiles are substrate cells.
- Hard-coded "critical operation" lists in the tool runtime.
  The list is substrate cells observable via standard queries.
- Re-scoring historical audit cells silently when profiles change.
  Re-scoring is an explicit operation with its own audit trail.
- Skipping the audit cell for "low-risk" tool calls.
  Every tool call produces an audit cell; the score classifies it; the rules that fire depend on the band.

## What it does not constrain

- The specific axes a risk profile uses.
  The schema (`{axis, weight, predicate-pattern, argument-key}`) is open; per-profile axes are an authoring choice.
- The numeric weights or thresholds.
  Per-profile values are an authoring choice; the canonical four bands (`low`, `medium`, `high`, `critical`) are normative.
- Which tools default to which profiles in the v0.2 boot image.
  The captain decides per-deployment; the boot image ships sane defaults that can be overridden.
- The TUI/web GUI surface for surfacing high-risk firings.
  The shells render the `captain-attention-required` and `blocked-pending` cells; rendering style is the shell's choice.
- Whether to mirror audit cells to external SIEM systems (Splunk, Elastic, Loki).
  The substrate's audit cells are sufficient; external mirroring is an opt-in driver per [`drivers/driver-model.md`](../specs/drivers/driver-model.md).
- Continuous-learning behaviour over audit cells.
  The v0.9 algebraic-learning-calculus pipeline observes audit cells alongside other substrate evidence; specific learning targets are per-deployment.
