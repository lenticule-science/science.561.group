---
description: End-to-end encryption is a message-protection design in which content is encrypted by the sender and decrypted only by the intended recipient, such that no intermediate relay or server can read the plaintext in transit.
identity: end-to-end-encryption
name: End-to-end encryption
date-created: 2026-09-08
references:
  koch2024:
    authors:
      - The OpenPGP Working Group
    title: OpenPGP
    publication: RFC 9580
    publisher: IETF
    year: 2024
    url: https://www.rfc-editor.org/rfc/rfc9580.html
  perrinmarlinspike2016:
    authors:
      - Trevor Perrin (ed.)
      - Moxie Marlinspike
    title: The Double Ratchet Algorithm
    publisher: Signal
    year: 2016
    url: https://signal.org/docs/specifications/doubleratchet/
---
End-to-end encryption is a message-protection design in which content is encrypted by the sender and decrypted only by the intended recipient, such that no intermediate relay, server, or service operator holds a key capable of reading the plaintext in transit. OpenPGP (RFC 9580) is one realization: sender and recipient each hold a long-lived key pair, and the sender encrypts a given message directly to the recipient's public key. The Double Ratchet Algorithm, specified by Perrin and Marlinspike for Signal, is a different realization: session keys are derived fresh for each message from a continuously advancing key-derivation chain, seeded by an initial key agreement.

End-to-end encryption differs from transport encryption, such as TLS between a client and a mail server, in where the key is held: transport encryption protects a message only for the hop between two adjacent parties, so a relaying server necessarily sees the plaintext, while end-to-end encryption protects the message for every hop between sender and final recipient at once. A static long-lived key pair, as OpenPGP uses, also differs from a per-message ratcheted key, as the Double Ratchet uses, in the security property each provides: compromise of an OpenPGP private key exposes every message ever encrypted to that key, while compromise of a Double Ratchet session key exposes only messages sent under that specific derived key, before the ratchet advances again.

Choosing end-to-end encryption secures message content against every party except the sender and recipient, but content protection alone does not protect the communication event's metadata, which remains visible to every relay the message traverses. A service designing for a threat model that includes an adversary who can compel or subpoena the service operator, rather than only one who can intercept network traffic, needs a stated retention policy for metadata in addition to a choice of content encryption; see [email-metadata](./email-metadata.md).
