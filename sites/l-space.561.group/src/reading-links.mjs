import {posix} from 'node:path';
/** Resolve document references in their source context before rendering them. */
export async function resolveReadingLinks(tree, {document, archive, documentUrl}) {
  const visit = async value => {
    if (Array.isArray(value)) { for (const child of value) await visit(child); return; }
    if (!value || typeof value !== 'object') return;
    if (value.kind === 'link' && typeof value.href === 'string'
      && !/^(?:[a-z][a-z0-9+.-]*:|\/|#)/iu.test(value.href)
      && /\.md(?:#.*)?$/iu.test(value.href)) {
      const fragment = value.href.indexOf('#');
      const target = fragment < 0 ? value.href : value.href.slice(0, fragment);
      const anchor = fragment < 0 ? '' : value.href.slice(fragment);
      let resolved=await archive.resolveLink(document, target);
      try {
        const path=posix.normalize(posix.join(posix.dirname(document),decodeURIComponent(target)));
        archive.admit(path);
        resolved=path;
      } catch {}
      if (resolved) value.href = documentUrl(resolved) + anchor;
      else {
        const label = value.label;
        for (const key of Object.keys(value)) delete value[key];
        Object.assign(value, {kind:'wikilink', target:target.replace(/\.md$/iu,''), label});
      }
    }
    for (const child of Object.values(value)) await visit(child);
  };
  await visit(tree);
  return tree;
}
