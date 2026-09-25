---
description: A virtual private network is an encrypted, authenticated point-to-point or hub-and-spoke tunnel between known peers, extending a private network path across a public network without anonymizing which peers are communicating.
identity: virtual-private-network
name: Virtual private network
date-created: 2026-09-08
references:
  donenfeld2017:
    authors:
      - Jason A. Donenfeld
    title: "WireGuard: Next Generation Kernel Network Tunnel"
    publication: Proceedings of the Network and Distributed System Security Symposium (NDSS 2017)
    year: 2017
    url: https://www.wireguard.com/papers/wireguard.pdf
---
A virtual private network is an encrypted, authenticated point-to-point or hub-and-spoke tunnel between known peers, extending a private network path across a public network without anonymizing which peers are communicating. WireGuard, specified by Donenfeld, is one realization: each peer's identity is its Curve25519 public key, bound directly to a tunnel source address without a certificate authority, session setup uses a single-round-trip Noise IK handshake, and transport is encrypted with ChaCha20-Poly1305.

A virtual private network differs from an onion service in the property each provides: a virtual private network authenticates and secures a tunnel to a specific known peer, while an onion service anonymizes which parties are communicating in the first place, and the two are not substitutes for each other. It differs from end-to-end message encryption in scope, since a virtual private network secures a network path carrying arbitrary traffic between two endpoints, while end-to-end encryption secures the content of a specific message or session regardless of the network path it travels; see [onion-service](./onion-service.md) and [end-to-end-encryption](./end-to-end-encryption.md).

Because every packet inside a virtual private network tunnel is addressed to exactly the peer configured at the tunnel's other end, an observer who controls one endpoint, or who can compel the operator of a hosted VPN endpoint, still learns the destination of the traffic passing through it, which is the reason Donenfeld's paper states no anonymity property for WireGuard and none should be inferred. A collective offering a virtual private network to its members is offering a private, authenticated network path, not anonymity from the operator itself; anonymity from a party positioned outside that tunnel is what an onion service or a mix-based system provides instead.
