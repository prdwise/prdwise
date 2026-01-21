Mirror of mercurial repo at [PRDwise heptapod](https://heptapod.host/prdwise)
prdwise
==========

AI coding assistants lose context between sessions. You explain your project, make progress, then start over next time. prdwise fixes this with markdown files that preserve state and structure work for how AI agents actually operate.

Works with Claude Code, Cursor, Windsurf, and other AI-assisted editors.

## Why This Matters
- **Session continuity** - Task state files capture exactly where you left off; agents resume without re-explaining
- **Token efficiency** - Framework is designed to minimize context usage. Short task IDs (`b45`) and lazy loading (`details/` folder) mean you only pay for what you need.
- **Agent-managed overhead** - Agents handle the ID generation (`+5` increments) and file management. You just describe the work.
- **Load on demand** - Index lists all tasks; details load only when needed

## What Sets It Apart
Comparison to a few other frameworks

| Feature | prdwise | agent-os | spec-kit | Claude memory | Manual prompts |
|---------|---------|----------|----------|---------------|----------------|
| Session state | Per-task files | No | No | Global, implicit | Copy-paste |
| Dependencies | None (plain markdown) | Shell, YAML | GitHub | N/A | None |
| Task breakdown | Built-in workflow | Manual | Manual | No | No |
| Editor support | Any | Any | Any | Claude only | Any |
| Token efficiency | IDs + lazy loading | Config loading | No | No | No |

## Installation

Choose your path:
- **Experienced users:** [Quick setup guide](docs/setup-experienced.md)
- **New users:** [Beginner setup guide](docs/setup-beginners.md)
- **Existing project:** [Onboarding guide](docs/onboarding.md)

## Workflows

prdwise includes structured workflows for common engineering tasks:

- **[Debugging](workflows/debugging-workflow.md)** - Systematic root cause analysis and fix verification
- **[Data Analysis](workflows/data-analysis-workflow.md)** - Reproducible analysis and reporting
- **[Visualization](workflows/visualization-workflow.md)** - Creating clear diagrams and charts

## VCS Compatibility

Works with Git, Mercurial, or no version control. Plain markdown, no dependencies.

## Learn More

- [File Reference](docs/file-reference.md) - All prdwise files explained
- [Task Management Guide](task-management-guide.md) - Full explanation with rationale
- [Standards](standards.md) - Spec-first workflow guidelines

## Attribution

Draws from [AI Dev Tasks](https://github.com/snarktank/ai-dev-tasks), [Deliberate Agentic Development](https://github.com/Matt-Hulme/deliberate-agentic-development), [Spec-Driven Development](https://github.blog/ai-and-ml/generative-ai/spec-driven-development-using-markdown-as-a-programming-language-when-building-with-ai/), and [OpenAI Academy](https://academy.openai.com/).