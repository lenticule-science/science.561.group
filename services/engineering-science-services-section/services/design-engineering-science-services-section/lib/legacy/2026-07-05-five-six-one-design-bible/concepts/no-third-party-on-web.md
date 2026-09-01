---
type: concept
class: discipline
realizes: [orientation-before-interpretation]
depends-on: []
see-also: [refusal-as-design-method, template-as-floor]
---

# No third party on web

Every 561 web surface loads from one origin only — the 561 domain.
No analytics scripts, no tracking pixels, no third-party fonts that phone home, no third-party embeds, no advertising, no social-share buttons that load a remote SDK, no cookie banners (none should be necessary).

The discipline is operative, not aspirational.
The [web-static-site example](../examples/web-static-site.md) is built so that opening the page with developer tools shows requests to one origin only and storage shows no cookies set.
The fonts (Space Grotesk, Roboto Slab, JetBrains Mono) are self-hosted in the 561 origin's static directory; the fallback stack (system sans, Georgia, system mono) is what loads if the self-hosted font fails.
JavaScript is optional and progressive — the site must function with JS disabled; JS adds, never gates.

The check is the [no-third-party-requests-on-web-surfaces theorem](../theorems/no-third-party-requests-on-web-surfaces.md), § 09.7: load the page with developer tools open, network must show one origin, storage must show no cookies.
The check is also the [no-javascript-web-test theorem](../theorems/no-javascript-web-test.md), § 08.5: view with JavaScript disabled; all content present, all navigation works, all forms submit.

The reason for the discipline — and not a softer "minimize third-party requests" — is that the bible refuses the negotiation.
Once a third-party request is permitted, the question becomes *which* third party, and the question never settles.
Refusing the category settles the question once and lets the rest of the work proceed.

The discipline is also a refusal to externalize the cost of the page onto the reader.
A page that loads ten domains' worth of trackers and SDKs costs the reader bandwidth and battery and (more importantly) costs the reader the ability to know what their browser is talking to while they read.
The bible refuses that cost.
