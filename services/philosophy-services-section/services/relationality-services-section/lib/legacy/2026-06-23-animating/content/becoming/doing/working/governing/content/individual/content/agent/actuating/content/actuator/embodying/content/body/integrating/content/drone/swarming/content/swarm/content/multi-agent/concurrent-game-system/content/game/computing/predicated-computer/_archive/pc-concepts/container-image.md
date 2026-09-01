---
type: concept
class: deployment-artifact
depends-on: [self-representation, hash-discipline, canonical-form]
see-also: [deployment-target, backup-discipline]
---

# Container image

A reproducible, content-addressed bundle of substrate-implementation artifacts plus their host-environment dependencies, sufficient to instantiate a running substrate on a compatible [deployment target](deployment-target.md). Container images are the substrate's *reproducibility unit at the host level* — the answer to "how do we ship this substrate to a new machine."

A container image is structurally:

- **The substrate's runtime executables.** The engine that reads the closure-rule system and applies the closure operator, the storage layer that persists the predication-graph store, the federation transport, the host-side cryptographic primitives.
- **The substrate's content — closure-rule system, shape records, scope records.** Per [self-representation](self-representation.md), the substrate's program is substrate content; the container-image bundles the substrate's bootstrap content with its runtime so a fresh deployment starts with the same closure-rule system.
- **The host-environment dependencies.** The OS libraries, language runtimes, configuration files the substrate depends on. The container image must be self-contained or must declare its dependencies precisely enough that a compatible host can resolve them.
- **A canonical-form hash.** Per [hash-discipline](hash-discipline.md), the container image has a canonical-form hash; two images with the same hash are byte-identical and produce the same substrate behavior on compatible hosts.

The substrate does not commit to a specific container-image format. Common choices:

- **OCI / Docker images** — the de-facto industry standard; works on most cloud platforms; requires a container runtime (containerd, podman, Docker).
- **Nix derivations** — content-addressed by build inputs and outputs; reproducible across machines; works with Nix-flavored hosts (Replit, NixOS, any host with Nix installed).
- **Guix derivations** — similar to Nix with stronger reproducibility guarantees and a more constrained build system.
- **Static binaries** — for substrates implementable as a single executable with no runtime dependencies; the simplest deployment artifact but the most demanding to build.

The substrate's *deployment-target compatibility* is determined by the container-image format the target accepts. A Replit deployment uses Nix derivations or Docker; a Kubernetes cluster uses OCI images; a Guix-based deployment uses Guix derivations. The deployment-target record (per [deployment-target](deployment-target.md)) declares which format(s) the target admits.

Container image construction is structurally a [conformance test](conformance.md): the build process produces an image whose canonical-form hash is determined by the build inputs (per Nix's content-addressed build, OCI's image-manifest hash, etc.). Two builds from the same inputs produce identical hashes; reproducibility is the substrate's discipline at the deployment layer.
