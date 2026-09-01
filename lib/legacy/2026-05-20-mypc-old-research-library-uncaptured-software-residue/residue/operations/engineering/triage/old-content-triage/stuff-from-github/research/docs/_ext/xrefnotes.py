from __future__ import annotations

from docutils import nodes
from sphinx import addnodes
from sphinx.application import Sphinx


class XrefNote(nodes.General, nodes.Element):
    """Node for margin-style cross-reference notes."""


def add_xref_notes(app: Sphinx, doctree: nodes.document, docname: str) -> None:
    """Inject a small cross-reference note near the top of documents
    that declare :xref-code: or :xref-tests: metadata.

    The note appears once per document and is rendered as a margin note
    in LaTeX/PDF and as a small inline block in HTML.
    """

    env = app.builder.env  # type: ignore[attr-defined]
    metadata = getattr(env, "metadata", {}).get(docname, {})  # type: ignore[assignment]

    def _meta_value(key: str) -> str:
        value = metadata.get(key)
        if isinstance(value, list):
            return ", ".join(v.strip() for v in value if v.strip())
        if value is None:
            return ""
        return str(value).strip()

    xref_code = _meta_value("xref-code")
    xref_tests = _meta_value("xref-tests")

    if not xref_code and not xref_tests:
        return

    # Build the text and references.
    para = nodes.paragraph()

    first = True

    def _add_group(label: str, value: str) -> None:
        nonlocal first
        if not value:
            return
        if not first:
            para += nodes.Text("  ")
        first = False
        para += nodes.strong(text=label + " ")

        # Values may be a comma-separated list of docnames.
        targets = [v.strip() for v in value.split(",") if v.strip()]
        for i, target in enumerate(targets):
            if i:
                para += nodes.Text(", ")
            ref = addnodes.pending_xref(
                "",
                reftype="doc",
                refdomain=None,
                refexplicit=True,
                reftarget=target,
                refdoc=docname,
            )
            ref += nodes.literal(text=target)
            para += ref

    _add_group("See implementation", xref_code)
    _add_group("See tests", xref_tests)

    if first:
        # Nothing was actually added.
        return

    note = XrefNote()
    note += para

    # Insert immediately after the first section title, if any; otherwise
    # at the top of the document.
    for child in doctree.children:
        if isinstance(child, nodes.section):
            # After the section's title node.
            for idx, grand in enumerate(child.children):
                if isinstance(grand, nodes.title):
                    child.insert(idx + 1, note)
                    return
            # Fallback: prepend to the section.
            child.insert(0, note)
            return

    doctree.insert(0, note)


def visit_xrefnote_html(self, node: XrefNote) -> None:  # type: ignore[override]
    self.body.append('<div class="xref-note">')


def depart_xrefnote_html(self, node: XrefNote) -> None:  # type: ignore[override]
    self.body.append("</div>")


def visit_xrefnote_latex(self, node: XrefNote) -> None:  # type: ignore[override]
    # Render the whole note as a margin note in LaTeX/PDF.
    self.body.append(r"\marginpar{")


def depart_xrefnote_latex(self, node: XrefNote) -> None:  # type: ignore[override]
    self.body.append("}")


def setup(app: Sphinx) -> dict:
    app.add_node(
        XrefNote,
        html=(visit_xrefnote_html, depart_xrefnote_html),
        latex=(visit_xrefnote_latex, depart_xrefnote_latex),
    )
    app.connect("doctree-resolved", add_xref_notes)
    return {
        "version": "0.1",
        "parallel_read_safe": True,
        "parallel_write_safe": True,
    }
