// 561 GROUP — GLYPH SET
// Secondary marks. Constructed on a 64×64 grid, 4px stroke discipline.
// Each glyph names a concept from the political vocabulary of the confederacy.

window.GLYPHS = {
  seed: `<svg viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="4" stroke-linecap="square">
    <path d="M32 8 C18 22 18 42 32 56 C46 42 46 22 32 8 Z"/>
    <path d="M32 8 L32 56" stroke-width="2"/>
  </svg>`,
  soil: `<svg viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="4">
    <path d="M4 28 L60 28"/>
    <path d="M4 38 L60 38" stroke-dasharray="6 4"/>
    <path d="M4 48 L60 48" stroke-dasharray="2 4"/>
    <path d="M4 58 L60 58" stroke-dasharray="2 6"/>
  </svg>`,
  sovereignty: `<svg viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="4">
    <rect x="8" y="8" width="48" height="48"/>
    <rect x="20" y="20" width="24" height="24" fill="currentColor"/>
  </svg>`,
  refusal: `<svg viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="4">
    <circle cx="32" cy="32" r="24"/>
    <path d="M14 14 L50 50"/>
  </svg>`,
  rotation: `<svg viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="4">
    <path d="M52 22 A22 22 0 1 0 54 38" />
    <path d="M52 8 L52 22 L38 22"/>
  </svg>`,
  frame: `<svg viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="4">
    <path d="M8 8 L8 20"/><path d="M8 8 L20 8"/>
    <path d="M56 8 L56 20"/><path d="M56 8 L44 8"/>
    <path d="M8 56 L8 44"/><path d="M8 56 L20 56"/>
    <path d="M56 56 L56 44"/><path d="M56 56 L44 56"/>
  </svg>`,
  witness: `<svg viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="4">
    <path d="M4 32 C16 16 48 16 60 32 C48 48 16 48 4 32 Z"/>
    <circle cx="32" cy="32" r="8" fill="currentColor"/>
  </svg>`,
  ration: `<svg viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="4">
    <rect x="8" y="20" width="48" height="32"/>
    <path d="M8 28 L56 28"/>
    <path d="M24 12 L40 12 L40 20 L24 20 Z"/>
  </svg>`,
  confederacy: `<svg viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="4">
    <circle cx="20" cy="22" r="8"/>
    <circle cx="44" cy="22" r="8"/>
    <circle cx="32" cy="44" r="8"/>
    <path d="M20 22 L44 22 L32 44 Z" stroke-width="2" stroke-dasharray="3 3"/>
  </svg>`,
  return: `<svg viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="4">
    <path d="M56 32 L8 32"/>
    <path d="M22 18 L8 32 L22 46"/>
  </svg>`,
  fire: `<svg viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="4">
    <path d="M32 56 C16 50 14 36 24 28 C24 36 30 36 30 28 C30 18 38 18 38 28 C38 36 44 36 44 28 C50 38 48 50 32 56 Z"/>
  </svg>`,
  water: `<svg viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="4">
    <path d="M4 24 C12 18 20 30 28 24 C36 18 44 30 52 24 C60 18 60 24 60 24"/>
    <path d="M4 40 C12 34 20 46 28 40 C36 34 44 46 52 40 C60 34 60 40 60 40"/>
  </svg>`,
  grain: `<svg viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="4">
    <path d="M32 8 L32 56"/>
    <path d="M32 18 L20 22 M32 18 L44 22"/>
    <path d="M32 30 L20 34 M32 30 L44 34"/>
    <path d="M32 42 L20 46 M32 42 L44 46"/>
  </svg>`,
  border: `<svg viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="4">
    <path d="M32 4 L32 60" stroke-dasharray="4 6"/>
    <path d="M16 32 L32 32 L48 32" />
  </svg>`,
  council: `<svg viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="4">
    <circle cx="32" cy="32" r="24"/>
    <path d="M14 32 L50 32"/>
    <path d="M32 14 L32 50"/>
    <path d="M19 19 L45 45"/>
    <path d="M45 19 L19 45"/>
  </svg>`,
  archive: `<svg viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="4">
    <rect x="8" y="12" width="48" height="44"/>
    <path d="M8 22 L56 22"/>
    <path d="M16 32 L48 32"/>
    <path d="M16 40 L48 40"/>
    <path d="M16 48 L36 48"/>
  </svg>`
};

window.GLYPH_NAMES = {
  seed:'SEED', soil:'SOIL', sovereignty:'SOVEREIGNTY', refusal:'REFUSAL',
  rotation:'ROTATION', frame:'FRAME', witness:'WITNESS', ration:'RATION',
  confederacy:'CONFEDERACY', return:'RETURN', fire:'FIRE', water:'WATER',
  grain:'GRAIN', border:'BORDER', council:'COUNCIL', archive:'ARCHIVE'
};
