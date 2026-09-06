---
description: Know-your-customer (KYC) is the practice, usually a regulatory requirement on financial and crypto platforms, of verifying a customer's identity with government-issued documentation before granting full access to an account or its funds.
identity: know-your-customer
name: Know-your-customer
provenance:
  date-created: 2026-09-05
---
Know-your-customer, abbreviated KYC, is a financial and crypto-industry practice of verifying who a customer actually is, typically by collecting a government-issued ID and matching it to the account holder, before allowing full use of an account. Platforms measured for this program (the accompanying incumbent-and-provider measurement record) apply KYC unevenly: several gate only withdrawal or cash-out behind identity verification while allowing signup and earning with just an email address, and the specific identity tier required (none, email, phone, government ID) is recorded per platform per capability in that record rather than assumed uniform across a platform's own features.

KYC is distinguished from a platform's ordinary account-creation step (an email and a password) by what it verifies: an email address confirms only that a message can reach that address, while KYC confirms a claimed legal identity against an issued document, usually because the platform is legally required to under anti-money-laundering rules or because it wants to prevent one person from operating many accounts. It is also distinguished from a platform's own internal fraud or bot detection (rate limits, device fingerprinting): KYC produces a durable, reusable identity record tied to the person, while bot detection is a per-session technical control that does not by itself establish who the person is.

The engineering consequence for this program is direct: a surface's no-KYC tier is admitted only when its own first-party terms state that identity required is none or, at most, an email address; a surface requiring a phone number, a government ID, or bank/card verification at any point a person would actually reach (not merely at signup) does not qualify for the no-KYC tier even if its no-purchase tier is otherwise satisfied.
