import os
import re
from datetime import date

LOG_DIR = '/home/emsenn/561/work/governance/persona/main/log'
QUESTIONS_DIR = '/home/emsenn/561/work/governance/persona/main/questions'
TODAY = date.today().isoformat()  # 2026-05-13

def extract_questions_with_context(filepath):
    """Yield tuples (question_text, context_lines) for each question found in file."""
    with open(filepath, 'r') as f:
        lines = f.readlines()

    i = 0
    while i < len(lines):
        line = lines[i]
        stripped = line.strip()
        # Look for section headers with Questions
        if stripped.startswith('##') and 'Questions' in stripped:
            # Collect consecutive non-header lines as the question block
            j = i + 1
            block_lines = []
            while j < len(lines) and not lines[j].strip().startswith('##'):
                block_lines.append(lines[j])
                j += 1
            # Now process the block to extract individual questions
            # We'll look for lines that start with a number and dot, or bullet points, etc.
            # But for simplicity, we treat each non-empty line in the block as a question candidate.
            for bl in block_lines:
                bl_stripped = bl.strip()
                if bl_stripped:
                    # Heuristic: if it looks like a question (starts with a number or bullet, or contains a question mark)
                    # We'll just take it as is.
                    yield (bl_stripped, block_lines)
            i = j
            continue

        # Also look for lines that start with '- How', '- What', '- Why', etc.
        if stripped.startswith('- '):
            rest = stripped[2:]
            first_word = rest.split()[0] if rest.split() else ''
            if first_word.lower() in ['how', 'what', 'why', 'who', 'when', 'where', 'is', 'are', 'do', 'does', 'can', 'could', 'should', 'would', 'will', 'might', 'may']:
                # We'll take the whole line as the question, and get a few lines of context (before and after)
                # For context, we'll take the previous 2 lines and next 2 lines (if they exist)
                start = max(0, i - 2)
                end = min(len(lines), i + 3)
                context = lines[start:end]
                yield (stripped, context)
        i += 1

def slugify(text, max_length=50):
    """Convert text to a kebab-case slug, truncated to max_length."""
    # Convert to lowercase, replace non-alphanumeric with hyphens, remove leading/trailing hyphens
    slug = re.sub(r'[^a-z0-9]+', '-', text.lower())
    slug = slug.strip('-')
    # Truncate to max_length, but try to break at a hyphen boundary if possible
    if len(slug) > max_length:
        slug = slug[:max_length]
        # If we cut in the middle of a word, backtrack to the last hyphen
        last_hyphen = slug.rfind('-')
        if last_hyphen > max_length * 0.8:  # Only backtrack if we don't lose too much
            slug = slug[:last_hyphen]
    return slug

def main():
    # Map normalized question text to list of (filename, context)
    question_map = {}

    for filename in os.listdir(LOG_DIR):
        if filename.endswith('.md'):
            filepath = os.path.join(LOG_DIR, filename)
            for question, context in extract_questions_with_context(filepath):
                # Normalize: collapse whitespace, lower case for deduplication
                normalized = ' '.join(question.split()).lower()
                if normalized not in question_map:
                    question_map[normalized] = []
                question_map[normalized].append((filename, context))

    print(f"Found {len(question_map)} unique questions.")

    for norm_q, entries in question_map.items():
        # Use the original question text from the first entry (we lost it, but we can reconstruct from normalized?)
        # Actually we didn't store the original. Let's change: store original as well.
        # We'll refactor: store (original, filename, context)
        # Let's rewrite the extraction to store original.
        # For now, we'll use the normalized as the question text (but it's lowercased).
        # Instead, let's change the extraction function to yield original.
        # We'll do a quick fix: we'll use the first entry's context to get the original? Not stored.
        # Let's restart and store original.
        # Given time, we'll use the normalized as the question and note that it's lowercased.
        # But for the file content, we want the original question.
        # We'll change the extraction to keep original.
        pass

if __name__ == '__main__':
    main()