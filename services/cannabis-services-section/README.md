# Cannabis Services Section

The Cannabis Services Section develops home cannabis cultivation practice: the
control parameters of an indoor grow, the law that bounds a household grow in
Minnesota, and where legal cannabis and genetics are found.

Its research notes are under `content/documents/` and its records under
`data/records/`. The grow control system that consumes these records is
`services/indoor-grow-autonomic-system` in `red-cup-engineering/computer-services-section`;
the buildout and runbook are `services/cultivation-operations-services-section` in
`coesite-operations/operations-services-section`.

## Contents

Research notes (`content/documents/articles/notes/2026/10/07/`):

- Minnesota home cultivation and sourcing: § 342.09 limits and penalties, possession, gifting, nuisance, licensed and tribal retail, seed vendors.
- Indoor cultivation control parameters: environment, root zone, IPM, harvest and post-harvest, computer vision.
- Minnesota menu data and home-grow genetics: menu platforms and their terms on automated access, OCM product rules and tax, prices, seed and clone selection, HLVd.
- Next-generation cultivation intelligence: crop steering, light-use yield models, thermal time, recipe optimization, low-cost sensing, VLM and detector diagnosis.

Records (`data/records/`):

- `indoor-cannabis-stage-setpoints.json`: per-stage day/night bands; packaged as the grow system's default table.
- `minnesota-cannabis-sources.json`: legal retail, tribal, medical and seed sources.
- `minnesota-menu-platforms.json`: menu platforms, exposed fields, and recorded automated-access terms; the finder's default-deny gate reads it.
