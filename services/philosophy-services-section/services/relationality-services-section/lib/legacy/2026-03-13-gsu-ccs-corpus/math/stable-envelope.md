---
id: stable-envelope
name: StableEnvelope
description: "The stable envelope Env(a) = ¬σ(¬a) ∧ ¬Δ(¬a) is in H* whenever σ and Δ preserve ⊥; this follows from the nucleus negation lemma without any frame-map conditions."
---

### Definition — Stable Envelope {#stable-envelope}

**Motivation.** The fixed fiber $H_t^\ast = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$
(§fixed-fiber) is the sub-Heyting algebra of doubly stable propositions at history $t$. Given any
proposition $a \in H_t$, the **stable envelope** is its "observable content" — the largest
doubly-stable proposition entailed by $a$.

#### The j-interior {#def-j-interior}

For a nucleus $j : H_t \to H_t$, the **$j$-interior** is
$$
i_j(a) \;:=\; j(\neg_t a) \Rightarrow_t \bot_t \;=\; \neg_t(j(\neg_t a)).
$$
This is the largest element of $\mathrm{Fix}(j)$ below $a$, given $j(\bot_t) = \bot_t$ (see below).

#### Lemma — Nucleus Negation Fixed {#nucleus-neg-fixed}

**Lemma.** If $j(\bot_t) = \bot_t$, then $j(a \Rightarrow_t \bot_t) = a \Rightarrow_t \bot_t$ for all $a \in H_t$.

**Proof.**
By extensivity, $j(a \Rightarrow \bot) \geq a \Rightarrow \bot$. For the reverse:
$$
j(a) \wedge j(a \Rightarrow \bot) = j(a \wedge (a \Rightarrow \bot)) = j(\bot) = \bot.
$$
Since $j(a) \geq a$ (extensivity): $a \wedge j(a \Rightarrow \bot) \leq j(a) \wedge j(a \Rightarrow \bot) = \bot$.
So $j(a \Rightarrow \bot) \leq a \Rightarrow \bot$, giving equality. $\square$

**Corollary.** If $j(\bot_t) = \bot_t$, then $i_j(a) = j(a \Rightarrow \bot) \Rightarrow \bot = (a \Rightarrow \bot) \Rightarrow \bot = \neg_t\neg_t a$ for all $a$ — independent of $j$.

#### Definition — Stable Envelope {#def-stable-envelope}

The **stable envelope** of $a \in H_t$ is:
$$
\mathrm{Env}_t(a) \;:=\; i_{\sigma_t}(a) \wedge i_{\Delta_t}(a) \;=\; \neg_t\sigma_t(\neg_t a) \wedge \neg_t\Delta_t(\neg_t a).
$$

**Remark on equivalent formulas.** Under the hypotheses $\sigma_t(\bot_t) = \bot_t$ and $\Delta_t(\bot_t) = \bot_t$, the Nucleus Negation Lemma gives $i_{\sigma_t}(a) = i_{\Delta_t}(a) = \neg_t\neg_t a$. All three formulas coincide:
$$
i_{\sigma_t}(a) \wedge i_{\Delta_t}(a) \;=\; \neg_t\neg_t a \;=\; \neg_t(\sigma_t(\Delta_t(\neg_t a))).
$$
The composite formula $i_{\pi_t}(a) = \neg_t(\sigma_t(\Delta_t(\neg_t a)))$ using the joint projection $\pi_t = \sigma_t \circ \Delta_t$ (§joint-projection) is an equivalent definition under these hypotheses.

#### The Joint Projection as Nucleus {#def-composite-nucleus}

**Lemma (Joint Projection Nucleus).** Let $(\sigma_t, \Delta_t)$ be a BiNucleus on $H_t$
(§fiber-doctrine). The joint projection (§joint-projection)
$$
\pi_t \;:=\; \sigma_t \circ \Delta_t
$$
is itself a nucleus on $H_t$, and $\mathrm{Fix}(\pi_t) = H_t^\ast$.

**Proof.**
*Extensive:* $\pi_t(a) = \sigma_t(\Delta_t(a)) \geq \Delta_t(a) \geq a$. ✓

*Idempotent:* Using commutativity $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$
(§fiber-doctrine) and idempotency of each nucleus:
$$
\pi_t(\pi_t(a)) = \sigma_t(\Delta_t(\sigma_t(\Delta_t(a)))) = \sigma_t(\sigma_t(\Delta_t(\Delta_t(a)))) = \sigma_t(\Delta_t(a)) = \pi_t(a). \;\checkmark
$$

*Meet-preserving:* $\pi_t(a \wedge b) = \sigma_t(\Delta_t(a \wedge b)) = \sigma_t(\Delta_t(a) \wedge \Delta_t(b)) = \sigma_t(\Delta_t(a)) \wedge \sigma_t(\Delta_t(b)) = \pi_t(a) \wedge \pi_t(b)$. ✓

*$\mathrm{Fix}(\pi_t) = H_t^\ast$:*
- ($\supseteq$) If $x \in H_t^\ast$, then $\pi_t(x) = \sigma_t(\Delta_t(x)) = \sigma_t(x) = x$. ✓
- ($\subseteq$) If $\pi_t(x) = x$, i.e., $\sigma_t(\Delta_t(x)) = x$. Since both nuclei are
  extensive: $x = \sigma_t(\Delta_t(x)) \geq \Delta_t(x) \geq x$, so all terms are equal.
  Therefore $\Delta_t(x) = x$ and $\sigma_t(x) = \sigma_t(\Delta_t(x)) = x$. $\square$

#### Proposition — Universal Property {#stable-envelope-universal}

**Proposition.** Assume $\sigma_t(\bot_t) = \bot_t$ and $\Delta_t(\bot_t) = \bot_t$.

1. $\mathrm{Env}_t(a) \in H_t^\ast$.
2. For any $x \in H_t^\ast$ with $x \leq a$: $x \leq \mathrm{Env}_t(a)$.

If additionally $H_t$ is Boolean ($\neg_t\neg_t b = b$ for all $b$), then:

3. $\mathrm{Env}_t(a) \leq a$, so $\mathrm{Env}_t(a) = \max\{x \in H_t^\ast \mid x \leq a\}$.

**Proof.**

(1) By the Nucleus Negation Lemma, $\sigma_t$ fixes $a \Rightarrow \bot$ and $\Delta_t$ fixes $a \Rightarrow \bot$.
    Therefore $i_{\sigma_t}(a) = \sigma_t(a \Rightarrow \bot) \Rightarrow \bot = (a \Rightarrow \bot) \Rightarrow \bot$.

    *Diagonal components* (each interior is fixed by its own nucleus):
    Since $\sigma_t(a \Rightarrow \bot) \in \mathrm{Fix}(\sigma_t)$ (by idempotence) and $\sigma_t(\bot) = \bot$,
    we have $i_{\sigma_t}(a) = \sigma_t(a \Rightarrow \bot) \Rightarrow \bot \in \mathrm{Fix}(\sigma_t)$
    by closure of $\mathrm{Fix}(\sigma_t)$ under $\Rightarrow$ (§nuclear-heyting-algebra). Similarly $i_{\Delta_t}(a) \in \mathrm{Fix}(\Delta_t)$.

    *Cross components* (each interior is also fixed by the other nucleus):
    $i_{\sigma_t}(a) = (a \Rightarrow \bot) \Rightarrow \bot$. Applying the Nucleus Negation Lemma to $\Delta_t$
    with input $a \Rightarrow \bot$: $\Delta_t((a \Rightarrow \bot) \Rightarrow \bot) = (a \Rightarrow \bot) \Rightarrow \bot$.
    So $i_{\sigma_t}(a) \in \mathrm{Fix}(\Delta_t)$. Symmetrically $i_{\Delta_t}(a) \in \mathrm{Fix}(\sigma_t)$.

    Therefore $i_{\sigma_t}(a), i_{\Delta_t}(a) \in H_t^\ast$, and their meet $\mathrm{Env}_t(a) \in H_t^\ast$
    (since $H_t^\ast$ is closed under $\wedge$). $\square$

(2) Let $x \in H_t^\ast$ with $x \leq a$. Then $x \wedge \neg_t a = \bot_t$.
    Applying $\sigma_t$ (meet-preserving, $\sigma_t(\bot_t) = \bot_t$, $\sigma_t(x) = x$):
    $x \wedge \sigma_t(\neg_t a) = \bot_t$. So $x \leq \neg_t\sigma_t(\neg_t a) = i_{\sigma_t}(a)$.
    Symmetrically $x \leq i_{\Delta_t}(a)$. Therefore $x \leq \mathrm{Env}_t(a)$. $\square$

(3) Since $\sigma_t$ is extensive, $\sigma_t(\neg_t a) \geq \neg_t a$.
    Applying $\neg_t$ (which reverses order in a Boolean algebra):
    $\neg_t\sigma_t(\neg_t a) \leq \neg_t\neg_t a = a$. So $i_{\sigma_t}(a) \leq a$, and similarly
    $i_{\Delta_t}(a) \leq a$. Therefore $\mathrm{Env}_t(a) \leq a$. $\square$

**Remark on deflationarity.** In an arbitrary Heyting algebra, the interior $i_j(a) \leq a$
does not follow from the nucleus axioms alone. It holds when $H_t$ is Boolean (as in (3) above)
or more generally when $H_t$ is a frame and $\neg_t$ behaves as in a locale. Deflationarity
is an additional hypothesis where needed.

#### Lemma — Factorization of Invariant Maps {#stable-envelope-factorization}

Let $f : H_t \to K$ be a map to any Heyting algebra $K$ satisfying
$f(\sigma_t(a)) = f(a)$ and $f(\Delta_t(a)) = f(a)$ for all $a \in H_t$.
Then $f(\mathrm{Env}_t(a)) = f(a)$ for all $a$, and $f$ factors through the
stable envelope. Consequently, $f$ factors uniquely through
$H_t^\ast$ via $\bar{f} : H_t^\ast \to K$.

**Status.** The factorization follows from (2): $f$ is $\sigma_t$- and $\Delta_t$-equivariant,
so $f$ depends only on the $H_t^\ast$-component; the universal property then gives the factorization.
The uniqueness of $\bar{f}$ requires showing the restriction $f|_{H_t^\ast}$ determines $f$
completely, which holds when every element of $H_t$ is below some element of $H_t^\ast$ — i.e.,
when the stable envelope of every element exists and is reached by $f$.
