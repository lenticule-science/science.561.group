// Renders one lesson (public/data/lessons.json shape) step by step: read
// prose, worked-example board walkthroughs, and reveal-after-attempt
// exercises. Takes its board and session factories by constructor
// injection — this module imports nothing from ui/board.mjs or
// lib/kernel-bridge.mjs directly, so it never touches the kernel itself;
// the shell (app.mjs) wires the real factories in. hover-card.mjs is this
// same agent's own module (not part of that injection boundary), so it is
// imported directly below. No DOM access at module top level, so
// `node --test` can import the pure helpers below even though
// createLessonPlayer itself is DOM-only.

import { attachHoverCards } from "./hover-card.mjs";

/**
 * @typedef {object} BoardHandle
 * @property {(stones: Array<{pt: string, color: 'black'|'white'}>) => void} setStones
 * @property {(markers: Array<{pt: string, kind: string, label?: string}>) => void} setMarkers
 * @property {(pt: string | null) => void} setPending
 * @property {(text: string) => void} announce
 * @property {() => void} focus
 * @property {() => void} destroy
 */

/**
 * @typedef {(container: HTMLElement, opts: {size: number, coordinates?: boolean, interactive?: boolean, onIntent?: (pt: string) => void}) => BoardHandle} BoardFactory
 */

/**
 * @typedef {object} SessionHandle
 * @property {(move: string) => any} play
 * @property {(move: string) => {legal: boolean, reason?: string, events: any[], captures: any[]}} preview
 * @property {() => string[]} legalMoves
 * @property {() => Array<{pt: string, color: 'black'|'white'}>} stones
 * @property {() => 'black'|'white'} toMove
 * @property {() => string | null} lastMove
 * @property {() => {phase: string, winner?: string, method?: string}} status
 * @property {() => any} score
 * @property {() => any[]} history
 * @property {() => string} toSgf
 */

/**
 * @typedef {(opts: {size: number, ruleset: string, captureGoTarget?: number}) => SessionHandle} SessionFactory
 */

// ---------------------------------------------------------------------
// Pure helpers (no DOM) — exported so they can be exercised directly by
// node:test without going through createLessonPlayer.
// ---------------------------------------------------------------------

export function escapeHtml(text) {
  return String(text)
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#39;");
}

function escapeRegExp(text) {
  return text.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

// Best-effort plural form so "liberty"/"eye"/"capture" also match
// "liberties"/"eyes"/"captures" in running prose. Only ever widens which
// span of text gets wrapped — a wrong guess (e.g. "ataris") simply never
// occurs in text, so it costs nothing.
function pluralOf(title) {
  if (/[^aeiou]y$/i.test(title)) return title.slice(0, -1) + "ies";
  if (!/s$/i.test(title)) return title + "s";
  return null;
}

const patternCache = new WeakMap();

/** @param {import("../lib/glossary-index.mjs").GlossaryIndex} glossary */
function buildTermPatterns(glossary) {
  const cached = patternCache.get(glossary);
  if (cached) return cached;

  const variantToTerm = new Map();
  const variants = [];
  for (const term of glossary.all()) {
    variantToTerm.set(term.title.toLowerCase(), term);
    variants.push(term.title);
    const plural = pluralOf(term.title);
    if (plural) {
      variantToTerm.set(plural.toLowerCase(), term);
      variants.push(plural);
    }
  }
  // Longest first so a multi-word title (e.g. "territory scoring") is
  // tried, at a given position, before a shorter title it contains
  // ("territory") — the alternation otherwise takes whichever is listed
  // first regardless of length.
  variants.sort((a, b) => b.length - a.length);
  const regex = variants.length
    ? new RegExp(`\\b(?:${variants.map(escapeRegExp).join("|")})\\b`, "gi")
    : null;

  const built = { regex, variantToTerm };
  patternCache.set(glossary, built);
  return built;
}

/**
 * Escapes `text` and wraps every substring naming a glossary term in
 * `<span class="glossary-term" data-term="…">`, `…` being the term's slug
 * (glossary.json's `name`) — that attribute is what hover-card.mjs's
 * attachHoverCards scans for.
 *
 * @param {string} text
 * @param {import("../lib/glossary-index.mjs").GlossaryIndex | null | undefined} glossary
 */
export function wrapGlossaryTerms(text, glossary) {
  if (!glossary) return escapeHtml(text);
  const { regex, variantToTerm } = buildTermPatterns(glossary);
  if (!regex) return escapeHtml(text);

  let result = "";
  let lastIndex = 0;
  regex.lastIndex = 0;
  let match;
  while ((match = regex.exec(text)) !== null) {
    const matched = match[0];
    result += escapeHtml(text.slice(lastIndex, match.index));
    const term = variantToTerm.get(matched.toLowerCase());
    result += term
      ? `<span class="glossary-term" data-term="${escapeHtml(term.name)}">${escapeHtml(matched)}</span>`
      : escapeHtml(matched);
    lastIndex = match.index + matched.length;
  }
  result += escapeHtml(text.slice(lastIndex));
  return result;
}

/**
 * Marker list derived from one session.play()/preview() outcome, for a
 * board step's live replay. A "capture" SemanticEvent's own detail only
 * carries the *capturing* point and a stone count (events.mts); the
 * captured points themselves are each on a paired "group-killed" event's
 * detail.stones, so that's what's read here.
 */
export function markersForOutcome(move, outcome) {
  const markers = [];
  if (move !== "pass") markers.push({ pt: move, kind: "last-move" });
  for (const event of outcome.events ?? []) {
    if (event.type === "group-killed" && Array.isArray(event.detail?.stones)) {
      for (const pt of event.detail.stones) markers.push({ pt, kind: "event", label: "captured" });
    }
  }
  return markers;
}

// ---------------------------------------------------------------------
// The player itself.
// ---------------------------------------------------------------------

/**
 * @param {HTMLElement} container
 * @param {object} deps
 * @param {BoardFactory} deps.boardFactory
 * @param {SessionFactory} deps.sessionFactory
 * @param {import("../lib/glossary-index.mjs").GlossaryIndex} [deps.glossary]
 * @param {(nextSlug: string) => void} [deps.onNavigateLesson] - called when
 *   the reader clicks through past the final step of a lesson.
 */
export function createLessonPlayer(container, deps) {
  const { boardFactory, sessionFactory, glossary, onNavigateLesson } = deps;
  const doc = container.ownerDocument;

  let lesson = null;
  let stepIndex = 0;
  let boardHandle = null;
  let hoverCardHandle = null;
  let seqSession = null;
  let seqIndex = 0;

  function teardownStepResources() {
    if (boardHandle) {
      boardHandle.destroy();
      boardHandle = null;
    }
    if (hoverCardHandle) {
      hoverCardHandle.destroy();
      hoverCardHandle = null;
    }
    seqSession = null;
    seqIndex = 0;
  }

  function el(tag, className, text) {
    const node = doc.createElement(tag);
    if (className) node.className = className;
    if (text !== undefined) node.textContent = text;
    return node;
  }

  function textEl(tag, className, text) {
    const node = el(tag, className);
    node.innerHTML = wrapGlossaryTerms(text, glossary);
    return node;
  }

  function renderReadStep(stepEl, step) {
    stepEl.appendChild(textEl("p", "lesson-step__text", step.text));
  }

  function renderBoardStep(stepEl, step) {
    stepEl.appendChild(textEl("p", "lesson-step__text", step.text));
    const boardArea = el("div", "lesson-step__board");
    stepEl.appendChild(boardArea);
    boardHandle = boardFactory(boardArea, { size: step.board.size, coordinates: true, interactive: false });

    const caption = el("p", "lesson-step__caption");
    stepEl.appendChild(caption);

    if (step.board.sequence && step.board.sequence.length > 0 && sessionFactory) {
      renderSequenceControls(stepEl, boardArea, caption, step);
    } else {
      boardHandle.setStones(step.board.stones ?? []);
      boardHandle.setMarkers(step.board.markers ?? []);
    }
  }

  function renderSequenceControls(stepEl, boardArea, caption, step) {
    const sequence = step.board.sequence;
    seqSession = sessionFactory({ size: step.board.size, ruleset: "chinese" });
    seqIndex = 0;
    boardHandle.setStones([]);
    boardHandle.setMarkers([]);

    const controls = el("div", "lesson-step__sequence-controls");
    const playBtn = el("button", "lesson-step__play-move", "Play next move");
    playBtn.type = "button";
    const resetBtn = el("button", "lesson-step__reset-sequence", "Reset");
    resetBtn.type = "button";
    controls.appendChild(playBtn);
    controls.appendChild(resetBtn);
    stepEl.appendChild(controls);

    function showUpcoming() {
      if (seqIndex < sequence.length) {
        caption.textContent = sequence[seqIndex].note;
        playBtn.disabled = false;
      } else {
        caption.textContent = "";
        playBtn.disabled = true;
      }
    }

    playBtn.addEventListener("click", () => {
      if (seqIndex >= sequence.length) return;
      const entry = sequence[seqIndex];
      // preview() has a CONTRACT-specified {legal, events, captures} shape;
      // play()'s return value isn't, so events for markers come from the
      // preview taken an instant before the real, state-changing play().
      const outcome = seqSession.preview(entry.move);
      seqSession.play(entry.move);
      boardHandle.setStones(seqSession.stones());
      boardHandle.setMarkers(markersForOutcome(entry.move, outcome));
      boardHandle.announce(entry.note);
      seqIndex += 1;
      showUpcoming();
    });

    resetBtn.addEventListener("click", () => {
      seqSession = sessionFactory({ size: step.board.size, ruleset: "chinese" });
      seqIndex = 0;
      boardHandle.setStones([]);
      boardHandle.setMarkers([]);
      showUpcoming();
    });

    showUpcoming();
  }

  function renderExerciseStep(stepEl, step) {
    const ex = step.exercise;
    stepEl.appendChild(textEl("p", "lesson-step__prompt", ex.prompt));

    let attemptSession = null;
    if (ex.board) {
      const boardArea = el("div", "lesson-step__board");
      stepEl.appendChild(boardArea);
      const interactive = Boolean(ex.accept || ex.acceptEvent) && Boolean(sessionFactory);
      boardHandle = boardFactory(boardArea, {
        size: ex.board.size,
        coordinates: true,
        interactive,
        onIntent: interactive ? (pt) => handleAttempt(pt) : undefined,
      });

      if (interactive) {
        attemptSession = sessionFactory({ size: ex.board.size, ruleset: "chinese" });
        for (const setup of ex.board.sequence ?? []) attemptSession.play(setup.move);
      }
      boardHandle.setStones((interactive ? attemptSession.stones() : ex.board.stones) ?? []);
      boardHandle.setMarkers(ex.board.markers ?? []);
    }

    const feedback = el("p", "lesson-step__feedback");
    if (ex.board) stepEl.appendChild(feedback);

    function handleAttempt(pt) {
      const outcome = attemptSession.preview(pt);
      const matchesAccept = Array.isArray(ex.accept) && ex.accept.includes(pt);
      const matchesEvent =
        typeof ex.acceptEvent === "string" && outcome.events.some((event) => event.type === ex.acceptEvent);
      const correct = outcome.legal && (matchesAccept || matchesEvent);
      feedback.textContent = correct
        ? "That works."
        : outcome.legal
          ? "Legal, but not what this exercise is asking for — see the answer below."
          : `Not a legal move here (${outcome.reason ?? "illegal"}) — see the answer below.`;
      boardHandle.setPending(pt);
      boardHandle.announce(feedback.textContent);
    }

    const details = el("details", "lesson-step__answer");
    const summary = el("summary", null, "Answer");
    details.appendChild(summary);
    details.appendChild(textEl("p", null, ex.answerText));
    stepEl.appendChild(details);
  }

  function render() {
    teardownStepResources();
    container.textContent = "";
    if (!lesson) return;

    const root = el("section", "lesson-player");
    const header = el("header", "lesson-player__header");
    header.appendChild(el("h2", "lesson-player__title", lesson.title));
    header.appendChild(el("p", "lesson-player__audience", `Audience: ${lesson.audience}`));
    header.appendChild(el("p", "lesson-player__goal", `Goal: ${lesson.goal}`));
    header.appendChild(el("p", "lesson-player__progress", `Step ${stepIndex + 1} of ${lesson.steps.length}`));
    root.appendChild(header);

    const step = lesson.steps[stepIndex];
    const stepEl = el("div", "lesson-step");
    stepEl.dataset.kind = step.kind;
    if (step.kind === "read") renderReadStep(stepEl, step);
    else if (step.kind === "board") renderBoardStep(stepEl, step);
    else if (step.kind === "exercise") renderExerciseStep(stepEl, step);
    root.appendChild(stepEl);

    const controls = el("nav", "lesson-player__controls");
    const prevBtn = el("button", "lesson-player__prev", "Previous");
    prevBtn.type = "button";
    prevBtn.disabled = stepIndex === 0;
    prevBtn.addEventListener("click", () => {
      if (stepIndex > 0) {
        stepIndex -= 1;
        render();
      }
    });

    const isLastStep = stepIndex === lesson.steps.length - 1;
    const nextBtn = el("button", "lesson-player__next", isLastStep ? "Next lesson" : "Next");
    nextBtn.type = "button";
    if (isLastStep) {
      nextBtn.disabled = !onNavigateLesson || !lesson.next;
      nextBtn.addEventListener("click", () => {
        if (onNavigateLesson && lesson.next) onNavigateLesson(lesson.next);
      });
    } else {
      nextBtn.addEventListener("click", () => {
        stepIndex += 1;
        render();
      });
    }
    controls.appendChild(prevBtn);
    controls.appendChild(nextBtn);
    root.appendChild(controls);

    container.appendChild(root);

    if (glossary) {
      hoverCardHandle = attachHoverCards(root, glossary);
    }
  }

  function load(nextLesson) {
    lesson = nextLesson;
    stepIndex = 0;
    render();
  }

  function next() {
    if (!lesson) return;
    if (stepIndex < lesson.steps.length - 1) {
      stepIndex += 1;
      render();
    } else if (onNavigateLesson && lesson.next) {
      onNavigateLesson(lesson.next);
    }
  }

  function prev() {
    if (!lesson) return;
    if (stepIndex > 0) {
      stepIndex -= 1;
      render();
    }
  }

  function destroy() {
    teardownStepResources();
    container.textContent = "";
  }

  return { load, next, prev, destroy };
}
