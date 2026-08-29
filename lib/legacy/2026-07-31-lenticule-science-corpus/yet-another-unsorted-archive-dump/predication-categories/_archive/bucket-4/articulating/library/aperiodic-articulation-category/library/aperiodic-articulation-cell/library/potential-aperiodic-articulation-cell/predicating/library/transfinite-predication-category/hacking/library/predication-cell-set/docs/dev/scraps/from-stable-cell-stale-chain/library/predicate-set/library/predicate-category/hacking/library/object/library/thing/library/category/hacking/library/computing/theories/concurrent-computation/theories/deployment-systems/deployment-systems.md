---
title: "Deployment Systems"
component-of: computing
---

# Deployment Systems

The engineering theory of *deployment systems* — systems whose engineering content is the relationship between a *specification* of what software should be present on a host and the *materialized state* of that host. A deployment system is responsible for closing the gap between intended and actual: building artifacts from sources, distributing them to targets, installing them, configuring them, retiring them, and recording the trajectory.

The theory's scope spans what is conventionally distributed across "package managers" (apt, dnf, brew, pip, cargo, npm), "build systems" (make, bazel, ninja), "container runtimes and orchestrators" (Docker, OCI, Kubernetes), "configuration management" (Ansible, Puppet, Chef), "infrastructure-as-code" (Terraform, Pulumi), and "purely-functional package managers" (Nix, Guix). The unifying engineering concern is the same in every case: *the host is in some state; a specification names what the host's state should be; the deployment system advances the host's state toward the specification, recording what it did and why.*

The theory is engineering content, not a survey: it characterizes what every deployment system commits to (specification, materialization, identity of artifacts, host state, distribution discipline, replay/rollback), so that two deployment systems built from different choices can be compared against the same shared characterization.

## Convention

This research directory follows the engineering-theory convention used by [predicated-computing](../predicated-computing/_index.md) and the surrounding `tech/computing/theories/` siblings. Every note is a Markdown file with YAML frontmatter; one entity per file; filenames are active lower-kebab-case slugs.

```yaml
---
type: concept | definition | morphism | theorem | conjecture | question | example | narrative | reference
class: substrate | operator | system | protocol | invariant | ...
status: draft | sketch | proved | open | refuted
depends-on: [...]
realizes: [...]
see-also: [...]
introduces: [...] | recaps: [...] | discusses: [...] | instantiates: [...]
---
```

## Layout

- `concepts/` — engineering-semantic anchors that recur across deployment systems (specification, materialization, target, artifact, distribution, reproducibility, rollback, …).
- `objects/` — definitions of the engineering structures a deployment system commits to (the specification record, the artifact, the target host, the deployment record, the rollback log).
- `morphisms/` — engineering moves: build, distribute, install, materialize, configure, retire, rollback.
- `theorems/` — engineering claims that any deployment system satisfying the substrate commitments must obey.
- `examples/` — concrete deployment systems read against the substrate (apt, Bazel, Docker/OCI, Kubernetes, Nix, Guix, …).
- `narratives/` — short rhetorical documents that walk a path through the material.
- `questions/` — open engineering questions.
- `references/` — annotated bibliography.
- `theories/` — sub-theories: more specific theories that study a particular deployment system or family under additional structural commitments the parent leaves open. The current sub-theory:

  - [nix](theories/nix/_index.md) — deployment-systems theory under the commitment that artifacts are content-addressed derivations in a purely-functional store, and that the specification is a Nix expression evaluated lazily to a derivation tree.

## Position relative to predicated-computing

[predicated-computing](../predicated-computing/_index.md) is a peer subtheory of [computing](../../_index.md) that studies what kind of computer a *predicated computer* is — substrate-level, predication-cell-primitive. predicated-computing has a [`deployment-target`](../predicated-computing/concepts/deployment-target.md) concept of its own, scoped to deployment of predicated computers specifically. The deployment-systems theory here is broader: deployment of any software system, including but not limited to predicated computers. The predicated-computing concept will be re-anchored as a specialization of deployment-systems' concepts when the upstream concepts stabilize.

## Status

Skeleton. Created to host a developing theory of [nix](theories/nix/_index.md) and the predication-categorical reading of Nix in [predicated-nix](theories/nix/theories/predicated-nix/_index.md). Concepts at this parent level will accumulate as the Nix sub-theories surface common engineering invariants that should be lifted upstream.
