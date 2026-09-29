---
type: narrative
status: current
introduces: []
discusses: [quorum-consensus, leader-election, distributed-lock, federation-convergence, quorum-consensus-safety, quorum-safety-under-partition, consensus-causal-order-via-lorentzian-settling, leader-election-termination-via-no-periodic-orbits]
---

# Cohomology as the coordination substrate

The companion narrative [when-crdt-isnt-enough](when-crdt-isnt-enough.md) explains *which* operations need a coordination protocol and *why* the parent's CRDT discipline does not cover them. This narrative answers the next question: once a coordination protocol is in scope, what is the mathematical object the protocol is building, and what discipline does the substrate inherit by recognizing the object?

The answer this subtheory commits to is: **a coordination protocol is a presentation of a global section of a sheaf on a replica cover, and the protocol's safety, termination, and partition-tolerance properties are cohomological invariants of that sheaf.** This is not a metaphor; the cohomology has been built out in [predication-categories](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md) as [settling cohomology](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cohomology.md) on the [bitopological settling site](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bitopological-settling-site.md), and the coordination protocols this subtheory studies are the substrate-level shadows of constructions in that cohomology.

This narrative names the bridge and traces the consequences across the subtheory's existing theorems.

## The setup: a cluster is a replica cover

A cluster of $N$ substrate-instances participating in a coordination protocol is the engineering surface of a [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md). The replica cover is built as follows.

Fix a triple $(q, \tau, U)$ in the bitopological settling site: a predicate $q$ (the predicate the cluster is reaching agreement *about* — a leadership claim, a lock holder, a value-to-be-decided), a settling stage $\tau$ (the consensus round), and a pairwise-Stone clopen $U$ in the dual paired-Priestley space $X_q^\tau$ (the substrate region the cluster is responsible for). Each cluster member $i \in \{1, \ldots, N\}$ contributes a clopen $U_i \subseteq U$ — the dual-spectrum image of the member's locally observed evidence about the predicate. The pair $\{U_i \to U\}_{i=1}^N$ is the cluster's replica cover of $U$.

This is not a new construction the engineering side has to invent; it is the [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) construction read at the cluster level. The math entity was built for two replicas; an $N$-replica cluster is its straightforward generalization, and the [Čech nerve](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) of the cover is the simplicial object whose 0-cells are members, 1-cells are pairs, 2-cells are triples, and so on.

The substrate region that the protocol is reaching agreement *over* is the union $U = \bigcup_i U_i$. The substrate region the protocol is reaching agreement *about* — the structure that must be coherent across members — is the [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) $\mathcal{F}_U$ restricted to that union.

## The protocol presents a global section

A consensus protocol is a sequence of substrate operations whose terminal state is a single agreed value across the cluster. Cohomologically, this is the construction of an element of $H^0(U, \mathcal{F}_U)$ — a *global section* of the cluster's settling-associated sheaf. The construction is constrained: each member's local sections live in $\mathcal{F}_U(U_i)$, and to glue into a global section they must agree on every overlap $U_i \cap U_j$.

This gives a clean reading of what a protocol's "vote" is. Per [propose-and-vote](../morphisms/propose-and-vote.md), a member's vote is a substrate-recorded section of $\mathcal{F}_U$ over the member's clopen $U_i$. The protocol's *signature discipline* (per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md)) is the substrate-level enforcement that the section is well-defined: a signed vote is a section that cannot be retracted or duplicated, which is the property a sheaf section needs to take part in a coherent gluing.

The *agreement* discipline on overlaps is the no-double-vote rule. When members $i$ and $j$ both vote and their clopens overlap, the agreement-on-overlap condition $s_i|_{U_i \cap U_j} = s_j|_{U_i \cap U_j}$ is the substrate-level requirement that the two members' votes carry the same content on whatever fragment of evidence they share. The protocol's no-double-vote rule is what guarantees this: a member casts at most one vote per consensus instance, so the section it offers is determined by its single vote, and consistency across overlaps is the consistency across members.

## Mayer–Vietoris is the safety theorem

The [replica Mayer–Vietoris sequence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/replica-mayer-vietoris.md) is the long exact sequence

$$\cdots \to H^{n-1}(U_i \cap U_j, \mathcal{F}_U) \xrightarrow{\delta^{n-1}} H^n(U, \mathcal{F}_U) \xrightarrow{\mathrm{res}} H^n(U_i, \mathcal{F}_U) \oplus H^n(U_j, \mathcal{F}_U) \xrightarrow{\mathrm{diff}} H^n(U_i \cap U_j, \mathcal{F}_U) \to \cdots$$

read at degree $n = 0$ and applied to a two-element cover. The piece that matters for consensus safety is the exactness at $H^0(U, \mathcal{F}_U)$:

$$H^{-1}(U_i \cap U_j, \mathcal{F}_U) \xrightarrow{\delta^{-1}} H^0(U, \mathcal{F}_U) \xrightarrow{\mathrm{res}} H^0(U_i, \mathcal{F}_U) \oplus H^0(U_j, \mathcal{F}_U) \xrightarrow{\mathrm{diff}} H^0(U_i \cap U_j, \mathcal{F}_U).$$

Negative-degree cohomology vanishes, so $\delta^{-1} = 0$ and the restriction map is injective. *A global section is determined by its restrictions to the cover.* If member $i$'s local section $s_i$ and member $j$'s local section $s_j$ agree on $U_i \cap U_j$, then $(s_i, s_j) \in \ker(\mathrm{diff})$ and by exactness lifts to a unique global $s \in H^0(U, \mathcal{F}_U)$.

This is exactly the safety property of consensus. Two distinct global sections of $\mathcal{F}_U$ would differ on some restriction; if every member's local restriction is the same, the global section is unique. Per the [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) result, the cellwise $\vee_k$-merge on a connected network sheaf *is* this unique global section.

The platform's [quorum-consensus-safety](../theorems/quorum-consensus-safety.md) and [quorum-safety-under-partition](../theorems/quorum-safety-under-partition.md) theorems are the engineering reflections of this exactness. The pigeonhole argument that two majority quorums must overlap is the substrate-level realization that two candidate global sections must agree on a non-empty intersection of cover elements, which by Mayer–Vietoris injectivity forces them to be the same section. Pigeonhole is the surface; cover-injectivity is the structural reason.

## CALM is the coordination-freeness invariant

The previous section's exactness gives uniqueness when local sections agree. The next question is when local sections *can* be guaranteed to agree without an explicit coordination round. The math entity for this is [cohomological CALM](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/cohomological-calm.md): a settling-associated sheaf is *coordination-free* iff every Mayer–Vietoris connecting homomorphism $\delta^n$ vanishes.

[CRDT convergence via Mayer–Vietoris](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence-via-mayer-vietoris.md) establishes that $\delta^0 = 0$ for the substrate's normal merge discipline. This is the math reason the parent corpus's [federation-convergence](../../../theorems/federation-convergence.md) holds: the connecting homomorphism that would obstruct gluing local CRDT-merged sections into a global section is identically zero, so any compatible family of local sections lifts to the global section automatically. No coordination round is needed because the obstruction class is structurally absent.

This recovers the discriminator from [when-crdt-isnt-enough](when-crdt-isnt-enough.md) on the cohomological side. CRDT-shaped operations have $\delta^0 = 0$; they need no coordination protocol because Mayer–Vietoris does the gluing for free. Non-CRDT operations have $\delta^0 \neq 0$; the coordination protocol is the substrate-level mechanism that supplies the data on $U_i \cap U_j$ that lets the gluing succeed *despite* the non-vanishing obstruction. The protocol's vote-and-witness machinery is the substrate's way of constructing a 0-cocycle by hand when the sheaf's structure does not provide one freely.

## How the platform's existing theorems share this single source

With the cohomological frame in place, the platform's four primary theorems are four projections of the same cohomological object:

- **[quorum-consensus-safety](../theorems/quorum-consensus-safety.md)** is the Mayer–Vietoris injectivity at $H^0$ on the cluster's replica cover. Two decided values would correspond to two non-isomorphic global sections of the same sheaf; injectivity rules this out as long as the no-double-vote rule guarantees overlap-agreement.

- **[quorum-safety-under-partition](../theorems/quorum-safety-under-partition.md)** is what happens when the replica cover degenerates to a disjoint union: $U_i \cap U_j = \emptyset$, the connecting homomorphism is trivially zero on the empty intersection, but the Mayer–Vietoris gluing diagram becomes degenerate — there is no "agreement on overlap" to constrain global decisions. The substrate's quorum-threshold rule is the discipline that re-supplies the agreement constraint by allowing only one side of the partition to claim a section.

- **[consensus-causal-order-via-lorentzian-settling](../theorems/consensus-causal-order-via-lorentzian-settling.md)** is the time-direction layer. Where Mayer–Vietoris assembles sections across the *space* of cluster members, the [Lorentzian causal settling](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/lorentzian-causal-settling.md) assembles them across the *time* of consensus rounds. The two structures interlock: a vote at round $\tau_1$ that causally precedes a vote at round $\tau_2$ contributes to the section at $\tau_2$ via the substrate's settling continuity, and the Lorentzian apex/void cones distinguish the votes that can participate in a common section from the spacelike-separated votes that cannot.

- **[leader-election-termination-via-no-periodic-orbits](../theorems/leader-election-termination-via-no-periodic-orbits.md)** is the iterative-construction layer. Building the global section of $\mathcal{F}_U$ by iterating the cluster's closure-rule system terminates because [the closure 2-monad has no non-trivial periodic orbits](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-monad-no-non-trivial-periodic-orbits.md) — the iteration converges to a fixed point in finite or transfinite time. The fixed point *is* the global section; termination of the protocol is termination of the section's construction.

Read this way, the four theorems are not four independent guarantees that happen to all be true. They are four faces of one structural fact: the cluster's coordination state is a global section of a settling-associated sheaf on a replica cover, and the platform's safety/termination/partition-tolerance properties are what cohomological invariants of that sheaf force.

## What the cohomological frame buys the engineering side

Three concrete affordances follow from carrying the cohomology source explicitly.

**Computation, not just structure.** Per [Husainov acyclicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/husainov-acyclicity.md), Čech cohomology agrees with the derived-functor cohomology on the nose for posets satisfying the Dedekind–MacNeille cut condition. The bitopological settling site of a finite cluster satisfies this condition (finite Alexandrov posets are Husainov-acyclic). Engineering tools that need to *compute* the obstruction to consensus — for example, an audit tool checking whether a recorded set of votes has a coherent global section, or a partition-detection tool checking whether two sub-clusters are spectrally disconnected — can use finite Čech cochain calculations and rely on the result being exact, not approximate.

**Bounded cohomological dimension.** Per [settling cohomology vanishes above degree 1](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-cohomology-vanishes-above-degree-1.md), the sheaf cohomology of the cluster's settling-associated sheaf vanishes for $n \geq 2$ in all explicit corpus instances built from the four predicate generators. The engineering implication is that consensus protocols only ever have to discharge $H^0$ (the global-section construction) and $H^1$ (the obstruction to global-section construction). Higher cohomology classes — which would correspond to obstructions to *gluing the obstructions*, three layers up — do not occur in the substrate's coordination problems. A protocol design that worries about higher-degree obstructions is over-engineered for the substrate's actual cohomological dimension.

**Truth-knowledge separation.** Per [bigraded cohomology via mapping cone](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bigraded-cohomology-via-mapping-cone.md), the substrate's cohomology splits into a truth-graded component and a knowledge-graded component, with the total cohomology a mapping cone of the connecting morphism between them. The engineering reading is that "consensus on a value" decomposes cleanly into "consensus on the truth content" and "consensus on the knowledge content," and the cohomological mapping-cone construction gives the structural recipe for tracking both. Protocols that conflate the two — that ask members to agree on what is *known* about a value as if it were the same as agreement on the *value* — are missing the bigrading that the cohomology naturally exhibits. The [bigraded common knowledge](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bigraded-common-knowledge.md) result spells this out at the modal layer; the bigraded-cohomology entity is the cohomological surface of the same fact.

## Where the boundary is

This narrative commits the platform to the cohomological reading of coordination. The reading is faithful for the four theorems above and the operations they cover; it has limits.

**The boundary with non-coordination work.** The cohomological frame is the right one for operations that *need* a coordination protocol. For operations that don't — the 95% that the parent's CRDT discipline handles — the framing is still correct (CRDT operations are the case where $\delta^0 = 0$ structurally) but the cohomological vocabulary is overhead. The boundary maintenance question is the same one [when-crdt-isnt-enough](when-crdt-isnt-enough.md) raised: which operations belong to which side. That discriminator is unchanged; this narrative just supplies the math reason the discriminator works.

**The boundary with byzantine settings.** The Mayer–Vietoris gluing argument assumes that local sections actually carry the content their issuers claim. In a Byzantine setting, an attacker can produce a *signed* section whose content is adversarial — the section is structurally well-formed but semantically false. The cohomology reading carries through (the sheaf is still well-defined, the global-section construction still terminates), but the global section reached may not be the value any honest member would have voted for. The platform's BFT extensions (per [quorum-consensus](../teaching/explanations/quorum-consensus.md)) handle this with larger quorums and additional verification rounds; cohomologically, the larger quorums correspond to a *finer* replica cover whose Mayer–Vietoris gluing is robust against a bounded fraction of adversarial sections. The full BFT-cohomology connection is open and tracked as a follow-on.

**The boundary with the regime classification.** The settling-cohomology-vanishes-above-degree-1 result holds in the explicit corpus instances and in all four-regime-classified substrates. A coordination protocol designed for a substrate outside the four-regime classification — if such a substrate ever entered the corpus — would not automatically inherit the cohomological-dimension bound. The platform currently has no such substrate; this is a "if the moduli machinery extends, the protocol theory must too" relationship, not a present concern.

## Position

This narrative supplies the math source the platform's existing theorems were already using implicitly. The replica cover, the Mayer–Vietoris exactness, the cohomological-CALM characterization, and the bigraded cohomology are not new commitments; they are the named structural facts the safety, termination, and partition-tolerance theorems quietly relied on. Naming the source explicitly does three things: it unifies the four theorems under one mathematical object rather than four independent arguments, it gives engineering tools (audit, partition detection, view-staleness computation) a basis for finite cohomological calculation rather than approximation, and it draws the boundary with the regimes (BFT, non-classified substrates) where the cohomology has not yet been built out.

The next-shape work this narrative enables is a small set of new theorems that promote the implicit cohomological reading to explicit engineering claims — for example, a `byzantine-cluster-as-finer-replica-cover` theorem stating the BFT extension's quorum size in cohomological terms, or an `audit-via-cech-cocycle-evaluation` theorem giving the audit tool's correctness as a Husainov-acyclicity instance. Those are downstream; this narrative is the connective tissue that makes them statable.
