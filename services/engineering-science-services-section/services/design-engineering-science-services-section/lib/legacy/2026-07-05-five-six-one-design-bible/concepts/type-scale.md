---
type: concept
class: structural-claim
realizes: [felt-weight, glance-direction]
instantiates: [type-role-discipline]
depends-on: []
see-also: [type-as-mass, grid-system]
---

# Type scale

The bible's type scale is nine sizes across three families, each token doing one job.

| Token | Family · weight | Screen | Print  | Leading | Tracking | Use                                |
|-------|------------------|--------|--------|---------|----------|------------------------------------|
| D1    | Sans 700         | 128 px | 96 pt  | 0.85    | −4 %     | Slogan, hero numerals              |
| D2    | Sans 700         | 76 px  | 54 pt  | 0.88    | −4 %     | Section heads                      |
| D3    | Sans 700         | 48 px  | 36 pt  | 0.95    | −2 %     | Poster titles, sub-heads           |
| D4    | Sans 700         | 28 px  | 20 pt  | 1.05    | −1 %     | Card titles, eyebrow heads         |
| L1    | Slab 400         | 22 px  | 14 pt  | 1.4     | 0        | Lede — opening paragraph           |
| B1    | Slab 400         | 16 px  | 10.5 pt | 1.5    | 0        | Default body                       |
| B2    | Slab 400         | 14 px  | 9 pt   | 1.45    | 0        | Sidebars, list items               |
| M1    | Mono 500         | 13 px  | 8 pt   | 1.3     | +5 %     | Captions, FIG labels               |
| M2    | Mono 500 caps    | 11 px  | 7 pt   | 1.4     | +18 %    | Folios, table headers, eyebrows    |

Tracking is in CSS-style percentages (em ÷ 100).
Leading is a unitless multiplier.
Display sizes get tighter leading so stacked lines (Land. / Water. / Language. / Culture.) lock to a single block; body sizes get looser leading because the slab's x-height runs hot.
Caps get positive tracking because mono caps without it read as a stamped serial number, not a label.

The scale's nine tokens map to nine jobs.
Where an editor wants a tenth size — *between* B1 and L1, or *between* D2 and D3 — the answer is to pick the nearer token, not to interpolate.
Custom sizes are a defect the next editor inherits.
The scale's families are specified in [type-stack](../objects/type-stack.md); the family-pairing rule is in [type-pairing morphism](../morphisms/type-pairing.md).

Type scale realizes [felt weight](../../../terms/felt-weight.md) (each step is a step in perceived hierarchical mass) and [glance direction](../../../terms/glance-direction.md) (the eye sorts a page by size before reading any of it).
