# Article Style Guide

Guidelines for writing technical articles at different experience levels.

---

## Article Metadata

Every article should define these upfront:

| Field | Description |
|-------|-------------|
| **Target audience** | Who is this for? (role, persona, or context) |
| **Level** | Beginner / Intermediate / Advanced |
| **Prerequisites** | What must the reader already know? |

---

## Level-Specific Guidelines

### Beginner

Write for someone encountering this topic for the first time.

- **No assumed knowledge** - explain foundational concepts
- **Define all terms** on first use
- **Mental models** - provide analogies and frameworks for thinking about the topic
- **Step-by-step instructions** - don't skip steps that seem obvious
- **Explain "why"** - not just "how"
- **"What could go wrong" sections** - anticipate common mistakes and confusion
- **Encourage** - acknowledge when something is tricky

### Intermediate

Write for someone who knows the basics but wants to go deeper.

- **State prerequisites explicitly** - "This assumes familiarity with X"
- **Reference concepts without re-explaining** - link to beginner resources if needed
- **Focus on tradeoffs** - when to use X vs Y
- **Alternatives** - show different approaches and when each fits
- **Practical patterns** - real-world usage, not just theory
- **Edge cases** - mention them briefly, link to advanced content

### Advanced

Write for practitioners who want depth.

- **Skip fundamentals** - your reader knows them
- **Deep dives** - implementation details, internals, architecture
- **Edge cases and gotchas** - the stuff that bites experienced developers
- **Performance and optimization** - benchmarks, profiling, tuning
- **Jargon acceptable** - use precise technical terminology
- **Trade-offs at scale** - production considerations, failure modes

---

## Voice & Tone

- **Direct** - get to the point, don't hedge unnecessarily
- **Active voice** - "The function returns X" not "X is returned by the function"
- **Second person** - address the reader as "you"
- **Confident but not condescending** - know your stuff, respect your reader
- **No filler** - avoid "basically," "simply," "obviously," "just"

---

## Structure

### Opening

- **Hook in the first paragraph** - why should the reader care?
- **Front-load value** - key insight early, not buried at the end
- **Set expectations** - what will they learn? what won't be covered?

### Body

- **Scannable headers** - readers skim; make it easy
- **One idea per section** - don't overload
- **Progress logically** - build on previous sections

### Closing

- **Summarize key points** - reinforce what they learned
- **Clear next steps** - what should they do or read next?
- **No new information** - conclusions summarize, they don't introduce

---

## Code Examples

- **Complete and runnable** - copy-paste should work
- **Explain before showing** - set up what the code does, then show it
- **Include expected output** - show what happens when you run it
- **Test before publishing** - actually run your examples
- **Minimal and focused** - show the concept, not your entire codebase
- **Syntax highlighting** - use proper language tags in fenced code blocks

---

## Formatting Conventions

### Callouts

Use for important information that breaks the flow:

- **Warning** - for gotchas, common mistakes, or things that could break
- **Tip** - for helpful shortcuts or non-obvious features
- **Note** - for additional context that's useful but not critical

### Lists vs Prose

- **Lists** for steps, requirements, options
- **Prose** for explanations, concepts, narratives

### Links

- **Link sparingly** - every link is a potential exit
- **Inline links** for references the reader might need
- **"Further reading" section** at the end for deeper exploration

---

## Brevity

Respect your reader's time:

- **Say it once** - don't repeat the same point in different words
- **Cut the warm-up** - delete throat-clearing introductions
- **Shorter is harder** - edit ruthlessly
- **Default to shorter** - if unsure, cut it

| Level | Target Length |
|-------|---------------|
| Quick overview | 500-800 words |
| Standard guide | 1500-2500 words |
| Comprehensive tutorial | 3000+ words |

---

## [CUSTOMIZE] Project-Specific Rules

Add your project's specific conventions here:

- Terminology preferences
- Brand voice specifics
- Content categories and their conventions
- Publishing workflow notes
