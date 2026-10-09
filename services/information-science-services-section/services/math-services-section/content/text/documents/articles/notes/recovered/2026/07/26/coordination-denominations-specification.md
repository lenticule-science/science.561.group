# Technical Specification: Semiotic Denominations, Coordination Cohomology, and Contractual Primitives in MetroFOAM

This document establishes the precise mathematical formulations, dimensional units, and exact fractional representations of the transactional and physical primitives of the **Union of Harmonious Colonies**. It serves as a rigorous, coordinate-free, and machine-validated reference for agentic cells when authorizing, pricing, and settling boundary-crossing contracts.

---

## 1. Epistemic Primitives: The WIT (Witnessed Epistemic Distinction)

The **wit** ($w$) is the irreducible unit of witnessed change and the clock tick of Union time [6, 369]. It is defined strictly as a single cover-transition in the paraconsistent Belnap $\mathbf{FOUR}$ knowledge order ($\le_k$) for a typed grounded predication [6, 369].

### 1.1 The Algebraic Structure of FOUR
Each predication cell is evaluated pointwise under the interlaced bilattice $\mathbf{FOUR}$, defined by two independent Boolean coordinates representing positive and negative evidence:
$$\text{Cell} = \langle e_+, e_- \rangle \in \mathbf{FOUR}$$
where $e_+, e_- \in \{0, 1\}$ represent `positiveEvidence` and `negativeEvidence` [6, 62, 369, 520]. The four core values are:
*   $\bot = \langle 0, 0 \rangle$ (absurd / told nothing / knowledge bottom) [6, 62, 93, 369]
*   $\mathbf{t} = \langle 1, 0 \rangle$ (potential / true only) [6, 62, 93, 369]
*   $\mathbf{f} = \langle 0, 1 \rangle$ (active / false only) [6, 62, 93, 369]
*   $\top = \langle 1, 1 \rangle$ (stable / told both / knowledge top / contradiction) [6, 62, 93, 369]

### 1.2 The Quantum of Time
One **wit** is the exact transition that flips a single evidence bit from $0 \to 1$ in the knowledge order $\le_k$ [6, 369]. There are exactly four allowed single-wit transitions:
1.  $\langle 0, 0 \rangle \to \langle 1, 0 \rangle$ (uncontested positive / potential $\to$ potential) [6, 369, 554, 670]
2.  $\langle 0, 0 \rangle \to \langle 0, 1 \rangle$ (uncontested negative / potential $\to$ stable) [6, 369, 554, 670]
3.  $\langle 1, 0 \rangle \to \langle 1, 1 \rangle$ (contradiction-minting / active $\to$ absurd) [6, 369, 554, 670]
4.  $\langle 0, 1 \rangle \to \langle 1, 1 \rangle$ (contradiction-minting / stable $\to$ absurd) [6, 369, 554, 670]

### 1.3 Properties and Constraints
*   **Non-Fungible, Untokenized:** The wit is **not** an ERC-20 token and **not** a bearer asset [6, 34, 369]. It is irreducibly typed by its unsaturated predicate and grounding parameters [34].
*   **Monotonicity of Time:** The arrow of time is defined by the strict monotonicity of the knowledge order ($\le_k$) [5, 355]. Because corrections *add* negative evidence rather than deleting positive evidence, the knowledge height only accumulates and never retracts:
    $$v_1 \le_k v_2 \implies \text{kHeight}(v_1) \le \text{kHeight}(v_2)$$
    where $\text{kHeight}$ maps $\bot \mapsto 0$, $\{\mathbf{t}, \mathbf{f}\} \mapsto 1$, and $\top \mapsto 2$ [96, 105, 556, 717].
*   **The Contradiction Invariant:** Collapsing $\top = \langle 1, 1 \rangle$ to a Boolean is forbidden on-chain, as doing so would erase a paid-for witnessed distinction, effectively destroying time [6, 369, 554]. The on-chain consensus profile (`FourMixConsensusProfile.sol`) enforces the preservation of both explicit evidence coordinates [6, 369, 554].
*   **Counting Functor:** A counting functor $\mu(w) = 1$ may assign every atomic wit a unit weight, providing a scalar common denominator for cost auditing across disparate semantic contexts [34].

---

## 2. Seam Primitives: The TALLY

The **tally** ($T$) is the border-reconciled form of the wit, minted when a witnessed epistemic distinction crosses a sovereign membrane [532].

### 2.1 The Bilateral Receipt Contract
A tally is not a single-sided claim stored in a local database [1230]. It is structurally defined as a **matched pair** of counterparty receipts:
$$\text{Tally} = \langle \text{Receipt}_{\text{release}}, \text{Receipt}_{\text{admission}} \rangle$$
where both parties' independent, signed receipts must agree exactly on [43, 464, 564]:
1.  The specific RMN-CBOR case identifier [43, 464, 564];
2.  The exact resources, payment assets, and quantities traded [43, 464, 564];
3.  The content digests of the input and output work products [43, 464, 564].

### 2.2 The Thiol-Disulfide Analogy (Physical Carrier)
In the vitrimer phase-separation model, the wit/tally distinction maps exactly to macromolecular sulfur chemistry [455, 464, 467]:
*   **The Thiol ($RSH$):** Represents a **wit**—one unmatched, free, low-potential commitment held in the reduced, private interior of a voxel workspace ($E_h \approx -240\ \text{mV}$) [455, 463, 464]. Inside the voxel, up to three wits can be combined or reorganized without external consensus [6, 35].
*   **The Disulfide ($RSSR$):** Represents a **tally**—the border-reconciled form [464, 467]. To cross the oxidizing boundary membrane ($E_h \approx -180\ \text{mV}$) to the exterior, two free thiols (wits) from the counterparties must undergo a two-electron oxidation step to form a covalent disulfide crosslink (tally) [455, 463, 464].
$$\text{2 RSH (Wits)} \xrightarrow{\text{Oxidation}} \text{RSSR (Tally)} + 2\text{H}^+ + 2\text{e}^-$$
Thus, **exactly two wits are required to mint one tally** [464].

---

## 3. The Gas of the EVM Appchain: Coordination Cohomology

Gas on the Union’s L2 appchain (`eip155:5615610`) is **not** economic value; it is the physical and computational cost of long-range topological coordination [13, 14, 300, 341]. 

### 3.1 The Cohomological Definition of Gas
Each cross-colony settlement transaction glues two local sections of a federated cover $\mathcal{U}$ into a single section [14, 341, 374]. The coordination cost of this gluing is candidate-identified with the **first Čech cohomology rank $\check{H}^1(N(\mathcal{U}))$ of the cover nerve**—measuring the independent cycles of disagreement that cannot be resolved monotonically and require a leader [13, 14, 341, 374, 522].
$$\text{Gas} \propto \text{rank}\check{H}^1(N(\mathcal{U})) = |E| - |V| + |C|$$
where [13, 64, 373]:
*   $|E|$ is the number of **cells** (edges in the 1-skeleton of the nerve, representing overlapping local claims) [13, 64, 373];
*   $|V|$ is the number of **entities** (vertices, representing the participating nodes/vocabularies) [13, 64, 373];
*   $|C|$ is the number of **connected components** in the cover nerve [13, 64, 373].

### 3.2 The Landauer Identity
By the house standard proved in `LandauerEntropy.lean`, the coordination cycle rank is definitionally equivalent to the **Landauer entropy in bits**:
$$\text{landauerBits}(N) \triangleq \text{rank}\check{H}^1(N(\mathcal{U}))$$ [13, 314, 522, 530]
By Landauer's principle, erasing one bit of information in a system at temperature $T$ dissipates at least $k_B T \ln 2$ of heat [13, 14, 341, 444]. Thus, resolving $b_1$ independent cycles of disagreement in a non-forest cover nerve requires the irreversible erasure of alternative histories, costing exactly $b_1$ bits of erasure energy [13, 14, 341, 444]:
$$\text{Erasure Cost} \ge \check{H}^1\text{-rank} \cdot k_B T \ln 2$$ [444, 531]

### 3.3 The Gas Price Rules
When writing contract methods:
1.  **Acyclic / Forest Merges ($\check{H}^1 = 0$):** If the cover nerve of the overlapping claims forms a connected tree or forest, the local sections glue uniquely and without obstruction [13, 66, 362]. These transactions are **coordination-free** and consume **zero coordinate gas** [13, 14, 341, 374].
2.  **Cyclic Merges ($\check{H}^1 > 0$):** If the transaction introduces cyclic overlaps, it forces a coordination loop [14, 374]. The gas charge is computed directly from the Betti number $b_1 = |E| - |V| + |C|$ [14, 374]. The contract must charge gas proportional to the number of independent cycles the merge is forced to erase [14, 374].

### 3.4 The Discrete Index Balance Theorem
The conservation of the ledger's index is governed by the discrete index theorem proved in `AntiLandauerEntropy.lean` [55, 413, 521, 655]:
$$\check{H}^0 - \check{H}^1 = \chi$$
where:
*   $\check{H}^0$ is the **anti-Landauer entropy** (consensus charge, $\dim\ker\Delta = |C|$), counting the global-section modes that are preserved losslessly [55, 64, 522, 654].
*   $\check{H}^1$ is the **Landauer entropy** (contradiction charge, $\dim\operatorname{coker}\Delta = |E| - |V| + |C|$), counting the cyclic obstructions [55, 64, 522, 660].
*   $\chi$ is the **Euler characteristic** of the cover nerve ($|V| - |E|$) [55, 522, 658].

This index is conserved under all allowed finite transitions [657, 658]. If a contract's transition preserves $\chi$, any creation of $d$ units of contradiction (gas-consuming cycles) mathematically forces the simultaneous creation of $d$ units of consensus (H⁰ global sections) [561, 657, 663].

---

## 4. Rational and Kinetic Denominations

To prevent precision loss from binary floating-point or integer-only truncation, all prices, yields, and allocation ratios in the Union MUST be represented as **exact fractions** [1000, 1215].

### 4.1 The Fractional Type Schema
```json
{
  "type": "object",
  "required": ["numerator", "denominator"],
  "additionalProperties": false,
  "properties": {
    "numerator": { "type": "integer" },
    "denominator": { "type": "integer", "minimum": 1 }
  }
}
```

### 4.2 The stageTemperature Formula
The temperature of an potential execution stage is an observable rational computed directly from the ledger receipts [286, 312, 877]. It is defined as the fraction of a stage's total height-graded discharge that is contradiction-minting (opening a new $\top$ both-evidence state) rather than committing (settling toward a fixed point) [286, 312, 877]:
$$\text{stageTemperature} \triangleq \frac{\text{mints}}{\text{flux}}$$ [286, 312, 877]
where:
*   $\text{mints}$ is the number of support cells transitioning from a truth pole ($\mathbf{t}$ or $\mathbf{f}$) to the contradiction state ($\top$) [286, 725, 726].
*   $\text{flux}$ is the total height-graded change over the support cells [286, 726]:
    $$\text{flux} = \text{commitments} + \text{mints} + 2 \cdot \text{jumps}$$ [726]
    where `jumps` represent a direct, single-step transition from $\bot \to \top$, worth 2 units of height-energy [725, 726].

A pure-commitment stage (such as typical deterministic compilation or testing) has $\text{mints} = 0$, forcing $T = 0/n = 0$ [286, 878]. An all-mint collision stage (where contradictory assertions clash) has $T = 1$ [286, 878].

### 4.3 The Deborah Number ($\mathrm{De}$)
The kinetic state of the potential workspace is governed by the dimensionless **Deborah number**, which prevents arbitrary timeouts or fixed retry limits from poisoning the market [508, 635, 1000]:
$$\mathrm{De} \triangleq \frac{\tau_{\text{relax}}}{\tau_{\text{observe}}}$$ [508, 635]
where:
*   $\tau_{\text{relax}}$ is the physical relaxation time of the network's silyl ether vitrimer matrix (derived from the Arrhenius exchange rate $\kappa_{\text{exchange}}(T) = \kappa_0 \exp(-E_a/RT)$) [451, 508].
*   $\tau_{\text{observe}}$ is the observation timescale provided by the purchaser's contract lease [508, 635].

A workspace operates in the living, viscoelastic vegetative window only when $\mathrm{De} \approx 1$ [541, 583]. If $\mathrm{De} \gg 1$, the system is in the frozen-glass failure mode (premature ossification) [541, 583]; if $\mathrm{De} \ll 1$, it is a denatured liquid of uncommitted contradictions [541, 583].

---
