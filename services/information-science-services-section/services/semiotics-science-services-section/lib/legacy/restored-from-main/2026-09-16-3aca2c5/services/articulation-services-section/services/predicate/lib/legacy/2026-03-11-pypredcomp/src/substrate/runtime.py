"""Runtime — state machine + asyncio heartbeat + HTTP server lifecycle.

States per ``specs/kernel/runtime-state.md``::

    cold → initializing → ready → degraded → draining → stopped

Entry point: ``python -m substrate.runtime``.
"""

from __future__ import annotations

import asyncio
import logging
import os
import signal
import sys
import time
from enum import Enum
from pathlib import Path
from typing import Any

from init_boot.boot import BootContext, boot

log = logging.getLogger("substrate.runtime")


class RuntimeState(str, Enum):
    COLD = "cold"
    INITIALIZING = "initializing"
    READY = "ready"
    DEGRADED = "degraded"
    DRAINING = "draining"
    STOPPED = "stopped"


class Runtime:
    """The substrate runtime singleton (per process)."""

    def __init__(
        self,
        *,
        root: str | Path,
        node_id: str,
        host: str = "0.0.0.0",
        port: int = 5000,
    ):
        self.root = Path(root)
        self.node_id = node_id
        self.host = host
        self.port = port
        self.state: RuntimeState = RuntimeState.COLD
        self.boot_context: BootContext | None = None
        self.active_rule_ids: list[str] = []
        self.event_subscribers: list[asyncio.Queue[dict[str, Any]]] = []
        self.heartbeat_count: int = 0
        self.last_heartbeat_ns: int = 0
        self._heartbeat_task: asyncio.Task | None = None
        self._stop = asyncio.Event()

    # --- lifecycle --------------------------------------------------------

    def boot(self) -> BootContext:
        self.state = RuntimeState.INITIALIZING
        log.info("substrate %s booting on %s:%d (node=%s)", self.root, self.host, self.port, self.node_id)
        ctx = boot(root=self.root, node_id=self.node_id, host=self.host, port=self.port)
        self.boot_context = ctx
        if ctx.failed_phase:
            self.state = RuntimeState.DEGRADED
            log.error("boot degraded at phase %s", ctx.failed_phase)
        else:
            self.state = RuntimeState.READY
            log.info("substrate ready")
        # Discover any pre-loaded rules.
        rules_root = self.root / "rules"
        if rules_root.exists():
            self.active_rule_ids = [
                p.stem
                for p in sorted(rules_root.rglob("*.json"))
            ]
            log.info("activated %d rules", len(self.active_rule_ids))
        return ctx

    async def heartbeat_loop(self, interval_s: float = 1.0) -> None:
        """Asyncio heartbeat — ticks every ``interval_s`` seconds.

        Per ``specs/kernel/runtime-cycles.md`` §3 — the heartbeat is the
        scheduler. At v0.1 it just records aliveness; future versions run
        scheduled rules / federation pulls here.
        """
        while not self._stop.is_set():
            self.heartbeat_count += 1
            self.last_heartbeat_ns = time.time_ns()
            try:
                await asyncio.wait_for(self._stop.wait(), timeout=interval_s)
                break  # _stop set
            except TimeoutError:
                continue

    def subscribe(self) -> asyncio.Queue[dict[str, Any]]:
        q: asyncio.Queue[dict[str, Any]] = asyncio.Queue(maxsize=256)
        self.event_subscribers.append(q)
        return q

    def unsubscribe(self, q: asyncio.Queue[dict[str, Any]]) -> None:
        try:
            self.event_subscribers.remove(q)
        except ValueError:
            pass

    async def publish_event(self, event: dict[str, Any]) -> None:
        for q in list(self.event_subscribers):
            try:
                q.put_nowait(event)
            except asyncio.QueueFull:
                pass

    # --- shutdown ---------------------------------------------------------

    async def shutdown(self) -> None:
        if self.state in (RuntimeState.STOPPED, RuntimeState.DRAINING):
            return
        self.state = RuntimeState.DRAINING
        self._stop.set()
        if self._heartbeat_task:
            with contextlib_suppress(asyncio.CancelledError):
                await self._heartbeat_task
        self.state = RuntimeState.STOPPED

    # --- state introspection ---------------------------------------------

    def state_summary(self) -> dict[str, Any]:
        ctx = self.boot_context
        return {
            "state": self.state.value,
            "node_id": self.node_id,
            "host": self.host,
            "port": self.port,
            "root": str(self.root),
            "active_rule_ids": self.active_rule_ids,
            "heartbeat_count": self.heartbeat_count,
            "last_heartbeat_ns": self.last_heartbeat_ns,
            "log_height": ctx.event_log.height() if ctx else 0,
            "log_tail_id": ctx.event_log.tail_id if ctx else None,
            "boot_phases": ctx.phase_log if ctx else [],
            "self_test": ctx.self_test.to_dict() if ctx and ctx.self_test else None,
            "boot_failed_phase": ctx.failed_phase if ctx else None,
        }


import contextlib


def contextlib_suppress(*excs):
    return contextlib.suppress(*excs)


# ---------------------------------------------------------------------------
# main entry point
# ---------------------------------------------------------------------------


def _build_runtime_from_env() -> Runtime:
    root = os.environ.get("SUBSTRATE_ROOT") or str(Path(os.environ.get("REPL_HOME", os.getcwd())) / ".substrate-root")
    node_id = os.environ.get("SUBSTRATE_NODE_ID", "rsc-quiescent.replit")
    host = os.environ.get("SUBSTRATE_HOST", "0.0.0.0")
    port = int(os.environ.get("SUBSTRATE_PORT", "5000"))
    return Runtime(root=root, node_id=node_id, host=host, port=port)


def main() -> int:
    logging.basicConfig(
        level=os.environ.get("SUBSTRATE_LOG_LEVEL", "INFO"),
        format="%(asctime)s %(name)s [%(levelname)s] %(message)s",
    )
    runtime = _build_runtime_from_env()
    runtime.boot()

    # Hand off to FastAPI / uvicorn. Importing here avoids circular imports
    # on package init.
    from network.http_server import build_app
    import uvicorn

    app = build_app(runtime)
    config = uvicorn.Config(
        app,
        host=runtime.host,
        port=runtime.port,
        log_level=os.environ.get("UVICORN_LOG_LEVEL", "info"),
        access_log=False,
    )
    server = uvicorn.Server(config)

    async def _runner():
        runtime._heartbeat_task = asyncio.create_task(runtime.heartbeat_loop())
        try:
            await server.serve()
        finally:
            await runtime.shutdown()

    try:
        asyncio.run(_runner())
    except KeyboardInterrupt:
        pass
    return 0


if __name__ == "__main__":
    sys.exit(main())
