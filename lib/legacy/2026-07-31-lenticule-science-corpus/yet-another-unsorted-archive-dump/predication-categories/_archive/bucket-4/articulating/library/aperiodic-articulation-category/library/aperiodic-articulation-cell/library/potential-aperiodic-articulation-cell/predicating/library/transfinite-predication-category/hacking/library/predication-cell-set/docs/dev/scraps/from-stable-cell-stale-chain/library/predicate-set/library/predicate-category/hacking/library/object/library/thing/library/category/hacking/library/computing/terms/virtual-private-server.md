---
name: "virtual private server"
aliases:
  - VPS
  - virtual server
date-created: 2026-04-03
description: "A virtual machine rented from a hosting provider, accessed via SSH, with full root control over the operating system."
---

A **virtual private server** (VPS) is a virtual machine running on shared physical hardware, sold as a service by a hosting provider. The customer gets full root access to an isolated operating system instance — typically Linux — and pays a recurring fee based on allocated CPU, memory, and storage.

The "virtual" means the machine is a software partition of a larger physical server, managed by a hypervisor. The "private" means the customer's instance is isolated from other tenants on the same hardware — each VPS has its own filesystem, processes, and network stack. The "server" means it runs continuously and is accessible over the network, typically via [SSH](ssh.md).

VPS hosting emerged in the early 2000s as virtualization technology (Xen, KVM, later OpenStack) made it practical to subdivide physical servers. Before VPS, the options were shared hosting (multiple customers on one OS, no isolation) or dedicated servers (one customer per physical machine, expensive). VPS filled the gap: isolation and root access at shared-hosting prices.

As of 2026, VPS pricing ranges from approximately €4/month for a minimal instance (2 vCPU, 4 GB RAM) to €22/month for a capable development server (8 vCPU, 32 GB RAM), depending on provider. The major differentiators between providers are price-to-performance ratio, geographic datacenter presence, included bandwidth, and availability of managed services (databases, container orchestration) alongside the base VPS.

A VPS is the most common starting point for small organizations running their own software. It provides a full Linux environment without hardware ownership, at predictable cost, with the ability to migrate to another provider or to self-hosted hardware by moving the system configuration and data.
