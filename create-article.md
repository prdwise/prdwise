# Article Creation Instructions

Agent instructions for creating article briefs for technical blog posts and tutorials.

---

## When to Use

Create an article brief when:
- Starting a new blog post or tutorial
- User has a topic idea that needs structure
- Planning a technical article or how-to guide
- Writing content for a standalone blog or publication

## When to Skip

Skip the brief for:
- Documentation within a software project (those are just tasks)
- Quick updates to existing articles
- Content already fully specified by the user

---

## Process

### Step 1: Receive Topic

User provides a topic idea, question they want to answer, or problem they want to explain.

### Step 2: Ask Clarifying Questions

Ask 3-5 questions focused on **audience** and **scope** until you have 95% certainty about what to write.

Format:
```
Before creating the article brief, I need to clarify a few things:

1. Who is the target audience?
   a) Beginners new to [topic]
   b) Intermediate developers familiar with basics
   c) Advanced practitioners
   d) Other

2. What's the main takeaway?
   a) [Option based on topic]
   b) [Option based on topic]
   c) Other

3. What scope feels right?
   a) Quick overview (500-800 words)
   b) Detailed guide (1500-2500 words)
   c) Comprehensive tutorial (3000+ words)
```

Focus questions on:
- **Audience**: Who is this for? What do they already know?
- **Goal**: What should the reader be able to do after reading?
- **Scope**: How deep should this go? What's out of scope?
- **Format**: Tutorial with code? Conceptual explanation? Comparison?

Wait for answers before proceeding.

### Step 3: Generate Article Brief

Create `specs/article-<slug>.md` using the template in `templates/article-brief-template.md`.

The slug should be URL-friendly: lowercase, hyphens, no special characters.
Example: `specs/article-debugging-go-memory-leaks.md`

### Step 4: Confirm with User

Present brief summary. Ask if changes needed before writing begins.

---

## Style Guide

If the project has `docs/article-style-guide.md`, follow those guidelines for voice, tone, structure, and level-specific writing conventions.

---

## Writing Guidelines

### Structure
- Lead with the problem or hook - why should reader care?
- Front-load value - key insight in first few paragraphs
- Use headers to make scannable
- End with clear next steps or call to action

### Technical Content
- Show, don't just tell - include code examples
- Explain the "why" not just the "how"
- Anticipate common mistakes and address them
- Test all code samples before including

### Clarity
- One idea per paragraph
- Short sentences for complex topics
- Define jargon on first use
- Use analogies for abstract concepts

### Engagement
- Address reader directly ("you")
- Acknowledge difficulty where appropriate
- Provide encouragement at challenging points
- Include practical, immediately usable examples

---

## Integration with Task System

For standalone blog/content projects:
- Article briefs go in `specs/article-<slug>.md`
- Articles can be tracked as tasks (a5, a10) if using task system
- Use state files for multi-session writing

For software projects with documentation:
- Documentation is just another task category (d5, d10)
- No need for article briefs - use regular task specs
