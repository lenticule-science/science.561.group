---
type: concept
class: deployment-environment
depends-on: [container-image, identity-key]
see-also: [backup-discipline, transport]
---

# Deployment target

A specific host environment where a [container image](container-image.md) of the substrate can be instantiated. The deployment-target is what the substrate runs *on*: a Replit project, a Kubernetes cluster, a bare-metal server, a Guix System, a developer's local machine. Each target imposes its own constraints (image format, networking model, persistence options, identity-key custody) that the substrate's deployment discipline must respect.

A deployment target is characterized by:

- **Image format compatibility.** Which [container-image](container-image.md) formats the target accepts: OCI/Docker, Nix derivations, Guix derivations, static binaries, etc. A target accepting only OCI images cannot deploy a Nix-only image without a translation layer.
- **Persistence model.** How the target preserves substrate state across restarts: ephemeral filesystems (Replit free tier — state lost on restart), persistent volumes (Kubernetes with PVCs, cloud block storage), object stores (S3-compatible for snapshots), per-target databases (Replit's built-in DB). The substrate's deployment must match its persistence needs to the target's offerings.
- **Networking model.** What the target exposes for federation transport: HTTP endpoints, raw TCP, WebSocket, message-queue brokers, internal-only networking. Per [transport](transport.md), the substrate's federation graph must accommodate the target's networking model.
- **Identity-key custody.** Where the target stores private keys: cloud KMS (AWS, GCP, Azure), hardware tokens (TPM, YubiKey), file-based keychains, environment variables. Per [identity-key](identity-key.md), private keys must live at the host environment; the deployment-target's identity-key custody mechanism is what the substrate's `sign` and `decrypt-region` operators delegate to.
- **Resource limits.** CPU, memory, disk, network bandwidth. The substrate's [fuel-bound](fuel-bound.md) and resource-management policies must respect the target's limits.

Common deployment targets:

- **Replit** — Nix-flavored host with built-in DB and ephemeral-or-persistent storage; cloud KMS not directly available; networking via Replit's HTTP routing; identity-keys typically in environment variables (less secure) or external KMS via API. Suitable for sprints, demos, low-stakes substrates.
- **Kubernetes (any cloud)** — OCI image format; persistent volumes, ConfigMaps, Secrets for identity-keys (or external KMS via service mesh); flexible networking with Service / Ingress; CPU/memory limits per Pod. Suitable for production federated substrates.
- **Bare-metal / VM** — flexible everything; the substrate's deployment artifact must include OS-level configuration (systemd units, network configuration). Suitable for substrate operators who manage their own infrastructure.
- **Guix System** — content-addressed derivations; functional configuration; reproducible across versions. Suitable for substrates whose reproducibility guarantees are critical.
- **Developer machine** — a deployment-target for local development; same image format as the target deployment-target, scaled-down resource limits, identity-keys in a local keychain.

The substrate's deployment record (per the [deployment-record](../objects/deployment-record.md) object) cites which deployment-target a substrate-instance is running on; the substrate's audit and federation can then reason about target-specific properties (persistence-fault-tolerance, network reachability, key-custody chain).

A substrate's *cross-target portability* is structurally a [doctrine-fidelity-compositionality](../theorems/doctrine-fidelity-compositionality.md) property: the substrate's content runs identically on compatible targets, modulo target-specific deployment-bridges that translate target-specific resources (KMS providers, persistence layers, networking primitives). Two substrates running on different targets can federate when their target-specific bridges agree on the substrate's I/O surface.
