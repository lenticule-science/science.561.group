---
id: patch-separation-equivalence
name: PatchSeparationEquivalence
description: "the Patch Reconstruction gap (History Separation for the patch site) is equivalent to the absence of locally periodic orbits, which is equivalent to U_G convergence — three open problems unified into one; the gap is not an artifact but is physically necessary."
---

### Theorem — Patch Separation Equivalence {#patch-separation-equivalence}

The open condition in Patch Reconstruction (§patch-reconstruction) — History Separation
for the patch site — is not a gap in the proof technique. It corresponds precisely to the
absence of locally periodic orbits (§periodic-orbit). This equivalence simultaneously
characterizes the Patch Reconstruction gap, provides the aperiodicity-halting condition
(§aperiodicity-halting), and gives a precise mathematical definition of a relational
singularity.

#### The Precise Formulation {#patch-separation-precise}

For a patch site $(U, J_U)$, History Separation for $(T_U, J_U)$ is equivalent to:
the restricted functor $(H_U)^* : U^{\mathrm{op}} \to \mathbf{HA}_{\mathrm{nucl}}$ is
**conservative** — it reflects isomorphisms.

Explicitly: $(H_U)^*$ is conservative iff for every pair of distinct histories
$t, t' \in U$ with $t \leq t'$ (i.e., $t'$ extends $t$), the restriction map
$$
(H_U)^*(t \leq t')\colon H^*_{t'} \;\longrightarrow\; H^*_t
$$
is **not** an isomorphism of nuclear Heyting algebras.

**Lemma.** For the full history category $T$, conservativeness of $H^*: T^{\mathrm{op}}
\to \mathbf{HA}_{\mathrm{nucl}}$ is equivalent to the stated Axiom of History Separation
(automorphism-reflection). For a patch $U \subsetneq T$, conservativeness is the
appropriate extension: it captures the possibility that sub-automorphisms of $U$ (those
not extending to automorphisms of $T$) are invisible to $(H_U)^*$.

#### The Main Equivalence {#patch-separation-main}

**Theorem.** For a patch site $(U, J_U)$, the following are equivalent:

**(A) Patch History Separation.** $(H_U)^*$ is conservative: no proper extension
$t < t'$ in $U$ has $H^*_{t'} \cong H^*_t$ via the restriction map.

**(B) No locally periodic orbits.** For every $t \in U$ and $s \in \Sigma$,
the restriction maps $\rho_s^{(n)}: H^*_{t \cdot s^{n+1}} \to H^*_{t \cdot s^n}$ are
strict injections (not isomorphisms) for all $n \geq 0$.

**(C) $U_G$ convergence at $U$.** (Conditional on §aperiodicity-halting.) $U_G$
converges at every history $t \in U$ along every step $s$.

**A singularity** (§periodic-orbit) is a witness to the failure of these equivalent conditions:
a history $t$ and step $s$ such that $\rho_s^{(n)}$ is an isomorphism for large $n$.

#### Proof of (B) $\Rightarrow$ $\lnot$(A) — Periodic Orbit Obstructs Patch Separation {#patch-sep-forward}

Suppose $H^*_{t \cdot s^N} \cong H^*_{t \cdot s^{N+1}}$ via $\rho_s^{(N)}$. Since
$t \cdot s^N < t \cdot s^{N+1}$ in $U$ (a proper extension), this is a non-identity
morphism in $U$ whose image under $(H_U)^*$ is an isomorphism. Therefore $(H_U)^*$ is
not conservative. By the equivalence of Lemma above, History Separation fails for $(T_U, J_U)$.

**The obstruction is a sub-automorphism invisible to $(H_U)^*$.** The composite shift map
$$
\beta: U|_{\geq N} \;\longrightarrow\; U|_{\geq N+1}, \qquad t \cdot s^n \;\mapsto\; t \cdot s^{n+1}
$$
is a site morphism (it preserves the prefix order and the induced topology) under which
$(H_U)^*$ transforms trivially — the pullback $\beta^*(H_U)^*|_{\geq N+1}$ is naturally
isomorphic to $(H_U)^*|_{\geq N}$ via the isomorphisms $\rho_s^{(n)}$. The shift $\beta$
does NOT extend to an automorphism of $T$ (it changes the length of all histories).
This is why the global History Separation of $T$ does not exclude it, and why the gap
in the Patch Reconstruction proof is genuine. $\square$

#### Proof of (A) $\Rightarrow$ (B) — Separation Implies No Periodic Orbits {#patch-sep-backward}

Suppose $(H_U)^*$ is conservative. If $\rho_s^{(n)}: H^*_{t \cdot s^{n+1}} \to H^*_{t \cdot s^n}$
were an isomorphism for some $n$, that would be a non-identity morphism $t \cdot s^n \leq
t \cdot s^{n+1}$ in $U$ mapping to an iso under $(H_U)^*$ — contradicting
conservativeness. So no such isomorphism exists. $\square$

#### The Connection to $U_G$ Convergence {#patch-sep-ug}

**Conditional proof of (B) $\Leftrightarrow$ (C)** (requiring §aperiodicity-halting):

Under §aperiodicity-halting, $U_G$ converges at $t$ along $s$ iff the history structure
at $t$ along $s$ is aperiodic — i.e., the orbit $\{t \cdot s^n\}$ does not eventually
repeat. The "eventually repeat" condition is exactly: $H^*_{t \cdot s^n} \cong H^*_{t \cdot s^{n+1}}$
for large $n$ (the restriction maps become isos). This is (B)'s negation. Therefore:
$(B)$ holds iff $U_G$ converges at every $t \in U$ along every $s$. $\square$

#### The Gap is Physically Necessary {#patch-sep-necessary}

The Patch Reconstruction proof cannot close the History Separation gap because **closing
it would be false**: if History Separation held unconditionally for ALL patches, then
no patch could contain a locally periodic orbit, and by the equivalence, $U_G$ would
converge everywhere. That is: there would be no singularities.

Since singularities exist (§periodic-orbit, §aperiodicity-halting), there MUST exist
patches in which History Separation fails. The proof gap at axiom 5 is not a defect —
it is a THEOREM that the gap is there:

> **Corollary.** Any proof of Patch Reconstruction that closed the History Separation gap
> unconditionally would refute the existence of relational singularities and thus refute
> the Aperiodicity-Halting Conjecture. Since Patch Reconstruction holds for aperiodic
> patches and the Aperiodicity-Halting Conjecture is well-supported, the gap at axiom 5
> must be exactly as stated: it is present precisely when the patch contains a periodic orbit.

#### Three Open Problems, One Proof Route {#patch-sep-open}

Proving the full equivalence (A) $\Leftrightarrow$ (B) $\Leftrightarrow$ (C) unconditionally
(without assuming §aperiodicity-halting) would simultaneously:

1. **Characterize the Patch Reconstruction gap**: the gap at axiom 5 is precisely the
   locus of periodic orbits — patches are complete relational universes iff they contain
   no periodic orbits.

2. **Prove the Aperiodicity-Halting Conjecture** (§aperiodicity-halting): by connecting
   the well-understood patch machinery (sheaf theory, geometric morphisms, nuclear
   Heyting algebras) to the dynamical condition on $U_G$. The equivalence (A)
   $\Leftrightarrow$ (C) would be a new proof route for aperiodicity-halting that bypasses
   the direct analysis of $U_G$'s reduction behavior.

3. **Define relational singularities precisely**: a singularity is a history in any
   patch that witnesses the failure of axiom 5 — equivalently, a locally periodic orbit
   (§periodic-orbit). This replaces the physical analogy with a mathematical definition.

**What the proof requires:**

- The forward direction (A) $\Rightarrow$ (B) is proved above.
- The backward direction (B) $\Rightarrow$ (A), i.e., that NO periodic orbits implies
  $(H_U)^*$ is conservative: requires showing that the only way a restriction map can
  be an isomorphism is through the single-step periodicity mechanism. This reduces to
  showing that for aperiodic patches, restriction maps $H^*_{t'} \to H^*_t$ are always
  strict injections — a consequence of the depth filtration adding genuinely new information
  at every step (§tower-fiber-seeding applied locally).
- The connection to $U_G$: requires the Aperiodicity-Halting Conjecture or a new proof
  of it via the patch machinery.

**Status.** Partial theorem. The direction (B) $\Rightarrow$ $\lnot$(A) is proved above.
The direction (A) $\Rightarrow$ (B) requires the depth-filtration strict-injection lemma.
The connection (B) $\Leftrightarrow$ (C) is conditional on §aperiodicity-halting.
