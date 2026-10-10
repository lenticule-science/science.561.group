---
title: "Resident Set Size"
description: "The amount of physical memory (RAM) a process is currently using — the portion of its virtual address space that's actually loaded into physical memory."
aliases: [RSS, rss]
date-created: 2026-04-07
---

**Resident set size** (RSS) is the amount of physical memory a process is currently using.
When a program allocates memory, the operating system gives it virtual addresses.
Only some of those virtual pages are loaded into physical RAM at any given moment — that's the resident set.
The rest may be on disk (swapped out) or not yet accessed (allocated but not touched).

RSS matters for systems with limited physical memory.
A process whose RSS exceeds available RAM forces the system to swap other processes to disk, which degrades performance.
If total RSS across all processes exceeds RAM plus swap, the kernel's out-of-memory killer terminates processes.

On Linux, RSS is reported in `/proc/[pid]/status` as `VmRSS` and by tools like `top`, `ps`, and `htop`.
In Node.js, `process.memoryUsage().rss` returns RSS in bytes.
