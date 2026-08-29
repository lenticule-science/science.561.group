# ── Math document build ───────────────────────────────────────────────────────

.PHONY: all clean
all: build/relational-hyperverse.md

build/relational-hyperverse.md: math/*.md math/_manifest.yaml math/_00_preamble.yaml
	python src/scripts/build.py

clean:
	rm -f build/relational-hyperverse.md

# ── Dev box ───────────────────────────────────────────────────────────────────
#
# Prerequisites:
#   1. Copy .env.example → .env and fill in SSH_AUTHORIZED_KEYS + tokens.
#   2. Install Tailscale on this machine for remote access (optional for LAN).
#
# Workflow:
#   make up    build image + start container (detached)
#   make ssh   SSH in → lands in tmux
#   make down  stop + remove container

.PHONY: up down ssh exec

## up: build the image and start the container.
up:
	docker compose up -d --build
	@echo ""
	@echo "  Connect:  make ssh   (or: ssh -p 2222 root@localhost)"
	@echo "  Stop:     make down"

## down: stop and remove the container (volumes are preserved).
down:
	docker compose down

## ssh: SSH in and auto-attach to the main tmux session.
ssh:
	ssh -p 2222 \
	    -o StrictHostKeyChecking=no \
	    -o UserKnownHostsFile=/dev/null \
	    -t root@localhost \
	    "tmux new-session -A -s main"

## exec: docker exec shell (fallback if SSH isn't working).
exec:
	docker compose exec dev bash
