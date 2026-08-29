---
title: "Trusting-trust bootstrap path"
description: "The substrate's self-hosting story addresses Thompson's trusting-trust attack head-on. The bootstrap stack is reproducible-from-source under a witnessed Nix/Guix toolchain, the in-language interpreter is verifiable by replaying its event log against an independent re-implementation, and the captain's audit discipline includes a periodic cross-implementation diversity check."
kind: decision
date: "2026-05-02"
status: committed
---

# Trusting-trust bootstrap path

## What

The OS commits to a *trusting-trust-aware* self-hosting path.
Self-hosting is a v0.3 milestone (the substrate runs its own development workflow per [self-hosting-by-v0.2.md](self-hosting-by-v0.2.md), retargeted to v0.3 in this decision); but the bootstrap stack on which it runs is *not* assumed honest.
Instead, the substrate ships three structural defences:

1. **Bootstrap reproducibility.** The Python and Rust kernels build under a deployment-pinned Nix flake (default) or Guix manifest.
  Every dependency is content-addressed; the flake/manifest hash is itself a substrate cell `(deployment, bootstrap-hash, <hash>) = t`.
  A fresh Nix evaluation against the same input flake produces byte-identical kernel binaries; mismatch is `PCC_BOOTSTRAP_HASH_DIVERGED`.

2. **Cross-implementation replay diversity.** The Python kernel and the (planned) Rust kernel are independently authored and MUST produce byte-identical event logs from byte-identical inputs (per [`predicated-computing/theorems/cross-implementation-replay-fidelity`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cross-implementation-replay-fidelity.md)).
  The captain's audit discipline includes a periodic spot-check: pick a random window of the production log, replay both implementations, compare snapshots and fiber bytes.
  Disagreement surfaces a P0 incident — either one implementation has drifted or one has been tampered with.

3. **Witnessed toolchain.** The Nix/Guix store paths used in the bootstrap are themselves cells in the substrate: `(toolchain, includes, store-path:<...>) = t`.
  A toolchain change (new compiler version, new Python interpreter) is substrate content that survives audit; a silent toolchain swap is detectable by diffing `(toolchain, includes, *)` cells across boots.

The discipline does **not** claim immunity from a trusting-trust attack on the *first ever* bootstrap (the chicken-and-egg root) — there is no engineering remedy for that root, only the cross-implementation diversity check above.
The discipline does claim:

- A trusting-trust attack on **one** of the {Python, Rust} implementations is detected at the next replay-diversity check.
- A trusting-trust attack on **the toolchain** is detected by reproducible-build mismatch on the next clean rebuild.
- A trusting-trust attack on **both** implementations and the toolchain simultaneously requires compromising independently-maintained channels and is bounded above by the captain's external-channel verification (downloading a fresh Nix or Guix from a different mirror, re-pinning, re-building).

The v0.3 self-hosting milestone is the *first* milestone where these defences are load-bearing — before v0.3, the OS does not author its own development substrate, and the trusting-trust surface is the captain's general developer discipline (signed git tags, etc.), not the substrate's responsibility.

## Why

Self-hosting without a trusting-trust story is **not** self-hosting.
Thompson's "Reflections on Trusting Trust" (1984) shows that a sufficiently malicious compiler can insert backdoors into every program it builds, including itself, and the source-level audit will not detect the attack.
A substrate that hosts its own development without addressing this is asserting (a) its bootstrap is honest, and (b) its in-language interpreter is honest, on faith.

The v0.2 plan's [self-hosting-by-v0.2.md](self-hosting-by-v0.2.md) decision treats self-hosting as a milestone; this decision says: the milestone is achievable only with the three defences above in place, and naming them *now* (during v0.2 dev-docs work) lets the v0.3 self-hosting work plan against them rather than discovering the gap at delivery.

The three defences are **independent**, in the cybersecurity-discipline sense: each addresses a different attack surface and any one of them holds even if the other two are compromised.
Bootstrap reproducibility addresses toolchain compromise; cross-implementation diversity addresses single-implementation compromise (including a malicious Python interpreter); witnessed toolchain addresses silent toolchain swap.
Defence-in-depth.

The cost is real but bounded:

- **Reproducibility cost.** Maintaining the Nix flake / Guix manifest is ~1 dev-day per dependency upgrade.
  The captain's existing flake culture absorbs this.
- **Diversity cost.** Maintaining two implementations that produce byte-identical event logs is the load-bearing cost.
  Per [`predicated-computing/theorems/cross-implementation-replay-fidelity`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cross-implementation-replay-fidelity.md), the discipline is structural: canonical bytes + deterministic σ/Δ + same regime → byte-identical logs.
  The Rust kernel's authoring is justified independently (performance) and incidentally provides the diversity surface.
- **Witnessed-toolchain cost.** A boot-time cell-emission for `(toolchain, includes, *)` is one event per dependency; ~hundreds of cells once at deployment, negligible runtime.

The *non-cost* — what we don't try to do — is to claim a "verified compiler" or "trusted hardware base."
The captain's universe is not a TCG/TPM deployment; the substrate's discipline is what it can structurally enforce, not what hardware can attest.
A deployment that wants TPM attestation can layer it on top; the substrate does not require it.

Source: Ken Thompson, "Reflections on Trusting Trust" (CACM 1984); David A.
Wheeler, "Diverse Double-Compiling" (PhD thesis, GMU 2009) for the diversity-check rationale; `predicated-computing/concepts/self-hosting`.

## What it rules out

- **Self-hosting claims without reproducibility.** A v0.3 self-hosting milestone delivered under "build it from a tarball, trust me" is non-conformant with this decision.
  The flake/manifest hash must be substrate content.
- **Single-implementation deployments claiming trusting-trust resistance.** A Python-only or Rust-only deployment can run; it does not get to claim trusting-trust resistance from the diversity check (it has no diversity).
- **Silent toolchain upgrades.** Bumping the Nix flake's nixpkgs pin without emitting a new `(toolchain, includes, *)` cell is non-conformant.
  Toolchain changes are substrate content.
- **In-substrate compiler compromise hiding.** A closure rule that suppresses `PCC_BOOTSTRAP_HASH_DIVERGED` is a P0 audit finding — the structural defence is bypassable only by attacking the substrate's own audit code, which is itself reproducible-built.
- **Outsourced replay-diversity to the cloud.** The replay-diversity spot-check MUST run on captain-controlled infrastructure (or two independently-controlled cloud regions).
  A single-cloud deployment that runs both implementations on the same compromised host is not running diversity.

## What it does not constrain

- **The replay-diversity cadence.** The captain picks the cadence (per-release, per-week, per-month); v0.3 ships with a default of "per-release plus monthly random spot-check," tunable by deployment.
- **The choice of Nix vs Guix.** Either is acceptable; the only constraint is that the chosen toolchain be content-addressed and reproducible.
- **Whether to add a third independent implementation.** A future v0.5+ third implementation (e.g., an OCaml or Idris kernel) would strengthen the diversity surface; this decision does not require it.
- **The Rust kernel's authoring schedule.** The Rust kernel is justified independently (performance per [decisions/dual-implementation-python-rust.md](dual-implementation-python-rust.md)); its authoring schedule is plan-level work, not part of this decision.
- **TPM / hardware attestation.** Deployments that want hardware attestation may layer it on; the substrate's discipline does not require or forbid it.
- **The first-ever-bootstrap chicken-and-egg.** This decision acknowledges the root cannot be defeated by structural means; it does not propose a remedy beyond the captain's external-channel verification at the very first build.

## Cross-references

- [self-hosting-by-v0.2.md](self-hosting-by-v0.2.md) — the original (now retargeted to v0.3) self-hosting milestone decision.
- [questions/self-hosting-bootstrap.md](../questions/self-hosting-bootstrap.md) — the open captain-question this decision discharges (the bootstrap-honesty question).
- [decisions/dual-implementation-python-rust.md](dual-implementation-python-rust.md) — the implementation-diversity rationale.
- [`predicated-computing/theorems/cross-implementation-replay-fidelity`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cross-implementation-replay-fidelity.md) — the structural ground for the diversity check.
- Thompson, Ken.
  "Reflections on Trusting Trust." *Communications of the ACM* 27(8), August 1984.
- Wheeler, David A.
  "Fully Countering Trusting Trust through Diverse Double-Compiling."
  PhD thesis, George Mason University, 2009.
