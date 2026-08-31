// Page glue for play.html: the Capture Go onboarding ladder (Experience
// Brief item 2 / task item 2), using the kernel via relative import (this
// module IS the relative import the task calls for -- ./kernel/*.mjs, the
// same source scripts/build-kernel.mjs stripped from
// ../../weiqi-kernel/src).
//
// Rules authority stays entirely with the kernel: this module never
// decides legality itself, only calls game.isLegal()/game.play() and
// renders what comes back. Capture-go's win condition ("first capture
// wins") is the one house rule layered on top, read from the kernel's own
// `capture` semantic events (see bot.mjs's wasCaptureMove).
//
// This module is also where the Experience Brief's items 3 (SOUND) and 4
// (LIVE CONCEPT RECOGNITION) get wired to real play: every semantic event
// the kernel fires drives both a synthesized sound (sound.mjs) and,
// tier-gated, a toast (concept-toast.mjs) -- board.mjs and its sibling
// modules only render what this glue tells them to.
//
// The ladder itself (public/data/ladder-rungs.json): each rung names a
// board size and a bot-ladder tier id (public/js/bot.mjs's BOT_TIERS is
// the one place the tiers themselves are defined -- this module only looks
// a tier up by id via BOT_TIERS.find, never reimplements a bot or a second
// copy of a tier's label/description). Clearing a rung (winning it as
// Black) persists to localStorage and unlocks the next rung in order;
// nothing already unlocked is ever re-locked. Per-rung intro copy is a
// verbatim excerpt from this section's own lesson/glossary corpus (see
// each rung's introSource in the JSON), not invented UI copy.

import * as kernel from "./kernel/index.mjs";
import { WeiqiBoard, getEventGlyph } from "./board.mjs";
import { GlossaryHoverCard, loadGlossary } from "./hover-card.mjs";
import { wasCaptureMove, BOT_TIERS } from "./bot.mjs";
import { WeiqiSound } from "./sound.mjs";
import { ConceptToastStrip } from "./concept-toast.mjs";
import { LADDER_PROGRESS_KEY, unlockedCount, isRungUnlocked, addClearedRung, parseClearedRungIds } from "./ladder-progress.mjs";

const RULESET = "japanese"; // simple ko, suicide illegal -- capture-go's traditional rules; komi/scoring unused
const TOUCH_MODE_KEY = "weiqi-touch-mode";

const boardHost = document.getElementById("board-host");
const boardWrap = document.getElementById("board-wrap");
const statusLine = document.getElementById("status-line");
const eventLog = document.getElementById("event-log");
const newGameBtn = document.getElementById("new-game-btn");
const soundToggleBtn = document.getElementById("sound-toggle-btn");
const conceptTierSelect = document.getElementById("concept-tier-select");
const touchModeSelect = document.getElementById("touch-mode-select");
const rungListEl = document.getElementById("ladder-rungs");
const rungIntroEl = document.getElementById("ladder-intro");
const celebrationEl = document.getElementById("ladder-celebration");

const glossary = await loadGlossary();
const hoverCard = new GlossaryHoverCard(glossary);
hoverCard.attachTermSpans(document);

async function loadRungs() {
  const res = await fetch("data/ladder-rungs.json");
  if (!res.ok) throw new Error(`Failed to load ladder-rungs.json: ${res.status}`);
  const doc = await res.json();
  return doc.rungs;
}

const rungs = await loadRungs();

/** The set of cleared rung ids, best-effort persisted -- a storage failure (private browsing, quota) degrades to "nothing persists" rather than breaking play. The unlock RULE itself (which rung indices count as playable) lives in ladder-progress.mjs, pure and unit-tested; this module only owns reading/writing the browser storage around it. */
function loadClearedRungIds() {
  try {
    return parseClearedRungIds(localStorage.getItem(LADDER_PROGRESS_KEY));
  } catch {
    return [];
  }
}

function saveClearedRungIds(ids) {
  try {
    localStorage.setItem(LADDER_PROGRESS_KEY, JSON.stringify(ids));
  } catch {
    /* best-effort persistence only */
  }
}

const rungIds = rungs.map((r) => r.id);
let clearedRungIds = loadClearedRungIds();
let currentRungIndex = Math.min(unlockedCount(rungIds, clearedRungIds), rungs.length - 1);

const board = new WeiqiBoard(boardHost, { size: rungs[currentRungIndex].boardSize, cell: 52 });
hoverCard.wireBoardEvents(board);

const sound = new WeiqiSound();
const toasts = new ConceptToastStrip(boardWrap, { hoverCard });

function loadStoredTouchMode() {
  try {
    const stored = localStorage.getItem(TOUCH_MODE_KEY);
    return stored === "confirm" ? "confirm" : "drag";
  } catch {
    return "drag";
  }
}

board.setTouchMode(loadStoredTouchMode());

function currentRung() {
  return rungs[currentRungIndex];
}

function botTierFor(rung) {
  const tier = BOT_TIERS.find((t) => t.id === rung.botId);
  if (!tier) throw new Error(`ladder-rungs.json names unknown bot tier id "${rung.botId}"`);
  return tier;
}

let game = new kernel.Game(currentRung().boardSize, RULESET);
let winner = null;
let botThinking = false;

function playerLabel(color) {
  if (color === kernel.BLACK) return "Black (you)";
  return `White (${botTierFor(currentRung()).label})`;
}

function setStatus(text) {
  statusLine.textContent = text;
}

function describeEvent(ev, mover) {
  switch (ev.type) {
    case "atari-given":
      return `${playerLabel(mover === kernel.BLACK ? kernel.WHITE : kernel.BLACK)}'s group is now in atari at ${ev.detail.point}.`;
    case "atari-escaped":
      return `${playerLabel(mover)}'s group escaped atari.`;
    case "capture":
      return `${playerLabel(mover)} captured ${ev.detail.stonesCaptured} stone(s) at ${ev.detail.point}.`;
    case "ko-started":
      return `A ko started at ${ev.detail.point}.`;
    case "ko-resolved":
      return `The ko at ${ev.detail.point} resolved.`;
    case "connection":
      return `${playerLabel(mover)} connected ${ev.detail.mergedGroups} groups at ${ev.detail.point}.`;
    case "eye-formed":
      return `${playerLabel(mover)} formed an eye at ${ev.detail.point}.`;
    case "group-killed":
      return `A group of ${ev.detail.groupSize} stone(s) was captured.`;
    default:
      return ev.type;
  }
}

function logEvent(ev, mover) {
  const item = document.createElement("div");
  item.className = "event-item";
  const glyph = document.createElement("span");
  glyph.textContent = describeEvent(ev, mover);
  const term = document.createElement("span");
  term.className = "term-hover";
  term.setAttribute("data-term", ev.term);
  term.tabIndex = 0;
  term.textContent = ` (${ev.term})`;
  item.append(glyph, term);
  eventLog.prepend(item);
  hoverCard.attachTermSpans(item);
}

function toastEvent(ev, mover) {
  if (!toasts.shouldShow(ev.type)) return;
  const spec = getEventGlyph(ev.type);
  toasts.push({ type: ev.type, term: ev.term, text: describeEvent(ev, mover), glyph: spec ? spec.glyph : "" });
}

function playEventSounds(ev) {
  if (ev.type === "capture") sound.playCapture(ev.detail.stonesCaptured ?? 1);
  else if (ev.type === "atari-given") sound.playAtari();
}

function updateKoMarker() {
  board.setKoPoint(game.activeKoPoint === null ? null : kernel.pointToCoord(game.size, game.activeKoPoint));
}

function render() {
  board.setPosition(game.current.board, { toMove: game.current.toMove });
  board.setLegalityChecker((coord) => game.isLegal(coord));
  if (winner) {
    setStatus(`${playerLabel(winner)} wins by capture! Start a new game to play again.`);
  } else {
    setStatus(`${playerLabel(game.current.toMove)} to move.${botThinking ? " (bot is thinking…)" : ""}`);
  }
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

  const col = coord === "pass" ? -1 : coord.charCodeAt(0);
  sound.playStoneClick(col, coord === "pass" ? -1 : Number(coord.slice(1)) || 0);

  for (const ev of outcome.events) {
    logEvent(ev, mover);
    toastEvent(ev, mover);
    playEventSounds(ev);
  }
  board.announce(`${playerLabel(mover)} played ${coord}.` + (wasCaptureMove(outcome.events) ? " Capture!" : ""));
  if (wasCaptureMove(outcome.events)) {
    winner = mover;
    sound.playGameEnd();
    if (winner === kernel.BLACK) onHumanClearedRung();
  }
  render();
  return true;
}

async function botMove() {
  if (winner) return;
  botThinking = true;
  render();
  // A short, real delay -- not decorative flourish alone, but enough that
  // the "(bot is thinking...)" status text (screen-reader visible, not
  // color-coded) is meaningfully true rather than instantaneous.
  await new Promise((resolve) => setTimeout(resolve, 260));
  const coord = botTierFor(currentRung()).chooser(game, kernel);
  botThinking = false;
  applyMove(coord);
}

board.addEventListener("weiqi-move", async (evt) => {
  if (winner || botThinking || game.current.toMove !== kernel.BLACK) return;
  const ok = applyMove(evt.detail.coord);
  if (ok && !winner) {
    await botMove();
  }
});

/** Start (or restart) a game at `index`'s rung -- rebuilds the board at that rung's size and picks its bot tier. Does not touch ladder progress. */
function startRung(index) {
  currentRungIndex = index;
  const rung = currentRung();
  board.setSize(rung.boardSize);
  game = new kernel.Game(rung.boardSize, RULESET);
  winner = null;
  botThinking = false;
  eventLog.innerHTML = "";
  board.setLastMove(null);
  board.setAnnotations([]);
  updateKoMarker();
  hideCelebration();
  renderLadderPanel();
  render();
  board.announce(`${rung.label} started, ${rung.boardSize}x${rung.boardSize} board. Black to move.`);
}

newGameBtn.addEventListener("click", () => startRung(currentRungIndex));

// --- The onboarding ladder: rung selector, intro copy, progress, celebration ---

function hideCelebration() {
  celebrationEl.hidden = true;
  celebrationEl.textContent = "";
}

function renderLadderPanel() {
  const unlocked = unlockedCount(rungIds, clearedRungIds);

  rungListEl.innerHTML = "";
  rungs.forEach((rung, i) => {
    const btn = document.createElement("button");
    btn.type = "button";
    btn.className = "ladder-rung-btn";
    const cleared = clearedRungIds.includes(rung.id);
    const locked = !isRungUnlocked(i, rungIds, clearedRungIds);
    btn.disabled = locked;
    btn.setAttribute("aria-current", String(i === currentRungIndex));
    if (cleared) btn.classList.add("ladder-rung-cleared");
    if (i === currentRungIndex) btn.classList.add("ladder-rung-active");
    btn.textContent = `${cleared ? "✓ " : locked ? "🔒 " : ""}${i + 1}. ${rung.label}`;
    btn.title = locked
      ? `Clear "${rungs[unlocked - 1]?.label ?? rungs[0].label}" first to unlock this rung.`
      : `${rung.boardSize}x${rung.boardSize} board vs. ${botTierFor(rung).label}`;
    btn.addEventListener("click", () => {
      if (!locked) startRung(i);
    });
    rungListEl.appendChild(btn);
  });

  const rung = currentRung();
  const tier = botTierFor(rung);
  rungIntroEl.innerHTML = "";
  const h = document.createElement("h3");
  h.textContent = rung.introTitle;
  const quote = document.createElement("blockquote");
  quote.textContent = rung.introQuote;
  const cite = document.createElement("p");
  cite.className = "ladder-intro-source";
  cite.textContent = `— ${rung.introSource}`;
  const opponent = document.createElement("p");
  opponent.className = "ladder-intro-opponent";
  opponent.textContent = `This rung: ${rung.boardSize}×${rung.boardSize} board vs. ${tier.label} — ${tier.tagline}`;
  rungIntroEl.append(h, quote, cite, opponent);
}

/** Called once per game the moment Black (the human) wins by capture. Persists a first-time clear and shows the rung's own celebration copy; replaying an already-cleared rung still congratulates without re-triggering the "next rung unlocked" message. */
function onHumanClearedRung() {
  const rung = currentRung();
  const wasAlreadyCleared = clearedRungIds.includes(rung.id);
  const hadNextUnlockedBefore = isRungUnlocked(currentRungIndex + 1, rungIds, clearedRungIds);

  if (!wasAlreadyCleared) {
    clearedRungIds = addClearedRung(clearedRungIds, rung.id);
    saveClearedRungIds(clearedRungIds);
  }

  const justUnlockedNext =
    !hadNextUnlockedBefore && isRungUnlocked(currentRungIndex + 1, rungIds, clearedRungIds) && currentRungIndex + 1 < rungs.length;
  celebrationEl.hidden = false;
  celebrationEl.textContent = rung.celebration + (justUnlockedNext ? ` Next up: ${rungs[currentRungIndex + 1].label}.` : "");
  board.announce(celebrationEl.textContent);
  renderLadderPanel();
}

// --- Settings: sound mute, concept-toast tier, touch mode ------------------

function syncSoundBtn() {
  soundToggleBtn.textContent = sound.muted ? "Off" : "On";
  soundToggleBtn.setAttribute("aria-pressed", String(!sound.muted));
}
syncSoundBtn();
soundToggleBtn.addEventListener("click", () => {
  sound.toggleMuted();
  syncSoundBtn();
});

conceptTierSelect.value = toasts.tier;
conceptTierSelect.addEventListener("change", () => {
  toasts.setTier(conceptTierSelect.value);
});

touchModeSelect.value = board.touchMode;
touchModeSelect.addEventListener("change", () => {
  const mode = touchModeSelect.value === "confirm" ? "confirm" : "drag";
  board.setTouchMode(mode);
  try {
    localStorage.setItem(TOUCH_MODE_KEY, mode);
  } catch {
    /* best-effort persistence only */
  }
});

renderLadderPanel();
render();
