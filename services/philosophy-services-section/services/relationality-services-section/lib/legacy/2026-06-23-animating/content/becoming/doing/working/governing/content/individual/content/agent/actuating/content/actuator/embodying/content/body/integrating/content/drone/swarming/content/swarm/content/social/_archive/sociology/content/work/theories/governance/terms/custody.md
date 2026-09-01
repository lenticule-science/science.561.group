---

name: "Custody"
description: "A Custody is a triple (H, O, [t₀,t₁)) — a holder H who possesses an object O during a bounded interval [t₀,t₁) with a duty of care for O but without ownership of O. The defining structure: possession without title; the holder may use O only as necessary to fulfill the custodial purpose; accountability for O's condition runs from t₀ to t₁. The duty of care is preservation of O's settlement: the holder maintains O's condition through the interval and returns it at t₁ with the same settlement profile it had at t₀."
date-created: 2026-03-19
date-modified: 2026-04-28
---

## Formal definition

A **Custody** is a triple $\mathcal{C} = (H, O, W)$:

$$\mathcal{C} = (H : \mathrm{Holder},\; O : \mathrm{Object},\; W = [t_0, t_1) : \mathrm{Interval})$$

with conditions: - $H$ has **possession** of $O$ during $W$: $O$ is physically or constructively within $H$'s control - $H$ does **not** have **ownership** of $O$: title to $O$ remains with the owner $\Omega \neq H$ - $H$ has a **duty of care** for $O$ during $W$: $H$ must preserve $O$'s condition and return or deliver it at $t_1$ - $H$'s use of $O$ is **purpose-bounded**: $H$ may use $O$ only to the extent required by the custodial purpose

**Five invariants.** $\mathcal{C}$ is a custody iff it satisfies:

1. **Possession without title**: $H$ controls $O$ during $W$; title stays with $\Omega$.
  This is the constitutive condition.
  If $H$ held title, the relationship would be ownership or sale.
  If $H$ had no control, there would be no custody.

2. **Duty of care**: $H$ owes $\Omega$ (or the eventual recipient) a duty to maintain $O$'s condition during $W$.
  The standard of care varies: a bailee for hire is held to a higher standard than a gratuitous bailee; a professional custodian (carrier, warehouseman) is held to the standard of their trade.
  Formally: the [predication cell](../../../../../../math/theories/voidmath/terms/predication-cell.md) recording $O$'s condition must reach the same affirming [settlement](../../../../../../math/theories/voidmath/terms/settlement.md) at $t_1$ as it had at $t_0$ — the object returned must be in the condition received (identity preservation).

3. **Purpose boundedness**: $H$'s use of $O$ during $W$ is limited to the custodial purpose.
  A carrier may stow cargo; they may not sell it.
  A trustee may invest trust property; they may not use it for personal benefit.
  A bailee may store an item; they may not consume it.
  Any use exceeding the custodial purpose is conversion.

4. **Temporal boundedness**: custody is defined over $W = [t_0, t_1)$.
  At $t_0$, custody begins (typically by formal transfer of possession).
  At $t_1$, custody ends (by delivery, return, or legal discharge).
  During $W$, accountability for $O$'s condition is $H$'s; outside $W$, it is not.

5. **Return or delivery obligation**: $H$ is obligated to return $O$ to $\Omega$ or deliver it to a designated third party at or before $t_1$.
  The obligation is not merely to preserve $O$ but to complete the custody by relinquishing it.

## The bailment structure

In common law, custody is formally the **bailment** — the delivery of personal property by one person (bailor) to another (bailee) for a specific purpose, with a contract (express or implied) that the purpose will be fulfilled and the property returned or disposed of according to the bailor's directions.

The bailment taxonomy:

| Type | For whose benefit | Duty of care | Example |
|---|---|---|---|
| Gratuitous bailment for bailor | Bailor only | Slight care | Leaving item with friend |
| Gratuitous bailment for bailee | Bailee only | Great care | Borrowing a tool |
| Mutual benefit bailment | Both | Ordinary/reasonable care | Carrier, warehouseman |

All three share the custody triple $(H, O, W)$ with the same five invariants.
The duty of care standard varies; the structural relationship does not.

## Custody vs. ownership vs. adjacent relations

| Relation | Title with | Possession with | Use bounded? | Return obligation? |
|---|---|---|---|---|
| **Custody/Bailment** | $\Omega$ (owner) | $H$ (holder) | Yes — purpose | Yes |
| **Ownership** | $H$ | $H$ | No | No |
| **Lease/Hire** | $\Omega$ | $H$ | Partially — term | Yes |
| **Pledge/Pawn** | $\Omega$ | $H$ (creditor) | No use | Yes (on redemption) |
| **Lien** | $\Omega$ | $H$ (lien holder) | No use | Yes (on satisfaction) |
| **Trust** | $H$ (trustee — legal) | $H$ | Yes — beneficiaries | Yes (to beneficiaries) |

The trust is the deepest form of custody: the trustee holds legal title and possession, but the beneficial interest belongs to others.
The trustee's custody is permanent (not merely transient) and involves a fiduciary duty more stringent than ordinary bailment.

## In the cargo context

The cargo custody during transit is a mutual-benefit bailment:

- $H$ = the carrier (vessel operator)
- $O$ = the cargo
- $W$ = the voyage (from loading to discharge)
- $\Omega$ = the shipper/consignee

The carrier's duty of care is the maritime law standard: "properly and carefully load, handle, stow, carry, keep, care for, and discharge the goods" (Hague-Visby Rules, Art.
III Rule 2).
Any shortfall is a breach of the custodial duty of care.
The cargo manifest is the formal record of what entered custody ($t_0$) and what must exit ($t_1$).

## Settlement reading: possession as preservation

Custody is the institutional encoding of *settlement preservation* at the object level: the holder maintains $O$'s settlement through the custodial interval, returning it at $t_1$ in the same settlement state in which it was received at $t_0$.

**Possession as fiber-algebra-level preservation.** During $W = [t_0, t_1)$, the holder $H$ maintains $O$'s value in the [predication fiber algebra](../../../../../../math/theories/voidmath/terms/predication-fiber-algebra.md) at the same position it occupied at $t_0$.
The duty of care is the obligation to keep the witnessings about $O$'s condition affirming on the relevant predicates, not to introduce new witnessings that would shift $O$'s settlement (toward damage, depletion, alteration).

**Ownership vs. custody.** The distinction between the owner and the holder is a distinction of authority over the framework's structure:

- The **owner** holds authority over the structural conditions defining what $O$'s settlement *means* — what counts as the object being "in good condition," what counts as a use rather than a destruction, what counts as a return.
  The owner can alter these structural conditions; this is the power that title confers.
- The **holder** has only preservation authority: the holder can maintain $O$'s settlement under the structural conditions as already defined, but cannot alter those conditions.
  Possession without title is settlement-preservation without structure-defining authority.

A transfer of title is a transfer of structure-defining authority — the new owner can alter what counts.
A custodial arrangement transfers only preservation capability.
This is why conversion (using the object beyond the custodial purpose) is not a failure of settlement-preservation but an exercise of structure-defining authority without title: the holder is acting as if they had the power to change what $O$'s use *counts as*, which is the owner's exclusive power.

**Return condition as settlement restoration.** The return obligation — that $O$ must be returned at $t_1$ with the same condition as received at $t_0$ — is the requirement that $O$'s settlement at $t_1$ equals its settlement at $t_0$.
The witnessings about $O$ must yield the same affirming-settlement profile at the end of custody as they did at the beginning.
The holder cannot return $O$ in a degraded settlement state (for instance, with new witnessings of damage that the original owner's settlement did not include).
Such a degradation would be a breach of the duty of care — the holder failed to maintain $O$'s settlement.

The identity preservation condition from Invariant 2 is the formal expression of this: the predication cell recording $O$'s condition must reach the same affirming settlement at the return as at the entry.

## Open questions

- Whether custody admits delegation — whether the holder $H$ can sub-bail $O$ to a third party $H'$ without the bailor's consent, and under what conditions this transfers the duty of care from $H$ to $H'$ or creates joint and several liability.
- Whether data (digital objects) admit a coherent custody structure — whether possessing a copy of a file is "possession" in the custodial sense, or whether custody of digital objects requires a different formal treatment.
- The formal relationship between custody and the on-call officer's reachability obligation — whether "being available" is a form of custody of one's own attention and professional capacity for the benefit of the activating party.
