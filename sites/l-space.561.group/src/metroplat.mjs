import { join } from 'node:path';
import { openArchive } from '@red-cup-engineering/knowledge-system-server/archive';
import { searchAndFetchTools, vaultMcpTools } from '@red-cup-engineering/knowledge-system-server/mcp-tools';
import { textRepr } from '@red-cup-engineering/http-services-section/representation';

import { EXCLUDED_SEGMENTS } from './archive-policy.mjs';
const escape = (value) => String(value ?? '').replace(/[&<>"']/gu, (c) => ({'&':'&amp;', '<':'&lt;', '>':'&gt;', '"':'&quot;', "'":'&#39;'}[c]));
const documentPath = (id) => `/knowledge?document=${encodeURIComponent(id)}`;
const page = (body) => textRepr(`<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>L-Space · MetroPlat</title></head><body><nav><a href="/ops">MetroPlat</a> · <a href="/knowledge">L-Space</a></nav><main><h1>L-Space</h1><form action="/knowledge" method="get"><label>Search the knowledge corpus <input name="query" type="search" required></label><button>Search</button></form>${body}</main></body></html>`, {type: 'text/html; charset=utf-8', cacheControl: {noStore:true}});

/** One installed, read-only archive projection. The FeltOS entrance admits both
 * people and machine clients; this application opens no listener or OAuth server.
 * Search URLs, HTTP reading and MCP fetch retain the same document id/revision. */
export function lSpaceMetroplat({config, configuration = {}, archive: suppliedArchive}) {
  const root = configuration.root === undefined
    ? join(config.repositoryRoot, 'lib/emsenn/services/561-group/services/science-services-section')
    : configuration.root;
  let opened;
  const archive = () => suppliedArchive ?? (opened ??= openArchive({
    root, excludes: configuration.excludes ?? EXCLUDED_SEGMENTS,
    observations: join(config.stateDir, 'knowledge', 'observations.jsonl'),
    fullText: join(config.stateDir, 'knowledge', 'full-text.sqlite'),
  }).catch(error => {opened=undefined; throw error;}));
  const reader = {archive, canWrite:false};
  // Omit write descriptors entirely: visibility is not an authorization check.
  const descriptors = [
    ...searchAndFetchTools({documentUrl: id => new URL(documentPath(id), config.publicBaseUrl).href}),
    ...vaultMcpTools.filter(tool => !tool.visible || tool.visible(reader)),
  ];
  const tools = descriptors.map(tool => ({
    ...tool, name:`lspace_${tool.name}`, handler: input => tool.handler(input, reader),
  }));
  const call = (name, input) => tools.find(tool => tool.name === `lspace_${name}`).handler(input);
  const reading = {resources:[{
    id:'lspace.metroplat', match:'/knowledge', methods:['GET'],
    handler:async ({url}) => {
      try {
        const id=url.searchParams.get('document');
        if (id) {
          const note=await call('fetch',{id});
          return page(`<article><h2>${escape(note.title)}</h2><p>${escape(note.id)}</p><pre style="white-space:pre-wrap">${escape(note.text)}</pre><details><summary>Source metadata</summary><pre>${escape(JSON.stringify(note.metadata,null,2))}</pre></details></article>`);
        }
        const query=url.searchParams.get('query');
        if (!query) return page('<p>Search, then open a result to read its full source document here.</p>');
        const found=await call('search',{query});
        return page(`<h2>Results for ${escape(query)}</h2><ul>${found.results.map(note=>`<li><a href="${escape(documentPath(note.id))}">${escape(note.title)}</a><p>${escape(note.text)}</p></li>`).join('')}</ul>`);
      } catch {
        return {...page('<p role="alert">The corpus could not be read. Its source or archive is unavailable.</p>'),status:503};
      }
    },
  }]};
  return {applications:[reading],tools};
}
