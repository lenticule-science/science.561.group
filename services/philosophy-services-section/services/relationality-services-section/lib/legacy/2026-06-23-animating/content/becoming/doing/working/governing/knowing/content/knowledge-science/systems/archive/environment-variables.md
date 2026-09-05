---
name: environment variables
description: Environment variables set on cold-red-gate for the polity's substrate operations.
OPENCLAW_STATE_DIR: /home/emsenn/561/.openclaw-state
OPENCLAW_CONFIG_PATH: /home/emsenn/561/.openclaw-state/openclaw.json
---

Setting `OPENCLAW_STATE_DIR` and `OPENCLAW_CONFIG_PATH` keeps OpenClaw state self-contained within the 561 repository checkout, leaving `$HOME/.openclaw` untouched and allowing multiple clones to coexist without interference.
