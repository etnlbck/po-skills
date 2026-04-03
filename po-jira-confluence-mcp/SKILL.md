---
name: po-jira-confluence-mcp
description: >-
  Coordinates Jira and Confluence work via Atlassian MCP when available, with fallbacks when permissions fail. Clarifies Team One vs other Atlassian instances and project keys. Use when creating or updating issues or pages, MCP errors, or when the user mentions Jira, Confluence, Atlassian, or MCP.
---

# Jira, Confluence, and MCP workflow

## When

- Creating or updating **Jira** issues / **Confluence** pages via **MCP** (Atlassian integration).
- **Permissions** fail (create page, create issue)—you need a fallback path.

## Outcomes

- Content is captured **in-repo or in drafts first**; publish when API or role access is fixed.
- **Instances** are not confused: different Atlassian sites may use different **tokens**, **spaces**, and **projects**.

## Practices

1. **Confirm instance** — Know whether you are targeting Team One, corporate Jira, or another site; do not mix credentials or project keys.
2. **Before batch creation** — Confirm **project key** and **issue type** from the target board.
3. **Links** — Use Jira’s expected **link types** (e.g. relates, parent) per project conventions.
4. **MCP unavailable or forbidden** — Keep markdown in `drafts/` or the repo; paste into Jira/Confluence manually when access returns.

## Fallback order

1. Try MCP (create/update page or issue).
2. **If blocked:** save structured markdown locally; note blocker (permission, wrong instance, wrong project).
3. **Manual copy** — Use the same structure you would have sent via API.

## See also

- **[po-coverage](../po-coverage/SKILL.md)** — Where Confluence pages might live (Team One vs other spaces).
- **[po-spec-drafts](../po-spec-drafts/SKILL.md)** — Source of truth when Jira is not writable yet.
