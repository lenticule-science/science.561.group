// Renders one tsumego problem at a time from public/data/tsumego.json's
// `problems` array, tracks the learner's attempt against it, and reveals
// the answer or the failing line's note on request. Takes its board and its
// checker by constructor injection — this module imports nothing from
// ui/board.mjs or lib/tsumego-check.mjs directly, matching lesson-player's
// own pattern (see that module's header); the shell (app.mjs) wires the
// real board factory and checkAttempt in. No DOM access at module top
// level, so `node --test` can import the pure helpers below even though
// createTsumegoPlayer itself is DOM-only.

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
 * @typedef {import("../lib/tsumego-check.mjs").TsumegoProblem} TsumegoProblem
 * @typedef {import("../lib/tsumego-check.mjs").CheckResult} CheckResult
 * @typedef {(problem: TsumegoProblem, moves: string[]) => CheckResult} CheckAttemptFn
 */

// ---------------------------------------------------------------------
// Pure helpers (no DOM) — exported so they can be exercised directly by
// node:test without going through createTsumegoPlayer.
// ---------------------------------------------------------------------

/**
 * The indices, within `problems`, of every problem sharing `problems[index]`'s
 * `set` — what the progress dots for the current problem represent, in the
 * set's own file order.
 */
export function setIndices(problems, index) {
  const set = problems[index]?.set;
  const out = [];
  for (let i = 0; i < problems.length; i++) {
    if (problems[i].set === set) out.push(i);
  }
  return out;
}

/**
 * A revealed "how to solve it" write-up, built from the problem's own
 * `accept`/`lines` data rather than a separate authored field: the first
 * accepted move, then each scripted refutation attempt and the reply that
 * answers it, in the solver's own words (`note`).
 */
export function synthesizeAnswerText(problem) {
  const move = problem.accept[0];
  const line = problem.lines[move] ?? [];
  let text = `Play ${move}.`;
  for (const step of line) {
    text += ` If the opponent tries ${step.move}, answer ${step.reply}: ${step.note}`;
  }
  return text;
}

/** Feedback text for one checkAttempt() result — solved, a definite wrong move, or a still-valid-so-far partial attempt. */
export function feedbackFor(result) {
  if (result.solved) return "Solved.";
  if (result.refutation) {
    const { move, reason, note } = result.refutation;
    const lede = reason === "illegal" ? `${move} isn't a legal move here.` : `${move} doesn't solve it.`;
    return note ? `${lede} ${note}` : lede;
  }
  return "Correct so far — your move.";
}

// ---------------------------------------------------------------------
// The player itself.
// ---------------------------------------------------------------------

/**
 * @param {HTMLElement} container
 * @param {object} deps
 * @param {BoardFactory} deps.boardFactory
 * @param {CheckAttemptFn} deps.checkAttempt
 */
export function createTsumegoPlayer(container, deps) {
  const { boardFactory, checkAttempt } = deps;
  const doc = container.ownerDocument;

  /** @type {TsumegoProblem[]} */
  let problems = [];
  let currentIndex = 0;
  /** @type {Map<string, string[]>} attempted moves so far, keyed by problem id */
  const attempts = new Map();
  /** @type {Set<string>} problem ids solved at least once this session */
  const solved = new Set();

  let boardHandle = null;
  let feedbackEl = null;

  function el(tag, className, text) {
    const node = doc.createElement(tag);
    if (className) node.className = className;
    if (text !== undefined) node.textContent = text;
    return node;
  }

  function current() {
    return problems[currentIndex];
  }

  function movesFor(problem) {
    return attempts.get(problem.id) ?? [];
  }

  function isDone(result) {
    return result.solved || Boolean(result.refutation);
  }

  function renderDots(root, problem) {
    const nav = el("nav", "tsumego-player__dots");
    nav.setAttribute("aria-label", `${problem.set} problems`);
    const indices = setIndices(problems, currentIndex);
    indices.forEach((i, position) => {
      const p = problems[i];
      const dot = el("button", "tsumego-player__dot", String(position + 1));
      dot.type = "button";
      dot.setAttribute("aria-current", i === currentIndex ? "true" : "false");
      dot.dataset.state = solved.has(p.id) ? "solved" : attempts.has(p.id) ? "attempted" : "unstarted";
      dot.title = p.title;
      dot.addEventListener("click", () => {
        if (i === currentIndex) return;
        currentIndex = i;
        render();
      });
      nav.appendChild(dot);
    });
    root.appendChild(nav);
  }

  function mountBoard(boardArea, problem) {
    const result = checkAttempt(problem, movesFor(problem));
    const done = solved.has(problem.id) || Boolean(result.refutation);
    boardHandle = boardFactory(boardArea, {
      size: problem.size,
      coordinates: true,
      interactive: !done,
      onIntent: done ? undefined : (pt) => handleIntent(pt),
    });
    boardHandle.setStones(result.stones);
    boardHandle.setMarkers(result.lastMove ? [{ pt: result.lastMove, kind: "last-move" }] : []);
    return result;
  }

  function handleIntent(pt) {
    const problem = current();
    const moves = [...movesFor(problem), pt];
    attempts.set(problem.id, moves);
    const result = checkAttempt(problem, moves);
    if (result.solved) solved.add(problem.id);

    if (isDone(result)) {
      // The attempt just resolved (solved or refuted) — the board goes
      // non-interactive either way, which only createBoard's own
      // `interactive` flag controls, so the board has to be remounted.
      render();
      return;
    }

    boardHandle.setStones(result.stones);
    boardHandle.setMarkers(result.lastMove ? [{ pt: result.lastMove, kind: "last-move" }] : []);
    feedbackEl.textContent = feedbackFor(result);
    boardHandle.announce(feedbackEl.textContent);
  }

  function retry() {
    attempts.delete(current().id);
    render();
  }

  function render() {
    if (boardHandle) {
      boardHandle.destroy();
      boardHandle = null;
    }
    container.textContent = "";
    if (problems.length === 0) return;

    const problem = current();
    const root = el("section", "tsumego-player");
    root.dataset.set = problem.set;

    const header = el("header", "tsumego-player__header");
    header.appendChild(el("h2", "tsumego-player__title", problem.title));
    header.appendChild(el("p", "tsumego-player__goal", problem.goal));
    root.appendChild(header);

    renderDots(root, problem);

    const boardArea = el("div", "tsumego-player__board");
    root.appendChild(boardArea);
    const result = mountBoard(boardArea, problem);

    feedbackEl = el("p", "tsumego-player__feedback", feedbackFor(result));
    root.appendChild(feedbackEl);
    // render() is the only path a solved/refuted attempt takes (it remounts
    // the board non-interactive), so the outcome has to be spoken here —
    // the outgoing board's own announce() call is already gone by the time
    // handleIntent() would otherwise make it.
    boardHandle.announce(feedbackEl.textContent);

    const controls = el("div", "tsumego-player__controls");
    const retryBtn = el("button", "tsumego-player__retry", "Retry");
    retryBtn.type = "button";
    retryBtn.disabled = movesFor(problem).length === 0;
    retryBtn.addEventListener("click", retry);
    controls.appendChild(retryBtn);
    root.appendChild(controls);

    const details = el("details", "tsumego-player__answer");
    details.appendChild(el("summary", null, "Answer"));
    details.appendChild(el("p", null, synthesizeAnswerText(problem)));
    details.appendChild(el("p", "tsumego-player__fail-note", problem.failNote));
    root.appendChild(details);

    container.appendChild(root);
    boardHandle.focus();
  }

  /**
   * @param {TsumegoProblem[]} nextProblems - typically the full tsumego.json `problems` array
   * @param {string} [startId] - a problem id to open on; defaults to the first problem
   */
  function load(nextProblems, startId) {
    problems = nextProblems;
    const found = startId ? problems.findIndex((p) => p.id === startId) : 0;
    currentIndex = found >= 0 ? found : 0;
    render();
  }

  function destroy() {
    if (boardHandle) {
      boardHandle.destroy();
      boardHandle = null;
    }
    container.textContent = "";
  }

  return { load, retry, destroy };
}
