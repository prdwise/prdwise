#!/usr/bin/env bash
# prdwise setup script - initializes task management in a project

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

info() { echo -e "${GREEN}==>${NC} $1"; }
warn() { echo -e "${YELLOW}==>${NC} $1"; }
error() { echo -e "${RED}Error:${NC} $1"; exit 1; }

# Detect prdwise location from script's own directory
PRDWISE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

info "Found prdwise at: $PRDWISE_DIR"

# Check we're in a project directory (not inside prdwise itself)
if [[ "$(pwd)" == "$PRDWISE_DIR" ]] || [[ "$(pwd)" == "$(realpath "$PRDWISE_DIR")" ]]; then
    error "Run this script from your project directory, not from prdwise itself"
fi

# Additional check: detect if we're inside prdwise by looking for its signature files
if [[ -f "agent-task-rules.md" ]] && [[ -f "task-management-guide.md" ]]; then
    error "You appear to be inside the prdwise directory. Run this script from your project directory instead."
fi

# Select project profile
echo ""
echo "What type of project is this?"
echo "  1) Technical  (software, APIs, infrastructure)"
echo "  2) Writing    (articles, content, documentation)"
echo "  3) Business   (operations, marketing, processes)"
echo ""
read -p "Select [1-3]: " -n 1 -r
echo ""

case $REPLY in
    1) PROFILE="technical" ;;
    2) PROFILE="writing" ;;
    3) PROFILE="business" ;;
    *) PROFILE="technical" ;;
esac

info "Using profile: $PROFILE"

# Create directory structure
info "Creating directory structure..."

mkdir -p tasks/details tasks/backlog tasks/cancelled
mkdir -p specs
mkdir -p docs

# Create tasks/index.md from profile
if [[ ! -f "tasks/index.md" ]]; then
    cp "$PRDWISE_DIR/profiles/$PROFILE/index-sections.md" tasks/index.md
    info "Created tasks/index.md"
else
    warn "tasks/index.md already exists, skipping"
fi

# Create tasks/next-ids.md from profile
if [[ ! -f "tasks/next-ids.md" ]]; then
    cp "$PRDWISE_DIR/profiles/$PROFILE/next-ids.md" tasks/next-ids.md
    info "Created tasks/next-ids.md"
else
    warn "tasks/next-ids.md already exists, skipping"
fi

# Create tasks/backlog/index.md
if [[ ! -f "tasks/backlog/index.md" ]]; then
    cat > tasks/backlog/index.md << 'EOF'
# Backlog

Ideas and future work not yet scheduled.
EOF
    info "Created tasks/backlog/index.md"
else
    warn "tasks/backlog/index.md already exists, skipping"
fi

# Detect existing agent instructions file or ask user to choose
detect_agent_file() {
    for f in CLAUDE.md AGENTS.md .cursorrules .windsurfrules; do
        if [[ -f "$f" ]]; then
            echo "$f"
            return
        fi
    done
    echo ""
}

AGENT_FILE=$(detect_agent_file)

if [[ -z "$AGENT_FILE" ]]; then
    echo ""
    echo "Which AI editor are you using?"
    echo "  1) Claude Code  (CLAUDE.md)"
    echo "  2) Cursor       (.cursorrules)"
    echo "  3) Windsurf     (.windsurfrules)"
    echo "  4) Other/Generic (AGENTS.md)"
    echo ""
    read -p "Select [1-4]: " -n 1 -r
    echo ""

    case $REPLY in
        1) AGENT_FILE="CLAUDE.md" ;;
        2) AGENT_FILE=".cursorrules" ;;
        3) AGENT_FILE=".windsurfrules" ;;
        4) AGENT_FILE="AGENTS.md" ;;
        *) AGENT_FILE="CLAUDE.md" ;;
    esac

    if [[ -f "$PRDWISE_DIR/defaults/AGENT-INSTRUCTIONS.md" ]]; then
        cp "$PRDWISE_DIR/defaults/AGENT-INSTRUCTIONS.md" "$AGENT_FILE"
    else
        cp "$PRDWISE_DIR/templates/AGENT-INSTRUCTIONS-template.md" "$AGENT_FILE"
    fi

    # Replace [PATH] and [PROFILE] placeholders
    PRDWISE_PATH="${PRDWISE_DIR/#$HOME/\~}"
    sed -i.bak "s|\[PATH\]|$PRDWISE_PATH|g; s|\[PROFILE\]|$PROFILE|g" "$AGENT_FILE" && rm -f "${AGENT_FILE}.bak"

    info "Created $AGENT_FILE from template"
else
    warn "$AGENT_FILE already exists, skipping"
fi

# Copy tech-stack template -> docs/tech-stack.md
if [[ ! -f "docs/tech-stack.md" ]]; then
    if [[ -f "$PRDWISE_DIR/defaults/tech-stack.md" ]]; then
        cp "$PRDWISE_DIR/defaults/tech-stack.md" "docs/tech-stack.md"
    else
        cp "$PRDWISE_DIR/templates/tech-stack-template.md" "docs/tech-stack.md"
    fi
    info "Created docs/tech-stack.md from template"
else
    warn "docs/tech-stack.md already exists, skipping"
fi

# Copy article style guide for writing profile
if [[ "$PROFILE" == "writing" ]]; then
    if [[ ! -f "docs/article-style-guide.md" ]]; then
        if [[ -f "$PRDWISE_DIR/defaults/article-style-guide.md" ]]; then
            cp "$PRDWISE_DIR/defaults/article-style-guide.md" "docs/article-style-guide.md"
        else
            cp "$PRDWISE_DIR/templates/article-style-guide-template.md" "docs/article-style-guide.md"
        fi
        info "Created docs/article-style-guide.md"
    else
        warn "docs/article-style-guide.md already exists, skipping"
    fi
fi

# Summary
echo ""
info "Setup complete! (profile: $PROFILE)"
echo ""
echo "Directory structure created:"
echo "  tasks/"
echo "  ├── index.md"
echo "  ├── next-ids.md"
echo "  ├── details/"
echo "  ├── backlog/"
echo "  └── cancelled/"
echo "  specs/"
echo "  docs/"
if [[ "$PROFILE" == "writing" ]]; then
    echo "  ├── tech-stack.md"
    echo "  └── article-style-guide.md"
else
    echo "  └── tech-stack.md"
fi
echo "  $AGENT_FILE"
echo ""

# Prompt for customization
echo -e "${YELLOW}Next steps:${NC}"
echo ""
echo "1. Customize your agent instructions:"
echo -e "   ${GREEN}\$EDITOR $AGENT_FILE${NC}"
echo ""
echo "2. Review task categories (adjust prefixes for your project):"
echo -e "   ${GREEN}\$EDITOR tasks/next-ids.md${NC}"
echo ""
echo "3. Define your tech stack:"
echo -e "   ${GREEN}\$EDITOR docs/tech-stack.md${NC}"
echo ""
echo "4. (Optional) Create symlink for auto-updating agent rules:"
echo -e "   ${GREEN}ln -s $PRDWISE_DIR/agent-task-rules.md docs/agent-task-rules.md${NC}"
echo ""

warn "IMPORTANT: The copied files contain [CUSTOMIZE] sections you must update!"
echo ""

# Ask if user wants to edit now
read -p "Open $AGENT_FILE in \$EDITOR now? [Y/n] " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
    ${EDITOR:-vi} "$AGENT_FILE"
fi

echo ""
echo -e "${YELLOW}Task Categories${NC}"
echo "tasks/next-ids.md defines how tasks are organized. Each category gets a prefix:"
echo "  - 'g' for backend tasks → g5, g10, g15..."
echo "  - 'm' for docs tasks → m5, m10, m15..."
echo ""
echo "Edit to match YOUR project. Delete categories you won't use, rename others."
echo "Example: a CLI tool might only need 'c' (core) and 'm' (docs)."
echo ""
read -p "Edit task categories now? [Y/n] " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
    ${EDITOR:-vi} "tasks/next-ids.md"
fi

read -p "Open docs/tech-stack.md in \$EDITOR now? [Y/n] " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
    ${EDITOR:-vi} "docs/tech-stack.md"
fi

echo ""
info "Done! Start by telling your AI what you want to build."
echo ""
echo "Example prompts:"
echo "  New project:  'New project: I want to build [description]'"
echo "  New feature:  'New feature: Add [description] to this project'"
echo ""
