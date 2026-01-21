# PRD Creation Instructions

Agent instructions for generating Product Requirement Documents.

A PRD defines **what a product should do** - the complete requirements for a product or major component. Use this for project-level planning, not individual tasks.

---

## When to Use

Create a PRD when:
- Starting a new project (define the whole product)
- Major new component or subsystem
- Significant redesign of existing functionality
- User says "New project:" and describes what they want to build

Use `create-task.md` instead for:
- Individual features in an existing project
- Bug fixes
- Small enhancements
- Tasks already specified in `tasks/details/`

---

## Process

### Step 1: Receive Initial Prompt

User provides brief product/project description.

### Step 2: Ask Clarifying Questions

Ask questions, preferable 3-5, focused on **what** and **why** (not how) until you have 95% certainty that you understand what the user is trying to do.

Format:
```
Before creating the PRD, I need to clarify a few things:

1. [Question about scope/boundaries]
   a) Option A
   b) Option B
   c) Other

2. [Question about user needs]
   a) Option A
   b) Option B

3. [Question about success criteria]
   a) Option A
   b) Option B
```

Focus questions on:
- Problem definition (what problem does this solve?)
- Core functionality (what must it do vs nice-to-have?)
- Scope boundaries (what is explicitly NOT included?)
- Success criteria (how do we know it works?)
- Testing expectations (unit tests? integration? E2E? coverage level?)

Wait for answers before proceeding.

### Step 3: Generate PRD

Create `specs/prd-<product-name>.md` using the base template below.

**Profile sections**: Check the project's agent instructions for `Profile:` line. If set, read the corresponding `profiles/<profile>/prd-sections.md` and include those sections after the base template sections.

Note: These directories may already exist if user ran `setup.sh`. Only create if missing:
- `tasks/` (with `details/`, `backlog/`, `cancelled/`)
- `specs/`
- `docs/`

### Step 4: Confirm with User

Present PRD summary. Ask if changes needed before task generation.

---

## PRD Template

```markdown
# PRD: [Product Name]

## Overview
[2-3 sentences: what this product does and why it matters]

## Goals
[Measurable objectives - what success looks like]
- Goal 1
- Goal 2

## User Stories
[Who uses this and what they need]
- As a [role], I want [capability] so that [benefit]
- As a [role], I want [capability] so that [benefit]

## Functional Requirements
[Explicit, numbered requirements. Assume reader is junior developer.]
1. The system shall...
2. The system shall...
3. When [condition], the system shall...

## Non-Goals
[Explicitly out of scope for this work]
- Not included: X
- Not included: Y

## Technical Considerations
[Architecture, integrations, constraints - skip for non-technical projects]
- Must integrate with...
- Constraint: ...

## Success Metrics
[How to measure if product works]
- Metric 1
- Metric 2

[INSERT PROFILE-SPECIFIC SECTIONS HERE - see profiles/<profile>/prd-sections.md]

## Open Questions
[Unresolved items needing input]
- Question 1
- Question 2

## Approval Checklist
- [ ] All requirements are numbered and testable
- [ ] Non-goals clearly exclude common assumptions
- [ ] Open questions won't block task generation
```

---

## After PRD Approval - MANDATORY NEXT STEP

**STOP: Do NOT proceed to implementation.**

After user confirms PRD is complete:
1. Generate tasks using `generate-tasks.md`
2. Get user approval on task list
3. Only then start first task

Implementation without tasks is prohibited. Each piece of work must be tracked in `tasks/index.md`.

---

## Writing Guidelines

- Use explicit, unambiguous language
- Assume reader is a junior developer
- Number requirements for easy reference
- Avoid jargon without explanation
- Separate "must have" from "nice to have"
- Include concrete examples where helpful
