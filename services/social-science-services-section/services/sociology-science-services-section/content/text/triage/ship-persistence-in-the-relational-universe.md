---
id: ship-persistence-in-the-relational-universe
description: "Formal treatment of ship persistence — IMO number as aperiodic fiber, dual certificate as Beck-Chevalley structure, bareboat charter as morphism with identity on T."
type: text
addresses: ship
date-created: 2026-03-29
---

This text gives the formal mathematical treatment of the [ship](../../militarism/terms/ship.md)'s persistence. The ship's four institutional puzzles — IMO number, dual certificate, bareboat charter, actio exercitoria — are four faces of the same underlying structure: the ship's constitutional fiber at the automorphic directed comonad level.

## The ship in the relational universe

The Ship $\mathcal{S} = (H, C, K, F, P)$ maps to the relational universe:

| Ship component | Relational universe |
|---|---|
| $H$ (hull/vessel) | The presheaf $H : T^{\mathrm{op}} \to \mathbf{HA}_{\mathrm{nucl}}$ — the ambient relational state |
| $C$ (charter) | The site topology $J$ on $T$ — what counts as a valid covering of the ship's scope |
| $K$ (captain) | The section $K : \{t^*\} \to H^*_{t^*}$ — the doubly-settled element at the focal history |
| $F$ (flag) | The registration morphism $\phi : T \to T_F$ — the functor mapping the ship's history into the flag state's governance category |
| $P$ (complement) | The family of sections $\{p_r : \{r\} \to H_{t^*}\}_{r \in \mathrm{Roles}(H)}$ — enrollment sections covering all required roles |

The ship's persistence is the presheaf's persistence: the history category $T$, the site $(T, J)$, and the nuclear Heyting doctrine $H$ persist through changes in the sections (crew) and the stepping structure (voyage). The IMO number is the formal name of the presheaf.

## IMO number = history separation at the automorphic directed comonad level

The IMO number is the fiber entry at the ship's founding history: the patch lattice RelationalHistoryFixedFiber at history zero (the moment of construction). Its persistence through all changes is the RelationalHistoryFixedPresheafAutomorphismRigidityAxiom (History Separation) applied to the ship's constitutional presheaf: no nontrivial automorphism of the ship's history category carries the constitutional fixed-fiber to an isomorphic copy.

At the automorphic directed comonad level — a mature, institutionally settled ship — this ceases to be an axiom and becomes a theorem, proved from the aperiodicity of the quasicrystal RelationalHyperversalQuasicrystalHullHistorySeparation: no coordinate permutation of the voyage-history lattice is a symmetry of the ship's quasicrystalline constitutional fiber. Every voyage produces a constitutionally unique fiber signature. The IMO number IS this aperiodic fiber assignment.

| Level | History separation status | Ship reading |
|---|---|---|
| Ground level (new ship) | Axiom — imposed by rigidity axiom | IMO number assigned by declaration; uniqueness stipulated |
| Automorphic directed comonad level (mature ship) | Theorem — derived from quasicrystal aperiodicity | IMO number's uniqueness follows from quasicrystalline constitutional structure |

## Dual certificate = σ-BC/Δ-BC structure

The ISM Code's dual certificate system (DOC to Company, SMC to Ship) is the Beck-Chevalley tower's two-level structure instantiated at sea.

The **σ-Beck-Chevalley condition** (backward-stability: what was certified at previous depth levels remains certified) corresponds to the **DOC**: the Company's safety management system certifies the abstract covering policy — the Grothendieck topology $J$ on the history site. σ-BC holds at every finite depth level (the company's accumulated operational history is backward-coherent).

The **Δ-Beck-Chevalley condition** (forward-stability: what is certified now carries forward to future depths) corresponds to the **SMC**: the Ship's safety certificate certifies that this specific hull-presheaf $H$ over $(T, J)$ will remain valid under future voyage steps. Δ-BC fails at frontier histories — at the current boundary of the ship's certified scope, new extensions are not yet committed. The SMC renewal cycle (every five years with annual verifications) is the defect-mobility mechanism: each verification brings frontier histories into the interior, resolving the Δ-BC gap.

| Certificate | Beck-Chevalley condition | What it certifies | Failure mode |
|---|---|---|---|
| DOC (Company) | σ-BC: backward-stability of covering policy | The topology $J$ — what evidence counts as adequate coverage | Fails if operational history is not downward-closed |
| SMC (Ship) | Δ-BC: forward-stability of hull identity | The presheaf $H$ — that this ship carries its fiber through future voyages | Fails at frontier histories until periodic survey resolves the Δ-defect |

## Bareboat charter = morphism with identity on T

The bareboat charter's total handover (crew, management, DPA, ISM operator all change; IMO number and hull persist) is a morphism of relational universes $(\phi, \alpha)$ where $\phi = \mathrm{id}_T$ (voyage-history structure unchanged — same operational record, same IMO number, same registration) and $\alpha : \mathrm{Doctrine}_{\mathrm{old}} \to \mathrm{Doctrine}_{\mathrm{new}}$ is the natural transformation from the old Company's nuclear doctrine to the new Company's. The ship's constitutional fiber $H$ persists as a presheaf over the same $T$; only the operational interpretation changes with the new DOC. This is owner-pro-hac-vice formalized: same institutional vessel, different operational content.

## Actio exercitoria as universal property

The actio exercitoria (the exercitor bound by all contracts the magister made within the voyage scope) corresponds to the universal property of the captain's command authority as the colimit of the ship's internal authority structure: every morphism from an external normative system into the ship's fiber doctrine at history $t$ must factor uniquely through the captain's authority section $K \in$ RelationalHistoryFixedFiber at $t^*$.

The captain is the unique point through which all authority claims about the ship's operations are mediated. The universal factorization is the formal content of "the exercitor is bound by all contracts within voyage scope" — the voyage scope is the history under the captain's authority, and any contract within it factors through $K$. The universal property holds iff $K$ is a colimit of the authority diagram, requiring $K \in$ RelationalHistoryFixedFiber (doubly-stable, both recognized and forward-inherited) — exactly the installation condition.

## Proposition

The ship $\mathcal{S} = (H, C, K, F, P)$ persists through all changes in complement, operator, and charter because: (1) the IMO number is the aperiodic constitutional fiber at the founding history — no voyage permutation maps it to an isomorphic copy; (2) the DOC/SMC dual certificate maintains σ-BC (backward coverage coherence) and resolves Δ-BC gaps by periodic survey; (3) the bareboat charter is a morphism with identity on $T$, preserving history structure while transforming operational doctrine; (4) the captain's authority $K \in$ RelationalHistoryFixedFiber is the colimit of the internal authority diagram.

*Source.* History separation from Relational Universe Automorphic Directed Comonad History Separation §Theorem for $d \geq 1$. σ-BC/Δ-BC from Beck-Chevalley Tower §Defect Mobility. $\square$
