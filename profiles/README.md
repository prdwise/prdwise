# Profiles

Project type profiles that customize task categories, PRD sections, and task fields.

## Available Profiles

| Profile | Use Case |
|---------|----------|
| `technical` | Software, APIs, infrastructure, code projects |
| `writing` | Articles, content, documentation, editorial |
| `business` | Operations, marketing, sales, processes |

## Files Per Profile

| File | Purpose |
|------|---------|
| `next-ids.md` | Category definitions and starting IDs |
| `prd-sections.md` | Additional PRD template sections |
| `task-fields.md` | Task detail fields and done criteria |
| `index-sections.md` | Section headers for tasks/index.md |

## How Profiles Work

1. `setup.sh` asks which profile to use
2. Copies profile's `next-ids.md` to `tasks/next-ids.md`
3. Uses profile's `index-sections.md` for `tasks/index.md`
4. Sets `[PROFILE]` in agent instructions to reference profile-specific files

Agents read `prd-sections.md` and `task-fields.md` when creating PRDs and tasks.
