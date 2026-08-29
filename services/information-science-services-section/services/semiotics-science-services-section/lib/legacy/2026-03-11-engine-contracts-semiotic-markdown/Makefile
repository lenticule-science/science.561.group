SOURCE := spec/semiotic-markdown.md
BUILD_DIR := build
PANDOC ?= pandoc

.PHONY: help html pdf clean

help:
	@printf "%s\n" \
		"Targets:" \
		"  make html   Export $(SOURCE) to HTML" \
		"  make pdf    Export $(SOURCE) to PDF (requires LaTeX)" \
		"  make clean  Remove build outputs"

$(BUILD_DIR):
	@mkdir -p "$(BUILD_DIR)"

html: $(BUILD_DIR)
	@command -v "$(PANDOC)" >/dev/null 2>&1 || { echo "pandoc not found; install pandoc to use this target."; exit 1; }
	@"$(PANDOC)" "$(SOURCE)" -s -o "$(BUILD_DIR)/semiotic-markdown.html"

pdf: $(BUILD_DIR)
	@command -v "$(PANDOC)" >/dev/null 2>&1 || { echo "pandoc not found; install pandoc to use this target."; exit 1; }
	@"$(PANDOC)" "$(SOURCE)" -s -o "$(BUILD_DIR)/semiotic-markdown.pdf"

clean:
	@rm -rf "$(BUILD_DIR)"

