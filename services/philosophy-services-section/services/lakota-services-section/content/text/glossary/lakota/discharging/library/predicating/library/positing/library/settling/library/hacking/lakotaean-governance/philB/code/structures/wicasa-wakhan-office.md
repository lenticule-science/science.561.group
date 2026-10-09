---
type: definition
class: office
status: draft
symbol: "M"
depends-on:
  - polity-cell-system
  - office-as-double-settlement
  - wakhan-as-cell-quality
  - seven-rites-as-witness-morphisms
realizes: [office]
title: Wičháša wakȟáŋ office
description: A wičháša wakȟáŋ — sacred-person, holy-person — is the office whose incumbent is qualified to conduct wakȟáŋ-bearing ceremonies and to witness wakȟáŋ-marked cells in their installation.
---

# Wičháša wakȟáŋ office

A *wičháša wakȟáŋ* — sacred-person, holy-person — is the office whose incumbent is qualified to conduct wakȟáŋ-bearing ceremonies and to witness wakȟáŋ-marked cells in their installation.
The office is the substrate-mechanism for the polity's ceremonial-substrate maintenance: without wičháša wakȟáŋ in good standing, the seven rites cannot be conducted; without the seven rites, the wakȟáŋ-marking of new cells lapses; without wakȟáŋ-marked cells, the polity's institutional-substrate (offices, treaties, kin-installations) cannot install.

The office is structurally constitutive: it is *not* one office among many but the office on which several other office-installations and substrate-operations *depend*.
A polity that loses its wičháša wakȟáŋ loses its capacity to install other offices through the proper substrate-route.

## Constituent predications

A wičháša wakȟáŋ office entity $M \in E^\mathrm{off}_\mathrm{lak}$ carries:

- $\langle M, \texttt{incumbent}, a\rangle$ for the holder.
- $\langle M, \texttt{trained-by}, b\rangle$ for the wičháša wakȟáŋ who trained the holder.
  Apprenticeship is structurally required; see below.
- $\langle M, \texttt{rite-eligibility}, R\rangle$ for each of the seven rites the holder is qualified to conduct.
  A wičháša wakȟáŋ is not necessarily eligible for all seven; specific rites can be specializations.
- $\langle M, \texttt{wakhan-dream}, V\rangle$ for the founding vision (typically of a Wakȟáŋ — Wakíŋyaŋ for many wičháša wakȟáŋ, but Wí, Hanwí, Tȟaté, Wóȟpe also recorded) that the office's wakȟáŋ-authorization derives from.

## Installation: apprenticeship plus vision

The wičháša wakȟáŋ installation closure rule has three conditions:

$$\forall a.\quad \langle a, \texttt{apprenticed-to}, b\rangle \geq_k \mathbf{t} \;\wedge\; \langle b, \texttt{is-wicasa-wakhan}\rangle \geq_k \mathbf{t} \;\wedge\; \langle a, \texttt{received-wakhan-vision}, V\rangle \geq_k \mathbf{t} \;\wedge\; w_\mathrm{lak}(V) = 1 \;\Longrightarrow\; \langle M, \texttt{incumbent}, a\rangle \geq_k \mathbf{t}$$

Three conditions:

1. **Apprenticeship** to an existing wičháša wakȟáŋ.
  The training-cell is a substrate-fact; ad-hoc self-appointment does not fire the installation rule.
2. **The trainer is in good standing.** $\langle b, \texttt{is-wicasa-wakhan}\rangle$ is a cell about the trainer; if the trainer's cell has dropped (death, virtue-failure), the apprenticeship-cell does not propagate the installation.
3. **A wakȟáŋ-dream of the trainee's own.** The trainee must have received their own wakȟáŋ-vision (haŋbléčheyapi or unsolicited dream).
  The training transmits the *practice*; the wakȟáŋ-vision installs the *substrate-authorization*.

This is a *self-replicating chain*: the office requires an existing office-holder to install the next office-holder.
The chain bottoms out at the original wakȟáŋ-visions of the cosmogonic period — the office is grounded ultimately in the Wakȟáŋ-beings themselves giving visions, not in any human authorization.

## What the wičháša wakȟáŋ does

The office's substrate operations:

- **Conducting the seven rites.** Each rite is a witness-bearing morphism (cf. [seven-rites-as-witness-morphisms](../../../../../../../philosophy/theories/predicated-philosophy/theories/predicated-lakotaean-philosophy/morphisms/seven-rites-as-witness-morphisms.md)); the wičháša wakȟáŋ is the morphism's structural-witness, and the morphism does not fire properly without them.
- **Witnessing huŋkápi adoption.** The kin-cell-installation of [huŋkápi](../../../../../../../philosophy/theories/predicated-philosophy/theories/predicated-lakotaean-philosophy/morphisms/hunka-as-kin-cell-installation.md) fires only when a wičháša wakȟáŋ is present.
  Adoption is a wakȟáŋ-bearing operation.
- **Witnessing treaty.** A wakȟáŋ-bearing inter-polity treaty requires a wičháša wakȟáŋ as witness; see [treaty-as-wakhan-declaration](../transformers/treaty-as-wakhan-declaration.md).
- **Witnessing naca-installation.** The induction-ceremony component of office-installation requires a wičháša wakȟáŋ to conduct it; this is what makes the induction-cell wakȟáŋ-marked.
- **Bearing the pipe and bundles.** Pipe-keeping is the carry of substrate-bearing artifacts; the keeper is typically a wičháša wakȟáŋ or a designated successor under wičháša wakȟáŋ supervision.
- **Conducting the wiping-of-tears and other restorative rites.** The polity-substrate-restoration after death or major loss requires wičháša wakȟáŋ conduct.

The wičháša wakȟáŋ is *not* a political leader.
The office holds substrate-authority over the ceremonial-substrate, not over polity-decisions.
The clean separation from naca and wakíčhuŋza offices is structural: the same agent can be both naca and wičháša wakȟáŋ (it is not uncommon historically), but the *offices* are distinct, and the agent's authority in each is non-fungible.

## Loss of office and substrate-emergency

The office can be lost by:

- **Death**: the incumbent-cell drops; if the trained-apprentice is in place, the chain continues; if not, the polity loses a wičháša wakȟáŋ.
- **Virtue-failure or violation**: a wičháša wakȟáŋ who conducts ceremony improperly or who violates the discipline can have their is-wicasa-wakhan cell drop; this is a substrate-emergency, since downstream installations may then be in question.
- **Forced disappearance**: the historical suppression of the seven rites under federal Indian policy (1880s–1934, with continuing pressure thereafter) made apprenticeship and dream-conduct difficult; the office's continuation across this period was a substrate-emergency of polity-scale, sustained by wičháša wakȟáŋ who continued in secret.

The polity-level substrate-condition: *if there is no wičháša wakȟáŋ in good standing for a generation, the wakȟáŋ-marked cells installable through their witness fall out of the firing-scope of the polity's installation-rules*.
The downstream effect is that institutional offices cannot install through the proper-substrate route; the polity falls back on non-wakȟáŋ-marked substitutes (e.g., the IRA-elected tribal government), which fire under a different closure-rule subsystem and have different downstream cohomological behavior.

This is why the contemporary reclamation of the seven rites and the renewed training of wičháša wakȟáŋ — a major focus of post-1978 work after the American Indian Religious Freedom Act — is *polity-scale substrate-restoration work*, not merely religious revival in the Western category.

## Sources

- Walker 1980, *Lakota Belief and Ritual* — the wičháša wakȟáŋ apprenticeship and the seven rites' conduct.
- Powers, *Oglala Religion* (1977) — wičháša wakȟáŋ in nineteenth- and twentieth-century Oglala practice.
- Brown, *The Sacred Pipe* (1953) — Black Elk's account of the seven rites and the conducting role.
- White Hat, *Life's Journey — Zuya* (2012) — contemporary Sicangu wičháša wakȟáŋ training and the post-AIRFA reclamation.
- Estes, *Our History is the Future* (2019) — the substrate-emergency of the suppression period and the contemporary reconstitution.
- Vine Deloria Jr., *The World We Used to Live In* (2006) — the structural role of wičháša wakȟáŋ in maintaining the relational substrate.
