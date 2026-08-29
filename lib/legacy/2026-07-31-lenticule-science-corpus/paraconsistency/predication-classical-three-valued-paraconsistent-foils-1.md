---
type: narrative
discusses: [adjudication, four-bilattice]
---

# Classical, three-valued, and paraconsistent foils for adjudication

Three classes of logical formalism predate the bilattice approach to [adjudication](../concepts/adjudication.md), each handling some of the role's structural pressures but failing on at least one.

**Classical two-valued logic.** Every predication is assigned either true or false. The framework handles neither contradiction nor unknownness: a derivation of $p \wedge \neg p$ from accumulated evidence trivializes the entire inferential structure ($p \wedge \neg p \vdash q$ for every $q$), and a predication with no evidence is treated indistinguishably from one with negative evidence under the closed-world assumption — or has no formal status at all under the open-world assumption. Order of accumulation can also matter when contradictions are silently dropped, defeating the third pressure of distributed accumulation.

**Three-valued logics.** Adding a third value — variously *unknown*, *undefined*, *gap* — handles the second pressure: an uninformed predication has its own designation, distinct from negation. Three-valued logics (Łukasiewicz, Kleene, partial logic) compose well with closure operators and have well-developed inference systems. They do not, however, handle contradiction directly: assigning a value to $p \wedge \neg p$ in a three-valued setting either produces a fourth value implicitly (recovering the bilattice) or trivializes (recovering classical two-valued logic).

**Paraconsistent logics.** The dual move — adding a value for *contradictory* — handles the first pressure: $p \wedge \neg p$ is a designated value that does not propagate trivialization. [@belnap1977]'s original four-valued logic and the dialetheic tradition (Priest) work this way. When the paraconsistent and three-valued moves are made together, the result is a four-valued bilattice: $\{\mathbf{t}, \mathbf{f}, \top, \bot\}$ with two orders, truth and knowledge. The [four-element bilattice](../objects/four-bilattice.md) absorbs both pressures into a single coherent algebraic structure.

The third pressure — distributed accumulation — is handled by the settling and CRDT structure built on top of the bilattice fibers, not by the bilattice algebra alone. The bilattice provides the value space; the settling gives temporal accumulation; the CRDT convergence theorem gives distribution-without-consensus. Together, the four-element bilattice and the predication-settling construction handle all three pressures of adjudication on a single structure.
