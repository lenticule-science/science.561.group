/** Return POS tags for a word. May return multiple tags (ambiguous open-class words).
 * Closed-class words return exactly one tag; open-class may return multiple. */
export function tag(word, bundle, opts) {
    const lower = word.toLowerCase();
    const closed = bundle.closedClassTags(lower);
    if (closed.length > 0)
        return closed;
    if (/^\d[\d,.]*$/.test(word))
        return ["num"];
    const morphTags = bundle.morphologyTags(word);
    if (morphTags.length > 0)
        return morphTags;
    return ["noun"];
}
//# sourceMappingURL=tagging.mjs.map