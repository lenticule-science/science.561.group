---
title: "Note on the WSL2 host failure model"
date-created: 2026-10-09
description: "The resources that cross the Windows and Linux boundary of a WSL2 host, how each was measured to fail on Bare Cedar Fog, and the defence each requires."
keywords:
  - wsl2
  - hyper-v
  - swiotlb
  - vsock
  - host-engineering
provenance:
  authors:
    - emsenn
    - claude-opus-5-5
  received-under: lib/emsenn/services/561-group/services/engineering-services-section/lib/agency/skills/realize-research-grounded-engineering-work/SKILL.md
---

A WSL2 host is a Hyper-V virtual machine inside a Windows host. Every failure measured on Bare Cedar Fog so far was a resource that crosses that boundary running out or being misused. Each has a defence on the Linux side, the Windows side, or both, and the defence holds only when both sides are installed together.

The Leader's statements are the requirement: on 2026-10-08, clean up "all our wsl shit to be real proper engineering a real proper package" and "we cannot rely on metroplat being up for the WSL shit to stick"; on 2026-10-09, the WSL virtual disk lags and crashes, and the Defender exclusions were already present. Dates and figures below are from the comments of the files that carry the defences, the Leader's reports, and the host on 2026-10-09.

## The resources and how each fails

1. **Storage bounce buffer (swiotlb).** WSL boots with bounce buffering for every Hyper-V storage transfer. The pool is 64 MB by default. A disk queue of 1267 requests of 252 KB outruns it about five to one under load, and the VM dies with `hv_storvsc ... swiotlb buffer is full` (three crashes, 2026-10-05). The defence has two halves: a larger pool (`kernelCommandLine=swiotlb=131072` in `.wslconfig`, 256 MB) and a queue sized to the pool (64 KB requests, 256 in flight per disk, 16 MB, by udev rule). The Linux half is refused as "Device or resource busy" at boot on every disk the kernel already holds; measured 2026-10-09, the root disk ran at 1267 requests under a rule that claimed 256. A change event after boot succeeds.
2. **Contiguous memory for vsock rings.** Each Windows-to-Linux channel needs a 512 KiB physically contiguous ring (order 7). Fragmented memory leaves none, and every `wsl.exe` or interop call hangs. Orphaned root `Relay` processes pin rings (487 orphans held 1,325 of 1,347 channels on 2026-10-03). The defence is a free-memory floor (`vm.min_free_kbytes`), proactive compaction, and a reaper of orphaned relays that also compacts when fewer than 64 rings are free.
3. **Virtual NIC segment offload.** With TCP segmentation offload on, WSL hands Hyper-V 62 KB segments and uploads stalled the host's Wi-Fi transmit path within 2 s (2026-10-06). The defence is `ethtool -K eth0 tso off gso off` at boot, from `wsl.conf`. Mirrored networking preceded the 2026-10-06 12:26 hard freeze; NAT is stated explicitly.
4. **Core dumps onto the host disk.** A crashed Electron app streamed a 113 GB core onto C: and the VM panicked (2026-10-06). The defence is a plain `core_pattern`, which honours a zero core limit.
5. **Memory and swap through the same storage path.** Swap is a VHDX on C: written through the storage path of item 1. Agents held 4.85 GB of a 6 GB VM plus 740 MB of swap (2026-10-08). The defence is a VM memory cap, low swappiness, and a cgroup for everything WSL launches with a high-water mark, a hard cap, a swap cap, a task cap, lower CPU weight and I/O bandwidth limits.
6. **VM lifetime.** Codex booted WSL, which idled out after 15 s, and the VM cold-booted and tore down its network port dozens of times a day. The defence is `instanceIdleTimeout=-1`.
7. **Real-time scanning of the virtual disk.** Defender scanning the VHDX and the VM processes adds latency to the storage path. The defence is exclusions for the distro folder and the VM processes, which the host already had.

## Consequence for engineering

Defences 1 to 7 are one family: they are the configuration of one host class, and each is useless or harmful alone (a larger pool with an unbounded queue; a queue limit refused at boot). Engineering therefore holds one generic service that renders the family from a parameter record, and operations holds the record for each host.

## Open

Whether the sparse-disk setting, the crash-dump setting and gradual memory reclaim that the 2026-10-06 12:21 configuration carried should return is not derived; the current file omits them.
