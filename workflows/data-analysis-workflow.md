# Data Analysis Prompts

Agent instructions for data analysis and reporting tasks.

## How to Use

1. Tell the agent to read this file: "Read data-analysis-prompts.md"
2. Describe what you need: "Analyze trends in /data/sales.csv"
3. Agent will ask clarifying questions based on the methodology below
4. Agent follows the documented process and outputs in standard format

---

## When to Use

- Analyzing logs, metrics, or usage data
- Generating reports from datasets
- Identifying trends or anomalies
- Summarizing survey or feedback data
- Comparing test results or benchmarks

---

## Analysis Types

### Trend Analysis

When user requests trend analysis:

**1. Gather inputs:**
- Data source (file path or inline data)
- What the data represents
- Time period covered
- What insights they need

**2. Perform analysis:**
- Generate summary statistics
- Identify key trends (growth, decline, seasonality)
- Flag anomalies or outliers
- Note correlations if multiple variables

**3. Output:**
Use Summary Report format. Include visualization recommendations.

---

### Log Analysis

When user requests log analysis:

**1. Gather inputs:**
- Log source (file path or inline)
- What system/service generated the logs
- Time window of interest
- Specific concerns (errors, performance, security)

**2. Perform analysis:**
- Count error frequency and patterns
- Identify performance degradation signals
- Flag unusual behavior or security anomalies
- Build timeline of significant events

**3. Output:**
Top issues by frequency, timeline of events, recommended actions.

---

### Usage Metrics

When user requests usage analysis:

**1. Gather inputs:**
- Data source
- What product/feature the data covers
- User segments if applicable
- Specific questions to answer

**2. Perform analysis:**
- Identify most/least used features
- Find usage patterns by segment, time, or region
- Locate drop-off points in user flows
- Correlate factors with retention

**3. Output:**
Feature usage rankings, pattern insights, drop-off analysis, retention factors.

---

### Performance Comparison

When user requests benchmark comparison:

**1. Gather inputs:**
- Data for version/variant A
- Data for version/variant B
- What changed between versions
- Success metrics to compare

**2. Perform analysis:**
- Side-by-side metric comparison
- Calculate statistical significance of differences
- Identify regressions and improvements
- Determine overall winner or mixed results

**3. Output:**
Use Comparison Report format. Include recommendation.

---

### Survey/Feedback Analysis

When user requests feedback analysis:

**1. Gather inputs:**
- Feedback data source
- What it contains (ratings, text responses, segments)
- What decisions this will inform

**2. Perform analysis:**
- Calculate overall sentiment/satisfaction score
- Extract key themes from text responses
- Break down by user segment if applicable
- Identify actionable patterns

**3. Output:**
Sentiment score, theme summary, segment breakdown, action items.

---

### Bug Prioritization

When user requests bug prioritization:

**1. Gather inputs:**
- Bug report data (severity, frequency, affected users, age)
- Engineering effort estimates if available
- Business priorities or constraints

**2. Perform analysis:**
- Score by user impact (affected users × severity)
- Factor in engineering effort
- Consider strategic importance
- Group by theme if patterns emerge

**3. Output:**
Prioritized list with reasoning, sprint allocation recommendation, bugs to defer/close.

---

### Anomaly Detection

When user requests anomaly detection:

**1. Gather inputs:**
- Time-series data source
- Normal baseline description (expected patterns)
- Time window to analyze
- Known external events that might correlate

**2. Perform analysis:**
- Flag sudden spikes or drops
- Identify gradual drift from baseline
- Note periodic anomalies
- Correlate with external events if provided

**3. Output:**
List of anomalies with timestamps, severity assessment, possible causes.

---

## Output Formats

### Summary Report

```markdown
## Analysis: [Title]

### Key Findings
1. [Most important finding]
2. [Second finding]
3. [Third finding]

### Data Summary
- Records analyzed: [N]
- Time period: [range]
- Key metrics: [list with values]

### Recommendations
- [Action item 1]
- [Action item 2]

### Appendix
[Detailed tables or charts]
```

### Comparison Report

```markdown
## Comparison: [A] vs [B]

| Metric | A | B | Change |
|--------|---|---|--------|
| [metric] | [value] | [value] | [+/-X%] |

### Winner: [A/B/Mixed]

### Details
[Explanation of significant differences]
```

---

## Integration with Task System

After analysis, create follow-up tasks as needed:

- **Data quality issues** → cleanup task
- **Performance problems** → optimization task
- **Feature insights** → product task in backlog
- **Security concerns** → priority fix task
