# Lenticule Science public publication

Requested address: `https://science.561.group/`. **Source is a candidate, not evidence of a deployment.** The site remains in the Causeway Public Web estate registry's planned state until a renderer build, a provider receipt and independent readback agree.

The site configuration in [site.json](site.json) is the upstream TUFTE publication application's `site` object, **not a new site schema or renderer**. Compose it with `createTuftePublicationApplication` from `@red-cup-engineering/web-page-tiling-engine/publication` and a subject-owned CAIRN catalog; TUFTE supplies the homepage, articles, pagination, search, archive, RSS, Atom, JSON Feed, sitemap, metadata and semantic HTML.

[content/intro.md](content/intro.md) is an original launch-article candidate with `status: potential`; it is **not automatically published**. The consuming publisher must receive a real editorial/public-release acceptance and pass an explicit `includeCell` predicate over admitted cell identities. Never equate a readable repository file, an L-Space public room, or non-`potential` status with public authorization. The accepted source retains its original identity: do not copy the protected corpus into a separate CMS.

Once a release is received, publish at the canonical address, independently verify the page plus `/feed.rss.xml`, `/feed.atom.xml`, `/feed.json`, `/sitemap.xml`, search and real article routes, and record source/provider/public witness in `causeway-services/public-web-services-section/sites/registry.json`. Only then consider changing the domain from planned to canonical. Use the existing Causeway media/public-web syndication and review boundaries for social distribution; no speculative new social accounts or parallel autoposter.

Ownership: `lenticule-science/science-services-section` owns this subject's semantics and releases; Red Cup owns TUFTE presentation; Causeway Public Web owns estate registry/public receiving; Coesite Operations owns applicable runtime operations. References to deployment here are obligations, not asserted receipts.
