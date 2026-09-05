# Dev environment for the Relational Hyperverse project.
#
# Three-stage build:
#   Stage 1 (lean):       install elan + Lean toolchain, fetch Mathlib .olean cache
#   Stage 2 (github-mcp): build the GitHub MCP server Go binary
#   Stage 3 (dev):        assemble the full persistent dev environment
#
# What's in the final image:
#   - Lean 4 + Lake + Mathlib cache
#   - uv / uvx  (runs lean-lsp-mcp without a separate install step)
#   - Node.js 22 + npm  (for Claude Code or equivalent)
#   - GitHub CLI (gh) + GitHub MCP server binary
#   - openssh-server + tmux + ripgrep + fzf + jq + python3
#   - SSH key-only auth, auto-attach tmux on login
#
# Usage:
#   docker compose up -d      # start
#   ssh -p 2222 root@localhost # connect (or: make ssh from repo root)

# ── Stage 1: Lean toolchain + Mathlib cache ───────────────────────────────────
FROM ubuntu:22.04 AS lean

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl git ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSf https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh \
    | sh -s -- --no-modify-path -y --default-toolchain none

ENV PATH="/root/.elan/bin:$PATH"

WORKDIR /project
COPY lakefile.toml lean-toolchain lake-manifest.json ./

RUN elan toolchain install "$(cat lean-toolchain)" \
    && elan default "$(cat lean-toolchain)" \
    && lake update \
    && lake exe cache get

# ── Stage 2: GitHub MCP server binary ────────────────────────────────────────
FROM golang:1.22-alpine AS github-mcp

RUN apk add --no-cache git

RUN git clone --depth 1 https://github.com/github/github-mcp-server /src

WORKDIR /src
RUN CGO_ENABLED=0 GOOS=linux go build \
    -o /usr/local/bin/github-mcp-server \
    ./cmd/github-mcp-server

# ── Stage 3: persistent dev environment ──────────────────────────────────────
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Base tools + SSH + tmux + dev utilities
RUN apt-get update && apt-get install -y \
    curl git ca-certificates \
    openssh-server \
    tmux \
    ripgrep fzf jq \
    python3 python3-pip \
    make \
    && rm -rf /var/lib/apt/lists/*

# GitHub CLI
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
        -o /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] \
        https://cli.github.com/packages stable main" \
        > /etc/apt/sources.list.d/github-cli.list \
    && apt-get update && apt-get install -y gh \
    && rm -rf /var/lib/apt/lists/*

# Node.js 22
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# uv (for lean-lsp-mcp and other Python tools)
RUN curl -LsSf https://astral.sh/uv/install.sh \
    | UV_INSTALL_DIR=/usr/local/bin sh

# Lean toolchain from stage 1.
# Installed at /usr/local/elan (not /root/.elan) so that /root
# can be a persistent named volume without shadowing the toolchain.
COPY --from=lean /root/.elan /usr/local/elan
ENV ELAN_HOME=/usr/local/elan
ENV PATH="/usr/local/elan/bin:$PATH"

# Mathlib .olean cache from stage 1.
# Stored at /lean-cache; entrypoint symlinks it into the mounted repo
# on first run if .lake isn't already present.
COPY --from=lean /project/.lake /lean-cache

# GitHub MCP server binary from stage 2.
COPY --from=github-mcp /usr/local/bin/github-mcp-server /usr/local/bin/github-mcp-server

# ── SSH configuration ─────────────────────────────────────────────────────────
RUN mkdir -p /run/sshd /root/.ssh && chmod 700 /root/.ssh \
    && sed -i \
        -e 's|^#\?PermitRootLogin.*|PermitRootLogin yes|' \
        -e 's|^#\?PubkeyAuthentication.*|PubkeyAuthentication yes|' \
        -e 's|^#\?PasswordAuthentication.*|PasswordAuthentication no|' \
        /etc/ssh/sshd_config \
    && echo "AuthorizedKeysFile /root/.ssh/authorized_keys" >> /etc/ssh/sshd_config

# ── tmux configuration ────────────────────────────────────────────────────────
COPY tmux.conf /root/.tmux.conf

# ── Shell configuration ───────────────────────────────────────────────────────
RUN cat > /root/.bashrc << 'BASHRC'
# Auto-attach tmux on SSH login.
if [[ -n "${SSH_CONNECTION:-}" && -z "${TMUX:-}" ]]; then
    exec tmux new-session -A -s main
fi

# Default to repo root.
cd /repo 2>/dev/null || true

# Lean aliases
alias lean='cd /repo/proof/RelationalHyperverse'
alias build='cd /repo/proof/RelationalHyperverse && lake build'
alias cache='cd /repo/proof/RelationalHyperverse && lake exe cache get'
alias math='cd /repo/math'
BASHRC

# ── Working directory ─────────────────────────────────────────────────────────
WORKDIR /repo

# ── Entrypoint ────────────────────────────────────────────────────────────────
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
