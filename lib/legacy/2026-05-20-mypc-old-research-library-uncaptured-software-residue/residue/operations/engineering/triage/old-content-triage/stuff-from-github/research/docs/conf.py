import os
import sys

project = "On Relationality"
author = "emsenn"

extensions = [
    "sphinx.ext.autodoc",
    "sphinx.ext.autosummary",
    "sphinx.ext.napoleon",
    "sphinx.ext.todo",
    "sphinx.ext.viewcode",
    "phases",
    "xrefnotes",
]

autosummary_generate = True

sys.path.insert(0, os.path.abspath(".."))
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "_ext")))

templates_path = ["_templates"]
exclude_patterns: list[str] = []

html_theme = "alabaster"

html_static_path = ["_static"]
html_css_files = ["relationality.css"]

# Keep autodoc signatures readable by omitting full module paths.
add_module_names = False

# Include TODOs in the built documentation by default; this can be
# toggled per-build if needed.
todo_include_todos = True

# LaTeX/PDF configuration: single combined manual.
# Use XeLaTeX via latexmk so that Unicode (for example, λ_R, ⇒, ⊥, ⊤)
# is handled correctly in the PDF output.
latex_engine = "xelatex"

latex_use_xindy = False

latex_elements: dict[str, str] = {
    # With XeLaTeX, Sphinx's defaults already use fontspec/polyglossia.
    # These entries avoid loading inputenc/utf8extras; we let Sphinx and
    # the underlying LaTeX engine choose fonts.
    "inputenc": "",
    "utf8extra": "",
    # Map common Unicode math symbols used in the notes to LaTeX math
    # macros so that they render consistently in the PDF.
    "preamble": r"""
\usepackage{newunicodechar}
\newcommand{\subtitle}{A story of relationing}
% Single-column index layout for better readability.
\usepackage{idxlayout}
\idxlayout{columns=1}
\newunicodechar{λ}{\ensuremath{\lambda}}
\newunicodechar{ρ}{\ensuremath{\rho}}
\newunicodechar{⊢}{\ensuremath{\vdash}}
\newunicodechar{⊥}{\ensuremath{\bot}}
\newunicodechar{⊤}{\ensuremath{\top}}
\newunicodechar{⇒}{\ensuremath{\Rightarrow}}
\newunicodechar{≡}{\ensuremath{\equiv}}
\newunicodechar{∈}{\ensuremath{\in}}
\newunicodechar{∧}{\ensuremath{\wedge}}
\newunicodechar{∨}{\ensuremath{\vee}}
\newunicodechar{≤}{\ensuremath{\leq}}
\newunicodechar{⟂}{\ensuremath{\perp}}
\newunicodechar{∎}{\ensuremath{\square}}
% Additional symbols seen in the math notes and tests.
\newunicodechar{⊆}{\ensuremath{\subseteq}}
\newunicodechar{↪}{\ensuremath{\hookrightarrow}}
\newunicodechar{↦}{\ensuremath{\mapsto}}
\newunicodechar{⟨}{\ensuremath{\langle}}
\newunicodechar{⟩}{\ensuremath{\rangle}}
\newunicodechar{⋆}{\ensuremath{\star}}
\newunicodechar{⊨}{\ensuremath{\vDash}}
\newunicodechar{π}{\ensuremath{\pi}}
\newunicodechar{β}{\ensuremath{\beta}}
\newunicodechar{ν}{\ensuremath{\nu}}
\newunicodechar{₁}{\ensuremath{{}_1}}
\newunicodechar{₂}{\ensuremath{{}_2}}
\newunicodechar{ₙ}{\ensuremath{{}_n}}
\newunicodechar{′}{\ensuremath{^{\prime}}}
\newunicodechar{∘}{\ensuremath{\circ}}
\newunicodechar{≥}{\ensuremath{\geq}}
\newunicodechar{ω}{\ensuremath{\omega}}
\newunicodechar{⋁}{\ensuremath{\bigvee}}
\newunicodechar{ℕ}{\ensuremath{\mathbb{N}}}
\newunicodechar{□}{\ensuremath{\Box}}
\newunicodechar{◇}{\ensuremath{\Diamond}}
\newunicodechar{δ}{\ensuremath{\delta}}
\newunicodechar{ₛ}{\ensuremath{{}_s}}
\newunicodechar{∩}{\ensuremath{\cap}}
\newunicodechar{∪}{\ensuremath{\cup}}
\newunicodechar{ⁿ}{\ensuremath{^n}}
\newunicodechar{η}{\ensuremath{\eta}}
\newunicodechar{⇔}{\ensuremath{\Leftrightarrow}}
\newunicodechar{↔}{\ensuremath{\leftrightarrow}}
\newcommand{\coloneqq}{:=}
% Bracket notation for denotational semantics.
\newcommand{\llbracket}{[\![}
\newcommand{\rrbracket}{]\!]}
%% Relax some box warnings for long inline math fragments and open the leading a bit.
\hfuzz=1pt
\hbadness=10000
\setlength{\headheight}{15pt}
\linespread{1.05}
%% Avoid hyphenating words while keeping justified text.
\usepackage[none]{hyphenat}
\sloppy
%% Render strong emphasis as bold+italic in LaTeX to match the
%% ***Strong Italic Title Case*** convention.
\renewcommand{\sphinxstylestrong}[1]{\textbf{\emph{#1}}}
""",
    # Use a slightly larger base font for readability in the PDF.
    "pointsize": "11pt",
    # Sphinx/LaTeX layout tuning: margins, colours, index/admonition layout.
    "sphinxsetup": (
        "hmargin={1.2in,1.8in}, vmargin={1.2in,1.2in}, "
        "TitleColor={black}, InnerLinkColor={black}, OuterLinkColor={black}"
    ),
    # Force one-sided layout (no alternating inner/outer margins).
    # Use ``extraclassoptions`` so Sphinx appends this cleanly to the
    # default options (for example, ``11pt,oneside``).
    "extraclassoptions": "oneside",
    # Defer the table of contents to index.rst so that the Preface
    # appears immediately after the title page in the PDF.
    "tableofcontents": "",
}

latex_documents = [
    (
        "index",
        "relationality.tex",
        "On Relationality",
        author,
        "manual",
    ),
]
