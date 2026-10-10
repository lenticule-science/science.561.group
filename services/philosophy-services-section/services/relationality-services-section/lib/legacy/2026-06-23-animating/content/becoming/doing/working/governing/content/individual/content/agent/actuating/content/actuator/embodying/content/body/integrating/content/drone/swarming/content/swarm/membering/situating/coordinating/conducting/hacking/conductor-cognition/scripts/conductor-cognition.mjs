// conductor-cognition: the conductor's INWARD cognitive vocabulary over swarm-owned memory.
//
// These are the recall / projection / capture verbs a conductor (claude-code) uses to think with its
// own settled memory. Per docs/GENEALOGY.md the memory and its recall ARE the swarm's (the carrier
// only triggers and consumes), so the logic lives here, not in the harness. The harness wires these
// to MCP tool names + hooks; it does not re-implement them. Admitted under hacking/ because this is
// the conductor's conscious vocabulary lifted into the substrate (a coincidence of recall-as-recall),
// not a fresh derivation. Pure (no network); the outward verbs take an injected reader.
//
// recognition weighting is the legacy provenance tier (sense > remembered-sense > learning); the
// proper machinery is hacking/q-relevance (docs/GENEALOGY.md §6), kept here for the recall ranking
// until suiting is migrated onto Q.

import decoding from "#script/decoding";
import articulating from "#script/articulating";
import inferring from "#script/inferring";
import { finiteDream } from "#script/dreaming";

// ---------- inference adapters (aperiodic corner; map provider names -> swarm endpointIds) ----------
const ENDPOINT = { groq: "endpoint:groq", nvidia: "endpoint:nvidia-nim", cerebras: "endpoint:cerebras" };
const endpointOf = (provider = "groq") => ENDPOINT[provider] ?? provider;

// chat: prompt -> completion text (system folded into the claim; inferring takes one user message).
export async function chat(prompt, { provider = "groq", model, system } = {}) {
  const claim = system ? `${system}\n\n${prompt}` : String(prompt);
  const r = await inferring(["conductor:chat", claim], { endpointId: endpointOf(provider), model });
  return r.completion ?? "";
}
// reader: settle a subject as a value via an endpoint, answer as evidence. (working consumes this.)
export function reader({ provider = "groq", model } = {}) {
  return async (agent, subject) => {
    const claim =
      'You are a careful evaluator in a swarm. Answer with ONE word only: true, false, or unknown. ' +
      'true = the statement is correct; false = incorrect; unknown = insufficient basis.\n' +
      `Statement: "${subject}"\nIs it true?`;
    const r = await inferring([`${agent.id}:read`, claim], { endpointId: endpointOf(provider), model });
    const text = (r.completion ?? "").trim().toLowerCase();
    const value = text.startsWith("true") ? "true" : text.startsWith("false") ? "false" : "bottom";
    return { value, evidence: [`${agent.id}@${provider}:${text.slice(0, 40)}`] };
  };
}
// infer: context -> inference (message + actions).
export async function infer(context, { provider = "groq", model, system } = {}) {
  const message = await chat(String(context?.input ?? ""), {
    provider, model, system: system || "You are the conductor. Reply concisely."
  });
  return { message, actions: [] };
}

// ---------- recognition (trust by provenance; spotcomp/RECOGNITION.md) ----------
const TIER = { sense: 3, "remembered-sense": 2, learning: 1 };
export function provenanceOf(row) {
  const ev = (Array.isArray(row?.evidence) ? row.evidence.join(" ") : String(row?.evidence ?? "")).toLowerCase();
  if (/userpromptsubmit|transcript|posttooluse|tool:|\bstop\b|observed|uttered/.test(ev)) return "sense";
  if (/remember|recall|referenc/.test(ev)) return "remembered-sense";
  if (/dream|infer|consolidat|studied|salience/.test(ev)) return "learning";
  return "remembered-sense";
}
const ageDays = (t, now) => {
  const a = Date.parse(t), b = now ? Date.parse(now) : Date.now();
  return Number.isFinite(a) ? Math.max(0, (b - a) / 86400000) : 0;
};
export function weightOf(row, now) {
  const prov = provenanceOf(row);
  const base = TIER[prov] ?? 1;
  return prov === "learning" ? base * Math.pow(0.5, ageDays(row?.t, now) / 7) : base;
}
export function recognizing(rows, { now } = {}) {
  return (Array.isArray(rows) ? rows : [])
    .map((r) => ({ ...r, provenance: provenanceOf(r), weight: weightOf(r, now) }))
    .sort((a, b) => b.weight - a.weight);
}

// ---------- suiting (compose the context-spacesuit by restriction to a task, within a budget) ----------
const approxTokens = (s) => Math.ceil(JSON.stringify(s).length / 4);
export function suiting(available, task, opts = {}) {
  if (typeof task !== "string" || task.length === 0)
    throw new TypeError("suiting: task must be a non-empty string");
  const { identity = "claude-code", budget = 1500, constraints = [], capabilities = [], perception = [] } = opts;
  const mem = Array.isArray(available) ? available : [];
  const taskTokens = task.toLowerCase().split(/\W+/).filter((w) => w.length > 2);
  const matched = mem.filter((m) =>
    taskTokens.some((tok) => `${m.e} ${m.a} ${m.v} ${m.placement}`.toLowerCase().includes(tok)));
  const ranked = matched.map((m) => ({ m, w: weightOf(m, opts.now) })).sort((a, b) => b.w - a.w);
  const seen = new Set();
  const relevant = ranked
    .filter(({ m }) => { const k = `${m.e}|${m.a}`; if (seen.has(k)) return false; seen.add(k); return true; })
    .map(({ m }) => m);
  const suit = { identity, constraints, capabilities, perception, memory: [], mission: task, tokenEstimate: 0 };
  for (const m of relevant) {
    const trial = { ...suit, memory: [...suit.memory, m] };
    if (approxTokens(trial) > budget) break;
    suit.memory.push(m);
  }
  suit.tokenEstimate = approxTokens(suit);
  return suit;
}

// ---------- recall verbs ----------
export function remembering(query, memory, opts = {}) {
  if (typeof query !== "string" || query.length === 0)
    throw new TypeError("remembering: query must be a non-empty string");
  return suiting(memory, query, { budget: opts.budget ?? 2000, now: opts.now }).memory;
}
export function wondering(memory) {
  const qs = [];
  for (const r of (Array.isArray(memory) ? memory : [])) {
    const e = r.e ?? r.subject, a = r.a ?? r.predicate, v = r.v ?? r.value;
    if (v === "top" || v === "bottom") qs.push(`What is the truth of: ${e} ${a}?`);
  }
  return [...new Set(qs)];
}
export function imagining(memory, { limit = 5 } = {}) {
  const cells = (Array.isArray(memory) ? memory : []).map((c) => ({ e: c.e ?? c.subject, a: c.a ?? c.predicate, v: c.v ?? c.value }));
  const have = new Set(cells.map((c) => JSON.stringify([c.e, c.a, c.v])));
  const subs = [...new Set(cells.map((c) => c.e))];
  const preds = [...new Set(cells.map((c) => c.a))];
  const objs = [...new Set(cells.map((c) => c.v))];
  const out = [];
  for (const e of subs) for (const a of preds) for (const v of objs) {
    if (out.length >= limit) return out;
    const k = JSON.stringify([e, a, v]);
    if (!have.has(k)) { have.add(k); out.push({ e, a, v, evidence: ["imagining:hypothetical"], hypothetical: true }); }
  }
  return out;
}
export function ruminating(subject, memory, { maxRounds = 3 } = {}) {
  let cells = (Array.isArray(memory) ? memory : []).filter((c) => (c.e ?? c.subject) === subject);
  const derived = [];
  let rounds = 0;
  for (; rounds < maxRounds; rounds++) {
    const d = finiteDream(cells);
    if (!d.length) break;
    derived.push(...d);
    cells = cells.concat(d);
  }
  return { subject, rounds, derived };
}

// ---------- exploring (outward sensing hand; network lives in the injected reader) ----------
export async function exploring(subject, reader, { drones = ["drone-1"] } = {}) {
  if (typeof subject !== "string" || subject.length === 0)
    throw new TypeError("exploring: subject must be a non-empty string");
  const out = [];
  for (const id of drones) {
    const agent = { id, kind: "sensing" };
    const r = reader ? await reader(agent, subject) : { value: "bottom", evidence: [`${id}:no-reader`] };
    out.push({ observer: agent.id, value: r.value, evidence: r.evidence });
  }
  return out;
}

// ---------- capturing (IO -> utterance -> articulating -> claim) ----------
export function capturing(handlerClass, payload, { now } = {}) {
  // swarm decoding takes (presentation, handlerClassName) -- the reverse of the harness's old order.
  const decoded = decoding(payload, handlerClass);
  if (decoded.kind !== "utterance") return { kind: decoded.kind, reason: decoded.reason, claims: [] };
  const cell = articulating(decoded.utterance);
  const [token, claim] = decoded.utterance;
  const t = (now && now()) || new Date().toISOString();
  return { kind: "utterance", cell, claims: [{ e: token, a: "uttered", v: claim, t }] };
}

// ---------- projecting (claims/cell <-> SHP packet; spotcomp/SHP.md) ----------
const GLYPH = { true: "t", false: "f", top: "⊤", bottom: "⊥" };
const esc = (s) => String(s).replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;");
const unesc = (s) => String(s).replace(/&quot;/g, '"').replace(/&gt;/g, ">").replace(/&lt;/g, "<").replace(/&amp;/g, "&");
const classToken = (a) => String(a).trim().replace(/[^A-Za-z0-9_-]+/g, "-");
const coord = (c) => ({ e: c.e ?? c.subject, a: c.a ?? c.predicate, v: c.v ?? c.value, t: c.t, charge2: c.charge2 });
const guard = (s) => String(s).replace(/<\//g, "<\\/");
const unguard = (s) => String(s).replace(/<\\\//g, "</");

export function project(claims, opts = {}) {
  const rows = (Array.isArray(claims) ? claims : [claims]).map(coord)
    .filter((c) => c.e != null && c.a != null && c.v != null);
  const operational = !!opts.operational;
  const spans = rows.map((c) => {
    const dt = c.t ? ` data-t="${esc(c.t)}"` : "";
    const db = c.charge2 ? ` data-charge2="${esc(c.charge2)}"` : "";
    return `  <span class="${classToken(c.a)}" data-e="${esc(c.e)}" data-a="${esc(c.a)}" data-v="${esc(c.v)}"${dt}${db}>${esc(GLYPH[c.v] ?? c.v)}</span>`;
  });
  const embeds = [];
  if (operational) {
    for (const [slug, schema] of Object.entries(opts.schemas || {}))
      embeds.push(`  <script type="application/schema+json" class="schema" data-slug="${esc(slug)}">${guard(JSON.stringify(schema))}</script>`);
    for (const [slug, source] of Object.entries(opts.morphisms || {}))
      embeds.push(`  <script type="application/spotcomp-morphism+javascript" class="closure-rule" data-slug="${esc(slug)}">\n${guard(source)}\n  </script>`);
  }
  return [
    `<article class="shp-packet" data-projection="projecting" data-frontier="settled" data-regime="${operational ? "scott-continuous" : "finite"}">`,
    spans.join("\n"),
    ...(embeds.length ? ["", ...embeds] : []),
    "</article>",
    ""
  ].join("\n");
}
export function parse(html) {
  const claims = [];
  const re = /<span\b([^>]*)>/g;
  let m;
  while ((m = re.exec(html))) {
    const attrs = m[1];
    const get = (k) => { const mm = new RegExp(`data-${k}="([^"]*)"`).exec(attrs); return mm ? unesc(mm[1]) : null; };
    const e = get("e"), a = get("a"), v = get("v");
    if (e != null && a != null && v != null) {
      const c = { e, a, v };
      const t = get("t"); if (t) c.t = t;
      const b = get("charge2"); if (b) c.charge2 = b;
      claims.push(c);
    }
  }
  return claims;
}
export function extract(html) {
  const claims = parse(html);
  const schemas = {};
  const scripts = {};
  const re = /<script\b([^>]*)>([\s\S]*?)<\/script>/g;
  let m;
  while ((m = re.exec(html))) {
    const attrs = m[1];
    const body = unguard(m[2]).trim();
    const slug = (/data-slug="([^"]*)"/.exec(attrs) || [])[1];
    if (!slug) continue;
    if (/application\/schema\+json/.test(attrs)) { try { schemas[slug] = JSON.parse(body); } catch { /* skip */ } }
    else if (/application\/spotcomp-morphism\+javascript/.test(attrs)) { scripts[slug] = body; }
  }
  const regime = (/data-regime="([^"]*)"/.exec(html) || [])[1] || "finite";
  return { claims, schemas, scripts, regime };
}

export default { recognizing, weightOf, provenanceOf, suiting, remembering, wondering, imagining, ruminating, exploring, capturing, project, parse, extract };
