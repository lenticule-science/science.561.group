"""Driver base — shared contract for substrate drivers.

A driver is a process that brokers a transport (MCP, HTTP, future) and
calls into the substrate runtime to do work. v0.1 only has the MCP
driver; the base lives here so future drivers (Matrix, ActivityPub, etc.)
have a stable shape.
"""

from __future__ import annotations

from abc import ABC, abstractmethod
from dataclasses import dataclass

from substrate.runtime import Runtime


@dataclass
class DriverContext:
    runtime: Runtime
    name: str


class Driver(ABC):
    name: str

    def __init__(self, runtime: Runtime):
        self.runtime = runtime

    @abstractmethod
    async def serve(self) -> None: ...
