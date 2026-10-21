---
Title: Instructions for AI Coding Agents
Author: Weihuang Wong
Date: 2026-10-21
---

# Background

Analysis of LaLonde dataset.

# How we work

## Organization

If these folders aren't present, create them:

- `code/` — programs.
- `data/` — raw source data.
- `docs/` — background documents and references.
- `output/` — artifacts created by the workflow.
- `logs/` — one log file per agent session.

## Documenting what we did

When processing or analyzing data, write programs to `code/`. Show all work 
needed to reproduce the work.

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

## Versioning

After completing a meaningful change -- such as adding a feature, fixing
an analysis error, or updating a processing step -- offer to save a Git
checkpoint. Briefly summarize what changed and ask:
"Would you like me to commit these changes as a checkpoint?"

If the user agrees:
- If needed, initialize a Git repository after checking that the project
  is not already inside one.
- Commit only files relevant to the change. Exclude confidential data,
  credentials, and temporary files.
- Use a clear commit message describing the change.
- Preserve unrelated work and do not push to a remote.
