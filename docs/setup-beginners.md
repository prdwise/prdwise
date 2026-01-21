# Beginner Setup Guide

Complete walkthrough for users new to prdwise or coding with AI (agentic editors)

## What is prdwise?

AI coding assistants lose context between sessions. You explain your project, make progress, then start over next time. prdwise fixes this with markdown files that preserve state and structure work for how AI agents actually operate.

## How It Works

```
Spec (what to build) → Tasks (small pieces) → State (where you left off)
```

1. **Spec first** - Write a Product Requirements Document (PRD) defining what you're building
2. **Break it down** - Generate focused tasks sized for AI context windows
3. **Track state** - Each task file records progress, so sessions resume instantly
4. **Implement** - Work task by task with full context preserved

## Why It Matters

- **Session continuity** - Task state files capture exactly where you left off; agents resume without re-explaining
- **Token efficiency** - Short task IDs (`b45`) and lazy loading (`details/` folder) mean you only pay for what you need
- **Agent-managed overhead** - Agents handle the ID generation (`+5` increments) and file management. You just describe the work
- **Load on demand** - Index lists all tasks; details load only when needed

## Installation Walkthrough

### Install Mercurial

First, install Mercurial if you don't have it:

- **Windows:** Download installer from [official downloads page](https://www.mercurial-scm.org/wiki/Download)
- **Mac:** Use Homebrew (`brew install mercurial`) or [download installer](https://www.mercurial-scm.org/wiki/Download)
- **Linux:** Install via package manager:
  ```bash
  # Ubuntu/Debian
  sudo apt-get install mercurial

  # Fedora
  sudo dnf install mercurial

  # Arch
  sudo pacman -S mercurial
  ```

Verify installation:
```bash
hg --version
```

For detailed instructions, see the [official installation guide](https://www.mercurial-scm.org/wiki/Download) or [Atlassian's setup guide](https://support.atlassian.com/bitbucket-cloud/docs/install-and-set-up-mercurial/).

### Where to Clone

**Shared location (recommended):**
```bash
hg clone https://heptapod.host/prdwise/prdwise ~/.prdwise
```

This installs prdwise once and all your projects can use it.

**Per-project:**
```bash
cd your-project
hg clone https://heptapod.host/prdwise/prdwise prdwise/
```

This installs prdwise inside your project. Useful if you need different versions per project.

### Run Setup

Navigate to your project directory and run the setup script:

```bash
cd ~/your-project
~/.prdwise/setup.sh      # global install
# or: ./prdwise/setup.sh  # per-project install
```

The script will:

1. **Create directory structure:**
   - `tasks/` - Where task tracking happens
   - `specs/` - Where you define what to build (PRDs)
   - `docs/` - Project documentation

2. **Set up task tracking:**
   - `tasks/index.md` - List of active tasks
   - `tasks/next-ids.md` - ID allocation for different task types
   - `tasks/details/` - Individual task specifications with state

3. **Configure tech stack:**
   - `docs/tech-stack.md` - **Critical:** Tells the AI what tools you use (prevents hallucinations)

4. **Copy templates:**
   - `CLAUDE.md` - Instructions your AI reads to understand prdwise

5. **Install T CLI:**
   - Prompts to add `~/.prdwise/scripts` to your PATH
   - Allows zero-token task management

## What Gets Created

```
your-project/
├── CLAUDE.md              # Agent instructions
├── tasks/
│   ├── index.md          # Active tasks list
│   ├── next-ids.md       # ID allocation
│   └── details/          # Task specifications
├── specs/                # PRDs go here
└── docs/
    └── tech-stack.md     # Your tech stack
```

## First Task Walkthrough

### Example Session

```
You: New feature: Add user authentication

AI: I'll create a task for this. Reading tasks/next-ids.md...
    Created tasks/details/f12.md with:
    - OAuth2 integration steps
    - Database schema changes
    - API endpoint modifications

You: [Next day] Let's continue f12

AI: Reading tasks/details/f12.md...
    State: Step 2 of 4 complete. Database schema done.
    Resuming with API endpoint modifications.
```

No re-explaining. No lost context. Just continue.

### Creating a PRD

For larger projects, start with a PRD:

```
You: New project: Build a CLI tool that manages TODO lists with priorities and due dates

AI: I'll create a PRD for this. Reading ~/hg/prdwise/create-prd.md...
    [Guides you through defining the project]
    Created specs/prd-todo-cli.md
```

### Generating Tasks from PRD

Once you have a PRD, break it into tasks:

```
You: Generate tasks from specs/prd-todo-cli.md

AI: Reading ~/hg/prdwise/generate-tasks.md...
    Created 8 tasks:
    - f15: Core TODO data structures
    - f20: Add command implementation
    - f25: List/filter commands
    ...
```

### Working with Task State

Task files include state headers that track progress:

```markdown
# f12: Add user authentication
State: Step 2 of 4 - Database schema complete

## Progress
- [x] Research OAuth2 providers
- [x] Design database schema
- [ ] Implement API endpoints
- [ ] Add frontend integration
```

The AI reads this and knows exactly where to continue.

## Zero-Token Task Management

Use the `T` CLI to manage tasks without spending tokens or waiting for an agent:

```bash
T l        # List active tasks
T d b45    # Show details for task b45
T e b45    # Edit task b45 in your editor
T s b45    # Check current state/progress
T h        # Show all commands
```

This keeps your context window clean and your wallet happy. The agent focuses on doing the work, while you manage the plan for free.

## Specialized Workflows

Beyond features and bug fixes, prdwise includes workflows for common tasks:

- **[Debugging](../workflows/debugging-workflow.md)** - Systematic root cause analysis
  - Reproduce the issue
  - Form hypotheses
  - Test systematically
  - Verify the fix

- **[Data Analysis](../workflows/data-analysis-workflow.md)** - Reproducible analysis
  - Load and validate data
  - Explore patterns
  - Create visualizations
  - Document findings

- **[Visualization](../workflows/visualization-workflow.md)** - Create diagrams
  - Choose appropriate chart types
  - Generate code
  - Refine visuals

## Editor Integration
Use the setup.sh script to create an agent file for your agentic editor

## Start Building

You're ready! Tell your AI what you want to build:

| What you want | Tell your AI |
|---------------|--------------|
| New project | "New project: Build a CLI tool that..." |
| New feature | "New feature: Add dark mode support" |
| Bug fix | "New task: Fix the login timeout bug" |

Your AI will read the prdwise instructions and guide you through the process.

## Learn More

- [File Reference](file-reference.md) - All prdwise files explained
- [Task Management Guide](../task-management-guide.md) - Full explanation with rationale
- [Standards](../standards.md) - Spec-first workflow guidelines
