# Linked data and web citizenship

Date: 2026-06-03

## Question

What makes a server over a four-valued predication-cell store a *next-generation* web server —
something ordinary servers can't be? And what web essentials must it still cover?

## What the archive said

Mining `production/` and `development/lab/archive/` surfaced that the repo had already designed
most of this for the (now-deprecated) Hugo theme:

- The hugo-theme journal frames "the semantic-web outputs are functors from content to RDF";
  JSON-LD and Turtle outputs "share the RDF-graph codomain", so the same content in two RDF formats
  is "the same RDF graph in two presentations"
  (`production/hugo-theme/docs/dev/journal/2026-05-28-categorical-ssg.md`).
- The theme's implementation plan already proposed publishing contradiction as *typed data* rather
  than failing: `emsenn:AbsurdCell` with `positiveEvidence`/`negativeEvidence`/`contestReason`
  (`production/hugo-theme/docs/dev/journal/2026-05-28-implementation-plan.md`). Our `settle()`
  already produces exactly affirmed/denied/contradicted with both witnesses.
- emsenn-net publishes `ttl`, `jsonld`, `jsonfeed` outputs, an `emsenn:` vocabulary at
  `static/vocab/index.ttl`, h-card, and webmention (`emsenn-net-backstage/hugo.toml`).
- A repo note reads HTTP content negotiation as "the modal-possibility operator ◇_R applied to
  the endpoint's representation family" — i.e. the same algebra, many representations.

The conclusion: our claim is *already* an RDF triple with a four-valued charge; we are better set up
to serve linked data than a conventional CMS, because paraconsistency and provenance are native.

## What was built (v0.0.2)

- **`src/rdf.mjs`** — the finite algebra as Turtle and JSON-LD, with four-valued truth first-class:
  affirmed → a triple + a reified `ws:AffirmedClaim` with `prov:wasDerivedFrom` the citation;
  denied → `owl:NegativePropertyAssertion`; contradicted → `ws:ContradictedClaim` carrying both
  `ws:affirmedBy`/`ws:deniedBy`. A subject's slug is its IRI; objects that name a subject are IRIs
  (linked data). `vocabulary()` emits the OWL/RDFS ontology, including the paraconsistent classes.
- **`src/syndication.mjs`** — JSON Feed 1.1, sitemap.xml, robots.txt (pure renderers).
- **`src/serve.mjs`** — content negotiation (extension `.ttl`/`.jsonld` wins, else `Accept`) to
  HTML / Turtle / JSON-LD; routes `/vocab.ttl`, `/feed.json`, `/sitemap.xml`, `/robots.txt`;
  `ETag` hashed from the subject's scott-continuous trace with `304` on `If-None-Match`; `Link`
  alternates and `Vary: Accept`. The public base IRI is `WEBSITE_BASE` or the request Host.
- **`src/render.mjs`** — objects that are subjects render as links; pages advertise RDF alternates.

## Decisions / notes

- The `t` transaction is a **citation, not a timestamp**. Feeds therefore order by the trace log's
  filesystem mtime (the carrier's clock), and `subjectsIndex` is explicit that this is not a witness.
- `iriRef` escapes only Turtle-illegal characters (controls, space, delimiters); `:` and `/` pass
  through so URLs survive. (Guarded by a test asserting no `%2F`/`%3A`.)
- RDF/JSON-LD are hand-rolled (no deps), consistent with the package's zero-dependency-beyond-the-
  voidmath-stack posture.

## Deferred / future

- Webmention receipt, ActivityPub, h-card/microformats (emsenn-net has precedent).
- A query surface (SPARQL-ish) over the settled graph; per-timestamp snapshots.
- Pagefind-style search over the finite algebra; full RDFa-in-HTML.
- Prose generation by downstream agents (still the big one); SWARM coupling.
