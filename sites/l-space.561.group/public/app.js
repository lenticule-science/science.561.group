import { DEFAULT_TARGET_RETENTION, recallProbability, reviewCard } from "./js/srs.mjs";
import { classifyStage } from "./js/lightcone.mjs";
import { searchImmutableRoomIndex } from "./js/room-index-search.mjs";
import { applyTufteProjectionPatch, diffTufteProjection, normalizeTufteModel } from "./js/tufte-browser.mjs";
const view = document.querySelector("#view");
const loading = document.querySelector("#loading");
const search = document.querySelector("#search");
const scienceNav = document.querySelector("#science-nav");
const cardTemplate = document.querySelector("#room-card-template");
const state = {
  anonymous: false, me: null, surface: null, publicIndex: null, manifest: null, index: null, garden: null, halls: null,
  feltosRelations: null, indexPromise: null, hallsPromise: null, reviews: new Map(), byId: new Map(), byKey: new Map(), byName: new Map(), collections: [],
};

async function beginDiscordCommandLogin(container) {
  container.replaceChildren();
  const status = document.createElement("p");
  status.className = "discord-command-status";
  status.setAttribute("role", "status");
  status.textContent = "Opening a short Discord login code…";
  container.append(status);
  let challenge;
  try {
    const response = await fetch("/api/v1/discord/command-challenge", {
      method: "POST",
      headers: { "content-type": "application/json" },
      body: JSON.stringify({ action: "create" }),
    });
    const result = await response.json();
    if (!response.ok) throw new Error(result.error ?? `HTTP ${response.status}`);
    challenge = result.challenge;
    const instructions = document.createElement("p");
    instructions.className = "discord-command-instructions";
    instructions.append("In Turntide Island, run ", Object.assign(document.createElement("code"), {
      textContent: `/l-space-login code:${challenge}`,
    }), ". Keep this tab open; it will enter L-Space when Discord confirms your islander role.");
    container.replaceChildren(instructions, status);
    status.textContent = "Waiting for Discord confirmation…";
  } catch (error) {
    status.textContent = `Discord login could not start: ${error.message}`;
    return;
  }

  const deadline = Date.now() + 5 * 60 * 1000;
  while (Date.now() < deadline) {
    await new Promise((resolve) => setTimeout(resolve, 1500));
    try {
      const response = await fetch("/api/v1/discord/command-challenge", {
        method: "POST",
        headers: { "content-type": "application/json" },
        body: JSON.stringify({ action: "poll", challenge }),
      });
      if (response.status === 202) continue;
      const result = await response.json();
      if (!response.ok) throw new Error(result.error ?? `HTTP ${response.status}`);
      status.textContent = "Discord confirmed your islander role. Opening L-Space…";
      location.reload();
      return;
    } catch (error) {
      status.textContent = `Discord login stopped: ${error.message}`;
      return;
    }
  }
  status.textContent = "That login code expired. Start again for a fresh code.";
}

function discordCommandControl(label = "Enter through Discord") {
  const wrapper = document.createElement("div");
  wrapper.className = "discord-command-login";
  const button = document.createElement("button");
  button.type = "button";
  button.className = "signin-cta";
  button.textContent = `${label} →`;
  button.addEventListener("click", () => beginDiscordCommandLogin(wrapper));
  wrapper.append(button);
  return wrapper;
}

function words(value) {
  return value.replace(/-services-section$/i, "").replace(/[-_]+/g, " ").replace(/\b\w/g, (letter) => letter.toUpperCase());
}
function collectionFor(room) {
  const parts = room.id.split("/");
  if (parts[0] === "services" && parts[1]) return { id: `services/${parts[1]}`, name: words(parts[1]), type: "science" };
  if (parts[0] === "content") return { id: "content", name: "Library & Articles", type: "library" };
  if (parts[0] === "apps") return { id: "apps", name: "Applications", type: "application" };
  return { id: parts[0] || "root", name: words(parts[0] || "Root Notes"), type: "collection" };
}
function indexCorpus(index) {
  const counts = new Map();
  for (const room of index.rooms) {
    state.byId.set(room.id, room);
    state.byKey.set(room.key, room);
    for (const candidate of [room.title, room.id, room.id.split("/").at(-1)?.replace(/\.md$/i, "")]) {
      const name = candidate?.toLocaleLowerCase().trim();
      if (name && !state.byName.has(name)) state.byName.set(name, room);
    }
    const collection = collectionFor(room);
    const current = counts.get(collection.id) ?? { ...collection, count: 0 };
    current.count += 1;
    counts.set(collection.id, current);
  }
  state.collections = [...counts.values()].sort((a, b) => b.count - a.count || a.name.localeCompare(b.name));
}
async function loadIndex() {
  if (state.index) return state.index;
  if (state.indexPromise === null) {
    state.indexPromise = fetch("/api/v1/vault/index").then(async (response) => {
      if (!response.ok) throw new Error(`The catalogue did not open (${response.status}).`);
      const index = await response.json();
      state.index = index; indexCorpus(index); updateNavigation(); return index;
    });
  }
  return state.indexPromise;
}
async function loadHalls() {
  if (state.halls) return state.halls;
  if (state.hallsPromise === null) {
    state.hallsPromise = fetch("/api/v1/vault/halls").then(async (response) => {
      if (!response.ok) throw new Error(`The halls did not open (${response.status}).`);
      state.halls = await response.json(); return state.halls;
    });
  }
  return state.hallsPromise;
}
const roomHref = (room) => `#/room/${room.key}`;
const publicRoomHref = (room) => `#/public/${room.key}`;
function roomCard(room, hrefFor = roomHref) {
  const fragment = cardTemplate.content.cloneNode(true);
  fragment.querySelector("a").href = hrefFor(room);
  fragment.querySelector(".room-kind").textContent = room.kind === "unknown" ? "note" : room.kind;
  fragment.querySelector(".room-title").textContent = room.title;
  fragment.querySelector(".room-summary").textContent = room.summary;
  fragment.querySelector(".room-path").textContent = room.id;
  return fragment;
}
function roomList(rooms, { limit = 72, hrefFor = roomHref } = {}) {
  const fragment = document.createDocumentFragment();
  const container = document.createElement("div");
  container.className = "results";
  for (const room of rooms.slice(0, limit)) container.append(roomCard(room, hrefFor));
  if (!rooms.length) {
    const empty = document.createElement("p"); empty.className = "empty";
    empty.textContent = "No rooms answer to that description. The shelves remain suspiciously quiet.";
    container.append(empty);
  }
  fragment.append(container);
  if (rooms.length > limit) {
    const more = document.createElement("p"); more.className = "more-results";
    more.textContent = `Showing ${limit.toLocaleString()} of ${rooms.length.toLocaleString()} rooms. Narrow the search to summon fewer corridors.`;
    fragment.append(more);
  }
  return fragment;
}
function sectionHead(title, note) {
  const element = document.createElement("div"); element.className = "section-head";
  const heading = document.createElement("h2"); heading.textContent = title;
  const detail = document.createElement("p"); detail.textContent = note;
  element.append(heading, detail); return element;
}
function catalogueAtlas() {
  const figure = document.createElement("figure"); figure.className = "catalogue-atlas";
  const canvas = document.createElement("canvas"); canvas.tabIndex = 0; canvas.setAttribute("role", "img");
  canvas.setAttribute("aria-label", `Catalogue atlas of ${state.index.rooms.length.toLocaleString()} L-Space rooms. Move across the atlas to inspect rooms; click to enter one.`);
  const tooltip = document.createElement("figcaption"); tooltip.className = "atlas-caption";
  tooltip.textContent = "96 columns · deterministic catalogue order · select any mark to enter its room";
  figure.append(canvas, tooltip);
  const positions = new Map(state.index.rooms.map((room) => [`${room.tufte.x}:${room.tufte.y}`, room]));
  const maxX = Math.max(...state.index.rooms.map((room) => room.tufte.x));
  const maxY = Math.max(...state.index.rooms.map((room) => room.tufte.y));
  let geometry;
  function draw() {
    const rectangle = canvas.getBoundingClientRect(); const ratio = devicePixelRatio || 1;
    canvas.width = Math.max(1, Math.floor(rectangle.width * ratio)); canvas.height = Math.max(1, Math.floor(rectangle.height * ratio));
    const context = canvas.getContext("2d"); context.scale(ratio, ratio); context.clearRect(0, 0, rectangle.width, rectangle.height);
    const padding = 16; const stepX = (rectangle.width - padding * 2) / (maxX + 1); const stepY = (rectangle.height - padding * 2) / (maxY + 1);
    geometry = { rectangle, padding, stepX, stepY };
    context.fillStyle = "#d7d0bf";
    for (const room of state.index.rooms) context.fillRect(padding + room.tufte.x * stepX, padding + room.tufte.y * stepY, Math.max(1, stepX * .48), Math.max(1, stepY * .48));
    context.fillStyle = "#155a85";
    for (const room of state.index.rooms) if (room.collection.startsWith("services/")) context.fillRect(padding + room.tufte.x * stepX, padding + room.tufte.y * stepY, Math.max(1, stepX * .52), Math.max(1, stepY * .52));
    context.strokeStyle = "#171b18"; context.lineWidth = 1; context.strokeRect(.5, .5, rectangle.width - 1, rectangle.height - 1);
  }
  function roomAt(event) {
    if (!geometry) return null; const rectangle = canvas.getBoundingClientRect();
    const x = Math.round((event.clientX - rectangle.left - geometry.padding) / geometry.stepX);
    const y = Math.round((event.clientY - rectangle.top - geometry.padding) / geometry.stepY);
    return positions.get(`${x}:${y}`) ?? null;
  }
  canvas.addEventListener("pointermove", (event) => { const room = roomAt(event); tooltip.textContent = room ? `${room.title} · ${room.kind === "unknown" ? "note" : room.kind}` : "96 columns · deterministic catalogue order"; canvas.dataset.roomKey = room?.key ?? ""; });
  canvas.addEventListener("pointerleave", () => { tooltip.textContent = "96 columns · deterministic catalogue order · select any mark to enter its room"; delete canvas.dataset.roomKey; });
  canvas.addEventListener("click", () => { const room = state.byKey.get(canvas.dataset.roomKey); if (room) location.hash = roomHref(room); });
  canvas.addEventListener("keydown", (event) => { if ((event.key === "Enter" || event.key === " ") && canvas.dataset.roomKey) { event.preventDefault(); const room = state.byKey.get(canvas.dataset.roomKey); if (room) location.hash = roomHref(room); } });
  new ResizeObserver(draw).observe(canvas); requestAnimationFrame(draw); return figure;
}
function tufteGarden() {
  const root = document.createElement("section"); root.dataset.tufte = ""; root.dataset.revision = state.garden.revision;
  const grid = document.createElement("div"); grid.className = "tufte-grid"; root.append(grid);
  const projection = normalizeTufteModel({
    ...state.garden,
    tiles: state.garden.tiles.map((tile) => ({
      ...tile,
      eyebrow: tile.view === "collection" ? "Science section" : tile.role === "now" ? "Macro view" : "Release evidence",
    })),
  });
  applyTufteProjectionPatch(root, diffTufteProjection({ revision: projection.revision, tiles: [] }, projection));
  for (const tile of projection.tiles) {
    const body = root.querySelector(`#${CSS.escape(tile.id)} .tufte-tile-body`);
    if (!body) continue;
    if (tile.view === "atlas") {
      const anchor = document.createElement("a"); anchor.className = "tile-route"; anchor.href = "#/catalogue"; anchor.textContent = `${tile.content} Open the addressable catalogue.`; body.replaceChildren(anchor);
    } else if (tile.view === "collection" || tile.view === "halls") {
      const anchor = document.createElement("a"); anchor.className = "tile-route"; anchor.href = tile.view === "halls" ? "#/halls" : `#/collection/${encodeURIComponent(tile.collectionId)}`; anchor.textContent = tile.content; body.replaceChildren(anchor);
    }
  }
  return root;
}
function showHome() {
  document.title = "L-Space · Lenticule Science"; view.replaceChildren();
  const hero = document.createElement("section"); hero.className = "hero";
  const introduction = document.createElement("div");
  introduction.innerHTML = '<p class="eyebrow">Authenticated digital garden</p><h1>L-Space</h1><p class="hero-copy">A living map of Lenticule Science: notes, concepts, people, arguments, systems, and the passages between them. Search directly, browse the sciences, or let VaultMaze turn reading into practiced knowledge.</p>';
  const legend = document.createElement("aside"); legend.className = "projection-legend";
  legend.innerHTML = '<p><b>SPACE</b> says what a concept means.</p><p><b>TUFTE</b> says how this view places it.</p><p><b>VaultMaze</b> governs participatory passage.</p>';
  hero.append(introduction, legend);
  view.append(hero, sectionHead("TUFTE projection 001", `Release ${state.garden.revision.slice(0, 12)} · stable semantic reading order`), tufteGarden());
}
function showCollection(id) {
  const decoded = decodeURIComponent(id);
  const rooms = state.index.rooms.filter((room) => room.id === decoded || room.id.startsWith(`${decoded}/`));
  const collection = state.collections.find((item) => item.id === decoded);
  const name = collection?.name ?? words(decoded);
  document.title = `${name} · L-Space`; view.replaceChildren();
  const eyebrow = document.createElement("p"); eyebrow.className = "eyebrow"; eyebrow.textContent = "Knowledge collection";
  const title = document.createElement("h1"); title.className = "page-title"; title.textContent = name;
  view.append(eyebrow, title, sectionHead(`${rooms.length.toLocaleString()} rooms`, "Ordered by title"), roomList(rooms.sort((a, b) => a.title.localeCompare(b.title))));
}
function showCatalogue() {
  document.title = "Catalogue atlas · L-Space"; view.replaceChildren();
  const eyebrow = document.createElement("p"); eyebrow.className = "eyebrow"; eyebrow.textContent = "Addressable knowledge cells";
  const title = document.createElement("h1"); title.className = "page-title"; title.textContent = "Catalogue atlas";
  const measures = document.createElement("p"); measures.className = "hero-copy"; measures.textContent = `${state.index.rooms.length.toLocaleString()} released rooms in deterministic TUFTE positions. This detailed catalogue is requested only when a reader opens it.`;
  view.append(eyebrow, title, measures, catalogueAtlas());
}
const hallHref = (hall) => `#/hall/${encodeURIComponent(hall.id)}`;
function hallCard(hall) {
  const anchor = document.createElement("a"); anchor.className = `hall-card${hall.stable ? " hall-stable" : ""}`; anchor.href = hallHref(hall);
  const kind = document.createElement("span"); kind.className = "hall-kind"; kind.textContent = hall.stable ? "Rigid hall" : "Hall";
  const title = document.createElement("strong"); title.className = "hall-title"; title.textContent = hall.title;
  const size = document.createElement("span"); size.className = "hall-size"; size.textContent = `${hall.size.toLocaleString()} ${hall.size === 1 ? "room" : "rooms"}`;
  anchor.append(kind, title, size); return anchor;
}
function showHalls() {
  document.title = "Halls · L-Space"; view.replaceChildren();
  const eyebrow = document.createElement("p"); eyebrow.className = "eyebrow"; eyebrow.textContent = "Formal concept clusters";
  const title = document.createElement("h1"); title.className = "page-title"; title.textContent = "Halls";
  const grid = document.createElement("div"); grid.className = "hall-grid";
  for (const hall of state.halls.halls) grid.append(hallCard(hall));
  view.append(eyebrow, title, sectionHead(`${state.halls.counts.halls.toLocaleString()} halls`, `${state.halls.counts.stable.toLocaleString()} rigid · largest first`), grid);
}
function showHall(rawId) {
  const id = decodeURIComponent(rawId);
  const hall = state.halls.halls.find((item) => item.id === id);
  if (!hall) return showNotFound();
  document.title = `${hall.title} · Hall · L-Space`; view.replaceChildren();
  const eyebrow = document.createElement("p"); eyebrow.className = "eyebrow"; eyebrow.textContent = hall.stable ? "Rigid hall" : "Hall";
  const title = document.createElement("h1"); title.className = "page-title"; title.textContent = hall.title;
  const rigid = document.createElement("p"); rigid.className = hall.stable ? "hall-rigid-note" : "hall-loose-note";
  rigid.textContent = hall.stable
    ? "Rigid — this hall's internal door graph is structurally fixed; the rooms hold together no matter how the corpus around them shifts."
    : "Not rigid — this hall's internal doors are not structurally fixed.";
  const tags = document.createElement("div"); tags.className = "tags";
  for (const term of hall.intent ?? []) { const span = document.createElement("span"); span.className = "tag"; span.textContent = term; tags.append(span); }
  const rooms = hall.rooms.map((entry) => state.byKey.get(entry.key)).filter(Boolean);
  view.append(eyebrow, title, rigid, tags, sectionHead(`${rooms.length.toLocaleString()} rooms`, "Members of this concept hall"), roomList(rooms));
}
async function loadReleaseGraph() {
  if (state.graph !== null) return state.graph;
  const href = state.manifest?.graph?.href ?? "/api/v1/vault/graph";
  const response = await fetch(href);
  if (!response.ok) throw new Error(`The graph release did not open (${response.status}).`);
  const graph = await response.json();
  if (graph.release !== state.manifest.release) throw new Error("The graph and vault releases do not agree.");
  state.graph = graph;
  return graph;
}
function graphDocumentPath(value) {
  if (typeof value === "string" && state.byId.has(value)) return value;
  if (value && typeof value === "object") {
    for (const key of ["path", "id", "sourcePath", "targetPath"]) {
      if (typeof value[key] === "string" && state.byId.has(value[key])) return value[key];
    }
  }
  return null;
}
function graphEdgesOf(graph) {
  const edges = [];
  for (const edge of graph.snapshot?.graph?.edges ?? []) {
    const from = graphDocumentPath(edge.sourcePath); const to = graphDocumentPath(edge.targetPath);
    if (from && to && from !== to) edges.push({ from, to, predicate: edge.predicate ?? edge.kind ?? "relation" });
  }
  for (const row of graph.ledger?.rows ?? []) {
    const from = graphDocumentPath(row.e); const to = graphDocumentPath(row.v);
    if (from && to && from !== to) edges.push({ from, to, predicate: row.a ?? "declared relation" });
  }
  const unique = new Map();
  for (const edge of edges) unique.set(`${edge.from}\u0000${edge.to}\u0000${edge.predicate}`, edge);
  return [...unique.values()];
}
function graphConstellation(focus, edges) {
  const figure = document.createElement("figure"); figure.className = "graph-constellation";
  const svg = document.createElementNS("http://www.w3.org/2000/svg", "svg"); svg.setAttribute("viewBox", "0 0 640 380"); svg.setAttribute("role", "img");
  const neighbors = [...new Set(edges.flatMap((edge) => edge.from === focus ? [edge.to] : edge.to === focus ? [edge.from] : []))].slice(0, 14);
  svg.setAttribute("aria-label", `${state.byId.get(focus)?.title ?? focus} and ${neighbors.length.toLocaleString()} directly connected knowledge cells.`);
  const center = { x: 320, y: 190 };
  const make = (name, attributes = {}) => { const element = document.createElementNS("http://www.w3.org/2000/svg", name); for (const [key, value] of Object.entries(attributes)) element.setAttribute(key, String(value)); return element; };
  const positions = new Map([[focus, center]]);
  for (const [index, path] of neighbors.entries()) {
    const angle = -Math.PI / 2 + (Math.PI * 2 * index) / neighbors.length;
    positions.set(path, { x: center.x + Math.cos(angle) * 132, y: center.y + Math.sin(angle) * 132 });
  }
  for (const path of neighbors) {
    const point = positions.get(path); svg.append(make("line", { x1: center.x, y1: center.y, x2: point.x, y2: point.y, class: "graph-edge" }));
  }
  for (const [path, point] of positions) {
    const room = state.byId.get(path); const link = make("a", { href: roomHref(room) });
    link.append(make("circle", { cx: point.x, cy: point.y, r: path === focus ? 39 : 26, class: path === focus ? "graph-node graph-focus" : "graph-node" }));
    const label = make("text", { x: point.x, y: point.y + (path === focus ? 5 : 4), class: "graph-label", "text-anchor": "middle" });
    const title = room?.title ?? path; label.textContent = title.length > 25 ? `${title.slice(0, 24)}…` : title; link.append(label); svg.append(link);
  }
  const caption = document.createElement("figcaption"); caption.className = "graph-caption"; caption.textContent = `Showing ${neighbors.length.toLocaleString()} of ${edges.filter((edge) => edge.from === focus || edge.to === focus).length.toLocaleString()} direct relations. Select a cell to enter its room.`;
  figure.append(svg, caption); return figure;
}
async function showGraph() {
  document.title = "Knowledge graph · L-Space"; view.replaceChildren(Object.assign(document.createElement("div"), { className: "loading", textContent: "Opening the released relation ledger…" }));
  let graph;
  try { graph = await loadReleaseGraph(); } catch (error) { view.replaceChildren(Object.assign(document.createElement("p"), { className: "empty", textContent: error.message })); return; }
  const edges = graphEdgesOf(graph); const degree = new Map();
  for (const edge of edges) { degree.set(edge.from, (degree.get(edge.from) ?? 0) + 1); degree.set(edge.to, (degree.get(edge.to) ?? 0) + 1); }
  const ranked = [...degree.keys()].sort((left, right) => (degree.get(right) ?? 0) - (degree.get(left) ?? 0) || (state.byId.get(left)?.title ?? left).localeCompare(state.byId.get(right)?.title ?? right));
  const eyebrow = document.createElement("p"); eyebrow.className = "eyebrow"; eyebrow.textContent = "GEODE relation ledger · VICTOR cell catalogue";
  const title = document.createElement("h1"); title.className = "page-title"; title.textContent = "Knowledge graph";
  const cells = state.manifest.victor?.cellCount ?? graph.snapshot?.documents?.length ?? state.index.rooms.length;
  const measures = document.createElement("p"); measures.className = "hero-copy"; measures.textContent = `${cells.toLocaleString()} released knowledge cells · ${(graph.counts?.relationRows ?? 0).toLocaleString()} declared relations · ${edges.length.toLocaleString()} document-to-document passages. This view reads the immutable release; it never invents an edge in the browser.`;
  const form = document.createElement("form"); form.className = "graph-search";
  const label = document.createElement("label"); label.textContent = "Find a knowledge cell";
  const input = document.createElement("input"); input.type = "search"; input.placeholder = "Type a title, path, or concept"; input.autocomplete = "off"; label.append(input); const submit = document.createElement("button"); submit.type = "submit"; submit.textContent = "Focus graph"; form.append(label, submit);
  const canvas = document.createElement("section"); canvas.className = "graph-reading";
  const showFocus = (offered) => {
    const query = offered.trim().toLocaleLowerCase();
    const exact = state.index.rooms.find((room) => room.id.toLocaleLowerCase() === query || room.title.toLocaleLowerCase() === query);
    const result = exact ?? searchRooms(offered)[0] ?? state.byId.get(ranked[0]);
    if (!result) { canvas.replaceChildren(Object.assign(document.createElement("p"), { className: "empty", textContent: "No released knowledge cell answers that description." })); return; }
    const related = edges.filter((edge) => edge.from === result.id || edge.to === result.id);
    const heading = sectionHead(result.title, `${related.length.toLocaleString()} direct relations · ${result.id}`);
    const neighbors = [...new Set(related.flatMap((edge) => edge.from === result.id ? [edge.to] : [edge.from]))].map((path) => state.byId.get(path)).filter(Boolean);
    canvas.replaceChildren(heading, graphConstellation(result.id, related), sectionHead(`${neighbors.length.toLocaleString()} connected cells`, "Direct relations in this release"), roomList(neighbors, { limit: 18 }));
  };
  form.addEventListener("submit", (event) => { event.preventDefault(); showFocus(input.value); });
  view.replaceChildren(eyebrow, title, measures, form, canvas); showFocus("");
}
function searchRooms(query, filters = {}) {
  return searchImmutableRoomIndex(state.index.rooms, { query, ...filters }).results.map(({ room, exactTitle, score, reasons, evidence }) => ({
    ...room,
    searchMatch: { exactTitle, score, reasons, evidence },
  }));
}
function showSearch(query) {
  const rooms = searchRooms(query); document.title = `${query} · Search · L-Space`; view.replaceChildren();
  const eyebrow = document.createElement("p"); eyebrow.className = "eyebrow"; eyebrow.textContent = "Search the vault";
  const title = document.createElement("h1"); title.className = "page-title"; title.textContent = query;
  view.append(eyebrow, title, sectionHead(`${rooms.length.toLocaleString()} matching rooms`, "Ranked by exact title, title text, semantic tokens, path, and summary"), roomList(rooms));
}
function showAnonymousHome() {
  document.title = "L-Space · Lenticule Science"; view.replaceChildren();
  const hero = document.createElement("section"); hero.className = "hero";
  const introduction = document.createElement("div");
  introduction.innerHTML = `<p class="eyebrow">The public front door</p><h1>L-Space</h1><p class="hero-copy">${state.surface.invitation}</p>`;
  const signIn = document.createElement("div"); signIn.className = "signin-options";
  signIn.append(discordCommandControl("Enter as a Turntide islander"), Object.assign(document.createElement("a"), { className: "signin-cta signin-secondary", href: "/oauth/login", textContent: "Enter with Google →" }));
  introduction.append(signIn);
  const legend = document.createElement("aside"); legend.className = "projection-legend";
  legend.innerHTML = `<p><b>${state.surface.vocabulary.lSpace}</b> is Lenticule Science's living knowledge garden.</p><p><b>SPACE</b> ${state.surface.vocabulary.SPACE}</p><p><b>TUFTE</b> ${state.surface.vocabulary.TUFTE}</p>`;
  hero.append(introduction, legend); view.append(hero);
  const rooms = state.publicIndex.rooms ?? [];
  if (state.surface.counts.publicRooms > 0 && rooms.length) {
    view.append(sectionHead(`${rooms.length.toLocaleString()} public rooms`, "Open to any reader, signed in or not"), roomList(rooms, { hrefFor: publicRoomHref }));
  } else {
    const note = document.createElement("section"); note.className = "aside-card gate-note";
    note.innerHTML = "<h2>Nothing public yet</h2><p>Every room in L-Space starts authenticated by design — an author opts a room into this anonymous surface on purpose, one room at a time. None has yet, so the shelves out here are still bare. Turntide Island members with the islander role can enter through Discord; operators can use the Google path.</p>";
    view.append(note);
  }
}
async function showPublicRoom(key) {
  view.innerHTML = '<div class="loading">Opening the room…</div>';
  const response = await fetch(`/api/v1/public/rooms/${key}`); if (!response.ok) return showNotFound();
  const detail = await response.json(); document.title = `${detail.room.title} · L-Space`;
  const breadcrumbs = document.createElement("div"); breadcrumbs.className = "breadcrumbs";
  for (const part of detail.room.id.split("/").slice(0, -1)) { const span = document.createElement("span"); span.textContent = words(part); breadcrumbs.append(span); }
  const header = document.createElement("header"); header.className = "room-header";
  const kind = document.createElement("p"); kind.className = "eyebrow"; kind.textContent = detail.room.kind === "unknown" ? "Knowledge room" : detail.room.kind;
  const title = document.createElement("h1"); title.textContent = detail.room.title;
  const source = document.createElement("p"); source.className = "room-source"; source.textContent = detail.room.id;
  header.append(kind, title, source);
  const content = document.createElement("div"); content.append(header, renderedArticle(detail));
  const gate = document.createElement("aside"); gate.className = "room-aside";
  const gateCard = document.createElement("section"); gateCard.className = "aside-card gate-note";
  gateCard.innerHTML = '<h2>Signed out</h2><p>Doors, VaultMaze review, and the rest of the vault open to current Turntide islanders and admitted operators.</p>';
  const signIn = document.createElement("div"); signIn.className = "signin-options";
  signIn.append(discordCommandControl(), Object.assign(document.createElement("a"), { className: "signin-cta signin-secondary", href: "/oauth/login", textContent: "Enter with Google →" }));
  gateCard.append(signIn);
  gate.append(gateCard);
  const layout = document.createElement("div"); layout.className = "room-layout"; layout.append(content, gate);
  view.replaceChildren(breadcrumbs, layout); document.querySelector("#main").focus({ preventScroll: true });
}
function resolveWikiTarget(target) {
  const clean = target.split("#")[0].split("|")[0].replace(/^\.\//, "").replace(/\.md$/i, "").trim().toLocaleLowerCase();
  return state.byName.get(clean) ?? state.byName.get(`${clean}.md`);
}
const currentRoomHref = (room) => (state.anonymous ? publicRoomHref(room) : roomHref(room));
/**
 * Where an unresolved link goes. A signed-in reader gets a search; an anonymous
 * one has no search and no index to search, and most targets will be rooms they
 * cannot see, so the honest destination is the front door.
 */
const unresolvedHref = (target) => (state.anonymous ? "#/" : `#/search/${encodeURIComponent(target)}`);
function renderedArticle(detail) {
  const article = document.createElement("article"); article.className = "prose"; article.innerHTML = detail.renderedBody;
  for (const span of article.querySelectorAll(".markdown-wikilink,.markdown-transclusion")) {
    const target = span.dataset.target; const room = resolveWikiTarget(target); const anchor = document.createElement("a");
    anchor.className = span.className; anchor.textContent = span.textContent; anchor.href = room ? currentRoomHref(room) : unresolvedHref(target); span.replaceWith(anchor);
  }
  for (const anchor of article.querySelectorAll("a[href]")) {
    const target = anchor.getAttribute("href"); if (/^(?:https?:|mailto:|#)/i.test(target)) continue;
    if (anchor.textContent.includes("|")) anchor.textContent = anchor.textContent.split("|").at(-1);
    const room = resolveWikiTarget(target); anchor.href = room ? currentRoomHref(room) : unresolvedHref(target);
  }
  return article;
}
function authoringCard(room) {
  const card = document.createElement("section"); card.className = "aside-card authoring-card";
  const heading = document.createElement("h2"); heading.textContent = "VaultMaze authoring";
  const introduction = document.createElement("p"); introduction.textContent = "Edit this admitted Markdown source with revision-safe GEODE writes.";
  const open = document.createElement("button"); open.type = "button"; open.className = "authoring-open"; open.textContent = "Edit source";
  card.append(heading, introduction, open);
  open.addEventListener("click", async () => {
    open.disabled = true; open.textContent = "Opening…";
    try {
      const response = await fetch(`/api/v1/vaultmaze/editor/note?path=${encodeURIComponent(room.id)}`);
      const result = await response.json();
      if (!response.ok) throw new Error(result.error ?? `HTTP ${response.status}`);
      const reading = result.document;
      const form = document.createElement("form"); form.className = "authoring-form";
      const label = document.createElement("label"); label.textContent = "Markdown source";
      const textarea = document.createElement("textarea"); textarea.name = "markdown"; textarea.required = true; textarea.value = reading.markdown; textarea.spellcheck = false;
      const save = document.createElement("button"); save.type = "submit"; save.textContent = "Save revision";
      const status = document.createElement("p"); status.className = "authoring-status"; status.setAttribute("role", "status");
      let revision = reading.revision;
      label.append(textarea); form.append(label, save, status); card.replaceChildren(heading, form);
      form.addEventListener("submit", async (event) => {
        event.preventDefault(); save.disabled = true; status.textContent = "Saving through VaultMaze…";
        try {
          const saved = await fetch("/api/v1/vaultmaze/editor/action", {
            method: "POST", headers: { "content-type": "application/json" },
            body: JSON.stringify({ action: "vaultmaze:replace-document/v1", path: room.id, markdown: textarea.value, revision }),
          });
          const receipt = await saved.json();
          if (saved.status === 409) throw new Error("This note changed after you opened it. Reopen before saving.");
          if (!saved.ok) throw new Error(receipt.error ?? `HTTP ${saved.status}`);
          revision = receipt.receipt.revision;
          status.textContent = receipt.receipt.changed
            ? "Source saved. The current published release remains readable while the next verified release is built."
            : "No source bytes changed.";
        } catch (error) { status.textContent = `Save refused: ${error.message}`; }
        finally { save.disabled = false; }
      });
    } catch (error) { open.disabled = false; open.textContent = "Edit source"; introduction.textContent = `Editor unavailable: ${error.message}`; }
  });
  return card;
}
function mazeStatusText(card) {
  const review = state.reviews.get(card.id);
  if (!review) return state.reviewsUnavailable ? "Review history unavailable." : "New — not yet reviewed.";
  const today = Math.floor(Date.now() / 86400000);
  const R = recallProbability(Math.max(0, today - review.reviewedAt), review.stability);
  const stage = classifyStage(R);
  return `${stage.charAt(0).toUpperCase()}${stage.slice(1)} · ${Math.round(R * 100)}% recall`;
}
async function gradeCard(card, grade, statusEl, feedbackEl, buttons) {
  const today = Math.floor(Date.now() / 86400000);
  const previous = state.reviews.get(card.id);
  const current = previous
    ? { stability: previous.stability, difficulty: previous.difficulty, lastReviewedAt: previous.reviewedAt }
    : { stability: card.stability ?? 0, difficulty: card.difficulty ?? 5 };
  const next = reviewCard(current, grade, today);
  const record = { cardId: card.id, reviewedAt: today, rating: grade, stability: next.stability, difficulty: next.difficulty };
  for (const button of buttons) button.disabled = true;
  feedbackEl.textContent = "Saving…";
  try {
    const response = await fetch("/api/v1/reviews", { method: "PUT", headers: { "content-type": "application/json" }, body: JSON.stringify(record) });
    if (!response.ok) throw new Error(`the vault refused this review (${response.status})`);
    state.reviews.set(card.id, record);
    statusEl.textContent = mazeStatusText(card);
    feedbackEl.textContent = "Saved.";
  } catch (error) {
    feedbackEl.textContent = `Not saved: ${error.message}`;
  } finally {
    for (const button of buttons) button.disabled = false;
  }
}
function mazeCard(card) {
  const item = document.createElement("li"); item.className = "maze-item";
  const front = document.createElement("p"); front.className = "maze-front"; front.textContent = card.front; item.append(front);
  const details = document.createElement("details"); details.className = "maze-details";
  const summary = document.createElement("summary"); summary.textContent = "Show answer"; details.append(summary);
  const back = document.createElement("p"); back.className = "maze-back"; back.textContent = card.back; details.append(back); item.append(details);
  const status = document.createElement("p"); status.className = "maze-status"; status.textContent = mazeStatusText(card); item.append(status);
  const grades = document.createElement("div"); grades.className = "maze-grades"; grades.setAttribute("role", "group"); grades.setAttribute("aria-label", "Grade your recall");
  const buttons = [[1, "Again"], [2, "Hard"], [3, "Good"], [4, "Easy"]].map(([grade, label]) => {
    const button = document.createElement("button"); button.type = "button"; button.className = `maze-grade maze-grade-${label.toLowerCase()}`; button.textContent = label; button.dataset.grade = String(grade);
    grades.append(button); return button;
  });
  const feedback = document.createElement("p"); feedback.className = "maze-feedback"; feedback.setAttribute("aria-live", "polite");
  for (const button of buttons) button.addEventListener("click", () => gradeCard(card, Number(button.dataset.grade), status, feedback, buttons));
  item.append(grades, feedback); return item;
}
async function showRoom(key) {
  const summary = state.byKey.get(key); if (!summary) return showNotFound();
  view.innerHTML = '<div class="loading">Opening the room…</div>';
  const response = await fetch(`/api/v1/vault/rooms/${key}`); if (!response.ok) return showNotFound(); const detail = await response.json(); document.title = `${detail.room.title} · L-Space`;
  const breadcrumbs = document.createElement("div"); breadcrumbs.className = "breadcrumbs";
  for (const part of detail.room.id.split("/").slice(0, -1)) { const span = document.createElement("span"); span.textContent = words(part); breadcrumbs.append(span); }
  const header = document.createElement("header"); header.className = "room-header";
  const kind = document.createElement("p"); kind.className = "eyebrow"; kind.textContent = detail.room.kind === "unknown" ? "Knowledge room" : detail.room.kind;
  const title = document.createElement("h1"); title.textContent = detail.room.title; const source = document.createElement("p"); source.className = "room-source"; source.textContent = detail.room.id; header.append(kind, title, source);
  const content = document.createElement("div"); content.append(header, renderedArticle(detail)); const aside = document.createElement("aside"); aside.className = "room-aside";
  const maze = document.createElement("section"); maze.className = "aside-card maze-card"; const mazeTitle = document.createElement("h2"); mazeTitle.textContent = "VaultMaze"; maze.append(mazeTitle);
  const cards = detail.cards ?? [];
  const mazeIntro = document.createElement("p");
  mazeIntro.textContent = cards.length ? `${cards.length.toLocaleString()} study ${cards.length === 1 ? "card" : "cards"}, scheduled toward ${Math.round(DEFAULT_TARGET_RETENTION * 100)}% retention.` : "No study cards inhabit this room yet.";
  maze.append(mazeIntro);
  if (cards.length) { const list = document.createElement("ol"); list.className = "maze-list"; for (const card of cards) list.append(mazeCard(card)); maze.append(list); }
  const position = document.createElement("section"); position.className = "aside-card"; const positionTitle = document.createElement("h2"); positionTitle.textContent = "Semantic position"; position.append(positionTitle); const tags = document.createElement("div"); tags.className = "tags";
  for (const tag of detail.space.semanticPosition.tags ?? []) { const span = document.createElement("span"); span.className = "tag"; span.textContent = tag; tags.append(span); } if (tags.childElementCount) position.append(tags); const coordinates = document.createElement("p"); coordinates.textContent = `TUFTE tile ${detail.tufte.x}, ${detail.tufte.y}`; position.append(coordinates); aside.append(maze, position); if (state.me?.canAuthor) aside.append(authoringCard(detail.room));
  if (detail.doors?.length) { const doors = document.createElement("section"); doors.className = "aside-card"; const heading = document.createElement("h2"); heading.textContent = "Doors from here"; const list = document.createElement("div"); list.className = "door-list"; for (const door of detail.doors.slice(0, 12)) { const destination = door.direction === "outgoing" ? door.to : door.from; const room = state.byName.get(destination.toLocaleLowerCase()); if (room) { const anchor = document.createElement("a"); anchor.href = roomHref(room); anchor.textContent = room.title; list.append(anchor); } } doors.append(heading, list); if (list.childElementCount) aside.append(doors); }
  const layout = document.createElement("div"); layout.className = "room-layout"; layout.append(content, aside); view.replaceChildren(breadcrumbs, layout); document.querySelector("#main").focus({ preventScroll: true });
}
function showNotFound() { view.innerHTML = '<p class="eyebrow">Corridor unavailable</p><h1 class="page-title">Room not found</h1><p class="hero-copy">L-Space is famously larger on the inside, but apparently not in that direction.</p>'; }
function updateNavigation() {
  scienceNav.replaceChildren(); scienceNav.removeAttribute("aria-busy");
  for (const collection of state.collections.filter((item) => item.type === "science").slice(0, 18)) { const anchor = document.createElement("a"); anchor.href = `#/collection/${encodeURIComponent(collection.id)}`; anchor.append(document.createTextNode(collection.name)); const count = document.createElement("span"); count.className = "nav-count"; count.textContent = collection.count.toLocaleString(); anchor.append(count); scienceNav.append(anchor); }
}
async function route() {
  const path = location.hash.slice(2); const [kind, ...rest] = path.split("/");
  if (state.anonymous) {
    if (!path) showAnonymousHome(); else if (kind === "public") await showPublicRoom(rest.join("/")); else showNotFound();
  } else {
    if (!state.index) return;
    if (!path) showHome();
    else if (kind === "room") await showRoom(rest[0]);
    else if (kind === "collection") showCollection(rest.join("/"));
    else if (kind === "halls") showHalls();
    else if (kind === "hall") showHall(rest.join("/"));
    else if (kind === "graph") await showGraph();
    else if (kind === "search") { const query = decodeURIComponent(rest.join("/")); search.value = query; showSearch(query); }
    else showNotFound();
  }
  view.hidden = false; scrollTo({ top: 0, behavior: "instant" });
}
let searchTimer;
search.addEventListener("input", () => { clearTimeout(searchTimer); searchTimer = setTimeout(() => { const query = search.value.trim(); location.hash = query ? `#/search/${encodeURIComponent(query)}` : "#/"; }, 180); });
document.addEventListener("keydown", (event) => { if (event.key === "/" && !state.anonymous && document.activeElement !== search) { event.preventDefault(); search.focus(); } if (event.key === "Escape" && document.activeElement === search) search.blur(); });
addEventListener("hashchange", route);
try {
  const surfaceResponse = await fetch("/api/v1/surface");
  if (!surfaceResponse.ok) throw new Error("The public surface did not open.");
  state.surface = await surfaceResponse.json();
  const meResponse = await fetch("/api/v1/me");
  if (meResponse.status === 401) {
    state.anonymous = true; document.body.classList.add("anonymous");
    const publicResponse = await fetch("/api/v1/public/index"); if (!publicResponse.ok) throw new Error("The public index did not open.");
    state.publicIndex = await publicResponse.json();
    indexCorpus(state.publicIndex);
    const identity = document.querySelector("#identity");
    const discord = document.createElement("button"); discord.type = "button"; discord.className = "identity-login"; discord.textContent = "Islander sign in";
    discord.addEventListener("click", () => { location.hash = "#/"; route().then(() => document.querySelector(".discord-command-login button")?.click()); });
    identity.replaceChildren(discord, Object.assign(document.createElement("span"), { textContent: " · ", ariaHidden: "true" }), Object.assign(document.createElement("a"), { href: "/oauth/login", textContent: "Google" }));
    loading.remove(); await route();
  } else {
    if (!meResponse.ok) throw new Error("The vault API did not open.");
    state.me = await meResponse.json();
    const responses = await Promise.all([fetch("/api/v1/vault/manifest"), fetch("/api/v1/vault/index"), fetch("/api/v1/vault/garden"), fetch("/api/v1/vault/halls")]);
    if (!responses.every((response) => response.ok)) throw new Error("The vault API did not open.");
    const [manifest, index, garden, halls] = await Promise.all(responses.map((response) => response.json()));
    state.manifest = manifest; state.index = index; state.garden = garden; state.halls = halls;
    // Review state is the one boot request that reaches a database rather than a
    // static asset. A reader who cannot reach their own history should still be
    // able to read the vault, so this degrades to an empty history instead of
    // taking the whole garden down with it.
    try {
      const reviewResponse = await fetch("/api/v1/reviews");
      if (!reviewResponse.ok) throw new Error(String(reviewResponse.status));
      const reviews = await reviewResponse.json();
      state.reviews = new Map(reviews.reviews.map((review) => [review.cardId, review]));
    } catch { state.reviews = new Map(); state.reviewsUnavailable = true; }
    document.querySelector("#identity").replaceChildren(Object.assign(document.createElement("span"), { className: "identity-email", textContent: state.me.label, title: `Signed in with ${state.me.provider}` }), Object.assign(document.createElement("a"), { className: "identity-signout", href: "/oauth/logout", textContent: "Sign out" })); indexCorpus(state.index); updateNavigation(); loading.remove(); await route();
  }
} catch (error) { loading.replaceChildren(Object.assign(document.createElement("p"), { textContent: `The vault did not open: ${error.message}` })); }
