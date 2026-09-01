---
id: diffraction-spectrum
name: DiffractionSpectrum

---

### Theorem — Diffraction Spectrum of the Quasicrystalline Fixed Point {#diffraction-spectrum}

The spectral measure of the unique ergodic measure on the orbit closure of the
quasicrystalline hypertensor $Q$ (§quasicrystal-hypertensor) is a **pure point measure**
supported on $\mathbb{Z}[\varphi] \cap \mathbb{R}_{>0}$. This is a theorem — both sides
are mathematics, no physical postulates intervene. The relational universe side provides
$Q$ and unique ergodicity; the quasicrystal diffraction theory side provides the pure
point spectrum result; the bridge is the Wiener-Khinchin theorem and the known spectral
theory of Fibonacci substitution systems.

#### The Three Inputs {#diffraction-inputs}

The proof assembles three results, each from a different source:

**Input 1 (internal).** The quasicrystalline hypertensor $Q$ of §quasicrystal-hypertensor
is a fixed point of the golden substitution $\Sigma$. Its orbit closure
$X_Q := \overline{\{T^n Q : n \in \mathbb{Z}^d\}}$ under the translation action of
$\mathbb{Z}^d$ is **minimal** (every orbit is dense) and **uniquely ergodic** (there is
a unique translation-invariant Borel probability measure $\mu$ on $X_Q$). This is
§quasicrystal-hypertensor, part 3.

**Input 2 (classical).** The Fibonacci substitution system has **pure point dynamical
spectrum**. This is a theorem in the spectral theory of substitution dynamical systems,
proved independently by multiple authors: Bombieri and Taylor (1986) gave the initial
argument for Fibonacci tilings; Solomyak (1997) proved it rigorously for all
Pisot-type substitutions (the golden substitution is Pisot since $\varphi$ is a Pisot
number: its algebraic conjugate $-\varphi^{-1}$ has absolute value $< 1$). The dynamical
spectrum of the translation action on $X_Q$ consists entirely of eigenvalues — there is
no continuous spectral component.

**Input 3 (bridge).** For a minimal, uniquely ergodic Delone dynamical system
$(X, \mathbb{Z}^d, \mu)$, the following are equivalent:

(a) the dynamical spectrum of $(X, \mathbb{Z}^d, \mu)$ is pure point,

(b) the diffraction measure $\widehat{\gamma}$ is pure point.

This is the **Dworkin-Baake correspondence** (Baake-Grimm, 2013, Theorem 9.1), which
reduces diffraction to dynamical spectrum via the Wiener-Khinchin theorem. The
Wiener-Khinchin theorem identifies the diffraction measure with the Fourier transform of
the autocorrelation: $\widehat{\gamma} = \mathcal{F}(\gamma)$, where
$$
\gamma(k) \;=\; \lim_{N \to \infty} \frac{1}{|B_N|} \sum_{n \in B_N}
\omega(n)\, \overline{\omega(n + k)}
$$
and the limit exists by unique ergodicity.

#### Theorem {#thm-pure-point}

**Theorem.** The diffraction measure $\widehat{\gamma}_Q$ is pure point. Its Bragg peaks
are located at positions $a + b\varphi$ for integers $a, b \in \mathbb{Z}$ — that is,
the support of $\widehat{\gamma}_Q$ is contained in $\mathbb{Z}[\varphi] \cap \mathbb{R}_{>0}$.

*Proof.*

1. By Input 1, the orbit closure $(X_Q, \mathbb{Z}^d, \mu)$ is minimal and uniquely
   ergodic.

2. By Input 2, the dynamical spectrum of $(X_Q, \mathbb{Z}^d, \mu)$ is pure point.
   (The golden substitution $\Sigma$ of §quasicrystal-hypertensor has substitution matrix
   $M_\Sigma = \bigl(\begin{smallmatrix}1&1\\1&0\end{smallmatrix}\bigr)$ with
   Perron-Frobenius eigenvalue $\varphi$. Since $\varphi$ is Pisot, the result of
   Solomyak (1997) applies.)

3. By Input 3, pure point dynamical spectrum implies pure point diffraction.
   Therefore $\widehat{\gamma}_Q$ is a pure point measure.

4. The eigenvalues of the translation action on $X_Q$ are the
   $\Sigma$-equivariant characters of $\mathbb{Z}^d$. For the Fibonacci substitution,
   these are exactly the elements of $\mathbb{Z}[\varphi]$: a character
   $\chi_\alpha(n) = e^{2\pi i \alpha n}$ is $\Sigma$-equivariant iff
   $\alpha \varphi \equiv \alpha \pmod{\mathbb{Z}}$, which forces
   $\alpha \in \frac{1}{\sqrt{5}} \mathbb{Z}[\varphi]$. Since the Bragg peak positions
   are the eigenvalues, $\mathrm{supp}(\widehat{\gamma}_Q) \subset \mathbb{Z}[\varphi]$.
   Restricting to positive frequencies: $\mathrm{supp}(\widehat{\gamma}_Q) \subset
   \mathbb{Z}[\varphi] \cap \mathbb{R}_{>0}$. $\square$

*Remark — Dense but discrete.* The set $\mathbb{Z}[\varphi] \cap \mathbb{R}_{>0}$ is
dense in $\mathbb{R}_{>0}$: for any $\epsilon > 0$ and any $x > 0$, there exist
$a, b \in \mathbb{Z}$ with $|a + b\varphi - x| < \epsilon$. Yet $\widehat{\gamma}_Q$
is a discrete *measure* — a countable sum of Dirac masses $\sum_i c_i\, \delta_{\alpha_i}$
with $c_i > 0$ and $\alpha_i \in \mathbb{Z}[\varphi]$. The peaks are dense in
$\mathbb{R}$ but form a discrete point measure in the Bohr compactification
$\widehat{\mathbb{R}}_{\mathrm{Bohr}}$. This is the characteristic signature of
quasicrystalline order: neither periodic (finitely many peaks per unit interval) nor
random (continuous spectrum), but aperiodically ordered (countably many peaks, dense in
$\mathbb{R}$, discrete in $\widehat{\mathbb{R}}_{\mathrm{Bohr}}$).

#### What Is New Here {#diffraction-novelty}

Nothing in the proof is new mathematics. The three inputs are, respectively: an internal
construction of this theory (§quasicrystal-hypertensor), a classical theorem in
substitution dynamics (Solomyak 1997), and a classical bridge theorem (Dworkin-Baake via
Wiener-Khinchin). What is new is that the relational universe *provides the setup*:
the substitution $\Sigma$, the fixed point $Q$, and the unique ergodicity are not
external imports but consequences of the history monoid structure and the closure operator.
The diffraction theorem is then a free corollary — the spectral theory of the relational
universe is the spectral theory of its quasicrystalline fixed point, which is classical.
