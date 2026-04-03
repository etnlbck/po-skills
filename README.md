# po-skills

Distilled **Cursor Agent Skills** for Product Owner workflows (Toyota / Lexus SIT, SST, and related). Each skill is a folder with `SKILL.md` (YAML frontmatter + body). Names use a **`po-` prefix** (e.g. `po-ticketing`, `po-coverage`).

**Source:** Derived from the `skills/` guides in the **po-templates** repository (copy + distill; no live submodule to po-templates).

## Use in another project

Cursor loads **project** skills from `.cursor/skills/<skill-name>/SKILL.md`.

### Option A: Submodule as `.cursor/skills` (only this repo’s skills)

Replace `<URL>` with your remote for this repository.

```bash
cd /path/to/your-project
git submodule add <URL> .cursor/skills
git submodule update --init --recursive
```

After checkout, paths look like `.cursor/skills/po-ticketing/SKILL.md`.

### Option B: Submodule next to existing skills

If you already have `.cursor/skills` entries you want to keep:

```bash
git submodule add <URL> .cursor/skills-po
# Copy or symlink only the po-* folders into .cursor/skills/
```

Because every skill here is **`po-*`**, name collisions with non-prefixed skills are unlikely.

### CI and fresh clones

Ensure CI checks out submodules, for example:

```yaml
# GitHub Actions example
- uses: actions/checkout@v4
  with:
    submodules: true
```

Or run `git submodule update --init --recursive` after clone.

### Versioning

Submodules pin a **commit**. To record upgrades, tag this repo (`v1.0.0`) and bump the submodule pointer in consuming projects when you intentionally adopt a new snapshot.

## Contributing (in this repo)

Cursor discovers project skills under **`<workspace>/.cursor/skills`**. This repository’s **root** is the skill folders themselves (no `.cursor` wrapper). To have Cursor load these skills while editing **po-skills** locally, from the repo root:

```bash
mkdir -p .cursor
ln -sf .. .cursor/skills
```

(Or clone this repo directly into `.cursor/skills` of a scratch project.)

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

## Maintenance

When **po-templates** `skills/*.md` changes, review the corresponding `po-*` skill here and update the distilled content. There is no automatic sync.
