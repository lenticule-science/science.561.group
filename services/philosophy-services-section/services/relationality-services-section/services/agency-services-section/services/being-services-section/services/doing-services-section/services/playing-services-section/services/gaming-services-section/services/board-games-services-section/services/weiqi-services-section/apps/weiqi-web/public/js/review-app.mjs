// Study Replay is a presentation of a versioned session already admitted by
// the shared Weiqi engine. It neither parses interchange data nor persists a
// game: accepted commands remain the only input and the engine recomputes all
// displayed positions and semantic observations from them.

import * as kernel from "./kernel/index.mjs";
import { WeiqiBoard } from "./board.mjs";

const RULES_OBSERVATION_PREFIX = "Rules observation";

function commandLabel(command, mover) {
  if (command.kind === "pass") return `${mover === kernel.BLACK ? "Black" : "White"} passed`;
  return `${mover === kernel.BLACK ? "Black" : "White"} played ${command.move}`;
}

/**
 * Reconstruct every legal prefix of an already-versioned session using only
 * the shared engine's command-admission operation. A semantic event here is
 * an observation made by that operation, never an engine evaluation or a
 * claim that the move was good or bad.
 */
export function buildStudyReplay(session) {
  kernel.materializeWeiqiGame(session);
  let prefix = kernel.createWeiqiGameSession(session.config);
  const initialGame = kernel.materializeWeiqiGame(prefix);
  const frames = [{
    version: 0,
    board: [...initialGame.current.board],
    toMove: initialGame.current.toMove,
    command: null,
    mover: null,
    events: [],
  }];

  for (const command of session.commands) {
    const gameBefore = kernel.materializeWeiqiGame(prefix);
    const outcome = kernel.admitWeiqiGameCommand(prefix, prefix.version, command);
    if (!outcome.ok) throw new TypeError(`Cannot replay accepted Weiqi command: ${outcome.reason}`);
    prefix = outcome.session;
    const gameAfter = kernel.materializeWeiqiGame(prefix);
    frames.push({
      version: prefix.version,
      board: [...gameAfter.current.board],
      toMove: gameAfter.current.toMove,
      command,
      mover: gameBefore.current.toMove,
      events: [...outcome.events],
    });
  }

  return Object.freeze({
    config: Object.freeze({ ...session.config }),
    version: session.version,
    frames: Object.freeze(frames.map((frame) => Object.freeze({
      ...frame,
      board: Object.freeze(frame.board),
      events: Object.freeze(frame.events),
    }))),
  });
}

export function describeRulesObservation(event) {
  const noun = event.type.replaceAll("-", " ");
  return `${RULES_OBSERVATION_PREFIX}: ${noun}.`;
}

function sessionFromPageState() {
  const candidate = history.state?.weiqiSession;
  return candidate && typeof candidate === "object" ? candidate : null;
}

function element(id) {
  const found = document.getElementById(id);
  if (!found) throw new Error(`Study Replay is missing #${id}`);
  return found;
}

function renderStudyReplay(study) {
  const board = new WeiqiBoard(element("board-host"), { size: study.config.size, cell: 52 });
  const scrubber = element("move-scrubber");
  const moveNumber = element("move-number");
  const status = element("review-status");
  const previous = element("previous-move-btn");
  const next = element("next-move-btn");
  const selectedEvents = element("selected-events");
  const observationSummary = element("observation-summary");
  const timeline = element("move-timeline");

  scrubber.max = String(study.version);
  let currentVersion = study.version;

  function select(version) {
    currentVersion = Math.max(0, Math.min(study.version, version));
    const frame = study.frames[currentVersion];
    scrubber.value = String(currentVersion);
    moveNumber.value = String(currentVersion);
    previous.disabled = currentVersion === 0;
    next.disabled = currentVersion === study.version;
    board.setPosition(frame.board, { toMove: frame.toMove });
    board.setLastMove(frame.command?.kind === "play" ? frame.command.move : null);
    board.setAnnotations(frame.events);
    status.textContent = currentVersion === 0
      ? `Before move 1 — ${study.config.ruleset} rules on ${study.config.size}×${study.config.size}.`
      : `${commandLabel(frame.command, frame.mover)} — version ${frame.version} of ${study.version}.`;
    observationSummary.textContent = frame.events.length === 0
      ? "No named rules observation was produced at this move. This does not evaluate the move."
      : `${frame.events.length} named rules observation${frame.events.length === 1 ? "" : "s"} at this move; none is engine analysis or a move judgment.`;
    selectedEvents.replaceChildren(...frame.events.map((event) => {
      const item = document.createElement("div");
      item.className = "event-item";
      const label = document.createElement("span");
      label.textContent = describeRulesObservation(event);
      const term = document.createElement("a");
      term.href = `glossary.html#${encodeURIComponent(event.term)}`;
      term.textContent = ` ${event.term}`;
      item.append(label, term);
      return item;
    }));
    for (const button of timeline.querySelectorAll("button")) {
      button.setAttribute("aria-current", String(Number(button.dataset.version) === currentVersion));
    }
  }

  for (const frame of study.frames) {
    const item = document.createElement("div");
    item.className = "event-item";
    const button = document.createElement("button");
    button.type = "button";
    button.dataset.version = String(frame.version);
    button.textContent = frame.version === 0
      ? "Start position"
      : `Move ${frame.version}: ${commandLabel(frame.command, frame.mover)}`;
    button.addEventListener("click", () => select(frame.version));
    item.append(button);
    if (frame.events.length > 0) {
      const count = document.createElement("span");
      count.textContent = ` — ${frame.events.length} rules observation${frame.events.length === 1 ? "" : "s"}`;
      item.append(count);
    }
    timeline.append(item);
  }

  scrubber.addEventListener("input", () => select(Number(scrubber.value)));
  previous.addEventListener("click", () => select(currentVersion - 1));
  next.addEventListener("click", () => select(currentVersion + 1));
  select(currentVersion);
}

if (typeof document !== "undefined") {
  const session = sessionFromPageState();
  if (session === null) {
    element("review-empty").hidden = false;
  } else {
    try {
      const study = buildStudyReplay(session);
      element("review-app").hidden = false;
      renderStudyReplay(study);
    } catch {
      const empty = element("review-empty");
      empty.hidden = false;
      empty.querySelector("p").textContent = "This game session could not be replayed by the shared rules engine.";
    }
  }
}
