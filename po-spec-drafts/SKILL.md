---
name: po-spec-drafts
description: >-
  Guides working markdown specs, analytics notes, and split-ticket writeups before or alongside Jira—versioned drafts with clear titles and ticket references. Use when capturing requirements outside canonical templates, intsrc/analytics specs, or when the user mentions drafts, working docs, or specs not yet in Jira.
---

# Spec drafts and working documents

## When

- Capturing **requirements**, **analytics specs**, or **split-ticket** notes before or after Jira creation.
- You need **markdown** that is **not** the canonical template but still links to tickets and stakeholders.

## Outcomes

- Versioned drafts in a dedicated folder (e.g. `drafts/`) with clear titles; **Jira keys** referenced when they exist.

## Conventions

1. **Naming** — Include initiative or ticket key in the filename when known (e.g. `PROJ-123-feature-name.md`).
2. **One source of truth** — Prefer linking to Jira for status; the draft holds narrative, open questions, and AC drafts.
3. **Do not** enumerate every draft in a long index—use **folder listing** and filenames as the index.
4. **Patterns** — Common patterns:
   - Analytics / internal search (`intsrc`) specs
   - Parent ticket with **BE / UI / CA / XD / VD** split summaries
   - T1 / automation or tooling ideas before formal intake

## Promotion path

When ready, promote content into **formal Jira descriptions** using **[po-ticketing](../po-ticketing/SKILL.md)** and **[po-jira-confluence-mcp](../po-jira-confluence-mcp/SKILL.md)**.

## See also

- **[po-ticketing](../po-ticketing/SKILL.md)** — DoR-aligned ticket bodies.
- **[po-jira-confluence-mcp](../po-jira-confluence-mcp/SKILL.md)** — Creating issues when MCP allows.
