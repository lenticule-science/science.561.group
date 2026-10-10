"""WebSocket — fiber subscription endpoint at ``/ws``.

Each connected client receives a stream of events as they are published by
the runtime. v0.1 sends event metadata only; clients fetch full cell
records via the content-addressed HTTP endpoints.
"""

from __future__ import annotations

import asyncio
import logging

from fastapi import FastAPI, WebSocket, WebSocketDisconnect
from starlette.websockets import WebSocketState

from substrate.canonicalization import canonical_str
from substrate.runtime import Runtime

log = logging.getLogger("substrate.websocket")


def attach_websocket(app: FastAPI, runtime: Runtime) -> None:
    @app.websocket("/ws")
    async def websocket_endpoint(websocket: WebSocket) -> None:
        await websocket.accept()
        queue = runtime.subscribe()
        try:
            await websocket.send_text(
                canonical_str({
                    "kind": "hello",
                    "node_id": runtime.node_id,
                    "state": runtime.state.value,
                })
            )
            while True:
                try:
                    event = await asyncio.wait_for(queue.get(), timeout=15.0)
                    await websocket.send_text(canonical_str(event))
                except TimeoutError:
                    if websocket.client_state != WebSocketState.CONNECTED:
                        break
                    await websocket.send_text(canonical_str({"kind": "ping"}))
        except WebSocketDisconnect:
            log.debug("websocket client disconnected")
        except (ConnectionResetError, RuntimeError) as e:
            log.warning("websocket transport error: %s", e)
        finally:
            runtime.unsubscribe(queue)
