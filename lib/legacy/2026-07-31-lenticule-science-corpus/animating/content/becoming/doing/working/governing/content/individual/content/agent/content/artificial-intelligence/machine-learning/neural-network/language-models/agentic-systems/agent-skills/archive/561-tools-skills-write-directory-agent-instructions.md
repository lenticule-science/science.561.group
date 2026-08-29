---

description: Create or update an AGENTS.md file for a content directory
name: write-directory-agent-instructions
version: [0, 1]
kind: operational
runtime: inference
triggers:
  - "write AGENTS.md for"
  - "add agent instructions to"
  - "create directory agent context"
inputs:
  directory: string
outputs:
  path: string
region:
  reads: ["content/"]
  writes: ["content/"]
dependencies: []
scopes: []
part-of: technology/specifications/agential-semioverse-repository
---

Write an AGENTS.md file for: $ARGUMENTS

## Instructions

1. Read the target directory's `index.md` to understand its scope and
   content.

2. If the directory has a domain ASR spec (check for a `specifications/`
   subdirectory), read the spec's `index.md` for the validity principle,
   content types, and domain-specific relations.

3. Read at least 3 representative content files from the directory to
   understand the vocabulary and reasoning style in use.

4. Write an `AGENTS.md` file in the target directory with these sections:

   **Header line.** One sentence: what this directory contains.

   **Interpretive stance.** 2-4 sentences: what reasoning style applies
   here, what methodological commitments are active. This is the
   epistemic orientation — not procedures, but the posture an agent
   should adopt.

   **Central vocabulary.** Bullet list of 5-10 key terms with brief
   glosses. Link to term files where they exist.

   **Content conventions.** What content types exist here, what
   frontmatter fields matter, what domain-specific relations are used.
   Reference the domain ASR spec if one exists.

   **Cross-references.** Which adjacent disciplines are most relevant.
   What to consult when work crosses discipline boundaries.

5. Keep the file under 60 lines. This is orientation, not a manual.
   Detailed instructions belong in SKILL.md files and specs.

6. Do NOT include:
   - Build commands or environment setup (those go in root CLAUDE.md)
   - Git conventions (those go in root AGENTS.md)
   - Style guide rules (reference the style guide instead)
   - Skill listings (agents discover those from the registry)

## Anti-slop checklist

- The interpretive stance is specific to THIS discipline, not generic
  ("write clearly" is not an interpretive stance)
- Central vocabulary terms actually appear in the directory's content
- Cross-references name specific directories, not vague gestures
- The file reads as a knowledge artifact, not as a config file
- Under 60 lines
