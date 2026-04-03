# GitHub Copilot (VS Code) — snippet for `.github/copilot-instructions.md`

GitHub Copilot in VS Code reads **repository** instructions from a **single file** (commonly [`.github/copilot-instructions.md`](https://code.visualstudio.com/docs/copilot/customization/custom-instructions)), not a tree of `SKILL.md` folders. Copy the block below into that file (or merge with your existing instructions).

**Prerequisite:** Add **po-skills** as a submodule or folder in your project, e.g. `vendor/po-skills`, so paths resolve.

---

```markdown
## PO workflows (po-skills)

This repo vendors **po-skills**: Product Owner skills as markdown under `vendor/po-skills/<skill-name>/SKILL.md`. Each file has YAML frontmatter (`name`, `description`) and body instructions.

- For a **routing table** of all topics, open `vendor/po-skills/po-activities-index/SKILL.md` first.
- When the user’s task matches a skill’s **description** (tickets, Jira, DoR/DoD, clarity framing, vision/metrics, competitor research, Confluence/MCP, session hygiene, etc.), **read** the matching `vendor/po-skills/<skill-name>/SKILL.md` and follow it. Skill folder names use a `po-` prefix (e.g. `po-ticketing`, `po-clarity-framing`).
- Do not invent Lexus/Toyota-specific process if the skill file does not apply; use only what fits the request.

Paths assume the submodule lives at `vendor/po-skills`. If your team uses a different path, adjust accordingly.
```

---

To use **native** multi-file skills in Cursor, Claude Code, or Windsurf, symlink that same directory to each tool’s skills path (see [README.md](../README.md) — *Recommended: one submodule, multiple symlinks*).
