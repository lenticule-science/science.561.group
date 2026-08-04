import os
import re

def extract_questions_from_file(filepath):
    """Return list of question strings found in the file."""
    questions = []
    with open(filepath, 'r') as f:
        lines = f.readlines()

    in_questions_section = False
    for line in lines:
        stripped = line.strip()
        # Detect start of a questions section
        if stripped.startswith('##') and 'Questions' in stripped:
            in_questions_section = True
            continue
        # If we encounter another section header, we leave the questions section
        if stripped.startswith('##') and in_questions_section:
            # Another section header, leave questions section
            in_questions_section = False
            continue

        if in_questions_section:
            # Skip empty lines
            if not stripped:
                continue
            # Heuristic: if it looks like a question (ends with ? or starts with a question word)
            # But we'll take any non-empty line as a candidate question (as per the instructions)
            questions.append(stripped)

    # Also, look for lines that start with '- How', '- What', '- Why' etc. anywhere in the file
    # (These might be outside a dedicated Questions section)
    # We'll reset and do a second pass for these patterns.
    with open(filepath, 'r') as f:
        for line in f:
            stripped = line.strip()
            if stripped.startswith('- '):
                rest = stripped[2:]
                # Check if the first word is a question word
                first_word = rest.split()[0] if rest.split() else ''
                if first_word.lower() in ['how', 'what', 'why', 'who', 'when', 'where', 'is', 'are', 'do', 'does', 'can', 'could', 'should', 'would', 'will', 'might', 'may']:
                    questions.append(stripped)
    return questions

def slugify(text, max_length=50):
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
    log_dir = '/home/emsenn/561/work/governance/persona/main/log'
    questions_dir = '/home/emsenn/561/work/governance/persona/main/questions'
    today = '2026-05-13'  # fixed as per instructions

    # Map normalized question to set of filenames where it appears
    question_to_files = {}
    # Also store original question text (we'll keep the first occurrence)
    question_original = {}

    for filename in os.listdir(log_dir):
        if filename.endswith('.md'):
            filepath = os.path.join(log_dir, filename)
            for q in extract_questions_from_file(filepath):
                # Normalize: lower case and collapse whitespace
                normalized = ' '.join(q.split()).lower()
                if normalized not in question_to_files:
                    question_to_files[normalized] = set()
                    question_original[normalized] = q  # store original
                question_to_files[normalized].add(filename)

    print(f"Found {len(question_to_files)} unique questions.")

    # For each unique question, check if a question file already exists in questions/
    # If not, create it.
    for norm_q, files_set in question_to_files.items():
        orig_q = question_original[norm_q]
        # Create a slug from the original question (or normalized)
        slug = slugify(orig_q, max_length=50)
        # Ensure slug is not empty
        if not slug:
            slug = 'question'
        question_filename = f"{today}-{slug}.md"
        question_filepath = os.path.join(questions_dir, question_filename)

        # Check if file already exists
        if not os.path.exists(question_filepath):
            # Create the question file
            with open(question_filepath, 'w') as f:
                f.write(f"# {orig_q}\n\n")
                f.write("## Context\n\n")
                # Mention the log files where this question appeared
                f.write("This question arose in the following log entries:\n")
                for fname in sorted(files_set):
                    f.write(f"- {fname}\n")
            print(f"Created question file: {question_filename}")
        else:
            # Optionally, we could improve the existing file by adding context
            # For now, we just note that it exists.
            pass

    # After ensuring question files exist, select one question that has not been thoroughly explored.
    # We'll define "thoroughly explored" as: there is no exploration log entry (in log/) that answers it.
    # We'll look for log entries that have a name matching the question slug (or containing it) and are of the form YYYY-MM-DD-answer-*.md or YYYY-MM-DD-exploration-*.md
    # Actually, the instructions say: select one question that has not yet been thoroughly explored (you can decide based on file age, lack of answer files, or your judgment).
    # We'll look at the questions directory and see which question files have corresponding exploration files in the log directory.
    # For each question file in questions/, check if there exists a log file that seems to be an answer/exploration for it.
    # We'll do a simple check: look for log files that contain the slug in their name (excluding the date prefix).

    print("\nChecking for explored questions...")
    explored = set()
    unexplored = []
    for qfile in os.listdir(questions_dir):
        if qfile.endswith('.md') and qfile.startswith(today):
            # Extract the slug part: remove date and the first dash after date? Actually format is YYYY-MM-DD-slug.md
            # Remove the date prefix (first 11 chars: YYYY-MM-DD-)
            if len(qfile) > 11 and qfile[4] == '-' and qfile[7] == '-':
                slug_part = qfile[11:-3]  # remove .md
                # Now look in log directory for files that contain this slug_part (and are answer or exploration)
                found = False
                for lfile in os.listdir(log_dir):
                    if lfile.endswith('.md') and lfile.startswith(today):
                        # Check if lfile contains slug_part (maybe as part of answer- or exploration-)
                        if slug_part in lfile:
                            # Also prefer files that start with answer- or exploration-
                            if lfile.startswith(today + '-answer-') or lfile.startswith(today + '-exploration-'):
                                found = True
                                break
                if found:
                    explored.add(qfile)
                else:
                    unexplored.append(qfile)

    print(f"Explored questions: {len(explored)}")
    print(f"Unexplored questions: {len(unexplored)}")

    if unexplored:
        # Pick the first unexplored question (or we could pick based on least recent? but all are today)
        selected = unexplored[0]
        print(f"\nSelected question file: {selected}")
        # Read the question file to get the question text
        with open(os.path.join(questions_dir, selected), 'r') as f:
            content = f.read()
        # Extract the first line (the question) assuming format "# Question"
        lines = content.split('\n')
        question_text = ""
        for line in lines:
            if line.startswith('# '):
                question_text = line[2:].strip()
                break
        if not question_text:
            # fallback: use the filename slug
            question_text = selected[11:-3].replace('-', ' ')
        print(f"Question: {question_text}")

        # Now we need to conduct an exploration of the 561 Group superrepo aimed at answering that question.
        # We'll need to search the repo for relevant information.
        # Let's first output the question and then we'll decide how to explore.
        # We'll store the selected question and its text for the next steps.
        with open('/tmp/selected_question.txt', 'w') as f:
            f.write(question_text)
        with open('/tmp/selected_question_file.txt', 'w') as f:
            f.write(selected)
    else:
        print("All questions from today have been explored! Need to look at older questions?")
        # But instructions say use TODAY'S date only for journal entries and question files.
        # So we should only consider today's questions.
        # If all explored, we might need to improve existing question files.
        # For now, we'll just pick the first question file and treat as unexplored anyway.
        pass

if __name__ == '__main__':
    main()