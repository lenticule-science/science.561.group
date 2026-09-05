---

name: transfer-beck-chevalley
description: "the Beck-Chevalley condition for the transfer nucleus holds for the nuclei themselves (via reindexing) but fails for Fix(Transfer) under pullback — the gap is controlled by the set of steps captured by the extension."
---

### Theorem — Transfer–Beck–Chevalley: Gap and Resolution {#transfer-beck-chevalley}

The Beck-Chevalley condition for the transfer nucleus $\Delta$ fails in a
controlled way along the depth tower. This unit identifies the gap precisely and
proves a laxified version that holds in all cases.

#### Setup: The Diamond Square {#transfer-bc-setup}

The Diamond Lemma for the history monoid $(T, I)$ provides, for $s \perp t_0$ and any
prefix $t_0 \leq t$, a commuting square in $T$:
$$
\begin{CD}
t_0 @>{i_{s,t_0}}>> s \star t_0 \\
@V{i_{t_0,t}}VV @VV{i_{t_0', t'}}V \\
t @>>{i_{s,t}}> s \star t
\end{CD}
$$
where $t' = s \star t$ and $t_0' = s \star t_0$. Applying $H$ contravariantly:
$$
H(i_{t_0,t}) \circ H(i_{s,t}) \;=\; H(i_{s,t_0}) \circ H(i_{t_0',t'}).
$$
The restriction maps **commute** in this diamond.

The **Beck-Chevalley condition for $\Delta$** would say that the diagonal maps also
commute with the transfer nuclei:
$$
\Delta_{t_0} \circ H(i_{t_0,t}) \;=\; H(i_{t_0,t}) \circ \Delta_t
\quad\text{(BC-}\Delta\text{)}.
$$
This is exactly the nucleus preservation condition of §reindexing, and it **holds** by
construction. So the standard BC condition is not the issue.

#### The Real Gap: Fix(Δ) Does Not Pull Back {#transfer-bc-gap}

The genuine gap concerns the **fixed-point algebra** $\mathrm{Fix}(\Delta_t)$ and how
it transforms under the diamond. The naïve expectation:
$$
H(i_{t_0,t})^{-1}\!\bigl(\mathrm{Fix}(\Delta_{t_0})\bigr) \;\overset{?}{=}\; \mathrm{Fix}(\Delta_t).
$$
This fails: $\mathrm{Fix}(\Delta_t)$ is in general **strictly smaller** than the preimage
of $\mathrm{Fix}(\Delta_{t_0})$ under $H(i_{t_0,t})$.

**Why.** By definition:
$$
\mathrm{Fix}(\Delta_t) \;=\; \bigcap_{s \perp t} \mathrm{image}(H(i_{s,t})),
\qquad
\mathrm{Fix}(\Delta_{t_0}) \;=\; \bigcap_{s \perp t_0} \mathrm{image}(H(i_{s,t_0})).
$$
The commutation sets differ: $\{s : s \perp t\} \subseteq \{s : s \perp t_0\}$ when
$t_0 \leq t$ (a longer history $t$ has captured more steps, reducing the set of
steps still commuting with it). So $\mathrm{Fix}(\Delta_t)$ intersects over a
**smaller** family of images than $\mathrm{Fix}(\Delta_{t_0})$.

The preimage $H(i_{t_0,t})^{-1}(\mathrm{Fix}(\Delta_{t_0}))$ consists of elements $a \in H_t$
whose restriction to $t_0$ is $\Delta_{t_0}$-stable. But an element can be stable at
$t_0$ (witnessed by transfers of $t_0$) without being stable at $t$ (which requires
transfers by steps commuting with the LONGER history $t$, a more restrictive
condition).

**The $\Delta$-BC gap** is thus:
$$
\mathrm{Fix}(\Delta_t) \;\subsetneq\;
H(i_{t_0,t})^{-1}\!\bigl(\mathrm{Fix}(\Delta_{t_0})\bigr).
$$
An element $a \in H_t$ can restrict to a $\Delta_{t_0}$-fixed element of $H_{t_0}$
while not itself being $\Delta_t$-fixed — because $a$ may lack witnesses for the
steps that became "captured" (dependent on $t$) as we extended from $t_0$ to $t$.

#### Laxified Beck-Chevalley {#transfer-bc-lax}

**Theorem — Lax Transfer-BC.** For $f = i_{t_0,t} : t_0 \hookrightarrow t$ a prefix
morphism, there is a natural inclusion:
$$
H(f)(\mathrm{Fix}(\Delta_t)) \;\subseteq\; \mathrm{Fix}(\Delta_{t_0}).
$$

*Proof.* This is the compatibility with fixed fibers from §reindexing: nucleus preservation
$H(f) \circ \Delta_t = \Delta_{t_0} \circ H(f)$ implies that if $\Delta_t(a) = a$
then $\Delta_{t_0}(H(f)(a)) = H(f)(\Delta_t(a)) = H(f)(a)$. $\square$

So $H(f)$ maps $\mathrm{Fix}(\Delta_t) \to \mathrm{Fix}(\Delta_{t_0})$ but is not
surjective onto $\mathrm{Fix}(\Delta_{t_0})$: the image is the subsystem of
$\mathrm{Fix}(\Delta_{t_0})$ that has witnesses for the larger step set $\{s : s \perp t\}$.

**Theorem — Exact BC along commutation-preserving extensions.**
If the extension $f : t_0 \to t$ is by steps all of which are **mutually
commuting** (i.e., the steps from $t_0$ to $t$ belong to a set $A$ with $A \perp
A$ and the commutation relation $I$ is unchanged for all external steps $s \perp t_0$
that are also $s \perp t$), then:
$$
H(f)^{-1}\!\bigl(\mathrm{Fix}(\Delta_{t_0})\bigr) \;=\; \mathrm{Fix}(\Delta_t).
$$

*Proof sketch.* In this case $\{s : s \perp t\} = \{s : s \perp t_0\} \setminus A$
(the steps captured by going from $t_0$ to $t$ are exactly $A$, and by assumption
$A \perp A$ so no cross-commutation is lost). The image condition for $\mathrm{Fix}(\Delta_t)$
is the image condition for $\mathrm{Fix}(\Delta_{t_0})$ with the additional requirement
of having witnesses for each $a \in A$. But since $f : t_0 \to t$ is an isomorphism
of histories composed of the $A$-steps, and the $A$-steps are captured by $H(f)$ itself,
every $a \in H(f)^{-1}(\mathrm{Fix}(\Delta_{t_0}))$ already has an implicit witness from
the $A$-steps via the extension $H(f)$. $\square$

#### The Independence-Violation Measure {#transfer-bc-measure}

**Definition.** For a prefix morphism $f : t_0 \to t$, the **transfer-BC defect**
is the set of steps:
$$
\mathrm{Def}(f) \;:=\; \{s \in \Sigma \mid s \perp t_0 \text{ but } s \not\perp t\},
$$
the steps "captured" by the extension. The BC gap has size proportional to
$|\mathrm{Def}(f)|$: there are $|\mathrm{Def}(f)|$ commuting-step conditions
that $\mathrm{Fix}(\Delta_t)$ imposes but $\mathrm{Fix}(\Delta_{t_0})$ does not.

**Corollary.**
- $\mathrm{Def}(f) = \emptyset$ iff BC holds exactly (Exact BC theorem above).
- $|\mathrm{Def}(f)| = k$ means the BC gap is controlled by $k$ missing witnesses.

In the aperiodic case (§aperiodicity), the history $t$ has no cyclically repeated
steps, so $\mathrm{Def}(f)$ is always bounded by the length of the extension.
In the asymptotic tower (as depth $n \to \infty$), $|\mathrm{Def}(f)|$ stabilizes
because the set of commuting steps of a long history stabilizes (eventually only
globally commuting steps remain). This gives BC recovery in the limit:
$$
\lim_{n \to \infty} \bigl|H(f_n)^{-1}(\mathrm{Fix}(\Delta_{t_0^{(n)}})) \setminus \mathrm{Fix}(\Delta_{t^{(n)}})\bigr| \;=\; 0
$$
when the depth tower is aperiodic and the extension $f_n$ is along a fixed step.

**Interpretation.** The $\Delta$-BC gap is not a defect of the construction — it is
the mathematical signature of **time-asymmetry**: as a history deepens, it forecloses
possible transfers, making transfer-stability a strictly stronger condition
at longer histories. The failure of exact BC quantifies how much "future optionality"
is lost at each step of the depth tower.
