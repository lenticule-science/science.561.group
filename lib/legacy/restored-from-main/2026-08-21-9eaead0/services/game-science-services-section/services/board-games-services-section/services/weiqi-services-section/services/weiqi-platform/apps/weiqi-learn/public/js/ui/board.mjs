// An accessible SVG goban.
//
// Theming: every color this module draws comes from a CSS custom property
// read with a fallback, so the page that hosts the board owns the palette
// and the board simply follows `prefers-color-scheme` (or whatever theme
// mechanism the page uses) for free. Define these on an ancestor (or
// `:root`) to theme the board; every one has a working default if the page
// defines none of them:
//
//   --board-bg      board surface fill                    (falls back #dfb676)
//   --board-line    grid lines, star points, coord labels  (falls back #2b1c0f)
//   --stone-black   black stone fill                       (falls back #161616)
//   --stone-white   white stone fill                       (falls back #f5f3ee)
//   --board-accent  focus ring, pending ghost, last-move
//                   dot, marker strokes                    (falls back #3a7ca5)
//
// Coordinates: points are the kernel's "A1"-style strings — column letters
// A-T skipping "I", row numbers 1-indexed. The kernel numbers rows
// top-to-bottom starting at 1 (see apps/weiqi-kernel/src/board.mts and
// content/.../notes/regression-positions.md, which that internal
// convention is drawn from directly). This component displays the
// Go-standard orientation instead, row 1 at the BOTTOM, so every point is
// vertically flipped between "the row number in the string" and "the row
// drawn from the top of the SVG" — see pointToCell/cellToPoint below,
// which are the only place that flip happens.
//
// Star points follow the hoshi doctrine (glossary/terms/hoshi.md,
// regression-positions.md#R13): 9x9 gets the four 3-3 points plus tengen,
// 13x13 and 19x19 get the standard corner/side/center layout. Board sizes
// outside that doctrine (this component accepts 5..19, per the kernel's
// own isBoardSize range) simply have no star points.
//
// Pure DOM/SVG: no kernel import, no innerHTML, no dependency. Every
// DOM-touching line lives inside createBoard (or functions it calls), never
// at module top level, so this file imports cleanly under plain Node for
// the geometry-helper tests.

export const MIN_SIZE = 5;
export const MAX_SIZE = 19;

// Traditional Go column letters, skipping "I" — the same alphabet and
// order as the kernel's own COLUMN_LETTERS (board.mts), trimmed to the 19
// letters (A..T minus I) a board this size will ever need.
const COLUMN_LETTERS = "ABCDEFGHJKLMNOPQRST";

function assertSize(size) {
  if (!Number.isInteger(size) || size < MIN_SIZE || size > MAX_SIZE) {
    throw new Error(`Board size out of range [${MIN_SIZE}, ${MAX_SIZE}]: ${size}`);
  }
}

/** The column letter (skip-I alphabet) for a 0-indexed column. */
export function columnLetter(index) {
  if (!Number.isInteger(index) || index < 0 || index >= COLUMN_LETTERS.length) {
    throw new Error(`Column index out of range: ${index}`);
  }
  return COLUMN_LETTERS[index];
}

/** The `size` column letters a board of this size uses, left to right. */
export function columnLetters(size) {
  assertSize(size);
  return COLUMN_LETTERS.slice(0, size).split("");
}

/**
 * Parse a kernel-style point string ("C3") into a 0-indexed column and a
 * 1-indexed row, using the kernel's own row-1-at-top numbering verbatim —
 * this is *not* the display row (see pointToCell for that conversion).
 */
export function parsePoint(pt) {
  const m = /^([A-Za-z]+)(\d+)$/.exec(String(pt).trim());
  if (!m) throw new Error(`Invalid point: "${pt}"`);
  const col = COLUMN_LETTERS.indexOf(m[1].toUpperCase());
  if (col < 0) throw new Error(`Invalid column letter in point: "${pt}"`);
  const row = Number(m[2]);
  if (!Number.isInteger(row) || row < 1) throw new Error(`Invalid row in point: "${pt}"`);
  return { col, row };
}

/** Format a 0-indexed column and 1-indexed (kernel-convention) row back into a point string. */
export function formatPoint(col, row) {
  return `${columnLetter(col)}${row}`;
}

/**
 * Convert a kernel point to the 0-indexed (col, rowFromTop) cell it is
 * DRAWN at. The kernel numbers rows 1-at-top; this component displays
 * Go-standard row-1-at-bottom, so the vertical axis is flipped here and
 * nowhere else: kernel row 1 draws at the bottom (rowFromTop = size-1),
 * kernel row `size` draws at the top (rowFromTop = 0).
 */
export function pointToCell(pt, size) {
  assertSize(size);
  const { col, row } = parsePoint(pt);
  if (col >= size) throw new Error(`Column out of range for size ${size}: "${pt}"`);
  if (row < 1 || row > size) throw new Error(`Row out of range for size ${size}: "${pt}"`);
  return { col, rowFromTop: size - row };
}

/** Inverse of pointToCell: a drawn (col, rowFromTop) cell back to a kernel point string. */
export function cellToPoint(col, rowFromTop, size) {
  assertSize(size);
  if (col < 0 || col >= size) throw new Error(`Column out of range for size ${size}: ${col}`);
  if (rowFromTop < 0 || rowFromTop >= size) {
    throw new Error(`Row out of range for size ${size}: ${rowFromTop}`);
  }
  return formatPoint(col, size - rowFromTop);
}

// Cross product of a set of 1-indexed coordinates with itself, formatted
// as points — the shape every hoshi corner/side layout reduces to.
function starGrid(coords1) {
  const pts = [];
  for (const row of coords1) {
    for (const col of coords1) pts.push(formatPoint(col - 1, row));
  }
  return pts;
}

/**
 * Hoshi (star point) table for a board size, per the hoshi doctrine. Sizes
 * the doctrine doesn't cover have no star points.
 */
export function starPoints(size) {
  assertSize(size);
  if (size === 9) return [...starGrid([3, 7]), formatPoint(4, 5)]; // 4 corners + tengen E5
  if (size === 13) return [...starGrid([4, 10]), formatPoint(6, 7)]; // 4 corners + tengen G7
  if (size === 19) return starGrid([4, 10, 16]); // corners + sides + tengen K10, all at once
  return [];
}

// ---------------------------------------------------------------------
// Everything below touches the DOM and only runs when createBoard is
// actually called.
// ---------------------------------------------------------------------

const SVG_NS = "http://www.w3.org/2000/svg";

const CELL = 44;
const PAD = 46; // room for stone bleed at the edge + coordinate label text
const STONE_R = CELL * 0.46;
const STAR_R = CELL * 0.09;
const LAST_MOVE_R = CELL * 0.14;
const GHOST_R = STONE_R;
const FOCUS_R = STONE_R + 6;
const EVENT_R = CELL * 0.32;

function svgEl(tag, attrs = {}) {
  const el = document.createElementNS(SVG_NS, tag);
  for (const [k, v] of Object.entries(attrs)) {
    // A value that names a CSS custom property is routed through the style
    // property rather than the bare attribute: presentation attributes are
    // less consistently resolved as CSS by every engine, and var()
    // resolution is exactly the behavior the theming contract at the top
    // of this file depends on.
    if (typeof v === "string" && v.includes("var(")) {
      el.style.setProperty(k, v);
    } else {
      el.setAttribute(k, String(v));
    }
  }
  return el;
}

function cellX(col) {
  return PAD + col * CELL;
}

function cellY(rowFromTop) {
  return PAD + rowFromTop * CELL;
}

// A halo behind marker/coordinate text keeps it legible over whatever
// color sits beneath it, in either theme, without per-kind contrast logic.
function labelText(x, y, text) {
  const el = svgEl("text", {
    x,
    y,
    "text-anchor": "middle",
    "dominant-baseline": "middle",
    "paint-order": "stroke",
    stroke: "var(--board-bg, #dfb676)",
    "stroke-width": 3,
    "stroke-linejoin": "round",
    fill: "var(--board-accent, #3a7ca5)",
    "font-size": CELL * 0.32,
    "font-family": "system-ui, sans-serif",
  });
  el.textContent = text; // textContent, never innerHTML — text is never trusted markup
  return el;
}

/**
 * Build the accessible SVG goban described at the top of this file, mount
 * it into `container`, and return the handle the rest of the app drives it
 * through.
 *
 * @param {Element} container
 * @param {{size?: number, coordinates?: boolean, interactive?: boolean, onIntent?: (pt: string) => void}} [options]
 *   size default 19; coordinates default false (opt in per view); interactive default true.
 */
export function createBoard(container, options = {}) {
  const size = options.size ?? 19;
  assertSize(size);
  const interactive = options.interactive !== false;
  const showCoordinates = options.coordinates === true;
  const onIntent = typeof options.onIntent === "function" ? options.onIntent : () => {};

  const dim = PAD * 2 + CELL * (size - 1);

  const root = document.createElement("div");
  root.style.display = "inline-block";
  root.style.maxWidth = "100%";

  const svg = svgEl("svg", {
    viewBox: `0 0 ${dim} ${dim}`,
    width: "100%",
    height: "100%",
    role: "presentation",
  });
  svg.style.display = "block";
  svg.style.maxWidth = "100%";
  svg.style.height = "auto";

  const live = document.createElement("div");
  live.setAttribute("aria-live", "polite");
  live.setAttribute("aria-atomic", "true");
  // Visually hidden, not display:none — screen readers ignore
  // display:none content, so this has to stay laid out and merely invisible.
  Object.assign(live.style, {
    position: "absolute",
    width: "1px",
    height: "1px",
    overflow: "hidden",
    clip: "rect(0 0 0 0)",
    clipPath: "inset(50%)",
    whiteSpace: "nowrap",
  });

  root.append(svg, live);
  container.textContent = "";
  container.append(root);

  // ---- static layers -------------------------------------------------

  svg.append(
    svgEl("rect", { x: 0, y: 0, width: dim, height: dim, fill: "var(--board-bg, #dfb676)" }),
  );

  const gridGroup = svgEl("g", { "shape-rendering": "crispEdges" });
  const last = CELL * (size - 1);
  for (let i = 0; i < size; i++) {
    const pos = PAD + i * CELL;
    gridGroup.append(
      svgEl("line", {
        x1: pos, y1: PAD, x2: pos, y2: PAD + last,
        stroke: "var(--board-line, #2b1c0f)", "stroke-width": 1,
      }),
      svgEl("line", {
        x1: PAD, y1: pos, x2: PAD + last, y2: pos,
        stroke: "var(--board-line, #2b1c0f)", "stroke-width": 1,
      }),
    );
  }
  svg.append(gridGroup);

  const starGroup = svgEl("g");
  for (const pt of starPoints(size)) {
    const { col, rowFromTop } = pointToCell(pt, size);
    starGroup.append(
      svgEl("circle", {
        cx: cellX(col), cy: cellY(rowFromTop), r: STAR_R,
        fill: "var(--board-line, #2b1c0f)",
      }),
    );
  }
  svg.append(starGroup);

  if (showCoordinates) {
    const coordGroup = svgEl("g");
    const letters = columnLetters(size);
    for (let col = 0; col < size; col++) {
      coordGroup.append(labelText(cellX(col), PAD - 20, letters[col]));
    }
    for (let row = 1; row <= size; row++) {
      const { rowFromTop } = pointToCell(formatPoint(0, row), size);
      coordGroup.append(labelText(PAD - 22, cellY(rowFromTop), String(row)));
    }
    svg.append(coordGroup);
  }

  // ---- dynamic layers, rebuilt whole on each set*() call --------------

  const stonesGroup = svgEl("g");
  const markersGroup = svgEl("g");
  const ghostGroup = svgEl("g");
  const focusGroup = svgEl("g");
  svg.append(stonesGroup, markersGroup, ghostGroup, focusGroup);
  for (const g of [starGroup, gridGroup, stonesGroup, markersGroup, ghostGroup, focusGroup]) {
    g.style.pointerEvents = "none"; // only the hit-target layer below is clickable
  }

  const stoneByPt = new Map();
  // Territory markers, keyed by point, so the keyboard cursor's spoken
  // description (describePoint below) can name black/white territory even
  // though the marker itself is otherwise silent to a screen reader.
  const territoryByPt = new Map();

  function renderStones() {
    stonesGroup.replaceChildren();
    for (const [pt, color] of stoneByPt) {
      const { col, rowFromTop } = pointToCell(pt, size);
      stonesGroup.append(
        svgEl("circle", {
          cx: cellX(col), cy: cellY(rowFromTop), r: STONE_R,
          fill: color === "black" ? "var(--stone-black, #161616)" : "var(--stone-white, #f5f3ee)",
          // A subtle rim keeps a black stone legible against a dark
          // board theme, and a white stone legible against a light one.
          stroke: color === "black" ? "rgba(255,255,255,0.4)" : "rgba(0,0,0,0.4)",
          "stroke-width": 1.5,
        }),
      );
    }
  }

  function renderMarker(marker) {
    const { col, rowFromTop } = pointToCell(marker.pt, size);
    const x = cellX(col);
    const y = cellY(rowFromTop);
    const g = svgEl("g");
    switch (marker.kind) {
      case "last-move":
        g.append(svgEl("circle", { cx: x, cy: y, r: LAST_MOVE_R, fill: "var(--board-accent, #3a7ca5)" }));
        break;
      case "liberty":
        g.append(svgEl("rect", {
          x: x - CELL * 0.25, y: y - CELL * 0.25, width: CELL * 0.5, height: CELL * 0.5,
          fill: "none", stroke: "var(--board-accent, #3a7ca5)", "stroke-width": 2,
        }));
        break;
      case "territory-black":
      case "territory-white": {
        const isBlack = marker.kind === "territory-black";
        const stoneColor = isBlack ? "var(--stone-black, #161616)" : "var(--stone-white, #f5f3ee)";
        const rx = x - CELL * 0.275;
        const ry = y - CELL * 0.275;
        const rw = CELL * 0.55;
        const rh = CELL * 0.55;
        g.append(svgEl("rect", {
          x: rx, y: ry, width: rw, height: rh,
          fill: stoneColor, opacity: 0.55, stroke: "var(--board-line, #2b1c0f)", "stroke-width": 1,
        }));
        // The black/white distinction has to survive fill-color alone
        // being indistinguishable (colorblindness, grayscale display,
        // low contrast): white territory carries a diagonal cross no
        // black territory marker ever draws, so shape — not only color —
        // tells the two apart.
        if (!isBlack) {
          g.append(
            svgEl("line", { x1: rx, y1: ry, x2: rx + rw, y2: ry + rh, stroke: "var(--board-line, #2b1c0f)", "stroke-width": 1.5 }),
            svgEl("line", { x1: rx + rw, y1: ry, x2: rx, y2: ry + rh, stroke: "var(--board-line, #2b1c0f)", "stroke-width": 1.5 }),
          );
        }
        break;
      }
      case "event":
        g.append(svgEl("circle", {
          cx: x, cy: y, r: EVENT_R,
          fill: "var(--board-bg, #dfb676)", "fill-opacity": 0.85,
          stroke: "var(--board-accent, #3a7ca5)", "stroke-width": 2.5,
        }));
        break;
      default:
        return null; // unknown marker kind: draw nothing rather than guess
    }
    if (marker.label) g.append(labelText(x, y, marker.label));
    return g;
  }

  function renderMarkers(markers) {
    markersGroup.replaceChildren();
    territoryByPt.clear();
    for (const marker of markers) {
      const el = renderMarker(marker);
      if (el) markersGroup.append(el);
      if (marker.kind === "territory-black" || marker.kind === "territory-white") {
        territoryByPt.set(marker.pt, marker.kind);
      }
    }
  }

  // ---- pending ghost + keyboard cursor ---------------------------------
  //
  // `pendingPt` is the tap-then-confirm ghost: set by a first activation
  // (click/tap/Enter), moved by an activation elsewhere, and consumed
  // (fires onIntent, then clears) by a second activation on the same
  // point. `hoverPt` is a purely visual desktop-mouse preview shown only
  // while nothing is pending; hovering never moves an already-pending
  // ghost and never fires onIntent.

  let pendingPt = null;
  let hoverPt = null;
  let cursor = pointToCell(formatPoint(Math.floor((size - 1) / 2), size - Math.floor((size - 1) / 2)), size);
  let focused = false;

  function renderGhost() {
    ghostGroup.replaceChildren();
    const pt = pendingPt ?? (interactive ? hoverPt : null);
    if (!pt) return;
    const { col, rowFromTop } = pointToCell(pt, size);
    ghostGroup.append(
      svgEl("circle", {
        cx: cellX(col), cy: cellY(rowFromTop), r: GHOST_R,
        fill: "var(--board-accent, #3a7ca5)", "fill-opacity": pendingPt ? 0.4 : 0.22,
        stroke: "var(--board-accent, #3a7ca5)", "stroke-width": 1.5,
      }),
    );
  }

  function renderFocusRing() {
    focusGroup.replaceChildren();
    if (!interactive || !focused) return;
    const { col, rowFromTop } = cursor;
    focusGroup.append(
      svgEl("circle", {
        cx: cellX(col), cy: cellY(rowFromTop), r: FOCUS_R,
        fill: "none", stroke: "var(--board-accent, #3a7ca5)", "stroke-width": 3,
      }),
    );
  }

  function describePoint(pt) {
    const color = stoneByPt.get(pt);
    if (color === "black") return "black stone";
    if (color === "white") return "white stone";
    const territory = territoryByPt.get(pt);
    if (territory === "territory-black") return "black territory";
    if (territory === "territory-white") return "white territory";
    return "empty";
  }

  function announce(text) {
    // Clear-then-set so a screen reader treats a repeated announcement
    // (e.g. the cursor bouncing off an edge back to the same point) as a
    // genuine change rather than a no-op.
    live.textContent = "";
    requestAnimationFrame(() => {
      live.textContent = text;
    });
  }

  function moveCursor(dCol, dRowFromTop) {
    const col = Math.min(size - 1, Math.max(0, cursor.col + dCol));
    const rowFromTop = Math.min(size - 1, Math.max(0, cursor.rowFromTop + dRowFromTop));
    cursor = { col, rowFromTop };
    renderFocusRing();
    const pt = cellToPoint(cursor.col, cursor.rowFromTop, size);
    announce(`${pt}, ${describePoint(pt)}`);
  }

  // Shared by click/tap and Enter: the tap-then-confirm rule itself.
  function activate(pt) {
    if (pendingPt === pt) {
      const target = pendingPt;
      pendingPt = null;
      renderGhost();
      onIntent(target);
    } else {
      pendingPt = pt;
      renderGhost();
      announce(`${pt}, pending`);
    }
  }

  // ---- hit-testing layer (topmost, invisible, the only clickable part) -

  if (interactive) {
    const hitsGroup = svgEl("g", { "pointer-events": "all" });
    for (let col = 0; col < size; col++) {
      for (let rowFromTop = 0; rowFromTop < size; rowFromTop++) {
        const pt = cellToPoint(col, rowFromTop, size);
        hitsGroup.append(
          svgEl("rect", {
            x: cellX(col) - CELL / 2, y: cellY(rowFromTop) - CELL / 2,
            width: CELL, height: CELL,
            fill: "none", "data-pt": pt,
          }),
        );
      }
    }
    svg.append(hitsGroup);

    hitsGroup.addEventListener("click", (event) => {
      const pt = event.target?.dataset?.pt;
      if (!pt) return;
      cursor = pointToCell(pt, size);
      renderFocusRing();
      group.focus();
      activate(pt);
    });

    hitsGroup.addEventListener("pointerover", (event) => {
      if (event.pointerType !== "mouse") return; // "desktop hover", not a touch tap
      const pt = event.target?.dataset?.pt;
      if (!pt || pendingPt) return;
      hoverPt = pt;
      renderGhost();
    });

    hitsGroup.addEventListener("pointerout", (event) => {
      if (event.pointerType !== "mouse") return;
      if (!hoverPt || pendingPt) return;
      hoverPt = null;
      renderGhost();
    });
  }

  // ---- the single focusable group --------------------------------------

  const group = svgEl("g");
  if (interactive) {
    group.setAttribute("tabindex", "0");
    group.style.outline = "none"; // the focus ring above is the visible focus indicator
    // role="application" so arrow keys and Enter reach this handler
    // instead of being consumed by the screen reader's own browse-mode
    // navigation, which is the standard fix for a custom-key-driven
    // widget of this shape.
    group.setAttribute("role", "application");
    group.setAttribute("aria-roledescription", "Go board");
    group.setAttribute("aria-label", `Go board, ${size} by ${size}`);

    group.addEventListener("focus", () => {
      focused = true;
      renderFocusRing();
    });
    group.addEventListener("blur", () => {
      focused = false;
      renderFocusRing();
    });

    group.addEventListener("keydown", (event) => {
      switch (event.key) {
        case "ArrowUp": moveCursor(0, -1); event.preventDefault(); break;
        case "ArrowDown": moveCursor(0, 1); event.preventDefault(); break;
        case "ArrowLeft": moveCursor(-1, 0); event.preventDefault(); break;
        case "ArrowRight": moveCursor(1, 0); event.preventDefault(); break;
        case "Enter":
        case " ":
          activate(cellToPoint(cursor.col, cursor.rowFromTop, size));
          event.preventDefault();
          break;
        case "Escape":
          if (pendingPt !== null) {
            pendingPt = null;
            renderGhost();
            announce("cleared");
          }
          event.preventDefault();
          break;
        default:
          break;
      }
    });
  }
  svg.append(group);

  // ---- public handle ----------------------------------------------------

  return {
    setStones(stones) {
      stoneByPt.clear();
      for (const { pt, color } of stones) stoneByPt.set(pt, color);
      renderStones();
    },
    setMarkers(markers) {
      renderMarkers(markers ?? []);
    },
    setPending(pt) {
      pendingPt = pt ?? null;
      if (pendingPt !== null) cursor = pointToCell(pendingPt, size);
      renderGhost();
      renderFocusRing();
    },
    announce,
    focus() {
      group.focus();
    },
    destroy() {
      root.remove();
    },
  };
}
