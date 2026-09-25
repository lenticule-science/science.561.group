---
title: "Remote Development Environments"
date-created: 2026-04-03
keywords:
  - remote-development
  - ssh
  - cloud-ide
  - developer-infrastructure
description: "Survey of remote development environment architectures — SSH-based, cloud-hosted, and hybrid — with documented tradeoffs in latency, cost, control, and portability."
references:
  - id: ref1
    type: document
    title: Microsoft. 'Remote Development using SSH.' Visual Studio Code Documentation, 2026.
  - id: ref2
    type: document
    title: JetBrains. 'Remote Development Overview.' JetBrains Gateway Documentation, 2025.
  - id: ref3
    type: document
    title: Coder. 'Achieving Low Latency Remote Development.' Coder Blog, 2025.
  - id: ref4
    type: document
    title: GitHub. 'About Billing for GitHub Codespaces.' GitHub Documentation, 2026.
  - id: ref5
    type: document
    title: Gitpod/Ona. 'Gitpod Pricing.' gitpod.io, 2026.
  - id: ref6
    type: document
    title: Loft Labs. 'Comparing Coder vs Codespaces vs Gitpod vs DevPod.' vcluster.com, 2024.
---

A remote development environment is any arrangement where the
developer's editor runs locally but code execution, file storage,
and tooling run on a separate machine. The practice is older than
the term — Unix terminals connected to shared servers in the 1970s
were remote development environments — but the modern form emerged
around 2019 with VS Code Remote SSH and has since split into three
distinct architectures.

## SSH-based remote development

The simplest architecture: a developer connects to a remote machine
over SSH, and the editor handles the split transparently. The remote
machine runs the language server, file system, terminal, and build
tools. The local machine handles rendering and input.

**VS Code Remote SSH** (Microsoft, 2019–present) installs a headless
server on the remote host and proxies editor operations over SSH.
As of 2026, it requires glibc 2.28+ on the remote. **JetBrains
Gateway** (2022–present) does the same for IntelliJ-family IDEs,
adding TLS 1.3 encryption even within the SSH tunnel. **Neovim
over SSH** achieves similar results through plugins like
remote-nvim.nvim (full remote IDE experience), remote-sshfs.nvim
(SSHFS mount), and remote-ssh.nvim (remote language servers with
local editing).

The critical tradeoff is latency. Keystroke responsiveness, file
operation speed, and editor fluidity all degrade with network
latency. A 2025 survey found 53% of remote developers cited latency
as a limiting factor, up from 32% the prior year. Bandwidth matters
less — a connection with 10 Mbps and 10ms latency outperforms
100 Mbps with 100ms latency for interactive editing. Geographic
proximity between developer and server is the primary mitigation.

SSH-based development adds no platform cost. You pay for the remote
machine and nothing else. The developer retains full root access
and can run any software. There is no vendor lock-in beyond the
SSH protocol itself.

## Cloud development environments

Cloud development environments (CDEs) are managed platforms that
provision remote machines on demand, configured from a specification
file (typically a devcontainer.json). The developer connects via
browser or local IDE.

**GitHub Codespaces** (2021–present) provisions machines from
2 to 32 cores at $0.18–$2.88/hour, with a free tier of 120
core-hours monthly. Workspaces persist across sessions but require
network connectivity — developer experience degrades rapidly on
unstable connections.

**Gitpod** (rebranded Ona, 2025) offers medium workspaces at
$0.72/hour ($115/month at 8-hour daily use) and large at $1.44/hour
($230/month). Free-tier workspaces auto-delete after 3 days of
inactivity.

**Coder** (open-source, self-hosted) eliminates platform costs
by running on your own infrastructure via Terraform and Docker.
It connects clients to remote environments through WireGuard
tunnels. The tradeoff is operational burden — your team manages
the platform.

**DevPod** (open-source, client-only) uses the DevContainer
specification without any platform component. It provisions
environments on Docker, Kubernetes, SSH targets, or local machines.
Zero platform cost, full provider independence.

The cost divergence between managed and self-hosted CDEs is stark:
Gitpod at $115–230/month versus DevPod at zero platform cost for
equivalent capabilities. The managed platforms trade money for
onboarding speed and operational simplicity.

## Persistent remote sessions

A pattern distinct from CDEs: maintaining a persistent shell
session on a remote server using terminal multiplexers. **tmux**
and **GNU Screen** allow developers to detach from a session and
reattach later, surviving network disconnections and client
restarts. The session persists on the server indefinitely unless
explicitly terminated or the server reboots.

This pattern is the standard for AI-assisted development tools
that run in terminals. Claude Code (Anthropic, 2025–present)
documents SSH + tmux as the production pattern for remote use,
with print mode (`-p`) for headless automation. Tailscale SSH
provides secure, zero-configuration tunneling for this use case.

The persistent session pattern requires no platform and minimal
setup. A VPS with SSH access and tmux installed is sufficient.
The developer can reconnect from any device — including mobile
terminal clients — and find their session exactly as they left it.

## Tradeoffs

The three architectures trade off along four axes:

**Latency control.** SSH-based and persistent sessions give full
control — choose a server geographically close. CDEs run where the
platform provider places them.

**Cost.** SSH and persistent sessions cost only the server ($4–50/month
for a VPS). Managed CDEs add platform fees ($0.18–2.88/hour) that
compound quickly for sustained use.

**Operational burden.** Managed CDEs handle provisioning, updates,
and cleanup. SSH requires maintaining the remote machine yourself.
Self-hosted CDEs (Coder, DevPod) fall between — no platform vendor,
but infrastructure management.

**Portability.** SSH works with any server. DevPod works with any
provider. Codespaces and Gitpod tie you to their platforms. Coder
requires Terraform but runs on any infrastructure.

## Platform differences for terminal-based tools

Development tools that operate in the terminal — linters, build
systems, test runners, and AI coding assistants — perform identically
on remote and local machines. The only variable is file system
speed. Networked file systems (SSHFS, NFS) introduce latency on
every file operation. Tools that run directly on the remote machine
via SSH or tmux access the local file system at native speed.

This is why the SSH + tmux pattern dominates for serious remote
development: the tool runs where the files are, and the network
carries only terminal I/O.

## Key citations

- Microsoft. "Remote Development using SSH." Visual Studio Code
  Documentation, 2026.
- JetBrains. "Remote Development Overview." JetBrains Gateway
  Documentation, 2025.
- Coder. "Achieving Low Latency Remote Development." Coder Blog, 2025.
- GitHub. "About Billing for GitHub Codespaces." GitHub
  Documentation, 2026.
- Loft Labs. "Comparing Coder vs Codespaces vs Gitpod vs DevPod."
  vcluster.com, 2024.
