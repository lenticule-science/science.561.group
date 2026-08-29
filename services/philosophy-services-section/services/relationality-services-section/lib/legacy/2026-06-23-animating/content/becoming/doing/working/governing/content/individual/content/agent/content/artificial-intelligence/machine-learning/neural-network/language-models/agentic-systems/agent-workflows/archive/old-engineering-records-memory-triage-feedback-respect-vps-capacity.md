---
name: feedback_respect-vps-capacity
description: Don't overwhelm the VPS with parallel sessions — 1.6GB RAM can't handle 100+ concurrent claude processes
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

119 concurrent officer sessions killed the $12 VPS (1.6GB RAM, 1 CPU). Each claude process takes ~50-100MB. 119 of them = 6-12GB of RAM demand on a 1.6GB box.

**Why:** The captain's VPS started thrashing and became unresponsive. The "more officers = more throughput" assumption breaks when the hardware can't handle the load.

**How to apply:**
- Check VPS capacity before dispatching: `free -h` to see available RAM
- Set a hard WIP limit based on hardware: current VPS = max 3-5 concurrent sessions
- The auto-dispatch config has wip_limit for exactly this reason — use it
- After VPS upgrade (Hetzner CX32, 8GB): can probably handle 10-15 concurrent
- Batch dispatches should be sequential, not parallel (avoid the ops-graph race condition too)
- The cron heartbeat should check system load before dispatching
