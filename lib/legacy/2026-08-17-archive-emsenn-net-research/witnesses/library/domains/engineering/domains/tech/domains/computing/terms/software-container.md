---
name: "software container"
aliases:
  - container (computing)
  - Docker container
  - OCI container
date-created: 2026-04-03
description: "An OS-level virtualization unit that packages an application with its dependencies into an isolated, portable runtime environment."
see-also:
  - "../../../../../../terms/container.md"
---

A **software container** is a unit of OS-level virtualization that packages an application together with its dependencies — libraries, runtime, configuration — into an isolated environment that runs on a shared operating system kernel. Unlike a virtual machine, which virtualizes an entire computer (hardware, OS kernel, and all), a container shares the host OS kernel and virtualizes only the userspace.

The practical consequence: containers start in milliseconds (no OS boot), use minimal overhead (no duplicate kernel), and are portable — a container built on one Linux machine runs on any other Linux machine with a compatible container runtime.

**Docker** (2013–present) popularized containers by making them easy to build, distribute, and run. A Dockerfile describes how to build a container image (base OS, installed packages, application code, configuration). The image is immutable — once built, it runs identically everywhere. The **Open Container Initiative** (OCI, 2015) standardized the image format and runtime interface, so containers are no longer Docker-specific.

Container images are typically 8 MB (Alpine Linux base) to several hundred MB (Ubuntu base with application dependencies). They are layered — each instruction in the build file creates a layer, and layers are cached and shared between images.

Containers relate to the general concept of a [container](../../../../../../humanities/domains/philosophy/terms/container.md) — something with an inside, an outside, and a boundary. A software container's boundary is enforced by the Linux kernel through namespaces (isolating process IDs, network, filesystem, users) and cgroups (limiting CPU, memory, I/O). The boundary is neither rigid nor physical — it is a kernel-enforced policy.

Containers are the standard unit of deployment for modern server software. They solve the "works on my machine" problem by ensuring the development and production environments are identical. They also enable density — a single server can run dozens or hundreds of containers, each isolated, each using only the resources it needs.
