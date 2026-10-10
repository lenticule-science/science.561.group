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


## What the Leader reported on the Windows side (added 2026-10-10)

The Leader's reports of 2026-08-26 to 2026-10-09 (listed in the operations note `2026-10-10-note-on-what-the-leader-reported-of-the-laptop-under-agent-load.md`) add Windows-side effects to this model, each a symptom of the host's shared resources being drained by the VM and its processes:

- Constant heat and load with only a browser, a shell and an editor open (`ni:///sha-256;K-7SW029wjPdkbpKgo_3r8Ocdlg5nHiYHOBhl2X_rIc`).
- Slow shell commands, Edge tabs that do not load, a mouse that does not move smoothly, applications that do not start, browser crashes, and delayed delivery of messages to an agent session (`ni:///sha-256;Yv3lvM2jb9xSzCTyRgn6Jcfh-57UpH8U3Cd2tTxi7TQ`, `ni:///sha-256;YGnn9GUsDr_6ORxGtGNU_h78JwSJ8ltrO6AqaQNGYOI`, `ni:///sha-256;LSUH-lIPhv6PeloxK5tSHY4jMzg0o7RcoLrCv868PmU`, `ni:///sha-256;m8yA4_2D_c5ZuqaGxQGGNjzFoXMIuY_vN1WtMwhx8_Y`).
- A crash that also took down the router and modem (`ni:///sha-256;cmYWuoat9pdVmaXkXtwm68h2SSSoBuKnT3rYHMiZZ3U`). Resource 3 above (virtual NIC segment offload stalling the host's Wi-Fi transmit path) is one candidate path; no measurement connects it to the router and modem restart.
- A Windows foreground application choking on swap while WSL runs, and the question whether swap on Windows can be disabled (`ni:///sha-256;nVEr3zR_axjFA60LTMivECQdGIn1Dub99T1pIsTX3T4`, `ni:///sha-256;rs9SUTRrbhasDm4f2LC4Cjm4xvnFsLn-sg0AukAKCLc`). The theory is that the Windows pagefile and the VM's memory compete for the same RAM and storage path (resource 5), so the foreground application's priority is a host parameter, not a property of WSL.

The failure model treats memory, storage and network and does not measure CPU temperature or Windows-side interactive latency. The requirement `agent-use-of-a-host-is-admitted-measured-and-bounded.json` R7, R8 and R11 at computer-engineering holds those measurements.
