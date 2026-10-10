// The app shell: hash router, data loading, and the one face
// (Sandbox) that has no dedicated ui/*-player.mjs of its own. Every other
// face is a thin mount for its own module — this file's job is wiring:
// import the concrete board/bridge/bots modules once, build the factories
// every player's own constructor-injection contract asks for, and hand
// them out per route.
//
// Session factory choice, worth recording explicitly: kernel-bridge.mjs
// exports both a synchronous createSessionFactory(kernel) and a default
// export that is an async convenience wrapper (it lazily imports the built
// kernel itself). Every player's own SessionFactory typedef
// (lesson-player.mjs, tsumego-player.mjs, ui/tutorial.mjs) is
// `(opts) => SessionHandle` — synchronous, no Promise. This module
// therefore imports the built kernel directly at module scope and binds
// createSessionFactory(kernel) once, rather than using the default export
// — the default export's Promise would break every player that calls
// `sessionFactory({...}).play(...)` in the same tick. No file outside this
// one needed to change for that: both exports already existed in
// kernel-bridge.mjs; this is simply which one the contract's own
// synchronous SessionFactory shape calls for.
//
// No DOM access at module top level except the one entry-point call at the
// bottom (`boot()`); every other DOM-touching line lives inside a function.

import { createBoard } from "./ui/board.mjs";
import { createSessionFactory } from "./lib/kernel-bridge.mjs";
import { randomBot, greedyCaptureBot } from "./lib/bots.mjs";
import { loadGlossary } from "./lib/glossary-index.mjs";
import { attachHoverCards } from "./ui/hover-card.mjs";
import { createLessonPlayer } from "./ui/lesson-player.mjs";
import { createTsumegoPlayer } from "./ui/tsumego-player.mjs";
import { createTutorialPlayer } from "./ui/tutorial.mjs";
import { checkAttempt } from "./lib/tsumego-check.mjs";
import * as kernel from "../lib/kernel/index.mjs";

const sessionFactory = createSessionFactory(kernel);
const BOTS = { random: randomBot, greedy: greedyCaptureBot };

// ---------------------------------------------------------------------
// Small shared helpers (pure — no DOM access of their own beyond
// document.createElement, which is safe at any point after the module has
// loaded in a browser; this file has no node:test counterpart to keep
// import-safe, unlike every ui/*.mjs module).
// ---------------------------------------------------------------------

function el(tag, className, text) {
  const node = document.createElement(tag);
  if (className) node.className = className;
  if (text !== undefined) node.textContent = text;
  return node;
}

function capitalize(word) {
  return word.charAt(0).toUpperCase() + word.slice(1);
}

function prefersReducedMotion() {
  return window.matchMedia?.("(prefers-reduced-motion: reduce)").matches ?? false;
}

/**
 * Marker list for one played move's outcome — the last-move dot plus a
 * captured-stone ring per removed stone. Deliberately reimplemented here
 * rather than imported from lesson-player.mjs or ui/tutorial.mjs: both of
 * those modules already reimplement the same handful of lines rather than
 * import it from each other (see either module's own header on why their
 * same-agent-sibling import boundary stops short of that), and this
 * module sits outside every one of those boundaries.
 */
function markersForOutcome(move, events) {
  const markers = [];
  if (move !== "pass") markers.push({ pt: move, kind: "last-move" });
  for (const event of events ?? []) {
    if (event.type === "group-killed" && Array.isArray(event.detail?.stones)) {
      for (const pt of event.detail.stones) markers.push({ pt, kind: "event", label: "captured" });
    }
  }
  return markers;
}

// A short, human phrase per kernel SemanticEventType — "pass" and
// "group-killed" are deliberately omitted from the feed (see
// notableEventPhrases below): a pass is already named by the move label
// itself, and group-killed is the same fact the aggregate "capture" event
// already states, per stone-group rather than per move.
const EVENT_LABELS = {
  "atari-given": "atari",
  "atari-escaped": "escaped atari",
  "ko-started": "ko started",
  "ko-resolved": "ko resolved",
  connection: "connected",
  "eye-formed": "eye formed",
  "game-ended": "game ends — two passes",
};

/**
 * The event feed's own compact phrasing for one move's outcome.events —
 * the mechanism the plan calls "glossary-linked play": every phrase's
 * `term` is the kernel's own SemanticEvent.term, exactly as annotated
 * (see weiqi-engine/src/events.mts), not a locally-guessed mapping.
 */
function notableEventPhrases(events) {
  const out = [];
  for (const event of events ?? []) {
    if (event.type === "pass" || event.type === "group-killed") continue;
    if (event.type === "capture") {
      const n = event.detail?.stonesCaptured ?? 0;
      const self = event.detail?.selfCapture ? " (self)" : "";
      out.push({ term: event.term, label: `${n} ${n === 1 ? "stone" : "stones"} captured${self}` });
      continue;
    }
    out.push({ term: event.term, label: EVENT_LABELS[event.type] ?? event.type });
  }
  return out;
}

// ---------------------------------------------------------------------
// Boot-time state: fetched once, read by every route.
// ---------------------------------------------------------------------

let glossary = null;
let lessonsData = [];
let tsumegoData = { problems: [] };

const DATA_BASE = new URL("../data/", import.meta.url);

async function loadJson(name) {
  const res = await fetch(new URL(name, DATA_BASE));
  if (!res.ok) throw new Error(`${name}: HTTP ${res.status}`);
  return res.json();
}

// ---------------------------------------------------------------------
// Home
// ---------------------------------------------------------------------

// The plan's own three clusters (weiqi-platform-plan.md, "What we already
// have"): tactical / scoring / structural. Every slug here is a real
// glossary.json entry (extracted from content/text/glossary/terms/), so a
// missing term shows its slug rather than silently vanishing.
const CONCEPT_CLUSTERS = [
  {
    title: "Tactical",
    blurb: "The moment-to-moment fight: what keeps a stone alive, and what takes it off the board.",
    terms: ["liberty", "atari", "capture", "ko"],
  },
  {
    title: "Scoring",
    blurb: "What the game is worth at the end, and how the count stays fair between the two sides.",
    terms: ["territory", "komi", "handicap"],
  },
  {
    title: "Structural",
    blurb: "How lone stones become one group, and how a group becomes unkillable.",
    terms: ["connection", "eye", "life-and-death"],
  },
];

const FACE_LINKS = [
  { href: "#/tutorial", title: "Tutorial", text: "Five short stages, first stone to a full scored game." },
  { href: "#/lessons", title: "Lessons", text: "The corpus's own worked-example lessons, made interactive." },
  { href: "#/tsumego", title: "Tsumego", text: "Graded life-and-death problems, checked move by move." },
  { href: "#/sandbox", title: "Sandbox", text: "A free board — any size, any ruleset, bots optional." },
  { href: "#/glossary", title: "Glossary", text: "Every term the kernel itself recognizes, searchable." },
];

function renderHome(mainEl) {
  const root = el("div", "view view--home");

  const hero = el("section", "hero");
  hero.appendChild(el("h1", null, "Weiqi — learn by playing"));
  hero.appendChild(
    el(
      "p",
      "hero__lede",
      "A board that explains itself. Every event the rules kernel recognizes as you play — atari, capture, ko, " +
        "a group's first eye — links straight back to the glossary entry that defines it. New here? Start with the tutorial.",
    ),
  );
  const cta = document.createElement("a");
  cta.className = "button button--primary";
  cta.href = "#/tutorial";
  cta.textContent = "Start the tutorial";
  hero.appendChild(cta);
  root.appendChild(hero);

  const conceptSection = el("section", "concept-section");
  conceptSection.appendChild(el("h2", null, "Three ideas, one board"));
  conceptSection.appendChild(
    el(
      "p",
      "view-lede",
      "Every term below is something the kernel itself watches for while you play, grouped the way the glossary groups them.",
    ),
  );
  const grid = el("div", "concept-map");
  for (const cluster of CONCEPT_CLUSTERS) {
    const card = el("article", "cluster-card");
    card.appendChild(el("h3", null, cluster.title));
    card.appendChild(el("p", null, cluster.blurb));
    const termsEl = el("div", "cluster-card__terms");
    for (const slug of cluster.terms) {
      const term = glossary.byTerm(slug);
      const chip = document.createElement("button");
      chip.type = "button";
      chip.className = "term-chip";
      chip.dataset.term = slug;
      chip.textContent = term ? term.title : slug;
      termsEl.appendChild(chip);
    }
    card.appendChild(termsEl);
    grid.appendChild(card);
  }
  conceptSection.appendChild(grid);
  root.appendChild(conceptSection);

  const facesSection = el("section", "faces-section");
  facesSection.appendChild(el("h2", null, "Where to go next"));
  const faceGrid = el("div", "face-links");
  for (const face of FACE_LINKS) {
    const a = document.createElement("a");
    a.className = "face-link";
    a.href = face.href;
    a.appendChild(el("h3", null, face.title));
    a.appendChild(el("p", null, face.text));
    faceGrid.appendChild(a);
  }
  facesSection.appendChild(faceGrid);
  root.appendChild(facesSection);

  mainEl.appendChild(root);

  // Every concept-map chip both routes to its glossary entry (a real
  // click/Enter action) and, via its data-term attribute, gets a
  // hover-card from attachHoverCards below — "data-term links" in the
  // literal sense: link and glossary lookup, on the same element.
  root.addEventListener("click", (event) => {
    const chip = event.target.closest(".term-chip");
    if (!chip) return;
    location.hash = `#/glossary/${chip.dataset.term}`;
  });

  const hoverCards = attachHoverCards(root, glossary);
  return () => hoverCards.destroy();
}

// ---------------------------------------------------------------------
// Tutorial
// ---------------------------------------------------------------------

function renderTutorial(mainEl) {
  const root = el("div", "view view--tutorial");
  root.appendChild(el("h1", "view-heading", "Tutorial: the capture-go ladder"));
  root.appendChild(
    el(
      "p",
      "view-lede",
      "Five short stages, first stone to a full scored game on 9x9. You are always Black.",
    ),
  );
  const mount = el("div", "tutorial-mount");
  root.appendChild(mount);
  mainEl.appendChild(root);

  const player = createTutorialPlayer(mount, { boardFactory: createBoard, sessionFactory, glossary });
  player.load();
  return () => player.destroy();
}

// ---------------------------------------------------------------------
// Lessons
// ---------------------------------------------------------------------

function renderLessons(mainEl, param) {
  const root = el("div", "view view--lessons");
  root.appendChild(el("h1", "view-heading", "Lessons"));
  root.appendChild(
    el("p", "view-lede", "The corpus's own sequenced lessons, converted step by step into interactive walkthroughs."),
  );

  const picker = el("nav", "lesson-picker");
  picker.setAttribute("aria-label", "Lessons");
  const list = el("ul", "lesson-picker__list");
  picker.appendChild(list);
  root.appendChild(picker);

  const mount = el("div", "lesson-mount");
  root.appendChild(mount);
  mainEl.appendChild(root);

  const startLesson = (param && lessonsData.find((l) => l.slug === param)) || lessonsData[0];

  for (const lesson of lessonsData) {
    const li = document.createElement("li");
    const btn = el("button", "lesson-picker__item", lesson.title);
    btn.type = "button";
    btn.setAttribute("aria-current", startLesson && lesson.slug === startLesson.slug ? "true" : "false");
    btn.addEventListener("click", () => {
      location.hash = `#/lessons/${lesson.slug}`;
    });
    li.appendChild(btn);
    list.appendChild(li);
  }

  if (!startLesson) {
    mount.appendChild(el("p", "view-lede", "No lessons are available."));
    return () => {};
  }

  const player = createLessonPlayer(mount, {
    boardFactory: createBoard,
    sessionFactory,
    glossary,
    onNavigateLesson: (nextSlug) => {
      location.hash = `#/lessons/${nextSlug}`;
    },
  });
  player.load(startLesson);
  return () => player.destroy();
}

// ---------------------------------------------------------------------
// Tsumego
// ---------------------------------------------------------------------

function uniqueSets(problems) {
  const seen = [];
  for (const p of problems) if (!seen.includes(p.set)) seen.push(p.set);
  return seen;
}

function firstProblemIdForSet(problems, set) {
  return problems.find((p) => p.set === set)?.id ?? null;
}

function renderTsumego(mainEl, param) {
  const problems = tsumegoData.problems;
  const root = el("div", "view view--tsumego");
  root.appendChild(el("h1", "view-heading", "Tsumego"));
  root.appendChild(
    el(
      "p",
      "view-lede",
      "Life-and-death problems, checked move by move against the kernel itself — not against a stored answer string.",
    ),
  );

  if (problems.length === 0) {
    root.appendChild(el("p", "view-lede", "No tsumego problems are available."));
    mainEl.appendChild(root);
    return () => {};
  }

  const activeProblem = (param && problems.find((p) => p.id === param)) || problems[0];
  const activeSet = activeProblem.set;

  const setPicker = el("nav", "tsumego-set-picker");
  setPicker.setAttribute("aria-label", "Problem sets");
  for (const set of uniqueSets(problems)) {
    const btn = el("button", null, set.replace(/-/g, " "));
    btn.type = "button";
    btn.setAttribute("aria-current", set === activeSet ? "true" : "false");
    btn.addEventListener("click", () => {
      const id = firstProblemIdForSet(problems, set);
      if (id) location.hash = `#/tsumego/${id}`;
    });
    setPicker.appendChild(btn);
  }
  root.appendChild(setPicker);

  const mount = el("div", "tsumego-mount");
  root.appendChild(mount);
  mainEl.appendChild(root);

  const player = createTsumegoPlayer(mount, { boardFactory: createBoard, checkAttempt });
  player.load(problems, activeProblem.id);
  return () => player.destroy();
}

// ---------------------------------------------------------------------
// Glossary
// ---------------------------------------------------------------------

function renderGlossary(mainEl, param) {
  const root = el("div", "view view--glossary");
  root.appendChild(el("h1", "view-heading", "Glossary"));
  root.appendChild(
    el(
      "p",
      "view-lede",
      "Every term the kernel itself recognizes on the board, plus what they build on. Search, or follow a related term.",
    ),
  );

  const searchWrap = el("div", "glossary-search");
  const searchInput = document.createElement("input");
  searchInput.type = "search";
  searchInput.className = "glossary-search__input";
  searchInput.placeholder = "Search terms…";
  searchInput.setAttribute("aria-label", "Search glossary terms");
  searchWrap.appendChild(searchInput);
  root.appendChild(searchWrap);

  const list = el("ul", "glossary-list");
  root.appendChild(list);

  /** @type {Map<string, {li: HTMLElement, term: object}>} */
  const entries = new Map();
  for (const term of glossary.all()) {
    const li = el("li", "glossary-entry");
    li.id = `term-${term.name}`;
    li.appendChild(el("h2", "glossary-entry__title", term.title));
    li.appendChild(el("p", "glossary-entry__definition", term.definition));
    if (term.related.length > 0) {
      const rel = el("p", "glossary-entry__related");
      rel.appendChild(document.createTextNode("Related: "));
      term.related.forEach((slug, i) => {
        const relatedTerm = glossary.byTerm(slug);
        const chip = document.createElement("button");
        chip.type = "button";
        chip.className = "term-chip term-chip--inline";
        chip.dataset.term = slug;
        chip.textContent = relatedTerm ? relatedTerm.title : slug;
        rel.appendChild(chip);
        if (i < term.related.length - 1) rel.appendChild(document.createTextNode(", "));
      });
      li.appendChild(rel);
    }
    list.appendChild(li);
    entries.set(term.name, { li, term });
  }

  root.addEventListener("click", (event) => {
    const chip = event.target.closest(".term-chip");
    if (!chip) return;
    location.hash = `#/glossary/${chip.dataset.term}`;
  });

  searchInput.addEventListener("input", () => {
    const q = searchInput.value.trim().toLowerCase();
    for (const { li, term } of entries.values()) {
      const match = !q || term.title.toLowerCase().includes(q) || term.definition.toLowerCase().includes(q);
      li.hidden = !match;
    }
  });

  mainEl.appendChild(root);

  if (param) {
    const target = entries.get(param.toLowerCase());
    if (target) {
      target.li.classList.add("is-target");
      target.li.scrollIntoView({ block: "center", behavior: prefersReducedMotion() ? "auto" : "smooth" });
    }
  }

  const hoverCards = attachHoverCards(root, glossary);
  return () => hoverCards.destroy();
}

// ---------------------------------------------------------------------
// Sandbox — the one face this shell owns directly rather than delegating
// to a ui/*-player.mjs, per the module-layout CONTRACT (no sandbox player
// module is declared). Board size + ruleset (including the app-layer
// capture-go shape) pickers, a bot toggle per color, undo by replaying the
// session's own history through a fresh session, pass-on-two-ends-the-game
// (kernel-bridge's own status() already implements that; this view only
// ever reads it), and an SGF export via a data: URL download plus a
// read-only textarea + Copy button as the fallback the CONTRACT calls for.
// ---------------------------------------------------------------------

const RULESET_OPTIONS = [
  { value: "chinese", label: "Chinese — area scoring" },
  { value: "japanese", label: "Japanese — territory scoring" },
  { value: "aga", label: "AGA — area/territory hybrid" },
  { value: "newzealand", label: "New Zealand — area, suicide legal" },
  { value: "ing", label: "Ing — area scoring" },
  { value: "capture-go", label: "Capture Go — first capture wins" },
];
const SIZE_OPTIONS = [5, 7, 9, 13, 19];
const CAPTURE_GO_TARGETS = [1, 3, 5];
const BOT_OPTIONS = [
  { value: "human", label: "Human" },
  { value: "random", label: "Random bot" },
  { value: "greedy", label: "Greedy bot" },
];
const BOT_MOVE_DELAY_MS = 350;

function describeEnd(status, score) {
  if (status.method === "capture") return `${capitalize(status.winner)} wins by capture.`;
  if (status.method === "stalemate") return "Stalemate — the board filled with no capture reaching target.";
  if (status.method === "score") {
    if (!score) return "Game ended.";
    return status.winner
      ? `${capitalize(status.winner)} wins, ${score.blackScore}–${score.whiteScore} (${score.margin}).`
      : `Draw, ${score.blackScore}–${score.whiteScore}.`;
  }
  return "Game ended.";
}

function buildSandboxField(labelText, selectEl) {
  const field = el("div", "sandbox-field");
  const id = `sandbox-${labelText.toLowerCase().replace(/[^a-z0-9]+/g, "-")}`;
  const label = el("label", null, labelText);
  label.htmlFor = id;
  selectEl.id = id;
  field.appendChild(label);
  field.appendChild(selectEl);
  return field;
}

function buildSelect(options, current) {
  const select = document.createElement("select");
  for (const opt of options) {
    const optionEl = document.createElement("option");
    optionEl.value = String(opt.value ?? opt);
    optionEl.textContent = opt.label ?? String(opt);
    select.appendChild(optionEl);
  }
  select.value = String(current);
  return select;
}

function renderSandbox(mainEl) {
  const root = el("div", "view view--sandbox");
  root.appendChild(el("h1", "view-heading", "Sandbox"));
  root.appendChild(
    el(
      "p",
      "view-lede",
      "A free board: pick a size and ruleset, choose which color (if any) a bot plays, then explore.",
    ),
  );

  const state = { size: 9, ruleset: "chinese", captureGoTarget: 1, bots: { black: "human", white: "greedy" } };

  const layout = el("div", "sandbox-layout");

  // ---- setup form -----------------------------------------------------
  const setupForm = document.createElement("form");
  setupForm.className = "sandbox-setup";
  setupForm.appendChild(el("h2", null, "Setup"));

  const sizeSelect = buildSelect(
    SIZE_OPTIONS.map((n) => ({ value: n, label: `${n}×${n}` })),
    state.size,
  );
  setupForm.appendChild(buildSandboxField("Board size", sizeSelect));

  const rulesetSelect = buildSelect(RULESET_OPTIONS, state.ruleset);
  setupForm.appendChild(buildSandboxField("Ruleset", rulesetSelect));

  const targetSelect = buildSelect(
    CAPTURE_GO_TARGETS.map((n) => ({ value: n, label: `First to ${n} capture${n === 1 ? "" : "s"}` })),
    state.captureGoTarget,
  );
  const targetField = buildSandboxField("Capture Go target", targetSelect);
  targetField.hidden = state.ruleset !== "capture-go";
  setupForm.appendChild(targetField);
  rulesetSelect.addEventListener("change", () => {
    targetField.hidden = rulesetSelect.value !== "capture-go";
  });

  const blackBotSelect = buildSelect(BOT_OPTIONS, state.bots.black);
  setupForm.appendChild(buildSandboxField("Black", blackBotSelect));

  const whiteBotSelect = buildSelect(BOT_OPTIONS, state.bots.white);
  setupForm.appendChild(buildSandboxField("White", whiteBotSelect));

  const newGameBtn = el("button", "sandbox-setup__submit", "New game");
  newGameBtn.type = "submit";
  setupForm.appendChild(newGameBtn);

  layout.appendChild(setupForm);

  // ---- board + status + controls --------------------------------------
  const playColumn = el("div", "sandbox-play");
  const boardMount = el("div", "sandbox-board-mount");
  const statusEl = el("p", "sandbox-status");
  statusEl.setAttribute("aria-live", "polite");
  const controls = el("div", "sandbox-controls");
  const passBtn = el("button", "sandbox-pass", "Pass");
  passBtn.type = "button";
  const undoBtn = el("button", "sandbox-undo", "Undo");
  undoBtn.type = "button";
  controls.append(passBtn, undoBtn);
  playColumn.append(boardMount, statusEl, controls);
  layout.appendChild(playColumn);

  // ---- event feed + SGF panel ------------------------------------------
  const sideColumn = el("div", "sandbox-side");

  const feedSection = el("section", "event-feed");
  feedSection.appendChild(el("h2", "event-feed__heading", "Move log"));
  const feedEmpty = el("p", "event-feed__empty", "No moves yet.");
  feedSection.appendChild(feedEmpty);
  const feedList = el("ol", "event-feed__list");
  feedSection.appendChild(feedList);
  sideColumn.appendChild(feedSection);

  const sgfSection = el("section", "sgf-panel");
  sgfSection.appendChild(el("h2", "sgf-panel__heading", "Game record (SGF)"));
  const sgfTextarea = document.createElement("textarea");
  sgfTextarea.className = "sgf-panel__text";
  sgfTextarea.readOnly = true;
  sgfTextarea.setAttribute("aria-label", "SGF game record");
  sgfSection.appendChild(sgfTextarea);
  const sgfActions = el("div", "sgf-panel__actions");
  const copyBtn = el("button", null, "Copy SGF");
  copyBtn.type = "button";
  const downloadLink = document.createElement("a");
  downloadLink.className = "sgf-panel__download";
  downloadLink.textContent = "Download .sgf";
  sgfActions.append(copyBtn, downloadLink);
  sgfSection.appendChild(sgfActions);
  sideColumn.appendChild(sgfSection);

  layout.appendChild(sideColumn);
  root.appendChild(layout);
  mainEl.appendChild(root);

  // ---- session wiring ---------------------------------------------------

  let session = null;
  let boardHandle = null;
  let hoverCardHandle = null;
  let generation = 0;
  let botTimer = null;

  function isBotColor(color) {
    return state.bots[color] !== "human";
  }
  function anyHuman() {
    return !isBotColor("black") || !isBotColor("white");
  }

  function refreshHoverCards() {
    hoverCardHandle?.destroy();
    hoverCardHandle = attachHoverCards(feedSection, glossary);
  }

  function appendFeedEntry(mover, move, events) {
    feedEmpty.hidden = true;
    const li = document.createElement("li");
    li.className = "event-feed__entry";
    const moveSpan = el(
      "span",
      "event-feed__move",
      `${feedList.children.length + 1}. ${capitalize(mover)} ${move === "pass" ? "passes" : move}`,
    );
    li.appendChild(moveSpan);
    const phrases = notableEventPhrases(events);
    if (phrases.length > 0) {
      const tags = el("span", "event-feed__tags");
      for (const { term, label } of phrases) {
        const span = document.createElement("span");
        span.className = "glossary-term";
        span.dataset.term = term;
        span.textContent = label;
        tags.appendChild(span);
      }
      li.appendChild(tags);
    }
    feedList.appendChild(li);
    feedList.scrollTop = feedList.scrollHeight;
    refreshHoverCards();
  }

  function trimFeedTo(count) {
    while (feedList.children.length > count) feedList.lastElementChild.remove();
    feedEmpty.hidden = feedList.children.length > 0;
  }

  function refreshStatus() {
    const status = session.status();
    if (status.phase === "playing") {
      statusEl.textContent = `${capitalize(session.toMove())} to move.`;
      statusEl.dataset.state = "playing";
      passBtn.disabled = isBotColor(session.toMove()) || !session.preview("pass").legal;
    } else {
      statusEl.textContent = describeEnd(status, session.score());
      statusEl.dataset.state = status.winner ? `${status.winner}-wins` : "ended";
      passBtn.disabled = true;
    }
    undoBtn.disabled = session.history().length === 0;
  }

  function refreshSgf() {
    const sgf = session.toSgf();
    sgfTextarea.value = sgf;
    downloadLink.href = `data:application/x-go-sgf;charset=utf-8,${encodeURIComponent(sgf)}`;
    downloadLink.download = `weiqi-${state.size}x${state.size}-${state.ruleset}.sgf`;
  }

  function scheduleBotIfNeeded(gen) {
    if (!session) return;
    if (session.status().phase !== "playing") return;
    if (!isBotColor(session.toMove())) return;
    const botFn = BOTS[state.bots[session.toMove()]];
    clearTimeout(botTimer);
    botTimer = setTimeout(() => {
      if (gen !== generation || !session) return;
      performMove(botFn({ session }));
    }, BOT_MOVE_DELAY_MS);
  }

  function performMove(move) {
    if (!session) return;
    const mover = session.toMove();
    const outcome = session.play(move);
    if (!outcome.ok) {
      boardHandle.announce(`${move === "pass" ? "Pass" : move} isn't legal here (${outcome.reason}).`);
      return;
    }
    appendFeedEntry(mover, move, outcome.events);
    boardHandle.setStones(session.stones());
    boardHandle.setMarkers(markersForOutcome(move, outcome.events));
    boardHandle.announce(move === "pass" ? `${capitalize(mover)} passes.` : `${capitalize(mover)} plays ${move}.`);
    refreshStatus();
    refreshSgf();
    scheduleBotIfNeeded(generation);
  }

  function onBoardIntent(pt) {
    if (!session || session.status().phase !== "playing") return;
    if (isBotColor(session.toMove())) return;
    performMove(pt);
  }

  function rebuildSessionFrom(moves) {
    generation += 1;
    clearTimeout(botTimer);
    session = sessionFactory({ size: state.size, ruleset: state.ruleset, captureGoTarget: state.captureGoTarget });
    for (const mv of moves) session.play(mv);
  }

  function undo() {
    if (!session) return;
    let moves = session.history();
    if (moves.length === 0) return;
    moves = moves.slice(0, -1);
    rebuildSessionFrom(moves);
    // Keep popping while it would be a bot's own turn to move again — an
    // "undo" a human asked for should land back on a human's decision,
    // not immediately hand the move straight back to the bot that just
    // made it. In all-bot mode (no human color at all) this stops after
    // one pop, since there is no human turn to land on.
    while (moves.length > 0 && isBotColor(session.toMove()) && anyHuman()) {
      moves = moves.slice(0, -1);
      rebuildSessionFrom(moves);
    }
    trimFeedTo(moves.length);
    boardHandle.setStones(session.stones());
    const last = session.lastMove();
    boardHandle.setMarkers(last ? [{ pt: last, kind: "last-move" }] : []);
    boardHandle.announce("Move undone.");
    refreshStatus();
    refreshSgf();
    scheduleBotIfNeeded(generation);
  }

  function newGame() {
    state.size = Number(sizeSelect.value);
    state.ruleset = rulesetSelect.value;
    state.captureGoTarget = Number(targetSelect.value);
    state.bots.black = blackBotSelect.value;
    state.bots.white = whiteBotSelect.value;

    generation += 1;
    const gen = generation;
    clearTimeout(botTimer);
    feedList.textContent = "";
    feedEmpty.hidden = false;

    session = sessionFactory({ size: state.size, ruleset: state.ruleset, captureGoTarget: state.captureGoTarget });
    boardHandle?.destroy();
    boardHandle = createBoard(boardMount, {
      size: state.size,
      coordinates: true,
      interactive: true,
      onIntent: onBoardIntent,
    });
    boardHandle.setStones([]);
    boardHandle.setMarkers([]);
    refreshStatus();
    refreshSgf();
    refreshHoverCards();
    scheduleBotIfNeeded(gen);
  }

  setupForm.addEventListener("submit", (event) => {
    event.preventDefault();
    newGame();
  });
  passBtn.addEventListener("click", () => {
    if (!session || isBotColor(session.toMove())) return;
    performMove("pass");
  });
  undoBtn.addEventListener("click", undo);

  copyBtn.addEventListener("click", async () => {
    sgfTextarea.select();
    try {
      if (navigator.clipboard?.writeText) {
        await navigator.clipboard.writeText(sgfTextarea.value);
      } else {
        document.execCommand("copy");
      }
      copyBtn.textContent = "Copied";
    } catch {
      copyBtn.textContent = "Select the text above and copy manually";
    }
    setTimeout(() => {
      copyBtn.textContent = "Copy SGF";
    }, 1800);
  });

  newGame();

  return () => {
    generation += 1;
    clearTimeout(botTimer);
    boardHandle?.destroy();
    hoverCardHandle?.destroy();
  };
}

// ---------------------------------------------------------------------
// Router
// ---------------------------------------------------------------------

const ROUTES = {
  "": renderHome,
  tutorial: renderTutorial,
  lessons: renderLessons,
  tsumego: renderTsumego,
  sandbox: renderSandbox,
  glossary: renderGlossary,
};

function parseHash() {
  const trimmed = location.hash.replace(/^#\/?/, "");
  if (!trimmed) return { route: "", param: null };
  const slash = trimmed.indexOf("/");
  if (slash === -1) return { route: trimmed, param: null };
  return { route: trimmed.slice(0, slash), param: decodeURIComponent(trimmed.slice(slash + 1)) || null };
}

let teardownCurrent = () => {};

function setActiveNav(navEls, route) {
  const key = route in ROUTES && route !== "" ? route : "home";
  for (const link of navEls) {
    const isActive = link.dataset.route === key;
    link.classList.toggle("is-active", isActive);
    // Matches the lesson picker / tsumego set picker / tsumego dots'
    // own true/false convention (app.mjs:297,362, tsumego-player.mjs:129)
    // so a screen-reader user gets the same programmatic "current" signal
    // from top-level nav that every other picker/tab widget already gives.
    link.setAttribute("aria-current", isActive ? "true" : "false");
  }
}

function makeRouter(mainEl, navEls) {
  return function router() {
    const { route, param } = parseHash();
    teardownCurrent();
    teardownCurrent = () => {};
    mainEl.textContent = "";
    const handler = Object.prototype.hasOwnProperty.call(ROUTES, route) ? ROUTES[route] : renderHome;
    setActiveNav(navEls, Object.prototype.hasOwnProperty.call(ROUTES, route) ? route : "");
    const maybeTeardown = handler(mainEl, param);
    if (typeof maybeTeardown === "function") teardownCurrent = maybeTeardown;
    mainEl.focus();
  };
}

// ---------------------------------------------------------------------
// Boot
// ---------------------------------------------------------------------

async function boot() {
  const mainEl = document.getElementById("main");
  const navEls = document.querySelectorAll("[data-route]");

  try {
    const [glossaryJson, lessonsJson, tsumegoJson] = await Promise.all([
      loadJson("glossary.json"),
      loadJson("lessons.json"),
      loadJson("tsumego.json"),
    ]);
    glossary = loadGlossary(glossaryJson);
    lessonsData = lessonsJson;
    tsumegoData = tsumegoJson;
  } catch (err) {
    mainEl.textContent = `Weiqi Learn couldn't load its own data (${err.message}). Try reloading the page.`;
    return;
  }

  const router = makeRouter(mainEl, navEls);
  window.addEventListener("hashchange", router);
  router();
}

boot();
