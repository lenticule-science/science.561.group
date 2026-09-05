---

name: modal-stability
description: "Modal Stability"
---

### Definition — Modal Stability {#modal-stability}

The fixed fiber $H_t^*$ (§fixed-fiber) is defined algebraically: it is the
sub-Heyting-algebra of elements fixed by both nuclei. The **quality** of
stability is the language-level characterization: what it means, in the
terms of FiberNuclearLanguage, for a proposition to be stable.

#### Modal Characterization {#stability-modal}

A proposition $a \in H_t$ is **stable** — i.e., $a \in H_t^*$ — if and only
if it satisfies two modal conditions simultaneously:

$$
\sigma_t(a) = a \quad \text{and} \quad \Delta_t(a) = a.
$$

In the modal language of §modal-logic (topos-theoretic convention):

- $\sigma_t(a) = a$ says $\square_\sigma a = a$: the saturation of $a$ adds
  nothing. The proposition is already **sub-history-determined** — its meaning
  is fully specified by what it looks like from shorter histories.

- $\Delta_t(a) = a$ says $\square_\Delta a = a$: the transfer closure of
  $a$ adds nothing. The proposition is already **extension-witnessed** — it
  is present in every one-step transfer of $t$.

A stable proposition is one that has been settled from both directions: looking
backward (saturation) and looking forward (transfer) both confirm it.
Nothing about the proposition changes under either settling operator. This is
the quality that distinguishes $H_t^*$ from $H_t$: not a structural property
(both are Heyting algebras) but a modal one (elements of $H_t^*$ are modally
inert).

#### The Stable Fragment of FiberNuclearLanguage {#stable-fragment}

Define the **stable fragment** $\text{FiberNuclearLanguage}^*(t)$ at history $t$ as the set of
FiberNuclearLanguage terms whose denotation lands in $H_t^*$:

$$
\text{FiberNuclearLanguage}^*(t)
\;:=\;
\bigl\{\, \varphi \in \text{FiberNuclearLanguage}
\;\big|\;
\llbracket \varphi \rrbracket_t \in H_t^* \,\bigr\}.
$$

By the soundness theorem (§soundness), $\llbracket - \rrbracket_t$ is a
$\mathbf{HA_{nucl}}$ homomorphism, so:

- $\llbracket \mathsf{Saturate}(\varphi) \rrbracket_t = \sigma_t(\llbracket \varphi \rrbracket_t)$.
  If $\llbracket \varphi \rrbracket_t \in H_t^*$, then
  $\llbracket \mathsf{Saturate}(\varphi) \rrbracket_t = \llbracket \varphi \rrbracket_t$.
  Conversely, $\llbracket \mathsf{Saturate}(\varphi) \rrbracket_t \in \mathrm{Fix}(\sigma_t)$
  for any $\varphi$.

- The same holds for $\mathsf{Transfer}$ and $\Delta_t$.

Therefore: a term $\varphi$ denotes a stable proposition at $t$ if and only if
$\mathsf{Saturate}(\varphi)$ and $\mathsf{Transfer}(\varphi)$ both denote the same
element as $\varphi$ at $t$. Syntactically, $\text{FiberNuclearLanguage}^*(t)$ consists of
terms that are **modally saturated** — applying either modal operator is
provably the identity.

#### The Stable Envelope as Quality Extraction {#quality-extraction}

The stable envelope $\mathrm{Env}_t(a)$ (§stable-envelope) is the **quality
extraction** operation: given any proposition $a \in H_t$, it returns the
largest stable proposition entailed by $a$. This is the "observable content"
of $a$ — the part of $a$ that survives both settling operators.

In quality terms: $\mathrm{Env}_t$ extracts what can be **stably said** about
$a$. Two propositions $a, b \in H_t$ with $\mathrm{Env}_t(a) = \mathrm{Env}_t(b)$
are **quality-equivalent**: they differ only in their unsettled content. Any
measurement invariant under both nuclei reads the same value for $a$ and $b$.

#### Remark — Stability as a Quality, Not a Property {#stability-remark}

Stability is not a binary property that a proposition either has or lacks. It
is a **quality** — a mode of being that admits degrees. The joint projection
$\pi_t = \sigma_t \circ \Delta_t$ (§joint-projection) sends
every proposition to its stable form, and the active envelope $\mathrm{Env}_t$
extracts the stable content without inflating. Between $a$ and
$\mathrm{Stab}_t(a)$ lies a gap — the **instability** of $a$ — that measures
how far $a$ is from being settled. The quality of stability is the quality of
having no such gap.
