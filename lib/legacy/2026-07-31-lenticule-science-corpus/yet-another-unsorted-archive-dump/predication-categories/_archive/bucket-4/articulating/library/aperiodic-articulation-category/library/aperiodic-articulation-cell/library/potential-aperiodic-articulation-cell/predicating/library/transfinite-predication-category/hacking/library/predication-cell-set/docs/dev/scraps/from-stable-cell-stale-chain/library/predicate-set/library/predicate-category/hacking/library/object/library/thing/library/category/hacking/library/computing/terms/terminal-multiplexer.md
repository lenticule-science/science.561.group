---
title: "terminal multiplexer"
aliases:
  - tmux
  - screen
  - terminal mux
date-created: 2026-04-03
description: "Software that allows multiple terminal sessions within a single connection, with the ability to detach and reattach — enabling persistent remote work."
---

A **terminal multiplexer** is a program that manages multiple terminal sessions inside a single terminal connection. The two widely used implementations are **tmux** (2007–present, BSD license) and **GNU Screen** (1987–present, GPL).

A terminal multiplexer provides three capabilities that a raw terminal does not:

**Session persistence.** A session continues running on the server after the client disconnects. The user can reconnect later — from the same machine or a different one — and find the session exactly as they left it. All running processes, open files, and terminal output are preserved. Sessions survive network interruptions, client reboots, and switching between devices.

**Window management.** Multiple independent terminal windows run within a single session. The user can split the terminal into panes (side by side or stacked), switch between full-screen windows, and organize related work into named sessions. This provides a workspace-like experience within a text terminal.

**Sharing.** Multiple users can attach to the same session simultaneously, seeing the same output and able to type commands. This enables pair programming and live collaboration over SSH.

The persistence capability is the primary reason terminal multiplexers remain essential infrastructure. Any work done over SSH — development, system administration, long-running computations — benefits from session persistence. Without a multiplexer, an SSH disconnection kills all running processes. With one, disconnection is a non-event.

The standard pattern for remote development is: SSH into server, start or reattach a tmux session, work within the session. The session persists indefinitely (until explicitly terminated or the server reboots). This pattern predates cloud development environments by decades and remains the lowest-overhead way to maintain a persistent remote workspace.
