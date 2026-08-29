---

name: concatenating
description: "The monoid operation ★ on histories: extending one history by another, which is what makes T a category and H a presheaf."
defines: Concatenating
---

### Definition — History Concatenation {#concatenating}

**History concatenation** is the monoid operation on the history category $T$:
$$
\star \;:\; \mathbb{M}(\Sigma,I) \times \mathbb{M}(\Sigma,I) \;\longrightarrow\; \mathbb{M}(\Sigma,I),
$$
$$
[w] \star [v] \;:=\; [wv],
$$
where $[wv]$ is the commutation equivalence class of the concatenated step sequence $wv$.
The empty history $e$ (§history) is the unit: $e \star t = t = t \star e$.

**Concatenating is governed by ordering.** The prefix ordering (§order)
records the structure that concatenation produces: $t \star u \geq t$ always.
Concatenation produces new histories; the ordering records their relative
positions in $T$.

**Commutativity when commuting.** When $s \perp s'$ (§commutation),
concatenation commutes: $[s] \star [s'] = [s'] \star [s]$ in
$\mathbb{M}(\Sigma,I)$. The commutation relation restricts when the order of
extension does not matter.

**Atomicity.** The atoms $s \in \mathrm{atoms}(T)$ are the unit-length
extensions $[s]$ for single steps $s \in \Sigma$. Every history is
a concatenation of atoms. The atomic decomposition is the basis for the
directed comonad $G_s$ (§sequential-act), which is the universe-level operation
corresponding to this history-level concatenation.
