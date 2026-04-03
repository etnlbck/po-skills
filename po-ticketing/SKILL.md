---
name: po-ticketing
description: >-
  Guides Jira (or similar) ticket writing with Definition of Ready before dev and Definition of Done before close for UI, BE, QA, UX, service integration, and spikes. Use when creating or refining work items, DoR/DoD, Lexus-style acceptance criteria, or when the user mentions tickets, stories, DoR, DoD, or Jira structure.
---

# Ticket writing and Definition of Ready / Done

## When

- Creating or refining **Jira** (or similar) work items for UI, BE, QA, UX, service integration, or **spikes**.
- Ensuring tickets meet **DoR** before dev and **DoD** before close.

## Outcomes

- Tickets have a clear user story, testable acceptance criteria, dependencies called out, and type-appropriate **Definition of Done**.
- Reviewers and AI can validate completeness using the same checklist.

## DoR structure (distilled)

Use the template pattern that matches the work type. Every ticket should cover:

1. **User story** — “As a {user type}, I want {action/feature}, so that {value/benefit}.”
2. **What do we need?** — Specific requirements and capabilities.
3. **Why do we need it?** — Business value, user need, expected outcome.
4. **Acceptance criteria** — Numbered (AC01, AC02, …), testable, preferably Given/When/Then; happy path, edge cases, errors.
5. **Dependencies / blockers** — Internal and external; what must clear first.
6. **Definition of Done** — Type-specific checklist before close (UI, BE, QA, UX, service integration, or spike as applicable).
7. **Demo plan** — How completion will be shown.
8. **Accepting officer** — Who validates.

### Ticket types (pick one pattern)

- **UI** — Frontend/app work, wiring to APIs and designs.
- **BE** — APIs, services, data, integrations.
- **QA** — Test planning, execution, sign-off.
- **UX** — Research, flows, design discovery (as distinct from VD/UI implementation tickets).
- **Service integration** — Sequential dependencies (e.g. backend before frontend), multi-service chains.
- **Spike** — Time-boxed investigation, research, documentation; exit criteria and findings.

Use a **two-stage** elicitation when helpful: (1) problem — what, why, who benefits; (2) solution — how to test, what can go wrong, dependencies.

## See also

- **[po-clarity-framing](../po-clarity-framing/SKILL.md)** — User problem, outcome, and constraints before long AC lists.
- **[po-ticket-splits](../po-ticket-splits/SKILL.md)** — When one feature becomes multiple role-specific tickets.
