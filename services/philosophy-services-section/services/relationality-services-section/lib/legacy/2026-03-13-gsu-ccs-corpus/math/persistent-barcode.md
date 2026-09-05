---
id: persistent-barcode
name: PersistentBarcode

---

### Theorem — Persistent Barcode of the Depth Filtration {#persistent-barcode}

The cohomological tunneling data of §cohomological-tunneling admits a natural description
as a **persistent barcode** on the depth filtration. Each trapped mode generates a bar;
convergence to the fixed point $R = U_G(R)$ is equivalent to finiteness of the barcode;
and the tunneling rate conjecture translates into an inverse proportionality between bar
length and Fischer-Rao curvature.

#### The Persistent Module {#barcode-module}

The depth filtration (§depth-filtration) gives a tower of inclusions of sheaf toposes:
$$
R_0 \hookrightarrow R_1 \hookrightarrow R_2 \hookrightarrow \cdots \hookrightarrow R.
$$
Applying sheaf cohomology with coefficients in the stable mode sheaf $E_0$ produces a
**persistence module** — a diagram of $K$-modules indexed by $\mathbb{N}$:
$$
H^1(R_0, E_0) \xleftarrow{\;f_0\;} H^1(R_1, E_0) \xleftarrow{\;f_1\;} H^1(R_2, E_0)
\xleftarrow{\;f_2\;} \cdots
$$
where $f_n$ is the restriction map induced by the inclusion $R_n \hookrightarrow R_{n+1}$.

By the structure theorem for persistence modules over a PID (Edelsbrunner-Letscher-Zomorodian,
2002), this persistence module decomposes as a direct sum of **interval modules**:
$$
\bigoplus_{i \in I} K[b_i, d_i),
$$
where $K[b, d)$ is the module that is $K$ on the interval $[b, d)$ and zero outside.
The multiset $\{[b_i, d_i)\}_{i \in I}$ is the **barcode** of the depth filtration.

#### Interpretation of Bars {#barcode-interpretation}

Each bar $[b_i, d_i)$ in the barcode represents a cohomological obstruction class that
is **born** at depth $b_i$ and **dies** at depth $d_i$:

- **Birth** ($n = b_i$): a new nonzero class $[\omega_i] \in H^1(R_{b_i}, E_0)$
  appears — a globally inconsistent pattern of stable modes that cannot be assembled
  into a coherent section. This is a trapped mode acquiring a nonzero obstruction class
  in the sense of §cohomological-tunneling.

- **Death** ($n = d_i$): the class $[\omega_i]$ becomes zero in $H^1(R_{d_i}, E_0)$
  — the obstruction is resolved. In the tunneling picture, the trapped mode has jumped
  to the stable layer $E_{t,0}$: the cohomological inconsistency that forced it to
  tunnel has been absorbed by the additional data available at depth $d_i$.

- **Bar length** ($\ell_i = d_i - b_i$): the number of depth steps the obstruction
  persists before being resolved. Long bars represent deeply entrenched obstructions;
  short bars represent obstructions quickly resolved by the next few depth levels.

#### Theorem — Fixed Point Iff Finite Barcode {#thm-finite-barcode}

**Theorem.** The depth tower converges to the fixed point $R = U_G(R)$ if and only if
the barcode $\{[b_i, d_i)\}$ is **finite**: every bar has finite length (no bar extends
to $d_i = \infty$), and the total number of bars is finite.

*Proof.*

($\Rightarrow$) Assume $R = U_G(R)$. By the convergence unification
(§convergence-unification), $H^1(T^{(n)}, J^{(n)};\, E_0) = 0$ for all sufficiently
large $n$. This means: (a) no new bars are born after some depth $N$ (no new obstruction
classes appear), and (b) every existing bar has died by depth $N$ (all obstruction classes
have been resolved). The barcode is finite.

($\Leftarrow$) Assume the barcode is finite. Then for large enough $n$, all bars have
died: $H^1(R_n, E_0) = 0$. By the convergence unification (§convergence-unification),
this implies $U_G$ converges to its fixed point. $\square$

#### Conjecture — Bar Length and Fischer-Rao Curvature {#barcode-curvature}

**Conjecture.** The length $\ell_i = d_i - b_i$ of the $i$-th bar is inversely
proportional to the Fischer-Rao curvature of $\mathcal{M}_n$ (§fischer-rao-metric) at
the point corresponding to the obstruction class $[\omega_i]$:
$$
\ell_i \;\propto\; \kappa_{\mathrm{FR}}([\omega_i])^{-1},
$$
where $\kappa_{\mathrm{FR}}$ is the sectional curvature of the Fischer-Rao metric on
the space of probability sheaves over $(\mathcal{M}_{b_i}, K_{b_i})$.

*Rationale.* The tunneling rate conjecture of §cohomological-tunneling states that
tunneling is frequent in high-curvature regions and rare in flat regions. In the barcode
picture:

- **High curvature** $\Rightarrow$ frequent tunneling $\Rightarrow$ obstructions are
  quickly resolved $\Rightarrow$ short bars.

- **Low curvature** (near the fixed point) $\Rightarrow$ rare tunneling $\Rightarrow$
  obstructions persist for many depth steps $\Rightarrow$ long bars.

The inverse proportionality $\ell \propto \kappa^{-1}$ is the barcode translation of the
rate-curvature correspondence. It also explains why the last obstructions to converge are
the hardest: near the fixed point the curvature is small, so the final bars are long.

#### Remark — Relation to Step Cohomology {#barcode-step-cohomology}

The step cohomology groups $H^n_\mathrm{step}(k)$ of §step-cohomology measure the
*new* structure at each depth step. In barcode terms:

- $H^0_\mathrm{step}(k)$ counts the bars *born* at depth $k$ (new obstruction classes).
- $H^1_\mathrm{step}(k)$ counts the bars that are *alive* at depth $k$ but were born
  earlier (persistent obstructions from previous levels).

The Zeno Settling conjecture (§zeno-settling) — that $H^1(\mathcal{H}) \neq 0$ at the
colimit — translates to: the barcode has at least one bar of infinite length, i.e., at
least one obstruction class that is never resolved. The convergence unification
(§convergence-unification) says this cannot happen if $(T, I)$ is aperiodic. Thus the
Zeno Settling conjecture, if true, would require either periodicity (contradicting
§aperiodicity) or a failure of the finite-depth approximation.

**Status.** Draft. The persistent module decomposition follows from the standard
structure theorem. The equivalence of finite barcode with convergence is a restatement
of the convergence unification in the language of persistence. The bar-length/curvature
conjecture is new and requires establishing a quantitative relationship between the
Fischer-Rao sectional curvature and the lifetime of $H^1$ classes.
