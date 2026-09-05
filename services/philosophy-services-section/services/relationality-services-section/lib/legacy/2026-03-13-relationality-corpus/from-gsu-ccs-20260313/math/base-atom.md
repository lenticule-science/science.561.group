---

name: base-atom
description: "Object: Base Atoms"
---

### Definition — Generation and Iteration {#base-atom}

*How $U_G$ iterates; the fixed point it reaches; the aperiodic tower it produces.*

$U_G$ iterates. Each application closes what has been built so far under one more complete pass,
producing the next level of the tower:
$$
R_0 \subset R_1 \subset R_2 \subset \cdots \subset R = \mathrm{colim}_n\, R_n.
$$
Each $R_n = \mathbf{Sh}(T^{(n)}, J|_{T^{(n)}})$ is a complete relational universe in its own
right. What $R_{n+1}$ adds to $R_n$ is exactly one shell of histories — those of depth $n+1$ — together
with the meanings, language, geometry, and dynamics on those new histories.

#### Convention — Set-Theoretic Foundations {#convention-foundations}

We work inside $R = \mathbf{Sh}(T,J)$ and write $\mathrm{Obj}(R)$ for its class of objects. We
assume a background set theory with classes (Grothendieck universe or NBG-style) in which
$\mathrm{Obj}(R)$ is a class and $P(\mathrm{Obj}(R))$ denotes the class of all subclasses of
$\mathrm{Obj}(R)$. All constructions involving subclasses and their intersections are understood in
this sense. No subtle size issues beyond this convention are used.

#### Definition — Base Atoms

For each history $t \in \mathrm{Ob}(T)$, let $y(t) := \mathrm{Hom}_T(-,t)$ denote the corresponding
representable sheaf, and let $H \in R$ be the distinguished Heyting-modal object. The **atomic class**
is:
$$
A \;:=\; \{\,y(t) \mid t \in \mathrm{Ob}(T)\,\} \;\cup\; \{\,H\,\} \;\subseteq\; \mathrm{Obj}(R).
$$
These are the seeds from which the full relational universe is generated.
