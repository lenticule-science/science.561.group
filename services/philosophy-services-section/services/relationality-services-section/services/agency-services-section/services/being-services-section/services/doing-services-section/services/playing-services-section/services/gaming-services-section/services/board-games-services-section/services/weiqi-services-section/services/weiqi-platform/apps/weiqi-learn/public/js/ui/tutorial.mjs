// Renders the capture-go onboarding ladder (lib/tutorial-flow.mjs's
// DEFAULT_STAGES) one stage at a time: intro prose, a live board, an
// aria-live status line that also carries the stage's hint whenever an
// intent doesn't advance it, and progress across the five stages. Takes
// its board and its kernel-bridge session by constructor injection,
// exactly like lesson-player and tsumego-player (see either module's own
// header) — this file never imports ui/board.mjs or lib/kernel-bridge.mjs
// directly, and never touches the kernel. Its two same-agent siblings,
// lib/tutorial-flow.mjs (the pure state machine) and lib/bots.mjs
// (teaching opponents, themselves DOM-free and kernel-free), are imported
// directly here, matching lesson-player's own direct import of
// hover-card.mjs. No DOM access at module top level, so `node --test` can
// import the pure helpers below even though createTutorialPlayer itself is
// DOM-only.
//
// The learner is always Black, throughout every stage — the same fixed
// convention tutorial-flow.mjs's own winCheck predicates and DEFAULT_STAGES
// setup sequences assume (see that module's header).

import { createTutorial, DEFAULT_STAGES } from "../lib/tutorial-flow.mjs";
import { randomBot, greedyCaptureBot } from "../lib/bots.mjs";
import { attachHoverCards } from "./hover-card.mjs";

const BOTS = { random: randomBot, greedy: greedyCaptureBot };

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
 * @property {(move: string) => {ok: boolean, reason?: string, events?: any[], captures?: any[]}} play
 * @property {(move: string) => {legal: boolean, reason?: string, events: any[], captures: any[]}} preview
 * @property {() => string[]} legalMoves
 * @property {() => Array<{pt: string, color: 'black'|'white'}>} stones
 * @property {() => 'black'|'white'} toMove
 * @property {() => string | null} lastMove
 * @property {() => {phase: string, winner?: string, method?: string}} status
 * @property {() => {blackScore: number, whiteScore: number} | null} score
 * @property {() => string[]} history
 */

/**
 * @typedef {(opts: {size: number, ruleset: string, captureGoTarget?: number}) => SessionHandle} SessionFactory
 */

// ---------------------------------------------------------------------
// Pure helpers (no DOM) — exported so they can be exercised directly by
// node:test without going through createTutorialPlayer.
// ---------------------------------------------------------------------

/** The ruleset kernel-bridge's createSession should build a stage's session under. */
export function sessionRulesetFor(stage) {
  return stage.mode === "capture-go" ? "capture-go" : "chinese";
}

/** Substitutes `{blackScore}`/`{whiteScore}` in an onWin/onLoss template — a no-op when there's no score (capture-go stages) or no placeholder (most stages). */
export function fillTemplate(text, score) {
  if (!text || !score) return text;
  return text.replace(/\{blackScore\}/g, String(score.blackScore)).replace(/\{whiteScore\}/g, String(score.whiteScore));
}

/**
 * Marker list for one play() outcome, matching lesson-player's own
 * markersForOutcome (not imported from there — see this module's own
 * header on why its same-agent-sibling boundary stops at tutorial-flow.mjs
 * and bots.mjs). A "capture" SemanticEvent's own detail only carries the
 * capturing point and a stone count (events.mts); the captured points
 * themselves are each on a paired "group-killed" event's detail.stones.
 */
export function markersForPlay(move, outcome) {
  const markers = [];
  if (move !== "pass") markers.push({ pt: move, kind: "last-move" });
  for (const event of outcome.events ?? []) {
    if (event.type === "group-killed" && Array.isArray(event.detail?.stones)) {
      for (const pt of event.detail.stones) markers.push({ pt, kind: "event", label: "captured" });
    }
  }
  return markers;
}

/**
 * The first non-self "capture" event in `events`, or undefined — what the
 * "atari" stage's winCheck is looking for. No color check: `events` here
 * is always exactly one move's own outcome.events (see resultFor below),
 * so any non-self capture in it was necessarily made by whoever just
 * moved. A kernel SemanticEvent's `detail.by` is the kernel's own numeric
 * Color code, not a "black"/"white" string — matching against one would
 * silently never fire, which is exactly the bug this scoping avoids.
 */
export function findCaptureEvent(events) {
  return (events ?? []).find((event) => event.type === "capture" && !event.detail?.selfCapture);
}

/**
 * The tutorial-flow `advance()` argument for one just-played move, keyed
 * off the stage's own winCheck name rather than its mode — the three
 * shapes WIN_CHECKS actually reads (see tutorial-flow.mjs).
 *
 * @param {import("../lib/tutorial-flow.mjs").StageDef} def
 * @param {SessionHandle} session
 * @param {string} move
 * @param {{events?: any[]}} outcome
 */
export function resultFor(def, session, move, outcome) {
  if (def.winCheck === "stones-placed-3") return { type: "placement", count: session.history().length };
  if (def.winCheck === "capture-white") return { type: "event", event: findCaptureEvent(outcome.events) };
  return { type: "status", status: session.status() };
}

/** Per-stage state (done/current/upcoming) for a progress list, in stage order. */
export function stageStates(stages, progressIndex) {
  return stages.map((s, i) => ({
    slug: s.slug,
    title: s.title,
    state: i < progressIndex ? "done" : i === progressIndex ? "current" : "upcoming",
  }));
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
 * @param {import("../lib/tutorial-flow.mjs").StageDef[]} [deps.stages] - defaults to DEFAULT_STAGES; overridable for tests/preview.
 */
export function createTutorialPlayer(container, deps) {
  const { boardFactory, sessionFactory, glossary, stages } = deps;
  const doc = container.ownerDocument;
  const stageList = stages ?? DEFAULT_STAGES;
  const tutorial = createTutorial(stageList);

  /** @type {SessionHandle | null} */
  let session = null;
  /** @type {BoardHandle | null} */
  let boardHandle = null;
  let hoverCardHandle = null;

  function el(tag, className, text) {
    const node = doc.createElement(tag);
    if (className) node.className = className;
    if (text !== undefined) node.textContent = text;
    return node;
  }

  function teardownStage() {
    if (boardHandle) {
      boardHandle.destroy();
      boardHandle = null;
    }
    if (hoverCardHandle) {
      hoverCardHandle.destroy();
      hoverCardHandle = null;
    }
    session = null;
  }

  function buildSession(def) {
    const s = sessionFactory({ size: def.size, ruleset: sessionRulesetFor(def), captureGoTarget: def.captureGoTarget });
    for (const move of def.setup ?? []) s.play(move);
    return s;
  }

  function renderComplete() {
    teardownStage();
    container.textContent = "";
    const root = el("section", "tutorial-player tutorial-player--complete");
    root.appendChild(el("h2", "tutorial-player__title", "Ladder complete"));
    root.appendChild(
      el(
        "p",
        "tutorial-player__status",
        "Five stages down: first stones, atari, two capture-go games, and a full 9x9 game with real scoring. " +
          "From here, the lessons and the tsumego sets pick up where this ladder leaves off.",
      ),
    );
    container.appendChild(root);
  }

  function render() {
    teardownStage();
    container.textContent = "";

    const def = tutorial.stage();
    if (!def) {
      renderComplete();
      return;
    }

    const progress = tutorial.progress();
    session = buildSession(def);

    const root = el("section", "tutorial-player");
    root.dataset.stage = def.slug;

    const header = el("header", "tutorial-player__header");
    header.appendChild(el("p", "tutorial-player__progress", `Stage ${progress.index + 1} of ${progress.total}`));
    header.appendChild(el("h2", "tutorial-player__title", def.title));
    const introEl = el("div", "tutorial-player__intro");
    introEl.innerHTML = def.intro; // author-written HTML (see StageDef.intro's own doc) — never learner input
    header.appendChild(introEl);
    root.appendChild(header);

    const stagesEl = el("ol", "tutorial-player__stages");
    for (const s of stageStates(stageList, progress.index)) {
      const item = el("li", "tutorial-player__stage-item", s.title);
      item.dataset.state = s.state;
      stagesEl.appendChild(item);
    }
    root.appendChild(stagesEl);

    const boardArea = el("div", "tutorial-player__board");
    root.appendChild(boardArea);

    const statusEl = el("p", "tutorial-player__status", def.hint);
    statusEl.setAttribute("aria-live", "polite");
    statusEl.dataset.state = "hint";
    root.appendChild(statusEl);

    const controlsEl = el("div", "tutorial-player__controls");
    root.appendChild(controlsEl);

    container.appendChild(root);

    // Once a stage's own game concludes (won or lost), further clicks are
    // inert until the learner chooses to move on — see finish() below.
    // Nothing about board.mjs's own `interactive` flag can be toggled
    // post-construction, so this flag, not the board, is what stops play.
    let ended = false;

    function setStatus(text, state) {
      statusEl.textContent = text;
      statusEl.dataset.state = state;
    }

    // Celebratory-but-quiet: a single inline button, no modal, no
    // animation — the finished board stays exactly as it ended.
    function finish(advanceResult, kind) {
      ended = true;
      setStatus(fillTemplate(advanceResult.text, session.score()), kind);
      boardHandle.setStones(session.stones());
      controlsEl.textContent = "";
      const isLastStage = kind === "won" && progress.index + 1 >= progress.total;
      const btn = el(
        "button",
        `tutorial-player__${kind === "won" ? "continue" : "retry"}`,
        kind === "won" ? (isLastStage ? "Finish" : "Continue") : "Try again",
      );
      btn.type = "button";
      btn.addEventListener("click", () => {
        if (kind === "lost") tutorial.advance({ type: "retry" });
        render();
      });
      controlsEl.appendChild(btn);
    }

    function afterLearnerMove(move, outcome) {
      boardHandle.setStones(session.stones());
      boardHandle.setMarkers(markersForPlay(move, outcome));
      boardHandle.announce(move === "pass" ? "You pass." : `You play ${move}.`);

      const learnerAdvance = tutorial.advance(resultFor(def, session, move, outcome));
      if (learnerAdvance.outcome === "won" || learnerAdvance.outcome === "lost") {
        finish(learnerAdvance, learnerAdvance.outcome);
        return;
      }

      const isGame = def.mode === "capture-go" || def.mode === "full-rules";
      if (!isGame || session.status().phase !== "playing" || session.toMove() !== "white") {
        setStatus(def.hint, "hint");
        return;
      }

      const botMove = BOTS[def.bot]({ session });
      const botOutcome = session.play(botMove);
      boardHandle.setStones(session.stones());
      boardHandle.setMarkers(markersForPlay(botMove, botOutcome));
      boardHandle.announce(`White plays ${botMove === "pass" ? "pass" : botMove}.`);

      const botAdvance = tutorial.advance({ type: "status", status: session.status() });
      if (botAdvance.outcome === "won" || botAdvance.outcome === "lost") {
        finish(botAdvance, botAdvance.outcome);
        return;
      }

      setStatus(def.hint, "hint");
    }

    function attemptMove(move) {
      if (ended) return;
      const outcome = session.play(move);
      if (!outcome.ok) {
        setStatus(def.hint, "hint");
        boardHandle.announce(`${move} isn't legal here.`);
        return;
      }
      afterLearnerMove(move, outcome);
    }

    boardHandle = boardFactory(boardArea, {
      size: def.size,
      coordinates: true,
      interactive: true,
      onIntent: (pt) => attemptMove(pt),
    });
    boardHandle.setStones(session.stones());
    boardHandle.setMarkers(session.lastMove() ? [{ pt: session.lastMove(), kind: "last-move" }] : []);

    if (def.mode === "full-rules") {
      const passBtn = el("button", "tutorial-player__pass", "Pass");
      passBtn.type = "button";
      passBtn.addEventListener("click", () => attemptMove("pass"));
      controlsEl.appendChild(passBtn);
    }

    if (glossary) hoverCardHandle = attachHoverCards(root, glossary);
    boardHandle.focus();
  }

  function load() {
    render();
  }

  function destroy() {
    teardownStage();
    container.textContent = "";
  }

  return { load, destroy };
}
