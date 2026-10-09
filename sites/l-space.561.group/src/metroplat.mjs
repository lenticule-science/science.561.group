import { textRepr } from '@red-cup-engineering/http-services-section/representation';
import { mcpToolValue } from '@red-cup-engineering/mcp-engineering-services-section/client';

const escape = (value) => String(value ?? '').replace(/[&<>"']/gu, (character) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[character]));
const page = (body) => textRepr(`<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>L-Space · MetroPlat</title></head><body><nav><a href="/ops">MetroPlat</a> · <a href="/knowledge">L-Space</a> · <a href="https://l-space.561.group/">Knowledge garden</a></nav><main><h1>L-Space</h1><form action="/knowledge" method="get"><label>Search the knowledge corpus <input name="query" type="search" required></label><button>Search</button></form>${body}</main></body></html>`, { type: 'text/html; charset=utf-8', cacheControl: { noStore: true } });

/** Corpus reading through MetroPlat's admission and the existing admitted L-space federation.
 * No copied corpus, second reader account, or workflow is needed to search and read a note. */
export function lSpaceMetroplat({ federation }) {
  const call = async (name, input) => {
    const tool = federation.tools.find((entry) => entry.name === `lspace_${name}`);
    if (!tool) throw new Error('L-Space is not connected');
    return mcpToolValue(name, await tool.handler(input));
  };
  return { resources: [{
    id: 'lspace.metroplat', match: '/knowledge', methods: ['GET'],
    handler: async ({ url }) => {
      try {
        const document = url.searchParams.get('document');
        if (document) {
          const note = await call('fetch', { id: document });
          return page(`<article><h2>${escape(note.title)}</h2><p>${escape(note.id ?? document)}</p><pre style="white-space:pre-wrap">${escape(note.text)}</pre></article>`);
        }
        const query = url.searchParams.get('query');
        if (!query) return page('<p>Search the corpus, then open a result to read its full document here.</p>');
        const found = await call('search', { query });
        return page(`<h2>Results for ${escape(query)}</h2><ul>${found.results.map((note) => `<li><a href="/knowledge?document=${encodeURIComponent(note.id)}">${escape(note.title)}</a><p>${escape(note.text)}</p></li>`).join('')}</ul>`);
      } catch (error) {
        return { ...page(`<p role="alert">Corpus access failed: ${escape(error.message)}</p>`), status: 503 };
      }
    },
  }] };
}
