# Task Generation Instructions

Break PRDs or feature requests into implementable tasks.

## Process

1. **Analyze source**: Read PRD/feature description. Identify core functionality, dependencies, implementation order.

2. **Determine granularity**: Each task should be completable in one session, independently testable, with clear acceptance criteria. Split if: multiple unrelated files, backend+frontend, schema+code.

3. **Order by dependencies**: schema → backend/domain → API → frontend → integration → tests

4. **Create task files** (per `agent-task-rules.md`):
   - Read `tasks/next-ids.md` for ID
   - Add to `tasks/index.md`
   - Create `tasks/details/<id>.md`
   - Update `tasks/next-ids.md`

5. **Validate and present summary**: Confirm coverage of all requirements, no dependency bottlenecks, no gaps between tasks. Present for user approval.

6. **STOP** - Do not implement. User selects task, agent follows `agent-task-rules.md`.

## Task Template

```markdown
# <id>: Title

**Context**: [Why this task exists, background needed for implementation]

**Deps**: [Task IDs or "None"]

**Files**: Create: [paths] | Update: [paths]

**Steps**:
1. [Specific action]
2. [Specific action]

**Done when**:
- [ ] [Criterion]
- [ ] Tests pass
```

## Subtasks

Parent: v100 → Subtasks: v100.0, v100.5 (increment by 0.5)

## Example

Feature: User auth with OAuth

```
[ ] d50  users table migration
[ ] d55  oauth_tokens table migration
[ ] b60  user repository
[ ] b65  OAuth service (Google)
[ ] b70  auth handlers
[ ] b75  auth middleware
[ ] f80  login page
[ ] f85  auth state store
[ ] f90  protected routes
[ ] t25  auth integration tests
```

Prefixes: d=database, b=backend, f=frontend, t=testing

## Category Labels

Group tasks under plain, descriptive headers. Avoid jargon.

Good: "Database Setup", "API Endpoints", "User Interface", "Tests", "Shared Components"
Bad: "Cross-Cutting Concerns", "Infrastructure Layer", "Domain Logic", "Persistence"

If a category name requires software architecture knowledge to understand, simplify it.

## Guidelines

- Tasks must be self-contained: include all context for implementation
- Extract relevant PRD content INTO task - never require reading PRD later
- Keep tasks small enough to complete without context loss
- Always include "Tests pass" in acceptance criteria
- Flag blocking dependencies explicitly
