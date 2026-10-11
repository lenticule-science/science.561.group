"""Server-rendered web GUI shell — four-tab operator console.

Per ``specs/shell/web-gui-shell.md`` and the
``web-gui-server-rendered-html`` decision: the shell is a single HTML page
with vanilla JS for the WebSocket subscription, fetches against the existing
HTTP surface, and zero framework. The four tabs (Shell, Browse, Events,
System) cover task t02-03 in ``plans/v0.2-os-class.md``.
"""

from __future__ import annotations

from substrate.runtime import Runtime

INDEX_HTML = """<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>pypredcomp v0.2 — {node_id}</title>
<style>
:root {{
  --bg: #0c0c10;
  --fg: #d4d4d8;
  --accent: #7dd3fc;
  --accent-2: #a78bfa;
  --dim: #71717a;
  --warn: #fb923c;
  --ok: #4ade80;
  --err: #f87171;
  --panel: #14141a;
  --panel-2: #1c1c24;
  --border: #27272a;
  font-family: ui-monospace, SFMono-Regular, "Fira Code", Menlo, monospace;
}}
* {{ box-sizing: border-box; }}
body {{ margin: 0; background: var(--bg); color: var(--fg); padding: 1rem 1.5rem 2rem; line-height: 1.45; font-size: 14px; }}
header {{ display: flex; align-items: baseline; gap: 1rem; flex-wrap: wrap; margin-bottom: .5rem; }}
h1 {{ font-size: 1.3rem; margin: 0; color: var(--accent); font-weight: 500; }}
h2 {{ font-size: .95rem; margin: 1rem 0 .5rem 0; color: var(--accent); font-weight: 500; border-bottom: 1px solid var(--border); padding-bottom: .25rem; }}
h3 {{ font-size: .85rem; margin: 1rem 0 .35rem 0; color: var(--accent-2); font-weight: 500; }}
.subtitle {{ color: var(--dim); font-size: .8rem; }}
.subtitle code {{ color: var(--fg); }}
nav.tabs {{ display: flex; gap: 0; border-bottom: 1px solid var(--border); margin: 1rem 0 1rem 0; }}
nav.tabs button {{ background: transparent; border: 0; border-bottom: 2px solid transparent; color: var(--dim); padding: .5rem 1rem; font-family: inherit; font-size: .85rem; cursor: pointer; margin: 0; border-radius: 0; font-weight: 500; }}
nav.tabs button.active {{ color: var(--accent); border-bottom-color: var(--accent); }}
nav.tabs button:hover {{ color: var(--fg); }}
.tab {{ display: none; }}
.tab.active {{ display: block; }}
.grid {{ display: grid; gap: 1rem; }}
.grid.two {{ grid-template-columns: 1fr 1fr; }}
.grid.sidebar {{ grid-template-columns: 280px 1fr; }}
@media (max-width: 900px) {{ .grid.two, .grid.sidebar {{ grid-template-columns: 1fr; }} }}
.panel {{ background: var(--panel); border: 1px solid var(--border); border-radius: 6px; padding: .9rem 1rem; }}
label {{ display: block; font-size: .7rem; color: var(--dim); text-transform: uppercase; letter-spacing: .05em; margin-bottom: .25rem; margin-top: .5rem; }}
label:first-child {{ margin-top: 0; }}
input, textarea, select {{ width: 100%; background: var(--bg); color: var(--fg); border: 1px solid var(--border); border-radius: 4px; padding: .4rem .5rem; font-family: inherit; font-size: .85rem; }}
input:focus, textarea:focus {{ outline: none; border-color: var(--accent); }}
button.go {{ background: var(--accent); color: var(--bg); border: 0; padding: .45rem .9rem; border-radius: 4px; font-family: inherit; font-weight: 600; cursor: pointer; margin-top: .6rem; font-size: .85rem; }}
button.go:hover {{ background: #38bdf8; }}
button.ghost {{ background: transparent; color: var(--accent); border: 1px solid var(--border); padding: .3rem .6rem; border-radius: 4px; font-family: inherit; cursor: pointer; font-size: .75rem; margin-right: .25rem; margin-top: .25rem; }}
button.ghost:hover {{ border-color: var(--accent); }}
pre {{ background: var(--bg); border: 1px solid var(--border); padding: .6rem .75rem; border-radius: 4px; overflow-x: auto; font-size: .78rem; max-height: 360px; overflow-y: auto; margin: .5rem 0 0 0; white-space: pre-wrap; word-break: break-all; }}
.kv {{ display: grid; grid-template-columns: minmax(140px, max-content) 1fr; gap: .25rem .75rem; font-size: .82rem; }}
.kv dt {{ color: var(--dim); }}
.kv dd {{ margin: 0; word-break: break-all; }}
.state-ready {{ color: var(--ok); }}
.state-degraded {{ color: var(--warn); }}
.state-cold, .state-initializing {{ color: var(--accent); }}
.state-stopped, .state-draining {{ color: var(--err); }}
.event {{ font-size: .78rem; padding: .35rem .5rem; border-bottom: 1px solid var(--border); cursor: pointer; }}
.event:hover {{ background: var(--panel-2); }}
.event:last-child {{ border-bottom: 0; }}
.event-time {{ color: var(--dim); }}
.event-kind {{ display: inline-block; min-width: 100px; color: var(--accent-2); }}
.event-detail {{ display: none; padding: .5rem .5rem .75rem 1.5rem; background: var(--panel-2); }}
.event.expanded .event-detail {{ display: block; }}
small {{ color: var(--dim); font-size: .75rem; }}
a {{ color: var(--accent); text-decoration: none; }}
a:hover {{ text-decoration: underline; }}
.row {{ display: flex; gap: .5rem; align-items: end; flex-wrap: wrap; margin-top: .5rem; }}
.row > * {{ flex: 1; min-width: 0; }}
.row .narrow {{ flex: 0 0 100px; }}
.token-bar {{ display: flex; gap: .5rem; align-items: center; padding: .4rem .6rem; background: var(--panel-2); border: 1px solid var(--border); border-radius: 4px; margin-bottom: 1rem; }}
.token-bar input {{ flex: 1; font-size: .75rem; padding: .25rem .4rem; }}
.token-bar small {{ flex: 0 0 auto; }}
.shell-line {{ font-size: .8rem; padding: .15rem 0; }}
.shell-line.cmd {{ color: var(--accent-2); }}
.shell-line.cmd::before {{ content: "▸ "; color: var(--dim); }}
.shell-line.err {{ color: var(--err); }}
.shell-line.ok {{ color: var(--fg); }}
.cell-row {{ font-size: .78rem; padding: .25rem .5rem; border-bottom: 1px dotted var(--border); display: grid; grid-template-columns: max-content max-content 1fr max-content; gap: .5rem; align-items: baseline; }}
.cell-row:last-child {{ border-bottom: 0; }}
.cell-row code {{ color: var(--accent); }}
.value-True {{ color: var(--ok); }}
.value-False {{ color: var(--err); }}
.value-Both {{ color: var(--warn); }}
.value-None {{ color: var(--dim); }}
.stratum-asserted {{ color: var(--accent); }}
.stratum-saturated {{ color: var(--accent-2); }}
.stratum-settled {{ color: var(--ok); }}
.metric {{ display: inline-block; padding: .3rem .6rem; background: var(--panel-2); border-radius: 4px; margin-right: .5rem; margin-bottom: .5rem; font-size: .8rem; }}
.metric strong {{ color: var(--accent); margin-left: .35rem; }}
.user-row {{ font-size: .8rem; padding: .35rem .5rem; border-bottom: 1px dotted var(--border); }}
.user-row .caps {{ color: var(--dim); font-size: .72rem; margin-top: .15rem; }}
hr {{ border: 0; border-top: 1px solid var(--border); margin: 1rem 0; }}
.mud-feed {{ min-height: 50vh; max-height: 60vh; overflow-y: auto; padding: .5rem .75rem; background: var(--bg); border: 1px solid var(--border); border-radius: 4px; font-size: .85rem; }}
.mud-post {{ padding: .25rem 0; border-bottom: 1px dotted var(--border); }}
.mud-post:last-child {{ border-bottom: 0; }}
.mud-post .who {{ color: var(--accent-2); font-weight: 600; }}
.mud-post .when {{ color: var(--dim); font-size: .72rem; margin-left: .5rem; }}
.mud-post .text {{ margin-top: .15rem; white-space: pre-wrap; word-break: break-word; }}
.mud-who-row {{ font-size: .8rem; padding: .25rem .5rem; border-bottom: 1px dotted var(--border); }}
.mud-who-row .dot {{ display: inline-block; width: .5rem; height: .5rem; border-radius: 50%; background: var(--ok); margin-right: .4rem; vertical-align: middle; }}
.txn-row {{ font-size: .78rem; padding: .3rem .5rem; border-bottom: 1px dotted var(--border); display: grid; grid-template-columns: max-content max-content max-content 1fr max-content; gap: .5rem; align-items: baseline; }}
.txn-row:last-child {{ border-bottom: 0; }}
.txn-amt {{ color: var(--accent); font-variant-numeric: tabular-nums; }}
.txn-acct {{ color: var(--accent-2); }}
.txn-memo {{ color: var(--fg); }}
.bal-row {{ display: grid; grid-template-columns: 1fr max-content; gap: .5rem; padding: .3rem .5rem; border-bottom: 1px dotted var(--border); font-size: .82rem; }}
.bal-row:last-child {{ border-bottom: 0; }}
.bal-pos {{ color: var(--ok); font-variant-numeric: tabular-nums; }}
.bal-neg {{ color: var(--err); font-variant-numeric: tabular-nums; }}
.bal-zero {{ color: var(--dim); font-variant-numeric: tabular-nums; }}
</style>
</head>
<body>

<header>
  <h1>pypredcomp v0.2</h1>
  <div class="subtitle">node <code>{node_id}</code> · root <code>{root}</code> · state <span id="state" class="state-{state}">{state}</span> · ord <span id="head-ord" class="subtitle">…</span> · heartbeat <span id="hb">…</span></div>
</header>

<div class="token-bar">
  <small>captain token</small>
  <input id="token" placeholder="paste from boot logs (or click 'load test token')" autocomplete="off" spellcheck="false">
  <button class="ghost" id="token-save">save</button>
  <small id="token-status">— not set —</small>
</div>

<nav class="tabs">
  <button data-tab="shell" class="active">shell</button>
  <button data-tab="browse">browse</button>
  <button data-tab="events">events</button>
  <button data-tab="system">system</button>
  <button data-tab="mud">mud</button>
  <button data-tab="ledger">ledger</button>
</nav>

<!-- ==================== SHELL TAB ==================== -->
<section class="tab active" id="tab-shell">
  <div class="grid sidebar">
    <div class="panel">
      <h2>session</h2>
      <div id="session-info" class="subtitle">— no session —</div>
      <button class="ghost" id="session-open">open new</button>
      <button class="ghost" id="session-close">close</button>

      <h3>verbs</h3>
      <div style="font-size: .72rem; color: var(--dim); line-height: 1.6;">
        <code>assert</code> s p [v]<br>
        <code>retract</code> s p<br>
        <code>settle</code> target<br>
        <code>project</code> [s p o v]<br>
        <code>filter</code> &lt;pipe&gt;<br>
        <code>fold</code> op [by=]<br>
        <code>materialize</code> target<br>
        <code>hash</code> target<br>
        <code>witness</code> cell-id<br>
        <code>audit</code> [start-ord=]<br>
        <code>fork</code> [parent=]<br>
        <code>users</code> · <code>sessions</code> · <code>runlevel</code><br>
        <code>send-message</code> to= type= …<br>
        <code>inbox</code> [types=…]<br>
        <code>mark-read</code> id<br>
        <code>surface-messages</code><br>
        <code>help</code>
      </div>
      <h3>respond (raw)</h3>
      <small>direct POST /respond — bypasses shell parser</small>
      <button class="ghost" id="respond-toggle">show form</button>
      <div id="respond-form" style="display: none;">
        <label for="r-target">target</label>
        <input id="r-target" value="hello-world">
        <label for="r-payload">payload (JSON)</label>
        <textarea id="r-payload" rows="3">{{"greeting/positive": "True"}}</textarea>
        <button class="go" id="r-go">respond</button>
      </div>
    </div>

    <div class="panel">
      <h2>shell</h2>
      <div id="shell-log" style="min-height: 320px; max-height: 60vh; overflow-y: auto; padding: .5rem; background: var(--bg); border: 1px solid var(--border); border-radius: 4px;">
        <div class="shell-line ok">type <code>help</code> and press enter. paste a captain token above first.</div>
      </div>
      <form id="shell-form" style="margin-top: .5rem;">
        <input id="shell-input" placeholder="message-language command (e.g. 'assert hello-world greeting True')" autocomplete="off" spellcheck="false">
      </form>
    </div>
  </div>
</section>

<!-- ==================== BROWSE TAB ==================== -->
<section class="tab" id="tab-browse">
  <div class="grid two">
    <div class="panel">
      <h2>fiber browser</h2>
      <label for="b-entity">entity slug</label>
      <input id="b-entity" placeholder="hello-world" value="hello-world">
      <button class="go" id="b-load">load fiber</button>
      <div id="b-fiber" style="margin-top: .75rem;"><small>— enter an entity slug —</small></div>
    </div>
    <div class="panel">
      <h2>cell viewer</h2>
      <label for="b-cell">cell id (sha256 hex)</label>
      <input id="b-cell" placeholder="paste a cell id">
      <button class="go" id="b-cell-go">fetch /cell/{{id}}</button>
      <pre id="b-cell-view">— enter a cell id —</pre>

      <h2>rule viewer</h2>
      <label for="b-rule">rule id</label>
      <input id="b-rule" placeholder="paste a rule id">
      <button class="go" id="b-rule-go">fetch /rule/{{id}}</button>
      <pre id="b-rule-view">— enter a rule id —</pre>
    </div>
  </div>
</section>

<!-- ==================== EVENTS TAB ==================== -->
<section class="tab" id="tab-events">
  <div class="panel">
    <h2>event log</h2>
    <div class="row">
      <div>
        <label for="e-after">after_ord</label>
        <input id="e-after" type="number" value="-1">
      </div>
      <div class="narrow">
        <label for="e-limit">limit</label>
        <input id="e-limit" type="number" value="100">
      </div>
      <div>
        <label for="e-filter">kind filter (substring)</label>
        <input id="e-filter" placeholder="respond, runlevel, …">
      </div>
      <div class="narrow">
        <button class="go" id="e-load">load</button>
      </div>
    </div>
    <div id="e-summary" class="subtitle" style="margin-top: .75rem;">— click load —</div>
    <div id="e-list" style="margin-top: .5rem; max-height: 65vh; overflow-y: auto; border: 1px solid var(--border); border-radius: 4px;"></div>
  </div>

  <div class="panel" style="margin-top: 1rem;">
    <h2>live event stream <small>(WebSocket /ws · most recent first)</small></h2>
    <div id="live-events" style="max-height: 280px; overflow-y: auto; margin-top: .5rem; border: 1px solid var(--border); border-radius: 4px;"></div>
  </div>
</section>

<!-- ==================== SYSTEM TAB ==================== -->
<section class="tab" id="tab-system">
  <div class="grid two">
    <div class="panel">
      <h2>node state</h2>
      <div id="sys-state"><small>— loading —</small></div>
      <button class="ghost" id="sys-refresh">refresh</button>
    </div>
    <div class="panel">
      <h2>users</h2>
      <div id="sys-users"><small>— sign in to view —</small></div>
    </div>
  </div>

  <div class="grid two" style="margin-top: 1rem;">
    <div class="panel">
      <h2>boot phases</h2>
      <pre id="sys-boot">— loading —</pre>
    </div>
    <div class="panel">
      <h2>metrics <small>(Prometheus /metrics)</small></h2>
      <pre id="sys-metrics">— loading —</pre>
    </div>
  </div>

  <div class="panel" style="margin-top: 1rem;">
    <h2>surfaces</h2>
    <div class="kv">
      <dt>read</dt>      <dd><a href="/health/ready">/health/ready</a> · <a href="/metrics">/metrics</a> · <a href="/events">/events</a> · <a href="/node/state">/node/state</a> · <code>/cell/&lt;id&gt;</code> · <code>/rule/&lt;id&gt;</code> · <code>/event/&lt;id&gt;</code> · <code>/fiber/&lt;slug&gt;</code> · <code>/alias/&lt;name&gt;</code></dd>
      <dt>write</dt>     <dd><code>POST /respond</code> · <code>POST /shell</code> · <code>POST /session</code> · <code>POST /runlevel</code> · <code>POST /events</code></dd>
      <dt>federation</dt><dd><code>GET /federation/peers</code> · <code>POST /federation/sync</code> (single-node skeleton)</dd>
      <dt>websocket</dt> <dd><code>ws://.../ws</code></dd>
      <dt>mcp</dt>       <dd><code>python -m drivers.mcp_driver</code> (stdio) · <code>POST /mcp</code> (jsonrpc-2.0)</dd>
    </div>
  </div>
</section>

<!-- ==================== MUD TAB ==================== -->
<section class="tab" id="tab-mud">
  <div class="grid sidebar">
    <div class="panel">
      <h2>room</h2>
      <label for="mud-room">room</label>
      <input id="mud-room" value="lobby">
      <button class="ghost" id="mud-room-go">switch</button>

      <h3>who's here <small>(last hour)</small></h3>
      <div id="mud-who"><small>— sign in to view —</small></div>

      <h3>tips</h3>
      <div style="font-size: .72rem; color: var(--dim); line-height: 1.5;">
        Open this page in another browser as a different user, paste their token, and chat live. Posts append to the event log as <code>mud-post</code> events and broadcast over WebSocket.
      </div>
    </div>

    <div class="panel">
      <h2>chat — <span id="mud-room-label">lobby</span></h2>
      <div id="mud-feed" class="mud-feed"><small>— sign in and load —</small></div>
      <form id="mud-form" style="margin-top: .5rem;">
        <input id="mud-input" placeholder="say something… (enter to send)" autocomplete="off" maxlength="4096">
      </form>
    </div>
  </div>
</section>

<!-- ==================== LEDGER TAB ==================== -->
<section class="tab" id="tab-ledger">
  <div class="grid sidebar">
    <div class="panel">
      <h2>new transaction</h2>
      <label for="lg-amount">amount (e.g. 12.34)</label>
      <input id="lg-amount" type="text" inputmode="decimal" placeholder="0.00">
      <label for="lg-debit">debit account</label>
      <input id="lg-debit" placeholder="assets:cash">
      <label for="lg-credit">credit account</label>
      <input id="lg-credit" placeholder="income:work">
      <label for="lg-memo">memo</label>
      <input id="lg-memo" placeholder="optional note">
      <button class="go" id="lg-go">record</button>

      <h3>balances</h3>
      <div id="lg-balances"><small>— no transactions yet —</small></div>
      <button class="ghost" id="lg-refresh">refresh</button>
    </div>

    <div class="panel">
      <h2>transactions</h2>
      <div id="lg-txns" style="max-height: 70vh; overflow-y: auto; border: 1px solid var(--border); border-radius: 4px;"><small>— sign in and refresh —</small></div>
    </div>
  </div>
</section>

<script>
// ============ token + auth ============
const tokenInput = document.getElementById('token');
const tokenStatus = document.getElementById('token-status');
function getToken() {{ return localStorage.getItem('substrate-token') || ''; }}
function setToken(t) {{ localStorage.setItem('substrate-token', t || ''); refreshTokenStatus(); }}
function refreshTokenStatus() {{
  const t = getToken();
  if (t) {{ tokenStatus.textContent = '✓ saved (' + t.length + ' chars)'; tokenStatus.style.color = 'var(--ok)'; }}
  else   {{ tokenStatus.textContent = '— not set —'; tokenStatus.style.color = 'var(--dim)'; }}
}}
tokenInput.value = getToken();
refreshTokenStatus();
document.getElementById('token-save').onclick = () => setToken(tokenInput.value.trim());
tokenInput.addEventListener('keydown', (e) => {{ if (e.key === 'Enter') {{ setToken(tokenInput.value.trim()); e.preventDefault(); }} }});
function authHeaders() {{
  const t = getToken();
  return t ? {{ 'Authorization': 'Bearer ' + t }} : {{}};
}}
async function api(method, url, body) {{
  const opts = {{ method, headers: {{ ...authHeaders() }} }};
  if (body !== undefined) {{ opts.headers['Content-Type'] = 'application/json'; opts.body = JSON.stringify(body); }}
  let r;
  try {{ r = await fetch(url, opts); }}
  catch (err) {{ return {{ ok: false, status: 0, body: {{ code: 'NETWORK_ERROR', message: String(err) }}, raw: String(err) }}; }}
  const text = await r.text();
  let parsed = text;
  try {{ parsed = JSON.parse(text); }} catch (_) {{}}
  return {{ ok: r.ok, status: r.status, body: parsed, raw: text }};
}}

// ============ tab switching ============
document.querySelectorAll('nav.tabs button').forEach(b => {{
  b.onclick = () => {{
    document.querySelectorAll('nav.tabs button').forEach(x => x.classList.remove('active'));
    document.querySelectorAll('.tab').forEach(x => x.classList.remove('active'));
    b.classList.add('active');
    document.getElementById('tab-' + b.dataset.tab).classList.add('active');
    if (b.dataset.tab === 'system') loadSystem();
    if (b.dataset.tab === 'events') {{ if (!eventsLoadedOnce) {{ eventsLoadedOnce = true; loadEvents(); }} }}
    if (b.dataset.tab === 'mud') {{ loadMudFeed(); loadMudWho(); }}
    if (b.dataset.tab === 'ledger') {{ loadLedger(); }}
  }};
}});

// ============ shell ============
const shellLog = document.getElementById('shell-log');
const shellForm = document.getElementById('shell-form');
const shellInput = document.getElementById('shell-input');
const sessionInfo = document.getElementById('session-info');
let currentSession = localStorage.getItem('substrate-session') || null;
function setSession(s) {{ currentSession = s; if (s) localStorage.setItem('substrate-session', s); else localStorage.removeItem('substrate-session'); refreshSessionInfo(); }}
function refreshSessionInfo() {{
  if (currentSession) sessionInfo.innerHTML = 'session <code>' + escapeHtml(currentSession) + '</code>';
  else sessionInfo.textContent = '— no session (first command will open one) —';
}}
refreshSessionInfo();

function logLine(text, cls) {{
  const div = document.createElement('div');
  div.className = 'shell-line ' + (cls || 'ok');
  div.textContent = text;
  shellLog.appendChild(div);
  shellLog.scrollTop = shellLog.scrollHeight;
}}
function logBlock(obj) {{
  const pre = document.createElement('pre');
  pre.style.margin = '.25rem 0';
  pre.textContent = typeof obj === 'string' ? obj : JSON.stringify(obj, null, 2);
  shellLog.appendChild(pre);
  shellLog.scrollTop = shellLog.scrollHeight;
}}

shellForm.onsubmit = async (e) => {{
  e.preventDefault();
  const cmd = shellInput.value.trim();
  if (!cmd) return;
  if (!getToken()) {{ logLine('no token set — paste captain token in the bar above', 'err'); return; }}
  shellInput.value = '';
  logLine(cmd, 'cmd');
  const body = {{ command: cmd }};
  if (currentSession) body.session = currentSession;
  const r = await api('POST', '/shell', body);
  if (!r.ok) {{ logLine('HTTP ' + r.status, 'err'); logBlock(r.body); return; }}
  if (r.body.session && r.body.session !== currentSession) setSession(r.body.session);
  for (const result of (r.body.results || [])) {{
    if (result.ok) {{
      logBlock(result.output !== undefined && result.output !== null ? result.output : result);
    }} else {{
      logLine('error: ' + (result.error?.code || '?') + ' — ' + (result.error?.message || ''), 'err');
    }}
  }}
}};
document.getElementById('session-open').onclick = async () => {{
  const r = await api('POST', '/session', {{}});
  if (r.ok) {{ setSession(r.body.slug); logLine('opened session ' + r.body.slug, 'ok'); }}
  else {{ logLine('open failed: ' + r.status, 'err'); logBlock(r.body); }}
}};
document.getElementById('session-close').onclick = async () => {{
  if (!currentSession) {{ logLine('no session to close', 'err'); return; }}
  const r = await api('DELETE', '/session/' + encodeURIComponent(currentSession));
  if (r.ok) {{ logLine('closed ' + currentSession, 'ok'); setSession(null); }}
  else {{ logLine('close failed: ' + r.status, 'err'); logBlock(r.body); }}
}};

// raw respond
document.getElementById('respond-toggle').onclick = () => {{
  const f = document.getElementById('respond-form');
  f.style.display = f.style.display === 'none' ? 'block' : 'none';
}};
document.getElementById('r-go').onclick = async () => {{
  let payload;
  try {{ payload = JSON.parse(document.getElementById('r-payload').value); }}
  catch (err) {{ logLine('payload not valid JSON: ' + err.message, 'err'); return; }}
  const r = await api('POST', '/respond', {{ target: document.getElementById('r-target').value, payload }});
  logLine('POST /respond → ' + r.status, r.ok ? 'ok' : 'err');
  logBlock(r.body);
  if (r.ok && r.body.cell_id) document.getElementById('b-cell').value = r.body.cell_id;
}};

// ============ browse ============
function valueClass(v) {{ return 'value-' + (v || 'None'); }}
function stratumClass(s) {{ return 'stratum-' + (s || 'asserted'); }}
function renderFiber(fiber) {{
  const cells = fiber.cells || [];
  if (!cells.length) return '<small>— fiber empty —</small>';
  const counts = {{ asserted: 0, saturated: 0, settled: 0 }};
  for (const c of cells) {{ counts[c.stratum || 'asserted'] = (counts[c.stratum || 'asserted'] || 0) + 1; }}
  let html = '<div style="margin-bottom: .5rem;">';
  html += '<span class="metric">cells <strong>' + cells.length + '</strong></span>';
  for (const k of ['asserted', 'saturated', 'settled']) {{
    if (counts[k]) html += '<span class="metric ' + stratumClass(k) + '">' + k + ' <strong>' + counts[k] + '</strong></span>';
  }}
  html += '</div>';
  for (const c of cells) {{
    html += '<div class="cell-row">';
    html += '<span class="' + stratumClass(c.stratum) + '" title="' + (c.stratum || '') + '">●</span>';
    html += '<code>' + escapeHtml(c.p || '?') + '</code>';
    html += '<span>→ <code>' + escapeHtml(c.o || '·') + '</code> = <span class="' + valueClass(c.v) + '">' + (c.v || '?') + '</span></span>';
    html += '<small><a href="#" data-cell="' + escapeHtml(c.id || '') + '" class="cell-link">' + (c.id ? c.id.slice(0, 12) : '') + '…</a></small>';
    html += '</div>';
  }}
  return html;
}}
function escapeHtml(s) {{ return String(s).replace(/[&<>"']/g, c => ({{'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}})[c]); }}

document.getElementById('b-load').onclick = async () => {{
  const slug = document.getElementById('b-entity').value.trim();
  if (!slug) return;
  const target = document.getElementById('b-fiber');
  target.innerHTML = '<small>loading…</small>';
  const r = await api('GET', '/fiber/' + encodeURIComponent(slug));
  if (!r.ok) {{ target.innerHTML = '<small style="color: var(--err);">HTTP ' + r.status + ': ' + escapeHtml(r.raw) + '</small>'; return; }}
  target.innerHTML = renderFiber(r.body);
  target.querySelectorAll('.cell-link').forEach(a => {{
    a.onclick = (e) => {{ e.preventDefault(); document.getElementById('b-cell').value = a.dataset.cell; document.getElementById('b-cell-go').click(); }};
  }});
}};
document.getElementById('b-cell-go').onclick = async () => {{
  const id = document.getElementById('b-cell').value.trim();
  if (!id) return;
  const r = await api('GET', '/cell/' + encodeURIComponent(id));
  document.getElementById('b-cell-view').textContent = r.ok ? JSON.stringify(r.body, null, 2) : 'HTTP ' + r.status + ': ' + r.raw;
}};
document.getElementById('b-rule-go').onclick = async () => {{
  const id = document.getElementById('b-rule').value.trim();
  if (!id) return;
  const r = await api('GET', '/rule/' + encodeURIComponent(id));
  document.getElementById('b-rule-view').textContent = r.ok ? JSON.stringify(r.body, null, 2) : 'HTTP ' + r.status + ': ' + r.raw;
}};

// ============ events ============
let eventsLoadedOnce = false;
const eList = document.getElementById('e-list');
const eSummary = document.getElementById('e-summary');
async function loadEvents() {{
  const after = parseInt(document.getElementById('e-after').value || '-1', 10);
  const limit = parseInt(document.getElementById('e-limit').value || '100', 10);
  const filter = document.getElementById('e-filter').value.trim().toLowerCase();
  eSummary.textContent = 'loading…';
  const r = await api('GET', '/events?after_ord=' + after + '&limit=' + limit);
  if (!r.ok) {{ eSummary.textContent = 'HTTP ' + r.status; return; }}
  let evs = r.body.events || [];
  if (filter) evs = evs.filter(e => (e.kind || '').toLowerCase().includes(filter));
  eSummary.textContent = 'showing ' + evs.length + ' / head_ord=' + r.body.head_ord;
  eList.innerHTML = '';
  for (const ev of evs.slice().reverse()) {{
    const div = document.createElement('div');
    div.className = 'event';
    const when = ev.wall_clock_ns ? new Date(ev.wall_clock_ns / 1e6).toLocaleTimeString() : '?';
    div.innerHTML = '<span class="event-time">' + when + '</span> · ord=<strong>' + ev.ord + '</strong> · <span class="event-kind">' + escapeHtml(ev.kind || '?') + '</span> · <code>' + (ev.id || '').slice(0, 16) + '…</code>'
                  + '<div class="event-detail"><pre style="margin:0">' + escapeHtml(JSON.stringify(ev, null, 2)) + '</pre></div>';
    div.onclick = () => div.classList.toggle('expanded');
    eList.appendChild(div);
  }}
}}
document.getElementById('e-load').onclick = loadEvents;

// ============ system ============
async function loadSystem() {{
  const sr = await api('GET', '/node/state');
  const su = document.getElementById('sys-state');
  if (sr.ok) {{
    const s = sr.body;
    const safeState = escapeHtml(s.state || 'unknown');
    su.innerHTML = '<dl class="kv">'
      + '<dt>state</dt><dd class="state-' + safeState + '">' + safeState + '</dd>'
      + '<dt>node_id</dt><dd><code>' + escapeHtml(s.node_id || '?') + '</code></dd>'
      + '<dt>root</dt><dd><code>' + escapeHtml(s.root || '?') + '</code></dd>'
      + '<dt>log_height</dt><dd>' + escapeHtml(String(s.log_height ?? '?')) + '</dd>'
      + '<dt>log_tail_id</dt><dd><code>' + escapeHtml(String(s.log_tail_id || '?')).slice(0, 24) + '…</code></dd>'
      + '<dt>active_rules</dt><dd>' + (s.active_rule_ids || []).length + '</dd>'
      + '<dt>heartbeat</dt><dd>' + escapeHtml(String(s.heartbeat_count ?? '?')) + '</dd>'
      + '<dt>host:port</dt><dd>' + escapeHtml(String(s.host || '?')) + ':' + escapeHtml(String(s.port || '?')) + '</dd>'
      + '</dl>';
    document.getElementById('sys-boot').textContent = JSON.stringify(s.boot_phases || [], null, 2);
  }} else {{
    su.innerHTML = '<small style="color:var(--err)">HTTP ' + sr.status + '</small>';
  }}
  const m = await fetch('/metrics').then(r => r.text()).catch(_ => '— metrics unavailable —');
  document.getElementById('sys-metrics').textContent = m;
  const ur = await api('GET', '/users');
  const ud = document.getElementById('sys-users');
  if (ur.ok) {{
    const rows = ur.body.users || [];
    ud.innerHTML = rows.map(u => '<div class="user-row"><strong>' + escapeHtml(u.slug) + '</strong>'
      + (u.display_name ? ' · ' + escapeHtml(u.display_name) : '')
      + '<div class="caps">' + (u.capabilities || []).map(escapeHtml).join(' · ') + '</div></div>').join('') || '<small>— no users —</small>';
  }} else {{
    ud.innerHTML = '<small style="color:var(--err)">HTTP ' + ur.status + ' (token required)</small>';
  }}
}}
document.getElementById('sys-refresh').onclick = loadSystem;

// ============ websocket ============
const ws = new WebSocket((location.protocol === 'https:' ? 'wss://' : 'ws://') + location.host + '/ws');
const stateEl = document.getElementById('state');
const headOrdEl = document.getElementById('head-ord');
const hbEl = document.getElementById('hb');
const liveEvents = document.getElementById('live-events');
ws.onmessage = (m) => {{
  let obj;
  try {{ obj = JSON.parse(m.data); }} catch (_) {{ return; }}
  if (obj.kind === 'ping') {{ if (obj.heartbeat !== undefined) hbEl.textContent = obj.heartbeat; return; }}
  if (obj.kind === 'mud-post') {{
    if (obj.event_ord !== undefined) headOrdEl.textContent = obj.event_ord;
    if (obj.room === mudCurrentRoom) {{
      appendMudPost({{
        ord: obj.event_ord, id: obj.event_id,
        author: obj.author, display_name: obj.display_name,
        room: obj.room, text: obj.text,
        wall_clock_ns: obj.wall_clock_ns,
      }}, false);
      mudHeadOrd = Math.max(mudHeadOrd, obj.event_ord || -1);
    }}
    if (document.getElementById('tab-mud').classList.contains('active')) loadMudWho();
    return;
  }}
  if (obj.kind === 'ledger-txn') {{
    if (obj.event_ord !== undefined) headOrdEl.textContent = obj.event_ord;
    if (document.getElementById('tab-ledger').classList.contains('active')) loadLedger();
    return;
  }}
  if (obj.kind === 'hello') {{
    stateEl.textContent = obj.state;
    stateEl.className = 'state-' + obj.state;
    if (obj.head_ord !== undefined) headOrdEl.textContent = obj.head_ord;
    if (obj.heartbeat !== undefined) hbEl.textContent = obj.heartbeat;
    return;
  }}
  if (obj.event_ord !== undefined) headOrdEl.textContent = obj.event_ord;
  const div = document.createElement('div');
  div.className = 'event';
  const ts = new Date().toLocaleTimeString();
  div.innerHTML = '<span class="event-time">' + ts + '</span> · <span class="event-kind">' + escapeHtml(obj.kind || '?') + '</span> · ord=' + (obj.event_ord ?? '?') + (obj.target ? ' · target=<code>' + escapeHtml(obj.target) + '</code>' : '');
  liveEvents.prepend(div);
  while (liveEvents.children.length > 64) liveEvents.removeChild(liveEvents.lastChild);
}};
ws.onclose = () => {{ stateEl.textContent = 'disconnected'; stateEl.className = 'state-stopped'; }};

// ============ mud chat ============
const mudFeed = document.getElementById('mud-feed');
const mudWho = document.getElementById('mud-who');
const mudInput = document.getElementById('mud-input');
const mudForm = document.getElementById('mud-form');
const mudRoomInput = document.getElementById('mud-room');
const mudRoomLabel = document.getElementById('mud-room-label');
let mudHeadOrd = -1;
let mudCurrentRoom = 'lobby';
let mudPolling = false;

function fmtMudTime(ns) {{
  if (!ns) return '';
  const d = new Date(ns / 1e6);
  return d.toLocaleTimeString();
}}
function appendMudPost(p, prepend) {{
  if (mudFeed.querySelector('small')) mudFeed.innerHTML = '';
  const div = document.createElement('div');
  div.className = 'mud-post';
  div.dataset.ord = String(p.ord);
  div.innerHTML = '<span class="who">' + escapeHtml(p.display_name || p.author || '?') + '</span>'
                + '<span class="when">' + fmtMudTime(p.wall_clock_ns) + ' · ord ' + p.ord + '</span>'
                + '<div class="text">' + escapeHtml(p.text || '') + '</div>';
  const wasAtBottom = mudFeed.scrollTop + mudFeed.clientHeight >= mudFeed.scrollHeight - 30;
  if (prepend) mudFeed.prepend(div); else mudFeed.appendChild(div);
  if (!prepend && wasAtBottom) mudFeed.scrollTop = mudFeed.scrollHeight;
}}
async function loadMudFeed() {{
  if (!getToken()) {{ mudFeed.innerHTML = '<small style="color: var(--err);">paste captain token above first</small>'; return; }}
  mudCurrentRoom = (mudRoomInput.value.trim() || 'lobby');
  mudRoomLabel.textContent = mudCurrentRoom;
  const r = await api('GET', '/api/mud/feed?room=' + encodeURIComponent(mudCurrentRoom) + '&limit=200');
  if (!r.ok) {{ mudFeed.innerHTML = '<small style="color: var(--err);">HTTP ' + r.status + '</small>'; return; }}
  mudFeed.innerHTML = '';
  const posts = (r.body.posts || []);
  if (!posts.length) mudFeed.innerHTML = '<small>— no posts yet — type below to start —</small>';
  for (const p of posts) {{ appendMudPost(p, false); mudHeadOrd = Math.max(mudHeadOrd, p.ord); }}
  mudFeed.scrollTop = mudFeed.scrollHeight;
}}
async function loadMudWho() {{
  if (!getToken()) return;
  const r = await api('GET', '/api/mud/who');
  if (!r.ok) {{ mudWho.innerHTML = '<small style="color: var(--err);">HTTP ' + r.status + '</small>'; return; }}
  const users = r.body.users || [];
  if (!users.length) {{ mudWho.innerHTML = '<small>— no one in last hour —</small>'; return; }}
  mudWho.innerHTML = users.map(u => '<div class="mud-who-row"><span class="dot"></span>'
    + '<strong>' + escapeHtml(u.display_name || u.slug) + '</strong>'
    + ' <small>· ' + fmtMudTime(u.last_post_ns) + '</small></div>').join('');
}}
mudForm.onsubmit = async (e) => {{
  e.preventDefault();
  const text = mudInput.value.trim();
  if (!text) return;
  if (!getToken()) {{ mudFeed.innerHTML = '<small style="color: var(--err);">paste captain token above first</small>'; return; }}
  mudInput.value = '';
  const r = await api('POST', '/api/mud/post', {{ text, room: mudCurrentRoom }});
  if (!r.ok) {{
    const div = document.createElement('div');
    div.className = 'mud-post'; div.style.color = 'var(--err)';
    div.textContent = 'send failed: HTTP ' + r.status + ' · ' + (r.body && r.body.detail ? JSON.stringify(r.body.detail) : '');
    mudFeed.appendChild(div); mudFeed.scrollTop = mudFeed.scrollHeight;
  }}
  // post arrives via WS; no need to append here
}};
document.getElementById('mud-room-go').onclick = () => {{ mudHeadOrd = -1; loadMudFeed(); loadMudWho(); }};
// Re-poll who-list every 30s when mud tab is active
setInterval(() => {{
  if (document.getElementById('tab-mud').classList.contains('active')) loadMudWho();
}}, 30000);

// ============ ledger ============
const lgTxns = document.getElementById('lg-txns');
const lgBal = document.getElementById('lg-balances');
function fmtCents(c) {{
  const sign = c < 0 ? '-' : '';
  const abs = Math.abs(c);
  return sign + (abs / 100).toFixed(2);
}}
function balClass(c) {{ return c > 0 ? 'bal-pos' : c < 0 ? 'bal-neg' : 'bal-zero'; }}
async function loadLedger() {{
  if (!getToken()) {{ lgTxns.innerHTML = '<small style="color: var(--err); padding: .5rem;">paste captain token above first</small>'; return; }}
  const [txnsR, balR] = await Promise.all([
    api('GET', '/api/ledger/txns?limit=500'),
    api('GET', '/api/ledger/balances'),
  ]);
  if (txnsR.ok) {{
    const rows = (txnsR.body.txns || []).slice().reverse();
    if (!rows.length) lgTxns.innerHTML = '<small style="padding: .5rem; display: block;">— no transactions yet —</small>';
    else lgTxns.innerHTML = rows.map(t =>
      '<div class="txn-row" title="ord ' + t.ord + ' · ' + escapeHtml(t.id || '') + '">'
      + '<small class="when">' + fmtMudTime(t.wall_clock_ns) + '</small>'
      + '<span class="txn-amt">' + fmtCents(t.amount_cents || 0) + '</span>'
      + '<span class="txn-acct">' + escapeHtml(t.debit || '?') + ' ← ' + escapeHtml(t.credit || '?') + '</span>'
      + '<span class="txn-memo">' + escapeHtml(t.memo || '') + '</span>'
      + '<small>' + escapeHtml((t.owner || '').replace(/^user:/, '')) + '</small>'
      + '</div>').join('');
  }} else {{
    lgTxns.innerHTML = '<small style="color: var(--err); padding: .5rem;">HTTP ' + txnsR.status + '</small>';
  }}
  if (balR.ok) {{
    const rows = balR.body.accounts || [];
    if (!rows.length) lgBal.innerHTML = '<small>— no balances —</small>';
    else lgBal.innerHTML = rows.map(b =>
      '<div class="bal-row"><span class="txn-acct">' + escapeHtml(b.account) + '</span>'
      + '<span class="' + balClass(b.balance_cents) + '">' + fmtCents(b.balance_cents) + '</span></div>'
    ).join('');
  }}
}}
document.getElementById('lg-go').onclick = async () => {{
  if (!getToken()) {{ alert('paste captain token above first'); return; }}
  const amtStr = document.getElementById('lg-amount').value.trim();
  const debit = document.getElementById('lg-debit').value.trim();
  const credit = document.getElementById('lg-credit').value.trim();
  const memo = document.getElementById('lg-memo').value.trim();
  const amtFloat = parseFloat(amtStr);
  if (!amtStr || isNaN(amtFloat) || amtFloat === 0) {{ alert('amount must be a non-zero number'); return; }}
  if (!debit || !credit) {{ alert('debit and credit accounts required'); return; }}
  if (debit === credit) {{ alert('debit and credit must differ'); return; }}
  const cents = Math.round(amtFloat * 100);
  const r = await api('POST', '/api/ledger/txn', {{ amount_cents: cents, debit, credit, memo }});
  if (!r.ok) {{ alert('record failed: HTTP ' + r.status + ' · ' + JSON.stringify(r.body)); return; }}
  document.getElementById('lg-amount').value = '';
  document.getElementById('lg-memo').value = '';
  loadLedger();
}};
document.getElementById('lg-refresh').onclick = loadLedger;

// initial load: system tab fetches lazily; load node state on first paint for the header
fetch('/node/state').then(r => r.json()).then(s => {{
  if (s.log_height !== undefined) headOrdEl.textContent = s.log_height - 1;
  if (s.heartbeat_count !== undefined) hbEl.textContent = s.heartbeat_count;
}}).catch(_ => {{}});
</script>
</body>
</html>
"""


def render_index(runtime: Runtime) -> str:
    return INDEX_HTML.format(
        node_id=runtime.node_id,
        root=runtime.root,
        state=runtime.state.value,
    )
