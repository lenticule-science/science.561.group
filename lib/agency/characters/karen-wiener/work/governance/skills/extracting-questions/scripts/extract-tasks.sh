#!/bin/bash

# Extract tasks from exploration logs
LOGS_DIR="work/governance/persona/main/log"
WORK_DIR="work/governance/persona/main/work"
TASKS_DIR="$WORK_DIR/tasks"

# Ensure tasks directory exists
mkdir -p "$TASKS_DIR"

echo "Starting task extraction from exploration logs..."

# Look for task recommendations in recent logs
found_any=false
for logfile in "$LOGS_DIR"/*.md; do
    if [ -f "$logfile" ]; then
        # Check if the file contains task-related sections
        if grep -q '## Follow-Up Tasks and Recommendations' "$logfile" || \
           grep -q '## Next Steps' "$logfile" || \
           grep -q '## Next Exploration Steps' "$logfile"; then

            echo "Found task content in $(basename "$logfile")"
            found_any=true

            # Extract content between task headers and next header
            CONTENT=$(sed -n '/^## (Follow[- ]*Up[[:space:]]*Tasks?\|Recommendations?\|Next[[:space:]]*Steps?\|Next[[:space:]]*Exploration[[:space:]]*Steps)/,/^## /p' "$logfile" |
                       grep -E '^[-*] [A-Z]|^[0-9]+\. [A-Z]' |
                       head -3)

            if [ -n "$CONTENT" ]; then
                echo "$CONTENT" | while IFS= read -r task_line; do
                    # Clean up the task line to get title
                    TASK_TITLE=$(echo "$task_line" | sed 's/^[-*] [[:space:]]*//' | sed 's/^[0-9]\+\. [[:space:]]*//')

                    if [ -n "$TASK_TITLE" ]; then
                        # Create slug from title
                        SLUG=$(echo "$TASK_TITLE" | tr '[:upper:]' '[:lower:]' | tr -s ' ' '-' | sed 's/[^a-z0-9-]//g')

                        # Create task filename with date
                        TASK_FILE="$TASKS_DIR/$(date +%Y-%m-%d)-$SLUG.md"

                        # Only create if doesn't already exist
                        if [ ! -f "$TASK_FILE" ]; then
                            echo "---" > "$TASK_FILE"
                            echo "kind: task" >> "$TASK_FILE"
                            echo "slug: \"task:$SLUG\"" >> "$TASK_FILE"
                            echo "title: \"$TASK_TITLE\"" >> "$TASK_FILE"
                            echo "status: open" >> "$TASK_FILE"
                            echo "description: \"Extracted from $(basename "$logfile")\"" >> "$TASK_FILE"
                            echo "" >> "$TASK_FILE"
                            echo "## Source" >> "$TASK_FILE"
                            echo "" >> "$TASK_FILE"
                            echo "- Log: $(basename "$logfile")" >> "$TASK_FILE"
                            echo "- Original: $task_line" >> "$TASK_FILE"

                            echo "Created task: $TASK_FILE"
                        fi
                    fi
                done
            fi
        fi
    fi
done

if [ "$found_any" = false ]; then
    echo "No task sections found in log files."
fi

echo 'Task extraction scan complete.'