---
title: "Quantum Proof: Witness, Verification, and Security in the Quantum Theory of Computation"
subtitle: "A graduate-to-research level genealogy and frontier map"
author:
  - "ChatGPT for emsenn"
date: "2026-07-08"
abstract: "“Quantum proof” names a cluster rather than a single settled object. In computational complexity it most centrally means a quantum state that functions as a proof, certificate, or witness for a quantum verifier, as in QMA, the quantum analogue of NP. Around that core are quantum interactive proofs, multi-prover proof systems with entangled provers, quantum zero-knowledge, classical verification of quantum computations, and the cryptographic use of “quantum-proof” to mean secure against quantum adversaries. This paper explains the formal core of the idea, traces its genealogy from NP, interactive proofs, PCPs, and quantum computation through QMA, QIP, and MIP*, and then surveys current frontiers: Hamiltonian complexity, the quantum PCP conjecture, NLTS/qLDPC codes, classical verification and delegation, quantum-secure zero-knowledge, post-quantum proof systems, and the problem of making verification physically meaningful in a world where evidence may itself be an uncopyable quantum state."keywords:
  - quantum-proof
  - qma
  - quantum-witnesses
  - local-hamiltonian
  - quantum-interactive-proofs
  - qip
  - mip
  - quantum-pcp
  - quantum-zero-knowledge
  - post-quantum-cryptography
references:
  - id: cook1971complexity
    type: paper-conference
    author:
      - family: Cook
        given: Stephen A.
    issued:
      date-parts:
        - [1971]
    title: "The complexity of theorem-proving procedures"
    container-title: "Proceedings of the Third Annual ACM Symposium on Theory of Computing"
    page: "151-158"
    DOI: "10.1145/800157.805047"
  - id: levin1973universal
    type: article-journal
    author:
      - family: Levin
        given: Leonid A.
    issued:
      date-parts:
        - [1973]
    title: "Universal sequential search problems"
    container-title: "Problems of Information Transmission"
    volume: "9"
    issue: "3"
    page: "265-266"
  - id: goldwasser1989knowledge
    type: article-journal
    author:
      - family: Goldwasser
        given: Shafi
      - family: Micali
        given: Silvio
      - family: Rackoff
        given: Charles
    issued:
      date-parts:
        - [1989]
    title: "The knowledge complexity of interactive proof systems"
    container-title: "SIAM Journal on Computing"
    volume: "18"
    issue: "1"
    page: "186-208"
    DOI: "10.1137/0218012"
  - id: shamir1992ip
    type: article-journal
    author:
      - family: Shamir
        given: Adi
    issued:
      date-parts:
        - [1992]
    title: "IP = PSPACE"
    container-title: "Journal of the ACM"
    volume: "39"
    issue: "4"
    page: "869-877"
    DOI: "10.1145/146585.146609"
  - id: arora1998proof
    type: article-journal
    author:
      - family: Arora
        given: Sanjeev
      - family: Lund
        given: Carsten
      - family: Motwani
        given: Rajeev
      - family: Sudan
        given: Madhu
      - family: Szegedy
        given: Mario
    issued:
      date-parts:
        - [1998]
    title: "Proof verification and the hardness of approximation problems"
    container-title: "Journal of the ACM"
    volume: "45"
    issue: "3"
    page: "501-555"
    DOI: "10.1145/278298.278306"
  - id: feynman1982simulating
    type: article-journal
    author:
      - family: Feynman
        given: Richard P.
    issued:
      date-parts:
        - [1982]
    title: "Simulating physics with computers"
    container-title: "International Journal of Theoretical Physics"
    volume: "21"
    issue: "6-7"
    page: "467-488"
    DOI: "10.1007/BF02650179"
  - id: deutsch1985quantum
    type: article-journal
    author:
      - family: Deutsch
        given: David
    issued:
      date-parts:
        - [1985]
    title: "Quantum theory, the Church-Turing principle and the universal quantum computer"
    container-title: "Proceedings of the Royal Society of London A"
    volume: "400"
    issue: "1818"
    page: "97-117"
    DOI: "10.1098/rspa.1985.0070"
  - id: bernstein1997quantum
    type: article-journal
    author:
      - family: Bernstein
        given: Ethan
      - family: Vazirani
        given: Umesh
    issued:
      date-parts:
        - [1997]
    title: "Quantum complexity theory"
    container-title: "SIAM Journal on Computing"
    volume: "26"
    issue: "5"
    page: "1411-1473"
    DOI: "10.1137/S0097539796300921"
  - id: shor1994algorithms
    type: paper-conference
    author:
      - family: Shor
        given: Peter W.
    issued:
      date-parts:
        - [1994]
    title: "Algorithms for quantum computation: Discrete logarithms and factoring"
    container-title: "Proceedings 35th Annual Symposium on Foundations of Computer Science"
    page: "124-134"
    DOI: "10.1109/SFCS.1994.365700"
  - id: grover1996fast
    type: paper-conference
    author:
      - family: Grover
        given: Lov K.
    issued:
      date-parts:
        - [1996]
    title: "A fast quantum mechanical algorithm for database search"
    container-title: "Proceedings of the Twenty-Eighth Annual ACM Symposium on Theory of Computing"
    page: "212-219"
    DOI: "10.1145/237814.237866"
  - id: kitaev2002classical
    type: book
    author:
      - family: Kitaev
        given: Alexei Yu.
      - family: Shen
        given: Alexander H.
      - family: Vyalyi
        given: Mikhail N.
    issued:
      date-parts:
        - [2002]
    title: "Classical and Quantum Computation"
    publisher: "American Mathematical Society"
    publisher-place: "Providence, RI"
    ISBN: "978-0-8218-3229-5"
  - id: aharonov2002quantumnp
    type: manuscript
    author:
      - family: Aharonov
        given: Dorit
      - family: Naveh
        given: Tomer
    issued:
      date-parts:
        - [2002]
    title: "Quantum NP: A survey"
    note: "arXiv:quant-ph/0210077"
    URL: "https://arxiv.org/abs/quant-ph/0210077"
  - id: kempe2006complexity
    type: article-journal
    author:
      - family: Kempe
        given: Julia
      - family: Kitaev
        given: Alexei
      - family: Regev
        given: Oded
    issued:
      date-parts:
        - [2006]
    title: "The complexity of the local Hamiltonian problem"
    container-title: "SIAM Journal on Computing"
    volume: "35"
    issue: "5"
    page: "1070-1097"
    DOI: "10.1137/S0097539704445226"
    URL: "https://arxiv.org/abs/quant-ph/0406180"
  - id: marriott2005quantum
    type: article-journal
    author:
      - family: Marriott
        given: Chris
      - family: Watrous
        given: John
    issued:
      date-parts:
        - [2005]
    title: "Quantum Arthur-Merlin games"
    container-title: "Computational Complexity"
    volume: "14"
    issue: "2"
    page: "122-152"
    DOI: "10.1007/s00037-005-0194-x"
  - id: watrous2008complexity
    type: manuscript
    author:
      - family: Watrous
        given: John
    issued:
      date-parts:
        - [2008]
    title: "Quantum computational complexity"
    note: "arXiv:0804.3401"
    URL: "https://arxiv.org/abs/0804.3401"
  - id: vidick2016quantumproofs
    type: manuscript
    author:
      - family: Vidick
        given: Thomas
      - family: Watrous
        given: John
    issued:
      date-parts:
        - [2016]
    title: "Quantum proofs"
    note: "arXiv:1610.01664"
    URL: "https://arxiv.org/abs/1610.01664"
  - id: watrous1999pspace
    type: manuscript
    author:
      - family: Watrous
        given: John
    issued:
      date-parts:
        - [1999]
    title: "PSPACE has 2-round quantum interactive proof systems"
    note: "arXiv:cs/9901015"
    URL: "https://arxiv.org/abs/cs/9901015"
  - id: jain2011qip
    type: article-journal
    author:
      - family: Jain
        given: Rahul
      - family: Ji
        given: Zhengfeng
      - family: Upadhyay
        given: Sarvagya
      - family: Watrous
        given: John
    issued:
      date-parts:
        - [2011]
    title: "QIP = PSPACE"
    container-title: "Journal of the ACM"
    volume: "58"
    issue: "6"
    DOI: "10.1145/2049697.2049704"
    URL: "https://arxiv.org/abs/0907.4737"
  - id: cleve2004consequences
    type: paper-conference
    author:
      - family: Cleve
        given: Richard
      - family: Høyer
        given: Peter
      - family: Toner
        given: Ben
      - family: Watrous
        given: John
    issued:
      date-parts:
        - [2004]
    title: "Consequences and limits of nonlocal strategies"
    container-title: "Proceedings 19th IEEE Annual Conference on Computational Complexity"
    page: "236-249"
    DOI: "10.1109/CCC.2004.1313847"
  - id: ji2020mip
    type: manuscript
    author:
      - family: Ji
        given: Zhengfeng
      - family: Natarajan
        given: Anand
      - family: Vidick
        given: Thomas
      - family: Wright
        given: John
      - family: Yuen
        given: Henry
    issued:
      date-parts:
        - [2020]
    title: "MIP* = RE"
    note: "arXiv:2001.04383"
    URL: "https://arxiv.org/abs/2001.04383"
  - id: broadbent2009universal
    type: paper-conference
    author:
      - family: Broadbent
        given: Anne
      - family: Fitzsimons
        given: Joseph
      - family: Kashefi
        given: Elham
    issued:
      date-parts:
        - [2009]
    title: "Universal blind quantum computation"
    container-title: "Proceedings of the 50th Annual IEEE Symposium on Foundations of Computer Science"
    page: "517-526"
    DOI: "10.1109/FOCS.2009.36"
  - id: reichardt2013classical
    type: article-journal
    author:
      - family: Reichardt
        given: Ben W.
      - family: Unger
        given: Falk
      - family: Vazirani
        given: Umesh
    issued:
      date-parts:
        - [2013]
    title: "Classical command of quantum systems"
    container-title: "Nature"
    volume: "496"
    page: "456-460"
    DOI: "10.1038/nature12035"
  - id: mahadev2018classical
    type: paper-conference
    author:
      - family: Mahadev
        given: Urmila
    issued:
      date-parts:
        - [2018]
    title: "Classical verification of quantum computations"
    container-title: "Proceedings of the 59th IEEE Annual Symposium on Foundations of Computer Science"
    page: "259-267"
    DOI: "10.1109/FOCS.2018.00033"
    URL: "https://arxiv.org/abs/1804.01082"
  - id: watrous2009zk
    type: article-journal
    author:
      - family: Watrous
        given: John
    issued:
      date-parts:
        - [2009]
    title: "Zero-knowledge against quantum attacks"
    container-title: "SIAM Journal on Computing"
    volume: "39"
    issue: "1"
    page: "25-58"
    DOI: "10.1137/060670997"
    URL: "https://arxiv.org/abs/quant-ph/0511020"
  - id: unruh2012knowledge
    type: paper-conference
    author:
      - family: Unruh
        given: Dominique
    issued:
      date-parts:
        - [2012]
    title: "Quantum proofs of knowledge"
    container-title: "Advances in Cryptology -- EUROCRYPT 2012"
    page: "135-152"
    DOI: "10.1007/978-3-642-29011-4_10"
  - id: unruh2017fiat
    type: manuscript
    author:
      - family: Unruh
        given: Dominique
    issued:
      date-parts:
        - [2017]
    title: "Post-quantum security of Fiat-Shamir"
    note: "IACR Cryptology ePrint Archive, Report 2017/398"
    URL: "https://eprint.iacr.org/2017/398"
  - id: lombardi2021postquantum
    type: manuscript
    author:
      - family: Lombardi
        given: Alex
      - family: Ma
        given: Fermi
      - family: Spooner
        given: Nicholas
    issued:
      date-parts:
        - [2021]
    title: "Post-quantum zero knowledge, revisited; or, how to do quantum rewinding undetectably"
    note: "arXiv:2111.12257"
    URL: "https://arxiv.org/abs/2111.12257"
  - id: anshu2022nlts
    type: manuscript
    author:
      - family: Anshu
        given: Anurag
      - family: Breuckmann
        given: Nikolas P.
      - family: Nirkhe
        given: Chinmay
    issued:
      date-parts:
        - [2022]
    title: "NLTS Hamiltonians from good quantum codes"
    note: "arXiv:2206.13228"
    URL: "https://arxiv.org/abs/2206.13228"
  - id: natarajan2024status
    type: manuscript
    author:
      - family: Natarajan
        given: Anand
      - family: Nirkhe
        given: Chinmay
    issued:
      date-parts:
        - [2024]
    title: "The status of the quantum PCP conjecture (games version)"
    note: "arXiv:2403.13084"
    URL: "https://arxiv.org/abs/2403.13084"
  - id: nist2024release
    type: webpage
    author:
      - literal: "National Institute of Standards and Technology"
    issued:
      date-parts:
        - [2024, 8, 13]
    title: "NIST releases first 3 finalized post-quantum encryption standards"
    URL: "https://www.nist.gov/news-events/news/2024/08/nist-releases-first-3-finalized-post-quantum-encryption-standards"
    accessed:
      date-parts:
        - [2026, 7, 8]
  - id: nist2025hqc
    type: webpage
    author:
      - literal: "National Institute of Standards and Technology"
    issued:
      date-parts:
        - [2025, 3, 11]
    title: "NIST selects HQC as fifth algorithm for post-quantum encryption"
    URL: "https://www.nist.gov/news-events/news/2025/03/nist-selects-hqc-fifth-algorithm-post-quantum-encryption"
    accessed:
      date-parts:
        - [2026, 7, 8]
  - id: fips203
    type: report
    author:
      - literal: "National Institute of Standards and Technology"
    issued:
      date-parts:
        - [2024]
    title: "FIPS 203: Module-Lattice-Based Key-Encapsulation Mechanism Standard"
    URL: "https://csrc.nist.gov/pubs/fips/203/final"
    accessed:
      date-parts:
        - [2026, 7, 8]
  - id: fips204
    type: report
    author:
      - literal: "National Institute of Standards and Technology"
    issued:
      date-parts:
        - [2024]
    title: "FIPS 204: Module-Lattice-Based Digital Signature Standard"
    URL: "https://csrc.nist.gov/pubs/fips/204/final"
    accessed:
      date-parts:
        - [2026, 7, 8]
  - id: fips205
    type: report
    author:
      - literal: "National Institute of Standards and Technology"
    issued:
      date-parts:
        - [2024]
    title: "FIPS 205: Stateless Hash-Based Digital Signature Standard"
    URL: "https://csrc.nist.gov/pubs/fips/205/final"
    accessed:
      date-parts:
        - [2026, 7, 8]
type: research-article

date-created: 2026-07-08
description: “Quantum proof” is not yet one clean term of art in the way “group,” “sheaf,” or “Hamiltonian” is.
---

# Quantum Proof

## 0. Orientation: what the phrase is trying to name

“Quantum proof” is not yet one clean term of art in the way “group,” “sheaf,” or “Hamiltonian” is. It is a cluster of related technical uses. The central use in theoretical computer science is precise: a quantum proof is a quantum state used as a witness or certificate, checked by a quantum polynomial-time verifier. This is the setting of QMA, short for Quantum Merlin-Arthur, the quantum analogue of NP and MA. A second use belongs to interactive proof theory: one may allow the verifier, the prover, the messages, or the provers’ shared resources to be quantum. This yields QIP, QSZK, QMIP, MIP*, and related classes. A third use belongs to cryptography: a proof, signature, commitment, or protocol is sometimes called “quantum-proof” when its security survives adversaries with quantum computers.

The three uses are different, but they are not accidental neighbors. They all alter the classical relation between a claim, a verifier, a witness, and an adversary. In ordinary NP-style proof checking, a proof is a finite classical string, the verifier is efficient, and soundness means that no false claim has an accepting string. In a quantum proof system, at least one of these pieces is replaced by quantum information or quantum computation. The witness may be a state in Hilbert space; the verifier may be a quantum circuit; the conversation may contain quantum messages; the cheating prover may hold entanglement; the cryptographic adversary may query a random oracle in superposition. Every one of those replacements forces the same conceptual shift: proof is no longer only syntactic inscription. It becomes an operational resource in a physically constrained information theory.

That is the core thesis of this paper. A quantum proof is proof after the verifier has been made physical. Verification is no longer just reading. It is an experiment. The proof may be damaged by the act of checking it. The prover may exploit entanglement. The verifier’s test may be equivalent to estimating the energy of a many-body quantum system. Soundness can become a spectral statement. Zero-knowledge can fail because a classical simulator’s rewinding step is not harmless when the adversary’s state is quantum. A local Hamiltonian can become the quantum analogue of a Boolean formula. A nonlocal game can turn proof checking into a question about operator algebras.

The resulting terrain is one of the major conceptual reorganizations of modern complexity theory. The old image of proof as a line of text checked against formal rules does not disappear. It remains the limiting case where witnesses, verifiers, channels, and adversaries are classical. But the quantum version exposes a deeper architecture: proof is any resource-bounded relation by which a verifier can be convinced of a claim without simply doing the entire work itself. Once that relation is embedded in quantum mechanics, “proof” inherits the strange materiality of quantum information: superposition, interference, entanglement, measurement disturbance, no-cloning, and uncertainty.

The paper proceeds in three movements. First, it explains the formal core: QMA, quantum witnesses, completeness and soundness, amplification, and the local Hamiltonian problem. Second, it gives a genealogy from NP and interactive proofs through quantum computation into the present landscape. Third, it maps the current frontiers: quantum PCP, Hamiltonian complexity, entangled multiprover proofs, classical verification of quantum computation, quantum-secure zero-knowledge, and post-quantum cryptographic proof systems.

## 1. The classical baseline: proof as efficiently checkable certificate

The modern computational idea of proof begins from a simple asymmetry. Solving a problem may be hard, but checking a proposed solution may be easy. Given a Boolean formula, finding a satisfying assignment can require search, but checking a proposed assignment is fast. Given a graph, finding a Hamiltonian cycle may be hard, but checking a proposed cycle is easy. This asymmetry is captured by NP.

A language \(L\) is in NP if there is a polynomial-time deterministic verifier \(V\) and a polynomially long string \(w\) such that:

\[
x \in L \Rightarrow \exists w: V(x,w)=1,
\]

and

\[
x \notin L \Rightarrow \forall w: V(x,w)=0.
\]

The string \(w\) is the proof, witness, certificate, or evidence. Stephen Cook’s 1971 theorem and Leonid Levin’s parallel work showed that satisfiability is complete for this mode of verification: every NP verification procedure can be encoded into a SAT instance [@cook1971complexity; @levin1973universal]. This matters for quantum proof because QMA is constructed by replacing the classical verifier with a quantum polynomial-time verifier and replacing the classical witness string with a quantum state. The quantum theory is not a decorative variant; it is built by taking the proof-checking asymmetry itself and moving it into quantum computation.

The second classical ingredient is probabilistic verification. In MA, Merlin sends a proof and Arthur checks it with randomized polynomial-time computation. Completeness and soundness are no longer 1 and 0; they are separated probabilities. A typical convention is completeness at least \(2/3\) and soundness at most \(1/3\). If the claim is true, there exists a witness accepted with high probability. If the claim is false, no witness can make the verifier accept except with low probability. The gap, not certainty, is the important invariant, because repetition can often amplify it.

The third ingredient is interaction. In classical interactive proofs, introduced by Shafi Goldwasser, Silvio Micali, and Charles Rackoff, the proof is no longer a static object. It is a protocol between a computationally bounded verifier and a computationally unbounded prover [@goldwasser1989knowledge]. The prover may adapt to the verifier’s random challenges. This turns proof into a game. Soundness is not “there is no false proof string,” but “there is no cheating prover strategy that makes the verifier accept too often.” Adi Shamir’s theorem \(IP=PSPACE\) then showed that interaction dramatically enlarges the class of verifiable claims [@shamir1992ip].

The fourth ingredient is local checkability. The PCP theorem says that NP proofs can be encoded so that a verifier reads only a constant number of randomly chosen bits while still distinguishing valid proofs from proofs that are far from valid [@arora1998proof]. PCP theory transformed proof from a monolithic string into an error-robust object that can be spot-checked. The quantum PCP conjecture is the quantum descendant of this idea, but the inheritance is difficult: quantum states cannot be read locally without disturbance, and entanglement gives “local consistency” a meaning radically unlike the classical one.

Thus, before quantum enters, proof theory in complexity has already split proof into several dimensions:

- Is the proof static or interactive?
- Is verification deterministic, randomized, or probabilistic?
- Is the verifier reading the whole proof or only local pieces?
- Is soundness exact or bounded by a gap?
- Is the prover a string, a strategy, or a distributed system?
- Is the proof meant to reveal knowledge or hide it?

Quantum proof theory changes the physical substrate of these dimensions.

## 2. Quantum computation as a new verifier

Quantum computation entered complexity theory through the idea that physical law might define computational resources different from Turing’s classical model. Richard Feynman argued that quantum systems appear hard to simulate classically and suggested that computers built from quantum systems might simulate them naturally [@feynman1982simulating]. David Deutsch formalized a universal quantum computer [@deutsch1985quantum]. Ethan Bernstein and Umesh Vazirani developed quantum complexity theory as a resource-bounded theory of languages decided by quantum Turing machines or circuits [@bernstein1997quantum]. Peter Shor’s factoring and discrete-logarithm algorithms and Lov Grover’s search algorithm made the computational consequences vivid [@shor1994algorithms; @grover1996fast].

The quantum verifier is usually modeled as a uniform family of polynomial-size quantum circuits. The circuit acts on qubits, applies unitary gates, may use ancilla qubits initialized to \(|0\rangle\), and finally measures an output qubit. The acceptance probability is a Born-rule probability.

The class BQP consists of languages decidable by polynomial-time quantum computation with bounded error. BQP is the quantum analogue of BPP. It is not a proof class by itself, because there is no external witness. It is the baseline for quantum efficient computation.

QMA adds the witness.

## 3. QMA: the core formal meaning of “quantum proof”

A language \(L\) is in QMA if there exists a uniform polynomial-size family of quantum verification circuits \(V_x\) and polynomially many witness qubits such that:

\[
x \in L \Rightarrow \exists \rho: \Pr[V_x(\rho)\text{ accepts}] \ge c,
\]

and

\[
x \notin L \Rightarrow \forall \rho: \Pr[V_x(\rho)\text{ accepts}] \le s,
\]

where \(c-s \ge 1/\operatorname{poly}(|x|)\). The witness \(\rho\) may be a pure state \(|\psi\rangle\langle\psi|\) or a mixed state. It is the quantum proof.

Several details matter.

First, the quantifier over witnesses ranges over a continuous, exponentially large state space. A classical witness of \(m\) bits is one of \(2^m\) strings. A quantum witness of \(m\) qubits is a vector in a \(2^m\)-dimensional complex Hilbert space, up to phase and normalization, or more generally a density operator on that space. This does not mean the witness “contains exponentially many readable classical bits.” Holevo-type limits and measurement disturbance prevent that simple reading. But it does mean that the witness can use amplitude, phase, and entanglement as resources available to the verifier’s quantum test.

Second, the verifier’s acceptance probability is linear in the density matrix \(\rho\). For each input \(x\), one can associate a positive semidefinite acceptance operator \(A_x\) such that the acceptance probability is \(\operatorname{Tr}(A_x\rho)\). The optimal proof is an eigenstate corresponding to the largest eigenvalue of \(A_x\). This observation gives QMA a spectral flavor. Verification is equivalent to asking whether a certain efficiently describable positive operator has large maximum eigenvalue. That spectral viewpoint becomes explicit in the local Hamiltonian problem.

Third, the witness cannot generally be copied. In classical MA, amplification can ask Merlin to send several copies of the same witness and independently test them. In QMA, no-cloning blocks the assumption that the verifier can duplicate a witness. One can ask the prover to send multiple copies, but if the statement is false, a cheating prover may send entangled copies or a correlated state across all registers. Chris Marriott and John Watrous showed that QMA amplification can nevertheless be done without increasing the witness size, using a quantum procedure that reuses the witness coherently [@marriott2005quantum]. This is a crucial example of how quantum proof theory must rework even apparently routine proof-system techniques.

Fourth, QMA has neighboring classes. QCMA allows a classical witness checked by a quantum verifier. QMA allows a quantum witness. MA allows a classical randomized verifier and classical witness. BQP has no witness. QMA(2) and QMA(k) ask for multiple unentangled quantum witnesses. The phrase “unentangled” becomes a promise about tensor factorization, and enforcing or exploiting that promise is a major difficulty. These variants measure where the “quantumness” is located: in the verifier, in the proof, in the relation among multiple proof registers, or in the communication channel.

The simplest definition is therefore also the deepest one:

> A quantum proof is a quantum state whose existence can be checked, with bounded error, by an efficient quantum verifier.

That sentence looks like NP with the word “quantum” inserted. But each term changes. “Existence” is existence in Hilbert space. “Checked” is measured. “Efficient” is quantum-circuit efficient. “Bounded error” becomes a promise-gap condition tied to spectral separation. “Proof” becomes a physical state that may not be inspectable without being changed.

## 4. Why quantum witnesses are not merely shorter classical proofs

It is tempting to say that a quantum witness is a compact encoding of many classical proofs at once, because a state can be a superposition:

\[
|\psi\rangle = \sum_z \alpha_z |z\rangle.
\]

That intuition is useful but dangerous. Measurement in the computational basis returns only one \(z\), not the whole superposition. The value of a quantum witness is not that it stores exponentially many classical strings for later reading. Its value is that the verifier’s circuit can create interference among the amplitudes and test global properties of the state.

A quantum proof is therefore closer to an experimental preparation than to an archive. The prover prepares a state; the verifier performs a controlled experiment; the outcome distribution convinces or fails to convince. The proof’s information is not separable from the measurement procedure. This is why QMA-complete problems often look like questions about physical systems rather than questions about explicit combinatorial certificates.

The local Hamiltonian problem is the key example.

## 5. The local Hamiltonian problem: SAT becomes energy

In classical complexity, SAT is the canonical NP-complete problem. In QMA, the canonical complete problem is the \(k\)-local Hamiltonian problem.

A Hamiltonian is an operator \(H\) representing the energy observable of a quantum system. In the local Hamiltonian problem, \(H\) is written as a sum

\[
H = \sum_i H_i,
\]

where each term \(H_i\) acts nontrivially on at most \(k\) qubits. The input is a description of the local terms and two thresholds \(a < b\) separated by at least an inverse polynomial. The task is to decide whether the ground-state energy \(\lambda_{\min}(H)\) is at most \(a\) or at least \(b\), promised that one is the case.

The analogy with SAT is direct but not shallow. A Boolean formula is a sum of local constraints, each clause penalizing certain local assignments. A satisfying assignment has zero penalty. An unsatisfiable formula has positive penalty. A local Hamiltonian is a sum of local quantum constraints, each penalizing certain local states. A low-energy state is a quantum assignment that approximately satisfies the constraints.

Alexei Kitaev proved that local Hamiltonian is QMA-complete, and Dorit Aharonov and Tomer Naveh presented the result as the quantum analogue of Cook-Levin [@kitaev2002classical; @aharonov2002quantumnp]. Julia Kempe, Alexei Kitaev, and Oded Regev later showed that even the 2-local Hamiltonian problem is QMA-complete [@kempe2006complexity]. The completeness proof uses what is now called the Feynman-Kitaev clock construction. A quantum computation is encoded into a “history state,” a superposition over time steps of the verifier’s computation:

\[
|\Psi\rangle = \frac{1}{\sqrt{T+1}}\sum_{t=0}^{T} |\psi_t\rangle \otimes |t\rangle.
\]

The Hamiltonian contains local terms that enforce correct initialization, correct propagation from time \(t\) to \(t+1\), and accepting output. If there exists a witness making the verifier accept, there is a low-energy history state. If no witness can make the verifier accept, every history-like state pays energy.

This construction is one of the great conceptual bridges in quantum information. It says that proof verification can be recoded as ground-state physics. Conversely, estimating the low-energy behavior of a local quantum system is as hard as verifying any quantum proof. Complexity, proof, and matter meet in the same object.

The local Hamiltonian problem also explains why QMA became central outside abstract complexity theory. Many-body quantum physics is full of local Hamiltonians. Questions about ground states, spectral gaps, frustration, topological order, area laws, and tensor networks become complexity-theoretic questions. The proof is not a written derivation; it is a low-energy quantum state. The verifier is not a reader; it is an energy test.

## 6. Measurement disturbance and the no-cloning burden

The quantum proof differs from a classical certificate in two operationally severe ways.

The first is measurement disturbance. If a verifier measures the wrong observable, the state may be altered. A classical proof can be read repeatedly without changing it. A quantum proof is partly consumed by inspection. This affects amplification, composition, and extraction. The verifier must be designed around the fact that evidence is not passive.

The second is no-cloning. There is no universal operation that copies an arbitrary unknown quantum state. This has no classical analogue. If a proof system wants to run multiple tests, it cannot simply copy the witness and distribute copies to subtests. It can demand more registers from the prover, but soundness must account for malicious entanglement among those registers.

These constraints make “local checking” difficult. A classical PCP verifier can read a few proof bits. A quantum verifier can measure a few qubits, but the result may disturb the state, and local reduced density matrices may be consistent with many incompatible global states. Entanglement is precisely the obstruction to simple local-to-global reasoning. The quantum PCP conjecture lives inside this obstruction.

## 7. The quantum PCP problem: can quantum proofs be robustly spot-checked?

Classical PCP theory says, roughly, that NP proofs can be encoded so that a verifier reads only constantly many bits and still detects false proofs with constant probability. In optimization language, the PCP theorem implies hardness of approximating certain constraint satisfaction problems within a constant factor.

The quantum PCP conjecture asks for a quantum analogue. One version asks whether it is QMA-hard to approximate the ground-state energy of a local Hamiltonian to constant precision, not merely inverse-polynomial precision. Equivalently, can the local Hamiltonian problem remain QMA-hard when the promise gap is constant?

This is not a minor parameter change. It asks whether quantum proof checking can be made robust against extensive local corruption in the way classical PCP proof checking can. If true, it would mean there is no efficient quantum algorithm, and likely no efficient classical algorithm, for approximating the energy density of general local quantum systems within constant error. It would place the hardness of quantum many-body physics on a PCP-like foundation.

The obstruction is that quantum states can be highly entangled while looking locally simple. Tensor networks approximate some physically relevant states efficiently, but not all. Area laws hold in important one-dimensional gapped settings, but higher-dimensional and frustrated systems remain much harder. The quantum PCP conjecture asks whether there are local Hamiltonians whose low-energy states are all globally complex in a way no shallow circuit can prepare.

A major advance is the proof of the NLTS conjecture, the No Low-Energy Trivial States conjecture, by Anurag Anshu, Nikolas Breuckmann, and Chinmay Nirkhe [@anshu2022nlts]. NLTS says there exist local Hamiltonian families for which every low-energy state is nontrivial, meaning not preparable by low-depth quantum circuits. This does not prove quantum PCP, but it establishes a structural prerequisite long viewed as a necessary step. The construction uses good quantum LDPC codes, bringing coding theory, topology, and Hamiltonian complexity into direct contact.

Another frontier is the “games version” of quantum PCP. Classical PCPs can be related to multiprover games, but in the quantum setting entangled provers change the landscape. Anand Natarajan and Chinmay Nirkhe’s 2024 survey of the games version emphasizes that the classical equivalence between constraint-satisfaction PCPs and game PCPs does not simply transfer; after MIP* = RE, one must impose restrictions such as efficient provers or bounded communication to recover a meaningful analogue [@natarajan2024status]. The frontier is therefore not just proving or disproving a conjecture. It is determining what the right quantum analogue of PCP even is.

## 8. Quantum interactive proofs: proof as conversation with quantum information

In QMA, Merlin sends one quantum message and Arthur verifies. In QIP, the proof is an interaction. A polynomial-time quantum verifier exchanges messages with an all-powerful prover. Messages may be quantum. The prover’s strategy is a sequence of quantum operations on a private memory and the message register.

Classically, interaction lifts verification from NP-like classes to PSPACE. Quantumly, the landscape has its own surprises. John Watrous showed early that PSPACE has short quantum interactive proof systems [@watrous1999pspace]. Rahul Jain, Zhengfeng Ji, Sarvagya Upadhyay, and John Watrous later proved the exact characterization:

\[
QIP = PSPACE.
\]

The proof uses semidefinite programming and matrix multiplicative weights to show that quantum interactive proofs can be simulated in PSPACE [@jain2011qip]. Since \(IP=PSPACE\), the equality says that single-prover quantum interaction has the same ultimate language-recognition power as classical interaction at the PSPACE level, even though the internal geometry and round complexity differ.

This is an instructive result. Quantum mechanics changes the local structure of proof systems, but it does not automatically make every proof class larger. Sometimes it reshapes the proof without moving the outer boundary. QIP = PSPACE is one such boundary theorem.

Quantum statistical zero-knowledge, QSZK, is another major class. Here the verifier learns nothing beyond the validity of the statement, in a quantum information-theoretic sense. Quantum state distinguishability is complete for QSZK. Again, the natural complete problem is not a formula or graph but a quantum information task: distinguish whether two efficiently generated mixed states are close or far.

Quantum interactive proofs thus make proof into controlled quantum dialogue. The verifier may not trust the prover, but can challenge, measure, and process quantum information. The prover may be all-powerful, but must respect quantum mechanics. Soundness becomes a statement about all physically allowed strategies.

## 9. Multiprover proofs and the explosion caused by entanglement

Classical multiprover interactive proofs involve several provers who cannot communicate during the protocol. Their separation lets the verifier cross-check them. In the classical setting, \(MIP=NEXP\). Quantumly, if provers share entanglement before the protocol begins, the class becomes MIP*. Entanglement allows correlations stronger than classical shared randomness but still constrained by no-signaling and quantum theory.

Nonlocal games are the cleanest model. A verifier samples questions, sends them to separated provers, receives answers, and checks a predicate. The provers may share an entangled state and choose measurements depending on their questions. The maximum success probability using entangled strategies is the entangled value of the game. Richard Cleve, Peter Høyer, Ben Toner, and John Watrous helped establish the complexity-theoretic significance of nonlocal strategies [@cleve2004consequences].

Then came a startling theorem: Zhengfeng Ji, Anand Natarajan, Thomas Vidick, John Wright, and Henry Yuen proved

\[
MIP^* = RE.
\]

Here RE is the class of recursively enumerable languages, including undecidable problems such as the halting problem in the appropriate recognition sense [@ji2020mip]. This is one of the most dramatic results in modern complexity theory. It says that entangled multiprover proof systems can verify membership in a class far beyond decidable computation.

The shock comes from how proof, entanglement, and infinity become entangled with each other. Classical provers with no communication can be powerful, but their proof systems remain within computability-theoretic boundaries familiar from complexity theory. Entangled provers open a route to operator-algebraic phenomena. The theorem is connected to negative resolutions of long-standing problems related to Tsirelson’s problem and Connes’ embedding problem. A proof system became a bridge between computational complexity, quantum information, and the foundations of operator algebras.

For the concept of quantum proof, MIP* = RE teaches a sharp lesson: when proof is distributed across entangled systems, the verifier may certify behavior whose mathematical analysis requires infinite-dimensional limits. The “proof” is no longer merely a message; it is a correlation structure realized by measurements on a shared entangled state.

## 10. Quantum proofs and zero-knowledge: when verification must not reveal

Zero-knowledge proof systems show that one can convince a verifier of a statement without revealing the witness. In the quantum setting, the problem becomes more subtle. A malicious verifier may run a quantum strategy, keep quantum side information, and interact coherently. A classical proof that relies on rewinding the verifier may fail, because rewinding a quantum adversary is not a harmless operation.

Classical rewinding imagines running an adversary, observing something, resetting it to a previous state, and trying again. Quantumly, observation can disturb the adversary’s state, and unknown quantum states cannot be copied. Thus, “just rewind the adversary” is not a valid argument unless one builds a genuinely quantum rewinding lemma.

John Watrous proved that several zero-knowledge protocols remain zero-knowledge against quantum attacks, establishing that meaningful quantum zero-knowledge is possible [@watrous2009zk]. Dominique Unruh developed quantum proofs of knowledge and transformations for noninteractive zero-knowledge in the quantum random oracle model [@unruh2012knowledge; @unruh2017fiat]. Alex Lombardi, Fermi Ma, and Nicholas Spooner later revisited post-quantum zero-knowledge with new quantum rewinding techniques aimed at extracting information without detectably disturbing the adversary’s internal state [@lombardi2021postquantum].

The conceptual shift is precise. In classical cryptography, a proof system is secure if every efficient cheating verifier or prover can be simulated or extracted against. In post-quantum cryptography, “efficient” means quantum polynomial time. A proof may be classically sound, zero-knowledge, or a proof of knowledge, yet not automatically retain those properties against quantum adversaries. The quantum-proof version requires new definitions and new reductions.

This is also where the adjective “quantum-proof” enters ordinary security language. A signature or proof protocol is quantum-proof if the best known security reduction survives quantum attacks, typically under assumptions such as Learning with Errors, code-based hardness, hash-based security, multivariate hardness, or other post-quantum assumptions. But this adjective can hide technical nuance. A scheme may use post-quantum primitives while a transformation such as Fiat-Shamir still requires careful analysis in the quantum random oracle model. “Uses a quantum-resistant assumption” is not identical to “has a complete quantum security proof.”

## 11. Classical verification of quantum computation: can a classical verifier check a quantum machine?

A practical and conceptual frontier asks: if quantum computers become powerful, how can a classical user verify their outputs? If the computation is beyond classical simulation, the user cannot simply recompute the result. This is proof theory for delegated quantum computation.

There are several models. In blind quantum computation, a client with limited quantum abilities delegates computation to a quantum server while hiding the computation [@broadbent2009universal]. In multi-prover verification, a classical verifier can exploit spatially separated entangled devices, testing them through nonlocal games. Ben Reichardt, Falk Unger, and Umesh Vazirani showed how classical commands can control and verify quantum systems in such a setting [@reichardt2013classical].

Urmila Mahadev’s 2018 protocol gave a breakthrough in single-prover classical verification under cryptographic assumptions [@mahadev2018classical]. A classical verifier can interact with a quantum prover and verify the result of an efficient quantum computation, relying on Learning with Errors. The protocol constructs a measurement protocol using trapdoor claw-free functions. Informally, the verifier uses post-quantum cryptography to force the prover into behavior that can be checked classically even though the prover is quantum.

This line of work is philosophically important. It reverses the ordinary QMA picture. In QMA, a quantum verifier checks a quantum witness. In classical verification of quantum computation, a classical verifier checks a quantum process. The verifier’s weakness is compensated by cryptographic structure, interaction, and carefully designed measurement constraints.

As quantum hardware develops, this frontier becomes less abstract. Claims of quantum advantage, quantum simulation, random circuit sampling, analog quantum simulation, and quantum optimization all raise the same proof-theoretic question: what counts as convincing evidence when the claimed computation cannot be classically reproduced? A “quantum proof” in this setting may be a transcript, a cryptographic interaction, a statistical certificate, a cross-entropy score, a Hamiltonian energy estimate, or a protocol that pins a quantum device to a verifiable behavior.

## 12. Post-quantum cryptography: “quantum-proof” as secure against quantum adversaries

The cryptographic use of “quantum-proof” is not the same as QMA, but it belongs in the same conceptual family because it changes the adversary model. Classical public-key cryptography often relies on the hardness of factoring, discrete logarithms, or elliptic-curve discrete logarithms. Shor’s algorithm breaks those assumptions for sufficiently large fault-tolerant quantum computers [@shor1994algorithms]. Post-quantum cryptography seeks schemes believed secure against both classical and quantum attacks.

The National Institute of Standards and Technology released its first three finalized post-quantum standards in August 2024: FIPS 203 for ML-KEM, FIPS 204 for ML-DSA, and FIPS 205 for SLH-DSA [@nist2024release; @fips203; @fips204; @fips205]. ML-KEM is based on module learning with errors and is intended for key encapsulation. ML-DSA is a module-lattice-based digital signature standard. SLH-DSA is stateless hash-based and provides a different mathematical basis for signatures. In March 2025, NIST selected HQC as an additional code-based key-encapsulation algorithm to serve as a backup to ML-KEM [@nist2025hqc].

For proof systems, the post-quantum transition matters in at least four ways.

First, signatures and authentication are proof-like. A digital signature is a proof of origin and integrity relative to a public key. If quantum computers break the signature scheme, the proof system collapses.

Second, many zero-knowledge and succinct-proof systems rely on commitments, hash functions, elliptic-curve groups, pairings, or Fiat-Shamir transformations. Some components are more quantum-resilient than others. Hash-based security loses roughly a square-root factor under Grover search, so parameter sizes must account for quantum query attacks. Elliptic-curve-based systems are not post-quantum in the Shor sense. Lattice-based systems are leading candidates but require careful reduction and implementation analysis.

Third, noninteractive proofs often rely on the random oracle model. In a quantum setting, an adversary may query the oracle in superposition, producing the quantum random oracle model. Classical Fiat-Shamir security proofs do not automatically survive this shift. This is why Unruh-style and later analyses matter [@unruh2017fiat].

Fourth, “quantum-proof” has an engineering dimension. A standard can specify a primitive, but deployed systems need hybrid key exchange, migration plans, side-channel resistance, versioned protocols, hardware support, and cryptographic agility. A proof of security lives in a model; a secure system must preserve the model’s assumptions through implementation.

The cryptographic sense of quantum-proof therefore means: the proof, signature, or protocol remains sound, zero-knowledge, extractable, or unforgeable even when the adversary is a quantum polynomial-time machine. That is adjacent to, but not identical with, the complexity-theoretic sense where the proof itself is a quantum state.

## 13. A compact taxonomy

The landscape becomes clearer if we ask where quantumness enters.

| Setting | Proof object | Verifier | Adversary/prover model | Core question |
|---|---|---|---|---|
| NP | Classical string | Deterministic classical polynomial time | Any string | Is there an efficiently checkable certificate? |
| MA | Classical string | Randomized classical polynomial time | Any string | Is there a witness accepted with high probability? |
| QCMA | Classical string | Quantum polynomial time | Any string | Does a classical witness help a quantum verifier? |
| QMA | Quantum state | Quantum polynomial time | Any quantum state | Does a quantum witness help? |
| QMA(k) | Several promised-unentangled quantum states | Quantum polynomial time | Product-state witnesses | What is the power of unentangled quantum proofs? |
| Local Hamiltonian | Low-energy quantum state | Energy/local constraint test | Any state | Is there a low-energy state? |
| QIP | Interactive quantum strategy | Quantum polynomial time | All quantum prover strategies | What can quantum interaction verify? |
| QSZK | Interactive transcript with simulation | Quantum polynomial time | Quantum verifiers | What can be verified without revealing quantum knowledge? |
| MIP* | Entangled multiprover strategy | Usually classical or quantum verifier | Noncommunicating entangled provers | What can entangled correlations certify? |
| Post-quantum ZK / signatures | Classical or quantum transcript | Classical or quantum verifier | Quantum polynomial-time adversary | Does classical security survive quantum attack? |
| Classical verification of quantum computation | Transcript/protocol behavior | Classical polynomial time | Quantum prover/device | Can a classical verifier certify quantum work? |

This table also prevents a common confusion. A post-quantum signature is usually not a QMA proof. It is a classical object designed to resist quantum attacks. A QMA proof is a quantum state designed to convince a quantum verifier. A MIP* proof may be neither a witness string nor a single state sent to the verifier, but a distributed entangled strategy whose existence explains the verifier’s acceptance probability.

## 14. Genealogy: how the concept developed

### 14.1 From formal proof to certificate

Classical mathematical proof is deductive derivation. Complexity theory abstracts from derivation to verification. Instead of asking whether a theorem follows from axioms by a sequence of rules, NP asks whether membership in a language has a short certificate checkable efficiently. This is not a rejection of formal proof; it is a compression of proof into a resource-bounded relation.

Cook-Levin makes this abstraction universal for nondeterministic polynomial time. Any efficient verification computation can be encoded as a satisfiability instance. This creates the first canonical bridge between proof and constraint satisfaction.

### 14.2 From certificate to game

Interactive proof theory changes the proof from an object into a protocol. Goldwasser, Micali, and Rackoff’s zero-knowledge work adds the idea that proof has an information-flow profile: it may convince without revealing. Shamir’s \(IP=PSPACE\) shows that interaction expands verification to a major deterministic space class.

At this stage, proof is no longer only a derivation or certificate. It is a strategy in a verifier-prover game. The verifier’s randomness is not incidental; it is part of the epistemic structure.

### 14.3 From game to locally testable object

PCP theory makes proof robustly local. The verifier need not read the whole proof. It can spot-check. This transforms proof into an error-corrected, locally testable encoding. The relation between proof checking and hardness of approximation becomes one of the central achievements of classical complexity.

Quantum PCP inherits this ambition but loses the easy assumptions: one cannot read arbitrary quantum bits without disturbance; one cannot copy the proof; and local views of entangled states do not behave like local views of classical strings.

### 14.4 From computation to quantum computation

Feynman, Deutsch, Bernstein and Vazirani, Shor, and Grover establish quantum computation as a complexity-theoretic object. BQP becomes the efficient quantum analogue of BPP. But a theory of proof requires more than efficient computation; it requires witnesses and verifiers. That leads to QMA.

### 14.5 From NP to QMA

Kitaev’s QMA and local Hamiltonian result provide the quantum analogue of NP-completeness. Aharonov and Naveh’s survey explicitly frames this as “Quantum NP” [@aharonov2002quantumnp]. The proof relation is now a relation between a classical input, a quantum witness, and a quantum circuit.

Local Hamiltonian supplies the complete problem. The history-state construction becomes the quantum Cook-Levin theorem. Instead of clauses over Boolean assignments, there are local energy terms over qubits. Instead of satisfying assignments, there are low-energy states.

### 14.6 From QMA to Hamiltonian complexity

Once local Hamiltonian is QMA-complete, the study of quantum proofs becomes the study of many-body physics under computational constraints. QMA-complete variants proliferate: different locality, geometry, particle types, stoquastic restrictions, commuting terms, translational invariance, fermionic systems, bosonic systems, and spectral-gap promises. The boundary between physically natural and computationally complete Hamiltonians becomes a research program.

### 14.7 From QIP to semidefinite proof geometry

Quantum interactive proofs develop in parallel. Watrous and others show that quantum messages and quantum verifiers alter round complexity and proof structure. Jain, Ji, Upadhyay, and Watrous prove \(QIP=PSPACE\), using semidefinite programming as the mathematical language of optimal quantum strategies [@jain2011qip]. Proof becomes convex optimization over quantum operations.

### 14.8 From nonlocal games to MIP* = RE

Entangled multiprover systems reveal that proof can exceed the computable boundary when verifier access is limited to finite interactions but prover strategies may involve unbounded entangled systems. MIP* = RE is not merely a bigger class inclusion. It shows that nonlocal proof systems encode deep questions about the closure of quantum correlation sets and operator algebras [@ji2020mip].

### 14.9 From quantum adversaries to quantum-proof cryptography

Finally, cryptography absorbs the quantum turn not mainly by sending quantum witnesses, but by strengthening adversaries. The question becomes: which classical proof systems, signatures, commitments, and transformations remain secure when attacked by quantum polynomial-time machines? Watrous’s quantum zero-knowledge, Unruh’s quantum proofs of knowledge and Fiat-Shamir work, and the NIST post-quantum standardization process mark this branch [@watrous2009zk; @unruh2012knowledge; @unruh2017fiat; @nist2024release].

The genealogy therefore has a double helix. One strand makes proof itself quantum. The other makes the attacker or verifier quantum and asks which proof concepts survive.

## 15. The mathematical anatomy of a QMA verifier

To understand QMA at research level, it helps to write the verifier as an operator.

Let \(V\) be a quantum circuit acting on witness register \(W\), ancilla register \(A\), and output qubit \(O\). The ancilla starts in \(|0^a\rangle\). The verifier applies a unitary \(U\) and measures \(O\) with projector \(\Pi_{\mathrm{acc}} = |1\rangle\langle 1|_O \otimes I\). For witness state \(\rho\), the acceptance probability is

\[
p_{\mathrm{acc}}(\rho)
=
\operatorname{Tr}\left[
\Pi_{\mathrm{acc}}
U(\rho \otimes |0^a\rangle\langle 0^a|)
U^\dagger
\right].
\]

By tracing out ancilla and output, one obtains an operator \(A\) on \(W\) such that

\[
p_{\mathrm{acc}}(\rho)=\operatorname{Tr}(A\rho).
\]

The maximum acceptance probability is \(\lambda_{\max}(A)\). Thus the yes/no problem is:

\[
x \in L \Rightarrow \lambda_{\max}(A_x)\ge c,
\]

\[
x \notin L \Rightarrow \lambda_{\max}(A_x)\le s.
\]

This is why semidefinite programming appears repeatedly in quantum proof theory. Density matrices are positive semidefinite trace-one operators. Quantum channels are completely positive trace-preserving maps. Measurements are POVMs. Optimal strategies in many quantum proof systems can be expressed as semidefinite programs or hierarchies of semidefinite relaxations. The geometry of proof becomes convex operator geometry.

But the dimension is exponential in the number of qubits. The formal convexity does not imply efficient classical solvability. It gives structure, duality, and sometimes space-bounded simulations. It does not collapse QMA into P.

## 16. Completeness, soundness, and amplification

Completeness and soundness are the two proof-theoretic virtues.

Completeness says that true statements have convincing proofs. In QMA, for every yes-instance, there exists a quantum state accepted with high probability. Soundness says that false statements have no convincing proofs. For every no-instance, every quantum state is rejected with high probability.

The promise gap \(c-s\) is essential. Standard choices like \(2/3\) and \(1/3\) are arbitrary as long as the gap is at least inverse polynomial and can be amplified. QMA amplification is subtler than classical amplification because of no-cloning and entanglement across repeated witnesses. Marriott-Watrous amplification is therefore a structural theorem about the stability of quantum proof checking [@marriott2005quantum].

Amplification is not merely a technical convenience. It allows the class to be robust under changes of constants. Without robust amplification, QMA would be a fragile definition tied to arbitrary probability thresholds. With amplification, the class captures a stable proof notion.

## 17. Quantum witness versus classical description

A quantum proof state may not have a short classical description. This is one reason QMA is thought to be larger than QCMA, though the separation is not known unconditionally. In QCMA, Merlin sends a classical string, and Arthur is quantum. This could describe a quantum circuit that prepares a useful state, or a classical explanation of where to look. In QMA, Merlin can send the state itself, even if no short classical circuit preparing it is known.

This distinction matters in physics. A ground state of a local Hamiltonian might be low-energy but not efficiently preparable by any known circuit. As a witness, the state can convince a verifier by passing energy tests. As a classical description, it may be inaccessible. QMA therefore separates possession of a state from possession of a recipe for the state.

This has practical analogues. A lab may produce a quantum state it cannot fully describe classically. A quantum device may generate a distribution no classical machine can sample. A verifier may certify properties of the produced object without reconstructing it. Quantum proof theory is the formal study of such asymmetries.

## 18. Physical proof: ground states as certificates

The local Hamiltonian problem suggests a physical image of proof. Suppose one claims that a material has a low-energy state below threshold \(a\). A proof could be the state itself. The verifier estimates local energy terms. If the average energy is low enough, the verifier accepts. If all states have energy above \(b\), no proof can pass.

This resembles experimental physics: prepare a system, measure observables, infer a property. The difference is that QMA abstracts this into worst-case computational verification. The prover may be adversarial. The verifier’s measurement budget is efficient. Completeness and soundness are promises about all possible states.

This physicalization of proof is not rhetorical. Hamiltonian complexity has imported complexity-theoretic distinctions into condensed matter and quantum information. Some Hamiltonians are frustration-free; some are stoquastic; some are commuting; some live on low-dimensional geometries; some have topological order; some have spectral gaps. Each restriction asks: does this physically meaningful class still support hard quantum proofs?

## 19. Entanglement as proof resource and proof obstacle

Entanglement plays two opposite roles.

As a resource, entanglement lets quantum witnesses and prover strategies encode correlations unavailable classically. It can make proofs more powerful, especially in multiprover settings. It can also allow efficient verification of certain global properties through local measurements.

As an obstacle, entanglement undermines classical proof intuitions. If a verifier asks for multiple proofs, how can it ensure they are unentangled? If a local Hamiltonian has locally consistent low-energy reductions, does a global state exist? If provers share entanglement, can their answers still be interpreted as independent testimony? If a zero-knowledge simulator rewinds a quantum verifier, can it avoid disturbing entangled side information?

Much of quantum proof theory is the discipline of making these questions exact.

## 20. Current frontier I: Hamiltonian complexity after NLTS

Hamiltonian complexity remains the central frontier for quantum proofs because local Hamiltonian is QMA-complete and because many-body physics supplies the most natural quantum witnesses.

The first problem is quantum PCP. Does constant-gap local Hamiltonian remain QMA-hard? The NLTS theorem is a major step but not the endpoint. NLTS gives Hamiltonians whose low-energy states require high circuit depth. Quantum PCP would require hardness of distinguishing low from high energy at constant promise gap. The gap between “low-energy states are nontrivial” and “approximating energy is QMA-hard” is still substantial.

The second problem is gap amplification. Classical PCP constructions amplify constraint-violation gaps while preserving local checkability. Quantum systems resist analogous amplification because local terms may not commute, entanglement spreads constraints nonclassically, and perturbative gadgets can damage spectral structure. The problem is not only technical; it asks what it even means to amplify inconsistency in a noncommuting constraint system.

The third problem is finding physically natural complete problems. Worst-case QMA-complete Hamiltonians can be highly engineered. A recurring question is which restrictions preserve QMA-hardness: low-dimensional lattices, translational invariance, commuting projectors, stoquastic terms, fermionic interactions, bosonic modes, or geometrically local interactions. Each positive result says hardness is physically robust. Each tractable subclass reveals structure that prevents arbitrary quantum proof encoding.

The fourth problem is the relation between qLDPC codes and proof complexity. Good quantum LDPC codes have constant rate, linear distance, and sparse checks. Their existence has transformed quantum coding theory and fed directly into NLTS constructions. The emerging triangle is: qLDPC codes provide robust nontrivial states; robust nontrivial states support Hamiltonian complexity; Hamiltonian complexity is the proof theory of quantum ground states.

## 21. Current frontier II: the right quantum PCP statement

The phrase “quantum PCP conjecture” hides multiple possible statements.

The Hamiltonian version asks about constant-gap approximation of local Hamiltonian. The games version asks about multiprover protocols for QMA with short answers or efficient checking. In classical theory, these are tightly connected. In quantum theory, MIP* = RE disrupts the connection. If entangled provers with unbounded strategies can verify recursively enumerable languages, then a naïve games-PCP formulation becomes too strong or simply different from the Hamiltonian question.

Natarajan and Nirkhe’s 2024 account emphasizes that meaningful games versions need constraints: efficient provers, restricted communication, or other physically and computationally bounded strategy classes [@natarajan2024status]. The frontier is thus partly definitional. Researchers are not merely trying to prove the quantum PCP conjecture; they are trying to identify which quantum PCP conjecture preserves the classical theorem’s conceptual role.

That role has three pieces:

1. Proofs can be checked locally.
2. Local inconsistency can be amplified to constant density.
3. Approximation hardness follows from proof-checking robustness.

In quantum settings, each piece can come apart.

## 22. Current frontier III: entangled proof systems after MIP* = RE

MIP* = RE opened a post-boundary era. The immediate question is no longer “how large is MIP*?” but “which restrictions recover meaningful complexity classes?”

Important directions include:

- finite-dimensional versus infinite-dimensional strategies;
- approximate versus exact entangled values;
- communication-bounded nonlocal games;
- efficient-prover versions of entangled proof systems;
- robust self-testing of large entangled states;
- connections between nonlocal games and Hamiltonian complexity;
- algorithmic hierarchies for approximating entangled values.

The conceptual issue is that entanglement makes proof nonlocal. The verifier receives only finite classical answers, but those answers can certify the presence of enormous or even unbounded operator structures. The frontier is to classify which nonlocal proof phenomena are physically realizable, computationally meaningful, and robust under noise.

## 23. Current frontier IV: classical verification and delegated quantum computation

If useful quantum computers exist, most users will be classical. Verification then becomes a trust problem. A quantum cloud service can claim to have run a computation, but the client may not be able to check by classical recomputation.

The main approaches each place the proof burden differently.

In multi-prover protocols, the verifier uses separated devices and nonlocal tests. The burden is physical separation and no communication. In cryptographic single-prover protocols, the verifier uses post-quantum assumptions such as LWE. The burden is computational hardness. In blind quantum computation, the client may need limited quantum ability. The burden is a small trusted quantum component. In sampling experiments, the burden is statistical evidence and complexity assumptions.

Mahadev-style verification is particularly important because it gives a classical-verifier, single-quantum-prover route under standard-looking post-quantum assumptions [@mahadev2018classical]. But practical overheads, noise tolerance, composability, and implementation remain active challenges. The proof of quantum computation is not yet a single industrially routine object. It is an evolving family of protocols.

The frontier question is: what is the most economical way for a weak verifier to certify a strong quantum device? The answer will likely depend on whether one wants cryptographic soundness, information-theoretic soundness, blindness, public verifiability, low overhead, or experimental robustness.

## 24. Current frontier V: post-quantum proof systems and zero-knowledge

Post-quantum zero-knowledge and proof-of-knowledge systems sit at the intersection of cryptography and quantum proof theory. The central issue is that many classical security proofs use techniques that are not quantum-sound.

Rewinding is the canonical example. A classical simulator may run an adversary, rewind it, and answer differently. A quantum adversary may hold a superposition over internal states, and measurement or rewinding can alter that state. Watrous showed that special forms of quantum rewinding work [@watrous2009zk]. Unruh developed quantum proof-of-knowledge machinery and quantum random-oracle techniques [@unruh2012knowledge; @unruh2017fiat]. Later work continues to refine what “expected polynomial time,” extraction, and simulation should mean against quantum adversaries [@lombardi2021postquantum].

This matters for modern cryptographic proof systems: SNARKs, STARKs, Bulletproof-like protocols, MPC-in-the-head signatures, lattice-based ZK, hash-based commitments, and Fiat-Shamir transformed protocols. Some are more naturally post-quantum than others. A hash-based transparent proof may resist Shor-type attacks but still require parameter changes for Grover-type search and careful modeling of Fiat-Shamir. A pairing-based SNARK is not post-quantum because elliptic-curve discrete log is vulnerable to Shor. A lattice-based proof system may rest on post-quantum assumptions but still need quantum-secure transformations.

The frontier is composability. A proof protocol is rarely deployed alone. It is embedded in a system of commitments, signatures, random oracles, transcripts, recursion, aggregation, and implementation choices. Quantum-proofness must survive the whole stack.

## 25. Current frontier VI: experimental certification and quantum advantage

Quantum proof theory also informs experimental claims. When a device claims quantum advantage, what is the proof?

For factoring with a large fault-tolerant machine, the proof is easy: multiply the factors. For random circuit sampling, the output distribution is hard to verify directly. For analog quantum simulation, the target property may itself be hard to compute. For quantum optimization, a claimed optimum may be easy to check in some cases and not in others.

This creates a hierarchy of evidence:

- directly checkable outputs;
- interactive certificates;
- cross-checks against smaller simulations;
- statistical benchmarks;
- self-testing protocols;
- cryptographic verification;
- energy measurements;
- reproducibility across devices;
- fault-tolerance-level logical verification.

The conceptual point is that quantum advantage without quantum proof is epistemically weak. A claimed computation beyond classical reach requires a verification story. Quantum proof systems are the formal vocabulary for such stories.

## 26. Philosophical compression: proof after inscription

Classical proof culture is inscriptional. A proof is written down; another mathematician reads it; formal systems idealize that reading as rule checking. Complexity theory already abstracts away from human-readable derivation to efficient verification. Quantum proof theory goes further: the proof need not be readable as text at all. It may be a state, a protocol, a correlation, or an energy landscape.

This does not make proof mystical. It makes proof operational. The verifier is not convinced because the proof has semantic transparency. The verifier is convinced because every false instance is bounded away from acceptance under all allowed physical strategies.

A quantum proof is therefore a disciplined relation among:

- a claim, usually a language membership statement;
- a verifier, usually resource-bounded;
- a proof resource, possibly a state, strategy, transcript, or cryptographic object;
- a physical/computational model governing allowed operations;
- a completeness condition;
- a soundness condition;
- sometimes a privacy condition, such as zero-knowledge;
- sometimes an extractability condition, such as proof of knowledge.

The novelty is not that quantum mechanics makes proof subjective. The novelty is that proof becomes explicitly material. Evidence has a state space. Checking is an operation. Cheating is constrained by physics. Trust is bounded by complexity.

## 27. Common confusions

### “A quantum proof contains exponentially much information”

A quantum state on \(n\) qubits is described mathematically by exponentially many amplitudes, but this does not mean it yields exponentially many classical bits on demand. Measurement limits what can be extracted. The power of a quantum proof lies in how the verifier’s circuit uses amplitudes and interference, not in bulk readable storage.

### “Quantum proofs make verification omnipotent”

QMA is not known to contain NP in a way that collapses complexity, nor is it known to equal PSPACE. QIP equals PSPACE, but that is an interactive class. MIP* equals RE, but that uses entangled multiprover strategies. Different proof models have sharply different power.

### “Post-quantum means quantum”

Post-quantum cryptography is usually classical cryptography designed to resist quantum attacks. A post-quantum proof system may have entirely classical messages. A QMA proof is quantum information sent to a quantum verifier. They are related by adversary modeling, not identical in object type.

### “Quantum proof is just proof about quantum mechanics”

A proof of a theorem in quantum mechanics is an ordinary mathematical proof about quantum theory. A quantum proof in complexity theory is a quantum state or quantum protocol functioning as evidence for a verifier. The phrase can refer to either in casual speech, but the technical theory is about verification under quantum information constraints.

## 28. Open problems and research directions

1. **QMA versus QCMA.** Are quantum witnesses strictly more powerful than classical witnesses for quantum verifiers? Oracle separations exist, but the unrelativized question remains open.

2. **Quantum PCP.** Is constant-gap local Hamiltonian QMA-hard? What is the correct games analogue? Can gap amplification be made compatible with noncommuting constraints?

3. **Physically natural QMA-completeness.** Which Hamiltonian families are both physically realistic and QMA-complete? Which restrictions force tractability?

4. **Efficient-prover MIP*.** After MIP* = RE, what happens when provers are computationally bounded, finite-dimensional, or otherwise physically constrained?

5. **Practical classical verification.** Can Mahadev-style protocols and related methods be made low-overhead, noise-tolerant, and deployable for real quantum cloud systems?

6. **Quantum-secure Fiat-Shamir and proof composition.** Which noninteractive proof systems remain secure in the quantum random oracle model, and under what exact assumptions?

7. **Post-quantum succinct proofs.** Can we build proof systems that are succinct, transparent, efficiently verifiable, and secure against quantum adversaries without relying on vulnerable algebraic groups?

8. **Quantum witnesses in experimental science.** Can the theory of QMA-like verification inform lab protocols for certifying phases of matter, topological order, or analog simulation outputs?

9. **Proof-carrying quantum data.** What would it mean for a quantum state to carry efficiently checkable certificates of its own preparation history, energy, entanglement structure, or intended computation?

10. **Categorical and compositional accounts.** Quantum proof systems compose imperfectly because measurement, entanglement, and adversarial strategy complicate modular reasoning. A fully compositional theory of quantum verification remains an attractive mathematical target.

## 29. Conclusion: the proof becomes a state, a game, and a security boundary

The phrase “quantum proof” is best understood as a pressure point where proof theory, computation, physics, and cryptography meet.

At its core, a quantum proof is a quantum witness checked by a quantum verifier. This gives QMA and the local Hamiltonian problem. The witness is not a readable string but a state whose evidential force appears through measurement. The canonical complete problem says that verifying quantum proofs is equivalent, in a precise worst-case sense, to estimating the ground-state energy of local quantum systems.

Around that core, quantum interactive proofs turn proof into quantum dialogue. QIP = PSPACE shows that single-prover quantum interaction has a crisp classical space characterization. Entangled multiprover proofs explode the landscape: MIP* = RE shows that proof systems with nonlocal quantum strategies can reach recursively enumerable languages and touch deep operator-algebraic questions.

In cryptography, “quantum-proof” shifts attention from quantum witnesses to quantum adversaries. A proof system, signature, or zero-knowledge protocol must be re-proved secure when the attacker can compute quantumly, query in superposition, and preserve quantum side information. NIST’s post-quantum standards mark the engineering institutionalization of this adversary shift, but proof systems still require careful quantum-security analysis at the protocol level.

The genealogy runs from Cook-Levin to PCPs, from Feynman and Deutsch to QMA, from local Hamiltonians to NLTS, from interactive proofs to MIP* = RE, and from classical zero-knowledge to quantum rewinding and post-quantum cryptographic proofs. The current frontier is not one problem but a family of boundary questions: what can be verified locally, what can be certified classically, what can be hidden from quantum verifiers, what can be secured against quantum adversaries, and what physical evidence can count as proof when evidence itself is quantum.

The deepest lesson is that quantum proof does not abandon rigor. It relocates rigor from static inscription to constrained interaction with physical information. A proof can be a string, but it can also be a state. It can be a derivation, but it can also be a game. It can be a certificate, but it can also be a low-energy configuration. It can be convincing, but only relative to the verifier, the adversary, the channel, the assumptions, and the laws of quantum mechanics.

That is why “quantum proof” is such a fertile phrase: it names the point where proof stops pretending to be immaterial.
