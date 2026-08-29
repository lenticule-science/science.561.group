---
id: patch-adjoint-restriction
name: PatchAdjointRestriction
description: "the four-adjoint chain of the relational universe restricts cleanly to patches, enabling a local-to-global proof of recursive ambidexterity from patch-level data."
---

### Conjecture — Patch Adjoint Restriction {#patch-adjoint-restriction}

#### Setup {#par-setup}

The relational universe carries a four-adjoint chain involving the global operations:
restriction, extension, saturation, and transfer. This chain is the algebraic spine
of the universe — the structure that allows moving between local and global
information.

Patches (§patch) are the local data from which a relational universe is reconstructed
(§patch-reconstruction). The global theory is built from compatible patch data, and
the sheaf condition (§history-site, §locality) governs when local-to-global passage
is valid.

Recursive ambidexterity (§recursive-ambidexterity) states that $U_{\mathcal{H}}$
is simultaneously a left and right adjoint at the hyperverse level — an
$\infty$-categorical ambidexterity whose proof requires the Beck-Chevalley tower to
hold at the $\infty$-level.

#### The Conjecture {#par-conjecture}

**Conjecture (Patch Adjoint Restriction).** The four-adjoint chain of the relational
universe restricts to patches in the following sense: for each patch $P$ (a
compatible local datum), there is a four-adjoint chain on $P$ alone, and the
restriction from the global chain to the patch chain is natural — compatible with
the assembly maps that reconstruct the global universe from patches.

More precisely:

1. Each adjoint in the global chain has a well-defined restriction to any patch.
2. The restricted adjoints on a patch satisfy the same adjunction identities as the
   global adjoints.
3. The assembly map from compatible patch chains to the global chain is an
   equivalence — the global adjoint chain is the limit of the patch adjoint chains.

#### Why This Enables Local-to-Global {#par-local-global}

Recursive ambidexterity requires that $U_{\mathcal{H}}$ be both a left and a right
adjoint. The $\infty$-categorical proof requires a Beck-Chevalley condition at every
level of the tower — a condition that says the adjoint chain commutes with the
tower's reindexing maps.

If the adjoint chain restricts to patches and the patch-level Beck-Chevalley
condition holds, the global Beck-Chevalley condition follows by the sheaf condition:
a condition that holds on each patch and is compatible across patches holds globally.

The patch adjoint restriction converts the global recursive ambidexterity problem
into a local one — verifiable patch by patch — and assembles the local verifications
into the global result.

#### Connection to the Restriction-Extension Dyad {#par-dyad}

The restriction-extension dyad (§restriction-extension-dyad) is the simplest version
of adjoint restriction to patches: the restriction and extension maps between global
and local data. If the conjecture holds, this dyad is the shadow of the full
four-adjoint restriction — the restriction-extension pair is the first two adjoints
in the four-adjoint chain, and all four restrict.

#### What Remains to Prove {#par-open}

- **Well-definedness**: that restriction of each global adjoint to a patch is
  well-defined — that it preserves the fiber algebra structure on the patch.
- **Adjunction identities on patches**: that the unit and counit of each adjunction
  restrict correctly and satisfy the triangle identities on patch data.
- **Assembly equivalence**: that the limit of patch adjoint chains recovers the
  global chain — this is the most substantial claim, requiring the sheaf condition
  in its full force.
- **Application to recursive ambidexterity**: the derivation of the $\infty$-level
  Beck-Chevalley condition from the patch-level version.
