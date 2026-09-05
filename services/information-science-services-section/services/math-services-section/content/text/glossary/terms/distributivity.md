---

introduces: property
description: "The property that one operation spreads over another: a · (b + c) = (a · b) + (a · c). The condition that makes meet and join, or product and sum, interact coherently."
aliases: [distributivity, distributive, distributive law]
applies-to: [binary-operation, lattice, ring]
date-created: 2026-03-31

---

A [binary operation](./binary-operation.md) $\cdot$ distributes over another operation $+$ if:

$$a \cdot (b + c) = (a \cdot b) + (a \cdot c)$$

Multiplication distributes over addition: $3 \times (4 + 5) = 3 \times 4 + 3 \times 5 = 27$. This is why you can expand brackets in arithmetic.

In a [lattice](./lattice.md), distributivity means [meet](./meet.md) distributes over [join](./join.md):

$$a \wedge (b \vee c) = (a \wedge b) \vee (a \wedge c)$$

A [distributive lattice](./distributive-lattice.md) is one where this holds. In a distributive lattice, either distributive law implies the other (meet over join and join over meet). Most lattices encountered in practice are distributive: power sets, chains, the lattice of open sets of a topological space.

Distributivity matters because it ensures the two operations interact predictably. Without it, meet and join can behave in surprising ways — there exist non-distributive lattices where $a \wedge (b \vee c) \neq (a \wedge b) \vee (a \wedge c)$.

In a [ring](./ring.md), multiplication distributes over addition. In a [bilattice](./bilattice.md), the interlacing conditions require each of the four operations (truth-meet, truth-join, knowledge-meet, knowledge-join) to be monotone with respect to both orderings — a strong form of cross-distributivity. The four-valued bilattice $\mathbf{2} \otimes \mathbf{2}$ is distributive in all relevant senses (Fitting 2002).
