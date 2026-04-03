---
name: po-session-hygiene
description: >-
  Maintains session planning and learning loops via tasks/todo.md and tasks/lessons.md (or equivalents) for non-trivial work. Use when starting or closing a task, capturing corrections, or when the user mentions todo lists, lessons learned, or development-framework-style workflow.
---

# Session hygiene (tasks and lessons)

## When

- Starting or closing **non-trivial** work in the project (per development framework or team norms).
- Capturing **corrections** so the same mistake is not repeated.

## Outcomes

- **Plan** and **checklist** in `tasks/todo.md`; **patterns** in `tasks/lessons.md` after feedback (or your team’s equivalent paths).

## Conventions

### `tasks/todo.md` (or equivalent)

- Plan with **checkable** items before substantial implementation.
- Update **progress** as steps complete.
- Add a **short review** when done (what shipped, what to verify).

### `tasks/lessons.md` (or equivalent)

- After a **correction** or surprise, add one line: **symptom**, **root cause**, **rule** to avoid next time.
- **Review** relevant lessons at the start of a new session.

If the project does not use `tasks/` yet, create these files at the **repository root** or the path your team’s `.cursor/rules` or `AGENTS.md` specifies.

## See also

- Project **`.cursor/rules`** or **`AGENTS.md`** — Full workflow expectations when present.
- **[po-ticketing](../po-ticketing/SKILL.md)** — Turning plans into tickets.
