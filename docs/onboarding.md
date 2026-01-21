# Onboarding an Existing Project

Guide for adding prdwise to a project that's already underway.

## Prerequisites

- Existing project with or without version control
- Mercurial installed ([installation guide](https://www.mercurial-scm.org/wiki/Download))
- prdwise cloned to `~/.prdwise/` or `./prdwise/`
- Project directory accessible

## Choose Installation Approach

### Shared Install (Recommended)

Clone prdwise once, use across all projects:

```bash
hg clone https://heptapod.host/prdwise/prdwise ~/.prdwise
```

**Pros:**
- One installation for all projects
- Easy to update (pull once, benefits all projects)
- Minimal disk usage

**Cons:**
- All projects use same prdwise version

### Per-Project Install

Clone prdwise into each project:

```bash
cd your-project
hg clone https://heptapod.host/prdwise/prdwise prdwise/
```

**Pros:**
- Different versions per project if needed
- Self-contained project

**Cons:**
- More disk usage
- Update each project separately

## Run Setup

From your project root:

```bash
~/.prdwise/setup.sh      # shared install
# or: ./prdwise/setup.sh  # per-project install
```

The script creates prdwise structure without touching your existing code.

## Understanding the Created Structure

### tasks/

Task tracking lives here:

- `index.md` - Active tasks list (what's in progress)
- `next-ids.md` - ID allocation by category (o5, f10, a15, etc.)
- `details/` - Individual task files with state

### specs/

Product Requirements Documents (PRDs) and specs:

- `prd-*.md` - Project definitions
- `article-*.md` - Article briefs (if using writing profile)

### docs/

Project documentation:

- `tech-stack.md` - **Critical step:** Define your tech stack
- Other project docs as needed

### CLAUDE.md / AGENTS.md / WARP.md 

Agent instructions. Your AI editor reads this to understand prdwise conventions.

## Configure Tech Stack (Critical)

**Why this matters:** The AI needs to know what tools you use. Without this, it may hallucinate commands or suggest wrong packages.

Edit `docs/tech-stack.md`:

Example file
```markdown
# Tech Stack

## Languages
- Python 3.11
- JavaScript (Node 20)

## Package Management
- pip (Python)
- npm (JavaScript)

## Frameworks
- Flask 3.0 (backend)
- React 18 (frontend)

## Database
- PostgreSQL 15

## Testing
- pytest (Python)
- Jest (JavaScript)
```

Be specific. "npm" is better than "Node package manager." Version numbers help.

## First Steps with Existing Work

### Document Existing Work as PRDs

If you have features in progress, document them:

```
You: Create a PRD for the user authentication system we're building

AI: I'll create a PRD. Reading ~/hg/prdwise/create-prd.md...
    [Guides you through documenting the feature]
    Created specs/prd-auth-system.md
```

### Break Into Tasks

Generate tasks from the PRD:

```
You: Generate tasks from specs/prd-auth-system.md

AI: Reading ~/hg/prdwise/generate-tasks.md...
    Created 5 tasks:
    - f12: OAuth2 provider integration
    - f17: User database schema
    - f22: Session management
    ...
```

### Mark Completed Work

If some work is done, mark tasks as completed:

```
You: f12 and f17 are already done. Update their state.

AI: Marking f12 and f17 as completed...
    Updated tasks/index.md
```

Or use the T CLI:

```bash
T e f12   # Edit task, add completion notes
```

### Resume with State Tracking

From now on, the AI knows your project state:

```
You: Let's continue f22

AI: Reading tasks/details/f22.md...
    Task: Session management
    State: Not started
    Dependencies: f12 (complete), f17 (complete)
    Starting implementation...
```

## Version Control Integration

### What to Commit

Commit prdwise structure to your repo:

```bash
# Git
git add tasks/ specs/ docs/ CLAUDE.md
git commit -m "Add prdwise task management"

# Mercurial
hg add tasks/ specs/ docs/ CLAUDE.md
hg commit -m "Add prdwise task management"
```

### No VCS

prdwise works fine without version control. Just create the files and work.

## Zero-Token Task Management

Install the T CLI (setup.sh prompts for this):

```bash
# Add to ~/.bashrc or ~/.zshrc
export PATH="$PATH:$HOME/.prdwise/scripts"
```

Then manage tasks without tokens:

```bash
T l        # List active tasks
T d f22    # Show details for task f22
T e f22    # Edit task f22
T s f22    # Check state/progress
```

## Migration Strategies

### Gradual Adoption

Start small:
1. Use prdwise for new features only
2. Keep existing workflow for bug fixes
3. Expand as you get comfortable

### Full Migration

Document everything:
1. Create PRDs for major features
2. Generate tasks for all in-progress work
3. Mark completed tasks
4. Resume from current state

### Hybrid Approach

Use prdwise selectively:
- Complex features → Full PRD + tasks
- Simple fixes → Single task
- Refactoring → Task with state tracking

## Common Questions

**Q: Can I use prdwise with my existing task tracker?**

Yes. prdwise is just markdown files. Many teams use both:
- GitHub Issues for team collaboration
- prdwise tasks for AI context

**Q: What if I'm mid-feature?**

Create a task for it:
```
You: Create task for the authentication feature I'm working on. I've completed the OAuth integration, working on session management now.

AI: Created tasks/details/f12.md
    State: OAuth complete, session management in progress
```

**Q: Do I need to change my project structure?**

No. prdwise adds `tasks/`, `specs/`, and `docs/` but doesn't touch your code.

**Q: Works with monorepos?**

Yes. Run setup at the repo root. Tasks can reference any package.

## Next Steps

You're onboarded! Start working:

| What you want | Tell your AI |
|---------------|--------------|
| Document existing work | "Create a PRD for the [feature] we're building" |
| New feature | "New feature: Add dark mode support" |
| Bug fix | "New task: Fix the login timeout bug" |
| Continue in-progress work | "Let's continue f22" |

## Learn More

- [File Reference](file-reference.md) - All prdwise files explained
- [Task Management Guide](../task-management-guide.md) - Full explanation with rationale
- [Quick Setup](setup-experienced.md) - Reference for experienced users
- [Beginner Guide](setup-beginners.md) - Detailed walkthrough
