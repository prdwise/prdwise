# Debugging Workflow

Agent instructions for systematic debugging sessions.

## How to Use

1. Tell the agent to read this file: "Read debugging-workflow.md"
2. Describe your issue: "API is returning 500 errors intermittently"
3. Agent will guide you through the debugging structure below
4. Agent documents findings and creates follow-up tasks

---

## When to Use

- Production issues or intermittent failures
- Performance degradation
- Unexpected behavior that requires investigation
- Post-incident analysis

---

## Debugging Session Structure

### 1. Problem Definition

When user reports an issue, gather:

- **Symptom**: What is happening?
- **Expected**: What should happen?
- **Impact**: Users affected, severity
- **First observed**: When did this start?
- **Frequency**: Always, intermittent, under load?

Document in this format:
```markdown
## Problem Statement
- **Symptom**: [description]
- **Expected**: [description]
- **Impact**: [scope and severity]
- **First observed**: [timestamp]
- **Frequency**: [pattern]
```

---

### 2. Context Gathering

Collect relevant information:

- **Recent changes**: Deployments, config changes, dependency updates
- **Logs**: Relevant log snippets or file paths
- **Metrics**: CPU, memory, latency, error rates
- **Reproduction**: Steps to reproduce, if known

---

### 3. Hypothesis Formation

List potential causes ranked by likelihood:

```markdown
## Hypotheses
1. [Most likely cause] - Evidence: [why you think this]
2. [Second candidate] - Evidence: [supporting observations]
3. [Third candidate] - Evidence: [what points here]
```

---

### 4. Investigation

For each hypothesis, follow this pattern:

**Test**: What to check to confirm or rule out
**Findings**: Results of the test
**Conclusion**: Confirmed / Ruled out / Needs more data

Work through hypotheses in order until root cause is identified.

---

### 5. Resolution

Once root cause identified, document:

```markdown
## Root Cause
[Clear explanation of what went wrong]

## Fix
[What was done to resolve it]

## Verification
[How you confirmed the fix works]

## Prevention
[What changes prevent recurrence - tests, monitoring, etc.]
```

---

## Investigation Types

### Initial Investigation

When user reports a new issue:

**1. Gather inputs:**
- System/service affected
- Symptom description
- Recent changes to the system
- Error messages if available
- When it started

**2. Analyze:**
- Identify most likely causes based on symptoms
- Suggest diagnostic steps in order of likelihood
- Request specific logs or metrics if needed

---

### Log Analysis

When user provides logs for analysis:

**1. Gather inputs:**
- Log source (file path or inline)
- System that generated the logs
- Time window of the issue
- What to look for (errors, timing, patterns)

**2. Analyze:**
- Error patterns and frequency
- Timing correlations
- Anomalies before the failure
- Stack traces or error codes

---

### Performance Investigation

When user reports performance issues:

**1. Gather inputs:**
- Service affected
- Type of issue (latency, throughput, resource usage)
- Metrics available (CPU, memory, IO, request times)
- Recent changes
- Load patterns

**2. Analyze:**
- Identify likely bottlenecks
- Compare against baselines
- Suggest profiling or monitoring to add
- Recommend optimizations

---

### Edge Case Discovery

When user wants to find untested scenarios:

**1. Gather inputs:**
- Feature or system under test
- Current test coverage
- Known failure modes

**2. Brainstorm:**
- Boundary conditions
- Concurrent access scenarios
- Resource exhaustion cases
- Invalid input handling
- Network failure modes
- Timing/race conditions

---

### Post-Incident Analysis

When conducting a post-mortem:

**1. Gather inputs:**
- Incident duration (start to resolution)
- Impact (users/systems affected)
- Timeline of key events
- Actions taken during incident

**2. Structure analysis:**
- Root cause (what went wrong)
- Contributing factors (why it happened)
- Detection gaps (why it wasn't caught earlier)
- Prevention measures (how to avoid recurrence)

---

## Integration with Task System

After debugging, create follow-up tasks:

1. **Immediate fix** - task in `tasks/details/`
2. **Test coverage** - prevent regression
3. **Monitoring** - detect earlier next time
4. **Documentation** - update runbooks

Update task state file with debugging session outcome.
