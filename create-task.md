# Task Creation Instructions

Create tasks for features, bugs, enhancements. For new projects/major components, use `create-prd.md`.

## Process

1. **Receive request**: User describes work.

2. **Clarify** (2-4 questions, reach 95% certainty):
   - Scope boundaries
   - Expected behavior
   - Edge cases
   - Acceptance criteria

3. **Get ID**: Read `tasks/next-ids.md`

3b. **Verify available**: `tasks/details/<id>.md` and `archives/*/<id>.md` must not exist, ID not in `tasks/index.md`. If collision: repeat step 3.

4. **Create files**:

   Check the project's agent instructions for `Profile:` line. Use `profiles/<profile>/task-fields.md` for deliverable label and done criteria defaults.

   a) `tasks/index.md`: `- [ ] <id> brief description`

   b) `tasks/details/<id>.md`:
   ```markdown
   # <id>: Title
   State: pending

   ---

   **Context**: [Why this exists, all background needed]

   **Dependencies**: [None | task IDs or external requirements]

   **[Deliverable label from profile]**: Create: [items] | Update: [items]

   **Steps**:
   1. [Action]
   2. [Action]

   **Done when**:
   - [ ] [Criterion]
   - [ ] [Default criteria from profile]

   **Notes**: [Edge cases, constraints - optional]
   ```

   c) `tasks/next-ids.md`: +5 top-level, +0.5 subtask

5. **Confirm**: Present summary, ask if changes needed.

## Guidelines

- Self-contained: include all context, never require reading other files
- Context captures "why" not just "what"
- Specific acceptance criteria
- List all files touched
