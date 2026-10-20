---
Title: Instructions for AI Coding Agents
Author: Weihuang Wong
Date: 2026-09-12
---

# Background


# How we work

## Organization

If these folders aren't present, create them:

- `code/` — programs.
- `data/` — raw source data.
- `docs/` — background documents and references.
- `output/` — artifacts created by the workflow.
- `logs/` — one log file per agent session.

## Documenting what we did

For each agent session, write a log file `logs/{YYYY-MM-DD}_{topic}.md`. Record
what was attempted, what worked, what did not, and why. This is a lab notebook
so that future sessions do not retread old ground.

## Decision log
When a change affects outputs or methodology, append an entry to
docs/DECISIONS.md: date, what changed, why, who requested it,
alternatives considered. Ask me for the "why" if I haven't said.

## Environment

Use R.

At the top of each program file there must be a header that describes the file.
Follow this example:

```r
################################################################################
# Program: [Purpose of the program]
# Author: Weihuang Wong
# Date: [Date the program was last modified]
# Inputs: [List of inputs, as command-line arguments]
# Outputs: [List of outputs]
# Notes:
################################################################################
```