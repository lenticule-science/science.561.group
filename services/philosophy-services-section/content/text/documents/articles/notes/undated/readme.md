---
title: Relationality Research Program Repository
description: This repository is the home of the Relationality Research Program.
---
# Relationality Research Program Repository

This repository is the home of the Relationality Research Program. It implements a Stewardable Semiotic Concept Universe (SSCU) backed by a flatfile datastore under `content/` and operative code under `src/`. The operative code is the current **Semiotic Publishing Service** within the broader **Semiotic Software Engine**, turning Markdown concept artifacts into an evaluated SSCU instance and rendering HTML projections without writing intermediate trees inside the repo.

## Repository layout
- `content/`: flatfile datastore containing the universe’s Markdown concepts and metadata that instantiate the Stewardable Semiotic Concept Universe.
- `src/`: operative code for the Semiotic Publishing Service (part of the Semiotic Software Engine) that evaluates the SSCU snapshot and emits projections.
- `universe.yaml` and presets (e.g., `content-site.universe.yaml`, `emsenn-net*.universe.yaml`): publishing configurations that control which content subsets and HTML options are applied.

## Conceptual mapping
1. **Markdown → Const/AnnTerm**: Each Markdown file contains YAML frontmatter with `id`, `title`, optional `tags`, `ann` (annotation terms), and optional `same_as` declarations for ≈ transport.
2. **Ann_X(k)**: Annotation terms are parsed into the v0 AnnTerm language (`AtomTerm`, `KeyValTerm`, `RefTerm`). Unparseable terms become failure-marked.
3. **T_{k,X}**: Interpretations ⟦t⟧ generate the fragment seeds. Ref terms are transported through the ≈ groupoid.
4. **F_{k,X}**: The fragment contains generators; if any generator is ⊥_fail the fragment collapses to {⊥_fail}.
5. **Sem_X(k) = S(F_{k,X})**: v0 applies the conservative closure S (identity with trace) and records provenance.
6. **HTML projection**: The evaluated instance feeds projections (`site:static`, `single:html`). Failures and unresolved references surface in diagnostics. Concept pages also surface the interpreted generator set `T_{k,X}` and fragment elements `F_{k,X}` so readers can audit how annotations denoted into the partial structure.

## Modes: strict vs permissive
- **Permissive (default)**: unresolved references are rendered as broken links/diagnostics but do not stop the build.
- **Strict**: unresolved references trigger a build error.

HTML sanitization is enabled by default; set `html.sanitize: false` in `universe.yaml` to allow raw HTML from Markdown.

Set `html.lang` to the BCP-47 language tag you want on emitted HTML roots (default `en`). Both projections and their manual
fallbacks use this value for the `<html lang="...">` attribute so screen readers announce the correct language.

Static-site styling defaults to inline CSS for simplicity. Set `html.assets.inline: false` to emit a hashed stylesheet under
`assets/style-<hash>.css` (optionally with `html.assets.minify: true` to squeeze whitespace). Manifests record the asset hash and
path, and tag pages rewrite the stylesheet link relative to their subdirectories so the CSS can be cached and audited alongside
the HTML. The single-page projection always inlines the stylesheet but will honor `html.assets.minify: true` to match the
minified static-site output.

## Output styling and accessibility
Rendered HTML uses a minimal, high-contrast theme with semantic landmarks:
- skip link to jump to the main content, landmarked `<main>`/`<header>` regions, and accessible nav labels;
- enlarged focus outlines and underline thickness for keyboard navigation;
- tag badges and diagnostic panels with higher-contrast color tokens for failures/unresolved references;
- adjacent-concept pager links so keyboard users can move sequentially between concept pages and anchors;
- document-outline navigation on the index and single-page outputs so screen readers can jump straight to the concept list,
  delta summary, diagnostics, or a chosen concept anchor;
- consistent heading hierarchy for content, math object details, backlinks, and unresolved references so screen readers can hop
  between sections via `h2` navigation;
- `role="region"`/`aria-labelledby` markers on concept panels (content, math object, backlinks, unresolved references, deltas,
  diagnostics) so assistive tech exposes named landmarks;
- backlinks and unresolved-reference lists labeled with the target concept anchor so assistive tech can announce context before
  the link items;
- responsive viewport metadata plus compact grid/pager layouts on small screens so mobile readers keep the same navigation cues;
- a `prefers-color-scheme: dark` palette for readers using dark mode, applied to both Jinja-rendered pages and manual fallbacks
  so even template-less builds stay legible;
- print-friendly styles that remove navigation chrome, expand the content area, and append link targets for paper/PDF exports.
- concept lists on the index and tag pages surface interpreted generator counts (|T_{k,X}|), fragment sizes (|F_{k,X}|), and
  mark failure fragments so readers can triage inferred structure without opening each concept page.
- the index includes a reference-graph panel with resolved-reference and backlink counts plus jump links into concept sections,
  making inferred link structure visible without leaving the listing.
These improvements apply to both the static-site pages and the consolidated single HTML output.

## Caching, deltas, and manifests
- Evaluation results are cached by default using a content hash of the configured sources, the config hash, and the tool version.
- Cache artifacts live under `$XDG_CACHE_HOME/ssc_universe` (or `~/.cache/ssc_universe`) unless `cache.location` in `universe.yaml` points elsewhere.
- Disable caching with `--no-cache` or `cache.enabled: false`. Each emitted manifest records the cache status (`hit`, `miss`, or `disabled`), a repository fingerprint (Git HEAD plus dirty hash when available), the equivalence classes detected during evaluation, and a delta summary against the most recent cached evaluation (if present). Delta summaries highlight annotation changes, reference changes, and additions/removals in failures or unresolved references. Both projections surface the delta summary directly in the rendered HTML for quick audit.
- Static-site builds link to `manifest.json` from the index and concept build panels; single-page builds do the same when the manifest is written alongside the HTML (directory/zip/file sinks) and label the manifest as inline when emitted only in the page.
- Inspect cached evaluations with `sscu cache --config universe.yaml --list` (marking the requested signature). Add `--verbose` to include metadata such as last-modified time, size, constant count, and repository fingerprint when available. Clear cache artifacts for a configuration with `sscu cache --config universe.yaml` (current signature), `sscu cache --config universe.yaml --signature <sig>` (target a specific signature), or `sscu cache --config universe.yaml --all` (all entries in the cache directory).

## Identity transport (≈ groupoid)
Declare equivalences in frontmatter using `same_as: [other-id]`. Reference interpretations transport targets to their canonical representatives, preserving provenance. When multiple concepts belong to the same equivalence class, annotations and tags are aggregated onto the canonical representative; projections emit a single page/anchor for the representative and show the equivalent IDs, and manifests include the equivalence-class membership for downstream auditing.

## Running the tool
- Evaluate without publishing to stdout: `sscu eval --config universe.yaml --format json`
- Write evaluation output to a file: `sscu eval --config universe.yaml --format json --out /tmp/ssc_eval.json`
- JSON evaluation output includes constants, fragments, closure traces, unresolved references, failures, and the delta summary so downstream tools can detect changes without re-diffing the entire state. Concept pages and single-page renders also surface per-constant delta callouts (annotation/reference status plus unresolved additions/removals) to keep inferred changes visible in context.
- Console progress (configuration, cache hits/misses, evaluation counts, and build sinks) is written to stderr so stdout stays clean for manifests and JSON output.
- Build static site: `sscu build --config universe.yaml --projection site:static --out dir:/tmp/site`
- Static-site builds now emit a hashed `search-index-*.json` alongside the index page; the index embeds a client-side search UI that filters concepts by id, title, tags, aliases, annotation terms, status, and publish targets without extra tooling.
- Static-site builds also emit `sitemap.xml` with canonical concept, tag, index, and search-index URLs so downstream hosts can crawl the projection output.
- Build single HTML: `sscu build --projection single:html --out file:/tmp/book.html`
- Override configured language: add `--lang fr` to build or eval commands to emit `<html lang="fr">`
- List cached evaluations for a configuration: `sscu cache --config universe.yaml --list` (add `--verbose` for metadata)
- Clear a cached evaluation: `sscu cache --config universe.yaml --all` or `--signature <sig>` for a specific artifact

### Publication presets
- **Full content site**: `content-site.universe.yaml` builds the entire `content/` tree with the same hashed/minified asset defaults used for Pages without tying into CI/CD. Run `sscu build --config content-site.universe.yaml --projection site:static --out dir:/tmp/content-site` to publish everything that is not explicitly `publish: false`.
- **emsenn-net (public)**: `emsenn-net.universe.yaml` targets only concepts marked with `status: public` and `publish_to: [emsenn-net]`. Build with `sscu build --config emsenn-net.universe.yaml --projection site:static --out dir:/tmp/emsenn-net-site`.
- **emsenn-net drafts**: `emsenn-net-drafts.universe.yaml` includes both `public` and `draft` concepts tagged for `emsenn-net` publication. Build with `sscu build --config emsenn-net-drafts.universe.yaml --projection site:static --out dir:/tmp/emsenn-net-drafts-site` to review in-progress material. Each emitted manifest records the potential filters so constants and diagnostics align with the selected scope.

## Publishing to GitHub Pages
- A repository-level `universe.yaml` (checked in at the repo root) declares the build inputs for CI/CD. It uses the same defaults as the examples configuration but disables inline assets and enables minification so the hashed stylesheet and search index can be cached by Pages.
- The GitHub Actions workflow in `.github/workflows/pages.yml` builds the static site with `sscu build --config universe.yaml --projection site:static --out dir:site-dist`, uploads the generated tree as a Pages artifact, and deploys it to the `github-pages` environment.
- The workflow runs on pushes to `main` or `work` and can be triggered manually with “Run workflow.” Ensure repository Pages settings are set to “GitHub Actions” so the deployment job can publish the artifact to the `gh-pages` branch.
- If you want to customize the build (different sources, mathjax enabled, or strict mode for CI), edit `universe.yaml` and re-run the workflow; the manifest produced during the build will still be written alongside the site output for auditability.

## Examples and tests
Example concepts live under `examples/content`. Run the test suite:

```
python -m pip install -e .
pytest
```
