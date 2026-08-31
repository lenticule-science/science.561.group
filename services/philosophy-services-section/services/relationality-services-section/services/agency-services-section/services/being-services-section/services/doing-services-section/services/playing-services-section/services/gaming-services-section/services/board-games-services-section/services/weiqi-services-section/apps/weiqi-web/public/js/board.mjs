// <weiqi-board>-equivalent SVG board component (plain ES module, no custom
// element registration required -- constructed directly against a
// container). Spec (weiqi-platform-plan.md, "Interface"; the Experience
// Brief's task items 1-2): 7x7/9x9/13x13/19x19, star points, last-move +
// ko markers, dimensional stones with soft shadow and deterministic
// per-stone variance, placement/capture animation (reduced-motion
// honored), territory shading, a hover ghost stone, a touch model with a
// magnified drag preview (default) and an explicit tap-then-confirm mode
// for the cautious, pinch-zoom + pan on large boards, an annotation layer
// for semantic-event badges, theme via CSS custom properties, screen-
// reader move announcements, no color-only signals.
//
// This module knows nothing about the rules kernel and imports nothing
// from it -- it is a pure renderer plus an input-gesture recognizer. It
// speaks coordinates in the same Go-notation convention the kernel's
// board.mts uses (letters skip "I"; row 1 is the array's row 0, i.e. the
// TOP row -- see that module's own doc comment) so a caller can pass a
// WeiqiBoard-emitted coordinate straight to `Game.play()` unmodified, but
// it re-derives that convention locally rather than importing it, keeping
// the presentation layer decoupled from the rules layer per the plan's own
// separation of concerns. It DOES import two small sibling presentation
// helpers -- stone-variance.mjs (deterministic visual jitter) and
// touch-gesture.mjs (the touch state machine) -- factored out specifically
// so their logic is unit-testable without a DOM (see test/*.test.mts);
// neither knows anything about SVG, the kernel, or rules.

import { stoneVariance } from "./stone-variance.mjs";
import { TouchGestureController, MODE_DRAG, MODE_CONFIRM } from "./touch-gesture.mjs";

const EMPTY = 0;
const BLACK = 1;
const WHITE = 2;
const COLUMN_LETTERS = "ABCDEFGHJKLMNOPQRSTUVWXYZ"; // skips I, matching the kernel

function colToLetter(col) {
  return COLUMN_LETTERS[col];
}

function coordFor(col, row) {
  return `${colToLetter(col)}${row + 1}`;
}

function clamp(v, min, max) {
  return Math.min(max, Math.max(min, v));
}

/** Standard hoshi (star point) layout for a square board of `size`,
 * derived by symmetry rather than a hardcoded per-size table: corner star
 * points sit on the 3rd line (9x9) or 4th line (13x13/19x19) from each
 * edge; 19x19 additionally stars the edge midpoints; every size from 9 up
 * stars the center (tengen). Returns [col, row] pairs, 0-indexed, row 0 =
 * top. Reproduces rulesets.mts's handicap-point table exactly for 9/13/19
 * by construction (both are the same standard layout), without importing
 * it -- this is presentation knowledge, not rules logic. */
function starPoints(size) {
  if (size < 9) return [];
  const edge = size === 9 ? 2 : 3;
  const far = size - 1 - edge;
  const center = Math.floor(size / 2);
  const pts = [];
  for (const r of [edge, far]) {
    for (const c of [edge, far]) pts.push([c, r]);
  }
  if (size >= 19) {
    pts.push([center, edge], [center, far], [edge, center], [far, center]);
  }
  pts.push([center, center]);
  return pts;
}

const NS = "http://www.w3.org/2000/svg";
function svgEl(tag, attrs = {}) {
  const el = document.createElementNS(NS, tag);
  for (const [k, v] of Object.entries(attrs)) el.setAttribute(k, String(v));
  return el;
}

function svgStop(offset, colorExpr) {
  const s = svgEl("stop", { offset });
  s.style.stopColor = colorExpr;
  return s;
}

/** Glyph + color + label metadata for each on-board semantic-event badge
 * and (task item 4) each concept toast -- exported so play-app.mjs's toast
 * strip draws from the same glyph table as the board's own badges,
 * instead of maintaining a second copy. */
export const EVENT_GLYPHS = {
  "atari-given": { glyph: "!", color: "var(--badge-atari)", label: "atari" },
  "atari-escaped": { glyph: "↗", color: "var(--badge-atari)", label: "atari escaped" },
  capture: { glyph: "×", color: "var(--badge-capture)", label: "capture" },
  "ko-started": { glyph: "↺", color: "var(--badge-ko)", label: "ko started" },
  "ko-resolved": { glyph: "↺", color: "var(--badge-ko)", label: "ko resolved" },
  connection: { glyph: "⋈", color: "var(--badge-connection)", label: "connection" },
  "eye-formed": { glyph: "◎", color: "var(--badge-eye)", label: "eye formed" },
  "group-killed": { glyph: "☠", color: "var(--badge-killed)", label: "group killed" },
};

export function getEventGlyph(type) {
  return EVENT_GLYPHS[type] ?? null;
}

let instanceCounter = 0;

export class WeiqiBoard extends EventTarget {
  #container;
  #wrapEl;
  #size;
  #cell;
  #margin;
  #svg;
  #boardContent;
  #boardBg;
  #gridLayer;
  #territoryLayer;
  #stonesLayer;
  #markersLayer;
  #badgeLayer;
  #interactionLayer;
  #liveRegion;
  #pendingLabel;
  #cancelBtn;
  #zoomResetBtn;
  #magWrap;
  #magSvg;
  #board = new Uint8Array(0);
  #toMove = BLACK;
  #lastMoveCoord = null;
  #koCoord = null;
  #territoryMap = null;
  #legalityChecker = null;
  #cursor = null; // keyboard-navigation cursor [col,row]
  #reducedMotion = false;
  #stoneEls = new Map(); // point index -> <g> element, for diff-based capture/place animation
  #ghostLayer = null;
  #cursorEl = null;

  // Touch gesture / zoom-pan state
  #touchController;
  #activePointers = new Map(); // pointerId -> {x, y}, touch only
  #pinchState = null;
  #panPointerId = null;
  #panStart = null;
  #panMoved = false;
  #zoomScale = 1;
  #panX = 0;
  #panY = 0;

  // Per-instance ids so multiple boards on one page never collide on url(#...) refs
  #ids;

  constructor(container, { size = 9, cell = 42, margin = 34 } = {}) {
    super();
    this.#container = container;
    this.#cell = cell;
    this.#margin = margin;
    const id = instanceCounter++;
    this.#ids = {
      content: `wq-content-${id}`,
      black: `wq-black-${id}`,
      white: `wq-white-${id}`,
      shadow: `wq-shadow-${id}`,
      grain: `wq-grain-${id}`,
      clip: `wq-clip-${id}`,
      vignette: `wq-vignette-${id}`,
    };
    this.#reducedMotion =
      typeof window !== "undefined" &&
      window.matchMedia &&
      window.matchMedia("(prefers-reduced-motion: reduce)").matches;
    this.#touchController = new TouchGestureController({ mode: MODE_DRAG });
    this.#buildSkeleton();
    this.setSize(size);
  }

  // --- Setup -------------------------------------------------------------

  #buildSkeleton() {
    this.#container.innerHTML = "";
    this.#container.classList.add("weiqi-board-root");

    const wrap = document.createElement("div");
    wrap.className = "weiqi-board-wrap-inner";
    wrap.style.position = "relative";
    wrap.style.display = "inline-block";
    wrap.style.width = "100%";
    wrap.style.overflow = "hidden";
    wrap.style.borderRadius = "6px";
    this.#wrapEl = wrap;

    this.#svg = svgEl("svg", { role: "img" });
    this.#svg.style.display = "block";
    this.#svg.style.width = "100%";
    this.#svg.style.height = "auto";
    this.#svg.style.touchAction = "none";

    const defs = svgEl("defs");
    this.#svg.appendChild(defs);

    const blackGrad = svgEl("radialGradient", { id: this.#ids.black, cx: "38%", cy: "32%", r: "72%" });
    blackGrad.append(
      svgStop("0%", "var(--board-black-highlight)"),
      svgStop("60%", "var(--board-black)"),
      svgStop("100%", "var(--board-black)"),
    );
    defs.appendChild(blackGrad);

    const whiteGrad = svgEl("radialGradient", { id: this.#ids.white, cx: "36%", cy: "30%", r: "78%" });
    whiteGrad.append(
      svgStop("0%", "#ffffff"),
      svgStop("55%", "var(--board-white)"),
      svgStop("100%", "var(--board-white-shade, var(--board-white))"),
    );
    defs.appendChild(whiteGrad);

    // Soft contact shadow: a small blurred ellipse drawn beneath each
    // stone, offset toward the light -- a shared filter, not a per-stone
    // one, so 361 stones on a full 19x19 cost one filter definition.
    const shadowFilter = svgEl("filter", { id: this.#ids.shadow, x: "-60%", y: "-60%", width: "220%", height: "220%" });
    shadowFilter.appendChild(svgEl("feGaussianBlur", { in: "SourceGraphic", stdDeviation: 0.9 }));
    defs.appendChild(shadowFilter);

    // Wood grain: deterministic feTurbulence (fixed `seed`, per the SVG
    // spec's own reference algorithm -- same seed/params always produce
    // the same noise field) tinted to the board's own wood-line color via
    // a fixed color matrix, so the grain reads as *this* board's wood,
    // not an arbitrary texture, and stays a pure function of the filter
    // graph -- no Math.random anywhere in the ground rendering either.
    const grainFilter = svgEl("filter", { id: this.#ids.grain, x: "-5%", y: "-5%", width: "110%", height: "110%" });
    grainFilter.appendChild(
      svgEl("feTurbulence", { type: "fractalNoise", baseFrequency: "0.9 0.045", numOctaves: 2, seed: 11, result: "grain" }),
    );
    grainFilter.appendChild(
      svgEl("feColorMatrix", {
        in: "grain",
        type: "matrix",
        values: "0 0 0 0 0.42  0 0 0 0 0.29  0 0 0 0 0.13  0.30 0.30 0.30 0 0",
      }),
    );
    defs.appendChild(grainFilter);

    const vignette = svgEl("radialGradient", { id: this.#ids.vignette, cx: "50%", cy: "42%", r: "75%" });
    const vTransparent = svgStop("0%", "#000000");
    vTransparent.style.stopOpacity = "0";
    const vMid = svgStop("78%", "#000000");
    vMid.style.stopOpacity = "0";
    const vEdge = svgStop("100%", "#000000");
    vEdge.style.stopOpacity = "0.16";
    vignette.append(vTransparent, vMid, vEdge);
    defs.appendChild(vignette);

    const clip = svgEl("clipPath", { id: this.#ids.clip });
    const clipRect = svgEl("rect", { x: 0, y: 0, width: 0, height: 0, rx: 6 });
    clip.appendChild(clipRect);
    defs.appendChild(clip);
    this.#clipRectEl = clipRect;

    const content = svgEl("g", { id: this.#ids.content });
    this.#svg.appendChild(content);
    this.#boardContent = content;

    const boardBg = svgEl("g");
    boardBg.setAttribute("class", "weiqi-board-bg");
    content.appendChild(boardBg);
    this.#boardBg = boardBg;

    const grid = svgEl("g");
    content.appendChild(grid);
    this.#gridLayer = grid;

    this.#territoryLayer = svgEl("g");
    content.appendChild(this.#territoryLayer);

    this.#stonesLayer = svgEl("g");
    content.appendChild(this.#stonesLayer);

    this.#markersLayer = svgEl("g");
    content.appendChild(this.#markersLayer);

    this.#badgeLayer = svgEl("g");
    content.appendChild(this.#badgeLayer);

    this.#interactionLayer = svgEl("g");
    content.appendChild(this.#interactionLayer);

    wrap.appendChild(this.#svg);

    // The magnifier: a small fixed-size SVG viewport that <use>-mirrors
    // the SAME board-content group at a tighter viewBox, offset above the
    // touch point while dragging (task item 2's misclick fix). Because
    // it's a live <use> reference (not a redraw), updating its viewBox
    // each pointermove is the only per-frame cost -- the ghost stone and
    // real stones it shows are the exact same DOM nodes, not a second
    // render pass.
    this.#magWrap = document.createElement("div");
    this.#magWrap.className = "weiqi-board-magnifier";
    this.#magWrap.hidden = true;
    this.#magSvg = svgEl("svg", { width: 132, height: 132 });
    const magUse = svgEl("use");
    magUse.setAttribute("href", `#${this.#ids.content}`);
    this.#magSvg.appendChild(magUse);
    this.#magWrap.appendChild(this.#magSvg);
    wrap.appendChild(this.#magWrap);

    this.#container.appendChild(wrap);

    // Live region for screen-reader move announcements + illegal-move
    // feedback. Visually hidden (see theme.css .sr-only), never
    // color-dependent.
    this.#liveRegion = document.createElement("div");
    this.#liveRegion.className = "sr-only";
    this.#liveRegion.setAttribute("aria-live", "polite");
    this.#liveRegion.setAttribute("role", "status");
    this.#container.appendChild(this.#liveRegion);

    // Pending-tap affordance row: visible text (not color-only) plus an
    // explicit Cancel control -- the touch-model gap the brief calls out
    // ("no explicit cancel gesture") for confirm mode, and a Reset-zoom
    // control for pinch-zoomed large boards.
    const controlsRow = document.createElement("div");
    controlsRow.className = "weiqi-board-touch-controls";

    this.#pendingLabel = document.createElement("div");
    this.#pendingLabel.className = "weiqi-board-pending-label";
    controlsRow.appendChild(this.#pendingLabel);

    this.#cancelBtn = document.createElement("button");
    this.#cancelBtn.type = "button";
    this.#cancelBtn.className = "weiqi-board-cancel-btn";
    this.#cancelBtn.textContent = "Cancel";
    this.#cancelBtn.hidden = true;
    this.#cancelBtn.addEventListener("click", () => {
      const action = this.#touchController.cancel();
      this.#applyTouchAction(action, null);
    });
    controlsRow.appendChild(this.#cancelBtn);

    this.#zoomResetBtn = document.createElement("button");
    this.#zoomResetBtn.type = "button";
    this.#zoomResetBtn.className = "weiqi-board-zoom-reset-btn";
    this.#zoomResetBtn.textContent = "Reset zoom";
    this.#zoomResetBtn.hidden = true;
    this.#zoomResetBtn.addEventListener("click", () => this.#resetZoom());
    controlsRow.appendChild(this.#zoomResetBtn);

    this.#container.appendChild(controlsRow);

    this.#svg.tabIndex = 0;
    this.#svg.setAttribute("aria-label", "Weiqi board. Use arrow keys to move the cursor and Enter to place a stone.");
    this.#svg.addEventListener("keydown", this.#onKeyDown);
    this.#svg.addEventListener("pointermove", this.#onPointerMove);
    this.#svg.addEventListener("pointerleave", this.#onPointerLeave);
    this.#svg.addEventListener("pointerdown", this.#onPointerDown);
    this.#svg.addEventListener("pointerup", this.#onPointerUp);
    this.#svg.addEventListener("pointercancel", this.#onPointerCancel);
    this.#svg.addEventListener("focus", this.#onFocus);
  }

  #clipRectEl = null;

  destroy() {
    this.#svg.removeEventListener("keydown", this.#onKeyDown);
    this.#svg.removeEventListener("pointermove", this.#onPointerMove);
    this.#svg.removeEventListener("pointerleave", this.#onPointerLeave);
    this.#svg.removeEventListener("pointerdown", this.#onPointerDown);
    this.#svg.removeEventListener("pointerup", this.#onPointerUp);
    this.#svg.removeEventListener("pointercancel", this.#onPointerCancel);
    this.#svg.removeEventListener("focus", this.#onFocus);
    this.#container.innerHTML = "";
  }

  get size() {
    return this.#size;
  }

  /** "drag" (default, magnified drag-to-place) or "confirm"
   * (tap-then-confirm, for the cautious). See touch-gesture.mjs's doc
   * comment for the full behavioral contract of each. */
  setTouchMode(mode) {
    this.#touchController.setMode(mode === "confirm" ? MODE_CONFIRM : MODE_DRAG);
    this.#clearGhost();
    this.#hideMagnifier();
    this.#pendingLabel.textContent = "";
    this.#cancelBtn.hidden = true;
  }

  get touchMode() {
    return this.#touchController.mode === MODE_CONFIRM ? "confirm" : "drag";
  }

  setSize(size) {
    this.#size = size;
    this.#board = new Uint8Array(size * size);
    this.#stoneEls.clear();
    this.#stonesLayer.innerHTML = "";
    this.#lastMoveCoord = null;
    this.#koCoord = null;
    this.#territoryMap = null;
    this.#activePointers.clear();
    this.#pinchState = null;
    this.#panPointerId = null;
    this.#touchController.setMode(this.#touchController.mode === MODE_CONFIRM ? MODE_CONFIRM : MODE_DRAG);
    this.#cursor = [Math.floor(size / 2), Math.floor(size / 2)];
    const dim = this.#margin * 2 + this.#cell * (size - 1);
    this.#svg.setAttribute("viewBox", `0 0 ${dim} ${dim}`);
    if (this.#clipRectEl) {
      this.#clipRectEl.setAttribute("width", dim);
      this.#clipRectEl.setAttribute("height", dim);
    }
    this.#resetZoom();
    this.#drawStaticLayers();
    this.#renderTerritory();
    this.#redrawMarkers();
  }

  setLegalityChecker(fn) {
    this.#legalityChecker = fn;
  }

  // --- Coordinate <-> pixel geometry --------------------------------------

  #px(col, row) {
    return [this.#margin + col * this.#cell, this.#margin + row * this.#cell];
  }

  #nearestPoint(clientX, clientY) {
    const rect = this.#svg.getBoundingClientRect();
    const dim = this.#margin * 2 + this.#cell * (this.#size - 1);
    const scale = dim / rect.width;
    const x = (clientX - rect.left) * scale;
    const y = (clientY - rect.top) * scale;
    const col = Math.round((x - this.#margin) / this.#cell);
    const row = Math.round((y - this.#margin) / this.#cell);
    if (col < 0 || col >= this.#size || row < 0 || row >= this.#size) return null;
    return [col, row];
  }

  #pointFor(coord) {
    // Reverse of coordFor: "D4" -> [col, row] 0-indexed.
    const m = /^([A-Za-z]+)(\d+)$/.exec(coord.trim());
    if (!m) return null;
    const col = COLUMN_LETTERS.indexOf(m[1].toUpperCase());
    const row = Number(m[2]) - 1;
    if (col < 0 || col >= this.#size || row < 0 || row >= this.#size) return null;
    return [col, row];
  }

  // --- Static layers: board wood, grid lines, star points, coord labels --

  #drawStaticLayers() {
    this.#boardBg.innerHTML = "";
    this.#gridLayer.innerHTML = "";
    const dim = this.#margin * 2 + this.#cell * (this.#size - 1);

    const bg = svgEl("rect", {
      x: 0,
      y: 0,
      width: dim,
      height: dim,
      rx: 6,
      fill: "var(--board-wood)",
      stroke: "var(--board-wood-line)",
      "stroke-width": 2,
    });
    this.#boardBg.appendChild(bg);

    // Deterministic wood-grain texture (see the filter's own comment) and
    // a soft vignette for depth -- both purely presentational, both
    // clipped to the board's own rounded corners.
    this.#boardBg.appendChild(
      svgEl("rect", { x: 0, y: 0, width: dim, height: dim, filter: `url(#${this.#ids.grain})`, "clip-path": `url(#${this.#ids.clip})` }),
    );
    this.#boardBg.appendChild(
      svgEl("rect", {
        x: 0,
        y: 0,
        width: dim,
        height: dim,
        fill: `url(#${this.#ids.vignette})`,
        "clip-path": `url(#${this.#ids.clip})`,
      }),
    );

    const last = this.#size - 1;
    for (let i = 0; i < this.#size; i++) {
      const [x0, y0] = this.#px(i, 0);
      const [x1, y1] = this.#px(i, last);
      this.#gridLayer.appendChild(
        svgEl("line", { x1: x0, y1: y0, x2: x1, y2: y1, stroke: "var(--board-line)", "stroke-width": 1.2 }),
      );
      const [xr0, yr0] = this.#px(0, i);
      const [xr1, yr1] = this.#px(last, i);
      this.#gridLayer.appendChild(
        svgEl("line", { x1: xr0, y1: yr0, x2: xr1, y2: yr1, stroke: "var(--board-line)", "stroke-width": 1.2 }),
      );
    }

    for (const [c, r] of starPoints(this.#size)) {
      const [x, y] = this.#px(c, r);
      this.#gridLayer.appendChild(svgEl("circle", { cx: x, cy: y, r: 3.4, fill: "var(--board-star)" }));
    }

    // Coordinate labels: columns along the top, rows along the left.
    // Legible without color: plain text, not markers.
    const fontSize = Math.max(9, this.#cell * 0.24);
    for (let c = 0; c < this.#size; c++) {
      const [x] = this.#px(c, 0);
      const label = svgEl("text", {
        x,
        y: this.#margin - this.#cell * 0.45,
        "text-anchor": "middle",
        "font-size": fontSize,
        "font-family": "system-ui, sans-serif",
        fill: "var(--ink-soft)",
      });
      label.textContent = colToLetter(c);
      this.#gridLayer.appendChild(label);
    }
    for (let r = 0; r < this.#size; r++) {
      const [, y] = this.#px(0, r);
      const label = svgEl("text", {
        x: this.#margin - this.#cell * 0.6,
        y: y + fontSize * 0.35,
        "text-anchor": "middle",
        "font-size": fontSize,
        "font-family": "system-ui, sans-serif",
        fill: "var(--ink-soft)",
      });
      label.textContent = String(r + 1);
      this.#gridLayer.appendChild(label);
    }
  }

  // --- Territory shading (scoring views) ----------------------------------

  /** `map` is null to clear, or a flat array/Uint8Array of length
   * size*size, row-major, values 0=neutral/1=black-territory/2=white-
   * territory -- the same point layout as `setPosition`'s board. Not
   * wired to any current page (capture-go never reaches scoring; see the
   * plan's Phase 3), but a real, tested rendering capability a future
   * scoring view calls into rather than building its own overlay. */
  setTerritory(map) {
    this.#territoryMap = map;
    this.#renderTerritory();
  }

  #renderTerritory() {
    this.#territoryLayer.innerHTML = "";
    if (!this.#territoryMap) return;
    const s = this.#cell * 0.34;
    for (let row = 0; row < this.#size; row++) {
      for (let col = 0; col < this.#size; col++) {
        const owner = this.#territoryMap[row * this.#size + col];
        if (!owner) continue;
        const [x, y] = this.#px(col, row);
        this.#territoryLayer.appendChild(
          svgEl("rect", {
            x: x - s,
            y: y - s,
            width: s * 2,
            height: s * 2,
            rx: s * 0.3,
            fill: owner === BLACK ? "var(--board-black)" : "var(--board-white)",
            opacity: 0.22,
          }),
        );
      }
    }
  }

  // --- Position rendering (diff-based: enables placement/capture animation)

  /** `board` is a flat array/Uint8Array of length size*size, row-major,
   * values 0=empty/1=black/2=white, row 0 = top -- exactly the kernel
   * Position.board layout. `toMove` (1 or 2) sets whose color the hover
   * ghost stone previews. Diffs against the previously rendered board so
   * only stones that actually changed animate (place: scale+fade in;
   * capture: lift+fade out), honoring prefers-reduced-motion. */
  setPosition(board, { toMove = BLACK } = {}) {
    const prev = this.#board;
    this.#board = board;
    this.#toMove = toMove;
    this.#diffAndRenderStones(prev, board);
  }

  #diffAndRenderStones(prevBoard, nextBoard) {
    const size = this.#size;
    for (let row = 0; row < size; row++) {
      for (let col = 0; col < size; col++) {
        const idx = row * size + col;
        const was = idx < prevBoard.length ? prevBoard[idx] : EMPTY;
        const now = nextBoard[idx];
        if (was === now) continue;
        if (was !== EMPTY) this.#animateCaptureAt(idx, col, row);
        if (now !== EMPTY) this.#animatePlaceAt(idx, col, row, now);
      }
    }
  }

  #animatePlaceAt(idx, col, row, color) {
    const [x, y] = this.#px(col, row);
    const r = this.#cell * 0.46;
    const g = this.#stoneEl(x, y, r, color, coordFor(col, row), { col, row });
    this.#stonesLayer.appendChild(g);
    this.#stoneEls.set(idx, g);
    if (!this.#reducedMotion) {
      g.style.transformOrigin = `${x}px ${y}px`;
      g.classList.add("wq-stone-place");
      g.addEventListener("animationend", () => g.classList.remove("wq-stone-place"), { once: true });
    }
  }

  #animateCaptureAt(idx, col, row) {
    const g = this.#stoneEls.get(idx);
    this.#stoneEls.delete(idx);
    if (!g) return;
    if (this.#reducedMotion) {
      g.remove();
      return;
    }
    // A stone captured while its own placement animation is still
    // in-flight (possible if a capture follows within ~160ms of a
    // placement -- not realistic at human/bot move cadence, but cheap to
    // make robust) would otherwise have two CSS animations targeting the
    // same opacity/transform properties at once, an undefined-looking
    // composite. Drop the place animation first so only the capture
    // animation ever governs the element.
    g.classList.remove("wq-stone-place");
    const [x, y] = this.#px(col, row);
    g.style.transformOrigin = `${x}px ${y}px`;
    g.classList.add("wq-stone-capture");
    g.addEventListener("animationend", () => g.remove(), { once: true });
    setTimeout(() => g.remove(), 500); // safety net if animationend never fires
  }

  /** Build one stone's <g>: soft contact shadow, gradient-filled body
   * (radial gradient simulating slate/shell), and a rotated sheen
   * highlight -- all offset/scaled/rotated by a small deterministic
   * variance seeded from (col,row,size), never Math.random, so the exact
   * same position always renders to the exact same markup (rendering
   * purity; see stone-variance.mjs and its test). */
  #stoneEl(x, y, r, color, coord, { opacity = 1, col = null, row = null } = {}) {
    const isBlack = color === BLACK;
    const variance = col !== null && row !== null ? stoneVariance(col, row, this.#size) : { dx: 0, dy: 0, scale: 1, sheenAngle: 0, sheenReach: 1 };
    const jx = x + variance.dx * r;
    const jy = y + variance.dy * r;
    const jr = r * variance.scale;

    const g = svgEl("g", { class: "wq-stone", opacity });

    g.appendChild(
      svgEl("ellipse", {
        cx: jx + jr * 0.13,
        cy: jy + jr * 0.2,
        rx: jr * 0.98,
        ry: jr * 0.9,
        fill: "var(--board-shadow, rgba(20,14,4,0.4))",
        opacity: 0.3,
        filter: `url(#${this.#ids.shadow})`,
      }),
    );

    g.appendChild(
      svgEl("circle", {
        cx: jx,
        cy: jy,
        r: jr,
        fill: isBlack ? `url(#${this.#ids.black})` : `url(#${this.#ids.white})`,
        stroke: isBlack ? "var(--board-black-highlight)" : "var(--board-white-stroke)",
        "stroke-width": isBlack ? 0.6 : 1.4,
      }),
    );

    // Slate stones (black) get a glossy highlight; shell stones (white)
    // get a subtler, cooler-toned banding -- real Go stones read
    // differently by material, not just by fill color.
    const sheenR = jr * 0.48 * variance.sheenReach;
    g.appendChild(
      svgEl("ellipse", {
        cx: jx - jr * 0.3,
        cy: jy - jr * 0.34,
        rx: sheenR,
        ry: sheenR * 0.6,
        fill: isBlack ? "#ffffff" : "var(--board-white-stroke)",
        opacity: isBlack ? 0.2 : 0.12,
        transform: `rotate(${variance.sheenAngle.toFixed(1)} ${jx} ${jy})`,
      }),
    );

    const title = svgEl("title");
    title.textContent = `${isBlack ? "Black" : "White"} stone at ${coord}`;
    g.appendChild(title);
    return g;
  }

  // --- Last-move + ko markers (shape-coded, not color-only) ---------------

  setLastMove(coord) {
    this.#lastMoveCoord = coord;
    this.#redrawMarkers();
  }

  /** `coord` (Go notation) or null to clear -- the point currently
   * forbidden by an active ko, per the kernel's Game.activeKoPoint (a
   * caller converts the kernel's point index via pointToCoord before
   * calling this; board.mjs stays kernel-import-free). Rendered as a
   * diamond outline, a distinct SHAPE from the last-move square, so ko
   * and last-move never read as "the same marker, different color" under
   * any color-vision condition. */
  setKoPoint(coord) {
    this.#koCoord = coord;
    this.#redrawMarkers();
  }

  #redrawMarkers() {
    this.#markersLayer.innerHTML = "";
    if (this.#lastMoveCoord) {
      const p = this.#pointFor(this.#lastMoveCoord);
      if (p) {
        const [col, row] = p;
        const [x, y] = this.#px(col, row);
        const s = this.#cell * 0.22;
        this.#markersLayer.appendChild(
          svgEl("rect", {
            x: x - s,
            y: y - s,
            width: s * 2,
            height: s * 2,
            fill: "none",
            stroke: "var(--board-last-move)",
            "stroke-width": 2,
          }),
        );
      }
    }
    if (this.#koCoord) {
      const p = this.#pointFor(this.#koCoord);
      if (p) {
        const [col, row] = p;
        const [x, y] = this.#px(col, row);
        const s = this.#cell * 0.26;
        const diamond = svgEl("rect", {
          x: x - s,
          y: y - s,
          width: s * 2,
          height: s * 2,
          fill: "none",
          stroke: "var(--board-ko)",
          "stroke-width": 2,
          transform: `rotate(45 ${x} ${y})`,
          class: this.#reducedMotion ? "" : "wq-ko-pulse",
        });
        const title = svgEl("title");
        title.textContent = `Ko at ${this.#koCoord}: immediate recapture forbidden`;
        diamond.appendChild(title);
        this.#markersLayer.appendChild(diamond);
      }
    }
  }

  /** `events` is the kernel's SemanticEvent[] (or any array of
   * { type, term, termRef, detail }). Events lacking a `detail.point`
   * (e.g. group-killed, pass) place no on-board badge -- callers should
   * also render the full event list textually (see play-app.mjs's event
   * log), which is where those live. */
  setAnnotations(events) {
    this.#badgeLayer.innerHTML = "";
    for (const ev of events) {
      const spec = EVENT_GLYPHS[ev.type];
      const pointCoord = ev.detail && ev.detail.point;
      if (!spec || !pointCoord) continue;
      const p = this.#pointFor(pointCoord);
      if (!p) continue;
      const [col, row] = p;
      const [x, y] = this.#px(col, row);
      const bx = x + this.#cell * 0.32;
      const by = y - this.#cell * 0.32;

      const g = svgEl("g", { tabindex: 0, role: "img", "aria-label": `${spec.label} at ${pointCoord}` });
      g.style.cursor = "help";
      if (!this.#reducedMotion) g.classList.add("wq-badge-in");
      g.appendChild(svgEl("circle", { cx: bx, cy: by, r: this.#cell * 0.22, fill: spec.color, stroke: "var(--badge-ink)", "stroke-width": 1.2 }));
      const glyph = svgEl("text", {
        x: bx,
        y: by + this.#cell * 0.08,
        "text-anchor": "middle",
        "font-size": this.#cell * 0.26,
        "font-family": "system-ui, sans-serif",
        fill: "var(--badge-ink)",
      });
      glyph.textContent = spec.glyph;
      g.appendChild(glyph);
      const title = svgEl("title");
      title.textContent = `${spec.label}: ${pointCoord}`;
      g.appendChild(title);

      g.addEventListener("mouseenter", () => this.#emitTermHover(ev.term, g, true));
      g.addEventListener("mouseleave", () => this.#emitTermHover(ev.term, g, false));
      g.addEventListener("focus", () => this.#emitTermHover(ev.term, g, true));
      g.addEventListener("blur", () => this.#emitTermHover(ev.term, g, false));

      this.#badgeLayer.appendChild(g);
    }
  }

  #emitTermHover(term, anchorEl, entering) {
    this.dispatchEvent(new CustomEvent("weiqi-term-hover", { detail: { term, anchorEl, entering } }));
  }

  // --- Pointer interaction: desktop hover ghost + click -------------------

  #onFocus = () => {
    this.#drawCursor();
  };

  #ghostCoordFromEvent(evt) {
    const p = this.#nearestPoint(evt.clientX, evt.clientY);
    return p ? coordFor(p[0], p[1]) : null;
  }

  #onPointerMove = (evt) => {
    if (evt.pointerType === "touch") {
      this.#handleTouchPointerMove(evt);
      return;
    }
    const coord = this.#ghostCoordFromEvent(evt);
    if (!coord) {
      this.#clearGhost();
      return;
    }
    this.#drawGhost(coord);
  };

  #onPointerLeave = (evt) => {
    if (evt.pointerType === "touch") return;
    this.#clearGhost();
  };

  #onPointerDown = (evt) => {
    if (evt.pointerType === "touch") {
      this.#handleTouchPointerDown(evt);
      return;
    }
    const coord = this.#ghostCoordFromEvent(evt);
    if (!coord) return;
    this.#attemptMove(coord);
  };

  #onPointerUp = (evt) => {
    if (evt.pointerType === "touch") this.#handleTouchPointerUp(evt);
  };

  #onPointerCancel = (evt) => {
    if (evt.pointerType === "touch") this.#handleTouchPointerCancel(evt);
  };

  #attemptMove(coord) {
    const legal = this.#legalityChecker ? this.#legalityChecker(coord) : true;
    if (legal === false) {
      this.announce(`${coord} is not a legal move.`);
      this.dispatchEvent(new CustomEvent("weiqi-illegal", { detail: { coord } }));
      return;
    }
    this.dispatchEvent(new CustomEvent("weiqi-move", { detail: { coord } }));
  }

  #drawGhost(coord, { pending = false } = {}) {
    if (this.#ghostLayer) this.#ghostLayer.remove();
    const p = this.#pointFor(coord);
    if (!p) return;
    const [col, row] = p;
    if (this.#board[row * this.#size + col] !== EMPTY) {
      this.#ghostLayer = null;
      return;
    }
    const legal = this.#legalityChecker ? this.#legalityChecker(coord) : true;
    const [x, y] = this.#px(col, row);
    const r = this.#cell * 0.46;
    const g = svgEl("g");
    if (legal === false) {
      // Illegal preview: a distinct "forbidden" glyph (a ring with a slash),
      // not merely a red-tinted stone -- shape-coded so it reads without
      // color.
      g.appendChild(svgEl("circle", { cx: x, cy: y, r, fill: "none", stroke: "var(--badge-atari)", "stroke-width": 2, "stroke-dasharray": "4 3" }));
      g.appendChild(
        svgEl("line", {
          x1: x - r * 0.7,
          y1: y - r * 0.7,
          x2: x + r * 0.7,
          y2: y + r * 0.7,
          stroke: "var(--badge-atari)",
          "stroke-width": 2,
        }),
      );
    } else {
      const stone = this.#stoneEl(x, y, r, this.#toMove, coord, { opacity: pending ? 0.8 : 0.42, col, row });
      g.appendChild(stone);
      if (pending) {
        g.appendChild(
          svgEl("circle", {
            cx: x,
            cy: y,
            r: r + 4,
            fill: "none",
            stroke: "var(--board-hover-ring)",
            "stroke-width": 2,
            "stroke-dasharray": this.#reducedMotion ? "" : "3 3",
          }),
        );
      }
    }
    this.#ghostLayer = g;
    this.#interactionLayer.appendChild(g);
  }

  #clearGhost() {
    if (this.#ghostLayer) {
      this.#ghostLayer.remove();
      this.#ghostLayer = null;
    }
  }

  // --- Touch: drag-to-place with magnifier, or tap-then-confirm ----------

  #applyTouchAction(action, evt) {
    switch (action.type) {
      case "preview":
        this.#drawGhost(action.coord, { pending: true });
        this.#pendingLabel.textContent = `Tap ${action.coord} again to place a stone there.`;
        this.#cancelBtn.hidden = false;
        this.announce(`Previewing ${action.coord}. Tap again to confirm, or choose Cancel.`);
        break;
      case "drag-start":
        this.#drawGhost(action.coord, { pending: true });
        if (evt) this.#showMagnifier(action.coord, evt);
        this.announce(`Previewing ${action.coord}.`);
        break;
      case "drag-move":
        this.#drawGhost(action.coord, { pending: true });
        if (evt) this.#showMagnifier(action.coord, evt);
        break;
      case "drag-move-outside":
        this.#clearGhost();
        this.#hideMagnifier();
        break;
      case "commit":
        this.#clearGhost();
        this.#hideMagnifier();
        this.#pendingLabel.textContent = "";
        this.#cancelBtn.hidden = true;
        this.#attemptMove(action.coord);
        break;
      case "cancel":
        this.#clearGhost();
        this.#hideMagnifier();
        this.#pendingLabel.textContent = "";
        this.#cancelBtn.hidden = true;
        this.announce("Move cancelled.");
        break;
      default:
        break;
    }
  }

  #handleTouchPointerDown(evt) {
    this.#activePointers.set(evt.pointerId, { x: evt.clientX, y: evt.clientY });

    if (this.#size >= 13 && this.#activePointers.size >= 2) {
      this.#startPinch();
      const action = this.#touchController.cancel();
      this.#applyTouchAction(action, null);
      return;
    }
    if (this.#activePointers.size > 1) return; // extra fingers beyond a pinch: ignore

    if (this.#size >= 13 && this.#zoomScale > 1.02) {
      // While zoomed on a large board, a single finger pans; small
      // movement is retroactively treated as a tap-to-place on release
      // (see #handleTouchPointerUp) so precise placement while zoomed in
      // still works with one finger.
      this.#panPointerId = evt.pointerId;
      this.#panStart = { x: evt.clientX, y: evt.clientY, panX: this.#panX, panY: this.#panY };
      this.#panMoved = false;
      return;
    }

    const point = this.#nearestPoint(evt.clientX, evt.clientY);
    const coord = point ? coordFor(point[0], point[1]) : null;
    const action = this.#touchController.pointerDown(coord, { insideBoard: point !== null });
    this.#applyTouchAction(action, evt);
  }

  #handleTouchPointerMove(evt) {
    if (!this.#activePointers.has(evt.pointerId)) return;
    this.#activePointers.set(evt.pointerId, { x: evt.clientX, y: evt.clientY });

    if (this.#pinchState && this.#activePointers.size >= 2) {
      this.#updatePinch();
      return;
    }

    if (this.#panPointerId === evt.pointerId) {
      const dx = evt.clientX - this.#panStart.x;
      const dy = evt.clientY - this.#panStart.y;
      if (Math.abs(dx) > 6 || Math.abs(dy) > 6) this.#panMoved = true;
      this.#setPan(this.#panStart.panX + dx, this.#panStart.panY + dy);
      return;
    }

    if (this.#touchController.state !== "dragging") return;
    const point = this.#nearestPoint(evt.clientX, evt.clientY);
    const coord = point ? coordFor(point[0], point[1]) : null;
    const action = this.#touchController.pointerMove(coord, { insideBoard: point !== null });
    this.#applyTouchAction(action, evt);
  }

  #handleTouchPointerUp(evt) {
    const wasPinchPointer = this.#pinchState && this.#activePointers.has(evt.pointerId);
    this.#activePointers.delete(evt.pointerId);

    if (wasPinchPointer) {
      if (this.#activePointers.size < 2) this.#endPinch();
      return;
    }

    if (this.#panPointerId === evt.pointerId) {
      const tapish = !this.#panMoved;
      this.#panPointerId = null;
      if (tapish) {
        const point = this.#nearestPoint(evt.clientX, evt.clientY);
        if (point) this.#attemptMove(coordFor(point[0], point[1]));
      }
      return;
    }

    if (this.#touchController.state !== "dragging") return;
    const point = this.#nearestPoint(evt.clientX, evt.clientY);
    const coord = point ? coordFor(point[0], point[1]) : null;
    const action = this.#touchController.pointerUp(coord, { insideBoard: point !== null });
    this.#applyTouchAction(action, evt);
  }

  #handleTouchPointerCancel(evt) {
    this.#activePointers.delete(evt.pointerId);
    if (this.#panPointerId === evt.pointerId) this.#panPointerId = null;
    if (this.#pinchState) this.#endPinch();
    const action = this.#touchController.cancel();
    this.#applyTouchAction(action, null);
  }

  // --- Magnifier (drag mode) -----------------------------------------------

  #showMagnifier(coord, evt) {
    const p = this.#pointFor(coord);
    if (!p) {
      this.#hideMagnifier();
      return;
    }
    const [col, row] = p;
    const [px, py] = this.#px(col, row);
    const w = this.#cell * 2.6;
    const h = this.#cell * 2.6;
    this.#magSvg.setAttribute("viewBox", `${px - w / 2} ${py - h / 2} ${w} ${h}`);

    const wrapRect = this.#wrapEl.getBoundingClientRect();
    const magSize = 132;
    const gap = 26;
    let left = evt.clientX - wrapRect.left - magSize / 2;
    let top = evt.clientY - wrapRect.top - magSize - gap;
    left = clamp(left, 4, Math.max(4, wrapRect.width - magSize - 4));
    top = clamp(top, 4, Math.max(4, wrapRect.height - magSize - 4));
    this.#magWrap.style.left = `${left}px`;
    this.#magWrap.style.top = `${top}px`;
    this.#magWrap.hidden = false;
  }

  #hideMagnifier() {
    this.#magWrap.hidden = true;
  }

  // --- Pinch-zoom + pan (large boards) -------------------------------------

  #startPinch() {
    const pts = [...this.#activePointers.values()];
    if (pts.length < 2) return;
    const [a, b] = pts;
    const dist = Math.hypot(b.x - a.x, b.y - a.y) || 1;
    this.#pinchState = { startDist: dist, startScale: this.#zoomScale };
    this.#hideMagnifier();
  }

  #updatePinch() {
    if (!this.#pinchState) return;
    const pts = [...this.#activePointers.values()];
    if (pts.length < 2) return;
    const [a, b] = pts;
    const dist = Math.hypot(b.x - a.x, b.y - a.y) || 1;
    const nextScale = clamp(this.#pinchState.startScale * (dist / this.#pinchState.startDist), 1, 3.2);
    this.#setZoom(nextScale);
  }

  #endPinch() {
    this.#pinchState = null;
  }

  #setZoom(scale) {
    this.#zoomScale = scale;
    this.#clampPan();
    this.#applyZoomTransform();
    this.#zoomResetBtn.hidden = scale <= 1.02;
  }

  #setPan(x, y) {
    this.#panX = x;
    this.#panY = y;
    this.#clampPan();
    this.#applyZoomTransform();
  }

  #clampPan() {
    const w = this.#wrapEl.clientWidth || 1;
    const h = this.#wrapEl.clientHeight || 1;
    const minX = -(this.#zoomScale - 1) * w;
    const minY = -(this.#zoomScale - 1) * h;
    this.#panX = clamp(this.#panX, minX, 0);
    this.#panY = clamp(this.#panY, minY, 0);
  }

  #applyZoomTransform() {
    this.#svg.style.transform = `translate(${this.#panX}px, ${this.#panY}px) scale(${this.#zoomScale})`;
    this.#svg.style.transformOrigin = "0 0";
  }

  #resetZoom() {
    this.#zoomScale = 1;
    this.#panX = 0;
    this.#panY = 0;
    this.#applyZoomTransform();
    if (this.#zoomResetBtn) this.#zoomResetBtn.hidden = true;
  }

  // --- Keyboard navigation: arrow keys move a cursor, Enter/Space confirm -

  #drawCursor() {
    if (this.#cursorEl) this.#cursorEl.remove();
    if (!this.#cursor) return;
    const [col, row] = this.#cursor;
    const [x, y] = this.#px(col, row);
    const s = this.#cell * 0.48;
    this.#cursorEl = svgEl("rect", {
      x: x - s,
      y: y - s,
      width: s * 2,
      height: s * 2,
      fill: "none",
      stroke: "var(--board-hover-ring)",
      "stroke-width": 1.6,
      "stroke-dasharray": "2 2",
    });
    this.#interactionLayer.appendChild(this.#cursorEl);
  }

  #onKeyDown = (evt) => {
    if (!this.#cursor) this.#cursor = [Math.floor(this.#size / 2), Math.floor(this.#size / 2)];
    let [col, row] = this.#cursor;
    switch (evt.key) {
      case "ArrowLeft":
        col = Math.max(0, col - 1);
        break;
      case "ArrowRight":
        col = Math.min(this.#size - 1, col + 1);
        break;
      case "ArrowUp":
        row = Math.max(0, row - 1);
        break;
      case "ArrowDown":
        row = Math.min(this.#size - 1, row + 1);
        break;
      case "Enter":
      case " ": {
        evt.preventDefault();
        this.#attemptMove(coordFor(col, row));
        return;
      }
      default:
        return;
    }
    evt.preventDefault();
    this.#cursor = [col, row];
    this.#drawCursor();
    const coord = coordFor(col, row);
    this.announce(`Cursor at ${coord}.`);
  };

  // --- Screen-reader announcements ----------------------------------------

  announce(text) {
    this.#liveRegion.textContent = "";
    // Force a DOM mutation even if the text is identical to the previous
    // announcement, so assistive tech re-reads it.
    window.requestAnimationFrame ? window.requestAnimationFrame(() => (this.#liveRegion.textContent = text)) : (this.#liveRegion.textContent = text);
  }
}
