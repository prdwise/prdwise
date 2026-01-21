# Development Standards & Agentic Workflow

Standard workflows for defining and implementing features, tailored for agentic development.

## 1. Specification-First Workflow

Before writing code for a significant feature or new application, create a specification file in `specs/`.

### Structure

Create a markdown file (e.g., `specs/feature-name.md`) with:

1. **Goal**: High-level user story and business value
2. **User Stories**: Detailed scenarios (Gherkin or bullet points)
3. **Data Model**: Schema changes (SQL, structs, or types)
4. **API Contract**: Endpoints, methods, request/response examples
5. **Non-Functional Requirements**: Performance, security, constraints

## 2. Agentic Development Prompt

Use this template when tasking an AI agent with implementation:

```text
You are an expert software engineer adhering to the project standards.

**Context**:
1. **Tech Stack**: Refer to `docs/tech-stack.md` (or the Tech Stack section in CLAUDE.md)
2. **Task**: Implement the feature described in `specs/<feature_name>.md`

**Instructions**:
- Read the specification carefully
- Plan the implementation steps (Data layer → Domain logic → API/UI)
- Follow the project's directory structure and conventions
- Use only the libraries defined in the tech stack
- Ensure all code is tested and follows project style guidelines

**Output**:
- Provide a brief plan
- Generate the code changes
```

## 3. General Guidelines

- **Code Style**: Follow the formatting and linting rules defined for your stack
- **Documentation**: Update `docs/` and `specs/` as requirements evolve
- **ADRs**: Record architectural decisions in `docs/adr/` using `adr-template.md`
- **Testing**: Run project test suite before marking tasks complete
- **Validation**: Use linters and type checkers as defined in tech stack

## 4. Tech Stack Definition

Every project should define its tech stack. See `tech-stack-template.md` for a template.
