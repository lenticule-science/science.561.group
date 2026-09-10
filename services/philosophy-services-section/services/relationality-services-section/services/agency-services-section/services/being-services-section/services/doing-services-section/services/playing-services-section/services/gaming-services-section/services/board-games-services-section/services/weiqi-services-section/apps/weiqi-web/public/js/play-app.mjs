// Page glue for the normal 9x9 game and its separate Capture Go learning
// route. Both only present decisions made by the generated Weiqi engine.
// Rules, scoring, ko, and semantic events come only from the generated
// Weiqi engine. This module owns browser effects and presentation.

import * as kernel from "./kernel/index.mjs";
import { WeiqiBoard, getEventGlyph } from "./board.mjs";
import { GlossaryHoverCard, loadGlossary } from "./hover-card.mjs";
import { BOT_TIERS } from "./bot.mjs";
import { WeiqiSound } from "./sound.mjs";
import { ConceptToastStrip } from "./concept-toast.mjs";

const CAPTURE_GO = document.body.dataset.gameMode === "capture-go";
const BOARD_SIZE = CAPTURE_GO ? 7 : 9;
const RULESET = CAPTURE_GO ? "japanese" : "chinese";
const TOUCH_MODE_KEY = "weiqi-touch-mode";

const boardHost = document.getElementById("board-host");
const boardWrap = document.getElementById("board-wrap");
const statusLine = document.getElementById("status-line");
const resultEl = document.getElementById("game-result");
const eventLog = document.getElementById("event-log");
const newGameBtn = document.getElementById("new-game-btn");
const passBtn = document.getElementById("pass-btn");
const resignBtn = document.getElementById("resign-btn");
const botSelect = document.getElementById("bot-select");
const soundToggleBtn = document.getElementById("sound-toggle-btn");
const conceptTierSelect = document.getElementById("concept-tier-select");
const touchModeSelect = document.getElementById("touch-mode-select");

const glossary = await loadGlossary();
const hoverCard = new GlossaryHoverCard(glossary);
hoverCard.attachTermSpans(document);
const board = new WeiqiBoard(boardHost, { size: BOARD_SIZE, cell: 52 });
hoverCard.wireBoardEvents(board);
const sound = new WeiqiSound();
const toasts = new ConceptToastStrip(boardWrap, { hoverCard });

function loadStoredTouchMode() {
  try {
    return localStorage.getItem(TOUCH_MODE_KEY) === "confirm" ? "confirm" : "drag";
  } catch {
    return "drag";
  }
}

board.setTouchMode(loadStoredTouchMode());

function selectedBot() {
  return BOT_TIERS.find((bot) => bot.id === botSelect.value) ?? BOT_TIERS.at(-1);
}

for (const bot of BOT_TIERS) {
  const option = document.createElement("option");
  option.value = bot.id;
  option.textContent = `${bot.label} — ${bot.tagline}`;
  botSelect.append(option);
}
botSelect.value = "influence";

let game = new kernel.Game(BOARD_SIZE, RULESET);
let botThinking = false;
let finished = false;

function playerLabel(color) {
  return color === kernel.BLACK ? "Black (you)" : `White (${selectedBot().label})`;
}

function setStatus(text) {
  statusLine.textContent = text;
}

function describeEvent(ev, mover) {
  switch (ev.type) {
    case "atari-given": return `${playerLabel(mover === kernel.BLACK ? kernel.WHITE : kernel.BLACK)} is in atari at ${ev.detail.point}.`;
    case "atari-escaped": return `${playerLabel(mover)} escaped atari.`;
    case "capture": return `${playerLabel(mover)} captured ${ev.detail.stonesCaptured} stone(s) at ${ev.detail.point}.`;
    case "ko-started": return `A ko started at ${ev.detail.point}.`;
    case "ko-resolved": return `The ko at ${ev.detail.point} resolved.`;
    case "connection": return `${playerLabel(mover)} connected ${ev.detail.mergedGroups} groups at ${ev.detail.point}.`;
    case "eye-formed": return `${playerLabel(mover)} formed an eye at ${ev.detail.point}.`;
    case "group-killed": return `A group of ${ev.detail.groupSize} stone(s) was captured.`;
    case "game-ended": return "Two consecutive passes ended the game.";
    default: return ev.type;
  }
}

function logEvent(ev, mover) {
  const item = document.createElement("div");
  item.className = "event-item";
  const text = document.createElement("span");
  text.textContent = describeEvent(ev, mover);
  const term = document.createElement("span");
  term.className = "term-hover";
  term.setAttribute("data-term", ev.term);
  term.tabIndex = 0;
  term.textContent = ` (${ev.term})`;
  item.append(text, term);
  eventLog.prepend(item);
  hoverCard.attachTermSpans(item);
}

function updateKoMarker() {
  board.setKoPoint(game.activeKoPoint === null ? null : kernel.pointToCoord(game.size, game.activeKoPoint));
}

function render() {
  board.setPosition(game.current.board, { toMove: game.current.toMove });
  board.setLegalityChecker((coord) => !finished && !botThinking && game.current.toMove === kernel.BLACK && game.isLegal(coord));
  passBtn.disabled = CAPTURE_GO || finished || botThinking || game.current.toMove !== kernel.BLACK;
  resignBtn.disabled = finished || botThinking;
  botSelect.disabled = game.history.length > 1 && !finished;
  if (!finished) setStatus(`${playerLabel(game.current.toMove)} to move.${botThinking ? " (AI is thinking…)" : ""}`);
}

function finishByScore() {
  finished = true;
  const score = kernel.scoreArea(game.current, game.ruleset);
  resultEl.hidden = false;
  resultEl.textContent = `${score.margin}. Provisional Chinese area count: Black ${score.blackScore}, White ${score.whiteScore}. Dead stones are not adjudicated in this local match.`;
  sound.playGameEnd();
  board.announce(resultEl.textContent);
}

function finishByCapture(mover) {
  finished = true;
  resultEl.hidden = false;
  resultEl.textContent = `${playerLabel(mover)} made the first capture and wins this Capture Go learning game.`;
  sound.playGameEnd();
  board.announce(resultEl.textContent);
}

function applyMove(coord) {
  const mover = game.current.toMove;
  const outcome = game.play(coord);
  if (!outcome.ok) {
    board.announce(`${coord} is not legal: ${outcome.reason}.`);
    return false;
  }
  board.setLastMove(coord === "pass" ? null : coord);
  board.setAnnotations(outcome.events);
  updateKoMarker();
  sound.playStoneClick(coord === "pass" ? -1 : coord.charCodeAt(0), coord === "pass" ? -1 : Number(coord.slice(1)) || 0);
  for (const ev of outcome.events) {
    logEvent(ev, mover);
    if (toasts.shouldShow(ev.type)) {
      const spec = getEventGlyph(ev.type);
      toasts.push({ type: ev.type, term: ev.term, text: describeEvent(ev, mover), glyph: spec?.glyph ?? "" });
    }
    if (ev.type === "capture") sound.playCapture(ev.detail.stonesCaptured ?? 1);
    if (ev.type === "atari-given") sound.playAtari();
  }
  board.announce(`${playerLabel(mover)} played ${coord}.`);
  if (CAPTURE_GO && outcome.events.some((event) => event.type === "capture")) finishByCapture(mover);
  else if (game.mainPhaseEnded) finishByScore();
  render();
  return true;
}

async function playBotTurn() {
  if (finished) return;
  botThinking = true;
  render();
  await new Promise((resolve) => setTimeout(resolve, 260));
  const move = selectedBot().chooser(game, kernel);
  botThinking = false;
  applyMove(move);
}

board.addEventListener("weiqi-move", async (event) => {
  if (finished || botThinking || game.current.toMove !== kernel.BLACK) return;
  if (applyMove(event.detail.coord) && !finished) await playBotTurn();
});

passBtn.addEventListener("click", async () => {
  if (CAPTURE_GO) return;
  if (finished || botThinking || game.current.toMove !== kernel.BLACK) return;
  if (applyMove("pass") && !finished) await playBotTurn();
});

resignBtn.addEventListener("click", () => {
  if (finished) return;
  finished = true;
  resultEl.hidden = false;
  resultEl.textContent = "You resigned. White wins.";
  sound.playGameEnd();
  render();
});

newGameBtn.addEventListener("click", () => {
  game = new kernel.Game(BOARD_SIZE, RULESET);
  botThinking = false;
  finished = false;
  eventLog.innerHTML = "";
  resultEl.hidden = true;
  resultEl.textContent = "";
  board.setLastMove(null);
  board.setAnnotations([]);
  updateKoMarker();
  render();
  board.announce(`New ${BOARD_SIZE} by ${BOARD_SIZE} ${CAPTURE_GO ? "Capture Go learning game" : "normal game"}. Black to move.`);
});

soundToggleBtn.addEventListener("click", () => {
  const enabled = sound.toggle();
  soundToggleBtn.textContent = enabled ? "On" : "Off";
  soundToggleBtn.setAttribute("aria-pressed", String(enabled));
});

conceptTierSelect.addEventListener("change", () => toasts.setTier(conceptTierSelect.value));
touchModeSelect.value = loadStoredTouchMode();
touchModeSelect.addEventListener("change", () => {
  board.setTouchMode(touchModeSelect.value);
  try { localStorage.setItem(TOUCH_MODE_KEY, touchModeSelect.value); } catch { /* best effort */ }
});

render();
