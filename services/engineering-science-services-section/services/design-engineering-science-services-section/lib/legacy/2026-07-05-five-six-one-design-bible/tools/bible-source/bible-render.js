// 561 GROUP — BIBLE RENDERER
// Injects sections 05–15 into #rest. Long-form content lives here so the main HTML stays editable.

function __render561(){
  const G = window.GLYPHS, GN = window.GLYPH_NAMES;

  // -------- helpers --------
  const e = (tag, attrs={}, ...kids) => {
    const n = document.createElement(tag);
    for (const k in attrs){
      if (k === 'class') n.className = attrs[k];
      else if (k === 'style') n.setAttribute('style', attrs[k]);
      else if (k === 'html') n.innerHTML = attrs[k];
      else n.setAttribute(k, attrs[k]);
    }
    for (const kid of kids){
      if (kid == null) continue;
      n.appendChild(typeof kid === 'string' ? document.createTextNode(kid) : kid);
    }
    return n;
  };
  const html = (str) => { const t = document.createElement('template'); t.innerHTML = str.trim(); return t.content; };

  const root = document.getElementById('rest');

  // ================= 05 TYPOGRAPHY =================
  root.appendChild(html(`
  <section id="s05" data-screen-label="05 Typography">
  <div class="page">
    <div class="folio">FOLIO 016</div>
    <div class="section-head">
      <div class="num">§ 05<br>TYPOGRAPHY</div>
      <div class="title">Sans &amp; Slab.<br>Industrial Pair.</div>
    </div>

    <div class="grid12">
      <div style="grid-column:1/6">
        <p class="lede">A constructivist pairing. <strong>Space Grotesk</strong> for structure: marks, headlines, labels, navigation. <strong>Roboto Slab</strong> for body and declaration: where the reader needs to slow down and weigh a sentence. <strong>JetBrains Mono</strong> for evidentiary metadata: filenames, dates, page numbers, captions.</p>
      </div>
      <div style="grid-column:7/13">
        <table class="spec">
          <tr><th>Family</th><th>Role</th><th>Weights</th><th>Tracking</th></tr>
          <tr><td>Space Grotesk</td><td>Display · UI · Mark</td><td>500 · 700</td><td>−2% to 0</td></tr>
          <tr><td>Roboto Slab</td><td>Body · Lede · Declaration</td><td>400 · 700 · 900</td><td>0</td></tr>
          <tr><td>JetBrains Mono</td><td>Metadata · Caption · Code</td><td>400 · 700</td><td>+4%</td></tr>
        </table>
      </div>
    </div>

    <!-- Specimens -->
    <div class="grid3" style="margin-top:48px">
      <div class="specimen sans">
        <div class="label"><span>SPACE GROTESK / 700</span><span>DISPLAY</span></div>
        <div class="glyphs">561<br>EFA</div>
        <div class="mono" style="margin-top:18px;color:var(--ink-soft)">ABCDEFGHIJKLMNOPQRSTUVWXYZ<br>0123456789 / · — &amp;</div>
      </div>
      <div class="specimen">
        <div class="label"><span>ROBOTO SLAB / 400</span><span>BODY</span></div>
        <div class="glyphs" style="font-size:24px;line-height:1.35">Land returns. Seed returns. Story returns. We feed first and theorize second. The work is the proof.</div>
      </div>
      <div class="specimen mono">
        <div class="label"><span>JETBRAINS MONO / 500</span><span>META</span></div>
        <div class="glyphs">FOLIO 016<br>REV.A · 2026·05<br>561 / EFA</div>
      </div>
    </div>

    <!-- Type scale -->
    <div style="margin-top:64px;border:1px solid var(--ink);padding:32px;background:var(--bone)">
      <div class="h4" style="margin-bottom:20px">FIG 05.1 · TYPE SCALE — 8 STEPS</div>
      <div class="scale-row"><div class="meta">D1 · 84/86 · 700</div><div style="font-family:var(--sans);font-weight:700;font-size:84px;line-height:.95;letter-spacing:-.03em;text-transform:uppercase">No Land. No Liberation.</div></div>
      <div class="scale-row"><div class="meta">D2 · 56/58 · 700</div><div style="font-family:var(--sans);font-weight:700;font-size:56px;line-height:1;letter-spacing:-.02em;text-transform:uppercase">A Confederacy Against Hunger</div></div>
      <div class="scale-row"><div class="meta">H1 · 36/40 · 700</div><div style="font-family:var(--sans);font-weight:700;font-size:36px;letter-spacing:-.01em;text-transform:uppercase">Section Header</div></div>
      <div class="scale-row"><div class="meta">H2 · 22/28 · 700</div><div class="slab" style="font-weight:700;font-size:22px">A subhead carries the weight of a paragraph in slab.</div></div>
      <div class="scale-row"><div class="meta">B1 · 16/24 · 400</div><div class="slab" style="font-size:16px;max-width:60ch">Body copy is set in Roboto Slab. The reader is asked to slow down. Sentences are short. The work is the proof. Land returns. Seed returns. Story returns.</div></div>
      <div class="scale-row"><div class="meta">B2 · 14/22 · 400</div><div class="slab" style="font-size:14px;max-width:60ch">Secondary body copy, footnotes, marginalia.</div></div>
      <div class="scale-row"><div class="meta">M1 · 12/18 · 500</div><div class="mono" style="font-size:12px">CAPTION · METADATA · FILE 561-EFA-V01.PDF</div></div>
      <div class="scale-row" style="border-bottom:none"><div class="meta">M2 · 10/14 · 700</div><div class="mono" style="font-size:10px;letter-spacing:.18em">EYEBROW LABEL — ALL CAPS · TRACKED</div></div>
    </div>

    <!-- Type rules -->
    <div class="grid2" style="margin-top:48px">
      <div>
        <div class="h4" style="margin-bottom:14px">RULES</div>
        <ul style="list-style:none" class="body">
          <li style="padding:10px 0;border-bottom:1px dashed var(--ink)">— Headlines set in <strong>Space Grotesk 700</strong>, all-caps, tracking −2%, line-height 0.95.</li>
          <li style="padding:10px 0;border-bottom:1px dashed var(--ink)">— Body set in <strong>Roboto Slab 400</strong>, sentence-case, tracking 0, line-height 1.45.</li>
          <li style="padding:10px 0;border-bottom:1px dashed var(--ink)">— Italics signal direct address or emphasis only. Never decorative.</li>
          <li style="padding:10px 0;border-bottom:1px dashed var(--ink)">— Numerals always lining, never tabular in display, always tabular in tables.</li>
          <li style="padding:10px 0">— No drop caps. No pull quotes set as ornament. The text earns its size.</li>
        </ul>
      </div>
      <div>
        <div class="h4" style="margin-bottom:14px">FORBIDDEN</div>
        <ul style="list-style:none" class="body">
          <li style="padding:10px 0;border-bottom:1px dashed var(--ink)">✕ Inter, Roboto Sans, Helvetica, Arial — institutional defaults.</li>
          <li style="padding:10px 0;border-bottom:1px dashed var(--ink)">✕ Script faces. Handwritten faces. Brush faces.</li>
          <li style="padding:10px 0;border-bottom:1px dashed var(--ink)">✕ Letter-spacing &gt; +20% in body. Spaced-out type to fill width.</li>
          <li style="padding:10px 0;border-bottom:1px dashed var(--ink)">✕ Centered ragged-bottom paragraphs.</li>
          <li style="padding:10px 0">✕ Type set in gradient. Type set in image. Type as decoration.</li>
        </ul>
      </div>
    </div>
  </div>
  </section>
  `));

  // ================= 06 GRID =================
  root.appendChild(html(`
  <section id="s06" data-screen-label="06 Grid">
  <div class="page">
    <div class="folio">FOLIO 020</div>
    <div class="section-head">
      <div class="num">§ 06<br>GRID</div>
      <div class="title">Twelve Columns.<br>Visible Bones.</div>
    </div>

    <div class="grid12">
      <div style="grid-column:1/6">
        <p class="lede">A 12-column grid with 24 px gutters. The grid is <em>visible</em> in development and <em>structural</em> in production. Brutalism: the structure of the work is part of the work.</p>
        <div class="marginal" style="margin-top:24px">
          ORIENTATION BEFORE INTERPRETATION — every page begins with a folio, a section number, and a section title at the same coordinates. The reader knows where they stand before they know what they are reading.
        </div>
      </div>
      <div style="grid-column:7/13">
        <!-- visible grid demo -->
        <div style="border:1px solid var(--ink);padding:24px;background:var(--bone);position:relative;height:280px;overflow:hidden">
          <div style="position:absolute;inset:24px;display:grid;grid-template-columns:repeat(12,1fr);gap:24px;pointer-events:none">
            ${Array.from({length:12}).map(()=>`<div style="background:rgba(255,69,48,.12);border-left:1px solid var(--red);border-right:1px solid var(--red);height:100%"></div>`).join('')}
          </div>
          <div style="position:relative;display:grid;grid-template-columns:repeat(12,1fr);gap:24px;height:100%;align-content:start">
            <div style="grid-column:1/3;border:1px solid var(--ink);padding:8px;font-family:var(--mono);font-size:10px;background:var(--bone)">FOLIO</div>
            <div style="grid-column:3/13;border:1px solid var(--ink);padding:8px;font-family:var(--mono);font-size:10px;background:var(--bone)">SECTION TITLE — SPANS 10 COLUMNS</div>
            <div style="grid-column:1/8;border:1px solid var(--ink);padding:8px;font-family:var(--mono);font-size:10px;background:var(--bone);height:120px">PRIMARY TEXT — SPANS 7</div>
            <div style="grid-column:9/13;border:1px solid var(--ink);padding:8px;font-family:var(--mono);font-size:10px;background:var(--bone);height:120px">MARGINALIA — SPANS 4</div>
          </div>
        </div>
        <div class="mono" style="margin-top:8px;color:var(--ink-soft)">FIG 06.1 — 12-col exposed grid, 24 px gutters, with red guides shown in development only.</div>
      </div>
    </div>

    <!-- Layout patterns -->
    <div style="margin-top:64px">
      <div class="h4" style="margin-bottom:24px">FIG 06.2 · FIVE CANONICAL LAYOUTS</div>
      <div class="grid6">
        ${[
          {n:'A · DECLARATION', g:`<div style='grid-column:1/13;background:var(--ink);height:80px'></div>`},
          {n:'B · MANUAL', g:`<div style='grid-column:1/8;background:var(--bone-deep);height:80px;border:1px solid var(--ink)'></div><div style='grid-column:9/13;background:var(--bone);height:80px;border:1px solid var(--ink)'></div>`},
          {n:'C · EVIDENCE', g:`<div style='grid-column:1/5;background:var(--bone-deep);height:80px;border:1px solid var(--ink)'></div><div style='grid-column:5/9;background:var(--bone-deep);height:80px;border:1px solid var(--ink)'></div><div style='grid-column:9/13;background:var(--bone-deep);height:80px;border:1px solid var(--ink)'></div>`},
          {n:'D · INDEX', g:`<div style='grid-column:1/3;background:var(--ink);height:80px'></div><div style='grid-column:4/13;background:var(--bone-deep);height:80px;border:1px solid var(--ink)'></div>`},
          {n:'E · BANNER', g:`<div style='grid-column:1/13;background:var(--red);height:80px'></div>`},
          {n:'F · MARGIN', g:`<div style='grid-column:1/9;background:var(--bone-deep);height:80px;border:1px solid var(--ink)'></div><div style='grid-column:10/13;background:var(--bone);height:80px;border-left:3px solid var(--red);'></div>`}
        ].map(p=>`
          <figure class="evidence">
            <div style="padding:18px">
              <div style="display:grid;grid-template-columns:repeat(12,1fr);gap:6px">${p.g}</div>
            </div>
            <figcaption><span class="id">${p.n.split(' ')[0]}</span><span class="text">${p.n.split(' · ')[1]}</span><span class="meta">12-col</span></figcaption>
          </figure>
        `).join('')}
      </div>
    </div>

    <div class="grid2" style="margin-top:48px">
      <div>
        <div class="h4" style="margin-bottom:14px">SPACING SCALE</div>
        <table class="spec">
          <tr><th>Token</th><th>px</th><th>Use</th></tr>
          <tr><td>s-1</td><td>4</td><td>Hairline gap</td></tr>
          <tr><td>s-2</td><td>8</td><td>Inline label spacing</td></tr>
          <tr><td>s-3</td><td>14</td><td>Caption · meta</td></tr>
          <tr><td>s-4</td><td>24</td><td>Gutter · paragraph</td></tr>
          <tr><td>s-5</td><td>48</td><td>Block · section gap</td></tr>
          <tr><td>s-6</td><td>80</td><td>Section padding</td></tr>
          <tr><td>s-7</td><td>120</td><td>Hero · band</td></tr>
        </table>
      </div>
      <div>
        <div class="h4" style="margin-bottom:14px">RULE WEIGHTS</div>
        <div style="border:1px solid var(--ink);padding:24px;background:var(--bone)">
          <div style="height:1px;background:var(--ink);margin:8px 0"></div><div class="mono" style="color:var(--ink-soft)">1 px · hairline · table cells, dotted borders</div>
          <div style="height:3px;background:var(--ink);margin:24px 0 8px"></div><div class="mono" style="color:var(--ink-soft)">3 px · section divider</div>
          <div style="height:8px;background:var(--ink);margin:24px 0 8px"></div><div class="mono" style="color:var(--ink-soft)">8 px · masthead · banner cap</div>
          <div style="height:1px;background:var(--red);margin:24px 0 8px"></div><div class="mono" style="color:var(--ink-soft)">1 px red · marginalia, key indicator only</div>
        </div>
      </div>
    </div>
  </div>
  </section>
  `));

  // ================= 07 GLYPH SET =================
  const glyphsHtml = Object.entries(G).map(([k, svg]) =>
    `<div class="g"><div class="label">${GN[k]}</div>${svg}</div>`
  ).join('');
  root.appendChild(html(`
  <section id="s07" class="dark" data-screen-label="07 Glyphs">
  <div class="page">
    <div class="folio">FOLIO 024</div>
    <div class="section-head">
      <div class="num">§ 07<br>GLYPHS</div>
      <div class="title">Sixteen Marks.<br>One Vocabulary.</div>
    </div>

    <div class="grid12">
      <div style="grid-column:1/6">
        <p class="lede">A small, finite vocabulary of marks. Each one names a thing the confederacy thinks about often. <strong>The set is closed.</strong> If a new concept is needed, the council adds it; designers do not invent.</p>
        <div class="marginal" style="margin-top:24px;color:var(--bone-edge)">
          CONSTRUCTION — Each glyph lives on a 64×64 grid with a 4 px stroke. Strokes are square-cap. Curves are circular, not bezier. The grid is the constraint that produces the family resemblance.
        </div>
      </div>
      <div style="grid-column:7/13">
        <table class="spec" style="color:var(--bone)">
          <tr><th style="color:var(--bone);border-color:var(--bone)">Token</th><th style="color:var(--bone);border-color:var(--bone)">Reads</th><th style="color:var(--bone);border-color:var(--bone)">Use</th></tr>
          <tr><td style="border-color:var(--bone)">SEED</td><td style="border-color:var(--bone)">propagation</td><td style="border-color:var(--bone)">seed library · catalog</td></tr>
          <tr><td style="border-color:var(--bone)">SOIL</td><td style="border-color:var(--bone)">strata</td><td style="border-color:var(--bone)">soil report · land</td></tr>
          <tr><td style="border-color:var(--bone)">SOVEREIGNTY</td><td style="border-color:var(--bone)">held land</td><td style="border-color:var(--bone)">trust · charter</td></tr>
          <tr><td style="border-color:var(--bone)">REFUSAL</td><td style="border-color:var(--bone)">no, that</td><td style="border-color:var(--bone)">prohibitions</td></tr>
          <tr><td style="border-color:var(--bone)">COUNCIL</td><td style="border-color:var(--bone)">deliberation</td><td style="border-color:var(--bone)">governance</td></tr>
          <tr><td style="border-color:var(--bone)">ARCHIVE</td><td style="border-color:var(--bone)">remembered</td><td style="border-color:var(--bone)">records · zine</td></tr>
        </table>
      </div>
    </div>

    <div class="glyphs-grid" style="margin-top:48px;color:var(--bone);border-color:var(--bone)">
      ${glyphsHtml}
    </div>
    <div class="mono" style="margin-top:14px;color:var(--bone-edge)">FIG 07.1 — Complete glyph set, v.0.1. Add proposals to the council, do not extend in design.</div>
  </div>
  </section>
  `).cloneNode(true));
  // Re-color glyph SVGs in dark section
  setTimeout(()=>{
    root.querySelectorAll('#s07 .glyphs-grid .g svg').forEach(s=>{
      s.style.color = 'var(--bone)';
    });
    root.querySelectorAll('#s07 .glyphs-grid .g').forEach(g=>{
      g.style.background = '#1a1714';
      g.style.borderColor = 'var(--bone)';
    });
  },0);

  // ================= 08 VOICE =================
  root.appendChild(html(`
  <section id="s08" data-screen-label="08 Voice">
  <div class="page">
    <div class="folio">FOLIO 028</div>
    <div class="section-head">
      <div class="num">§ 08<br>VOICE</div>
      <div class="title">Plain Speech.<br>Hard Edges.</div>
    </div>

    <div class="grid12">
      <div style="grid-column:1/7">
        <p class="lede">Three voices coexist in 561 writing: <strong>insurgent</strong> (declarations), <strong>technical</strong> (manuals, captions, instructions), and <strong>forensic</strong> (records, evidence, archive). Match the voice to the artifact. Do not blend.</p>

        <div style="margin-top:48px">
          <div class="h4" style="margin-bottom:14px">PRINCIPLES</div>
          <ol style="list-style:none;counter-reset:p" class="body slab">
            <li style="counter-increment:p;padding:14px 0;border-top:1px solid var(--ink);position:relative;padding-left:48px">
              <span class="mono" style="position:absolute;left:0;top:14px;font-weight:700;color:var(--red)">P.01</span>
              Name the policy, not the weather. &ldquo;Food apartheid,&rdquo; not &ldquo;food desert.&rdquo;</li>
            <li style="counter-increment:p;padding:14px 0;border-top:1px solid var(--ink);position:relative;padding-left:48px">
              <span class="mono" style="position:absolute;left:0;top:14px;font-weight:700;color:var(--red)">P.02</span>
              Verbs over nouns. &ldquo;We feed,&rdquo; not &ldquo;we are food-providers.&rdquo;</li>
            <li style="counter-increment:p;padding:14px 0;border-top:1px solid var(--ink);position:relative;padding-left:48px">
              <span class="mono" style="position:absolute;left:0;top:14px;font-weight:700;color:var(--red)">P.03</span>
              Specific over abstract. &ldquo;Three acres in Belle Glade,&rdquo; not &ldquo;land in our region.&rdquo;</li>
            <li style="counter-increment:p;padding:14px 0;border-top:1px solid var(--ink);position:relative;padding-left:48px">
              <span class="mono" style="position:absolute;left:0;top:14px;font-weight:700;color:var(--red)">P.04</span>
              Refuse the philanthropic register. We are not &ldquo;serving communities&rdquo; — we are kin doing the work.</li>
            <li style="counter-increment:p;padding:14px 0;border-top:1px solid var(--ink);border-bottom:1px solid var(--ink);position:relative;padding-left:48px">
              <span class="mono" style="position:absolute;left:0;top:14px;font-weight:700;color:var(--red)">P.05</span>
              Short sentences. The reader is busy. The reader is also tired.</li>
          </ol>
        </div>
      </div>

      <div style="grid-column:8/13">
        <div class="h4" style="margin-bottom:14px">SAY / DON'T SAY</div>
        <div style="border:1px solid var(--ink);background:var(--bone)">
          ${[
            ['food apartheid','food desert / food insecurity'],
            ['kin','community members / beneficiaries'],
            ['the work','our impact / our mission'],
            ['the council','leadership team'],
            ['land returns','rematriation initiatives'],
            ['feeds','provides nutrition to'],
            ['confederacy','organization / nonprofit'],
            ['refuses','does not engage with']
          ].map(([s,d])=>`
            <div style="display:grid;grid-template-columns:1fr 1fr;border-bottom:1px solid var(--ink)">
              <div style="padding:14px 16px;border-right:1px solid var(--ink);background:var(--bone)">
                <div class="mono" style="color:var(--ink-soft);font-size:10px;letter-spacing:.18em">SAY</div>
                <div class="slab" style="font-weight:700;font-size:16px;margin-top:4px">${s}</div>
              </div>
              <div style="padding:14px 16px;background:var(--bone-deep)">
                <div class="mono" style="color:var(--red);font-size:10px;letter-spacing:.18em">NEVER</div>
                <div class="slab" style="font-size:16px;margin-top:4px;text-decoration:line-through;text-decoration-color:var(--red);text-decoration-thickness:2px">${d}</div>
              </div>
            </div>
          `).join('')}
        </div>
      </div>
    </div>

    <div style="margin-top:64px;border:1px solid var(--ink);padding:32px;background:var(--bone)">
      <div class="h4" style="margin-bottom:24px">FIG 08.1 · BEFORE / AFTER</div>
      <div class="grid2">
        <div>
          <div class="mono" style="color:var(--ink-soft);margin-bottom:10px">▽ BEFORE — institutional</div>
          <p class="slab" style="font-size:18px;line-height:1.4">"Our organization is committed to addressing food insecurity in underserved communities through innovative urban agriculture initiatives and stakeholder engagement."</p>
        </div>
        <div>
          <div class="mono" style="color:var(--red);margin-bottom:10px">▲ AFTER — 561</div>
          <p class="slab" style="font-size:18px;line-height:1.4;font-weight:500">"We grow on three acres. We feed two hundred families a week. The land is in trust. The seeds are ours. <em>This is what ending food apartheid looks like.</em>"</p>
        </div>
      </div>
    </div>
  </div>
  </section>
  `));

  // ================= 09 IMAGERY =================
  root.appendChild(html(`
  <section id="s09" data-screen-label="09 Imagery">
  <div class="page">
    <div class="folio">FOLIO 031</div>
    <div class="section-head">
      <div class="num">§ 09<br>IMAGERY</div>
      <div class="title">Woodcut &amp; Glyph.<br>No Stock.</div>
    </div>

    <div class="grid12">
      <div style="grid-column:1/6">
        <p class="lede">Two image registers. <strong>Woodcut figuration</strong> for the human (high-contrast, two-tone, hand-cut). <strong>Glyphic abstraction</strong> for the systemic (the marks of §07). Photography is permitted only as <em>evidence</em> — captioned, dated, sourced, halftoned.</p>
        <div class="marginal" style="margin-top:24px">
          NEVER — stock photography of smiling vegetables, hands-in-soil clichés, or aerial farm shots. The visual culture of philanthropy is the visual culture of food apartheid's apologists.
        </div>
      </div>
      <div style="grid-column:7/13">
        <!-- Woodcut placeholder — high-contrast SVG -->
        <figure class="evidence">
          <div style="aspect-ratio:4/3;background:var(--bone);position:relative;overflow:hidden">
            <svg viewBox="0 0 400 300" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
              <!-- horizon -->
              <rect x="0" y="0" width="400" height="180" fill="#F2EAD8"/>
              <rect x="0" y="180" width="400" height="120" fill="#0A0A0A"/>
              <!-- woodcut sun rays -->
              <g stroke="#0A0A0A" stroke-width="3" fill="none">
                <line x1="200" y1="80" x2="200" y2="20"/>
                <line x1="160" y1="90" x2="130" y2="40"/>
                <line x1="240" y1="90" x2="270" y2="40"/>
                <line x1="130" y1="120" x2="80" y2="100"/>
                <line x1="270" y1="120" x2="320" y2="100"/>
              </g>
              <circle cx="200" cy="120" r="40" fill="#FF4530"/>
              <circle cx="200" cy="120" r="40" fill="none" stroke="#0A0A0A" stroke-width="3"/>
              <!-- crop rows in negative -->
              <g stroke="#F2EAD8" stroke-width="2" fill="none">
                <path d="M0 200 Q 100 195 200 200 T 400 200"/>
                <path d="M0 220 Q 100 215 200 220 T 400 220"/>
                <path d="M0 240 Q 100 235 200 240 T 400 240"/>
                <path d="M0 260 Q 100 255 200 260 T 400 260"/>
                <path d="M0 280 Q 100 275 200 280 T 400 280"/>
              </g>
              <!-- standing figures (silhouettes) -->
              <g fill="#F2EAD8">
                <path d="M120 180 L120 220 L115 240 L120 260 L130 260 L135 240 L130 220 L130 180 Q125 170 120 180 Z"/>
                <circle cx="125" cy="172" r="8"/>
                <path d="M260 180 L260 220 L255 240 L260 260 L270 260 L275 240 L270 220 L270 180 Q265 170 260 180 Z"/>
                <circle cx="265" cy="172" r="8"/>
                <path d="M310 185 L310 225 L305 245 L310 265 L320 265 L325 245 L320 225 L320 185 Q315 175 310 185 Z"/>
                <circle cx="315" cy="177" r="7"/>
              </g>
            </svg>
          </div>
          <figcaption>
            <span class="id">FIG 09.1</span>
            <span class="text">PLACEHOLDER — Woodcut treatment, two-tone (ink on bone with one accent). Real artwork commissioned from member-artists; no AI-generated imagery, no stock.</span>
            <span class="meta">PLACEHOLDER</span>
          </figcaption>
        </figure>
      </div>
    </div>

    <!-- Photo treatment -->
    <div style="margin-top:64px">
      <div class="h4" style="margin-bottom:24px">FIG 09.2 · EVIDENTIARY PHOTO TREATMENT</div>
      <div class="grid3">
        <figure class="evidence">
          <div style="aspect-ratio:1/1;background:linear-gradient(45deg,#0A0A0A 25%,#5A3A22 25%,#5A3A22 50%,#0A0A0A 50%,#0A0A0A 75%,#5A3A22 75%);background-size:6px 6px"></div>
          <figcaption><span class="id">A</span><span class="text">DUOTONE — ink + soil. Halftoned at 65 lpi. No color correction.</span><span class="meta">PROCESS</span></figcaption>
        </figure>
        <figure class="evidence">
          <div style="aspect-ratio:1/1;background:repeating-linear-gradient(0deg,#0A0A0A 0,#0A0A0A 2px,#F2EAD8 2px,#F2EAD8 4px)"></div>
          <figcaption><span class="id">B</span><span class="text">LINE-SCREEN — high contrast, broadcast paper. For newsprint reproduction.</span><span class="meta">PROCESS</span></figcaption>
        </figure>
        <figure class="evidence">
          <div style="aspect-ratio:1/1;background:radial-gradient(circle,#0A0A0A 1px,#F2EAD8 1.5px);background-size:5px 5px"></div>
          <figcaption><span class="id">C</span><span class="text">DOT-SCREEN — for poster reproduction at scale.</span><span class="meta">PROCESS</span></figcaption>
        </figure>
      </div>
    </div>

    <!-- Caption convention -->
    <div style="margin-top:48px;border:1px solid var(--ink);padding:24px;background:var(--bone)">
      <div class="h4" style="margin-bottom:14px">CAPTION CONVENTION</div>
      <div class="mono" style="font-size:13px;line-height:1.7">
        <strong>FIG ##.#</strong> — [WHAT IS DEPICTED]. [WHO MADE / TOOK IT]. [WHERE]. [WHEN]. [SOURCE / RIGHTS].<br>
        <span style="color:var(--ink-soft)">EXAMPLE — </span>FIG 12.4 — Field kitchen at the Belle Glade harvest. Photo by R. Carter, member. Belle Glade, FL. 2026·03·14. 561 archive, redistribution by consent.
      </div>
    </div>
  </div>
  </section>
  `));

  // ================= 10 POSTERS =================
  root.appendChild(html(`
  <section id="s10" class="dark" data-screen-label="10 Posters">
  <div class="page">
    <div class="folio">FOLIO 034</div>
    <div class="section-head">
      <div class="num">§ 10<br>POSTERS</div>
      <div class="title">Six Templates.<br>One Voice.</div>
    </div>

    <div class="grid3">
      <!-- Poster A -->
      <div>
        <div class="poster" style="background:var(--bone);color:var(--ink)">
          <div class="p-label">A · DECLARATION</div>
          <div style="position:absolute;inset:24px;display:flex;flex-direction:column;justify-content:space-between">
            <div class="mono" style="font-size:9px;letter-spacing:.18em">561 / EFA · BULLETIN №01</div>
            <div>
              <div style="font-family:var(--sans);font-weight:700;font-size:54px;line-height:.85;letter-spacing:-.04em;text-transform:uppercase">No Land.<br>No <span style="color:var(--red)">Liberation</span>.</div>
              <div style="height:6px;background:var(--ink);margin:14px 0 10px"></div>
              <div style="font-family:var(--slab);font-size:12px;line-height:1.4">A confederacy organized to feed itself, govern itself, and remember itself.</div>
            </div>
            <div class="mono" style="font-size:9px;letter-spacing:.18em;display:flex;justify-content:space-between"><span>EST. 2026</span><span>BELLE GLADE · FL</span></div>
          </div>
        </div>
        <div class="mono" style="margin-top:8px;font-size:11px">A · DECLARATION POSTER</div>
      </div>

      <!-- Poster B -->
      <div>
        <div class="poster red">
          <div class="p-label">B · ALARM</div>
          <div style="position:absolute;inset:24px;display:flex;flex-direction:column;justify-content:space-between;color:var(--ink)">
            <svg viewBox="0 0 64 64" width="60" height="60" stroke="currentColor" stroke-width="4" fill="none">
              <circle cx="32" cy="32" r="24"/><path d="M14 14 L50 50"/>
            </svg>
            <div>
              <div style="font-family:var(--sans);font-weight:700;font-size:80px;line-height:.85;letter-spacing:-.04em">END<br>FOOD<br>APART-<br>HEID.</div>
            </div>
            <div class="mono" style="font-size:9px;letter-spacing:.18em">561 · CONFEDERACY · 2026</div>
          </div>
        </div>
        <div class="mono" style="margin-top:8px;font-size:11px;color:var(--bone)">B · ALARM POSTER</div>
      </div>

      <!-- Poster C -->
      <div>
        <div class="poster" style="background:var(--ink);color:var(--bone)">
          <div class="p-label" style="color:var(--bone)">C · ASSEMBLY</div>
          <div style="position:absolute;inset:24px;display:flex;flex-direction:column;justify-content:space-between">
            <div class="mono" style="font-size:9px;letter-spacing:.18em;color:var(--bone-edge)">CALL TO ASSEMBLY · №07</div>
            <div>
              <div style="font-family:var(--mono);font-size:11px;color:var(--red);letter-spacing:.18em;margin-bottom:14px">★ MAY 17 · DUSK ★</div>
              <div style="font-family:var(--sans);font-weight:700;font-size:42px;line-height:.95;letter-spacing:-.02em;text-transform:uppercase">Council<br>Of The<br>Belle Glade<br>Corridor.</div>
              <div style="height:1px;background:var(--bone);margin:18px 0 12px"></div>
              <div class="slab" style="font-size:12px;line-height:1.4">Open to members &amp; kin. Bring food, bring children, bring questions. Refusals will be honored.</div>
            </div>
            <div class="mono" style="font-size:9px;letter-spacing:.18em;color:var(--bone-edge)">561 · EFA</div>
          </div>
        </div>
        <div class="mono" style="margin-top:8px;font-size:11px;color:var(--bone)">C · ASSEMBLY POSTER</div>
      </div>

      <!-- Poster D -->
      <div>
        <div class="poster" style="background:var(--bone);color:var(--ink)">
          <div class="p-label">D · NUMERAL</div>
          <div style="position:absolute;inset:0;display:flex;align-items:center;justify-content:center">
            <div style="font-family:var(--sans);font-weight:700;font-size:280px;line-height:.85;letter-spacing:-.06em;color:var(--ink);position:relative">
              <span style="position:absolute;top:6px;left:6px;color:#FF4530;mix-blend-mode:multiply;opacity:.85">561</span>
              <span style="position:relative">561</span>
            </div>
          </div>
          <div style="position:absolute;bottom:24px;left:24px;right:24px;display:flex;justify-content:space-between;align-items:end">
            <div>
              <div class="mono" style="font-size:10px;letter-spacing:.18em">END FOOD APARTHEID</div>
              <div class="slab" style="font-size:14px;font-weight:700;margin-top:4px">A confederacy.</div>
            </div>
            <div class="mono" style="font-size:9px">v.0.1</div>
          </div>
        </div>
        <div class="mono" style="margin-top:8px;font-size:11px;color:var(--bone)">D · NUMERAL POSTER</div>
      </div>

      <!-- Poster E -->
      <div>
        <div class="poster" style="background:var(--bone);color:var(--ink)">
          <div class="p-label">E · MANUAL</div>
          <div style="position:absolute;inset:24px;display:flex;flex-direction:column;gap:14px">
            <div class="mono" style="font-size:9px;letter-spacing:.18em;border-bottom:1px solid var(--ink);padding-bottom:8px">FIELD INSTRUCTION №14</div>
            <div style="font-family:var(--sans);font-weight:700;font-size:28px;line-height:.95;letter-spacing:-.02em;text-transform:uppercase">How To Hold A Seed Library.</div>
            <ol style="list-style:none;counter-reset:s;font-family:var(--slab);font-size:13px;line-height:1.45;flex:1">
              <li style="counter-increment:s;padding:8px 0;border-bottom:1px dashed var(--ink);position:relative;padding-left:28px"><span class="mono" style="position:absolute;left:0;color:var(--red);font-weight:700">01</span>Save.</li>
              <li style="counter-increment:s;padding:8px 0;border-bottom:1px dashed var(--ink);position:relative;padding-left:28px"><span class="mono" style="position:absolute;left:0;color:var(--red);font-weight:700">02</span>Label.</li>
              <li style="counter-increment:s;padding:8px 0;border-bottom:1px dashed var(--ink);position:relative;padding-left:28px"><span class="mono" style="position:absolute;left:0;color:var(--red);font-weight:700">03</span>Catalog by hand.</li>
              <li style="counter-increment:s;padding:8px 0;border-bottom:1px dashed var(--ink);position:relative;padding-left:28px"><span class="mono" style="position:absolute;left:0;color:var(--red);font-weight:700">04</span>Lend by consent.</li>
              <li style="counter-increment:s;padding:8px 0;position:relative;padding-left:28px"><span class="mono" style="position:absolute;left:0;color:var(--red);font-weight:700">05</span>Receive by ratio.</li>
            </ol>
            <div class="mono" style="font-size:9px;letter-spacing:.18em">561 · EFA · MANUAL SERIES</div>
          </div>
        </div>
        <div class="mono" style="margin-top:8px;font-size:11px;color:var(--bone)">E · MANUAL POSTER</div>
      </div>

      <!-- Poster F -->
      <div>
        <div class="poster" style="background:var(--bone);color:var(--ink)">
          <div class="p-label">F · EVIDENCE</div>
          <div style="position:absolute;inset:24px;display:flex;flex-direction:column;gap:14px">
            <div style="display:flex;justify-content:space-between" class="mono"><span style="font-size:9px;letter-spacing:.18em">EVIDENCE №03</span><span style="font-size:9px;letter-spacing:.18em">2026·04·22</span></div>
            <div style="font-family:var(--sans);font-weight:700;font-size:24px;line-height:.95;letter-spacing:-.02em;text-transform:uppercase">Three acres.<br>Two hundred families.<br>One season.</div>
            <div style="flex:1;border:1px solid var(--ink);padding:14px;display:flex;flex-direction:column;gap:6px;font-family:var(--mono);font-size:11px">
              <div style="display:flex;justify-content:space-between"><span>ACRES</span><span style="font-weight:700">3.0</span></div>
              <div style="display:flex;align-items:center"><span style="background:var(--ink);height:8px;width:30%"></span></div>
              <div style="display:flex;justify-content:space-between"><span>FAMILIES FED / WK</span><span style="font-weight:700">214</span></div>
              <div style="display:flex;align-items:center"><span style="background:var(--ink);height:8px;width:85%"></span></div>
              <div style="display:flex;justify-content:space-between"><span>YIELD · LB</span><span style="font-weight:700">8,420</span></div>
              <div style="display:flex;align-items:center"><span style="background:var(--red);height:8px;width:62%"></span></div>
              <div style="display:flex;justify-content:space-between"><span>VARIETIES</span><span style="font-weight:700">37</span></div>
              <div style="display:flex;align-items:center"><span style="background:var(--blue);height:8px;width:45%"></span></div>
            </div>
            <div class="mono" style="font-size:9px;letter-spacing:.18em">561 / EFA · OPEN ARCHIVE</div>
          </div>
        </div>
        <div class="mono" style="margin-top:8px;font-size:11px;color:var(--bone)">F · EVIDENCE POSTER</div>
      </div>
    </div>

    <div class="mono" style="margin-top:24px;color:var(--bone-edge)">FIG 10.1 — Six poster types, all 18×24 in. Print at 100% on uncoated bone or newsprint. Two spot inks max.</div>
  </div>
  </section>
  `));

  // ================= 11 WEB =================
  root.appendChild(html(`
  <section id="s11" data-screen-label="11 Web">
  <div class="page">
    <div class="folio">FOLIO 037</div>
    <div class="section-head">
      <div class="num">§ 11<br>WEB</div>
      <div class="title">Static. Legible.<br>Off-Grid Capable.</div>
    </div>

    <div class="grid12">
      <div style="grid-column:1/6">
        <p class="lede">Web pages are documents, not applications. <strong>Static HTML, system fonts as fallback, no third-party trackers, no analytics.</strong> The site loads on a feature phone over 2G. The site is mirrorable to USB sticks. The site reads aloud cleanly.</p>
        <div class="marginal" style="margin-top:24px">
          REQUIREMENT — Every page works without JavaScript. JavaScript adds polish; it does not gate function. The bible itself follows this rule.
        </div>
      </div>
      <div style="grid-column:7/13">
        <table class="spec">
          <tr><th>Constraint</th><th>Target</th></tr>
          <tr><td>Page weight, total</td><td>≤ 200 KB</td></tr>
          <tr><td>First paint</td><td>≤ 1.0 s on 3G</td></tr>
          <tr><td>JS required for content</td><td>Never</td></tr>
          <tr><td>Trackers · pixels · ads</td><td>Forbidden</td></tr>
          <tr><td>WCAG contrast</td><td>AAA on body, AA on display</td></tr>
          <tr><td>Hosted by</td><td>Members-controlled servers; mirror on Tor</td></tr>
        </table>
      </div>
    </div>

    <!-- Web template mock -->
    <div class="template" style="margin-top:48px;aspect-ratio:16/9;max-height:600px">
      <div class="tpl-label">DESKTOP / 1440</div>
      <div style="display:flex;flex-direction:column;height:100%">
        <!-- chrome -->
        <div style="background:var(--ink);color:var(--bone);padding:14px 24px;display:flex;justify-content:space-between;align-items:center;border-bottom:8px solid var(--red)">
          <div style="display:flex;align-items:center;gap:14px">
            <svg viewBox="0 0 60 60" width="36" height="36"><circle cx="30" cy="30" r="28" fill="none" stroke="#F2EAD8" stroke-width="2"/><text x="30" y="38" font-family="Space Grotesk" font-weight="700" font-size="22" letter-spacing="-1" text-anchor="middle" fill="#F2EAD8">561</text></svg>
            <div style="font-family:var(--mono);font-size:11px;letter-spacing:.18em">561 / EFA</div>
          </div>
          <div style="display:flex;gap:24px;font-family:var(--mono);font-size:11px;letter-spacing:.18em">
            <span>WORK</span><span>RECORDS</span><span>SEED</span><span>JOIN</span>
          </div>
        </div>
        <!-- hero -->
        <div style="flex:1;background:var(--bone);padding:36px 32px;display:grid;grid-template-columns:repeat(12,1fr);gap:14px">
          <div style="grid-column:1/2;font-family:var(--mono);font-size:9px;letter-spacing:.18em;border-top:4px solid var(--ink);padding-top:6px">§ 00</div>
          <div style="grid-column:2/9">
            <div style="font-family:var(--sans);font-weight:700;font-size:48px;line-height:.9;letter-spacing:-.03em;text-transform:uppercase">A confederacy<br>against <span style="color:var(--red)">hunger</span>.</div>
            <div style="font-family:var(--slab);font-size:13px;margin-top:14px;line-height:1.45;max-width:50ch">We organize land, seed, water, labor, and memory toward the end of food apartheid.</div>
          </div>
          <div style="grid-column:10/13;border-left:1px solid var(--ink);padding-left:14px">
            <div style="font-family:var(--mono);font-size:9px;letter-spacing:.18em;color:var(--ink-soft)">CURRENT WORK</div>
            <div style="font-family:var(--mono);font-size:11px;margin-top:8px;line-height:1.6">
              <div>► 3.0 ac · Belle Glade</div>
              <div>► 214 fam · weekly</div>
              <div>► 37 varieties</div>
              <div>► v.0.1 bible</div>
            </div>
          </div>
        </div>
        <!-- footer -->
        <div style="background:var(--ink);color:var(--bone-edge);padding:12px 24px;font-family:var(--mono);font-size:10px;letter-spacing:.18em;display:flex;justify-content:space-between">
          <span>NO TRACKERS · NO ADS · STATIC</span><span>EST. 2026</span>
        </div>
      </div>
    </div>

    <!-- Mobile + dark variants -->
    <div class="grid3" style="margin-top:32px">
      <div class="template" style="aspect-ratio:9/16;max-height:480px;margin:0 auto">
        <div class="tpl-label">MOBILE / 375</div>
        <div style="height:100%;background:var(--bone);padding:18px;display:flex;flex-direction:column;gap:14px">
          <div style="display:flex;justify-content:space-between;align-items:center;border-bottom:3px solid var(--ink);padding-bottom:8px">
            <div class="mono" style="font-size:10px;letter-spacing:.18em">561 / EFA</div>
            <div class="mono" style="font-size:10px">≡</div>
          </div>
          <div style="font-family:var(--sans);font-weight:700;font-size:32px;line-height:.9;letter-spacing:-.03em;text-transform:uppercase">A confederacy against <span style="color:var(--red)">hunger</span>.</div>
          <div class="slab" style="font-size:13px;line-height:1.45">We organize land, seed, water, labor, and memory toward the end of food apartheid.</div>
          <div style="height:1px;background:var(--ink)"></div>
          <div class="mono" style="font-size:11px;line-height:1.6">► 3.0 ac · Belle Glade<br>► 214 families · weekly<br>► 37 varieties</div>
        </div>
      </div>
      <div class="template" style="aspect-ratio:9/16;max-height:480px;margin:0 auto;background:var(--ink);color:var(--bone)">
        <div class="tpl-label" style="background:var(--bone);color:var(--ink)">MOBILE · DARK</div>
        <div style="height:100%;padding:18px;display:flex;flex-direction:column;gap:14px">
          <div style="display:flex;justify-content:space-between;align-items:center;border-bottom:3px solid var(--bone);padding-bottom:8px">
            <div class="mono" style="font-size:10px;letter-spacing:.18em">561 / EFA</div>
            <div class="mono" style="font-size:10px">≡</div>
          </div>
          <div style="font-family:var(--sans);font-weight:700;font-size:32px;line-height:.9;letter-spacing:-.03em;text-transform:uppercase">Records<br>&amp; <span style="color:var(--red)">Evidence</span>.</div>
          <div class="slab" style="font-size:13px;line-height:1.45;color:var(--bone-edge)">Open archive of the work. By season, by site, by witness.</div>
          <div style="height:1px;background:var(--bone)"></div>
          <div class="mono" style="font-size:11px;line-height:1.6;color:var(--bone-edge)">2026·Q1 · 12 docs<br>2026·Q2 · 8 docs<br>2025·Q4 · 21 docs</div>
        </div>
      </div>
      <div class="template" style="aspect-ratio:9/16;max-height:480px;margin:0 auto">
        <div class="tpl-label">MOBILE · ARTICLE</div>
        <div style="height:100%;background:var(--bone);padding:18px;display:flex;flex-direction:column;gap:10px;overflow:hidden">
          <div class="mono" style="font-size:9px;letter-spacing:.18em;color:var(--ink-soft)">§ 03 · BULLETIN №14 · 2026·04·22</div>
          <div style="font-family:var(--sans);font-weight:700;font-size:22px;line-height:1;letter-spacing:-.02em;text-transform:uppercase">Three acres,<br>two hundred families.</div>
          <div class="slab" style="font-size:12px;line-height:1.5">In the third week of harvest, the council convened to count what we had grown. The numbers are below — the meaning is in the families fed.</div>
          <div style="border-left:3px solid var(--red);padding:8px 0 8px 12px;font-family:var(--mono);font-size:10px;line-height:1.5">FIELD NOTE — The yield exceeded last year's by 38%.</div>
          <div class="slab" style="font-size:12px;line-height:1.5;color:var(--ink-soft)">— R. Carter, member-organizer</div>
        </div>
      </div>
    </div>

    <div class="mono" style="margin-top:24px;color:var(--ink-soft)">FIG 11.1 — Web templates: home, archive (dark), article. All renderable as static HTML.</div>
  </div>
  </section>
  `));

  // ================= 12 PRINT ARTIFACTS =================
  root.appendChild(html(`
  <section id="s12" data-screen-label="12 Print">
  <div class="page">
    <div class="folio">FOLIO 040</div>
    <div class="section-head">
      <div class="num">§ 12<br>PRINT</div>
      <div class="title">Zine · Newspaper ·<br>Pamphlet.</div>
    </div>

    <p class="lede" style="max-width:80ch">Print is the work that survives without electricity. Three formats — the <strong>zine</strong> (memory), the <strong>newspaper</strong> (announcement), and the <strong>pamphlet</strong> (instruction) — each with a fixed grid, a fixed paper, and a fixed ink discipline.</p>

    <!-- Newspaper -->
    <div style="margin-top:48px">
      <div class="h4" style="margin-bottom:14px">FIG 12.1 · NEWSPAPER — TABLOID, 4 PP, NEWSPRINT</div>
      <div class="template" style="aspect-ratio:11/14;max-height:720px">
        <div style="height:100%;background:var(--bone);padding:32px;display:flex;flex-direction:column;gap:16px">
          <div style="border-top:8px solid var(--ink);border-bottom:1px solid var(--ink);padding:14px 0;display:grid;grid-template-columns:1fr auto 1fr;align-items:center;gap:24px">
            <div class="mono" style="font-size:11px;letter-spacing:.18em">VOL.01 · №07 · 2026·05·01</div>
            <div style="text-align:center">
              <div style="font-family:var(--sans);font-weight:700;font-size:48px;line-height:.85;letter-spacing:-.04em">561 BULLETIN</div>
              <div style="font-family:var(--slab);font-style:italic;font-size:13px;margin-top:4px">— a paper for the confederacy —</div>
            </div>
            <div class="mono" style="font-size:11px;letter-spacing:.18em;text-align:right">FREE · NOT FOR RESALE</div>
          </div>
          <div style="display:grid;grid-template-columns:repeat(4,1fr);gap:14px;flex:1;font-family:var(--slab);font-size:11px;line-height:1.45">
            <div style="grid-column:1/3;display:flex;flex-direction:column;gap:8px">
              <div style="font-family:var(--sans);font-weight:700;font-size:28px;line-height:.95;letter-spacing:-.02em;text-transform:uppercase">Belle Glade harvest closes 38% above last season.</div>
              <div style="height:120px;background:repeating-linear-gradient(0deg,#0A0A0A 0,#0A0A0A 1px,#F2EAD8 1px,#F2EAD8 3px);border:1px solid var(--ink)"></div>
              <div class="mono" style="font-size:9px;letter-spacing:.04em;color:var(--ink-soft)">FIG — Field, 2026·04·22. Photo: R. Carter.</div>
              <p>The third growing season at the Belle Glade corridor closed Friday with a counted yield of 8,420 pounds across 37 varieties. The council convened at dusk to tally the results and to redistribute by ratio…</p>
              <p>The work was held by 41 members over 14 weeks. Two of those weeks were lost to flood. None were lost to fatigue.</p>
            </div>
            <div>
              <div class="h4" style="margin-bottom:8px;font-size:10px">COUNCIL NOTES</div>
              <p style="font-size:10px">The May council ratified the third land trust and accepted seed from the Pee Dee growers. Vote was unanimous, with two abstentions on procedural grounds.</p>
              <div style="height:1px;background:var(--ink);margin:10px 0"></div>
              <div class="h4" style="margin-bottom:8px;font-size:10px">CALL TO KIN</div>
              <p style="font-size:10px">Field kitchen seeks two cooks for the next quarter. Reply to the corridor council, in person, by the 15th.</p>
            </div>
            <div style="background:var(--ink);color:var(--bone);padding:14px">
              <div class="h4" style="margin-bottom:8px;font-size:10px;color:var(--bone)">EFA / 561</div>
              <div style="font-family:var(--sans);font-weight:700;font-size:18px;line-height:.95;text-transform:uppercase">End food apartheid. <span style="color:var(--red)">Now.</span></div>
              <p style="font-size:10px;margin-top:10px;color:var(--bone-edge)">A reminder, in case the headline did not say it plainly enough.</p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Zine + pamphlet -->
    <div class="grid2" style="margin-top:48px">
      <div>
        <div class="h4" style="margin-bottom:14px">FIG 12.2 · ZINE — A5, 16 PP, RISO 2-COLOR</div>
        <div class="template" style="aspect-ratio:1/1.4">
          <div style="height:100%;background:var(--bone);display:flex;flex-direction:column;justify-content:space-between;padding:24px">
            <div class="mono" style="font-size:10px;letter-spacing:.18em">№4 / 2026 / SPRING</div>
            <div>
              <div style="font-family:var(--sans);font-weight:700;font-size:48px;line-height:.86;letter-spacing:-.03em;text-transform:uppercase;color:var(--ink)">
                <span style="display:block">Land</span>
                <span style="display:block;color:var(--blue)">Returns</span>
                <span style="display:block;color:var(--red)">Story</span>
                <span style="display:block">Returns</span>
              </div>
              <div style="height:6px;background:var(--ink);margin:14px 0 10px;width:60%"></div>
              <div class="slab" style="font-size:13px;line-height:1.4;max-width:30ch">A field memoir from the Belle Glade corridor, in four hands.</div>
            </div>
            <div style="display:flex;justify-content:space-between" class="mono">
              <span style="font-size:9px;letter-spacing:.18em">561 / EFA · ZINE №4</span>
              <span style="font-size:9px;letter-spacing:.18em">FREE · BY KIN</span>
            </div>
          </div>
        </div>
      </div>
      <div>
        <div class="h4" style="margin-bottom:14px">FIG 12.3 · PAMPHLET — TRI-FOLD, 8.5×11 IN, INK ONLY</div>
        <div class="template" style="aspect-ratio:1/1.4">
          <div style="height:100%;background:var(--bone);padding:24px;display:flex;flex-direction:column;gap:14px">
            <div class="mono" style="font-size:10px;letter-spacing:.18em;border-top:4px solid var(--ink);padding-top:6px">FIELD INSTRUCTION №14</div>
            <div style="font-family:var(--sans);font-weight:700;font-size:32px;line-height:.9;letter-spacing:-.02em;text-transform:uppercase">How To Hold A Seed Library.</div>
            <div class="slab" style="font-size:12px;line-height:1.45">A short manual for any kitchen, porch, classroom, or church that intends to keep seeds.</div>
            <div style="flex:1;display:grid;grid-template-rows:repeat(5,1fr);gap:6px;font-family:var(--slab);font-size:11px;line-height:1.4">
              ${[
                'SAVE — gather seed from open-pollinated varieties only.',
                'LABEL — variety, date, grower, parcel, in pencil.',
                'CATALOG — by hand, in a single bound book.',
                'LEND — by consent of the grower, with witness.',
                'RETURN — twice what was taken, by the third season.'
              ].map((t,i)=>`<div style="border-bottom:1px dashed var(--ink);padding-bottom:6px;display:flex;gap:10px"><span class="mono" style="color:var(--red);font-weight:700;font-size:10px">0${i+1}</span><span>${t}</span></div>`).join('')}
            </div>
            <div class="mono" style="font-size:9px;letter-spacing:.18em">561 · EFA · MANUAL SERIES</div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </section>
  `));

  // ================= 13 REFUSALS =================
  root.appendChild(html(`
  <section id="s13" data-screen-label="13 Refusals">
  <div class="page">
    <div class="folio">FOLIO 044</div>
    <div class="section-head">
      <div class="num">§ 13<br>REFUSALS</div>
      <div class="title">What We<br>Do Not Do.</div>
    </div>

    <div class="grid12">
      <div style="grid-column:1/6">
        <p class="lede">A design system is also a refusal. The list below is binding. It is not a matter of taste — it is a matter of the politics that produce taste, and the institutions whose visual culture we will not extend.</p>
        <div class="marginal" style="margin-top:24px">
          The strongest design move available to us is the move not to make a thing. When in doubt, refuse.
        </div>
      </div>
      <div style="grid-column:7/13">
        <ul class="refuse">
          <li>We do not use the visual language of philanthropy — soft focus, smiling beneficiaries, white-text-on-photo overlays.</li>
          <li>We do not use the visual language of agritech — minimalist sans on green gradients, drone footage of fields.</li>
          <li>We do not appropriate Indigenous textile, beadwork, or regalia patterns. We honor traditions through structure and constraint, not surface.</li>
          <li>We do not place type over photography. Photography is evidence. Evidence is captioned, not designed-on.</li>
          <li>We do not use AI-generated imagery in any 561 artifact, ever, full stop.</li>
          <li>We do not use the Pan-African flag colors as decoration. Black, red, and green appear, if they appear, by name and with reason.</li>
          <li>We do not present the seal in gold, silver, foil, embossing, or 3D. The seal is a flat declaration.</li>
          <li>We do not run trackers, pixels, analytics, or ads on any 561 surface.</li>
          <li>We do not accept design work from corporations whose business is the food apartheid system.</li>
          <li>We do not use the words <em>community, stakeholder, beneficiary, impact, brand</em>, or <em>mission</em> in 561 voice.</li>
        </ul>
      </div>
    </div>
  </div>
  </section>
  `));

  // ================= 14 LINEAGE =================
  root.appendChild(html(`
  <section id="s14" class="dark" data-screen-label="14 Lineage">
  <div class="page">
    <div class="folio">FOLIO 046</div>
    <div class="section-head">
      <div class="num">§ 14<br>LINEAGE</div>
      <div class="title">Four Practices.<br>Cited In Full.</div>
    </div>

    <p class="lede" style="max-width:80ch">This bible follows the framework of <strong>visual engineering</strong> as articulated by emsenn — design oriented toward orientation-before-interpretation and the refusal of premature closure. Four lineages converge in the work; two lead.</p>

    <div class="grid4" style="margin-top:48px">
      ${[
        {n:'BAUHAUS',role:'CONTEXT',color:'var(--bone-edge)',body:'Relational construction — the page as a built object whose parts cohere. Visible in our 12-col grid and the disciplined pairing of sans &amp; slab.',weight:'present'},
        {n:'BRUTALISM',role:'LEAD',color:'var(--red)',body:'Anti-ornament, hard hierarchy, exposed structure. Visible in the masthead, the section heads, the rule weights, the refusal of decoration.',weight:'leading'},
        {n:'CUBISM',role:'CONTEXT',color:'var(--bone-edge)',body:'Multi-frame, multi-vantage. Visible in the registration-shifted seal, the fragmenting of the 561 numeral across red/blue/ink planes.',weight:'present'},
        {n:'TUFTE',role:'LEAD',color:'var(--blue)',body:'Evidence-first, attention budget honored, micro/macro reading. Visible in our captions, ink-budget chart, evidence figures, and forensic voice.',weight:'leading'}
      ].map(p=>`
        <div style="border:1px solid var(--bone);padding:24px;background:#1a1714;display:flex;flex-direction:column;gap:14px;height:100%">
          <div style="display:flex;justify-content:space-between;align-items:center">
            <div class="mono" style="font-size:10px;letter-spacing:.18em;color:${p.color}">${p.role}</div>
            <div class="mono" style="font-size:10px;letter-spacing:.18em;color:var(--bone-edge)">${p.weight}</div>
          </div>
          <div style="font-family:var(--sans);font-weight:700;font-size:32px;line-height:.95;letter-spacing:-.02em;text-transform:uppercase;color:${p.color}">${p.n}</div>
          <div style="height:1px;background:var(--bone)"></div>
          <p class="slab" style="font-size:13px;line-height:1.45;color:var(--bone)">${p.body}</p>
        </div>
      `).join('')}
    </div>

    <div style="margin-top:48px">
      <div class="h4" style="margin-bottom:14px;color:var(--bone)">VISUAL ANCESTRIES — STOOD WITH, NOT TAKEN FROM</div>
      <div class="grid2">
        <div>
          <div class="h3" style="color:var(--red);margin-bottom:8px">CONSTRUCTIVIST AGITPROP</div>
          <p class="slab" style="color:var(--bone);max-width:50ch">El Lissitzky, Rodchenko, Stepanova. Diagonal hierarchy, type-as-construction, photomontage as evidence. We borrow the discipline; we do not borrow the iconography.</p>
        </div>
        <div>
          <div class="h3" style="color:var(--red);margin-bottom:8px">INDIGENOUS TEXTILE LOGIC</div>
          <p class="slab" style="color:var(--bone);max-width:50ch">Gee's Bend quilting, Seminole patchwork, beadwork strip-construction. We honor by structural analogy — modular, additive, repaired-in-place — never by motif extraction.</p>
        </div>
      </div>
    </div>

    <div style="margin-top:48px;border:1px solid var(--bone);padding:24px;background:#1a1714">
      <div class="h4" style="margin-bottom:14px;color:var(--bone)">PRIMARY SOURCE</div>
      <div class="mono" style="font-size:13px;color:var(--bone);line-height:1.6">
        emsenn — <em>Visual Engineering Practices</em>.<br>
        emsenn.net / library / engineering / design / visual-engineering<br>
        <span style="color:var(--bone-edge)">Cited as the methodological frame for this bible.</span>
      </div>
    </div>
  </div>
  </section>
  `));

  // ================= 15 COLOPHON =================
  root.appendChild(html(`
  <section id="s15" data-screen-label="15 Colophon">
  <div class="page" style="position:relative">
    <div class="folio">FOLIO 048</div>
    <div class="section-head">
      <div class="num">§ 15<br>COLOPHON</div>
      <div class="title">Edits Welcome.<br>Authority Distributed.</div>
    </div>

    <div class="grid12">
      <div style="grid-column:1/7">
        <p class="lede">This bible is a living document. <strong>v.0.1</strong> — drafted May 2026. The council reviews on the equinoxes. Edits enter via the corridor councils, not by fiat. If you are reading a fixed copy, check the date below; later editions supersede.</p>
        <div style="margin-top:32px" class="body slab">
          <p>The bible is licensed cooperatively to members and kin. Reproduction is permitted; resale is forbidden. Translation is encouraged; <em>simplification</em> is not. Hostile reuse is grounds for refusal.</p>
          <p>If you want to make something for the 561 Group, follow the bible. Where the bible fails you, propose an edit. Where the bible contradicts the work, the work wins.</p>
        </div>
      </div>
      <div style="grid-column:8/13">
        <table class="spec">
          <tr><th>Field</th><th>Value</th></tr>
          <tr><td>Edition</td><td>v.0.1 — Living</td></tr>
          <tr><td>Drafted</td><td>2026 · 05 · 01</td></tr>
          <tr><td>Authors</td><td>Council, in plural</td></tr>
          <tr><td>Methodology</td><td>Visual Engineering (emsenn, 2024)</td></tr>
          <tr><td>Type</td><td>Space Grotesk · Roboto Slab · JetBrains Mono</td></tr>
          <tr><td>Inks</td><td>Ink · Bone · Riso Fluo Red 805 · Federal Blue</td></tr>
          <tr><td>Paper</td><td>Bone uncoated 80 lb · Newsprint 30 lb</td></tr>
          <tr><td>License</td><td>Cooperative · members &amp; kin</td></tr>
          <tr><td>Refusal</td><td>Use by food-apartheid actors</td></tr>
          <tr><td>Next review</td><td>2026 · 09 · 22 · Equinox</td></tr>
        </table>
      </div>
    </div>

    <!-- Final declaration -->
    <div style="margin-top:80px;border-top:8px solid var(--ink);padding-top:48px;text-align:center">
      <div class="mono" style="font-size:11px;letter-spacing:.18em;color:var(--ink-soft);margin-bottom:18px">— END OF BIBLE · v.0.1 —</div>
      <div style="font-family:var(--sans);font-weight:700;font-size:clamp(48px,7vw,120px);line-height:.85;letter-spacing:-.04em;text-transform:uppercase">
        Feed first.<br>
        <span style="color:var(--red)">Theorize</span> second.
      </div>
      <div class="mono" style="font-size:11px;letter-spacing:.18em;color:var(--ink-soft);margin-top:32px">561 / EFA · 2026</div>
    </div>
  </div>
  </section>

  <footer class="colophon">
    <div class="page">
      <div class="colophon-grid">
        <div style="grid-column:1/4">
          <svg viewBox="0 0 200 200" width="80">
            <circle cx="100" cy="100" r="92" fill="none" stroke="#F2EAD8" stroke-width="2"/>
            <circle cx="100" cy="100" r="84" fill="none" stroke="#F2EAD8" stroke-width=".75"/>
            <text x="100" y="118" font-family="Space Grotesk" font-weight="700" font-size="62" letter-spacing="-2" text-anchor="middle" fill="#F2EAD8">561</text>
          </svg>
        </div>
        <div style="grid-column:4/8">
          <div class="h4" style="margin-bottom:10px;color:var(--bone)">561 GROUP</div>
          <p class="slab" style="font-size:13px;color:var(--bone-edge);max-width:42ch">An autonomous confederacy organized to pursue black liberation, indigenous sovereignty, and the end of food apartheid.</p>
        </div>
        <div style="grid-column:8/11" class="mono" style="font-size:11px;color:var(--bone-edge);line-height:1.7">
          <div style="color:var(--bone);font-weight:700">CORRIDORS</div>
          Belle Glade · FL<br>Pee Dee · SC<br>Black Belt · AL<br>Sea Islands · GA<br>+ kin elsewhere
        </div>
        <div style="grid-column:11/13" class="mono" style="font-size:11px;color:var(--bone-edge);line-height:1.7;text-align:right">
          <div style="color:var(--bone);font-weight:700">v.0.1</div>
          2026·05·01<br>Living document<br>Edits via council
        </div>
      </div>
    </div>
  </footer>
  `));

}
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', __render561);
} else {
  __render561();
}
