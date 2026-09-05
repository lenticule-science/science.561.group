---
title: "Secrets-management lifecycle — pre-substrate keystore?"
description: "specs/security/secrets-management.md has no source. Is there an out-of-substrate keystore for bootstrap material, or do all secrets enter the substrate at first-boot?"
kind: question
status: resolved
opened: 2026-05-02
opened-by: agent
resolved: 2026-05-03
resolved-as: "Option A — out-of-substrate keystore feeds substrate cells at first boot."
resolved-by: "agent (industry-default; captain directive 2026-05-03 to apply common-sense answers)"
---

> **Resolved 2026-05-03 (industry default).** Bootstrap secrets live > outside the substrate — host filesystem with restrictive perms, > environment variables, or an external sealed-secrets store > (sops/age/SOPS-with-age recipient, or platform KMS).
At first > boot the substrate ingests them via a one-shot ritual, after which > the substrate-resident encrypted cell is the value-of-record and > the host-side material can be rotated/destroyed per the operator's > key policy.
This matches 12-factor + sealed-secrets industry > practice and resolves the chicken-and-egg: the substrate cannot > decrypt its own bootstrap secrets without already holding a key, > so SOMETHING outside it must hold the root-of-trust key material. > Captain may overrule; until then `specs/security/secrets-management.md` > source authoring is unblocked. ---

# Secrets-management lifecycle

## Context

`specs/security/secrets-management.md` exists; no source module implements it; no v0.2 task owns it.
The unblocking question is architectural, not implementation.

## The question

**Where do plaintext secrets live before they are absorbed into a substrate cell?**

The substrate stores cells, not opaque blobs.
A federation Ed25519 private key, a TLS server-key, an SMTP password, an MCP API token, a Matrix access token — each is a secret that the OS must hold, present to the right transport, and rotate.

The two coherent disciplines are:

1. **Substrate-resident encrypted secrets.** Secrets enter the substrate as `secret-cell` records, encrypted-at-rest with a master key.
  The master key is the only out-of-substrate secret; it lives in a host keyring (Linux `secret-service` / `gnome-keyring`, macOS Keychain, BSD `pass`).
  The substrate decrypts on use; `respond` patterns gate access via $\Box_R$.
2. **External-keystore reference.** Secrets are *named* in the substrate by reference (`secret-ref`-cells holding a keystore slug).
  The actual material lives in an external keystore (HashiCorp Vault, Linux secret-service, an HSM).
  The substrate never holds plaintext.

Both are defensible.
They differ on:

- **Self-hosting boundary.** (1) keeps the OS self-contained; (2) requires the host or a separate service.
- **Audit shape.** (1) puts secret-access into the standard audit-log cell stream; (2) requires a separate audit channel for keystore reads.
- **Federation.** (1) makes secret rotation a normal substrate fiber update; (2) leaves rotation to the keystore's own discipline.
- **Bootstrap.** (1) needs *one* host secret (the master key) at first-boot; (2) needs the keystore to be reachable at first-boot.

## Agent's lean

**(1) — substrate-resident encrypted secrets.** Reasons:

- Self-hosting is a v0.2 commitment (`self-hosting-by-v0.2`).
  An external keystore weakens self-hosting.
- The audit discipline is uniform: every secret access is an `audit-log` cell per `specs/security/tool-risk-scoring.md` §3.
- Rotation is a substrate fiber update; federated rotation is just another federation merge.
- The single host secret (the master key) sits in the host's standard secret-service.
  First-boot can prompt for the master passphrase or accept it via `$SUBSTRATE_MASTER_KEY` for non-interactive deployments.

But the agent **does not implement** until the captain rules.
The spec move and the source authoring are blocked on this answer.

## Captain's answer

(awaiting)
