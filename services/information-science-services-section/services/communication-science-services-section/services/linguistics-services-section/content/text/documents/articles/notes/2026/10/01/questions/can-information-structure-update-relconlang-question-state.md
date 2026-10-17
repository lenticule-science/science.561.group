---
kind: question
status: open
explores:
  - relconlang
  - information-structure
  - question-under-discussion
  - focus
  - contrast
  - dialogue
---
# Can information structure update RelConLang question state?

The information-structure resource already gives `fi` the prose reading "new contribution, narrow focus, or answer to the current question under discussion" and lists a QUD stack as Roadmap.

Current code only proves the local part: `fi`, `ko`, `ma`, and `ri` become parse/event relations. No cross-turn code links `fi` to an earlier `ku`.

The experiment therefore starts conservatively:

- `ku P` may open a question issue;
- `fi X` marks X as a new/focused contribution locally;
- if a question issue already specifies an open role or alternative set, a compatible focused constituent may help satisfy it;
- `fi` alone does not invent a hidden prior question;
- `ko X` can identify a selected/live alternative, but only an explicit interrogative carrier opens question state.

For now the only clean built question form is polar `ku P`. Content questions with open argument slots need their own grammar rather than treating `fi` as a wh-word by accident.
