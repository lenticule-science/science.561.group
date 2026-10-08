# L-Space

L-Space serves the science corpus as the knowledge garden, full-text search and full-document reading. Admitted readers can read the corpus through MetroPlat at `/knowledge` or through its `lspace_search` and `lspace_fetch` tools. The MetroPlat navigation includes L-Space. Search results open the complete note inside MetroPlat; no copied archive or second account is required there.

The garden at https://l-space.561.group/ retains its room addresses, public and admitted views, learning records, and media. GEODE's author workbench lives at `/geode/`; it shares the admitted archive and no longer claims the garden's root or assets. Its folder explorer uses the admitted file inventory even before documents have been parsed. Reader and author permissions remain distinct.

On Bare Cedar Fog, `l-space-561-group.service` runs `src/serve.mjs` independently of the enterprise host. The release's runtime declaration installs and receives it. Restarting MetroPlat leaves the corpus process and reader state running; changing the corpus runtime receives that runtime separately. Public Caddy ingress still forwards to tailnet port 18848, which forwards to loopback port 18848.

The unit reads `/home/emsenn/.config/561-group/l-space.env` and the live science corpus in `/home/emsenn/info`. `LSPACE_STATE_DIR` retains principals, OAuth grants, reviews, parsed-room cache and full-text observations outside release checkouts. `GEODE_AUTHORING_ROOT` must name that same science corpus. Keep those state and credential carriers when replacing code. No static-site build is required: the garden derives its navigation in a child process and renders a room when opened.

The L-space gateway credential admits the platform as a reader for search and fetch. MetroPlat's own admission governs its `/knowledge` interface. Direct garden admission uses the configured Google allowlist, registered password and Hive principals, and Discord role. Only configured authors receive authoring rights. Missing providers admit nobody; serving a process or a login page does not prove an admitted reader can read.

Verify a release by opening the public garden, opening an actual room, and searching and reading a full document through MetroPlat. A health response alone is insufficient.
