# po-skills

Distilled **Agent Skills** for Product Owner workflows (Toyota / Lexus SIT, SST, and related). Each skill is a folder with `SKILL.md` (YAML frontmatter + body). Names use a **`po-` prefix** (e.g. `po-ticketing`, `po-coverage`).

The same `SKILL.md` layout works in **Cursor**, **Claude Code**, **Windsurf**, and **Kiro** (`.kiro/skills`) when installed at each tool’s skills path (see below). **GitHub Copilot** in VS Code uses a single instruction file instead—see [integrations/github-copilot.md](integrations/github-copilot.md).

**Source:** Derived from the `skills/` guides in the **po-templates** repository (copy + distill; no live submodule to po-templates).

## Use in another project

### Recommended: one submodule, multiple symlinks

Add **po-skills** once (e.g. as a submodule at `vendor/po-skills`), then point every tool’s skills directory at that tree so content stays identical and updates stay in one place.

| Tool | Path | Notes |
|------|------|--------|
| **Cursor** | `.cursor/skills` | Project skills |
| **Claude Code** | `.claude/skills` | Same `SKILL.md` layout |
| **Windsurf** | `.windsurf/skills` | Cascade workspace skills |
| **Kiro** | `.kiro/skills` | Workspace skills; use `skill://.kiro/skills/**/SKILL.md` in agent `resources` ([Kiro docs](https://kiro.dev/docs/cli/custom-agents/configuration-reference)) |
| **(optional)** | `.agents/skills` | Also scanned by Windsurf for cross-agent compatibility |

**Helper script** (run from the **consuming** repo root after the submodule exists):

```bash
bash vendor/po-skills/scripts/link-po-skills.sh
# Optional: also link .agents/skills
INCLUDE_AGENTS=1 bash vendor/po-skills/scripts/link-po-skills.sh
```

Defaults: repo root = current directory, po-skills at `vendor/po-skills`. Override with:

```bash
bash vendor/po-skills/scripts/link-po-skills.sh /path/to/your-project vendor/po-skills
```

Symlinks use **absolute** paths so they resolve regardless of current working directory.

**Windows:** If symlinks are blocked, use an elevated shell, enable Developer Mode, or create **directory junctions** (`mklink /J`) instead—or copy `vendor/po-skills` into each tool path (higher maintenance).

### Cursor only: submodule at `.cursor/skills`

Replace `<URL>` with your remote for this repository.

```bash
cd /path/to/your-project
git submodule add <URL> .cursor/skills
git submodule update --init --recursive
```

Paths look like `.cursor/skills/po-ticketing/SKILL.md`.

### Cursor: submodule alongside existing skills

If you already have `.cursor/skills` entries you want to keep:

```bash
git submodule add <URL> .cursor/skills-po
# Symlink or copy only the po-* folders into .cursor/skills/
```

Because every skill here is **`po-*`**, name collisions with non-prefixed skills are unlikely.

### VS Code and GitHub Copilot

Copilot does **not** load per-folder `SKILL.md` trees. Use a **single** `.github/copilot-instructions.md` (or your team’s chosen instruction file) and merge in the snippet from **[integrations/github-copilot.md](integrations/github-copilot.md)** so Copilot knows to read `vendor/po-skills/.../SKILL.md` when relevant.

### Kiro

[Kiro](https://kiro.dev/docs/cli/custom-agents/configuration-reference) loads **skills** from **`.kiro/skills/<skill-name>/SKILL.md`** with the same YAML `name` / `description` pattern as this repo. After running **`link-po-skills.sh`**, `vendor/po-skills` is linked at `.kiro/skills`, so po-skills is a **drop-in** for Kiro’s skill layout.

**Custom agents** (JSON under **`.kiro/agents/`**) are separate: they declare `tools`, `model`, `prompt`, and **`resources`** such as `"skill://.kiro/skills/**/SKILL.md"` so the agent can use these skills progressively. Copy **[integrations/kiro-agent-po.example.json](integrations/kiro-agent-po.example.json)** into `.kiro/agents/po-workflows.json` (or create via `kiro-cli agent create --manual`) and adjust `model`, `tools`, and MCP for your org.

### CI and fresh clones

Ensure CI checks out submodules, for example:

```yaml
# GitHub Actions example
- uses: actions/checkout@v4
  with:
    submodules: true
```

Or run `git submodule update --init --recursive` after clone. If you use symlinks, ensure the job that needs skills runs on a checkout that includes them.

### Versioning

Submodules pin a **commit**. To record upgrades, tag this repo (`v1.0.0`) and bump the submodule pointer in consuming projects when you intentionally adopt a new snapshot.

## Contributing (in this repo)

This repository’s **root** is the skill folders (no `.cursor/` wrapper). To load skills locally:

**Cursor / Claude Code / Windsurf / Kiro:** from the repo root, either run:

```bash
bash scripts/link-po-skills.sh . .
```

(po-skills path = current directory; links `.cursor/skills`, `.claude/skills`, `.windsurf/skills`, `.kiro/skills`, and optionally `.agents/skills` with `INCLUDE_AGENTS=1`)

Or symlink manually:

```bash
mkdir -p .cursor .claude .windsurf .kiro
ln -sfn "$(pwd)" .cursor/skills
ln -sfn "$(pwd)" .claude/skills
ln -sfn "$(pwd)" .windsurf/skills
ln -sfn "$(pwd)" .kiro/skills
```

## Skills

| Folder | Topic |
|--------|--------|
| `po-activities-index` | Routing table for all `po-*` skills |
| `po-ticketing` | Tickets, DoR / DoD |
| `po-clarity-framing` | 3-Line Clarity Block |
| `po-ticket-splits` | XD / VD / BE / UI / CA splits |
| `po-vision-strategy-metrics` | Vision, strategy, metrics |
| `po-metrics-leading-lagging` | Leading vs lagging reference |
| `po-product-authority` | N8LP-style authority and OKRs |
| `po-backlog-refinement` | Refinement agendas |
| `po-coverage` | PO coverage maps |
| `po-competitor-research` | Competitor research framework |
| `po-spec-drafts` | Working drafts and specs |
| `po-jira-confluence-mcp` | Jira / Confluence / MCP |
| `po-session-hygiene` | `tasks/todo.md`, `tasks/lessons.md` |

## Tool notes

- Vendor docs change over time; confirm paths for your **Cursor / Claude Code / Windsurf / Kiro** versions if something does not load.
- Some tools impose a **maximum length** on YAML `description`. If a skill misbehaves in one tool, shorten the `description` in that skill’s `SKILL.md` and test again.

## Maintenance

When **po-templates** `skills/*.md` changes, review the corresponding `po-*` skill here and update the distilled content. There is no automatic sync.
