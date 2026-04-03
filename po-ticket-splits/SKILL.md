---
name: po-ticket-splits
description: >-
  Splits one feature or epic into parallel XD, VD, BE, UI, and CA tickets with a shared context block and consistent Jira titles. Use when multiple disciplines need separate trackable issues, multi-track delivery, or the user mentions ticket splits, discipline-specific work, or parent/child tickets.
---

# Multi-discipline ticket splits

## When

- One feature or epic needs **parallel work** by XD, VD, BE, UI, CA (or a subset).
- You want **separate trackable issues** with consistent titles and shared context.

## Outcomes

- Each discipline has its own ticket (or agreed exceptions) with a **shared summary block** and clear handoffs.

## Pattern

**Parent ticket** holds overall scope and links. **Child tickets** use:

- **Title pattern:** `[PARENT-KEY] {Discipline} – {Feature name}`  
  Disciplines: **XD**, **VD**, **BE**, **UI**, **CA** (Content & copy).

Each child description includes a **3-Line Clarity Block** tailored to that discipline:

| Discipline | User problem focuses on… | Desired outcome focuses on… |
|------------|---------------------------|-----------------------------|
| **XD** | Journey/flow uncertainty, missing steps | Flows defined; XD signed off before VD/UI |
| **VD** | Visual hierarchy, consistency, look/feel | Pixel-ready specs / design system usage for UI |
| **BE** | Data/actions unavailable, reliability | Stable APIs/contracts; NFRs met for integration |
| **UI** | Interface gaps, unclear state | Feature in app per XD/VD; wired to BE; accessible |
| **CA** | Copy, labels, messaging confusion | Final user-facing copy for UI implementation |

**Constraints** in each block should cite scope, timeline alignment with the parent, and quality bar (e.g. accessibility, security).

## See also

- **[po-ticketing](../po-ticketing/SKILL.md)** — Base templates per ticket type.
- **[po-clarity-framing](../po-clarity-framing/SKILL.md)** — Generic 3-Line Clarity Block structure.
