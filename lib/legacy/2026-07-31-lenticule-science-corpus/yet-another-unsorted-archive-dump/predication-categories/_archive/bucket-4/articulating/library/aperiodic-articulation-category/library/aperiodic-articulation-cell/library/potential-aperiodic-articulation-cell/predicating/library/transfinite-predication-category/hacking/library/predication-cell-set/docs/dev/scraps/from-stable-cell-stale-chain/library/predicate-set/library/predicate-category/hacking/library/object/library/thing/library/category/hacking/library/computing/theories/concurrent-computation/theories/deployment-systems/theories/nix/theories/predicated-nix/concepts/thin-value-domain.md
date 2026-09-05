---
type: concept
class: value-domain-mismatch
status: draft
depends-on:
  - ../../teaching/explanations/store-path.md
  - ../../../../../../predicated-computing/concepts/predication-substrate.md
see-also:
  - derivation-as-cell-shape.md
  - scott-continuous-closure-rule-system.md
---

# Thin value domain

Per the substrate, every predication cell carries a value in $\mathbf{L}^\bowtie$ — the twist product of a residuated lattice $\mathbf{L}$ with itself, giving a *bilattice* with two orders: a [knowledge order](../../../../../../predicated-computing/concepts/predication-substrate.md) $\leq_k$ (information accumulates) and a *truth order* $\leq_t$ (positive vs. negative evidence). The canonical four-element instance has values $\mathbf{t}$ (told-true), $\mathbf{f}$ (told-false), $\bot$ (told-nothing), $\top$ (told-both); the residuated structure adds a *fusion product* $\cdot$ and a *residual* $\to$ for compositional reasoning about evidence.

Nix's value-domain at a [store path](../../teaching/explanations/store-path.md) cell is, pragmatically, a thin partial order — something close to:

$$
\bot \;\leq\; \text{recipe-known} \;\leq\; \text{realized}
$$

with each transition raising in something resembling $\leq_k$ (a path that did not exist may have its recipe materialized as a `.drv`; a path whose recipe is known may have its bytes built and placed). Information accumulates monotonically *within a single GC cycle*; nothing is "retracted" in the substrate's sense (the only retraction operation is GC, which lowers values from `realized` back to $\bot$ wholesale, not selectively).

What the substrate's value-domain has that Nix's does not:

- **No $\mathbf{f}$ — no told-false.** A failed build is recorded outside the store (in `/nix/var/log/nix/drvs/`) but the path remains $\bot$ from the store's perspective; it is not raised to $\mathbf{f}$. The substrate's discipline of recording denial-evidence at the cell — *"this predication does not hold, and here is the witness"* — has no Nix counterpart.
- **No $\top$ — no told-both.** The substrate's commitment that two sources of the same predication that disagree raise the cell to $\top$ for repair (per the substrate's `repair.md` discipline, which I have not read here but cited in passing) has no Nix counterpart. If two builders produce different outputs for the same input-addressed derivation, Nix raises a hash-mismatch error — it does not record the contention as $\top$ to be repaired by an in-substrate operator. Disagreement is an exception, not a value.
- **No truth order at all.** With no $\mathbf{f}$, there is no $\leq_t$ axis. The substrate's negation operator (per `negation.md`, again not directly read), which is monotone in $\leq_k$ and antitone in $\leq_t$, has no Nix counterpart.
- **No fusion product, no residual.** The substrate's residuated-lattice operations $\cdot$ and $\to$ — used in the substrate for compositional reasoning about how evidence combines and how restrictions interact — have no Nix counterparts. Nix has no operation that combines two store-path values via anything other than "is it present or not."

What follows from this:

- The substrate's paraconsistent reasoning (per the structural-lineage from Belnap-Ginsberg-Fitting in [structural-lineage-from-codd-to-predicated-computing](../../../../../../predicated-computing/narratives/structural-lineage-from-codd-to-predicated-computing.md)) does not apply to Nix. Nix has no way to record "two sources disagree about whether this output bytes are correct" as a substrate-level fact; such disagreements are runtime errors handled outside the value-domain.
- Federation across substrates that disagree (the substrate's bilattice-fixpoint federation discipline) cannot be implemented in Nix's value-domain. Binary caches federate by hash equivalence, not by value-merge across an evidence lattice. Two caches asserting the same hash means the same bytes; two caches asserting different bytes for the same input-addressed path is, again, an error rather than a $\top$-cell.
- The substrate's witness chain (per [hash-discipline](../../../../../../predicated-computing/concepts/hash-discipline.md)), which records before-hashes and after-hashes of operator invocations, has no Nix counterpart at the value-domain layer. Nix records what bytes are present, not the evidence trajectory by which they came to be present.

The thinness is not a flaw of Nix as Nix; Nix was designed for build-system reproducibility, not for paraconsistent multi-source reasoning, and the thin value-domain is sufficient for that purpose. The thinness is, however, the structural reason Nix does *not* implement most of the substrate's apparatus and cannot be lifted into it without enriching the value-domain — a separate sub-theory's worth of work, and arguably outside Nix's design intent.
