import os
import re

def extract_questions_from_file(filepath):
    questions = []
    with open(filepath, 'r') as f:
        lines = f.readlines()

    i = 0
    while i < len(lines):
        line = lines[i]
        # Check for section headers like '## Questions for Further Exploration', '## Questions That Arose', '## Questions'
        if line.strip().startswith('##') and 'Questions' in line:
            # Capture the following lines until next header or empty line? We'll capture until next line that starts with '##' or end of file.
            j = i + 1
            while j < len(lines) and not lines[j].strip().startswith('##'):
                # If the line is not empty, add it as a question candidate
                if lines[j].strip():
                    questions.append(lines[j].strip())
                j += 1
            i = j
            continue

        # Check for lines starting with '- How', '- What', '- Why' (case-insensitive for the word after '- ')
        stripped = line.strip()
        if stripped.startswith('- '):
            # Remove the '- ' and check the first word
            rest = stripped[2:]
            # Split to get first word
            first_word = rest.split()[0] if rest.split() else ''
            if first_word.lower() in ['how', 'what', 'why', 'who', 'when', 'where', 'is', 'are', 'do', 'does', 'can', 'could', 'should', 'would', 'will', 'might', 'may']:
                questions.append(stripped)
        i += 1
    return questions

def main():
    log_dir = '/home/emsenn/561/work/governance/persona/main/log'
    all_questions = []
    for filename in os.listdir(log_dir):
        if filename.endswith('.md'):
            filepath = os.path.join(log_dir, filename)
            questions = extract_questions_from_file(filepath)
            for q in questions:
                all_questions.append((filename, q))

    # Print extracted questions
    for filename, q in all_questions:
        print(f'{filename}: {q}')

if __name__ == '__main__':
    main()